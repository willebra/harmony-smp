package eu.europa.ec.edelivery.smp.services.ui;


import eu.europa.ec.edelivery.smp.data.model.DBCertificate;
import eu.europa.ec.edelivery.smp.data.model.DBUser;
import eu.europa.ec.edelivery.smp.data.ui.CertificateRO;
import eu.europa.ec.edelivery.smp.data.ui.ServiceResult;
import eu.europa.ec.edelivery.smp.data.ui.UserRO;
import eu.europa.ec.edelivery.smp.data.ui.enums.EntityROStatus;
import eu.europa.ec.edelivery.smp.services.AbstractServiceIntegrationTest;
import eu.europa.ec.edelivery.smp.testutil.TestDBUtils;
import org.apache.commons.io.IOUtils;
import org.hibernate.type.BigIntegerType;
import org.hibernate.type.descriptor.java.UUIDTypeDescriptor;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.ExpectedException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.test.context.ContextConfiguration;

import java.io.IOException;
import java.math.BigInteger;
import java.security.cert.CertificateException;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.time.temporal.TemporalUnit;
import java.util.*;

import static org.junit.Assert.*;


/**
 *  Purpose of class is to test ServiceGroupService base methods
 *
 * @author Joze Rihtarsic
 * @since 4.1
 */
@ContextConfiguration(classes= UIUserService.class)
public class UIUserServiceIntegrationTest extends AbstractServiceIntegrationTest {
    @Rule
    public ExpectedException expectedExeption = ExpectedException.none();

    @Autowired
    protected UIUserService testInstance;

    protected void insertDataObjects(int size) {
        for (int i = 0; i < size; i++) {
            DBUser d = TestDBUtils.createDBUserByUsername("user" + i);
            d.setPassword(BCrypt.hashpw(d.getPassword(), BCrypt.gensalt()));
            userDao.persistFlushDetach(d);
        }
    }

    @Test
    public void testGetTableListEmpty() {

        // given

        //when
        ServiceResult<UserRO> res = testInstance.getTableList(-1, -1, null, null, null);
        // then
        assertNotNull(res);
        assertEquals(0, res.getCount().intValue());
        assertEquals(0, res.getPage().intValue());
        assertEquals(-1, res.getPageSize().intValue());
        assertEquals(0, res.getServiceEntities().size());
        assertNull(res.getFilter());
    }

    @Test
    public void testGetTableList15() {

        // given
        insertDataObjects(15);
        //when
        ServiceResult<UserRO> res = testInstance.getTableList(-1, -1, null, null, null);

        // then
        assertNotNull(res);
        assertEquals(15, res.getCount().intValue());
        assertEquals(0, res.getPage().intValue());
        assertEquals(-1, res.getPageSize().intValue());
        assertEquals(15, res.getServiceEntities().size());
        assertNull(res.getFilter());

        // all table properties should not be null
        assertNotNull(res);
        assertNotNull(res.getServiceEntities().get(0).getId());
        assertNotNull(res.getServiceEntities().get(0).getUsername());
        assertNotNull(res.getServiceEntities().get(0).getEmail());
        assertNull(res.getServiceEntities().get(0).getPassword()); // Service list must not return passwords
        assertNotNull(res.getServiceEntities().get(0).getPasswordChanged());
        assertNotNull(res.getServiceEntities().get(0).getRole());
    }

    @Test
    public void testUpdateUserPassword() {
        // given
        insertDataObjects(1);
        String newPassword = "TestPasswd!@#" + Calendar.getInstance().getTime();
        ServiceResult<UserRO> urTest  =  testInstance.getTableList(-1,-1,null, null, null);
        assertEquals(1, urTest.getServiceEntities().size());

        UserRO usr = urTest.getServiceEntities().get(0);

        //when
        usr.setPassword(newPassword);
        usr.setStatus(EntityROStatus.UPDATED.getStatusNumber());
        testInstance.updateUserList(Collections.singletonList(usr));

        // then
        DBUser dbuser = userDao.find(usr.getId());
        assertTrue(BCrypt.checkpw(newPassword, dbuser.getPassword()));
    }


    @Test
    public void testAddUserWithoutCertificate() {
        // given
        insertDataObjects(15);
        long  iCnt = userDao.getDataListCount(null);

        UserRO user = new UserRO();
        user.setPassword(UUID.randomUUID().toString());
        user.setUsername(UUID.randomUUID().toString());
        user.setEmail(UUID.randomUUID().toString());
        user.setRole("ROLE");
        user.setStatus(EntityROStatus.NEW.getStatusNumber());

        //when
        testInstance.updateUserList(Collections.singletonList(user));
        // then
        long  iCntNew  = userDao.getDataListCount(null);
        assertEquals(iCnt+1, iCntNew);
        Optional<DBUser> oUsr =  userDao.findUserByUsername(user.getUsername());
        assertTrue(oUsr.isPresent());
        assertEquals(user.getPassword(), oUsr.get().getPassword());
        assertEquals(user.getUsername(), oUsr.get().getUsername());
        assertEquals(user.getRole(), oUsr.get().getRole());
        assertEquals(user.getEmail(), oUsr.get().getEmail());
        assertNull(oUsr.get().getCertificate());
    }

    @Test
    public void testAddUserWithCertificate() {
        // given
        insertDataObjects(15);
        long  iCnt = userDao.getDataListCount(null);

        LocalDateTime now = LocalDateTime.now().truncatedTo(ChronoUnit.MINUTES);
        LocalDateTime future =now.plusYears(1);

        UserRO user = new UserRO();
        user.setPassword(UUID.randomUUID().toString());
        user.setUsername(UUID.randomUUID().toString());
        user.setEmail(UUID.randomUUID().toString());
        user.setRole("ROLE");
        CertificateRO cert = new CertificateRO();
        cert.setSubject(UUID.randomUUID().toString());
        cert.setIssuer(UUID.randomUUID().toString());
        cert.setSerialNumber(UUID.randomUUID().toString());
        cert.setCertificateId(UUID.randomUUID().toString());
        cert.setValidFrom(now);
        cert.setValidTo(future);
        user.setCertificateData(cert);

        user.setStatus(EntityROStatus.NEW.getStatusNumber());


        //when
        testInstance.updateUserList(Collections.singletonList(user));
        // then
        long  iCntNew  = userDao.getDataListCount(null);
        assertEquals(iCnt+1, iCntNew);
        Optional<DBUser> oUsr =  userDao.findUserByUsername(user.getUsername());
        assertTrue(oUsr.isPresent());
        assertEquals(user.getPassword(), oUsr.get().getPassword());
        assertEquals(user.getUsername(), oUsr.get().getUsername());
        assertEquals(user.getRole(), oUsr.get().getRole());
        assertEquals(user.getEmail(), oUsr.get().getEmail());
        assertNotNull(oUsr.get().getCertificate());
        assertEquals(cert.getCertificateId(), cert.getCertificateId());
        assertEquals(cert.getSubject(), cert.getSubject());
        assertEquals(cert.getIssuer(), cert.getIssuer());
        assertEquals(cert.getSerialNumber(), cert.getSerialNumber());
        assertEquals(now, cert.getValidFrom());
        assertEquals(future, cert.getValidTo());
    }


    @Test
    public void testUserRemoveCertificate() {
        // given


        LocalDateTime now = LocalDateTime.now().truncatedTo(ChronoUnit.MINUTES);
        LocalDateTime future =now.plusYears(1);

        DBUser user = new DBUser();
        user.setPassword(UUID.randomUUID().toString());
        user.setUsername(UUID.randomUUID().toString());
        user.setEmail(UUID.randomUUID().toString());
        user.setRole("ROLE");
        DBCertificate cert = new DBCertificate();
        cert.setSubject(UUID.randomUUID().toString());
        cert.setIssuer(UUID.randomUUID().toString());
        cert.setSerialNumber(UUID.randomUUID().toString());
        cert.setCertificateId(UUID.randomUUID().toString());
        cert.setValidFrom(now);
        cert.setValidTo(future);
        user.setCertificate(cert);
        userDao.persistFlushDetach(user);
        ServiceResult<UserRO> urTest  =  testInstance.getTableList(-1,-1,null, null, null);
        assertEquals(1, urTest.getServiceEntities().size());
        UserRO userRO = urTest.getServiceEntities().get(0);
        assertNotNull(userRO.getCertificateData());

        //when
        userRO.setCertificateData(null);
        userRO.setStatus(EntityROStatus.UPDATED.getStatusNumber());

        testInstance.updateUserList(Collections.singletonList(userRO));
        // then
        ServiceResult<UserRO> res  =  testInstance.getTableList(-1,-1,null, null, null);
        assertEquals(1, urTest.getServiceEntities().size());
        UserRO userResRO = urTest.getServiceEntities().get(0);
        assertNull(userResRO.getCertificateData());

    }

    @Test
    public void testDeleteUser() {
        // given
        insertDataObjects(15);
        ServiceResult<UserRO> urTest  =  testInstance.getTableList(-1,-1,null, null, null);
        assertEquals(15, urTest.getServiceEntities().size());

        UserRO user = urTest.getServiceEntities().get(0);
        user.setStatus(EntityROStatus.REMOVE.getStatusNumber());

        //when
        testInstance.updateUserList(Collections.singletonList(user));

        // then
        long  iCntNew  = userDao.getDataListCount(null);
        Optional<DBUser> rmUsr = userDao.findUserByUsername(user.getUsername());

        assertEquals( urTest.getServiceEntities().size()-1, iCntNew);
        assertFalse(rmUsr.isPresent());

    }

    @Test
    public void testGetCertificateData() throws IOException, CertificateException {
        // given
        byte[] buff = IOUtils.toByteArray(UIUserServiceIntegrationTest.class.getResourceAsStream("/keystores/SMPtest.crt"));
        // when
        CertificateRO cer = testInstance.getCertificateData(buff);
        //then
        assertEquals("CN=SMP test,O=DIGIT,C=BE:0000000000000003", cer.getCertificateId());
        assertEquals("CN=Intermediate CA, O=DIGIT, C=BE", cer.getIssuer());
        assertEquals("EMAILADDRESS=smp@test.com, CN=SMP test, O=DIGIT, C=BE", cer.getSubject());
        assertEquals("3", cer.getSerialNumber());
        assertNotNull(cer.getValidFrom());
        assertNotNull(cer.getValidTo());
        assertTrue(cer.getValidFrom().isBefore(cer.getValidTo()));


    }





}
