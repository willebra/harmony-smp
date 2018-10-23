package eu.europa.ec.edelivery.smp.ui;


import eu.europa.ec.edelivery.smp.auth.SMPAuthority;
import eu.europa.ec.edelivery.smp.data.ui.CertificateRO;
import eu.europa.ec.edelivery.smp.data.ui.ServiceResult;
import eu.europa.ec.edelivery.smp.data.ui.UserRO;
import eu.europa.ec.edelivery.smp.logging.SMPLogger;
import eu.europa.ec.edelivery.smp.logging.SMPLoggerFactory;
import eu.europa.ec.edelivery.smp.services.ui.UIUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.web.bind.annotation.*;

import javax.annotation.PostConstruct;
import java.io.IOException;
import java.security.cert.CertificateException;
import java.util.Arrays;

/**
 * @author Joze Rihtarsic
 * @since 4.1
 */

@RestController
@RequestMapping(value = "/ui/rest/user")
public class UserResource {

    private static final SMPLogger LOG = SMPLoggerFactory.getLogger(UserResource.class);

    @Autowired
    private UIUserService uiUserService;

    @PostConstruct
    protected void init() {

    }

    @PutMapping(produces = {"application/json"})
    @ResponseBody
    @RequestMapping(method = RequestMethod.GET)
    //update gui to call this when somebody is logged in.
   // @Secured({SMPAuthority.S_AUTHORITY_TOKEN_SYSTEM_ADMIN, SMPAuthority.S_AUTHORITY_TOKEN_SMP_ADMIN, SMPAuthority.S_AUTHORITY_TOKEN_SERVICE_GROUP_ADMIN})
    public ServiceResult<UserRO> getUsers(
            @RequestParam(value = "page", defaultValue = "0") int page,
            @RequestParam(value = "pageSize", defaultValue = "10") int pageSize,
            @RequestParam(value = "orderBy", required = false) String orderBy,
            @RequestParam(value = "orderType", defaultValue = "asc", required = false) String orderType,
            @RequestParam(value = "user", required = false) String user
            ) {
        return  uiUserService.getTableList(page,pageSize, orderBy, orderType, null);
    }

    @PutMapping(produces = {"application/json"})
    @RequestMapping(method = RequestMethod.PUT)
    @Secured({SMPAuthority.S_AUTHORITY_TOKEN_SYSTEM_ADMIN})
    public void updateUserList(@RequestBody(required = true) UserRO[] updateEntities ){
        LOG.info("Update user list, count: {}" + updateEntities.length);
        uiUserService.updateUserList(Arrays.asList(updateEntities));
    }

    @RequestMapping(path = "certdata", method = RequestMethod.POST)
    public CertificateRO uploadFile(@RequestBody byte[] data) {
        LOG.info("Got certificate data: " + data.length);
        try {
            return uiUserService.getCertificateData(data);
        } catch (IOException | CertificateException e) {
            LOG.error("Error occured while parsing certificate.", e);
        }
        return null;

    }
}
