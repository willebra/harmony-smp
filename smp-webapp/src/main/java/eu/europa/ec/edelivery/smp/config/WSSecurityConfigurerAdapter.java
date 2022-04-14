/*
 * Copyright 2017 European Commission | CEF eDelivery
 *
 * Licensed under the EUPL, Version 1.2 or – as soon they will be approved by the European Commission - subsequent versions of the EUPL (the "Licence");
 * You may not use this work except in compliance with the Licence.
 *
 * You may obtain a copy of the Licence attached in file: LICENCE-EUPL-v1.2.pdf
 *
 * Unless required by applicable law or agreed to in writing, software distributed under the Licence is distributed on an "AS IS" basis,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the Licence for the specific language governing permissions and limitations under the Licence.
 */

package eu.europa.ec.edelivery.smp.config;

import eu.europa.ec.edelivery.security.ClientCertAuthenticationFilter;
import eu.europa.ec.edelivery.security.EDeliveryX509AuthenticationFilter;
import eu.europa.ec.edelivery.smp.auth.SMPAuthenticationProvider;
import eu.europa.ec.edelivery.smp.data.ui.auth.SMPAuthority;
import eu.europa.ec.edelivery.smp.error.SMPSecurityExceptionHandler;
import eu.europa.ec.edelivery.smp.services.ConfigurationService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Lazy;
import org.springframework.core.annotation.Order;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.BeanIds;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.annotation.web.configurers.ExceptionHandlingConfigurer;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.web.csrf.CsrfTokenRepository;
import org.springframework.security.web.firewall.DefaultHttpFirewall;
import org.springframework.security.web.firewall.HttpFirewall;
import org.springframework.security.web.util.matcher.AnyRequestMatcher;
import org.springframework.security.web.util.matcher.RequestMatcher;

import static eu.europa.ec.edelivery.smp.config.SMPSecurityConstants.*;


/**
 * SMP Security configuration
 * @author gutowpa
 * @since 3.0
 */
@Order(2)
@EnableWebSecurity
@EnableGlobalMethodSecurity(securedEnabled = true, prePostEnabled = true)
public class WSSecurityConfigurerAdapter extends WebSecurityConfigurerAdapter {
    private static final Logger LOG = LoggerFactory.getLogger(WSSecurityConfigurerAdapter.class);

    SMPAuthenticationProvider smpAuthenticationProvider;
    // Accounts supporting automated application functionalities
    ClientCertAuthenticationFilter clientCertAuthenticationFilter;
    EDeliveryX509AuthenticationFilter x509AuthenticationFilter;
    MDCLogRequestFilter mdcLogRequestFilter;

    CsrfTokenRepository csrfTokenRepository;
    HttpFirewall httpFirewall;
    RequestMatcher csrfURLMatcher;
    ConfigurationService configurationService;

    @Value("${authentication.blueCoat.enabled:false}")
    boolean clientCertEnabled;
    @Value("${encodedSlashesAllowedInUrl:true}")
    boolean encodedSlashesAllowedInUrl;

    @Autowired
    public WSSecurityConfigurerAdapter(SMPAuthenticationProvider smpAuthenticationProvider,
                                       ConfigurationService configurationService,
                                       @Lazy ClientCertAuthenticationFilter clientCertAuthenticationFilter,
                                       @Lazy EDeliveryX509AuthenticationFilter x509AuthenticationFilter,
                                       @Lazy MDCLogRequestFilter mdcLogRequestFilter,
                                       @Lazy CsrfTokenRepository csrfTokenRepository,
                                       @Lazy RequestMatcher csrfURLMatcher,
                                       @Lazy HttpFirewall httpFirewall
    ) {
        super(false);
        this.configurationService = configurationService;
        this.smpAuthenticationProvider = smpAuthenticationProvider;
        this.clientCertAuthenticationFilter = clientCertAuthenticationFilter;
        this.x509AuthenticationFilter = x509AuthenticationFilter;
        this.mdcLogRequestFilter = mdcLogRequestFilter;
        this.csrfTokenRepository = csrfTokenRepository;
        this.csrfURLMatcher = csrfURLMatcher;
        this.httpFirewall = httpFirewall;
    }

    @Override
    protected void configure(HttpSecurity httpSecurity) throws Exception {

        configureSecurityHeaders(httpSecurity);

        ExceptionHandlingConfigurer<HttpSecurity> exceptionHandlingConfigurer = httpSecurity.exceptionHandling();

        SMPSecurityExceptionHandler smpSecurityExceptionHandler = new SMPSecurityExceptionHandler();

        exceptionHandlingConfigurer.authenticationEntryPoint(smpSecurityExceptionHandler);
        httpSecurity = exceptionHandlingConfigurer
                .accessDeniedHandler(smpSecurityExceptionHandler)
                .and()
                .headers().frameOptions().deny()
                .contentTypeOptions().and()
                .xssProtection().xssProtectionEnabled(true).and()
                .and();

        httpSecurity
                .addFilterAfter(mdcLogRequestFilter, EDeliveryX509AuthenticationFilter.class)
                .addFilter(clientCertAuthenticationFilter)
                .addFilter(x509AuthenticationFilter)
                .httpBasic().authenticationEntryPoint(smpSecurityExceptionHandler).and() // username
                .anonymous().authorities(SMPAuthority.S_AUTHORITY_ANONYMOUS.getAuthority()).and()
                .authorizeRequests()
                .antMatchers(HttpMethod.DELETE, SMP_SECURITY_PATH_AUTHENTICATE).permitAll()
                .antMatchers(HttpMethod.POST, SMP_SECURITY_PATH_AUTHENTICATE).permitAll()
                .antMatchers(HttpMethod.GET, SMP_SECURITY_PATH_CAS_AUTHENTICATE).authenticated()
                .and()
                .authorizeRequests()
                .antMatchers(HttpMethod.DELETE).hasAnyAuthority(
                SMPAuthority.S_AUTHORITY_TOKEN_WS_SERVICE_GROUP_ADMIN,
                SMPAuthority.S_AUTHORITY_TOKEN_WS_SMP_ADMIN)
                .antMatchers(HttpMethod.PUT).hasAnyAuthority(
                SMPAuthority.S_AUTHORITY_TOKEN_WS_SERVICE_GROUP_ADMIN,
                SMPAuthority.S_AUTHORITY_TOKEN_WS_SMP_ADMIN)
                .antMatchers(HttpMethod.GET).permitAll().and()
        ;
    }

    protected void configureSecurityHeaders(HttpSecurity httpSecurity) throws Exception {
        // configure session and csrf headers
        httpSecurity
                .csrf().csrfTokenRepository(csrfTokenRepository).requireCsrfProtectionMatcher(csrfURLMatcher).and()
                .sessionManagement()
                .sessionCreationPolicy(SessionCreationPolicy.IF_REQUIRED)
                //on authentication, a new HTTP Session is created, the old one is invalidated and the attributes from the old session are copied over.
                .sessionFixation().migrateSession()
                //In order to force only one  concurrent sessions for the same user,
                .maximumSessions(1).and()
                .and();

        // set HstsMAxAge
        Integer maxAge = configurationService.getHttpHeaderHstsMaxAge();
        if (maxAge == null || maxAge < 0) {
            LOG.info("The httpStrictTransportSecurity (HSTS) policy is set for HTTPS/1Y!");
            httpSecurity = httpSecurity.headers()
                    .httpStrictTransportSecurity()
                    .includeSubDomains(true)
                    .preload(false)
                    .maxAgeInSeconds(31536000).and().and();
        } else if (maxAge == 0) {
            LOG.warn("The httpStrictTransportSecurity (HSTS) policy is disabled!");
            httpSecurity = httpSecurity.headers().httpStrictTransportSecurity().disable().and();
        } else {
            LOG.info("The httpStrictTransportSecurity (HSTS) policy is set to [{}] for http and https!", maxAge);
            httpSecurity = httpSecurity.headers()
                    .httpStrictTransportSecurity()
                    .includeSubDomains(true)
                    .preload(false)
                    .maxAgeInSeconds(maxAge)
                    .requestMatcher(AnyRequestMatcher.INSTANCE).and().and();
        }
/*
        String contentSecurityPolicy = configurationService.getHttpHeaderContentSecurityPolicy();
        if (StringUtils.isNotBlank(contentSecurityPolicy)) {
            httpSecurity = httpSecurity.headers().contentSecurityPolicy(contentSecurityPolicy).and().and();
        }*/
    }

    @Override
    public void configure(WebSecurity web) throws Exception {
        super.configure(web);
        web.httpFirewall(httpFirewall);
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) {
        LOG.info("configureAuthenticationManagerBuilder, set SMP provider ");
        // fallback automation user token authentication
        auth.authenticationProvider(smpAuthenticationProvider);
    }

    @Override
    @Bean(name = {BeanIds.AUTHENTICATION_MANAGER, SMP_AUTHENTICATION_MANAGER_BEAN})
    public AuthenticationManager authenticationManagerBean() throws Exception {
        return super.authenticationManagerBean();
    }

    @Bean
    public HttpFirewall smpHttpFirewall() {
        DefaultHttpFirewall firewall = new DefaultHttpFirewall();
        firewall.setAllowUrlEncodedSlash(encodedSlashesAllowedInUrl);
        return firewall;
    }

    @Bean
    public ClientCertAuthenticationFilter getClientCertAuthenticationFilter(@Qualifier(SMP_AUTHENTICATION_MANAGER_BEAN) AuthenticationManager authenticationManager) {
        ClientCertAuthenticationFilter ClientCertAuthenticationFilter = new ClientCertAuthenticationFilter();
        ClientCertAuthenticationFilter.setAuthenticationManager(authenticationManager);
        ClientCertAuthenticationFilter.setClientCertAuthenticationEnabled(clientCertEnabled);
        return ClientCertAuthenticationFilter;
    }

    @Bean
    public EDeliveryX509AuthenticationFilter getEDeliveryX509AuthenticationFilter(@Qualifier(SMP_AUTHENTICATION_MANAGER_BEAN) AuthenticationManager authenticationManager) {
        EDeliveryX509AuthenticationFilter x509AuthenticationFilter = new EDeliveryX509AuthenticationFilter();
        x509AuthenticationFilter.setAuthenticationManager(authenticationManager);
        return x509AuthenticationFilter;
    }


}
