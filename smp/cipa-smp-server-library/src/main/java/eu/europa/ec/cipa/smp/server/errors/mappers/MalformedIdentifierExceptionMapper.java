package eu.europa.ec.cipa.smp.server.errors.mappers;

import eu.europa.ec.cipa.smp.server.errors.ErrorResponseBuilder;
import eu.europa.ec.smp.api.MalformedIdentifierException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.ws.rs.core.Response;
import javax.ws.rs.ext.ExceptionMapper;
import javax.ws.rs.ext.Provider;

import static eu.europa.ec.cipa.smp.server.errors.ErrorBusinessCode.FORMAT_ERROR;
import static javax.ws.rs.core.Response.Status.BAD_REQUEST;

/**
 * Created by migueti on 19/01/2017.
 */
@Provider
public class MalformedIdentifierExceptionMapper implements ExceptionMapper<MalformedIdentifierException>{
    private static final Logger s_aLogger = LoggerFactory.getLogger (MalformedIdentifierExceptionMapper.class);

    @Override
    public Response toResponse(MalformedIdentifierException e) {
        s_aLogger.warn (e.getMessage());
        return ErrorResponseBuilder.status(BAD_REQUEST)
                .businessCode(FORMAT_ERROR)
                .errorDescription(e.getMessage())
                .build();
    }
}
