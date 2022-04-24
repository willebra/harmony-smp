package eu.europa.ec.edelivery.smp.config;

import eu.europa.ec.edelivery.smp.data.model.DBConfiguration;
import eu.europa.ec.edelivery.smp.data.ui.enums.SMPPropertyEnum;
import eu.europa.ec.edelivery.smp.exceptions.SMPRuntimeException;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.ExpectedException;

import javax.sql.DataSource;
import java.util.Properties;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

public class PropertyInitializationTest {


    PropertyInitialization testInstance = new PropertyInitialization();

    @Rule
    public ExpectedException expectedEx = ExpectedException.none();


    @Test
    public void testValidateProperties() {
        // when
        Properties properties = new Properties();

        expectedEx.expect(SMPRuntimeException.class);
        expectedEx.expectMessage("jdbc/smpDatasource");

        DataSource dataSource = testInstance.getDatasource(properties);
    }

    @Test
    public void getDatasourceWithoutConfiguration() {
        // when
        Properties properties = new Properties();

        expectedEx.expect(SMPRuntimeException.class);
        expectedEx.expectMessage("jdbc/smpDatasource");

        DataSource dataSource = testInstance.getDatasource(properties);
    }

    @Test
    public void getDatasourceWithoutConfigurationWithJndi() {
        // when
        Properties properties = new Properties();
        properties.setProperty(FileProperty.PROPERTY_DB_JNDI, "jdbc/notExists");

        expectedEx.expect(SMPRuntimeException.class);
        expectedEx.expectMessage("jdbc/notExists");

        DataSource dataSource = testInstance.getDatasource(properties);
    }

    @Test
    public void getDatasourceBadConfigurationWithUrl() {
        // when
        Properties properties = new Properties();
        properties.setProperty(FileProperty.PROPERTY_DB_URL, "schema:/no@exists/db");

        expectedEx.expect(IllegalArgumentException.class);
        expectedEx.expectMessage("Property 'driverClassName' must not be empty");

        DataSource dataSource = testInstance.getDatasource(properties);
    }


    @Test
    public void getDatasourceByUrl() {
        // when
        Properties properties = new Properties();
        properties.setProperty(FileProperty.PROPERTY_DB_URL, "jdbc:h2:file:./target/myDb;DB_CLOSE_DELAY=-1;DB_CLOSE_ON_EXIT=TRUE;AUTO_SERVER=TRUE");
        properties.setProperty(FileProperty.PROPERTY_DB_DRIVER, "org.h2.Driver");

        DataSource dataSource = testInstance.getDatasource(properties);

        assertNotNull(dataSource);
    }

    @Test
    public void createDBEntry() {
        // given
        DBConfiguration entry = testInstance.createDBEntry("key", "value", "desc");
        // then
        assertEquals("key", entry.getProperty());
        assertEquals("value", entry.getValue());
        assertEquals("desc", entry.getDescription());
    }


    @Test
    public void createDBEntryProperty() {
        // given
        DBConfiguration entry = testInstance.createDBEntry(SMPPropertyEnum.CS_DOCUMENTS, "value");
        // then
        assertEquals(SMPPropertyEnum.CS_DOCUMENTS.getProperty(), entry.getProperty());
        assertEquals("value", entry.getValue());
        assertEquals(SMPPropertyEnum.CS_DOCUMENTS.getDesc(), entry.getDescription());
    }

}