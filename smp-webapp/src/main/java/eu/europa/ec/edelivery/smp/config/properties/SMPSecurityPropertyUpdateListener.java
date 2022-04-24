package eu.europa.ec.edelivery.smp.config.properties;

import eu.europa.ec.edelivery.smp.config.PropertyUpdateListener;
import eu.europa.ec.edelivery.smp.config.WSSecurityConfigurerAdapter;
import eu.europa.ec.edelivery.smp.data.ui.enums.SMPPropertyEnum;
import eu.europa.ec.edelivery.smp.logging.SMPLogger;
import eu.europa.ec.edelivery.smp.logging.SMPLoggerFactory;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Component;
import org.springframework.web.server.adapter.ForwardedHeaderTransformer;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import static eu.europa.ec.edelivery.smp.data.ui.enums.SMPPropertyEnum.CLIENT_CERT_HEADER_ENABLED;
import static eu.europa.ec.edelivery.smp.data.ui.enums.SMPPropertyEnum.HTTP_FORWARDED_HEADERS_ENABLED;


/**
 * Class update security configuration on property update event
 *
 * @author Joze Rihtarsic
 * @since 4.1
 */
@Component
public class SMPSecurityPropertyUpdateListener implements PropertyUpdateListener {
    private static final SMPLogger LOG = SMPLoggerFactory.getLogger(SMPSecurityPropertyUpdateListener.class);

    final WSSecurityConfigurerAdapter wsSecurityConfigurerAdapter;
    final ForwardedHeaderTransformer forwardedHeaderTransformer;

    public SMPSecurityPropertyUpdateListener(@Lazy WSSecurityConfigurerAdapter wsSecurityConfigurerAdapter,
                                             @Lazy ForwardedHeaderTransformer forwardedHeaderTransformer) {
        this.wsSecurityConfigurerAdapter = wsSecurityConfigurerAdapter;
        this.forwardedHeaderTransformer = forwardedHeaderTransformer;
    }

    @Override
    public void updateProperties(Map<SMPPropertyEnum, Object> properties) {
        setClientCertAuthentication((Boolean) properties.get(CLIENT_CERT_HEADER_ENABLED));
        setForwardHeadersEnabled((Boolean) properties.get(HTTP_FORWARDED_HEADERS_ENABLED));
    }

    @Override
    public List<SMPPropertyEnum> handledProperties() {
        return Arrays.asList(CLIENT_CERT_HEADER_ENABLED, HTTP_FORWARDED_HEADERS_ENABLED);
    }

    public void setClientCertAuthentication(Boolean clientCertEnabled) {
        if (clientCertEnabled == null) {
            LOG.debug("Skip setting null client-cert");
            return;
        }
        LOG.info("Set Client-Cert headers  enabled: [{}]." , clientCertEnabled);
        if (clientCertEnabled) {
            LOG.warn("Set Client-Cert HTTP header enabled: [true]. Do not enable this option when using SMP without reverse-proxy and HTTP header protection!");
        }
        wsSecurityConfigurerAdapter.setClientCertAuthenticationEnabled(clientCertEnabled);
    }

    public void setForwardHeadersEnabled(Boolean forwardHeadersEnabled) {
        if (forwardHeadersEnabled == null) {
            LOG.debug("Skip setting null Forward headers");
            return;
        }

        LOG.info("Set http forward headers  enabled: [{}]." , forwardHeadersEnabled);
        if (forwardHeadersEnabled) {
            LOG.warn("Set http forward headers  enabled:: [true]. Do not enable this option when using SMP without reverse-proxy and HTTP header protection!");
        }
        forwardedHeaderTransformer.setRemoveOnly(!forwardHeadersEnabled);
    }

}
