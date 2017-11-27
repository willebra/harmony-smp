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

package eu.europa.ec.cipa.smp.server.util;

import eu.europa.ec.edelivery.smp.exceptions.CertificateAuthenticationException;
import eu.europa.ec.cipa.smp.server.security.CertificateDetails;
import org.junit.Assert;
import org.junit.Test;

import java.math.BigInteger;

/**
 * Created by migueti on 06/12/2016.
 */
public class CertificateUtilsTest {

    @Test
    public void testConvertBigIntToHexString() {
        Assert.assertEquals("18ee90ff6c373e0ee4e3f0ad2",
                CertificateUtils.convertBigIntToHexString(new BigInteger("123456789012345678901234567890")));
    }

    @Test
    public void testReturnCertificateIdBigInteger() {
        Assert.assertEquals("TEST SUBJECT:c7748819dffb62438d1c67eea",
                CertificateUtils.returnCertificateId("TEST SUBJECT", new BigInteger("987654321098765432109876543210")));
    }

    @Test
    public void testReturnCertificateIdString() {
        Assert.assertEquals("TEST SUBJECT:000000008f658712",
                CertificateUtils.returnCertificateId("TEST SUBJECT", "8f658712"));
    }

    @Test
    public void testReturnCertificateIdStringWithHexaHeader() {
        Assert.assertEquals("TEST SUBJECT:000000008f658712",
                CertificateUtils.returnCertificateId("TEST SUBJECT", "0x8f658712"));
    }

    @Test
    public void testRemoveHexHeader() {
        Assert.assertEquals("1234567890", CertificateUtils.removeHexHeader("0x1234567890"));
    }

    @Test
    public void calculateCertificateIdFromHeaderWith5Parameters() throws Exception {
        String certHeaderValue = CommonUtil.createHeaderCertificateForBlueCoat();
        CertificateDetails certificateDetails = CertificateUtils.calculateCertificateIdFromHeader(certHeaderValue);
        Assert.assertEquals("CN=PEPPOL SERVICE METADATA PUBLISHER TEST CA,  C=DK, O=NATIONAL IT AND TELECOM AGENCY,    OU=FOR TEST PURPOSES ONLY", certificateDetails.getIssuer());
        Assert.assertEquals("CN=PEPPOL SERVICE METADATA PUBLISHER TEST CA,  C=DK, O=NATIONAL IT AND TELECOM AGENCY,    OU=FOR TEST PURPOSES ONLY", certificateDetails.getRootCertificateDN());
        Assert.assertEquals("CN=SMP_123456789,O=DG-DIGIT,C=BE", certificateDetails.getSubject());
        Assert.assertEquals("123ABCD", certificateDetails.getSerial());
        Assert.assertNull(certificateDetails.getPolicyOids());
    }

    @Test
    public void calculateCertificateIdFromHeaderWith6Parameters() throws Exception {
        String certHeaderValue = CommonUtil.createHeaderCertificateForBlueCoat(null, true);
        CertificateDetails certificateDetails = CertificateUtils.calculateCertificateIdFromHeader(certHeaderValue);
        Assert.assertEquals("CN=PEPPOL SERVICE METADATA PUBLISHER TEST CA,  C=DK, O=NATIONAL IT AND TELECOM AGENCY,    OU=FOR TEST PURPOSES ONLY", certificateDetails.getIssuer());
        Assert.assertEquals("CN=PEPPOL SERVICE METADATA PUBLISHER TEST CA,  C=DK, O=NATIONAL IT AND TELECOM AGENCY,    OU=FOR TEST PURPOSES ONLY", certificateDetails.getRootCertificateDN());
        Assert.assertEquals("CN=SMP_123456789,O=DG-DIGIT,C=BE", certificateDetails.getSubject());
        Assert.assertEquals("123ABCD", certificateDetails.getSerial());
        Assert.assertEquals("5.0.6.0.4.1.0000.66.99", certificateDetails.getPolicyOids());
    }

    @Test(expected = CertificateAuthenticationException.class)
    public void calculateCertificateIdFromHeaderWith7ParametersNotOk() throws Exception {
        String certHeaderValue = CommonUtil.createHeaderCertificateForBlueCoat(null, true) + "&oneMoreParameter=extra";
        CertificateDetails certificateDetails = CertificateUtils.calculateCertificateIdFromHeader(certHeaderValue);
    }

    @Test(expected = CertificateAuthenticationException.class)
    public void calculateCertificateIdFromHeaderWith4ParametersNotOk() throws Exception {
        String certHeaderValue = CommonUtil.createHeaderCertificateForBlueCoat(null, false).replaceFirst("&validTo=[^&]*", "");
        CertificateDetails certificateDetails = CertificateUtils.calculateCertificateIdFromHeader(certHeaderValue);
    }

    @Test
    public void calculateCertificateIdFromHeaderSerialNotOk() throws Exception {
        try {
            String certHeaderValue = CommonUtil.createHeaderCertificateForBlueCoat(null, false).replace("serial=123ABCD&", "");
            CertificateDetails certificateDetails = CertificateUtils.calculateCertificateIdFromHeader(certHeaderValue);
            Assert.fail("Serial not detected. Exception should be thrown.");
        } catch (CertificateAuthenticationException exc) {
            Assert.assertTrue(exc.getMessage().startsWith("Impossible to determine the certificate identifier from"));
        }
    }

    @Test(expected = CertificateAuthenticationException.class)
    public void calculateCertificateIdFromHeaderNotOk() throws Exception {
        String certHeaderValue = CommonUtil.createHeaderCertificateForBlueCoat("CM=SMP_123456789,O=DG-DIGIT,C=BE", false);
        CertificateDetails certificateDetails = CertificateUtils.calculateCertificateIdFromHeader(certHeaderValue);
    }
}
