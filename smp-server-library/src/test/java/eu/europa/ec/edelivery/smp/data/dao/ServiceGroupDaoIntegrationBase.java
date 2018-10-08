package eu.europa.ec.edelivery.smp.data.dao;

import eu.europa.ec.edelivery.smp.config.H2JPATestConfiguration;
import eu.europa.ec.edelivery.smp.data.model.DBDomain;
import eu.europa.ec.edelivery.smp.data.model.DBServiceGroup;
import eu.europa.ec.edelivery.smp.data.model.DBServiceMetadata;
import eu.europa.ec.edelivery.smp.data.model.DBUser;
import eu.europa.ec.edelivery.smp.testutil.TestConstants;
import eu.europa.ec.edelivery.smp.testutil.TestDBUtils;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.ExpectedException;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.jdbc.Sql;
import org.springframework.test.context.jdbc.SqlConfig;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.transaction.Transactional;
import java.util.Optional;
import java.util.UUID;

import static eu.europa.ec.edelivery.smp.testutil.TestConstants.*;
import static org.junit.Assert.*;


/**
 * Purpose of class is to test all resource methods with database.
 *
 * @author Joze Rihtarsic
 * @since 4.1
 */
@ContextConfiguration(classes = {H2JPATestConfiguration.class, ServiceGroupDao.class, DomainDao.class, UserDao.class})
@Sql(scripts = "classpath:cleanup-database.sql", executionPhase = Sql.ExecutionPhase.BEFORE_TEST_METHOD, config = @SqlConfig
        (transactionMode = SqlConfig.TransactionMode.ISOLATED,
                transactionManager = "transactionManager",
                dataSource = "h2DataSource"))
public class ServiceGroupDaoIntegrationBase {
    @Autowired
    ServiceGroupDao testInstance;

    @Autowired
    DomainDao domainDao;

    @Autowired
    UserDao userDao;

    @Rule
    public ExpectedException expectedExeption = ExpectedException.none();

    @Before
    public void prepareDatabase() {
        DBDomain d = new DBDomain();
        d.setDomainCode(TEST_DOMAIN_CODE_1);
        d.setSmlSubdomain(TEST_SML_SUBDOMAIN_CODE_1);
        domainDao.persistFlushDetach(d);

        DBUser u1 = TestDBUtils.createDBUserByUsername(USERNAME_1);
        DBUser u2 = TestDBUtils.createDBUserByCertificate(USER_CERT_2);
        DBUser u3 = TestDBUtils.createDBUserByUsername(USERNAME_3);
        userDao.persistFlushDetach(u1);
        userDao.persistFlushDetach(u2);
        userDao.persistFlushDetach(u3);
    }

   @Transactional
   public DBServiceGroup createAndSaveNewServiceGroup(){

       DBDomain d = domainDao.getDomainByCode(TEST_DOMAIN_CODE_1).get();
       DBServiceGroup sg = TestDBUtils.createDBServiceGroup();
       sg.addDomain(d);
       testInstance.persistFlushDetach(sg);
       return sg;
   }

    @Transactional
    public DBServiceGroup createAndSaveNewServiceGroupWithMetadata(){

        DBDomain d = domainDao.getDomainByCode(TEST_DOMAIN_CODE_1).get();
        DBServiceGroup sg = TestDBUtils.createDBServiceGroup();
        sg.addDomain(d);
        DBServiceMetadata md = TestDBUtils.createDBServiceMetadata(TEST_DOC_ID_1, TEST_DOC_SCHEMA_1);
        sg.getServiceGroupDomains().get(0).addServiceMetadata(md);
        testInstance.persistFlushDetach(sg);
        return sg;
    }

    @Transactional
    public DBServiceGroup createAndSaveNewServiceGroupWithUsers(){
        DBUser u1 = userDao.findUserByUsername(USERNAME_1).get();
        DBUser u2 = userDao.findUserByCertificateId(USER_CERT_2).get();

        DBDomain d = domainDao.getDomainByCode(TEST_DOMAIN_CODE_1).get();
        DBServiceGroup sg = TestDBUtils.createDBServiceGroup();
        sg.addDomain(d);
        sg.getUsers().add(u1);
        sg.getUsers().add(u2);
        testInstance.update(sg);
        return sg;
    }

    @Transactional
    public void update(DBServiceGroup sg){
        testInstance.update(sg);
    }


}