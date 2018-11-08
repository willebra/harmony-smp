package eu.europa.ec.edelivery.smp.conversion;

import eu.europa.ec.edelivery.smp.data.model.DBUser;
import eu.europa.ec.edelivery.smp.data.ui.CertificateRO;
import eu.europa.ec.edelivery.smp.data.ui.UserRO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.ConversionService;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

/**
 * @author Sebastian-Ion TINCU
 */
@Component
public class DBUserToUserROConverter implements Converter<DBUser, UserRO> {

    @Autowired
    private ConversionService conversionService;

    @Override
    public UserRO convert(DBUser source) {
        UserRO target = new UserRO();
        target.setEmailAddress(source.getEmailAddress());
        target.setUsername(source.getUsername());
        target.setRole(source.getRole());
        target.setPassword(source.getPassword());
        target.setPasswordChanged(source.getPasswordChanged());
        target.setActive(source.isActive());
        target.setId(source.getId());
        if (source.getCertificate() != null) {
            CertificateRO certificateRO = conversionService.convert(source.getCertificate(), CertificateRO.class);
            target.setCertificate(certificateRO);
        }
        return target;
    }
}
