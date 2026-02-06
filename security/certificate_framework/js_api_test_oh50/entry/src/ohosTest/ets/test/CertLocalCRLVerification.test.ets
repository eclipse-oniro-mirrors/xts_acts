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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, TestType, Size, Level, expect } from "@ohos/hypium";
import { cert } from "@kit.DeviceCertificateKit";
import { certChainPem, createCertChain, createX509Cert, createX509CRL, intermediateCrl,
  certChainPem3,
  trustRootCertPem,
  intermediateOtherCrl,
  certChainPem2,
  rootCrl,
  certChainPem4,
  intermediateCrlExpired
} from "./utils/crl/crl";


export default function certFrameworkCertCheckCrlTestUnit() {
  describe("certFrameworkCertCheckCrlTestUnit", () => {
    beforeAll(async () => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    });
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    });
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    });
    afterAll(async () => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertCrl_Func_0100
     * @tc.number SUB_Security_Cert_Framework_CertCrl_Func_0100
     * @tc.desc   The Local CRL, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CertCrl_Func_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let x509CertChain: cert.X509CertChain = await createCertChain(certChainPem);
          let x509Cert: cert.X509Cert = await createX509Cert(trustRootCertPem);
          let caCollection: cert.CertCRLCollection = await createX509CRL(intermediateCrl);
          const param: cert.CertChainValidationParameters = {
            date: '20250926080000Z',
            trustAnchors: [{
              CACert: x509Cert
            }],
            certCRLs: [caCollection],
            revocationCheckParam: {
              options: [
                cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_LOCAL_CRL_ONLY_CHECK_END_ENTITY_CERT
              ],
            }
          };
          await x509CertChain.validate(param);
          expect(null).assertFail();
        } catch (error) {
          console.error(`[XTS] Crl_Func_0100 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertCrl_Func_0200
     * @tc.number SUB_Security_Cert_Framework_CertCrl_Func_0200
     * @tc.desc   The Local CRL, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CertCrl_Func_0200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let x509CertChain: cert.X509CertChain = await createCertChain(certChainPem);
          let x509Cert: cert.X509Cert = await createX509Cert(trustRootCertPem);
          let caCollection: cert.CertCRLCollection = await createX509CRL(intermediateCrl);
          const param: cert.CertChainValidationParameters = {
            trustAnchors: [{
              CACert: x509Cert
            }],
            certCRLs: [caCollection]
          };
          await x509CertChain.validate(param);
          expect(null).assertFail();
        } catch (error) {
          console.error(`[XTS] Crl_Func_0200 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertCrl_Func_0300
     * @tc.number SUB_Security_Cert_Framework_CertCrl_Func_0300
     * @tc.desc   The Local CRL, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CertCrl_Func_0300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let x509CertChain: cert.X509CertChain = await createCertChain(certChainPem3);
          let x509Cert: cert.X509Cert = await createX509Cert(trustRootCertPem);
          let caCollection: cert.CertCRLCollection = await createX509CRL(intermediateOtherCrl);
          const param: cert.CertChainValidationParameters = {
            date: '20250926080000Z',
            trustAnchors: [{
              CACert: x509Cert
            }],
            certCRLs: [caCollection],
            revocationCheckParam: {
              options: [
                cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_LOCAL_CRL_ONLY_CHECK_END_ENTITY_CERT
              ],
            }
          };
          let result: cert.CertChainValidationResult = await x509CertChain.validate(param);
          expect(result.entityCert).not().assertNull();
        } catch (error) {
          console.error(`[XTS] Crl_Func_0300 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertCrl_Func_0400
     * @tc.number SUB_Security_Cert_Framework_CertCrl_Func_0400
     * @tc.desc   The Local CRL, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CertCrl_Func_0400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let x509CertChain: cert.X509CertChain = await createCertChain(certChainPem2);
          let x509Cert: cert.X509Cert = await createX509Cert(trustRootCertPem);
          let caCollection: cert.CertCRLCollection = await createX509CRL(rootCrl);
          const param: cert.CertChainValidationParameters = {
            date: '20250926080000Z',
            trustAnchors: [{
              CACert: x509Cert
            }],
            certCRLs: [caCollection],
            revocationCheckParam: {
              options: [
                cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_LOCAL_CRL_ONLY_CHECK_END_ENTITY_CERT
              ],
            }
          };
          let result: cert.CertChainValidationResult = await x509CertChain.validate(param);
          expect(result.entityCert).not().assertNull();
        } catch (error) {
          console.error(`[XTS] Crl_Func_0400 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertCrl_Func_0500
     * @tc.number SUB_Security_Cert_Framework_CertCrl_Func_0500
     * @tc.desc   The Local CRL, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CertCrl_Func_0500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let x509CertChain: cert.X509CertChain = await createCertChain(certChainPem2);
          let x509Cert: cert.X509Cert = await createX509Cert(trustRootCertPem);
          let caCollection: cert.CertCRLCollection = await createX509CRL(rootCrl);
          const param: cert.CertChainValidationParameters = {
            date: '20250926080000Z',
            trustAnchors: [{
              CACert: x509Cert
            }],
            certCRLs: [caCollection],
          };
          await x509CertChain.validate(param);
          expect(null).assertFail();
        } catch (error) {
          console.error(`[XTS] Crl_Func_0500 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertCrl_Func_0600
     * @tc.number SUB_Security_Cert_Framework_CertCrl_Func_0600
     * @tc.desc   The Local CRL, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CertCrl_Func_0600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let x509CertChain: cert.X509CertChain = await createCertChain(certChainPem);
          let x509Cert: cert.X509Cert = await createX509Cert(trustRootCertPem);
          let caCollection: cert.CertCRLCollection = await createX509CRL(intermediateCrl);
          const param: cert.CertChainValidationParameters = {
            date: '20250926080000Z',
            trustAnchors: [{
              CACert: x509Cert
            }],
            certCRLs: [caCollection],
            revocationCheckParam: {
              options: [
                cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_ACCESS_NETWORK,
                cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_PREFER_OCSP,
                cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_FALLBACK_LOCAL,
                cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_LOCAL_CRL_ONLY_CHECK_END_ENTITY_CERT // 实体证书被吊销
              ],
            },
          };
          await x509CertChain.validate(param);
          expect(null).assertFail();
        } catch (error) {
          console.error(`[XTS] Crl_Func_0600 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION); // 期望返回401
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertCrl_Func_0700
     * @tc.number SUB_Security_Cert_Framework_CertCrl_Func_0700
     * @tc.desc   The Local CRL, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CertCrl_Func_0700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let x509CertChain: cert.X509CertChain = await createCertChain(certChainPem);
          let x509Cert: cert.X509Cert = await createX509Cert(trustRootCertPem);
          let caCollection: cert.CertCRLCollection = await createX509CRL(intermediateCrl);
          const param: cert.CertChainValidationParameters = {
            date: '20250926080000Z',
            trustAnchors: [{
              CACert: x509Cert
            }],
            certCRLs: [caCollection],
            revocationCheckParam: {
              options: [
                cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_FALLBACK_NO_PREFER, // 实体证书被吊销
              ]
            },
          };
          await x509CertChain.validate(param);
          expect(null).assertFail();
        } catch (error) {
          console.error(`[XTS] Crl_Func_0700 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS); // 实体证书被吊销返回401
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertCrl_Func_0800
     * @tc.number SUB_Security_Cert_Framework_CertCrl_Func_0800
     * @tc.desc   The Local CRL, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CertCrl_Func_0800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let x509CertChain: cert.X509CertChain = await createCertChain(certChainPem2);
          let x509Cert: cert.X509Cert = await createX509Cert(trustRootCertPem);
          let caCollection: cert.CertCRLCollection = await createX509CRL(rootCrl);
          const param: cert.CertChainValidationParameters = {
            date: '20250926080000Z',
            trustAnchors: [{
              CACert: x509Cert
            }],
            certCRLs: [caCollection],
            revocationCheckParam: {
              options: [
                cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_ACCESS_NETWORK,
                cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_FALLBACK_LOCAL,
                cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_LOCAL_CRL_ONLY_CHECK_END_ENTITY_CERT
              ],
            }
          };
          let result: cert.CertChainValidationResult = await x509CertChain.validate(param);
          expect(result.entityCert).not().assertNull();
        } catch (error) {
          console.error(`[XTS] Crl_Func_0800 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertCrl_Func_0900
     * @tc.number SUB_Security_Cert_Framework_CertCrl_Func_0900
     * @tc.desc   The Local CRL, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CertCrl_Func_0900",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let x509CertChain: cert.X509CertChain = await createCertChain(certChainPem4); // 实体证书吊销后又被撤销
          let x509Cert: cert.X509Cert = await createX509Cert(trustRootCertPem);
          let caCollection: cert.CertCRLCollection = await createX509CRL(intermediateCrl);
          const param: cert.CertChainValidationParameters = {
            date: '20250926080000Z',
            trustAnchors: [{
              CACert: x509Cert
            }],
            certCRLs: [caCollection],
            revocationCheckParam: {
              options: [
                cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_LOCAL_CRL_ONLY_CHECK_END_ENTITY_CERT
              ],
            }
          };
          let result: cert.CertChainValidationResult = await x509CertChain.validate(param);
          expect(result.entityCert).not().assertNull();
        } catch (error) {
          console.error(`[XTS] Crl_Func_0900 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertCrl_Func_1000
     * @tc.number SUB_Security_Cert_Framework_CertCrl_Func_1000
     * @tc.desc   The Local CRL, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CertCrl_Func_1000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let x509CertChain: cert.X509CertChain = await createCertChain(certChainPem4);
          let x509Cert: cert.X509Cert = await createX509Cert(trustRootCertPem);
          let caCollection: cert.CertCRLCollection = await createX509CRL(intermediateCrlExpired); // 吊销列表过期
          const param: cert.CertChainValidationParameters = {
            date: '20250925100000Z',
            trustAnchors: [{
              CACert: x509Cert
            }],
            certCRLs: [caCollection],
            revocationCheckParam: {
              options: [
                cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_LOCAL_CRL_ONLY_CHECK_END_ENTITY_CERT
              ],
            }
          };
          await x509CertChain.validate(param);
          expect(null).assertFail();
        } catch (error) {
          console.error(`[XTS] Crl_Func_1000 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
        }
        done();
      });

  })
}