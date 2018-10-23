package eu.europa.ec.edelivery.smp.services.ui;

import eu.europa.ec.edelivery.security.PreAuthenticatedCertificatePrincipal;
import eu.europa.ec.edelivery.smp.BCryptPasswordHash;
import eu.europa.ec.edelivery.smp.data.dao.BaseDao;
import eu.europa.ec.edelivery.smp.data.dao.UserDao;
import eu.europa.ec.edelivery.smp.data.model.DBCertificate;
import eu.europa.ec.edelivery.smp.data.model.DBUser;
import eu.europa.ec.edelivery.smp.data.ui.CertificateRO;
import eu.europa.ec.edelivery.smp.data.ui.ServiceResult;
import eu.europa.ec.edelivery.smp.data.ui.UserRO;
import eu.europa.ec.edelivery.smp.data.ui.enums.EntityROStatus;
import eu.europa.ec.edelivery.smp.logging.SMPLogger;
import eu.europa.ec.edelivery.smp.logging.SMPLoggerFactory;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.InvocationTargetException;
import java.math.BigInteger;
import java.security.cert.CertificateException;
import java.security.cert.CertificateFactory;
import java.security.cert.X509Certificate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Base64;
import java.util.List;

@Service
public class UIUserService extends UIServiceBase<DBUser, UserRO> {

    private static final SMPLogger LOG = SMPLoggerFactory.getLogger(UIUserService.class);

    private static final byte[] S_PEM_START_TAG= "-----BEGIN CERTIFICATE-----\n".getBytes();
    private static final byte[] S_PEM_END_TAG= "\n-----END CERTIFICATE-----".getBytes();

    @Autowired
    UserDao userDao;

    @Override
    protected BaseDao<DBUser> getDatabaseDao() {
        return userDao;
    }

    /**
     * Method returns user resource object list for  UI list page.
     *
     * @param page
     * @param pageSize
     * @param sortField
     * @param sortOrder
     * @param filter
     * @return ServiceResult wiht list
     */
    @Transactional
    public ServiceResult<UserRO> getTableList(int page, int pageSize,
                                              String sortField,
                                              String sortOrder, Object filter) {

        ServiceResult<UserRO> resUsers = super.getTableList(page, pageSize, sortField, sortOrder, filter);
        resUsers.getServiceEntities().forEach(usr -> usr.setPassword(null));
        return resUsers;
    }

    @Transactional
    public void updateUserList(List<UserRO> lst) {
        boolean suc = false;
        for (UserRO userRO : lst) {

            if (userRO.getStatus() == EntityROStatus.NEW.getStatusNumber()) {
                DBUser dbUser = convertFromRo(userRO);
                userDao.persistFlushDetach(dbUser);
            } else if (userRO.getStatus() == EntityROStatus.UPDATED.getStatusNumber()) {
                DBUser dbUser = userDao.find(userRO.getId());
                dbUser.setEmailAddress(userRO.getEmailAddress());
                dbUser.setRole(userRO.getRole());
                dbUser.setActive(userRO.isActive());
                // check for new password
                if (!StringUtils.isBlank(userRO.getPassword())) {
                    if (!StringUtils.isBlank(dbUser.getPassword())) {
                        if (!BCrypt.checkpw(userRO.getPassword(), dbUser.getPassword())) {
                            LOG.debug("User with id {} changed password!", dbUser.getId());

                            dbUser.setPassword(BCryptPasswordHash.hashPassword(userRO.getPassword().trim()));
                            dbUser.setPasswordChanged(LocalDateTime.now());
                        }
                    } else {
                        dbUser.setPassword(BCryptPasswordHash.hashPassword(userRO.getPassword()));
                    }
                }
                // update certificate data
                if (userRO.getCertificateData() == null) {
                    dbUser.setCertificate(null);
                } else {
                    CertificateRO certificateRO = userRO.getCertificateData();
                    DBCertificate dbCertificate = dbUser.getCertificate() != null ? dbUser.getCertificate() : new DBCertificate();
                    dbUser.setCertificate(dbCertificate);
                    dbCertificate.setValidFrom(certificateRO.getValidFrom());
                    dbCertificate.setValidFrom(certificateRO.getValidTo());
                    dbCertificate.setCertificateId(certificateRO.getCertificateId());
                    dbCertificate.setSerialNumber(certificateRO.getSerialNumber());
                    dbCertificate.setSubject(certificateRO.getSubject());
                    dbCertificate.setIssuer(certificateRO.getIssuer());
                }
                dbUser.setLastUpdatedOn(LocalDateTime.now());
                userDao.update(dbUser);
            } else if (userRO.getStatus() == EntityROStatus.REMOVE.getStatusNumber()) {
                userDao.removeById(userRO.getId());
            }
        }
    }

    public CertificateRO getCertificateData(byte[] buff) throws CertificateException, IOException {

        // get pem encoding -
        InputStream isCert = createPEMFormat(buff);

        CertificateFactory fact = CertificateFactory.getInstance("X.509");
        X509Certificate cert = (X509Certificate) fact.generateCertificate(isCert);
        String subject = cert.getSubjectDN().getName();
        String issuer = cert.getIssuerDN().getName();
        String hash = cert.getIssuerDN().getName();
        BigInteger serial = cert.getSerialNumber();
        String certId = getCertificateIdFromCertificate(subject, issuer, serial);
        CertificateRO cro = new CertificateRO();
        cro.setCertificateId(certId);
        cro.setSubject(subject);
        cro.setIssuer(issuer);
        // set serial as HEX
        cro.setSerialNumber(serial.toString(16));
        cro.setValidFrom(LocalDateTime.ofInstant(cert.getNotBefore().toInstant(), ZoneId.systemDefault()));
        cro.setValidTo(LocalDateTime.ofInstant(cert.getNotAfter().toInstant(), ZoneId.systemDefault()));
        cro.setEncodedValue(Base64.getMimeEncoder().encodeToString(cert.getEncoded()));

        return cro;
    }

    public boolean isCertificatePemEncoded(byte[] certData){
        if (certData!=null && certData.length >S_PEM_START_TAG.length){

            for (int i=0; i<certData.length;i++){
                if (certData[i] != S_PEM_START_TAG[i]) {
                    return false;
                }
                return true;
            }
        }
        return false;
    }

    /**
     * Method tests if certificate is in PEM  format. If not it creates pem format else returns original data.
     * @param certData - certificate data
     * @return
     * @throws IOException
     */
    public ByteArrayInputStream  createPEMFormat(byte[] certData) throws IOException {
        ByteArrayInputStream is;
        if (isCertificatePemEncoded(certData)){
            is = new ByteArrayInputStream(certData);
        } else {
            ByteArrayOutputStream bos = new ByteArrayOutputStream();
             bos.write(S_PEM_START_TAG);
             bos.write(Base64.getMimeEncoder().encode(certData));
             bos.write(S_PEM_END_TAG);
            is = new ByteArrayInputStream(bos.toByteArray());
        }
        return is;
    }

    public String getCertificateIdFromCertificate(String subject, String issuer, BigInteger serial) {
        return new PreAuthenticatedCertificatePrincipal(subject, issuer, serial).getName();
    }

    @Override
    public UserRO convertToRo(DBUser d) {
        try {
            UserRO dro = new UserRO();
            BeanUtils.copyProperties(dro, d);

            if (d.getCertificate() != null) {
                CertificateRO certData = new CertificateRO();
                BeanUtils.copyProperties(certData, d.getCertificate());
                dro.setCertificateData(certData);
            }
            return dro;
        } catch (InvocationTargetException | IllegalAccessException e) {
            String msg = "Error occurred while converting to RO Entity for " + UserRO.class.getName();
            LOG.error(msg, e);
            throw new RuntimeException(msg, e);
        }
    }

    @Override
    public DBUser convertFromRo(UserRO d) {
        try {
            DBUser dro = new DBUser();
            BeanUtils.copyProperties(dro, d);
            DBCertificate cert = new DBCertificate();
            if (d.getCertificateData() != null) {
                DBCertificate certData = new DBCertificate();
                BeanUtils.copyProperties(certData, d.getCertificateData());
                dro.setCertificate(cert);
            }

            return dro;
        } catch (InvocationTargetException | IllegalAccessException e) {
            String msg = "Error occurred while converting to RO Entity for " + UserRO.class.getName();
            LOG.error(msg, e);
            throw new RuntimeException(msg, e);
        }
    }

}
