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
import {
  CHAIN_3_CA_INTER_CRL_PEM,
  CHAIN_3_CA_INTER_MD5_PEM,
  CHAIN_3_CA_INTER_PEM,
  CHAIN_3_CA_LEAF_CRL_PEM,
  CHAIN_3_CA_LEAF_MD5_PEM,
  CHAIN_3_CA_LEAF_PEM,
  CHAIN_3_CA_ROOT_CRL_PEM,
  CHAIN_3_CA_ROOT_MD5_PEM,
  CHAIN_3_CA_ROOT_PEM,
  CHAIN_3_INTER_PEM, CHAIN_3_LEAF2_PEM,
  CHAIN_3_LEAF3_PEM,
  CHAIN_3_LEAF4_PEM,
  CHAIN_3_LEAF_PEM, CHAIN_3_ROOT_PEM,
  CHAIN_SELF_CA_ROOT_PEM } from "./utils/chain/chain";
import { createX509CertPem, sleep } from "./utils/common/common";
import { createCertChain } from "./utils/crl/crl";
import wifiMg from '@ohos.wifiManager';


export default function certFrameworkCertIgnoreNetworkIssuesTestUnit() {
  describe("certFrameworkCertIgnoreNetworkIssuesTestUnit", (): void => {

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
     * @tc.name   SUB_Security_Cert_Framework_Ignore_Network_Issues_Func_0100
     * @tc.number SUB_Security_Cert_Framework_Ignore_Network_Issues_Func_0100
     * @tc.desc   The Online CRL, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Ignore_Network_Issues_Func_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let entryCert: cert.X509Cert = await createX509CertPem(CHAIN_3_LEAF_PEM);
          let interCert: cert.X509Cert = await createX509CertPem(CHAIN_3_INTER_PEM);
          let rootCert: cert.X509Cert = await createX509CertPem(CHAIN_3_ROOT_PEM);
          let collection: cert.CertCRLCollection = cert.createCertCRLCollection([entryCert, interCert, rootCert]);
          let param: cert.CertChainBuildParameters = {
            certMatchParameters: {},
            validationParameters: {
              certCRLs: [collection],
              trustAnchors: [
                {
                  CACert: rootCert
                }
              ],
              revocationCheckParam: {
                options: [
                  cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_ACCESS_NETWORK,
                  cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_PREFER_OCSP,
                  cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_IGNORE_NETWORK_ERROR
                ]
              }
            }
          };
          let data: cert.CertChainBuildResult = await cert.buildX509CertChain(param);
          console.info("[XTS]:" + data.certChain.getCertList().length);
          expect(data.certChain.getCertList().length).assertEqual(4);
        } catch (error: BusinessError) {
          console.error(`[XTS] Ignore_Network_Issues_Func_0100 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Ignore_Network_Issues_Func_0200
     * @tc.number SUB_Security_Cert_Framework_Ignore_Network_Issues_Func_0200
     * @tc.desc   The Online CRL, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Ignore_Network_Issues_Func_0200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let entryCert: cert.X509Cert = await createX509CertPem(CHAIN_3_LEAF2_PEM);
          let interCert: cert.X509Cert = await createX509CertPem(CHAIN_3_INTER_PEM);
          let rootCert: cert.X509Cert = await createX509CertPem(CHAIN_3_ROOT_PEM);
          let collection: cert.CertCRLCollection = cert.createCertCRLCollection([entryCert, interCert, rootCert]);
          let param: cert.CertChainBuildParameters = {
            certMatchParameters: {},
            validationParameters: {
              certCRLs: [collection],
              trustAnchors: [
                {
                  CACert: rootCert
                }
              ],
              revocationCheckParam: {
                options: [
                  cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_ACCESS_NETWORK,
                  cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_IGNORE_NETWORK_ERROR
                ]
              }
            }
          };
          await cert.buildX509CertChain(param);
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`[XTS] Ignore_Network_Issues_Func_0200 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Ignore_Network_Issues_Func_0300
     * @tc.number SUB_Security_Cert_Framework_Ignore_Network_Issues_Func_0300
     * @tc.desc   The Online CRL, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Ignore_Network_Issues_Func_0300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let entryCert: cert.X509Cert = await createX509CertPem(CHAIN_3_LEAF3_PEM);
          let interCert: cert.X509Cert = await createX509CertPem(CHAIN_3_INTER_PEM);
          let rootCert: cert.X509Cert = await createX509CertPem(CHAIN_3_ROOT_PEM);
          let collection: cert.CertCRLCollection = cert.createCertCRLCollection([entryCert, interCert, rootCert]);
          let param: cert.CertChainBuildParameters = {
            certMatchParameters: {},
            validationParameters: {
              certCRLs: [collection],
              trustAnchors: [
                {
                  CACert: rootCert
                }
              ],
              revocationCheckParam: {
                options: [
                  cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_ACCESS_NETWORK,
                  cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_IGNORE_NETWORK_ERROR
                ]
              }
            }
          };
          await cert.buildX509CertChain(param);
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`[XTS] Ignore_Network_Issues_Func_0300 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Ignore_Network_Issues_Func_0400
     * @tc.number SUB_Security_Cert_Framework_Ignore_Network_Issues_Func_0400
     * @tc.desc   The Online CRL, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Ignore_Network_Issues_Func_0400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let entryCert: cert.X509Cert = await createX509CertPem(CHAIN_3_LEAF4_PEM);
          let interCert: cert.X509Cert = await createX509CertPem(CHAIN_3_INTER_PEM);
          let rootCert: cert.X509Cert = await createX509CertPem(CHAIN_3_ROOT_PEM);
          let collection: cert.CertCRLCollection = cert.createCertCRLCollection([entryCert, interCert, rootCert]);
          let param: cert.CertChainBuildParameters = {
            certMatchParameters: {},
            validationParameters: {
              certCRLs: [collection],
              trustAnchors: [
                {
                  CACert: rootCert
                }
              ],
              revocationCheckParam: {
                options: [
                  cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_ACCESS_NETWORK,
                  cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_IGNORE_NETWORK_ERROR
                ]
              }
            }
          };
          let data: cert.CertChainBuildResult = await cert.buildX509CertChain(param);
          console.info("[XTS]:" + data.certChain.getCertList().length);
          expect(data.certChain.getCertList().length).assertEqual(4);
        } catch (error: BusinessError) {
          console.error(`[XTS] Ignore_Network_Issues_Func_0400 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Ignore_Network_Issues_Func_0500
     * @tc.number SUB_Security_Cert_Framework_Ignore_Network_Issues_Func_0500
     * @tc.desc   The Online CRL, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Ignore_Network_Issues_Func_0500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          // openssl ocsp -port 8886 -index index.txt -CA ecdsa_intermediate.crt -rkey ecdsa_intermediate.key -rsigner ecdsa_intermediate.crt -text
          // openssl ocsp -port 8888 -index index.txt -CA ecdsa_root.crt -rkey ecdsa_root.key -rsigner ecdsa_root.crt -text 不运行
          let entryCert: cert.X509Cert = await createX509CertPem(CHAIN_3_CA_LEAF_PEM);
          let interCert: cert.X509Cert = await createX509CertPem(CHAIN_3_CA_INTER_PEM);
          let rootCert: cert.X509Cert = await createX509CertPem(CHAIN_3_CA_ROOT_PEM);
          let collection: cert.CertCRLCollection = cert.createCertCRLCollection([entryCert, interCert, rootCert]);
          let param: cert.CertChainBuildParameters = {
            certMatchParameters: {},
            validationParameters: {
              certCRLs: [collection],
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
                  cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_IGNORE_NETWORK_ERROR
                ]
              }
            }
          };
          let data: cert.CertChainBuildResult = await cert.buildX509CertChain(param);
          console.info("[XTS]:" + data.certChain.getCertList().length);
          expect(data.certChain.getCertList().length).assertEqual(4);
        } catch (error: BusinessError) {
          console.error(`[XTS] Ignore_Network_Issues_Func_0500 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Ignore_Network_Issues_Func_0600
     * @tc.number SUB_Security_Cert_Framework_Ignore_Network_Issues_Func_0600
     * @tc.desc   The Online CRL, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Ignore_Network_Issues_Func_0600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let entryCert: cert.X509Cert = await createX509CertPem(CHAIN_3_CA_LEAF_PEM);
          let interCert: cert.X509Cert = await createX509CertPem(CHAIN_3_CA_INTER_PEM);
          let rootCert: cert.X509Cert = await createX509CertPem(CHAIN_3_CA_ROOT_PEM);
          let collection: cert.CertCRLCollection = cert.createCertCRLCollection([entryCert, interCert, rootCert]);
          let param: cert.CertChainBuildParameters = {
            certMatchParameters: {},
            validationParameters: {
              certCRLs: [collection],
              trustAnchors: [
                {
                  CACert: rootCert
                }
              ],
              revocationCheckParam: {
                options: [
                  cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_ACCESS_NETWORK,
                  cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_CHECK_INTERMEDIATE_CA_ONLINE,
                  cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_IGNORE_NETWORK_ERROR
                ]
              }
            }
          };
          let data: cert.CertChainBuildResult = await cert.buildX509CertChain(param);
          console.info("[XTS]:" + data.certChain.getCertList().length);
          expect(data.certChain.getCertList().length).assertEqual(4);
        } catch (error: BusinessError) {
          console.error(`[XTS] Ignore_Network_Issues_Func_0600 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Ignore_Network_Issues_Func_0700
     * @tc.number SUB_Security_Cert_Framework_Ignore_Network_Issues_Func_0700
     * @tc.desc   The Online CRL, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Ignore_Network_Issues_Func_0700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let entryCert: cert.X509Cert = await createX509CertPem(CHAIN_3_LEAF2_PEM);
          let interCert: cert.X509Cert = await createX509CertPem(CHAIN_3_INTER_PEM);
          let rootCert: cert.X509Cert = await createX509CertPem(CHAIN_3_ROOT_PEM);
          let collection: cert.CertCRLCollection = cert.createCertCRLCollection([entryCert, interCert, rootCert]);
          let param: cert.CertChainBuildParameters = {
            certMatchParameters: {},
            validationParameters: {
              certCRLs: [collection],
              trustAnchors: [
                {
                  CACert: rootCert
                }
              ],
              revocationCheckParam: {
                crlDownloadURI: "http://localhost:9090",
                options: [
                  cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_ACCESS_NETWORK,
                  cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_IGNORE_NETWORK_ERROR
                ]
              }
            }
          };
          let data: cert.CertChainBuildResult = await cert.buildX509CertChain(param);
          console.info("[XTS]:" + data.certChain.getCertList().length)
          expect(data.certChain.getCertList().length).assertEqual(4);
        } catch (error: BusinessError) {
          console.error(`[XTS] Ignore_Network_Issues_Func_0700 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Ignore_Network_Issues_Func_0800
     * @tc.number SUB_Security_Cert_Framework_Ignore_Network_Issues_Func_0800
     * @tc.desc   The Online CRL, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Ignore_Network_Issues_Func_0800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          // openssl ocsp -port 8886 -index index.txt -CA ecdsa_intermediate.crt -rkey ecdsa_intermediate.key -rsigner ecdsa_intermediate.crt -text
          // openssl ocsp -port 8888 -index index.txt -CA ecdsa_root.crt -rkey ecdsa_root.key -rsigner ecdsa_root.crt -text 不运行
          let entryCert: cert.X509Cert = await createX509CertPem(CHAIN_3_CA_LEAF_PEM);
          let interCert: cert.X509Cert = await createX509CertPem(CHAIN_3_CA_INTER_PEM);
          let collection: cert.CertCRLCollection = cert.createCertCRLCollection([entryCert]);
          let param: cert.CertChainBuildParameters = {
            certMatchParameters: {},
            validationParameters: {
              certCRLs: [collection],
              trustAnchors: [
                {
                  CACert: interCert
                }
              ],
              revocationCheckParam: {
                options: [
                  cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_ACCESS_NETWORK,
                  cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_PREFER_OCSP,
                  cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_CHECK_INTERMEDIATE_CA_ONLINE,
                  cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_IGNORE_NETWORK_ERROR
                ]
              }
            }
          };
          let data: cert.CertChainBuildResult = await cert.buildX509CertChain(param);
          console.info("[XTS]:" + data.certChain.getCertList().length)
          expect(data.certChain.getCertList().length).assertEqual(1);
        } catch (error: BusinessError) {
          console.error(`[XTS] Ignore_Network_Issues_Func_0800 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Ignore_Network_Issues_Func_0900
     * @tc.number SUB_Security_Cert_Framework_Ignore_Network_Issues_Func_0900
     * @tc.desc   The Online CRL, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Ignore_Network_Issues_Func_0900",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          // openssl ocsp -port 8886 -index index.txt -CA ecdsa_intermediate.crt -rkey ecdsa_intermediate.key -rsigner ecdsa_intermediate.crt -text
          // openssl ocsp -port 8888 -index index.txt -CA ecdsa_root.crt -rkey ecdsa_root.key -rsigner ecdsa_root.crt -text 不运行
          let entryCert: cert.X509Cert = await createX509CertPem(CHAIN_3_CA_LEAF_PEM);
          let interCert: cert.X509Cert = await createX509CertPem(CHAIN_3_CA_INTER_PEM);
          let rootCert: cert.X509Cert = await createX509CertPem(CHAIN_3_CA_ROOT_PEM);
          let collection: cert.CertCRLCollection = cert.createCertCRLCollection([entryCert, interCert]);
          let param: cert.CertChainBuildParameters = {
            certMatchParameters: {},
            validationParameters: {
              certCRLs: [collection],
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
                  cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_IGNORE_NETWORK_ERROR
                ]
              }
            }
          };
          let data: cert.CertChainBuildResult = await cert.buildX509CertChain(param);
          console.info("[XTS]:" + data.certChain.getCertList().length);
          expect(data.certChain.getCertList().length).assertEqual(2);
        } catch (error: BusinessError) {
          console.error(`[XTS] Ignore_Network_Issues_Func_0900 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Ignore_Network_Issues_Func_1000
     * @tc.number SUB_Security_Cert_Framework_Ignore_Network_Issues_Func_1000
     * @tc.desc   The Online CRL, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Ignore_Network_Issues_Func_1000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          // openssl ocsp -port 8886 -index index.txt -CA ecdsa_intermediate.crt -rkey ecdsa_intermediate.key -rsigner ecdsa_intermediate.crt -text
          // openssl ocsp -port 8888 -index index.txt -CA ecdsa_root.crt -rkey ecdsa_root.key -rsigner ecdsa_root.crt -text 不运行
          let rootCert: cert.X509Cert = await createX509CertPem(CHAIN_3_CA_ROOT_PEM);
          let x509CertChain: cert.X509CertChain = await createCertChain(CHAIN_3_CA_LEAF_PEM+CHAIN_3_CA_INTER_PEM);
          const param: cert.CertChainValidationParameters = {
            trustAnchors: [{
              CACert: rootCert,
            }],
            revocationCheckParam: {
              options: [
                cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_ACCESS_NETWORK,
                cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_PREFER_OCSP,
                cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_CHECK_INTERMEDIATE_CA_ONLINE,
                cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_IGNORE_NETWORK_ERROR
              ],
            }
          };
          let data: cert.CertChainValidationResult = await x509CertChain.validate(param); // 中间CA未校验
          expect(data.entityCert.getVersion()).assertEqual(3);
        } catch (error: BusinessError) {
          console.error(`[XTS] Ignore_Network_Issues_Func_1000 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Ignore_Network_Issues_Func_1100
     * @tc.number SUB_Security_Cert_Framework_Ignore_Network_Issues_Func_1100
     * @tc.desc   The Online CRL, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Ignore_Network_Issues_Func_1100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          // openssl ocsp -port 8886 -index index.txt -CA ecdsa_intermediate.crt -rkey ecdsa_intermediate.key -rsigner ecdsa_intermediate.crt -text
          // openssl ocsp -port 8888 -index index.txt -CA ecdsa_root.crt -rkey ecdsa_root.key -rsigner ecdsa_root.crt -text 不运行
          let rootCert: cert.X509Cert = await createX509CertPem(CHAIN_3_CA_ROOT_PEM);
          let entryCert: cert.X509Cert = await createX509CertPem(CHAIN_3_CA_LEAF_PEM);
          let x509CertChain: cert.X509CertChain = await createCertChain(CHAIN_3_CA_INTER_PEM);
          const param: cert.CertChainValidationParameters = {
            trustAnchors: [
              {
                CACert: entryCert
              },
              {
                CACert: rootCert
              }
            ],
            revocationCheckParam: {
              options: [
                cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_ACCESS_NETWORK,
                cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_PREFER_OCSP,
                cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_CHECK_INTERMEDIATE_CA_ONLINE,
                cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_IGNORE_NETWORK_ERROR
              ],
            }
          };
          let data: cert.CertChainValidationResult = await x509CertChain.validate(param);
          expect(data.entityCert.getVersion()).assertEqual(3);
          console.info("[XTS] " + data.trustAnchor.CACert?.toString());
        } catch (error: BusinessError) {
          console.error(`[XTS] Ignore_Network_Issues_Func_1100 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Ignore_Network_Issues_Func_1200
     * @tc.number SUB_Security_Cert_Framework_Ignore_Network_Issues_Func_1200
     * @tc.desc   The Online CRL, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Ignore_Network_Issues_Func_1200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          // openssl ocsp -port 8885 -index index.txt -CA ecdsa_root.crt -rkey ecdsa_root.key -rsigner ecdsa_root.crt -text
          let rootCert: cert.X509Cert = await createX509CertPem(CHAIN_SELF_CA_ROOT_PEM);
          let x509CertChain: cert.X509CertChain = await createCertChain(CHAIN_SELF_CA_ROOT_PEM);
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
                cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_IGNORE_NETWORK_ERROR
              ],
            }
          };
          let data: cert.CertChainValidationResult = await x509CertChain.validate(param);
          expect(data.entityCert.getVersion()).assertEqual(3);
          console.info("[XTS] " + data.trustAnchor.CACert?.toString());
        } catch (error: BusinessError) {
          console.error(`[XTS] Ignore_Network_Issues_Func_1200 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Ignore_Network_Issues_Func_1300
     * @tc.number SUB_Security_Cert_Framework_Ignore_Network_Issues_Func_1300
     * @tc.desc   The Online CRL, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Ignore_Network_Issues_Func_1300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let rootCert: cert.X509Cert = await createX509CertPem(CHAIN_3_ROOT_PEM);
          let x509CertChain: cert.X509CertChain = await createCertChain(CHAIN_3_LEAF_PEM + CHAIN_3_INTER_PEM + CHAIN_3_ROOT_PEM);
          let param: cert.CertChainValidationParameters = {
            trustAnchors: [
              {
                CACert: rootCert
              }
            ],
            revocationCheckParam: {
              options: [
                cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_ACCESS_NETWORK,
                cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_PREFER_OCSP,
                cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_IGNORE_NETWORK_ERROR
              ]
            }
          };
          let data: cert.CertChainValidationResult = await x509CertChain.validate(param);
          expect(data.entityCert.getVersion()).assertEqual(3);
        } catch (error: BusinessError) {
          console.error(`[XTS] Ignore_Network_Issues_Func_1300 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Ignore_Network_Issues_Func_1400
     * @tc.number SUB_Security_Cert_Framework_Ignore_Network_Issues_Func_1400
     * @tc.desc   The Online CRL, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Ignore_Network_Issues_Func_1400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          // openssl ocsp -port 8886 -index index.txt -CA ecdsa_intermediate.crt -rkey ecdsa_intermediate.key -rsigner ecdsa_intermediate.crt -text
          // openssl ocsp -port 8888 -index index.txt -CA ecdsa_root.crt -rkey ecdsa_root.key -rsigner ecdsa_root.crt -text 不运行
          let interCert: cert.X509Cert = await createX509CertPem(CHAIN_3_CA_INTER_PEM);
          let x509CertChain: cert.X509CertChain = await createCertChain(CHAIN_3_CA_INTER_PEM);
          const param: cert.CertChainValidationParameters = {
            trustAnchors: [
              {
                CACert: interCert
              }
            ],
            revocationCheckParam: {
              options: [
                cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_ACCESS_NETWORK,
                cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_PREFER_OCSP,
                cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_CHECK_INTERMEDIATE_CA_ONLINE,
                cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_IGNORE_NETWORK_ERROR
              ],
            }
          };
          let data: cert.CertChainValidationResult = await x509CertChain.validate(param);
          expect(data.entityCert.getVersion()).assertEqual(3);
          console.info("[XTS] " + data.trustAnchor.CACert?.toString());
        } catch (error: BusinessError) {
          console.error(`[XTS] Ignore_Network_Issues_Func_1400 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Ignore_Network_Issues_Func_1500
     * @tc.number SUB_Security_Cert_Framework_Ignore_Network_Issues_Func_1500
     * @tc.desc   The Online CRL, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Ignore_Network_Issues_Func_1500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let rootCert: cert.X509Cert = await createX509CertPem(CHAIN_SELF_CA_ROOT_PEM);
          let x509CertChain: cert.X509CertChain = await createCertChain(CHAIN_SELF_CA_ROOT_PEM);
          const param: cert.CertChainValidationParameters = {
            trustAnchors: [
              {
                CACert: rootCert
              }
            ],
            revocationCheckParam: {
              options: [
                cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_ACCESS_NETWORK,
                cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_IGNORE_NETWORK_ERROR
              ],
            }
          };
          // 叶子证书是自签名证书，预期：自签名证书不做crl、ocsp校验
          let data: cert.CertChainValidationResult = await x509CertChain.validate(param);
          expect(data.entityCert.getVersion()).assertEqual(3);
          console.info("[XTS] " + data.trustAnchor.CACert?.toString());
        } catch (error: BusinessError) {
          console.error(`[XTS] Ignore_Network_Issues_Func_1500 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Ignore_Network_Issues_Func_1600
     * @tc.number SUB_Security_Cert_Framework_Ignore_Network_Issues_Func_1600
     * @tc.desc   The Online CRL, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Ignore_Network_Issues_Func_1600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          // openssl ocsp -port 8886 -index index.txt -CA ecdsa_intermediate.crt -rkey ecdsa_intermediate.key -rsigner ecdsa_intermediate.crt -text
          // openssl ocsp -port 8888 -index index.txt -CA ecdsa_root.crt -rkey ecdsa_root.key -rsigner ecdsa_root.crt -text 不运行
          let rootCert: cert.X509Cert = await createX509CertPem(CHAIN_3_CA_ROOT_PEM);
          let x509CertChain: cert.X509CertChain = await createCertChain(CHAIN_3_CA_LEAF_PEM+CHAIN_3_CA_INTER_PEM);
          const param: cert.CertChainValidationParameters = {
            trustAnchors: [{
              CASubject: new Uint8Array([
                0x30, 0x6e, 0x31, 0x0b, 0x30, 0x09, 0x06, 0x03, 0x55, 0x04, 0x06, 0x13, 0x02, 0x43, 0x4e, 0x31,
                0x10, 0x30, 0x0e, 0x06, 0x03, 0x55, 0x04, 0x08, 0x0c, 0x07, 0x42, 0x65, 0x69, 0x6a, 0x69, 0x6e,
                0x67, 0x31, 0x10, 0x30, 0x0e, 0x06, 0x03, 0x55, 0x04, 0x07, 0x0c, 0x07, 0x42, 0x65, 0x69, 0x6a,
                0x69, 0x6e, 0x67, 0x31, 0x16, 0x30, 0x14, 0x06, 0x03, 0x55, 0x04, 0x0a, 0x0c, 0x0d, 0x45, 0x43,
                0x44, 0x53, 0x41, 0x20, 0x52, 0x6f, 0x6f, 0x74, 0x20, 0x43, 0x41, 0x31, 0x0b, 0x30, 0x09, 0x06,
                0x03, 0x55, 0x04, 0x0b, 0x0c, 0x02, 0x49, 0x54, 0x31, 0x16, 0x30, 0x14, 0x06, 0x03, 0x55, 0x04,
                0x03, 0x0c, 0x0d, 0x45, 0x43, 0x44, 0x53, 0x41, 0x20, 0x52, 0x6f, 0x6f, 0x74, 0x20, 0x43, 0x41
              ]),
              CAPubKey: new Uint8Array([
                0x30, 0x59, 0x30, 0x13, 0x06, 0x07, 0x2a, 0x86, 0x48, 0xce, 0x3d, 0x02, 0x01, 0x06, 0x08, 0x2a,
                0x86, 0x48, 0xce, 0x3d, 0x03, 0x01, 0x07, 0x03, 0x42, 0x00, 0x04, 0xb3, 0xe2, 0x1f, 0x8a, 0x1b,
                0xb4, 0x81, 0x0e, 0x8c, 0x72, 0x02, 0x09, 0xc1, 0x2d, 0x50, 0x4a, 0xb1, 0xd7, 0x32, 0xca, 0xe0,
                0xcc, 0xd0, 0x20, 0xc7, 0x27, 0xee, 0x72, 0xea, 0xf8, 0xbe, 0x2d, 0xe9, 0xdf, 0xb4, 0x3e, 0x12,
                0x91, 0xe0, 0x65, 0xe4, 0xce, 0x73, 0x79, 0x7e, 0x63, 0x4d, 0xbe, 0x40, 0x08, 0x7f, 0x4a, 0xfa,
                0x57, 0x19, 0x43, 0xa1, 0xe6, 0x7e, 0xe8, 0xb4, 0x85, 0x27, 0xf3
              ])
            }],
            revocationCheckParam: {
              options: [
                cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_ACCESS_NETWORK,
                cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_PREFER_OCSP,
                cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_CHECK_INTERMEDIATE_CA_ONLINE,
                cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_IGNORE_NETWORK_ERROR
              ],
            }
          };
          await x509CertChain.validate(param); // 不支持开启ocsp，信任锚是非CACert类型
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`[XTS] Ignore_Network_Issues_Func_1600 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Ignore_Network_Issues_Func_1700
     * @tc.number SUB_Security_Cert_Framework_Ignore_Network_Issues_Func_1700
     * @tc.desc   The Online CRL, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Ignore_Network_Issues_Func_1700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          // openssl ocsp -port 8886 -index index.txt -CA ecdsa_intermediate.crt -rkey ecdsa_intermediate.key -rsigner ecdsa_intermediate.crt -text 不运行
          // openssl ocsp -port 8888 -index index.txt -CA ecdsa_root.crt -rkey ecdsa_root.key -rsigner ecdsa_root.crt -text 不运行
          let rootCert: cert.X509Cert = await createX509CertPem(CHAIN_3_CA_ROOT_PEM);
          let x509CertChain: cert.X509CertChain = await createCertChain(CHAIN_3_CA_LEAF_PEM+CHAIN_3_CA_INTER_PEM+CHAIN_3_CA_ROOT_PEM);
          const param: cert.CertChainValidationParameters = {
            trustAnchors: [{
              CACert: rootCert,
            }],
            revocationCheckParam: {
              options: [
                cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_ACCESS_NETWORK,
                cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_PREFER_OCSP,
                cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_CHECK_INTERMEDIATE_CA_ONLINE,
                cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_IGNORE_NETWORK_ERROR
              ],
            }
          };
          let data: cert.CertChainValidationResult = await x509CertChain.validate(param);
          console.info("[XTS] " + data.entityCert.toString());
          expect(data.entityCert.getVersion()).assertEqual(3); // 期望网络忽略2次，叶子和中间
        } catch (error: BusinessError) {
          console.error(`[XTS] Ignore_Network_Issues_Func_1700 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Ignore_Network_Issues_Func_1800
     * @tc.number SUB_Security_Cert_Framework_Ignore_Network_Issues_Func_1800
     * @tc.desc   The Online CRL, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Ignore_Network_Issues_Func_1800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          // openssl ocsp -port 8883 -index index.txt -CA ecdsa_intermediate.crt -rkey ecdsa_intermediate.key -rsigner ecdsa_intermediate.crt -text -rmd md5
          let rootCert: cert.X509Cert = await createX509CertPem(CHAIN_3_CA_ROOT_MD5_PEM);
          let x509CertChain: cert.X509CertChain = await createCertChain(CHAIN_3_CA_LEAF_MD5_PEM+CHAIN_3_CA_INTER_MD5_PEM+CHAIN_3_CA_ROOT_MD5_PEM);
          const param: cert.CertChainValidationParameters = {
            trustAnchors: [{
              CACert: rootCert,
            }],
            revocationCheckParam: {
              options: [
                cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_ACCESS_NETWORK,
                cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_PREFER_OCSP
              ],
            }
          };
          await x509CertChain.validate(param); // ocsp 服务端设置ecc不支持的签名摘要算法md5
          expect(null).assertFail(); // 服务端 asn1 encoding routines:asn1_template_ex_i2d:illegal zero content::0:
        } catch (error: BusinessError) {
          console.error(`[XTS] Ignore_Network_Issues_Func_1800 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION); // Unable to send request.
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Ignore_Network_Issues_Func_1900
     * @tc.number SUB_Security_Cert_Framework_Ignore_Network_Issues_Func_1900
     * @tc.desc   The Online CRL, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_Ignore_Network_Issues_Func_1900",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let rootCert: cert.X509Cert = await createX509CertPem(CHAIN_3_CA_ROOT_CRL_PEM);
          let x509CertChain: cert.X509CertChain = await createCertChain(CHAIN_3_CA_LEAF_CRL_PEM+CHAIN_3_CA_INTER_CRL_PEM+CHAIN_3_CA_ROOT_CRL_PEM);
          const param: cert.CertChainValidationParameters = {
            trustAnchors: [{
              CACert: rootCert,
            }],
            revocationCheckParam: {
              options: [
                cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_ACCESS_NETWORK,
                cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_CHECK_INTERMEDIATE_CA_ONLINE,
                cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_IGNORE_NETWORK_ERROR
              ],
            }
          };
          let data: cert.CertChainValidationResult = await x509CertChain.validate(param);
          console.info("[XTS] " + data.entityCert.toString());
          expect(data.entityCert.getVersion()).assertEqual(3); // 期望网络忽略2次，叶子和中间
        } catch (error: BusinessError) {
          console.error(`[XTS] Ignore_Network_Issues_Func_1900 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });


  })
}