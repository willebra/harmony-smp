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

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import eu.europa.ec.edelivery.smp.error.ErrorMappingControllerAdvice;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.context.annotation.Primary;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.json.Jackson2ObjectMapperBuilder;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.PathMatchConfigurer;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.util.List;

import static org.springframework.core.Ordered.HIGHEST_PRECEDENCE;

/**
 * Created by gutowpa on 11/07/2017.
 */
@Configuration
@EnableWebMvc
@ComponentScan(basePackages = {
        "eu.europa.ec.edelivery.smp.controllers",
        "eu.europa.ec.edelivery.smp.validation",
        "eu.europa.ec.edelivery.smp.conversion",
        "eu.europa.ec.edelivery.smp.monitor",
        "eu.europa.ec.edelivery.smp.ui"})
@Import({GlobalMethodSecurityConfig.class, ErrorMappingControllerAdvice.class})
public class SmpWebAppConfig implements WebMvcConfigurer {
/*
    @Override
    public void extendMessageConverters(List<HttpMessageConverter<?>> converters) {
        // There is no clean way of replacing the default Jackson 2 HttpMessageConverter while keeping the other
        // default converters (@EnableWebMvc disables auto-configuration and most of the default converters are
        // not available as Spring beans
        // org.springframework.web.servlet.config.annotation.WebMvcConfigurationSupport.addDefaultHttpMessageConverters)
        converters.removeIf(httpMessageConverter -> httpMessageConverter instanceof MappingJackson2HttpMessageConverter);
        converters.add(jackson2HttpMessageConverter());
    }

    @Bean
    public MappingJackson2HttpMessageConverter jackson2HttpMessageConverter() {
        return new MappingJackson2HttpMessageConverter(objectMapper());
    }

    @Bean
    @Primary
    public ObjectMapper objectMapper() {
        return Jackson2ObjectMapperBuilder.json()
                .featuresToDisable(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS)
                .build();
    }

    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
        registry.addViewController("/").setViewName("/index.html");
        registry.addViewController("/ui/").setViewName("/ui/index.html");
        //Home page used by SMP 2.x and 3.x - needed for backward compatibility in some EC's environments
        registry.addViewController("/web/index.html").setViewName("/index.html");
    }*/

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {

        registry.setOrder(HIGHEST_PRECEDENCE)
                .addResourceHandler("/index.html", "/favicon-16x16.png").addResourceLocations("/static_resources/");

        registry.setOrder(HIGHEST_PRECEDENCE-2)
                .addResourceHandler("/ui/rest/").addResourceLocations("/"); // ui rest resources
        registry.setOrder(HIGHEST_PRECEDENCE-3)
                .addResourceHandler("/ui/**").addResourceLocations("/ui/"); // angular pages
    }

    @Override
    public void configurePathMatch(PathMatchConfigurer configurer) {
        //Default value (true) would break @PathVariable Identifiers containing dot character "."
        configurer.setUseSuffixPatternMatch(false);
    }
}
