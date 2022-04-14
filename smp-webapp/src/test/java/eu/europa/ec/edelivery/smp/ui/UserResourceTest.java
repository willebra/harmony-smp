package eu.europa.ec.edelivery.smp.ui;

import com.fasterxml.jackson.databind.ObjectMapper;
import eu.europa.ec.edelivery.smp.config.PropertiesTestConfig;
import eu.europa.ec.edelivery.smp.config.SmpAppConfig;
import eu.europa.ec.edelivery.smp.config.SmpWebAppConfig;
import eu.europa.ec.edelivery.smp.config.WSSecurityConfigurerAdapter;
import eu.europa.ec.edelivery.smp.data.ui.CertificateRO;
import eu.europa.ec.edelivery.smp.data.ui.DeleteEntityValidation;
import eu.europa.ec.edelivery.smp.data.ui.ServiceResult;
import eu.europa.ec.edelivery.smp.data.ui.UserRO;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.mock.web.MockHttpSession;
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
import javax.ws.rs.core.MediaType;
import java.util.Arrays;
import java.util.UUID;

import static eu.europa.ec.edelivery.smp.ui.ResourceConstants.CONTEXT_PATH_INTERNAL_USER;
import static eu.europa.ec.edelivery.smp.ui.ResourceConstants.CONTEXT_PATH_PUBLIC_SECURITY;
import static org.junit.Assert.*;
import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
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
        WSSecurityConfigurerAdapter.class
        })
@WebAppConfiguration
@Sql("classpath:/cleanup-database.sql")
@Sql("classpath:/webapp_integration_test_data.sql")
@SqlConfig(encoding = "UTF-8")
public class UserResourceTest {

    private static final String PATH_PUBLIC = ResourceConstants.CONTEXT_PATH_PUBLIC_USER;
    private static final String PATH_AUTHENTICATION = CONTEXT_PATH_PUBLIC_SECURITY + "/authentication";

    @Autowired
    private WebApplicationContext webAppContext;

    private MockMvc mvc;
    private static final String SMP_ADMIN_USERNAME="smp_admin";
    private static final String SMP_ADMIN_PASSWD="test123";
    private static final String SYS_ADMIN_USERNAME="sys_admin";
    private static final String SYS_ADMIN_PASSWD="test123";
    private static final String SG_ADMIN_USERNAME="sg_admin";
    private static final String SG_ADMIN_PASSWD="test123";


    ObjectMapper mapper = new ObjectMapper();

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

        MockHttpSession session = loginWithCredentials(SYS_ADMIN_USERNAME, SYS_ADMIN_PASSWD);
        MvcResult result = mvc.perform(get(CONTEXT_PATH_INTERNAL_USER)
                .session(session)
                .with(csrf()))
                .andExpect(status().isOk()).andReturn();
        ServiceResult res = mapper.readValue(result.getResponse().getContentAsString(), ServiceResult.class);
        // then
        assertNotNull(res);
        assertEquals(10, res.getServiceEntities().size());
        res.getServiceEntities().forEach(sgMap -> {
            UserRO sgro = mapper.convertValue(sgMap, UserRO.class);
            assertNotNull(sgro.getUserId());
            assertNotNull(sgro.getUsername());
            assertNotNull(sgro.getRole());
        });
    }

    @Test
    public void testUpdateCurrentUserOK() throws Exception {
        // login
        MockHttpSession session = loginWithCredentials(SMP_ADMIN_USERNAME, SMP_ADMIN_PASSWD);
        // when update data
        UserRO userRO = getLoggedUserData(session);
        userRO.setActive(!userRO.isActive());
        userRO.setEmailAddress("test@mail.com");
        if (userRO.getCertificate() == null) {
            userRO.setCertificate(new CertificateRO());
        }
        userRO.getCertificate().setCertificateId(UUID.randomUUID().toString());
        mvc.perform(put(PATH_PUBLIC + "/" + userRO.getUserId())
                .with(csrf())
                .session(session)
                .contentType(MediaType.APPLICATION_JSON)
                .content(mapper.writeValueAsString(userRO))
        ).andExpect(status().isOk()).andReturn();
    }

    @Test
    public void testUpdateCurrentUserNotAuthenticatedUser() throws Exception {

        // given when - log as SMP admin
        // then change values and list uses for changed value
        MockHttpSession session = loginWithCredentials(SMP_ADMIN_USERNAME, SMP_ADMIN_PASSWD);
        UserRO userRO = getLoggedUserData(session);
        assertNotNull(userRO);
        // when
        userRO.setActive(!userRO.isActive());
        userRO.setEmailAddress("test@mail.com");
        if (userRO.getCertificate() == null) {
            userRO.setCertificate(new CertificateRO());
        }
        userRO.getCertificate().setCertificateId(UUID.randomUUID().toString());

        mvc.perform(put(PATH_PUBLIC + "/" + userRO.getUserId())
                .with(httpBasic(SYS_ADMIN_USERNAME, SYS_ADMIN_PASSWD))
                .with(csrf())
                .contentType(MediaType.APPLICATION_JSON)
                .content(mapper.writeValueAsString(userRO))
        ).andExpect(status().isUnauthorized());
    }

    @Test
    public void testUpdateUserList() throws Exception {
        // given when
        MockHttpSession session = loginWithCredentials(SYS_ADMIN_USERNAME, SYS_ADMIN_PASSWD);
        MvcResult result = mvc.perform(get(CONTEXT_PATH_INTERNAL_USER)
                .session(session)
                .with(csrf()))
                .andExpect(status().isOk()).andReturn();
        ServiceResult res = mapper.readValue(result.getResponse().getContentAsString(), ServiceResult.class);
        assertNotNull(res);
        assertFalse(res.getServiceEntities().isEmpty());
        UserRO userRO = mapper.convertValue(res.getServiceEntities().get(0), UserRO.class);
        // then
        userRO.setActive(!userRO.isActive());
        userRO.setEmailAddress("test@mail.com");
        userRO.setPassword(UUID.randomUUID().toString());
        if (userRO.getCertificate() == null) {
            userRO.setCertificate(new CertificateRO());
        }
        userRO.getCertificate().setCertificateId(UUID.randomUUID().toString());

        mvc.perform(put(CONTEXT_PATH_INTERNAL_USER)
                .session(session)
                .with(csrf())
                .contentType(MediaType.APPLICATION_JSON)
                .content(mapper.writeValueAsString(Arrays.asList(userRO)))
        ).andExpect(status().isOk());
    }

    @Test
    public void testUpdateUserListWrongAuthentication() throws Exception {
        // given when
        MockHttpSession session = loginWithCredentials(SYS_ADMIN_USERNAME, SYS_ADMIN_PASSWD);
        MvcResult result = mvc.perform(get(CONTEXT_PATH_INTERNAL_USER)
                .session(session)
                .with(csrf()))
                .andExpect(status().isOk()).andReturn();
        ServiceResult res = mapper.readValue(result.getResponse().getContentAsString(), ServiceResult.class);
        assertNotNull(res);
        assertFalse(res.getServiceEntities().isEmpty());
        UserRO userRO = mapper.convertValue(res.getServiceEntities().get(0), UserRO.class);
        // then
        userRO.setActive(!userRO.isActive());
        userRO.setEmailAddress("test@mail.com");
        userRO.setPassword(UUID.randomUUID().toString());
        if (userRO.getCertificate() == null) {
            userRO.setCertificate(new CertificateRO());
        }
        userRO.getCertificate().setCertificateId(UUID.randomUUID().toString());
        // anonymous
        mvc.perform(put(CONTEXT_PATH_INTERNAL_USER)
                .with(csrf())
                .contentType(MediaType.APPLICATION_JSON)
                .content(mapper.writeValueAsString(Arrays.asList(userRO)))
        ).andExpect(status().isUnauthorized());

        MockHttpSession sessionSMPAdmin = loginWithCredentials(SMP_ADMIN_USERNAME, SMP_ADMIN_PASSWD);
        mvc.perform(put(CONTEXT_PATH_INTERNAL_USER)
                .session(sessionSMPAdmin)
                .with(csrf())
                .contentType(MediaType.APPLICATION_JSON)
                .content(mapper.writeValueAsString(Arrays.asList(userRO)))
        ).andExpect(status().isUnauthorized());

        MockHttpSession sessionSGAdmin = loginWithCredentials(SG_ADMIN_USERNAME, SG_ADMIN_PASSWD);
        mvc.perform(put(CONTEXT_PATH_INTERNAL_USER)
                .session(sessionSGAdmin)
                .with(csrf())
                .contentType(MediaType.APPLICATION_JSON)
                .content(mapper.writeValueAsString(Arrays.asList(userRO)))
        ).andExpect(status().isUnauthorized());
    }

    @Test
    public void testValidateDeleteUserOK() throws Exception {

        // login
        MockHttpSession session = loginWithCredentials(SYS_ADMIN_USERNAME, SYS_ADMIN_PASSWD);
        // get list
        MvcResult result = mvc.perform(get(CONTEXT_PATH_INTERNAL_USER)
                .with(csrf())
                .session(session))
                .andExpect(status().isOk()).andReturn();
        ServiceResult res = mapper.readValue(result.getResponse().getContentAsString(), ServiceResult.class);
        assertNotNull(res);
        assertFalse(res.getServiceEntities().isEmpty());
        UserRO userRO = mapper.convertValue(res.getServiceEntities().get(0), UserRO.class);

        MvcResult resultDelete = mvc.perform(post(CONTEXT_PATH_INTERNAL_USER + "/validate-delete")
                .with(csrf())
                .session(session)
                .contentType(MediaType.APPLICATION_JSON)
                .content("[\"" + userRO.getUserId() + "\"]"))
                .andExpect(status().isOk()).andReturn();

        DeleteEntityValidation  dev = mapper.readValue(resultDelete.getResponse().getContentAsString(), DeleteEntityValidation.class);

        assertFalse(dev.getListIds().isEmpty());
        assertTrue(dev.getListDeleteNotPermitedIds().isEmpty());
        assertEquals(userRO.getUserId(), dev.getListIds().get(0));
    }

    @Test
    public void testValidateDeleteLoggedUserNotOK() throws Exception {

        // login
        MockHttpSession session = loginWithCredentials(SYS_ADMIN_USERNAME, SYS_ADMIN_PASSWD);
        // get list
        MvcResult result = mvc.perform(get(CONTEXT_PATH_INTERNAL_USER)
                .with(csrf())
                .session(session))
                .andExpect(status().isOk()).andReturn();
        UserRO userRO = getLoggedUserData(session);

        // note system credential has id 3!
        MvcResult resultDelete = mvc.perform(post(CONTEXT_PATH_INTERNAL_USER + "/validate-delete")
                .with(csrf())
                .session(session)
                .contentType(org.springframework.http.MediaType.APPLICATION_JSON)
                .content("[\""+userRO.getUserId()+"\"]"))
                .andExpect(status().isOk())
                .andReturn();

        DeleteEntityValidation res = mapper.readValue(resultDelete.getResponse().getContentAsString(), DeleteEntityValidation.class);

        assertTrue(res.getListIds().isEmpty());
        assertEquals("Could not delete logged user!", res.getStringMessage());
    }


    /**
     * Login with the username and data
     * @param username
     * @param password
     * @return
     * @throws Exception
     */
    public MockHttpSession loginWithCredentials(String username, String password) throws Exception {
        MvcResult result = mvc.perform(post(PATH_AUTHENTICATION)
                .header(HttpHeaders.CONTENT_TYPE, org.springframework.http.MediaType.APPLICATION_JSON_VALUE)
                .content("{\"username\":\""+username+"\",\"password\":\""+password+"\"}"))
                .andExpect(status().isOk()).andReturn();
        // assert successful login
        UserRO userRO = mapper.readValue(result.getResponse().getContentAsString(), UserRO.class);
        assertNotNull(userRO);
        return (MockHttpSession) result.getRequest().getSession();
    }

    /**
     * Return currently logged in data for the session
     * @param session
     * @return
     * @throws Exception
     */
    public UserRO getLoggedUserData(MockHttpSession session) throws Exception {
        MvcResult result = mvc.perform(get(CONTEXT_PATH_PUBLIC_SECURITY+"/user")
                .session(session)
                .with(csrf()))
                .andExpect(status().isOk()).andReturn();
        return mapper.readValue(result.getResponse().getContentAsString(), UserRO.class);
    }

}