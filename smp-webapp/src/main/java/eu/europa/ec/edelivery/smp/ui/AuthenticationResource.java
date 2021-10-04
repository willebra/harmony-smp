package eu.europa.ec.edelivery.smp.ui;


import eu.europa.ec.edelivery.smp.auth.SMPAuthenticationService;
import eu.europa.ec.edelivery.smp.auth.SMPAuthenticationToken;
import eu.europa.ec.edelivery.smp.auth.SMPAuthorizationService;
import eu.europa.ec.edelivery.smp.data.ui.ErrorRO;
import eu.europa.ec.edelivery.smp.data.ui.LoginRO;
import eu.europa.ec.edelivery.smp.data.ui.UserRO;
import eu.europa.ec.edelivery.smp.logging.SMPLogger;
import eu.europa.ec.edelivery.smp.logging.SMPLoggerFactory;
import eu.europa.ec.edelivery.smp.services.ConfigurationService;
import eu.europa.ec.edelivery.smp.utils.SMPCookieWriter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.ConversionService;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.CookieClearingLogoutHandler;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.security.web.csrf.CsrfToken;
import org.springframework.security.web.csrf.CsrfTokenRepository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import static eu.europa.ec.edelivery.smp.auth.SMPAuthority.*;
import static eu.europa.ec.edelivery.smp.utils.SMPCookieWriter.CSRF_COOKIE_NAME;
import static eu.europa.ec.edelivery.smp.utils.SMPCookieWriter.SESSION_COOKIE_NAME;

/**
 * @author Sebastian-Ion TINCU
 * @since 4.0
 */
@RestController
@RequestMapping(value = "/ui/rest/security")
public class AuthenticationResource {

    private static final SMPLogger LOG = SMPLoggerFactory.getLogger(AuthenticationResource.class);

    protected SMPAuthenticationService authenticationService;

    protected SMPAuthorizationService authorizationService;

    private ConversionService conversionService;

    private ConfigurationService configurationService;

    public CsrfTokenRepository csrfTokenRepository;

    SMPCookieWriter smpCookieWriter;

    @Autowired
    public AuthenticationResource(SMPAuthenticationService authenticationService
            , SMPAuthorizationService authorizationService
            , ConversionService conversionService
            , ConfigurationService configurationService
            , SMPCookieWriter smpCookieWriter
            , CsrfTokenRepository csrfTokenRepository) {
        this.authenticationService = authenticationService;
        this.authorizationService = authorizationService;
        this.conversionService = conversionService;
        this.configurationService = configurationService;
        this.smpCookieWriter = smpCookieWriter;
        this.csrfTokenRepository = csrfTokenRepository;
    }

    @ResponseStatus(value = HttpStatus.FORBIDDEN)
    @ExceptionHandler({AuthenticationException.class})
    public ErrorRO handleException(Exception ex) {
        LOG.error(ex.getMessage(), ex);
        return new ErrorRO(ex.getMessage());
    }

    @RequestMapping(value = "authentication", method = RequestMethod.POST)
    @Transactional(noRollbackFor = BadCredentialsException.class)
    public UserRO authenticate(@RequestBody LoginRO loginRO, HttpServletRequest request, HttpServletResponse response) {
        LOG.debug("Authenticating user [{}]", loginRO.getUsername());
        // reset session id token and the Csrf Token at login
        recreatedSessionCookie(request, response);
        CsrfToken csfrToken = csrfTokenRepository.generateToken(request);
        csrfTokenRepository.saveToken(csfrToken, request, response);

        SMPAuthenticationToken authentication = (SMPAuthenticationToken) authenticationService.authenticate(loginRO.getUsername(), loginRO.getPassword());
        UserRO userRO = conversionService.convert(authentication.getUser(), UserRO.class);
        return authorizationService.sanitize(userRO);
    }

    @RequestMapping(value = "authentication", method = RequestMethod.DELETE)
    public void logout(HttpServletRequest request, HttpServletResponse response) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth == null) {
            LOG.debug("Cannot perform logout: no user is authenticated");
            return;
        }

        LOG.info("Logging out user [{}]", auth.getName());
        new CookieClearingLogoutHandler(SESSION_COOKIE_NAME, CSRF_COOKIE_NAME).logout(request, response, null);
        LOG.info("Cleared cookies");
        new SecurityContextLogoutHandler().logout(request, response, auth);
        LOG.info("Logged out");
    }

    @RequestMapping(value = "user", method = RequestMethod.GET)
    @Secured({S_AUTHORITY_TOKEN_SYSTEM_ADMIN, S_AUTHORITY_TOKEN_SMP_ADMIN, S_AUTHORITY_TOKEN_SERVICE_GROUP_ADMIN})
    public UserRO getUser() {
        UserRO user = new UserRO();

        String username = (String) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        LOG.debug("get user: {}", username);

        user.setUsername(username);
        return user;
    }

    /**
     * set cookie parameters https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Set-Cookie
     *
     * @param request
     * @param response
     */
    public void recreatedSessionCookie(HttpServletRequest request, HttpServletResponse response) {
        // recreate session id  (first make sure it exists)
        request.getSession(true).getId();
        String sessionId = request.changeSessionId();
        smpCookieWriter.writeCookieToResponse(SESSION_COOKIE_NAME,
                sessionId,
                configurationService.getSessionCookieSecure(), configurationService.getSessionCookieMaxAge(),
                configurationService.getSessionCookiePath(),
                configurationService.getSessionCookieSameSite(),
                request, response
        );
    }

}