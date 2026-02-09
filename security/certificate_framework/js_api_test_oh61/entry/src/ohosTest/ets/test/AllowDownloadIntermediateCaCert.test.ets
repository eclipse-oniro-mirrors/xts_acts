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
import { createX509CertPem } from "./utils/common/common";
import { createCertChain } from "./utils/crl/crl";
import {
  CHAIN_1_1_HTTP_PEM,
  CHAIN_2_1_HTTP_PEM,
  CHAIN_2_2_HTTP_PEM,
  CHAIN_3_1_HTTP_NO_CA_PEM,
  CHAIN_3_1_HTTP_URLS_PEM,
  CHAIN_3_1_PEM,
  CHAIN_3_3_HTTP_3_EXPIRED_TIME_PEM,
  CHAIN_3_3_HTTP_4_URLS_PEM,
  CHAIN_3_3_HTTP_5_URLS_PEM,
  CHAIN_3_3_HTTP_6_URLS_PEM,
  CHAIN_3_3_HTTP_NO_CA_PEM,
  CHAIN_3_3_PEM,
  CHAIN_4_1_HTTP_PEM,
  CHAIN_4_1_PEM,
  CHAIN_4_2_HTTP_PEM,
  CHAIN_4_3_HTTPS_PEM,
  CHAIN_4_3_HTTP_PEM,
  CHAIN_4_3_PEM,
  CHAIN_4_4_HTTPS_PEM,
  CHAIN_4_4_HTTP_PEM,
  CHAIN_4_4_PEM,
  CHAIN_ECC_3_1_PEM,
  CHAIN_ECC_3_1_TIME_PEM,
  CHAIN_ECC_3_3_AIA_URIS_PEM,
  CHAIN_ECC_3_3_AIA_XXX_PEM,
  CHAIN_ECC_3_3_PEM,
  CHAIN_ECC_3_3_RESP_PEM,
  CHAIN_ECC_3_3_TIME_PEM,
  CHAIN_ECC_3_3_YET_PEM,
  CHAIN_ECC_4_1_PEM,
  CHAIN_ECC_4_3_PEM,
  CHAIN_ECC_4_4_PEM,
  CHAIN_ECC_7_1_PEM,
  CHAIN_ECC_7_7_PEM,
  CHAIN_ECC_8_1_PEM,
  CHAIN_ECC_8_8_PEM,
  CHAIN_GIT_CODE_INTER_PEM,
  CHAIN_GIT_CODE_LEAF_PEM,
  CHAIN_GIT_CODE_ROOT_PEM,
} from "./utils/chain/chain";


export default function certFrameworkCertAllowDownloadInterCaTestUnit() {
  describe("certFrameworkCertAllowDownloadInterCaTestUnit", () => {
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
     * @tc.name   SUB_Security_Cert_Framework_Allow_Download_Inter_CA_Func_0100
     * @tc.number SUB_Security_Cert_Framework_Allow_Download_Inter_CA_Func_0100
     * @tc.desc   不支持HTTPS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Allow_Download_Inter_CA_Func_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let rootCert: cert.X509Cert = await createX509CertPem(CHAIN_4_1_PEM);
          let x509CertChain: cert.X509CertChain = await createCertChain(CHAIN_4_4_HTTPS_PEM + CHAIN_4_3_HTTPS_PEM);
          const param: cert.CertChainValidationParameters = {
            trustAnchors: [
              {
                CACert: rootCert
              }
            ],
            revocationCheckParam: {
              options: [
                cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_ACCESS_NETWORK,
                cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_PREFER_OCSP,
                cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_CHECK_INTERMEDIATE_CA_ONLINE,
              ]
            },
            allowDownloadIntermediateCa: true
          };
          await x509CertChain.validate(param);
          expect(null).assertFail(); // https:HTTP routines::tls not enabled
        } catch (error) {
          console.error(`[XTS] Allow_Download_Inter_CA_Func_0100 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Allow_Download_Inter_CA_Func_0200
     * @tc.number SUB_Security_Cert_Framework_Allow_Download_Inter_CA_Func_0200
     * @tc.desc   开启下载中间证书能力，4级证书链缺失第3本和根证书，信任证书仅包含根证书，URL为页面，不是可下载的url
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Allow_Download_Inter_CA_Func_0200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let rootCert: cert.X509Cert = await createX509CertPem(CHAIN_4_1_PEM);
          let x509CertChain: cert.X509CertChain = await createCertChain(CHAIN_4_4_PEM + CHAIN_4_3_PEM);
          const param: cert.CertChainValidationParameters = {
            trustAnchors: [
              {
                CACert: rootCert
              }
            ],
            revocationCheckParam: {
              options: [
                cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_ACCESS_NETWORK,
                cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_PREFER_OCSP,
                cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_CHECK_INTERMEDIATE_CA_ONLINE,
              ]
            },
            allowDownloadIntermediateCa: true
          };
          await x509CertChain.validate(param);
          expect(null).assertFail();
        } catch (error) {
          console.error(`[XTS] Allow_Download_Inter_CA_Func_0200 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Allow_Download_Inter_CA_Func_0300
     * @tc.number SUB_Security_Cert_Framework_Allow_Download_Inter_CA_Func_0300
     * @tc.desc   开启下载中间证书能力，3级证书链缺失中间证书，信任证书仅包含根证书，http 重定向 https 问题
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Allow_Download_Inter_CA_Func_0300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let rootCert: cert.X509Cert = await createX509CertPem(CHAIN_3_1_PEM);
          let entryCert: cert.X509Cert = await createX509CertPem(CHAIN_3_3_PEM);
          let collection: cert.CertCRLCollection = cert.createCertCRLCollection([entryCert, rootCert]);
          let param: cert.CertChainBuildParameters = {
            certMatchParameters: {},
            validationParameters: {
              certCRLs: [collection],
              trustAnchors: [
                {
                  CACert: rootCert
                }
              ],
              allowDownloadIntermediateCa: true
            }
          }
          await cert.buildX509CertChain(param);
          expect(null).assertFail();
        } catch (error) {
          console.error(`[XTS] Allow_Download_Inter_CA_Func_0300 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Allow_Download_Inter_CA_Func_0400
     * @tc.number SUB_Security_Cert_Framework_Allow_Download_Inter_CA_Func_0400
     * @tc.desc   开启下载中间证书能力，3级证书链缺失中间证书，信任证书仅包含根证书，证书来源gitCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Allow_Download_Inter_CA_Func_0400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let rootCert: cert.X509Cert = await createX509CertPem(CHAIN_ECC_3_1_PEM);
          let entryCert: cert.X509Cert = await createX509CertPem(CHAIN_ECC_3_3_PEM);
          let collection: cert.CertCRLCollection = cert.createCertCRLCollection([entryCert, rootCert]);
          let param: cert.CertChainBuildParameters = {
            certMatchParameters: {},
            validationParameters: {
              certCRLs: [collection],
              trustAnchors: [
                {
                  CACert: rootCert
                }
              ],
              allowDownloadIntermediateCa: true
            }
          }
          let data: cert.CertChainBuildResult = await cert.buildX509CertChain(param);
          console.info("[XTS]:" + data.certChain.getCertList().length);
          expect(data.certChain.getCertList().length).assertEqual(3);
        } catch (error) {
          console.error(`[XTS] Allow_Download_Inter_CA_Func_0400 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Allow_Download_Inter_CA_Func_0500
     * @tc.number SUB_Security_Cert_Framework_Allow_Download_Inter_CA_Func_0500
     * @tc.desc   开启下载中间证书能力，4级证书链缺失第3本和根证书，信任证书仅包含根证书
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Allow_Download_Inter_CA_Func_0500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let rootCert: cert.X509Cert = await createX509CertPem(CHAIN_ECC_4_1_PEM);
          let x509CertChain: cert.X509CertChain = await createCertChain(CHAIN_ECC_4_4_PEM + CHAIN_ECC_4_3_PEM);
          const param: cert.CertChainValidationParameters = {
            trustAnchors: [
              {
                CACert: rootCert
              }
            ],
            allowDownloadIntermediateCa: true
          };
          let result: cert.CertChainValidationResult = await x509CertChain.validate(param);
          expect(result.entityCert.getVersion()).assertEqual(3);
        } catch (error) {
          console.error(`[XTS] Allow_Download_Inter_CA_Func_0500 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Allow_Download_Inter_CA_Func_0600
     * @tc.number SUB_Security_Cert_Framework_Allow_Download_Inter_CA_Func_0600
     * @tc.desc   开启下载中间证书能力，3级证书链缺失中间证书，信任证书仅包中间证书
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Allow_Download_Inter_CA_Func_0600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let rootCert: cert.X509Cert = await createX509CertPem(CHAIN_GIT_CODE_ROOT_PEM);
          let interCert: cert.X509Cert = await createX509CertPem(CHAIN_GIT_CODE_INTER_PEM);
          let entryCert: cert.X509Cert = await createX509CertPem(CHAIN_GIT_CODE_LEAF_PEM);
          let collection: cert.CertCRLCollection = cert.createCertCRLCollection([entryCert, rootCert]);
          let param: cert.CertChainBuildParameters = {
            certMatchParameters: {},
            validationParameters: {
              certCRLs: [collection],
              trustAnchors: [
                {
                  CACert: interCert
                }
              ],
              allowDownloadIntermediateCa: true
            }
          }
          let data: cert.CertChainBuildResult = await cert.buildX509CertChain(param);
          console.info("[XTS]:" + data.certChain.getCertList().length);
          expect(data.certChain.getCertList().length).assertEqual(1);
        } catch (error) {
          console.error(`[XTS] Allow_Download_Inter_CA_Func_0600 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Allow_Download_Inter_CA_Func_0700
     * @tc.number SUB_Security_Cert_Framework_Allow_Download_Inter_CA_Func_0700
     * @tc.desc   开启下载中间证书能力，2级证书链缺失根证书，信任证书仅包根证书
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Allow_Download_Inter_CA_Func_0700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let rootCert: cert.X509Cert = await createX509CertPem(CHAIN_2_1_HTTP_PEM);
          let entryCert: cert.X509Cert = await createX509CertPem(CHAIN_2_2_HTTP_PEM);
          let collection: cert.CertCRLCollection = cert.createCertCRLCollection([entryCert]);
          let param: cert.CertChainBuildParameters = {
            certMatchParameters: {},
            validationParameters: {
              certCRLs: [collection],
              trustAnchors: [
                {
                  CACert: rootCert
                }
              ],
              allowDownloadIntermediateCa: true
            }
          }
          let data: cert.CertChainBuildResult = await cert.buildX509CertChain(param);
          console.info("[XTS]:" + data.certChain.getCertList().length);
          expect(data.certChain.getCertList().length).assertEqual(1);
        } catch (error) {
          console.error(`[XTS] Allow_Download_Inter_CA_Func_0700 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Allow_Download_Inter_CA_Func_0800
     * @tc.number SUB_Security_Cert_Framework_Allow_Download_Inter_CA_Func_0800
     * @tc.desc   开启下载中间证书能力，4级证书链缺失根证书，信任证书仅包含第3本
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Allow_Download_Inter_CA_Func_0800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let entryCert: cert.X509Cert = await createX509CertPem(CHAIN_4_4_HTTP_PEM);
          let interCert1: cert.X509Cert = await createX509CertPem(CHAIN_4_3_HTTP_PEM);
          let interCert2: cert.X509Cert = await createX509CertPem(CHAIN_4_2_HTTP_PEM);
          let collection: cert.CertCRLCollection = cert.createCertCRLCollection([entryCert, interCert1, interCert2]);
          let param: cert.CertChainBuildParameters = {
            certMatchParameters: {},
            validationParameters: {
              certCRLs: [collection],
              trustAnchors: [
                {
                  CACert: interCert2
                }
              ],
              allowDownloadIntermediateCa: true
            }
          }
          let data: cert.CertChainBuildResult = await cert.buildX509CertChain(param);
          console.info("[XTS]:" + data.certChain.getCertList().length);
          expect(data.certChain.getCertList().length).assertEqual(3);
        } catch (error) {
          console.error(`[XTS] Allow_Download_Inter_CA_Func_0800 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Allow_Download_Inter_CA_Func_0900
     * @tc.number SUB_Security_Cert_Framework_Allow_Download_Inter_CA_Func_0900
     * @tc.desc   开启下载中间证书能力，4级证书链缺失根证书，信任证书包含根和第3本
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Allow_Download_Inter_CA_Func_0900",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let entryCert: cert.X509Cert = await createX509CertPem(CHAIN_4_4_HTTP_PEM);
          let interCert1: cert.X509Cert = await createX509CertPem(CHAIN_4_3_HTTP_PEM);
          let interCert2: cert.X509Cert = await createX509CertPem(CHAIN_4_2_HTTP_PEM);
          let rootCert: cert.X509Cert = await createX509CertPem(CHAIN_4_1_HTTP_PEM);
          let collection: cert.CertCRLCollection = cert.createCertCRLCollection([entryCert, interCert1, interCert2]);
          let param: cert.CertChainBuildParameters = {
            certMatchParameters: {},
            validationParameters: {
              certCRLs: [collection],
              trustAnchors: [
                {
                  CACert: interCert2
                },
                {
                  CACert: rootCert
                }
              ],
              allowDownloadIntermediateCa: true
            }
          }
          let data: cert.CertChainBuildResult = await cert.buildX509CertChain(param);
          console.info("[XTS]:" + data.certChain.getCertList().length);
          expect(data.certChain.getCertList().length).assertEqual(3);
        } catch (error) {
          console.error(`[XTS] Allow_Download_Inter_CA_Func_0900 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Allow_Download_Inter_CA_Func_1000
     * @tc.number SUB_Security_Cert_Framework_Allow_Download_Inter_CA_Func_1000
     * @tc.desc   开启下载中间证书能力，4级证书链缺失2、3证书，信任证书包含根
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Allow_Download_Inter_CA_Func_1000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let entryCert: cert.X509Cert = await createX509CertPem(CHAIN_ECC_4_4_PEM);
          let rootCert: cert.X509Cert = await createX509CertPem(CHAIN_ECC_4_1_PEM);
          let collection: cert.CertCRLCollection = cert.createCertCRLCollection([entryCert, rootCert]);
          let param: cert.CertChainBuildParameters = {
            certMatchParameters: {},
            validationParameters: {
              certCRLs: [collection],
              trustAnchors: [
                {
                  CACert: rootCert
                }
              ],
              allowDownloadIntermediateCa: true
            }
          }
          let data: cert.CertChainBuildResult = await cert.buildX509CertChain(param);
          console.info("[XTS]:" + data.certChain.getCertList().length);
          expect(data.certChain.getCertList().length).assertEqual(4);
        } catch (error) {
          console.error(`[XTS] Allow_Download_Inter_CA_Func_1000 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Allow_Download_Inter_CA_Func_1100
     * @tc.number SUB_Security_Cert_Framework_Allow_Download_Inter_CA_Func_1100
     * @tc.desc   开启下载中间证书能力，4级证书链缺失2、4证书，信任证书包含根和第3本
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Allow_Download_Inter_CA_Func_1100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let entryCert: cert.X509Cert = await createX509CertPem(CHAIN_4_4_HTTP_PEM);
          let rootCert: cert.X509Cert = await createX509CertPem(CHAIN_4_1_HTTP_PEM);
          let interCert1: cert.X509Cert = await createX509CertPem(CHAIN_4_3_HTTP_PEM);
          let interCert2: cert.X509Cert = await createX509CertPem(CHAIN_4_2_HTTP_PEM);
          let collection: cert.CertCRLCollection = cert.createCertCRLCollection([entryCert, interCert2]);
          let param: cert.CertChainBuildParameters = {
            certMatchParameters: {},
            validationParameters: {
              certCRLs: [collection],
              trustAnchors: [
                {
                  CACert: rootCert,
                },
                {
                  CACert: interCert1
                },
              ],
              allowDownloadIntermediateCa: true
            }
          }
          let data: cert.CertChainBuildResult = await cert.buildX509CertChain(param);
          console.info("[XTS]:" + data.certChain.getCertList().length);
          console.info("CertFramework:1" + data.certChain.toString());
          console.info("CertFramework:2" + data.validationResult.trustAnchor.CACert?.toString());
          expect(data.certChain.getCertList().length).assertEqual(1);
        } catch (error) {
          console.error(`[XTS] Allow_Download_Inter_CA_Func_1100 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Allow_Download_Inter_CA_Func_1200
     * @tc.number SUB_Security_Cert_Framework_Allow_Download_Inter_CA_Func_1200
     * @tc.desc   开启下载中间证书能力，7级证书链缺失2、3、4、5、6证书，信任证书包含根
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Allow_Download_Inter_CA_Func_1200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let entryCert: cert.X509Cert = await createX509CertPem(CHAIN_ECC_7_7_PEM);
          let rootCert: cert.X509Cert = await createX509CertPem(CHAIN_ECC_7_1_PEM);
          let collection: cert.CertCRLCollection = cert.createCertCRLCollection([entryCert, rootCert]);
          let param: cert.CertChainBuildParameters = {
            certMatchParameters: {},
            validationParameters: {
              certCRLs: [collection],
              trustAnchors: [
                {
                  CACert: rootCert
                }
              ],
              allowDownloadIntermediateCa: true
            }
          }
          let data: cert.CertChainBuildResult = await cert.buildX509CertChain(param);
          console.info("[XTS]:" + data.certChain.getCertList().length);
          expect(data.certChain.getCertList().length).assertEqual(7);
        } catch (error) {
          console.error(`[XTS] Allow_Download_Inter_CA_Func_1200 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Allow_Download_Inter_CA_Func_1300
     * @tc.number SUB_Security_Cert_Framework_Allow_Download_Inter_CA_Func_1300
     * @tc.desc   开启下载中间证书能力，3级证书链缺失中间证书，叶子证书AIA扩展含多个有效url，信任证书包含根
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Allow_Download_Inter_CA_Func_1300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let entryCert: cert.X509Cert = await createX509CertPem(CHAIN_ECC_3_3_AIA_URIS_PEM);
          let rootCert: cert.X509Cert = await createX509CertPem(CHAIN_ECC_3_1_PEM);
          let collection: cert.CertCRLCollection = cert.createCertCRLCollection([entryCert, rootCert]);
          let param: cert.CertChainBuildParameters = {
            certMatchParameters: {},
            validationParameters: {
              certCRLs: [collection],
              trustAnchors: [
                {
                  CACert: rootCert
                }
              ],
              allowDownloadIntermediateCa: true
            }
          }
          let data: cert.CertChainBuildResult = await cert.buildX509CertChain(param);
          console.info("[XTS]:" + data.certChain.getCertList().length);
          expect(data.certChain.getCertList().length).assertEqual(3);
        } catch (error) {
          console.error(`[XTS] Allow_Download_Inter_CA_Func_1300 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Allow_Download_Inter_CA_Func_1400
     * @tc.number SUB_Security_Cert_Framework_Allow_Download_Inter_CA_Func_1400
     * @tc.desc   开启下载中间证书能力，3级证书链缺失中间证书，叶子证书AIA扩展含1个有效url和一个无效url，信任证书包含根
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Allow_Download_Inter_CA_Func_1400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let entryCert: cert.X509Cert = await createX509CertPem(CHAIN_ECC_3_3_AIA_XXX_PEM);
          let rootCert: cert.X509Cert = await createX509CertPem(CHAIN_ECC_3_1_PEM);
          let collection: cert.CertCRLCollection = cert.createCertCRLCollection([entryCert, rootCert]);
          let param: cert.CertChainBuildParameters = {
            certMatchParameters: {},
            validationParameters: {
              certCRLs: [collection],
              trustAnchors: [
                {
                  CACert: rootCert
                }
              ],
              allowDownloadIntermediateCa: true
            }
          }
          let data: cert.CertChainBuildResult = await cert.buildX509CertChain(param);
          console.info("[XTS]:" + data.certChain.getCertList().length);
          expect(data.certChain.getCertList().length).assertEqual(3);
        } catch (error) {
          console.error(`[XTS] Allow_Download_Inter_CA_Func_1400 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Allow_Download_Inter_CA_Func_1500
     * @tc.number SUB_Security_Cert_Framework_Allow_Download_Inter_CA_Func_1500
     * @tc.desc   开启下载中间证书能力，3级证书链缺失中间证书，叶子证书AIA扩展含1个url格式为pem，信任证书包含根
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Allow_Download_Inter_CA_Func_1500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let entryCert: cert.X509Cert = await createX509CertPem(CHAIN_ECC_3_3_RESP_PEM);
          let rootCert: cert.X509Cert = await createX509CertPem(CHAIN_ECC_3_1_PEM);
          let collection: cert.CertCRLCollection = cert.createCertCRLCollection([entryCert, rootCert]);
          let param: cert.CertChainBuildParameters = {
            certMatchParameters: {},
            validationParameters: {
              certCRLs: [collection],
              trustAnchors: [
                {
                  CACert: rootCert
                }
              ],
              allowDownloadIntermediateCa: true
            }
          }
          await cert.buildX509CertChain(param);
          expect(null).assertFail();
        } catch (error) {
          console.error(`[XTS] Allow_Download_Inter_CA_Func_1500 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Allow_Download_Inter_CA_Func_1600
     * @tc.number SUB_Security_Cert_Framework_Allow_Download_Inter_CA_Func_1600
     * @tc.desc   开启下载中间证书能力，自签名证书，没有叶子证书，信任证书包含本身
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Allow_Download_Inter_CA_Func_1600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let entryCert: cert.X509Cert = await createX509CertPem(CHAIN_1_1_HTTP_PEM);
          let collection: cert.CertCRLCollection = cert.createCertCRLCollection([entryCert]);
          let param: cert.CertChainBuildParameters = {
            certMatchParameters: {},
            validationParameters: {
              certCRLs: [collection],
              trustAnchors: [
                {
                  CACert: entryCert
                }
              ],
              allowDownloadIntermediateCa: true
            }
          }
          await cert.buildX509CertChain(param);
          expect(null).assertFail();
        } catch (error) {
          console.error(`[XTS] Allow_Download_Inter_CA_Func_1600 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Allow_Download_Inter_CA_Func_1700
     * @tc.number SUB_Security_Cert_Framework_Allow_Download_Inter_CA_Func_1700
     * @tc.desc   开启下载中间证书能力，3级证书链缺失中间证书，叶子证书含AIA扩展但不含颁发者，信任证书包含本身
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Allow_Download_Inter_CA_Func_1700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let entryCert: cert.X509Cert = await createX509CertPem(CHAIN_3_3_HTTP_4_URLS_PEM);
          let rootCert: cert.X509Cert = await createX509CertPem(CHAIN_3_1_HTTP_URLS_PEM);
          let collection: cert.CertCRLCollection = cert.createCertCRLCollection([entryCert]);
          let param: cert.CertChainBuildParameters = {
            certMatchParameters: {},
            validationParameters: {
              certCRLs: [collection],
              trustAnchors: [
                {
                  CACert: rootCert
                }
              ],
              allowDownloadIntermediateCa: true
            }
          }
          await cert.buildX509CertChain(param);
          expect(null).assertFail();
        } catch (error) {
          console.error(`[XTS] Allow_Download_Inter_CA_Func_1700 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Allow_Download_Inter_CA_Func_1800
     * @tc.number SUB_Security_Cert_Framework_Allow_Download_Inter_CA_Func_1800
     * @tc.desc   开启下载中间证书能力，3级证书链缺失中间证书，叶子证书含无效AIA扩展，信任证书包含本身
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Allow_Download_Inter_CA_Func_1800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let entryCert: cert.X509Cert = await createX509CertPem(CHAIN_3_3_HTTP_5_URLS_PEM);
          let rootCert: cert.X509Cert = await createX509CertPem(CHAIN_3_1_HTTP_URLS_PEM);
          let collection: cert.CertCRLCollection = cert.createCertCRLCollection([entryCert]);
          let param: cert.CertChainBuildParameters = {
            certMatchParameters: {},
            validationParameters: {
              certCRLs: [collection],
              trustAnchors: [
                {
                  CACert: rootCert
                }
              ],
              allowDownloadIntermediateCa: true
            }
          }
          await cert.buildX509CertChain(param);
          expect(null).assertFail();
        } catch (error) {
          console.error(`[XTS] Allow_Download_Inter_CA_Func_1800 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Allow_Download_Inter_CA_Func_1900
     * @tc.number SUB_Security_Cert_Framework_Allow_Download_Inter_CA_Func_1900
     * @tc.desc   开启下载中间证书能力，3级证书链缺失中间证书，叶子证书不含AIA扩展，信任证书包含本身
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Allow_Download_Inter_CA_Func_1900",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let entryCert: cert.X509Cert = await createX509CertPem(CHAIN_3_3_HTTP_6_URLS_PEM);
          let rootCert: cert.X509Cert = await createX509CertPem(CHAIN_3_1_HTTP_URLS_PEM);
          let collection: cert.CertCRLCollection = cert.createCertCRLCollection([entryCert]);
          let param: cert.CertChainBuildParameters = {
            certMatchParameters: {},
            validationParameters: {
              certCRLs: [collection],
              trustAnchors: [
                {
                  CACert: rootCert
                }
              ],
              allowDownloadIntermediateCa: true
            }
          }
          await cert.buildX509CertChain(param);
          expect(null).assertFail();
        } catch (error) {
          console.error(`[XTS] Allow_Download_Inter_CA_Func_1900 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Allow_Download_Inter_CA_Func_2000
     * @tc.number SUB_Security_Cert_Framework_Allow_Download_Inter_CA_Func_2000
     * @tc.desc   开启下载中间证书能力，3级证书链缺失中间证书，叶子证书不含AIA扩展，信任证书包含本身
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Allow_Download_Inter_CA_Func_2000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let entryCert: cert.X509Cert = await createX509CertPem(CHAIN_3_3_HTTP_NO_CA_PEM);
          let rootCert: cert.X509Cert = await createX509CertPem(CHAIN_3_1_HTTP_NO_CA_PEM);
          let collection: cert.CertCRLCollection = cert.createCertCRLCollection([entryCert, rootCert]);
          let param: cert.CertChainBuildParameters = {
            certMatchParameters: {},
            validationParameters: {
              certCRLs: [collection],
              trustAnchors: [
                {
                  CACert: rootCert
                }
              ],
              allowDownloadIntermediateCa: true
            }
          }
          await cert.buildX509CertChain(param);
          expect(null).assertFail();
        } catch (error) {
          console.error(`[XTS] Allow_Download_Inter_CA_Func_2000 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Allow_Download_Inter_CA_Func_2100
     * @tc.number SUB_Security_Cert_Framework_Allow_Download_Inter_CA_Func_2100
     * @tc.desc   开启下载中间证书能力，8级证书链缺失2、3、4、5、6、7证书，信任证书包含根证书，最大下载5次
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Allow_Download_Inter_CA_Func_2100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let entryCert: cert.X509Cert = await createX509CertPem(CHAIN_ECC_8_8_PEM);
          let rootCert: cert.X509Cert = await createX509CertPem(CHAIN_ECC_8_1_PEM);
          let collection: cert.CertCRLCollection = cert.createCertCRLCollection([entryCert, rootCert]);
          let param: cert.CertChainBuildParameters = {
            certMatchParameters: {},
            validationParameters: {
              certCRLs: [collection],
              trustAnchors: [
                {
                  CACert: rootCert
                }
              ],
              allowDownloadIntermediateCa: true
            }
          }
          await cert.buildX509CertChain(param);
          expect(null).assertFail();
        } catch (error) {
          console.error(`[XTS] Allow_Download_Inter_CA_Func_2100 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Allow_Download_Inter_CA_Func_2200
     * @tc.number SUB_Security_Cert_Framework_Allow_Download_Inter_CA_Func_2200
     * @tc.desc   不开启下载中间证书能力，3级证书链缺失中间证书，信任证书仅包中间证书
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Allow_Download_Inter_CA_Func_2200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let rootCert: cert.X509Cert = await createX509CertPem(CHAIN_GIT_CODE_ROOT_PEM);
          let entryCert: cert.X509Cert = await createX509CertPem(CHAIN_GIT_CODE_LEAF_PEM);
          let collection: cert.CertCRLCollection = cert.createCertCRLCollection([entryCert, rootCert]);
          let param: cert.CertChainBuildParameters = {
            certMatchParameters: {},
            validationParameters: {
              certCRLs: [collection],
              trustAnchors: [
                {
                  CACert: rootCert
                }
              ],
              allowDownloadIntermediateCa: false
            }
          }
          await cert.buildX509CertChain(param);
          expect(null).assertFail();
        } catch (error) {
          console.error(`[XTS] Allow_Download_Inter_CA_Func_2200 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Allow_Download_Inter_CA_Func_2300
     * @tc.number SUB_Security_Cert_Framework_Allow_Download_Inter_CA_Func_2300
     * @tc.desc   开启下载中间证书能力，3级证书链缺失过期的中间证书，信任证书仅包中间证书
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Allow_Download_Inter_CA_Func_2300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let rootCert: cert.X509Cert = await createX509CertPem(CHAIN_ECC_3_1_TIME_PEM);
          let entryCert: cert.X509Cert = await createX509CertPem(CHAIN_ECC_3_3_TIME_PEM);
          let collection: cert.CertCRLCollection = cert.createCertCRLCollection([entryCert, rootCert]);
          let param: cert.CertChainBuildParameters = {
            certMatchParameters: {},
            validationParameters: {
              certCRLs: [collection],
              trustAnchors: [
                {
                  CACert: rootCert
                }
              ],
              allowDownloadIntermediateCa: true,
              date: "251229093852Z"
            }
          }
          await cert.buildX509CertChain(param);
          expect(null).assertFail();
        } catch (error) {
          console.error(`[XTS] Allow_Download_Inter_CA_Func_2300 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_CERT_HAS_EXPIRED);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Allow_Download_Inter_CA_Func_2400
     * @tc.number SUB_Security_Cert_Framework_Allow_Download_Inter_CA_Func_2400
     * @tc.desc   开启下载中间证书能力，3级证书链缺失未生效的中间证书，信任证书仅包中间证书
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Allow_Download_Inter_CA_Func_2400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let rootCert: cert.X509Cert = await createX509CertPem(CHAIN_ECC_3_1_TIME_PEM);
          let entryCert: cert.X509Cert = await createX509CertPem(CHAIN_ECC_3_3_YET_PEM);
          let collection: cert.CertCRLCollection = cert.createCertCRLCollection([entryCert, rootCert]);
          let param: cert.CertChainBuildParameters = {
            certMatchParameters: {},
            validationParameters: {
              certCRLs: [collection],
              trustAnchors: [
                {
                  CACert: rootCert
                }
              ],
              allowDownloadIntermediateCa: true,
              date: "251229093852Z"
            }
          }
          await cert.buildX509CertChain(param);
          expect(null).assertFail();
        } catch (error) {
          console.error(`[XTS] Allow_Download_Inter_CA_Func_2400 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_CERT_NOT_YET_VALID);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Allow_Download_Inter_CA_Func_2500
     * @tc.number SUB_Security_Cert_Framework_Allow_Download_Inter_CA_Func_2500
     * @tc.desc   开启下载中间证书能力，含多本叶子证书，3级证书链缺失未生效的中间证书，第二本叶子证书过期，信任证书仅包中间证书
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Allow_Download_Inter_CA_Func_2500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let rootCert: cert.X509Cert = await createX509CertPem(CHAIN_ECC_3_1_TIME_PEM);
          let entryCert1: cert.X509Cert = await createX509CertPem(CHAIN_ECC_3_3_YET_PEM);
          let entryCert2: cert.X509Cert = await createX509CertPem(CHAIN_3_3_HTTP_3_EXPIRED_TIME_PEM);
          let collection: cert.CertCRLCollection = cert.createCertCRLCollection([entryCert1, entryCert2, rootCert]);
          let param: cert.CertChainBuildParameters = {
            certMatchParameters: {},
            validationParameters: {
              certCRLs: [collection],
              trustAnchors: [
                {
                  CACert: rootCert
                }
              ],
              allowDownloadIntermediateCa: true,
              date: "251229093852Z"
            }
          }
          await cert.buildX509CertChain(param);
          expect(null).assertFail();
        } catch (error) {
          console.error(`[XTS] Allow_Download_Inter_CA_Func_2500 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Allow_Download_Inter_CA_Func_2600
     * @tc.number SUB_Security_Cert_Framework_Allow_Download_Inter_CA_Func_2600
     * @tc.desc   开启下载中间证书能力，含多本叶子证书，3级证书链缺失未生效的中间证书，第二本叶子证书对应的中间证书过期，信任证书仅包中间证书
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Allow_Download_Inter_CA_Func_2600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let rootCert: cert.X509Cert = await createX509CertPem(CHAIN_ECC_3_1_TIME_PEM);
          let entryCert1: cert.X509Cert = await createX509CertPem(CHAIN_ECC_3_3_YET_PEM);
          let entryCert2: cert.X509Cert = await createX509CertPem(CHAIN_ECC_3_3_TIME_PEM);
          let collection: cert.CertCRLCollection = cert.createCertCRLCollection([entryCert1, entryCert2, rootCert]);
          let param: cert.CertChainBuildParameters = {
            certMatchParameters: {},
            validationParameters: {
              certCRLs: [collection],
              trustAnchors: [
                {
                  CACert: rootCert
                }
              ],
              allowDownloadIntermediateCa: true,
              date: "251229093852Z"
            }
          }
          await cert.buildX509CertChain(param);
          expect(null).assertFail();
        } catch (error) {
          console.error(`[XTS] Allow_Download_Inter_CA_Func_2600 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_CERT_HAS_EXPIRED);
        }
        done();
      });
  })
}