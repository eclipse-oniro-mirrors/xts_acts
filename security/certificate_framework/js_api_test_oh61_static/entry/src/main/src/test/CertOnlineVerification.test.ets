/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect, TestType, Size, Level, beforeEach} from "../../../hypium/index";
import { BusinessError } from '@ohos.base';
import { cert } from "@kit.DeviceCertificateKit";
import { createCertChain, createX509Cert,
  caChain,
  caTrustCert, caChain2, caChainWithOcsp,
  caTrustCertWithOcsp,
  caChainRevokedEntry,
  caChainRevokedEntry2,
  caTrustCert2,
  caChainRevokedEntry3,
  caChainWithOcsp2,
  caTrustCertWithOcsp2,
  caChainWithOcsp3,
  caTrustCertWithOcsp4,
  interCertRevokedChain,
  interCertRevokedChainTrustCert,
  leafCertRevokedChainTrustCert,
  leafCertRevokedChain
} from "./utils/crl/crl";
import { sleep } from "./utils/common/common";
import wifiMg from '@ohos.wifiManager';


export default function certFrameworkCertCheckOnlineCaTestUnit() {
  describe("certFrameworkCertCheckOnlineCaTestUnit", (): void => {

    beforeEach(async (): void => {
      if(!wifiMg.isWifiActive()) {
        console.info("=========>>>>>>> wifi_test/enable wifi");
        await sleep(5000);
      }
      let data: wifiMg.WifiLinkedInfo = await wifiMg.getLinkedInfo();
      console.info("=========>>>>>>> Internet WifiLinkedInfo : " + JSON.stringify(data));
      console.info("=========>>>>>>> Internet speed : " + JSON.stringify(data.linkSpeed));
      console.info("=========>>>>>>> Internet chLoad : " + JSON.stringify(data.chload));
      console.info("=========>>>>>>> Internet rssi : " + JSON.stringify(data.rssi));

      if (data.connState == wifiMg.ConnState.CONNECTED) {
        console.info("=========>>>>>>> WLAN connection established");
      } else {
        throw new Error("=========>>>>>>> WLAN Network Error");
      }
      if (data.chload >= 800 || data.rssi <= -80) {
        throw new Error("=========>>>>>>> WLAN Network Error (speed)");
      }
    })

    /**
     * @tc.name   SUB_Security_Cert_Framework_Online_CheckCa_Func_0100
     * @tc.number SUB_Security_Cert_Framework_Online_CheckCa_Func_0100
     * @tc.desc   The Online CRL, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Online_CheckCa_Func_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let x509CertChain: cert.X509CertChain = await createCertChain(caChain);
          let x509Cert: cert.X509Cert = await createX509Cert(caTrustCert);
          const param: cert.CertChainValidationParameters = {
            trustAnchors: [{
              CACert: x509Cert
            }],
            revocationCheckParam: {
              options: [
                cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_ACCESS_NETWORK,
                cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_CHECK_INTERMEDIATE_CA_ONLINE
              ],
            }
          };
          await x509CertChain.validate(param);
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`[XTS] CheckCa_Func_0100 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Online_CheckCa_Func_0200
     * @tc.number SUB_Security_Cert_Framework_Online_CheckCa_Func_0200
     * @tc.desc   The Online CRL, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Online_CheckCa_Func_0200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let x509CertChain: cert.X509CertChain = await createCertChain(caChain2);
          let x509Cert: cert.X509Cert = await createX509Cert(caTrustCert);
          const param: cert.CertChainValidationParameters = {
            trustAnchors: [{
              CACert: x509Cert
            }],
            revocationCheckParam: {
              crlDownloadURI: "https://gitcode.com/m0_72610775/compatibility/blob/master/test_suite" +
                "/resource/master/standard%20system/acts/resource/security" +
                "/certificate_framework/20250818178834/inter.crl",
              options: [
                cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_ACCESS_NETWORK,
                cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_CHECK_INTERMEDIATE_CA_ONLINE
              ],
            }
          };
          await x509CertChain.validate(param);
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`[XTS] CheckCa_Func_0200 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Online_CheckCa_Func_0300
     * @tc.number SUB_Security_Cert_Framework_Online_CheckCa_Func_0300
     * @tc.desc   The Online CRL, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Online_CheckCa_Func_0300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let x509CertChain: cert.X509CertChain = await createCertChain(caChain2);
          let x509Cert: cert.X509Cert = await createX509Cert(caTrustCert);
          const param: cert.CertChainValidationParameters = {
            trustAnchors: [{
              CACert: x509Cert
            }],
            revocationCheckParam: {
              crlDownloadURI: "https://gitcode.com/m0_72610775/compatibility/blob/master/test_suite" +
                "/resource/master/standard%20system/acts/resource/security" +
                "/certificate_framework/20250818178834/inter.crl",
              options: [
                cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_ACCESS_NETWORK,
                cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_FALLBACK_NO_PREFER,
                cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_CHECK_INTERMEDIATE_CA_ONLINE
              ],
            }
          };
          await x509CertChain.validate(param);
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`[XTS] CheckCa_Func_0300 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Online_CheckCa_Func_0400
     * @tc.number SUB_Security_Cert_Framework_Online_CheckCa_Func_0400
     * @tc.desc   The Online CRL, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Online_CheckCa_Func_0400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let x509CertChain: cert.X509CertChain = await createCertChain(caChain);
          let x509Cert: cert.X509Cert = await createX509Cert(caTrustCert);
          const param: cert.CertChainValidationParameters = {
            trustAnchors: [{
              CACert: x509Cert
            }],
            revocationCheckParam: {
              options: [
                cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_ACCESS_NETWORK,
                cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_FALLBACK_NO_PREFER,
                cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_CHECK_INTERMEDIATE_CA_ONLINE
              ],
            }
          };
          await x509CertChain.validate(param);
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`[XTS] CheckCa_Func_0400 “${error}“, error code: ${error.code}`);
          if (error.code != cert.CertResult.ERR_CERT_SIGNATURE_FAILURE) {
            expect(error.code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION); // 网络原因返回错误码
          }
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Online_CheckCa_Func_0500
     * @tc.number SUB_Security_Cert_Framework_Online_CheckCa_Func_0500
     * @tc.desc   The Online CRL, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Online_CheckCa_Func_0500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          // openssl ocsp -port 7766 -index index.txt -CA ecdsa_root.crt -rkey ecdsa_root.key -rsigner ecdsa_root.crt -text
          let x509CertChain: cert.X509CertChain = await createCertChain(caChainWithOcsp);
          let x509Cert: cert.X509Cert = await createX509Cert(caTrustCertWithOcsp);
          const param: cert.CertChainValidationParameters = {
            trustAnchors: [{
              CACert: x509Cert
            }],
            revocationCheckParam: {
              options: [
                cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_ACCESS_NETWORK,
                cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_PREFER_OCSP,
                cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_CHECK_INTERMEDIATE_CA_ONLINE
              ],
            }
          };
          await x509CertChain.validate(param);
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`[XTS] CheckCa_Func_0500 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Online_CheckCa_Func_0600
     * @tc.number SUB_Security_Cert_Framework_Online_CheckCa_Func_0600
     * @tc.desc   The Online CRL, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Online_CheckCa_Func_0600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let x509CertChain: cert.X509CertChain = await createCertChain(caChainWithOcsp);
          let x509Cert: cert.X509Cert = await createX509Cert(caTrustCertWithOcsp);
          const param: cert.CertChainValidationParameters = {
            trustAnchors: [{
              CACert: x509Cert
            }],
            revocationCheckParam: {
              ocspResponderURI: "http://localhost:7776",
              options: [
                cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_ACCESS_NETWORK,
                cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_PREFER_OCSP,
                cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_CHECK_INTERMEDIATE_CA_ONLINE
              ],
            }
          };
          await x509CertChain.validate(param);
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`[XTS] CheckCa_Func_0600 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Online_CheckCa_Func_0700
     * @tc.number SUB_Security_Cert_Framework_Online_CheckCa_Func_0700
     * @tc.desc   The Online CRL, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Online_CheckCa_Func_0700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let x509CertChain: cert.X509CertChain = await createCertChain(caChain);
          let x509Cert: cert.X509Cert = await createX509Cert(caTrustCert);
          const param: cert.CertChainValidationParameters = {
            trustAnchors: [{
              CACert: x509Cert
            }],
            revocationCheckParam: {
              crlDownloadURI: "https://gitcode.com/m0_72610775/compatibility/blob/master/test_suite" +
                "/resource/master/standard%20system/acts/resource/security" +
                "/certificate_framework/20250818178834/inter.crl",
              options: [
                cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_ACCESS_NETWORK,
                cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_PREFER_OCSP,
                cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_FALLBACK_NO_PREFER,
                cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_CHECK_INTERMEDIATE_CA_ONLINE
              ],
            }
          };
          await x509CertChain.validate(param);
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`[XTS] CheckCa_Func_0700 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Online_CheckCa_Func_0800
     * @tc.number SUB_Security_Cert_Framework_Online_CheckCa_Func_0800
     * @tc.desc   The Online CRL, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Online_CheckCa_Func_0800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let x509CertChain: cert.X509CertChain = await createCertChain(caChain);
          let x509Cert: cert.X509Cert = await createX509Cert(caTrustCert);
          const param: cert.CertChainValidationParameters = {
            trustAnchors: [{
              CACert: x509Cert
            }],
            revocationCheckParam: {
              options: [
                cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_ACCESS_NETWORK,
                cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_PREFER_OCSP,
                cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_FALLBACK_NO_PREFER,
                cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_CHECK_INTERMEDIATE_CA_ONLINE
              ],
            }
          };
          await x509CertChain.validate(param);
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`[XTS] CheckCa_Func_0800 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Online_CheckCa_Func_0900
     * @tc.number SUB_Security_Cert_Framework_Online_CheckCa_Func_0900
     * @tc.desc   The Online CRL, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Online_CheckCa_Func_0900",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let x509CertChain: cert.X509CertChain = await createCertChain(caChainRevokedEntry);
          let x509Cert: cert.X509Cert = await createX509Cert(caTrustCert);
          const param: cert.CertChainValidationParameters = {
            trustAnchors: [{
              CACert: x509Cert
            }],
            revocationCheckParam: {
              options: [
                cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_ACCESS_NETWORK,
                cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_CHECK_INTERMEDIATE_CA_ONLINE
              ],
            }
          };
          await x509CertChain.validate(param);
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`[XTS] CheckCa_Func_0900 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Online_CheckCa_Func_1000
     * @tc.number SUB_Security_Cert_Framework_Online_CheckCa_Func_1000
     * @tc.desc   The Online CRL, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Online_CheckCa_Func_1000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let x509CertChain: cert.X509CertChain = await createCertChain(caChainRevokedEntry2);
          let x509Cert: cert.X509Cert = await createX509Cert(caTrustCert2);
          const param: cert.CertChainValidationParameters = {
            trustAnchors: [{
              CACert: x509Cert
            }],
            revocationCheckParam: {
              options: [
                cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_ACCESS_NETWORK,
                cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_CHECK_INTERMEDIATE_CA_ONLINE
              ],
            }
          };
          await x509CertChain.validate(param);
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`[XTS] CheckCa_Func_1000 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Online_CheckCa_Func_1100
     * @tc.number SUB_Security_Cert_Framework_Online_CheckCa_Func_1100
     * @tc.desc   The Online CRL, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Online_CheckCa_Func_1100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let x509CertChain: cert.X509CertChain = await createCertChain(caChainRevokedEntry3);
          let x509Cert: cert.X509Cert = await createX509Cert(caTrustCert2);
          const param: cert.CertChainValidationParameters = {
            trustAnchors: [{
              CACert: x509Cert
            }],
            revocationCheckParam: {
              options: [
                cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_ACCESS_NETWORK,
                cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_CHECK_INTERMEDIATE_CA_ONLINE
              ],
            }
          };
          await x509CertChain.validate(param);
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`[XTS] CheckCa_Func_1100 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Online_CheckCa_Func_1200
     * @tc.number SUB_Security_Cert_Framework_Online_CheckCa_Func_1200
     * @tc.desc   The Online CRL, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Online_CheckCa_Func_1200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          // openssl ocsp -port 7777 -index index.txt -CA ecdsa_intermediate.crt -rkey ecdsa_intermediate.key -rsigner ecdsa_intermediate.crt -text
          let x509CertChain: cert.X509CertChain = await createCertChain(caChainWithOcsp2);
          let x509Cert: cert.X509Cert = await createX509Cert(caTrustCertWithOcsp2);
          const param: cert.CertChainValidationParameters = {
            trustAnchors: [{
              CACert: x509Cert
            }],
            revocationCheckParam: {
              options: [
                cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_ACCESS_NETWORK,
                cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_PREFER_OCSP,
                cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_CHECK_INTERMEDIATE_CA_ONLINE
              ],
            }
          };
          await x509CertChain.validate(param);
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`[XTS] CheckCa_Func_1200 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Online_CheckCa_Func_1300
     * @tc.number SUB_Security_Cert_Framework_Online_CheckCa_Func_1300
     * @tc.desc   The Online CRL, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Online_CheckCa_Func_1300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          // openssl ocsp -port 7766 -index index.txt -CA ecdsa_root.crt -rkey ecdsa_root.key -rsigner ecdsa_root.crt -text
          let x509CertChain: cert.X509CertChain = await createCertChain(caChainWithOcsp3);
          let x509Cert: cert.X509Cert = await createX509Cert(caTrustCertWithOcsp4); // 不匹配
          const param: cert.CertChainValidationParameters = {
            trustAnchors: [{
              CACert: x509Cert
            }],
            revocationCheckParam: {
              options: [
                cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_ACCESS_NETWORK,
                cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_PREFER_OCSP,
                cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_CHECK_INTERMEDIATE_CA_ONLINE
              ],
            }
          };
          await x509CertChain.validate(param);
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`[XTS] CheckCa_Func_1300 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Online_CheckCa_Func_1400
     * @tc.number SUB_Security_Cert_Framework_Online_CheckCa_Func_1400
     * @tc.desc   The Online CRL, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Online_CheckCa_Func_1400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          // openssl ocsp -port 5555 -index index.txt -CA ecdsa_intermediate.crt -rkey ecdsa_intermediate.key -rsigner ecdsa_intermediate.crt -text
          // openssl ocsp -port 5553 -index index.txt -CA ecdsa_root.crt -rkey ecdsa_root.key -rsigner ecdsa_root.crt -text
          let x509CertChain: cert.X509CertChain = await createCertChain(interCertRevokedChain);
          let x509Cert: cert.X509Cert = await createX509Cert(interCertRevokedChainTrustCert);
          const param: cert.CertChainValidationParameters = {
            trustAnchors: [{
              CACert: x509Cert
            }],
            revocationCheckParam: {
              options: [
                cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_ACCESS_NETWORK,
                cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_PREFER_OCSP,
                cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_CHECK_INTERMEDIATE_CA_ONLINE
              ],
            }
          };
          await x509CertChain.validate(param);
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`[XTS] CheckCa_Func_1400 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Online_CheckCa_Func_1500
     * @tc.number SUB_Security_Cert_Framework_Online_CheckCa_Func_1500
     * @tc.desc   The Online CRL, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Online_CheckCa_Func_1500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          // openssl ocsp -port 5554 -index index.txt -CA ecdsa_intermediate.crt -rkey ecdsa_intermediate.key -rsigner ecdsa_intermediate.crt -text
          let x509CertChain: cert.X509CertChain = await createCertChain(leafCertRevokedChain);
          let x509Cert: cert.X509Cert = await createX509Cert(leafCertRevokedChainTrustCert);
          const param: cert.CertChainValidationParameters = {
            trustAnchors: [{
              CACert: x509Cert
            }],
            revocationCheckParam: {
              options: [
                cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_ACCESS_NETWORK,
                cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_PREFER_OCSP,
              ],
              ocspResponderCert: x509Cert
            }
          };
          await x509CertChain.validate(param);
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`[XTS] CheckCa_Func_1500 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
        done();
      });


  })
}