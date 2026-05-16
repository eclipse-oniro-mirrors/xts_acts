/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
import { describe, it, expect, TestType, Size, Level } from "@ohos/hypium";
import { cert } from "@kit.DeviceCertificateKit";
import {
  CHAIN_ENTRY_PRIVATE_KEY_PEM,
  ECC_OTHER_PRIVATE_KEY_PKCS1_PEM,
  ECC_OTHER_X509_CERT_PEM,
  ECC_PRIVATE_KEY_ENCRYPT_PEM,
  ECC_PRIVATE_KEY_PKCS1_DER,
  ECC_PRIVATE_KEY_PKCS1_PEM,
  ECC_PRIVATE_KEY_PKCS8_DER,
  ECC_PRIVATE_KEY_PKCS8_PEM,
  ECC_PRIVATE_KEY_PKCS8_PEM_DER,
  ECC_X509_CERT_PEM, PKCS12_DATA,
  RSA_CERT_CHAIN_INTER_PEM,
  RSA_CERT_CHAIN_LEAF_PEM,
  RSA_CERT_CHAIN_ROOT_PEM } from "./utils/pkcs12/pkcs12";
import { stringToUint8Array } from "./utils/certificate/certPem";


export default function certFrameworkMatchPrivateTestUnit() {
  describe("certFrameworkMatchPrivateTestUnit", () => {

    /**
     * @tc.name SUB_Security_Cert_Match_PrivKey_Func_0100
     * @tc.number SUB_Security_Cert_Match_PrivKey_Func_0100
     * @tc.desc 从P12文件中获取私钥和证书验证是否匹配
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_Cert_Match_PrivKey_Func_0100",
      TestType.RELIABILITY | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let p12Uint8: Uint8Array = new Uint8Array(PKCS12_DATA);
          let p12Obj: cert.Pkcs12Data = await cert.parsePkcs12(p12Uint8, "123456");
          if (p12Obj.privateKey && p12Obj.cert) {
            let matchParams: cert.X509CertMatchParameters = {
              privateKey: p12Obj.privateKey
            }
            let ret: boolean = p12Obj.cert.match(matchParams);
            expect(ret).assertTrue();
          } else {
            console.error("++++++++++++++++++ pkcs12 parse failed.");
            expect(null).assertFail();
          }
        } catch (error) {
          console.error(`Match_PrivKey_Func_0100 1.1 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name SUB_Security_Cert_Match_PrivKey_Func_0200
     * @tc.number SUB_Security_Cert_Match_PrivKey_Func_0200
     * @tc.desc X509证书和pkcs1格式私钥是否匹配
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_Cert_Match_PrivKey_Func_0200",
      TestType.RELIABILITY | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let encodingBlob: cert.EncodingBlob = {
            data: stringToUint8Array(ECC_X509_CERT_PEM),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let matchParams: cert.X509CertMatchParameters = {
            privateKey: ECC_PRIVATE_KEY_PKCS1_PEM
          }
          let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
          let ret: boolean = x509Cert.match(matchParams);
          expect(ret).assertTrue();
        } catch (error) {
          console.error(`Match_PrivKey_Func_0200 1.1 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name SUB_Security_Cert_Match_PrivKey_Func_0300
     * @tc.number SUB_Security_Cert_Match_PrivKey_Func_0300
     * @tc.desc X509证书和pkcs8格式私钥是否匹配
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_Cert_Match_PrivKey_Func_0300",
      TestType.RELIABILITY | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let encodingBlob: cert.EncodingBlob = {
            data: stringToUint8Array(ECC_X509_CERT_PEM),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let matchParams: cert.X509CertMatchParameters = {
            privateKey: ECC_PRIVATE_KEY_PKCS8_PEM
          }
          let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
          let ret: boolean = x509Cert.match(matchParams);
          expect(ret).assertTrue();
        } catch (error) {
          console.error(`Match_PrivKey_Func_0300 1.1 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name SUB_Security_Cert_Match_PrivKey_Func_0400
     * @tc.number SUB_Security_Cert_Match_PrivKey_Func_0400
     * @tc.desc 不匹配的X509证书和私钥异常测试
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_Cert_Match_PrivKey_Func_0400",
      TestType.RELIABILITY | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let encodingBlob: cert.EncodingBlob = {
            data: stringToUint8Array(ECC_X509_CERT_PEM),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let matchParams: cert.X509CertMatchParameters = {
            privateKey: ECC_OTHER_PRIVATE_KEY_PKCS1_PEM
          }
          let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
          let ret: boolean = x509Cert.match(matchParams);
          expect(ret).assertFalse();
        } catch (error) {
          console.error(`Match_PrivKey_Func_0400 1.1 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name SUB_Security_Cert_Match_PrivKey_Func_0500
     * @tc.number SUB_Security_Cert_Match_PrivKey_Func_0500
     * @tc.desc X509证书和加密私钥异常测试
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_Cert_Match_PrivKey_Func_0500",
      TestType.RELIABILITY | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let encodingBlob: cert.EncodingBlob = {
            data: stringToUint8Array(ECC_X509_CERT_PEM),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let matchParams: cert.X509CertMatchParameters = {
            privateKey: ECC_PRIVATE_KEY_ENCRYPT_PEM
          }
          let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
          x509Cert.match(matchParams);
          expect(null).assertFail();
        } catch (error) {
          console.error(`Match_PrivKey_Func_0500 1.1 ${error}, error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name SUB_Security_Cert_Match_PrivKey_Func_0600
     * @tc.number SUB_Security_Cert_Match_PrivKey_Func_0600
     * @tc.desc X509证书和pkcs1、der格式私钥是否匹配
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_Cert_Match_PrivKey_Func_0600",
      TestType.RELIABILITY | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let encodingBlob: cert.EncodingBlob = {
            data: stringToUint8Array(ECC_X509_CERT_PEM),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let matchParams: cert.X509CertMatchParameters = {
            privateKey: new Uint8Array(ECC_PRIVATE_KEY_PKCS1_DER)
          }
          let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
          let ret: boolean = x509Cert.match(matchParams);
          expect(ret).assertTrue();
        } catch (error) {
          console.error(`Match_PrivKey_Func_0600 1.1 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name SUB_Security_Cert_Match_PrivKey_Func_0700
     * @tc.number SUB_Security_Cert_Match_PrivKey_Func_0700
     * @tc.desc X509证书和pkcs8、der格式私钥是否匹配
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_Cert_Match_PrivKey_Func_0700",
      TestType.RELIABILITY | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let encodingBlob: cert.EncodingBlob = {
            data: stringToUint8Array(ECC_X509_CERT_PEM),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let matchParams: cert.X509CertMatchParameters = {
            privateKey: new Uint8Array(ECC_PRIVATE_KEY_PKCS8_DER)
          }
          let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
          let ret: boolean = x509Cert.match(matchParams);
          expect(ret).assertTrue();
        } catch (error) {
          console.error(`Match_PrivKey_Func_0700 1.1 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name SUB_Security_Cert_Match_PrivKey_Func_0800
     * @tc.number SUB_Security_Cert_Match_PrivKey_Func_0800
     * @tc.desc X509证书和pkcs8、pem-uint8array格式私钥是否匹配
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_Cert_Match_PrivKey_Func_0800",
      TestType.RELIABILITY | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let encodingBlob: cert.EncodingBlob = {
            data: stringToUint8Array(ECC_X509_CERT_PEM),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let matchParams: cert.X509CertMatchParameters = {
            privateKey: new Uint8Array(ECC_PRIVATE_KEY_PKCS8_PEM_DER)
          }
          let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
          x509Cert.match(matchParams);
          expect(null).assertFail();
        } catch (error) {
          console.error(`Match_PrivKey_Func_0800 1.1 ${error}, error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION)
        }
        done();
      });

    /**
     * @tc.name SUB_Security_Cert_Match_PrivKey_Func_0900
     * @tc.number SUB_Security_Cert_Match_PrivKey_Func_0900
     * @tc.desc 证书集合对象CertCRLCollection匹配私钥测试
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_Cert_Match_PrivKey_Func_0900",
      TestType.RELIABILITY | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let encodingBlob1: cert.EncodingBlob = {
            data: stringToUint8Array(ECC_X509_CERT_PEM),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let encodingBlob2: cert.EncodingBlob = {
            data: stringToUint8Array(ECC_OTHER_X509_CERT_PEM),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let matchParams: cert.X509CertMatchParameters = {
            privateKey: ECC_PRIVATE_KEY_PKCS8_PEM
          }
          let x509Cert1: cert.X509Cert = await cert.createX509Cert(encodingBlob1);
          let x509Cert2: cert.X509Cert = await cert.createX509Cert(encodingBlob2);
          let collection: cert.CertCRLCollection = cert.createCertCRLCollection([x509Cert1, x509Cert2]);
          let x509Certs = await collection.selectCerts(matchParams);
          expect(x509Certs.length).assertEqual(1);
          let ret: boolean = x509Certs[0].match(matchParams);
          expect(ret).assertTrue();
        } catch (error) {
          console.error(`Match_PrivKey_Func_0900 1.1 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name SUB_Security_Cert_Match_PrivKey_Func_1000
     * @tc.number SUB_Security_Cert_Match_PrivKey_Func_1000
     * @tc.desc 证书链、集合对象CertCRLCollection匹配私钥测试
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_Cert_Match_PrivKey_Func_1000",
      TestType.RELIABILITY | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let rootBlob: cert.EncodingBlob = {
            data: stringToUint8Array(RSA_CERT_CHAIN_ROOT_PEM),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let interBlob: cert.EncodingBlob = {
            data: stringToUint8Array(RSA_CERT_CHAIN_INTER_PEM),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let leafBlob: cert.EncodingBlob = {
            data: stringToUint8Array(RSA_CERT_CHAIN_LEAF_PEM),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let rootCert: cert.X509Cert = await cert.createX509Cert(rootBlob);
          let interCert: cert.X509Cert = await cert.createX509Cert(interBlob);
          let leafCert: cert.X509Cert = await cert.createX509Cert(leafBlob);
          let collection: cert.CertCRLCollection = cert.createCertCRLCollection([leafCert, interCert, rootCert]);
          let param: cert.CertChainBuildParameters = {
            certMatchParameters: {
              privateKey: CHAIN_ENTRY_PRIVATE_KEY_PEM
            },
            validationParameters: {
              trustAnchors: [
                {CACert: leafCert},
                {CACert: interCert}
              ],
              certCRLs: [collection]
            },
          };
          let chainResult: cert.CertChainBuildResult = await cert.buildX509CertChain(param);
          let x509Certs: cert.X509Cert[] = chainResult.certChain.getCertList();
          expect(x509Certs.length).assertEqual(1);
          let ret: boolean = x509Certs[0].match(param.certMatchParameters);
          expect(ret).assertTrue();
          ret = chainResult.validationResult.entityCert.match(param.certMatchParameters);
          expect(ret).assertTrue();
          if (chainResult.validationResult.trustAnchor.CACert) {
            ret = chainResult.validationResult.trustAnchor.CACert?.match(param.certMatchParameters);
            expect(ret).assertTrue();
          }
        } catch (error) {
          console.error(`Match_PrivKey_Func_1000 1.1 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name SUB_Security_Cert_Match_PrivKey_Func_1100
     * @tc.number SUB_Security_Cert_Match_PrivKey_Func_1100
     * @tc.desc 证书链、集合对象CertCRLCollection不匹配的私钥测试
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_Cert_Match_PrivKey_Func_1100",
      TestType.RELIABILITY | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let rootBlob: cert.EncodingBlob = {
            data: stringToUint8Array(RSA_CERT_CHAIN_ROOT_PEM),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let interBlob: cert.EncodingBlob = {
            data: stringToUint8Array(RSA_CERT_CHAIN_INTER_PEM),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let leafBlob: cert.EncodingBlob = {
            data: stringToUint8Array(RSA_CERT_CHAIN_LEAF_PEM),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let rootCert: cert.X509Cert = await cert.createX509Cert(rootBlob);
          let interCert: cert.X509Cert = await cert.createX509Cert(interBlob);
          let leafCert: cert.X509Cert = await cert.createX509Cert(leafBlob);
          let collection: cert.CertCRLCollection = cert.createCertCRLCollection([leafCert, interCert, rootCert]);
          let param: cert.CertChainBuildParameters = {
            certMatchParameters: {
              privateKey: ECC_PRIVATE_KEY_PKCS8_PEM
            },
            validationParameters: {
              trustAnchors: [
                {CACert: leafCert},
                {CACert: interCert}
              ],
              certCRLs: [collection]
            },
          };
          await cert.buildX509CertChain(param);
          expect(null).assertFail();
        } catch (error) {
          console.error(`Match_PrivKey_Func_1100 1.1 ${error}, error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name SUB_Security_Cert_Match_PrivKey_Func_1200
     * @tc.number SUB_Security_Cert_Match_PrivKey_Func_1200
     * @tc.desc 证书集合对象CertCRLCollection不匹配的私钥测试
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it("SUB_Security_Cert_Match_PrivKey_Func_1200",
      TestType.RELIABILITY | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let encodingBlob1: cert.EncodingBlob = {
            data: stringToUint8Array(ECC_X509_CERT_PEM),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let encodingBlob2: cert.EncodingBlob = {
            data: stringToUint8Array(ECC_OTHER_X509_CERT_PEM),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let matchParams: cert.X509CertMatchParameters = {
            privateKey: CHAIN_ENTRY_PRIVATE_KEY_PEM
          }
          let x509Cert1: cert.X509Cert = await cert.createX509Cert(encodingBlob1);
          let x509Cert2: cert.X509Cert = await cert.createX509Cert(encodingBlob2);
          let collection: cert.CertCRLCollection = cert.createCertCRLCollection([x509Cert1, x509Cert2]);
          await collection.selectCerts(matchParams);
          expect(null).assertFail();
        } catch (error) {
          console.error(`Match_PrivKey_Func_1200 1.1 ${error}, error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
        done();
      });
  });
}