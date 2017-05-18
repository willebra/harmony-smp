/*
 * Copyright 2017 European Commission | CEF eDelivery
 *
 * Licensed under the EUPL, Version 1.1 or – as soon they will be approved by the European Commission - subsequent versions of the EUPL (the "Licence");
 * You may not use this work except in compliance with the Licence.
 *
 * You may obtain a copy of the Licence at:
 * https://joinup.ec.europa.eu/software/page/eupl
 * or file: LICENCE-EUPL-v1.1.pdf
 *
 * Unless required by applicable law or agreed to in writing, software distributed under the Licence is distributed on an "AS IS" basis,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the Licence for the specific language governing permissions and limitations under the Licence.
 */
package eu.europa.ec.cipa.smp.server.services;

import eu.europa.ec.cipa.smp.server.conversion.ServiceMetadataConverter;
import eu.europa.ec.cipa.smp.server.data.DataManagerFactory;
import eu.europa.ec.cipa.smp.server.data.IDataManager;
import eu.europa.ec.cipa.smp.server.errors.exceptions.NotFoundException;
import eu.europa.ec.smp.api.Identifiers;
import org.oasis_open.docs.bdxr.ns.smp._2016._05.DocumentIdentifier;
import org.oasis_open.docs.bdxr.ns.smp._2016._05.ParticipantIdentifierType;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.w3c.dom.Document;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import javax.ws.rs.core.UriInfo;

/**
 * This class implements the read-only methods for the REST
 * SignedServiceMetadata interface. It is used in the read-only interface and in
 * the writable interface.
 * 
 * @author PEPPOL.AT, BRZ, Philip Helger
 */
public final class BaseServiceMetadataInterfaceImpl {
  private static final Logger s_aLogger = LoggerFactory.getLogger (BaseServiceMetadataInterfaceImpl.class);

  private BaseServiceMetadataInterfaceImpl () {}

  @Nonnull
  public static Document getServiceRegistration (@Nonnull final UriInfo uriInfo,
                                                                                @Nullable final String sServiceGroupID,
                                                                                @Nullable final String sDocumentTypeID) throws Throwable {
    s_aLogger.info (String.format("GET /%s/services/%s", sServiceGroupID, sDocumentTypeID));

    final ParticipantIdentifierType aServiceGroupID = Identifiers.asParticipantId(sServiceGroupID);
    final DocumentIdentifier aDocTypeID = Identifiers.asDocumentId (sDocumentTypeID);

    final IDataManager aDataManager = DataManagerFactory.getInstance ();
    String sServiceMetadata = aDataManager.getService (aServiceGroupID, aDocTypeID);
    if(sServiceMetadata == null) {
      throw new NotFoundException(String.format("Service '%s/services/%s' was not found", sServiceGroupID, sDocumentTypeID));
    }

    Document aSignedServiceMetadata = ServiceMetadataConverter.toSignedServiceMetadatadaDocument(sServiceMetadata);

    s_aLogger.info (String.format("Finished getServiceRegistration(%s,%s)", sServiceGroupID, sDocumentTypeID));
    return aSignedServiceMetadata;
  }
}
