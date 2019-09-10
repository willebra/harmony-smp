package eu.europa.ec.edelivery.smp.ui;

import com.fasterxml.jackson.databind.ObjectMapper;
import eu.europa.ec.edelivery.smp.config.PropertiesTestConfig;
import eu.europa.ec.edelivery.smp.config.SmpAppConfig;
import eu.europa.ec.edelivery.smp.config.SmpWebAppConfig;
import eu.europa.ec.edelivery.smp.config.SpringSecurityConfig;
import eu.europa.ec.edelivery.smp.data.ui.CertificateRO;
import eu.europa.ec.edelivery.smp.data.ui.ServiceGroupRO;
import eu.europa.ec.edelivery.smp.data.ui.ServiceResult;
import eu.europa.ec.edelivery.smp.data.ui.UserRO;
import eu.europa.ec.edelivery.smp.testutils.X509CertificateTestUtils;
import org.apache.commons.io.IOUtils;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockServletContext;
import org.springframework.security.test.web.servlet.setup.SecurityMockMvcConfigurers;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.jdbc.Sql;
import org.springframework.test.context.jdbc.SqlConfig;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.RequestPostProcessor;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.WebApplicationContext;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import java.security.cert.X509Certificate;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.httpBasic;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

/**
 * @author Joze Rihtarsic
 * @since 4.1
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {
        PropertiesTestConfig.class,
        SmpAppConfig.class,
        SmpWebAppConfig.class,
        SpringSecurityConfig.class})
@WebAppConfiguration
@Sql("classpath:/cleanup-database.sql")
@Sql("classpath:/webapp_integration_test_data.sql")
@SqlConfig(encoding = "UTF-8")
public class UserResourceTest {

    private static final String PATH="/ui/rest/user";

    @Autowired
    private WebApplicationContext webAppContext;

    private MockMvc mvc;
    private static final RequestPostProcessor ADMIN_CREDENTIALS = httpBasic("smp_admin", "test123");
    private static final RequestPostProcessor SYSTEM_CREDENTIALS = httpBasic("sys_admin", "test123");
    @Before
    public void setup() {
        mvc = MockMvcBuilders.webAppContextSetup(webAppContext)
                .apply(SecurityMockMvcConfigurers.springSecurity())
                .build();

        initServletContext();
    }

    private void initServletContext() {
        MockServletContext sc = new MockServletContext("");
        ServletContextListener listener = new ContextLoaderListener(webAppContext);
        ServletContextEvent event = new ServletContextEvent(sc);
    }

    @Test
    public void getUserList() throws Exception {
        // given when
        MvcResult result = mvc.perform(get(PATH).with(ADMIN_CREDENTIALS)).
                andExpect(status().isOk()).andReturn();

        //them
        ObjectMapper mapper = new ObjectMapper();
        ServiceResult res = mapper.readValue(result.getResponse().getContentAsString(), ServiceResult.class);


        assertNotNull(res);
        assertEquals(10, res.getServiceEntities().size());
        res.getServiceEntities().forEach(sgMap-> {
            UserRO  sgro = mapper.convertValue(sgMap, UserRO.class);
            assertNotNull(sgro.getId());
            assertNotNull(sgro.getUsername());
            assertNotNull(sgro.getRole());
        });
    }

    @Test
    public void uploadCertificateSystemAdmin() throws Exception {
        byte[] buff = IOUtils.toByteArray(UserResourceTest.class.getResourceAsStream("/SMPtest.crt"));

        // given when
        MvcResult result = mvc.perform(post(PATH+"/1098765430/certdata")
                .with(SYSTEM_CREDENTIALS)
                .content(buff))
                .andExpect(status().isOk()).andReturn();

        //then
        ObjectMapper mapper = new ObjectMapper();
        CertificateRO res = mapper.readValue(result.getResponse().getContentAsString(), CertificateRO.class);

        assertNotNull(res);
        assertEquals("CN=Intermediate CA,O=DIGIT,C=BE", res.getIssuer());
        assertEquals("1.2.840.113549.1.9.1=#160c736d7040746573742e636f6d,CN=SMP test,O=DIGIT,C=BE", res.getSubject());
        assertEquals("3", res.getSerialNumber());
        assertEquals("CN=SMP test,O=DIGIT,C=BE:0000000000000003", res.getCertificateId());
        assertEquals("sno=3&subject=1.2.840.113549.1.9.1%3D%23160c736d7040746573742e636f6d%2CCN%3DSMP+test%2CO%3DDIGIT%2CC%3DBE&validfrom=May+22+20%3A59%3A00+2018+GMT&validto=May+22+20%3A56%3A00+2019+GMT&issuer=CN%3DIntermediate+CA%2CO%3DDIGIT%2CC%3DBE", res.getBlueCoatHeader());
    }

    @Test
    public void uploadCertificateIdWithEmailSerialNumberInSubjectCertIdTest() throws Exception {
        String subject = "CN=common name,emailAddress=CEF-EDELIVERY-SUPPORT@ec.europa.eu,serialNumber=1,O=org,ST=My town,postalCode=2151, L=GreatTown,street=My Street. 20, C=BE";
        String serialNumber = "1234321";
        X509Certificate certificate = X509CertificateTestUtils.createX509CertificateForTest(serialNumber, subject);
        byte[] buff = certificate.getEncoded();
        // given when
        MvcResult result = mvc.perform(post(PATH+"/1098765430/certdata")
                .with(SYSTEM_CREDENTIALS)
                .content(buff))
                .andExpect(status().isOk()).andReturn();

        //them
        ObjectMapper mapper = new ObjectMapper();
        CertificateRO res = mapper.readValue(result.getResponse().getContentAsString(), CertificateRO.class);


        assertEquals("CN=common name,O=org,C=BE:0000000001234321", res.getCertificateId());
    }

    @Test
    public void uploadCertificateInvalidUser() throws Exception {
        byte[] buff = IOUtils.toByteArray(UserResourceTest.class.getResourceAsStream("/SMPtest.crt"));
        // id and logged user not match
        // given when
        mvc.perform(post(PATH+"/34556655/certdata")
                .with(ADMIN_CREDENTIALS)
                .content(buff))
                .andExpect(status().isUnauthorized()).andReturn();
    }

    @Test
    public void samePreviousPasswordUsedTrue() throws Exception {
        // 1 is id for smp_admin
        MvcResult result = mvc.perform(post(PATH+"/1/samePreviousPasswordUsed")
                .with(ADMIN_CREDENTIALS)
                .content("test123"))
                .andExpect(status().isOk()).andReturn();

        assertNotNull(result);
        assertEquals("true", result.getResponse().getContentAsString());
    }

    @Test
    public void samePreviousPasswordUsedFalse() throws Exception {
        // 1 is id for smp_admin
        MvcResult result = mvc.perform(post(PATH+"/1/samePreviousPasswordUsed")
                .with(ADMIN_CREDENTIALS)
                .content("7777"))
                .andExpect(status().isOk()).andReturn();

        assertNotNull(result);
        assertEquals("false", result.getResponse().getContentAsString());
    }

    @Test
    public void samePreviousPasswordUsedUnauthorized() throws Exception {
        // 1 is id for smp_admin so for 3 should be Unauthorized
        MvcResult result = mvc.perform(post(PATH+"/3/samePreviousPasswordUsed")
                .with(ADMIN_CREDENTIALS)
                .content("test123"))
                .andExpect(status().isUnauthorized()).andReturn();


    }

}