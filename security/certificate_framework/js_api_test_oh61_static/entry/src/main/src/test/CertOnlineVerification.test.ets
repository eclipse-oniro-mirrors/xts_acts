/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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
import {
  CHAIN_SM2_8_1_CRL_EXPIRED_PEM,
  CHAIN_SM2_8_1_CRL_PEM,
  CHAIN_SM2_8_1_CRL_YET_PEM,
  CHAIN_SM2_8_1_PEM,
  CHAIN_SM2_8_2_PEM,
  CHAIN_SM2_8_3_PEM,
  CHAIN_SM2_DEFAULT2_3_1_PEM,
  CHAIN_SM2_DEFAULT3_3_1_PEM,
  CHAIN_SM2_DEFAULT_3_1_OCSP_RESPONSE_GOOD_DER,
  CHAIN_SM2_DEFAULT_3_1_OCSP_RESPONSE_UNKNOWN_DER,
  CHAIN_SM2_DEFAULT_3_1_PEM,
  CHAIN_SM2_DEFAULT_3_2_CRL_PEM,
  CHAIN_SM2_DEFAULT_3_2_PEM, CHAIN_SM2_DEFAULT_3_3_PEM,
  CHAIN_SM2_NO_USERID_3_1_PEM,
  CHAIN_SM2_NO_USERID_3_2_PEM,
  CHAIN_SM2_NO_USERID_3_3_PEM,
  CHAIN_SM2_NO_USERID_REMOVE_CRL_3_2_PEM,
  CHAIN_SM2_NO_USERID_REVOKED_CRL_3_3_PEM,
  CHAIN_SM2_NO_USERID_ERROR_OCSP_3_2_DER,
  CHAIN_SM2_NO_USERID_ERROR_OCSP_3_3_DER,
  CHAIN_SM2_NO_USERID_OCSP_3_2_DER,
  CHAIN_SM2_NO_USERID_OCSP_3_3_DER} from "./utils/chain/chain";
import { createX509CertPem, createX509CrlPem, sleep } from "./utils/common/common";
import wifiMg from '@ohos.wifiManager';


export default function certFrameworkCertCheckOnlineCaTestUnit() {
  describe("certFrameworkCertCheckOnlineCaTestUnit", (): void => {

    beforeEach(async (): void => {
      if(!wifiMg.isWifiActive()) {
        console.info("=========>>>>>>> wifi_test/enable wifi");
        console.error("=========>>>>>>> WLAN Network Error");
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
      if (data.chload >= 900 || data.rssi <= -80) {
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
        } catch (error) {
          console.error(`[XTS] CheckCa_Func_0100 “${error}“, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
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
        } catch (error) {
          console.error(`[XTS] CheckCa_Func_0200 “${error}“, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cert.CertResult.INVALID_PARAMS);
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
        } catch (error) {
          console.error(`[XTS] CheckCa_Func_0300 “${error}“, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cert.CertResult.INVALID_PARAMS);
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
        } catch (error) {
          console.error(`[XTS] CheckCa_Func_0400 “${error}“, error code: ${error.code}`);
          if (error.code != cert.CertResult.ERR_CERT_SIGNATURE_FAILURE) {
            expect((error as BusinessError).code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION); // 网络原因返回错误码
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
        } catch (error) {
          console.error(`[XTS] CheckCa_Func_0500 “${error}“, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
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
        } catch (error) {
          console.error(`[XTS] CheckCa_Func_0600 “${error}“, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
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
        } catch (error) {
          console.error(`[XTS] CheckCa_Func_0700 “${error}“, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
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
        } catch (error) {
          console.error(`[XTS] CheckCa_Func_0800 “${error}“, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
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
        } catch (error) {
          console.error(`[XTS] CheckCa_Func_0900 “${error}“, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
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
        } catch (error) {
          console.error(`[XTS] CheckCa_Func_1000 “${error}“, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
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
        } catch (error) {
          console.error(`[XTS] CheckCa_Func_1100 “${error}“, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
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
        } catch (error) {
          console.error(`[XTS] CheckCa_Func_1200 “${error}“, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
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
        } catch (error) {
          console.error(`[XTS] CheckCa_Func_1300 “${error}“, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
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
        } catch (error) {
          console.error(`[XTS] CheckCa_Func_1400 “${error}“, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
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
        } catch (error) {
          console.error(`[XTS] CheckCa_Func_1500 “${error}“, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_New_Chain_Func_8400
     * @tc.number SUB_Security_Cert_Framework_New_Chain_Func_8400
     * @tc.desc   完整校验，设置待校验实体证书，不信任中间证书，信任根证书，开启OCSP吊销检查且允许在线OCSP检查且吊销的功能测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_New_Chain_Func_8400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "PKIX";
          let rootDefaultX509CertGm: cert.X509Cert = await createX509CertPem(CHAIN_SM2_DEFAULT_3_3_PEM);
          let interDefaultX509CertGm: cert.X509Cert = await createX509CertPem(CHAIN_SM2_DEFAULT_3_2_PEM);
          let leafDefaultX509CertGm: cert.X509Cert = await createX509CertPem(CHAIN_SM2_DEFAULT_3_1_PEM);
          let validatorParams: cert.X509CertValidatorParams = {
            trustedCerts: [rootDefaultX509CertGm],
            untrustedCerts: [interDefaultX509CertGm],
            revokedParams: {
              revocationFlags: [cert.CertRevocationFlag.CERT_REVOCATION_OCSP_CHECK],
              ocspResponses: [
                CHAIN_SM2_DEFAULT_3_1_OCSP_RESPONSE_GOOD_DER
              ], // 本地未吊销不继续在线检查，虽然在线已吊销
              allowOcspCheckOnline: true
            }
          };
          let validator: cert.CertChainValidator = cert.createCertChainValidator(algName);
          let chainResult: cert.VerifyCertResult = await validator.validate(leafDefaultX509CertGm, validatorParams);
          expect(chainResult.certChain.length).assertEqual(3);
        } catch (error) {
          console.error(`"${error}", error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_New_Chain_Func_8500
     * @tc.number SUB_Security_Cert_Framework_New_Chain_Func_8500
     * @tc.desc   完整校验，设置待校验实体证书，不信任中间证书，信任根证书，开启OCSP吊销检查且允许在线OCSP检查且不知道证书状态的功能测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_New_Chain_Func_8500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "PKIX";
          let rootDefaultX509CertGm: cert.X509Cert = await createX509CertPem(CHAIN_SM2_DEFAULT_3_3_PEM);
          let interDefaultX509CertGm: cert.X509Cert = await createX509CertPem(CHAIN_SM2_DEFAULT_3_2_PEM);
          let leafDefault2X509CertGm: cert.X509Cert = await createX509CertPem(CHAIN_SM2_DEFAULT2_3_1_PEM);
          let validatorParams: cert.X509CertValidatorParams = {
            trustedCerts: [rootDefaultX509CertGm],
            untrustedCerts: [interDefaultX509CertGm],
            revokedParams: {
              revocationFlags: [
                cert.CertRevocationFlag.CERT_REVOCATION_OCSP_CHECK,
                cert.CertRevocationFlag.CERT_REVOCATION_PREFER_OCSP
              ],
              ocspResponses: [
                CHAIN_SM2_DEFAULT_3_1_OCSP_RESPONSE_UNKNOWN_DER
              ], // 本地吊销检查不知道证书吊销状态依旧不继续在线检查
              allowOcspCheckOnline: true
            }
          };
          let validator: cert.CertChainValidator = cert.createCertChainValidator(algName);
          await validator.validate(leafDefault2X509CertGm, validatorParams);
          expect(null).assertFail();
        } catch (error) {
          console.error(`"${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_OCSP_CERT_STATUS_UNKNOWN);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_New_Chain_Func_8600
     * @tc.number SUB_Security_Cert_Framework_New_Chain_Func_8600
     * @tc.desc   完整校验，设置待校验实体证书，不信任中间证书，信任根证书，开启OCSP和CRL吊销检查且优先OCSP检查的功能测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_New_Chain_Func_8600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "PKIX";
          let rootDefaultX509CertGm: cert.X509Cert = await createX509CertPem(CHAIN_SM2_DEFAULT_3_3_PEM);
          let interDefaultX509CertGm: cert.X509Cert = await createX509CertPem(CHAIN_SM2_DEFAULT_3_2_PEM);
          let leafDefaultX509CertGm: cert.X509Cert = await createX509CertPem(CHAIN_SM2_DEFAULT_3_1_PEM);

          let interDefaultX509CrlGm: cert.X509CRL = await createX509CrlPem(CHAIN_SM2_DEFAULT_3_2_CRL_PEM);

          let validatorParams: cert.X509CertValidatorParams = {
            trustedCerts: [rootDefaultX509CertGm],
            untrustedCerts: [interDefaultX509CertGm],
            revokedParams: {
              revocationFlags: [
                cert.CertRevocationFlag.CERT_REVOCATION_PREFER_OCSP,
                cert.CertRevocationFlag.CERT_REVOCATION_CRL_CHECK,
              ],
              ocspResponses: [
                CHAIN_SM2_DEFAULT_3_1_OCSP_RESPONSE_GOOD_DER
              ], // 本地未吊销不继续在线检查，虽然在线已吊销
              crls: [interDefaultX509CrlGm], // 已吊销
              allowOcspCheckOnline: true
            }
          };
          let validator: cert.CertChainValidator = cert.createCertChainValidator(algName);
          await validator.validate(leafDefaultX509CertGm, validatorParams);
          expect(null).assertFail();
        } catch (error) {
          console.error(`"${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_CERT_HAS_REVOKED);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_New_Chain_Func_8700
     * @tc.number SUB_Security_Cert_Framework_New_Chain_Func_8700
     * @tc.desc   完整校验，设置待校验实体证书，不信任中间证书，信任根证书，开启OCSP和CRL吊销检查且优先OCSP检查的功能测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_New_Chain_Func_8700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          // openssl ocsp -port 7771 -index index.txt -CA sm2_intermediate_default.crt -rkey sm2_intermediate.key -rsigner sm2_intermediate_default.crt -text
          // openssl ocsp -issuer sm2_intermediate_default.crt -cert sm2_entry_default3.crt -url http://localhost:7771 -resp_text
          let algName: string = "PKIX";
          let rootDefaultX509CertGm: cert.X509Cert = await createX509CertPem(CHAIN_SM2_DEFAULT_3_3_PEM);
          let interDefaultX509CertGm: cert.X509Cert = await createX509CertPem(CHAIN_SM2_DEFAULT_3_2_PEM);
          let leafDefaultX509CertGm: cert.X509Cert = await createX509CertPem(CHAIN_SM2_DEFAULT3_3_1_PEM); // ocsp在线吊销

          let interDefaultX509CrlGm: cert.X509CRL = await createX509CrlPem(CHAIN_SM2_DEFAULT_3_2_CRL_PEM);

          let validatorParams: cert.X509CertValidatorParams = {
            trustedCerts: [rootDefaultX509CertGm],
            untrustedCerts: [interDefaultX509CertGm],
            revokedParams: {
              revocationFlags: [
                cert.CertRevocationFlag.CERT_REVOCATION_OCSP_CHECK,
                cert.CertRevocationFlag.CERT_REVOCATION_PREFER_OCSP,
                cert.CertRevocationFlag.CERT_REVOCATION_CRL_CHECK,
              ],
              crls: [interDefaultX509CrlGm], // 未吊销
              allowOcspCheckOnline: true // 已吊销
            }
          };
          let validator: cert.CertChainValidator = cert.createCertChainValidator(algName);
          await validator.validate(leafDefaultX509CertGm, validatorParams);
          expect(null).assertFail();
        } catch (error) {
          console.error(`"${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_CERT_HAS_REVOKED);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_New_Chain_Func_9000
     * @tc.number SUB_Security_Cert_Framework_New_Chain_Func_9000
     * @tc.desc   部分证书链校验，设置待校验实体证书，不信任中间证书1，信任中间证书2，开启CRL吊销检查，CRL已过期的功能测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_New_Chain_Func_9000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "PKIX";
          // 证书链 leaf -> inter1 -> inter2
          let inter2X509CertGm: cert.X509Cert = await createX509CertPem(CHAIN_SM2_8_3_PEM);
          let inter1X509CertGm: cert.X509Cert = await createX509CertPem(CHAIN_SM2_8_2_PEM);
          let leafX509CertGm: cert.X509Cert = await createX509CertPem(CHAIN_SM2_8_1_PEM);

          let leafExpiredX509CrlGm: cert.X509CRL = await createX509CrlPem(CHAIN_SM2_8_1_CRL_EXPIRED_PEM);

          let validatorParams: cert.X509CertValidatorParams = {
            trustedCerts: [inter2X509CertGm],
            untrustedCerts: [inter1X509CertGm],
            revokedParams: {
              revocationFlags: [
                cert.CertRevocationFlag.CERT_REVOCATION_CRL_CHECK,
              ],
              crls: [leafExpiredX509CrlGm], // 已过期
            },
            partialChain: true
          };
          let validator: cert.CertChainValidator = cert.createCertChainValidator(algName);
          await validator.validate(leafX509CertGm, validatorParams);
          expect(null).assertFail();
        } catch (error) {
          console.error(`"${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_CRL_HAS_EXPIRED);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_New_Chain_Func_9100
     * @tc.number SUB_Security_Cert_Framework_New_Chain_Func_9100
     * @tc.desc   部分证书链校验，设置待校验实体证书，不信任中间证书1，信任中间证书2，开启CRL吊销检查，CRL未生效的功能测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_New_Chain_Func_9100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "PKIX";
          // 证书链 leaf -> inter1 -> inter2
          let inter2X509CertGm: cert.X509Cert = await createX509CertPem(CHAIN_SM2_8_3_PEM);
          let inter1X509CertGm: cert.X509Cert = await createX509CertPem(CHAIN_SM2_8_2_PEM);
          let leafX509CertGm: cert.X509Cert = await createX509CertPem(CHAIN_SM2_8_1_PEM);

          let leafYetX509CrlGm: cert.X509CRL = await createX509CrlPem(CHAIN_SM2_8_1_CRL_YET_PEM);

          let validatorParams: cert.X509CertValidatorParams = {
            trustedCerts: [inter2X509CertGm],
            untrustedCerts: [inter1X509CertGm],
            revokedParams: {
              revocationFlags: [
                cert.CertRevocationFlag.CERT_REVOCATION_CRL_CHECK,
              ],
              crls: [leafYetX509CrlGm], // 未生效
            },
            partialChain: true
          };
          let validator: cert.CertChainValidator = cert.createCertChainValidator(algName);
          await validator.validate(leafX509CertGm, validatorParams);
          expect(null).assertFail();
        } catch (error) {
          console.error(`"${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_CRL_NOT_YET_VALID);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_New_Chain_Func_9200
     * @tc.number SUB_Security_Cert_Framework_New_Chain_Func_9200
     * @tc.desc   部分证书链校验，设置待校验实体证书，信任实体证书，开启CRL吊销检查，找不到leaf吊销列表的颁发者的功能测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_New_Chain_Func_9200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "PKIX";
          // 证书链 leaf
          let leafX509CertGm: cert.X509Cert = await createX509CertPem(CHAIN_SM2_8_1_PEM);
          let leafX509CrlGm: cert.X509CRL = await createX509CrlPem(CHAIN_SM2_8_1_CRL_PEM);

          let validatorParams: cert.X509CertValidatorParams = {
            trustedCerts: [leafX509CertGm],
            revokedParams: {
              revocationFlags: [
                cert.CertRevocationFlag.CERT_REVOCATION_CRL_CHECK,
              ],
              crls: [leafX509CrlGm],
            },
            partialChain: true
          };
          let validator: cert.CertChainValidator = cert.createCertChainValidator(algName);
          await validator.validate(leafX509CertGm, validatorParams);
          expect(null).assertFail();
        } catch (error) {
          console.error(`"${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_CRL_ISSUER_NOT_FOUND);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_New_Chain_Func_9300
     * @tc.number SUB_Security_Cert_Framework_New_Chain_Func_9300
     * @tc.desc   完整校验，设置待校验实体证书，不信任中间证书，信任根证书，开启OCSP、设置不一致的digest的功能测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_New_Chain_Func_9300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "PKIX";
          let rootDefaultX509CertGm: cert.X509Cert = await createX509CertPem(CHAIN_SM2_DEFAULT_3_3_PEM);
          let interDefaultX509CertGm: cert.X509Cert = await createX509CertPem(CHAIN_SM2_DEFAULT_3_2_PEM);
          let leafDefaultX509CertGm: cert.X509Cert = await createX509CertPem(CHAIN_SM2_DEFAULT_3_1_PEM);
          let validatorParams: cert.X509CertValidatorParams = {
            trustedCerts: [rootDefaultX509CertGm],
            untrustedCerts: [interDefaultX509CertGm],
            revokedParams: {
              revocationFlags: [
                cert.CertRevocationFlag.CERT_REVOCATION_OCSP_CHECK
              ],
              ocspResponses: [
                CHAIN_SM2_DEFAULT_3_1_OCSP_RESPONSE_GOOD_DER
              ], // 本地未吊销
              ocspDigest: cert.OcspDigest.SHA384 // 不一致，从ocspResponses解析ocspDigest
            }
          };
          let validator: cert.CertChainValidator = cert.createCertChainValidator(algName);
          let chainResult: cert.VerifyCertResult = await validator.validate(leafDefaultX509CertGm, validatorParams);
          expect(chainResult.certChain.length).assertEqual(3);
        } catch (error) {
          console.error(`"${error}", error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_New_Chain_Func_9400
     * @tc.number SUB_Security_Cert_Framework_New_Chain_Func_9400
     * @tc.desc   完整校验，设置待校验实体证书，不信任中间证书，信任根证书，开启OCSP和CRL吊销检查且优先OCSP检查的功能测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_New_Chain_Func_9400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          // openssl ocsp -port 7771 -index index.txt -CA sm2_intermediate_default.crt -rkey sm2_intermediate.key -rsigner sm2_intermediate_default.crt -text
          // openssl ocsp -issuer sm2_intermediate_default.crt -cert sm2_entry_default3.crt -url http://localhost:7771 -resp_text
          let algName: string = "PKIX";
          let ocspDigests: cert.OcspDigest[] = [
            cert.OcspDigest.SHA1, cert.OcspDigest.SHA224, cert.OcspDigest.SHA256,
            cert.OcspDigest.SHA384, cert.OcspDigest.SHA512
          ]
          let rootDefaultX509CertGm: cert.X509Cert = await createX509CertPem(CHAIN_SM2_DEFAULT_3_3_PEM);
          let interDefaultX509CertGm: cert.X509Cert = await createX509CertPem(CHAIN_SM2_DEFAULT_3_2_PEM);
          let leafDefaultX509CertGm: cert.X509Cert = await createX509CertPem(CHAIN_SM2_DEFAULT3_3_1_PEM); // ocsp在线吊销
          for (let index = 0; index < ocspDigests.length; index++) {
            try {
              let validatorParams: cert.X509CertValidatorParams = {
                trustedCerts: [rootDefaultX509CertGm],
                untrustedCerts: [interDefaultX509CertGm],
                revokedParams: {
                  revocationFlags: [
                    cert.CertRevocationFlag.CERT_REVOCATION_OCSP_CHECK,
                    cert.CertRevocationFlag.CERT_REVOCATION_PREFER_OCSP,
                  ],
                  allowOcspCheckOnline: true, // 已吊销
                  ocspDigest: ocspDigests[index]
                }
              };
              let validator: cert.CertChainValidator = cert.createCertChainValidator(algName);
              await validator.validate(leafDefaultX509CertGm, validatorParams);
              expect(null).assertFail();
            } catch (error) {
              console.error(`"${error}", error code: ${error.code}`);
              expect(error.code).assertEqual(cert.CertResult.ERR_CERT_HAS_REVOKED);
            }
          }
        } catch (error) {
          console.error(`"${error}", error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_New_Chain_Func_9600
     * @tc.number SUB_Security_Cert_Framework_New_Chain_Func_9600
     * @tc.desc   完整校验，设置待校验实体证书，不信任中间证书，信任根证书，开启本地所有证书OCSP和CRL吊销检查且优先OCSP检查的功能测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_New_Chain_Func_9600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "PKIX";
          let rootX509CertGm: cert.X509Cert = await createX509CertPem(CHAIN_SM2_NO_USERID_3_3_PEM);
          let interX509CertGm: cert.X509Cert = await createX509CertPem(CHAIN_SM2_NO_USERID_3_2_PEM);
          let leafX509CertGm: cert.X509Cert = await createX509CertPem(CHAIN_SM2_NO_USERID_3_1_PEM);

          let rootX509CrlGm: cert.X509CRL = await createX509CrlPem(CHAIN_SM2_NO_USERID_REVOKED_CRL_3_3_PEM);
          let interX509CrlGm: cert.X509CRL = await createX509CrlPem(CHAIN_SM2_NO_USERID_REMOVE_CRL_3_2_PEM);

          let validatorParams: cert.X509CertValidatorParams = {
            trustedCerts: [rootX509CertGm],
            untrustedCerts: [interX509CertGm],
            revokedParams: {
              revocationFlags: [
                cert.CertRevocationFlag.CERT_REVOCATION_OCSP_CHECK,
                cert.CertRevocationFlag.CERT_REVOCATION_PREFER_OCSP,
                cert.CertRevocationFlag.CERT_REVOCATION_CRL_CHECK,
                cert.CertRevocationFlag.CERT_REVOCATION_CHECK_ALL_CERT
              ],
              crls: [rootX509CrlGm, interX509CrlGm], // 叶子证书吊销又撤销，中间证书现在吊销
              ocspResponses: [
                CHAIN_SM2_NO_USERID_ERROR_OCSP_3_3_DER, // 1.1.1签名值， 3.0.9验签失败
                CHAIN_SM2_NO_USERID_ERROR_OCSP_3_2_DER // 1.1.1签名值， 3.0.9验签失败
              ] // 无吊销
            }
          };
          let validator: cert.CertChainValidator = cert.createCertChainValidator(algName);
          await validator.validate(leafX509CertGm, validatorParams);
          expect(null).assertFail();
        } catch (error) {
          console.error(`"${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_OCSP_SIGNATURE_FAILURE);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_New_Chain_Func_9700
     * @tc.number SUB_Security_Cert_Framework_New_Chain_Func_9700
     * @tc.desc   完整校验，设置待校验实体证书，不信任中间证书，信任根证书，开启本地所有证书OCSP和CRL吊销检查且优先OCSP检查的功能测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_New_Chain_Func_9700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "PKIX";
          let rootX509CertGm: cert.X509Cert = await createX509CertPem(CHAIN_SM2_NO_USERID_3_3_PEM);
          let interX509CertGm: cert.X509Cert = await createX509CertPem(CHAIN_SM2_NO_USERID_3_2_PEM);
          let leafX509CertGm: cert.X509Cert = await createX509CertPem(CHAIN_SM2_NO_USERID_3_1_PEM);

          let rootX509CrlGm: cert.X509CRL = await createX509CrlPem(CHAIN_SM2_NO_USERID_REVOKED_CRL_3_3_PEM);
          let interX509CrlGm: cert.X509CRL = await createX509CrlPem(CHAIN_SM2_NO_USERID_REMOVE_CRL_3_2_PEM);

          let validatorParams: cert.X509CertValidatorParams = {
            trustedCerts: [rootX509CertGm],
            untrustedCerts: [interX509CertGm],
            revokedParams: {
              revocationFlags: [
                cert.CertRevocationFlag.CERT_REVOCATION_OCSP_CHECK,
                cert.CertRevocationFlag.CERT_REVOCATION_PREFER_OCSP,
                cert.CertRevocationFlag.CERT_REVOCATION_CRL_CHECK,
                cert.CertRevocationFlag.CERT_REVOCATION_CHECK_ALL_CERT
              ],
              crls: [rootX509CrlGm, interX509CrlGm], // 叶子证书吊销又撤销，中间证书现在吊销
              ocspResponses: [
                CHAIN_SM2_NO_USERID_OCSP_3_3_DER,
                CHAIN_SM2_NO_USERID_OCSP_3_2_DER
              ] // 无吊销
            }
          };
          let validator: cert.CertChainValidator = cert.createCertChainValidator(algName);
          let chainResult: cert.VerifyCertResult = await validator.validate(leafX509CertGm, validatorParams);
          expect(chainResult.certChain.length).assertEqual(3);
        } catch (error) {
          console.error(`"${error}", error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

  })
}