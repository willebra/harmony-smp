package eu.europa.ec.cipa.smp.server.security;

import eu.europa.ec.cipa.smp.server.services.IBlueCoatCertificateService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.stereotype.Component;

/**
 * Created by feriaad on 17/06/2015.
 */
@Component(value = "customAuthenticationProvider")
public class CustomAuthenticationProvider implements AuthenticationProvider {
    private static final Logger logger = LoggerFactory.getLogger(CertificateAuthenticationFilter.class);

    @Autowired
    private IBlueCoatCertificateService blueCoatCertificateService;

    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
        try {
           if (authentication instanceof BlueCoatClientCertificateAuthentication) {
                logger.debug("Authenticating using the decoded certificate in the http header");
                authentication.setAuthenticated(blueCoatCertificateService.isBlueCoatClientCertificateValid((CertificateDetails) authentication.getCredentials()));
            }
        } catch (final Exception exception) {
            throw new AuthenticationServiceException("Couldn't authenticate the principal " + authentication.getPrincipal(), exception);
        }
        return authentication;
    }

    @Override
    public boolean supports(Class<?> clazz) {
        return BlueCoatClientCertificateAuthentication.class.equals(clazz);
    }
}
