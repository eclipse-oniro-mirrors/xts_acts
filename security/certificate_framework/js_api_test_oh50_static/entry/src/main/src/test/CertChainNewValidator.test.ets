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

import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import cert from '@ohos.security.cert';
import { stringToUint8Array } from "./utils/certificate/certPem";
import {
  CHAIN_SM2_3_1_EXPIRED_PEM,
  CHAIN_SM2_3_1_KEY_USAGE_ONLY_DEC_PEM,
  CHAIN_SM2_3_1_NOT_YET_VALID_PEM,
  CHAIN_SM2_3_1_PEM,
  CHAIN_SM2_3_2_CRL_PEM,
  CHAIN_SM2_3_2_PEM, CHAIN_SM2_3_3_PEM,
  CHAIN_SM2_8_1_PEM,
  CHAIN_SM2_8_2_PEM,
  CHAIN_SM2_DEFAULT_3_1_OCSP_RESPONSE_REVOKED_DER,
  CHAIN_SM2_DEFAULT_3_1_PEM,
  CHAIN_SM2_DEFAULT_3_2_CRL_PEM,
  CHAIN_SM2_DEFAULT_3_2_PEM,
  CHAIN_SM2_DEFAULT_3_3_PEM,
  CHAIN_SM2_DEFAULT_UNKNOWN_CRITICAL_EXTENSION_3_1_PEM,
  CHAIN_SM2_INTER_CA_PEM,
  CHAIN_SM2_LEAF_CA_PEM,
  CHAIN_SM2_NOT_EXIST_ROOT_3_1_PEM,
  CHAIN_SM2_NOT_EXIST_ROOT_3_2_PEM,
  CHAIN_SM2_NO_CERT_SIGN_3_2_PEM,
  CHAIN_SM2_NO_DIGITAL_SIGN_3_1_PEM,
  CHAIN_SM2_OTHER_3_3_PEM,
  CHAIN_SM2_ROOT_CA_PEM} from "./utils/certchain/sm2/sm2";
import { CHAIN_ECC_3_1_PEM, CHAIN_ECC_3_2_PEM, CHAIN_ECC_3_3_PEM,
  CHAIN_ECC_EXPIRED_3_2_PEM,
  CHAIN_ECC_EXPIRED_3_3_PEM,
  CHAIN_ECC_YET_3_1_PEM } from "./utils/certchain/ecc/ecc";


export default function certFrameworkCertChainNewValidatorTestUnit() {
  describe("certFrameworkCertChainNewValidatorTestUnit", (): void => {
    // 国密证书
    let leafX509CertGm: cert.X509Cert | undefined; // 可选参数，可以不初始化
    let leafExpiredX509CertGm: cert.X509Cert | undefined;
    let leafYetX509CertGm: cert.X509Cert | undefined;
    let leafKeyUsageOnlyDecryptX509CertGm: cert.X509Cert | undefined;
    let interX509CertGm: cert.X509Cert | undefined;
    let rootX509CertGm: cert.X509Cert | undefined;
    let otherrootX509CertGm: cert.X509Cert | undefined;

    let interX509CrlGm: cert.X509CRL | undefined;
    let interDefaultX509CrlGm: cert.X509CRL | undefined;

    let leafDefaultX509CertGm: cert.X509Cert | undefined;
    let interDefaultX509CertGm: cert.X509Cert | undefined;
    let rootDefaultX509CertGm: cert.X509Cert | undefined;

    let leafUnkownCriticalExtensionX509CertGm: cert.X509Cert | undefined;

    let leafSystemCaX509CertGm: cert.X509Cert | undefined;
    let inter1SystemCaX509CertGm: cert.X509Cert | undefined;

    let interNoCertSignX509CertGm: cert.X509Cert | undefined;
    let leafNoDigitalSignX509CertGm: cert.X509Cert | undefined;

    // 根证书签发多本同级中间CA证书、主题名称一致
    let rootCaCertGm: cert.X509Cert | undefined;
    let interCaCertGm: cert.X509Cert | undefined;
    let leafCaCertGm: cert.X509Cert | undefined;

    // 预置根证书不存在
    let leafX509CertGm2: cert.X509Cert | undefined;
    let interX509CertGm2: cert.X509Cert | undefined;

    // 非国密证书
    let leafX509Cert: cert.X509Cert | undefined;
    let interX509Cert: cert.X509Cert | undefined;
    let rootX509Cert: cert.X509Cert | undefined;

    let leafYetX509Cert: cert.X509Cert | undefined;
    let interExpiredX509Cert: cert.X509Cert | undefined;
    let rootExpiredX509Cert: cert.X509Cert | undefined;
    beforeAll(async () => {
      try {
        let leafUnkownCriticalExtensionDefaultEncodingBlobGm: cert.EncodingBlob = {
          data: stringToUint8Array(CHAIN_SM2_DEFAULT_UNKNOWN_CRITICAL_EXTENSION_3_1_PEM),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let leafDefaultEncodingBlobGm: cert.EncodingBlob = {
          data: stringToUint8Array(CHAIN_SM2_DEFAULT_3_1_PEM),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let interDefaultEncodingBlobGm: cert.EncodingBlob = {
          data: stringToUint8Array(CHAIN_SM2_DEFAULT_3_2_PEM),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let rootDefaultEncodingBlobGm: cert.EncodingBlob = {
          data: stringToUint8Array(CHAIN_SM2_DEFAULT_3_3_PEM),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };

        let interNoCertSignEncodingBlobGm: cert.EncodingBlob = {
          data: stringToUint8Array(CHAIN_SM2_NO_CERT_SIGN_3_2_PEM),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };

        let leafNoDigitalSignEncodingBlobGm: cert.EncodingBlob = {
          data: stringToUint8Array(CHAIN_SM2_NO_DIGITAL_SIGN_3_1_PEM),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };

        let interDefaultCrlEncodingBlobGm: cert.EncodingBlob = {
          data: stringToUint8Array(CHAIN_SM2_DEFAULT_3_2_CRL_PEM),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let leafEncodingBlobGm: cert.EncodingBlob = {
          data: stringToUint8Array(CHAIN_SM2_3_1_PEM),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let leafExpiredEncodingBlobGm: cert.EncodingBlob = {
          data: stringToUint8Array(CHAIN_SM2_3_1_EXPIRED_PEM),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let leafYetEncodingBlobGm: cert.EncodingBlob = {
          data: stringToUint8Array(CHAIN_SM2_3_1_NOT_YET_VALID_PEM),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let leafKeyUsageOnlyDecryptEncodingBlobGm: cert.EncodingBlob = {
          data: stringToUint8Array(CHAIN_SM2_3_1_KEY_USAGE_ONLY_DEC_PEM),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let interEncodingBlobGm: cert.EncodingBlob = {
          data: stringToUint8Array(CHAIN_SM2_3_2_PEM),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let interCrlEncodingBlobGm: cert.EncodingBlob = {
          data: stringToUint8Array(CHAIN_SM2_3_2_CRL_PEM),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let rootEncodingBlobGm: cert.EncodingBlob = {
          data: stringToUint8Array(CHAIN_SM2_3_3_PEM),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let otherRootEncodingBlobGm: cert.EncodingBlob = {
          data: stringToUint8Array(CHAIN_SM2_OTHER_3_3_PEM),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let leafEncodingBlob: cert.EncodingBlob = {
          data: stringToUint8Array(CHAIN_ECC_3_1_PEM),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let interEncodingBlob: cert.EncodingBlob = {
          data: stringToUint8Array(CHAIN_ECC_3_2_PEM),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let rootEncodingBlob: cert.EncodingBlob = {
          data: stringToUint8Array(CHAIN_ECC_3_3_PEM),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let leafEncodingBlobGm2: cert.EncodingBlob = {
          data: stringToUint8Array(CHAIN_SM2_NOT_EXIST_ROOT_3_1_PEM),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let interEncodingBlobGm2: cert.EncodingBlob = {
          data: stringToUint8Array(CHAIN_SM2_NOT_EXIST_ROOT_3_2_PEM),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let leafYetEncodingBlob: cert.EncodingBlob = {
          data: stringToUint8Array(CHAIN_ECC_YET_3_1_PEM),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let interExpiredEncodingBlob: cert.EncodingBlob = {
          data: stringToUint8Array(CHAIN_ECC_EXPIRED_3_2_PEM),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let rootExpiredEncodingBlob: cert.EncodingBlob = {
          data: stringToUint8Array(CHAIN_ECC_EXPIRED_3_3_PEM),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let leafSystemCaEncodingBlobGm: cert.EncodingBlob = {
          data: stringToUint8Array(CHAIN_SM2_8_1_PEM),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let inter1SystemCaEncodingBlobGm: cert.EncodingBlob = {
          data: stringToUint8Array(CHAIN_SM2_8_2_PEM),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };

        let rootCaEncodingBlobGm: cert.EncodingBlob = {
          data: stringToUint8Array(CHAIN_SM2_ROOT_CA_PEM),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let interCaEncodingBlobGm: cert.EncodingBlob = {
          data: stringToUint8Array(CHAIN_SM2_INTER_CA_PEM),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let leafCaEncodingBlobGm: cert.EncodingBlob = {
          data: stringToUint8Array(CHAIN_SM2_LEAF_CA_PEM),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };

        leafX509CertGm = await cert.createX509Cert(leafEncodingBlobGm);
        leafExpiredX509CertGm = await cert.createX509Cert(leafExpiredEncodingBlobGm);
        leafYetX509CertGm = await cert.createX509Cert(leafYetEncodingBlobGm);
        leafKeyUsageOnlyDecryptX509CertGm = await cert.createX509Cert(leafKeyUsageOnlyDecryptEncodingBlobGm);
        interX509CertGm = await cert.createX509Cert(interEncodingBlobGm);
        interX509CrlGm = await cert.createX509CRL(interCrlEncodingBlobGm);
        rootX509CertGm = await cert.createX509Cert(rootEncodingBlobGm);
        otherrootX509CertGm = await cert.createX509Cert(otherRootEncodingBlobGm);
        leafX509Cert = await cert.createX509Cert(leafEncodingBlob);
        interX509Cert = await cert.createX509Cert(interEncodingBlob);
        rootX509Cert = await cert.createX509Cert(rootEncodingBlob);

        leafYetX509Cert = await cert.createX509Cert(leafYetEncodingBlob);
        interExpiredX509Cert = await cert.createX509Cert(interExpiredEncodingBlob);
        rootExpiredX509Cert = await cert.createX509Cert(rootExpiredEncodingBlob);

        leafDefaultX509CertGm = await cert.createX509Cert(leafDefaultEncodingBlobGm);
        interDefaultX509CertGm = await cert.createX509Cert(interDefaultEncodingBlobGm);
        rootDefaultX509CertGm = await cert.createX509Cert(rootDefaultEncodingBlobGm);

        leafSystemCaX509CertGm = await cert.createX509Cert(leafSystemCaEncodingBlobGm);
        inter1SystemCaX509CertGm = await cert.createX509Cert(inter1SystemCaEncodingBlobGm);

        interNoCertSignX509CertGm = await cert.createX509Cert(interNoCertSignEncodingBlobGm);
        leafNoDigitalSignX509CertGm = await cert.createX509Cert(leafNoDigitalSignEncodingBlobGm);

        interDefaultX509CrlGm = await cert.createX509CRL(interDefaultCrlEncodingBlobGm);

        leafX509CertGm2 = await cert.createX509Cert(leafEncodingBlobGm2);
        interX509CertGm2 = await cert.createX509Cert(interEncodingBlobGm2);

        rootCaCertGm = await cert.createX509Cert(rootCaEncodingBlobGm);
        interCaCertGm = await cert.createX509Cert(interCaEncodingBlobGm);
        leafCaCertGm = await cert.createX509Cert(leafCaEncodingBlobGm);

        leafUnkownCriticalExtensionX509CertGm = await cert.createX509Cert(leafUnkownCriticalExtensionDefaultEncodingBlobGm);
      } catch (error) {
        console.error(`beforeAll "${error}", error code: ${error.code}`);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_New_Chain_Func_0100
     * @tc.number SUB_Security_Cert_Framework_New_Chain_Func_0100
     * @tc.desc   完整校验，设置待校验实体证书，不信任中间证书，信任根证书，设置SM2用户ID参数的功能测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_New_Chain_Func_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "PKIX";
        let validatorParams: cert.X509CertValidatorParams = {
          trustedCerts: [rootX509CertGm!],
          untrustedCerts: [interX509CertGm!],
          userId: new Uint8Array([ // 01234567890123456789
            0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39,
            0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39
          ])
        };
        let validator: cert.CertChainValidator = cert.createCertChainValidator(algName);
        let chainResult: cert.VerifyCertResult = await validator.validate(leafX509CertGm!, validatorParams);
        expect(chainResult.certChain.length).assertEqual(3);
      } catch (error) {
        console.error(`"${error}", error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_New_Chain_Func_0200
     * @tc.number SUB_Security_Cert_Framework_New_Chain_Func_0200
     * @tc.desc   不完整校验，设置待校验实体证书，不信任中间证书、根证书，信任中间证书，设置SM2用户ID参数的功能测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_New_Chain_Func_0200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "PKIX";
          let validatorParams: cert.X509CertValidatorParams = {
            trustedCerts: [interX509CertGm!],
            untrustedCerts: [interX509CertGm!, rootX509CertGm!],
            userId: new Uint8Array([ // 01234567890123456789
              0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39,
              0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39
            ]),
            partialChain: true
          };
          let validator: cert.CertChainValidator = cert.createCertChainValidator(algName);
          let chainResult: cert.VerifyCertResult = await validator.validate(leafX509CertGm!, validatorParams);
          expect(chainResult.certChain.length).assertEqual(2);
        } catch (error) {
          console.error(`"${error}", error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_New_Chain_Func_0300
     * @tc.number SUB_Security_Cert_Framework_New_Chain_Func_0300
     * @tc.desc   完整校验，设置待校验实体证书，不信任中间证书，开启预置根证书能力，设置SM2用户ID参数的功能测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_New_Chain_Func_0300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,   async (done: () => void): Promise<void> => {
        try {
          let algName: string = "PKIX";
          let validatorParams: cert.X509CertValidatorParams = {
            trustSystemCa: true, // 70d62b81.0
            untrustedCerts: [interX509CertGm!],
            userId: new Uint8Array([ // 01234567890123456789
              0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39,
              0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39
            ]),
          };
          let validator: cert.CertChainValidator = cert.createCertChainValidator(algName);
          let chainResult: cert.VerifyCertResult = await validator.validate(leafX509CertGm!, validatorParams);
          expect(chainResult.certChain.length).assertEqual(3);
        } catch (error) {
          console.error(`"${error}", error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_New_Chain_Func_0400
     * @tc.number SUB_Security_Cert_Framework_New_Chain_Func_0400
     * @tc.desc   完整校验，设置待校验实体证书，不信任中间证书，信任异常根证书，设置SM2用户ID参数的功能测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_New_Chain_Func_0400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "PKIX";
          let validatorParams: cert.X509CertValidatorParams = {
            trustedCerts: [otherrootX509CertGm!],
            untrustedCerts: [interX509CertGm!],
            userId: new Uint8Array([ // 01234567890123456789
              0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39,
              0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39
            ]),
            partialChain: true
          };
          let validator: cert.CertChainValidator = cert.createCertChainValidator(algName);
          await validator.validate(leafX509CertGm!, validatorParams);
          expect(null).assertFail();
        } catch (error) {
          console.error(`"${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_UNABLE_TO_GET_ISSUER_CERT_LOCALLY);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_New_Chain_Func_0500
     * @tc.number SUB_Security_Cert_Framework_New_Chain_Func_0500
     * @tc.desc   完整校验，设置待校验实体证书，不信任中间证书，开启预置根证书能力，设置异常的SM2用户ID参数的功能测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_New_Chain_Func_0500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "PKIX";
          let validatorParams: cert.X509CertValidatorParams = {
            trustSystemCa: true, // 70d62b81.0
            untrustedCerts: [interX509CertGm!],
            userId: new Uint8Array([ // 01234567890123456789 -> 01234567890123456788
              0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39,
              0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x38
            ]),
            partialChain: true
          };
          let validator: cert.CertChainValidator = cert.createCertChainValidator(algName);
          await validator.validate(leafX509CertGm!, validatorParams);
          expect(null).assertFail();
        } catch (error) {
          console.error(`"${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_CERT_SIGNATURE_FAILURE);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_New_Chain_Func_0600
     * @tc.number SUB_Security_Cert_Framework_New_Chain_Func_0600
     * @tc.desc   完整校验，设置非国密待校验实体证书，不信任中间证书，信任根证书，设置SM2用户ID参数的功能测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_New_Chain_Func_0600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "PKIX";
          let validatorParams: cert.X509CertValidatorParams = {
            trustedCerts: [rootX509Cert!],
            untrustedCerts: [interX509Cert!],
            userId: new Uint8Array([
              0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39,
              0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39
            ])
          };
          let validator: cert.CertChainValidator = cert.createCertChainValidator(algName);
          await validator.validate(leafX509Cert!, validatorParams);
          expect(null).assertFail();
        } catch (error) {
          console.error(`"${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_CERT_SIGNATURE_FAILURE);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_New_Chain_Func_0700
     * @tc.number SUB_Security_Cert_Framework_New_Chain_Func_0700
     * @tc.desc   完整校验，设置待校验实体证书，不信任中间证书，开启预置根证书能力，设置SM2用户ID参数长度超128字节
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_New_Chain_Func_0700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "PKIX";
          let validatorParams: cert.X509CertValidatorParams = {
            trustSystemCa: true, // 70d62b81.0
            untrustedCerts: [interX509CertGm!],
            partialChain: true
          };
          let userId: Uint8Array = new Uint8Array(129);
          validatorParams.userId = userId;
          let validator: cert.CertChainValidator = cert.createCertChainValidator(algName);
          await validator.validate(leafX509CertGm!, validatorParams);
          expect(null).assertFail();
        } catch (error) {
          console.error(`"${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_PARAMETER_CHECK_FAILED);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_New_Chain_Func_1000
     * @tc.number SUB_Security_Cert_Framework_New_Chain_Func_1000
     * @tc.desc   完整校验，设置过期待校验实体证书，不信任中间证书，信任根证书，设置SM2用户ID参数的功能测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_New_Chain_Func_1000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "PKIX";
          let validatorParams: cert.X509CertValidatorParams = {
            trustedCerts: [rootX509CertGm!],
            untrustedCerts: [interX509CertGm!],
            userId: new Uint8Array([ // 01234567890123456789
              0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39,
              0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39
            ])
          };
          let validator: cert.CertChainValidator = cert.createCertChainValidator(algName);
          await validator.validate(leafExpiredX509CertGm!, validatorParams);
          expect(null).assertFail();
        } catch (error) {
          console.error(`"${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_CERT_HAS_EXPIRED);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_New_Chain_Func_1100
     * @tc.number SUB_Security_Cert_Framework_New_Chain_Func_1100
     * @tc.desc   完整校验，设置未生效待校验实体证书，不信任中间证书，信任根证书，设置SM2用户ID参数的功能测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_New_Chain_Func_1100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "PKIX";
          let validatorParams: cert.X509CertValidatorParams = {
            trustedCerts: [rootX509CertGm!],
            untrustedCerts: [interX509CertGm!],
            userId: new Uint8Array([ // 01234567890123456789
              0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39,
              0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39
            ])
          };
          let validator: cert.CertChainValidator = cert.createCertChainValidator(algName);
          await validator.validate(leafYetX509CertGm!, validatorParams);
          expect(null).assertFail();
        } catch (error) {
          console.error(`"${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_CERT_NOT_YET_VALID);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_New_Chain_Func_1200
     * @tc.number SUB_Security_Cert_Framework_New_Chain_Func_1200
     * @tc.desc   完整校验，设置待校验实体证书-未生效证书，不信任中间证书，信任根证书，设置SM2用户ID参数的功能测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_New_Chain_Func_1200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "PKIX";
          let validatorParams: cert.X509CertValidatorParams = {
            trustedCerts: [rootX509CertGm!],
            untrustedCerts: [interX509CertGm!],
            userId: new Uint8Array([ // 01234567890123456789
              0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39,
              0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39
            ]),
          };
          let validator: cert.CertChainValidator = cert.createCertChainValidator(algName);
          await validator.validate(leafYetX509CertGm!, validatorParams);
          expect(null).assertFail();
        } catch (error) {
          console.error(`"${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_CERT_NOT_YET_VALID);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_New_Chain_Func_1300
     * @tc.number SUB_Security_Cert_Framework_New_Chain_Func_1300
     * @tc.desc   完整校验，设置待校验实体证书，不信任中间证书，信任根证书，设置SM2用户ID参数，设置未生效的date，的功能测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_New_Chain_Func_1300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "PKIX";
          let validatorParams: cert.X509CertValidatorParams = {
            trustedCerts: [rootX509CertGm!],
            untrustedCerts: [interX509CertGm!],
            userId: new Uint8Array([ // 01234567890123456789
              0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39,
              0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39
            ]),
            validateDate: true,
            date: "20260408012032Z" // YYYYMMDDHHMMSSZ
          };
          let validator: cert.CertChainValidator = cert.createCertChainValidator(algName);
          await validator.validate(leafX509CertGm!, validatorParams);
          expect(null).assertFail();
        } catch (error) {
          console.error(`"${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_CERT_NOT_YET_VALID);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_New_Chain_Func_1400
     * @tc.number SUB_Security_Cert_Framework_New_Chain_Func_1400
     * @tc.desc   完整校验，设置待校验实体证书，不信任中间证书，信任根证书，设置SM2用户ID参数，设置过期的date，的功能测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_New_Chain_Func_1400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "PKIX";
          let validatorParams: cert.X509CertValidatorParams = {
            trustedCerts: [rootX509CertGm!],
            untrustedCerts: [interX509CertGm!],
            userId: new Uint8Array([ // 01234567890123456789
              0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39,
              0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39
            ]),
            date: "490408012032Z" // YYMMDDHHMMSSZ - RFC5280-4.1.2.5.1
          };
          let validator: cert.CertChainValidator = cert.createCertChainValidator(algName);
          await validator.validate(leafX509CertGm!, validatorParams);
          expect(null).assertFail();
        } catch (error) {
          console.error(`"${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_CERT_HAS_EXPIRED);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_New_Chain_Func_1500
     * @tc.number SUB_Security_Cert_Framework_New_Chain_Func_1500
     * @tc.desc   完整校验，设置待校验实体证书，不信任中间证书，信任根证书，设置SM2用户ID参数，设置过期的date，的功能测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_New_Chain_Func_1500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "PKIX";
          let validatorParams: cert.X509CertValidatorParams = {
            trustedCerts: [rootX509CertGm!],
            untrustedCerts: [interX509CertGm!],
            userId: new Uint8Array([ // 01234567890123456789
              0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39,
              0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39
            ]),
            date: "500408012032Z" // YYMMDDHHMMSSZ - 不符合规范要求，RFC5280-4.1.2.5.1，对比用例1600
          };
          let validator: cert.CertChainValidator = cert.createCertChainValidator(algName);
          await validator.validate(leafX509CertGm!, validatorParams);
          expect(null).assertFail();
        } catch (error) {
          console.error(`"${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_CERT_NOT_YET_VALID);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_New_Chain_Func_1600
     * @tc.number SUB_Security_Cert_Framework_New_Chain_Func_1600
     * @tc.desc   完整校验，设置待校验实体证书，不信任中间证书，信任根证书，设置SM2用户ID参数，设置过期的date，的功能测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_New_Chain_Func_1600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "PKIX";
          let validatorParams: cert.X509CertValidatorParams = {
            trustedCerts: [rootX509CertGm!],
            untrustedCerts: [interX509CertGm!],
            userId: new Uint8Array([ // 01234567890123456789
              0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39,
              0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39
            ]),
            date: "20490408012032Z" // YYYYMMDDHHMMSSZ - 符合规范要求，RFC5280-4.1.2.5.1
          };
          let validator: cert.CertChainValidator = cert.createCertChainValidator(algName);
          await validator.validate(leafX509CertGm!, validatorParams);
          expect(null).assertFail();
        } catch (error) {
          console.error(`"${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_CERT_HAS_EXPIRED);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_New_Chain_Func_1700
     * @tc.number SUB_Security_Cert_Framework_New_Chain_Func_1700
     * @tc.desc   完整校验，设置待校验实体证书，不信任中间证书，信任根证书，设置主机名的功能测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_New_Chain_Func_1700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "PKIX";
          let validatorParams: cert.X509CertValidatorParams = {
            trustedCerts: [rootX509CertGm!],
            untrustedCerts: [interX509CertGm!],
            userId: new Uint8Array([ // 01234567890123456789
              0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39,
              0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39
            ]),
            hostnames: ["user1.example.com", "user2.example.com"] // 含匹配和不匹配
          };
          let validator: cert.CertChainValidator = cert.createCertChainValidator(algName);
          let chainResult: cert.VerifyCertResult = await validator.validate(leafX509CertGm!, validatorParams);
          expect(chainResult.certChain.length).assertEqual(3);
        } catch (error) {
          console.error(`"${error}", error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_New_Chain_Func_1800
     * @tc.number SUB_Security_Cert_Framework_New_Chain_Func_1800
     * @tc.desc   完整校验，设置待校验实体证书，不信任中间证书，信任根证书，设置不匹配的主机名的功能测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_New_Chain_Func_1800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "PKIX";
          let validatorParams: cert.X509CertValidatorParams = {
            trustedCerts: [rootX509CertGm!],
            untrustedCerts: [interX509CertGm!],
            userId: new Uint8Array([ // 01234567890123456789
              0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39,
              0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39
            ]),
            hostnames: ["user2.example.com", "user1.example.cn", ".*", "*", "*.*.*"] // 不匹配
          };
          let validator: cert.CertChainValidator = cert.createCertChainValidator(algName);
          await validator.validate(leafX509CertGm!, validatorParams);
          expect(null).assertFail();
        } catch (error) {
          console.error(`"${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_CERT_HOSTNAME_MISMATCH);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_New_Chain_Func_1900
     * @tc.number SUB_Security_Cert_Framework_New_Chain_Func_1900
     * @tc.desc   完整校验，设置待校验实体证书，不信任中间证书，信任根证书，设置不匹配的email的功能测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_New_Chain_Func_1900",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "PKIX";
          let validatorParams: cert.X509CertValidatorParams = {
            trustedCerts: [rootX509CertGm!],
            untrustedCerts: [interX509CertGm!],
            userId: new Uint8Array([ // 01234567890123456789
              0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39,
              0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39
            ]),
            emailAddresses: ["admin3@example.com"] // 不匹配
          };
          let validator: cert.CertChainValidator = cert.createCertChainValidator(algName);
          await validator.validate(leafX509CertGm!, validatorParams);
          expect(null).assertFail();
        } catch (error) {
          console.error(`"${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_CERT_EMAIL_ADDRESS_MISMATCH);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_New_Chain_Func_2000
     * @tc.number SUB_Security_Cert_Framework_New_Chain_Func_2000
     * @tc.desc   完整校验，设置待校验实体证书，不信任中间证书，信任根证书，设置email数组长度大于1的功能测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_New_Chain_Func_2000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "PKIX";
          let validatorParams: cert.X509CertValidatorParams = {
            trustedCerts: [rootX509CertGm!],
            untrustedCerts: [interX509CertGm!],
            userId: new Uint8Array([ // 01234567890123456789
              0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39,
              0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39
            ]),
            emailAddresses: ["admin1@example.com", "admin2@example.com"] // 数组长度大于1，规格是1
          };
          let validator: cert.CertChainValidator = cert.createCertChainValidator(algName);
          await validator.validate(leafX509CertGm!, validatorParams);
          expect(null).assertFail();
        } catch (error) {
          console.error(`"${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_PARAMETER_CHECK_FAILED);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_New_Chain_Func_2100
     * @tc.number SUB_Security_Cert_Framework_New_Chain_Func_2100
     * @tc.desc   完整校验，设置待校验实体证书，不信任中间证书，信任根证书，设置email的功能测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_New_Chain_Func_2100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "PKIX";
          let validatorParams: cert.X509CertValidatorParams = {
            trustedCerts: [rootX509CertGm!],
            untrustedCerts: [interX509CertGm!],
            userId: new Uint8Array([ // 01234567890123456789
              0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39,
              0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39
            ]),
            emailAddresses: ["admin2@example.com"] // 匹配
          };
          let validator: cert.CertChainValidator = cert.createCertChainValidator(algName);
          let chainResult: cert.VerifyCertResult = await validator.validate(leafX509CertGm!, validatorParams);
          expect(chainResult.certChain.length).assertEqual(3);
        } catch (error) {
          console.error(`"${error}", error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_New_Chain_Func_2300
     * @tc.number SUB_Security_Cert_Framework_New_Chain_Func_2300
     * @tc.desc   完整校验，设置待校验实体证书，信任中间证书、根证书功能测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_New_Chain_Func_2300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "PKIX";
          let validatorParams: cert.X509CertValidatorParams = {
            trustedCerts: [rootX509Cert!, interX509Cert!],
          };
          let validator: cert.CertChainValidator = cert.createCertChainValidator(algName);
          let chainResult: cert.VerifyCertResult = await validator.validate(leafX509Cert!, validatorParams);
          expect(chainResult.certChain.length).assertEqual(3);
        } catch (error) {
          console.error(`"${error}", error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_New_Chain_Func_2400
     * @tc.number SUB_Security_Cert_Framework_New_Chain_Func_2400
     * @tc.desc   完整校验，设置待校验实体证书，不信任中间证书， 信任中间证书、根证书的功能测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_New_Chain_Func_2400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "PKIX";
          let validatorParams: cert.X509CertValidatorParams = {
            trustedCerts: [rootX509Cert!, interX509Cert!],
            untrustedCerts: [interX509Cert!]
          };
          let validator: cert.CertChainValidator = cert.createCertChainValidator(algName);
          let chainResult: cert.VerifyCertResult = await validator.validate(leafX509Cert!, validatorParams);
          expect(chainResult.certChain.length).assertEqual(3);
        } catch (error) {
          console.error(`"${error}", error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_New_Chain_Func_2500
     * @tc.number SUB_Security_Cert_Framework_New_Chain_Func_2500
     * @tc.desc   完整校验，设置待校验实体证书，不信任中间证书、根证书， 信任根证书的功能测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_New_Chain_Func_2500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "PKIX";
          let validatorParams: cert.X509CertValidatorParams = {
            trustedCerts: [rootX509Cert!],
            untrustedCerts: [rootX509Cert!, interX509Cert!]
          };
          let validator: cert.CertChainValidator = cert.createCertChainValidator(algName);
          let chainResult: cert.VerifyCertResult = await validator.validate(leafX509Cert!, validatorParams);
          expect(chainResult.certChain.length).assertEqual(3);
        } catch (error) {
          console.error(`"${error}", error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_New_Chain_Func_2600
     * @tc.number SUB_Security_Cert_Framework_New_Chain_Func_2600
     * @tc.desc   不完整校验，设置待校验实体证书，不信任中间证书、根证书， 信任中间证书的功能测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_New_Chain_Func_2600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "PKIX";
          let validatorParams: cert.X509CertValidatorParams = {
            trustedCerts: [interX509Cert!],
            untrustedCerts: [rootX509Cert!, interX509Cert!],
            partialChain: true
          };
          let validator: cert.CertChainValidator = cert.createCertChainValidator(algName);
          let chainResult: cert.VerifyCertResult = await validator.validate(leafX509Cert!, validatorParams);
          expect(chainResult.certChain.length).assertEqual(2);
        } catch (error) {
          console.error(`"${error}", error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_New_Chain_Func_2700
     * @tc.number SUB_Security_Cert_Framework_New_Chain_Func_2700
     * @tc.desc   完整校验，设置待校验实体证书，不信任中间证书，信任根证书，设置单个密钥用途的功能测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_New_Chain_Func_2700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "PKIX";
        let validatorParams: cert.X509CertValidatorParams = {
          trustedCerts: [rootX509CertGm!],
          untrustedCerts: [interX509CertGm!],
          userId: new Uint8Array([
            0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39,
            0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39
          ]),
          keyUsage: [cert.KeyUsageType.KEYUSAGE_DECIPHER_ONLY]
        };
        let validator: cert.CertChainValidator = cert.createCertChainValidator(algName);
        let chainResult: cert.VerifyCertResult = await validator.validate(leafKeyUsageOnlyDecryptX509CertGm!, validatorParams);
        expect(chainResult.certChain.length).assertEqual(3);
      } catch (error) {
        console.error(`"${error}", error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_New_Chain_Func_2800
     * @tc.number SUB_Security_Cert_Framework_New_Chain_Func_2800
     * @tc.desc   完整校验，设置待校验实体证书，不信任中间证书，信任根证书，设置多个密钥用途的功能测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_New_Chain_Func_2800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "PKIX";
        let validatorParams: cert.X509CertValidatorParams = {
          trustedCerts: [rootX509CertGm!],
          untrustedCerts: [interX509CertGm!],
          userId: new Uint8Array([
            0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39,
            0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39
          ]),
          keyUsage: [
            cert.KeyUsageType.KEYUSAGE_DIGITAL_SIGNATURE,
            cert.KeyUsageType.KEYUSAGE_KEY_ENCIPHERMENT
          ]
        };
        let validator: cert.CertChainValidator = cert.createCertChainValidator(algName);
        let chainResult: cert.VerifyCertResult = await validator.validate(leafX509CertGm!, validatorParams);
        expect(chainResult.certChain.length).assertEqual(3);
      } catch (error) {
        console.error(`"${error}", error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_New_Chain_Func_2900
     * @tc.number SUB_Security_Cert_Framework_New_Chain_Func_2900
     * @tc.desc   完整校验，设置待校验实体证书，不信任中间证书，信任根证书，设置不匹配的密钥用途的功能测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_New_Chain_Func_2900",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "PKIX";
        let validatorParams: cert.X509CertValidatorParams = {
          trustedCerts: [rootX509CertGm!],
          untrustedCerts: [interX509CertGm!],
          userId: new Uint8Array([
            0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39,
            0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39
          ]),
          keyUsage: [cert.KeyUsageType.KEYUSAGE_CRL_SIGN]
        };
        let validator: cert.CertChainValidator = cert.createCertChainValidator(algName);
        await validator.validate(leafKeyUsageOnlyDecryptX509CertGm!, validatorParams);
        expect(null).assertFail();
      } catch (error) {
        console.error(`"${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.ERR_CERT_KEYUSAGE_MISMATCH);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_New_Chain_Func_3000
     * @tc.number SUB_Security_Cert_Framework_New_Chain_Func_3000
     * @tc.desc   完整校验，设置待校验实体证书，不信任中间证书，信任根证书，设置空密钥用途数组的功能测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_New_Chain_Func_3000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "PKIX";
        let validatorParams: cert.X509CertValidatorParams = {
          trustedCerts: [rootX509CertGm!],
          untrustedCerts: [interX509CertGm!],
          userId: new Uint8Array([
            0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39,
            0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39
          ]),
          keyUsage: []
        };
        let validator: cert.CertChainValidator = cert.createCertChainValidator(algName);
        let chainResult: cert.VerifyCertResult = await validator.validate(leafX509CertGm!, validatorParams);
        expect(chainResult.certChain.length).assertEqual(3);
      } catch (error) {
        console.error(`"${error}", error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_New_Chain_Func_3100
     * @tc.number SUB_Security_Cert_Framework_New_Chain_Func_3100
     * @tc.desc   完整校验，设置待校验实体证书，不信任中间证书，信任根证书，设置密钥用途超过9个的功能测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_New_Chain_Func_3100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "PKIX";
        let validatorParams: cert.X509CertValidatorParams = {
          trustedCerts: [rootX509CertGm!],
          untrustedCerts: [interX509CertGm!],
          userId: new Uint8Array([
            0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39,
            0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39
          ]),
          keyUsage: [
            cert.KeyUsageType.KEYUSAGE_DIGITAL_SIGNATURE,
            cert.KeyUsageType.KEYUSAGE_NON_REPUDIATION,
            cert.KeyUsageType.KEYUSAGE_KEY_ENCIPHERMENT,
            cert.KeyUsageType.KEYUSAGE_DATA_ENCIPHERMENT,
            cert.KeyUsageType.KEYUSAGE_KEY_AGREEMENT,
            cert.KeyUsageType.KEYUSAGE_KEY_CERT_SIGN,
            cert.KeyUsageType.KEYUSAGE_CRL_SIGN,
            cert.KeyUsageType.KEYUSAGE_ENCIPHER_ONLY,
            cert.KeyUsageType.KEYUSAGE_DECIPHER_ONLY,
            cert.KeyUsageType.KEYUSAGE_DIGITAL_SIGNATURE
          ]
        };
        let validator: cert.CertChainValidator = cert.createCertChainValidator(algName);
        await validator.validate(leafX509CertGm!, validatorParams);
        expect(null).assertFail();
      } catch (error) {
        console.error(`"${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.ERR_PARAMETER_CHECK_FAILED);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_New_Chain_Func_3400
     * @tc.number SUB_Security_Cert_Framework_New_Chain_Func_3400
     * @tc.desc   完整校验，设置过期待校验实体证书，设置忽略过期错误的功能测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_New_Chain_Func_3400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "PKIX";
        let validatorParams: cert.X509CertValidatorParams = {
          trustedCerts: [rootX509CertGm!],
          untrustedCerts: [interX509CertGm!],
          userId: new Uint8Array([
            0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39,
            0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39
          ]),
          ignoreErrs: [cert.CertResult.ERR_CERT_HAS_EXPIRED]
        };
        let validator: cert.CertChainValidator = cert.createCertChainValidator(algName);
        let chainResult: cert.VerifyCertResult = await validator.validate(leafExpiredX509CertGm!, validatorParams);
        expect(chainResult.certChain.length).assertEqual(3);
      } catch (error) {
        console.error(`"${error}", error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_New_Chain_Func_3500
     * @tc.number SUB_Security_Cert_Framework_New_Chain_Func_3500
     * @tc.desc   完整校验，设置未生效待校验实体证书，设置忽略未生效错误的功能测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_New_Chain_Func_3500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "PKIX";
        let validatorParams: cert.X509CertValidatorParams = {
          trustedCerts: [rootX509CertGm!],
          untrustedCerts: [interX509CertGm!],
          userId: new Uint8Array([
            0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39,
            0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39
          ]),
          ignoreErrs: [cert.CertResult.ERR_CERT_NOT_YET_VALID]
        };
        let validator: cert.CertChainValidator = cert.createCertChainValidator(algName);
        let chainResult: cert.VerifyCertResult = await validator.validate(leafYetX509CertGm!, validatorParams);
        expect(chainResult.certChain.length).assertEqual(3);
      } catch (error) {
        console.error(`"${error}", error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_New_Chain_Func_3600
     * @tc.number SUB_Security_Cert_Framework_New_Chain_Func_3600
     * @tc.desc   完整校验，设置待校验实体证书，不信任中间证书，信任根证书，设置忽略主机名不匹配错误的功能测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_New_Chain_Func_3600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "PKIX";
        let validatorParams: cert.X509CertValidatorParams = {
          trustedCerts: [rootX509CertGm!],
          untrustedCerts: [interX509CertGm!],
          userId: new Uint8Array([
            0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39,
            0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39
          ]),
          hostnames: ["invalid.example.com"],
          ignoreErrs: [cert.CertResult.ERR_CERT_HOSTNAME_MISMATCH] // 仅支持特定场景错误码
        };
        let validator: cert.CertChainValidator = cert.createCertChainValidator(algName);
        await validator.validate(leafX509CertGm!, validatorParams);
        expect(null).assertFail();
      } catch (error) {
        console.error(`"${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.ERR_PARAMETER_CHECK_FAILED);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_New_Chain_Func_3700
     * @tc.number SUB_Security_Cert_Framework_New_Chain_Func_3700
     * @tc.desc   完整校验，设置过期待校验实体证书，设置忽略多个错误（含不可忽略的场景）的功能测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_New_Chain_Func_3700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "PKIX";
        let validatorParams: cert.X509CertValidatorParams = {
          trustedCerts: [rootX509CertGm!],
          untrustedCerts: [interX509CertGm!],
          userId: new Uint8Array([
            0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39,
            0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39
          ]),
          ignoreErrs: [
            cert.CertResult.ERR_CERT_HAS_EXPIRED,
            cert.CertResult.ERR_CERT_HOSTNAME_MISMATCH,
            cert.CertResult.ERR_CERT_EMAIL_ADDRESS_MISMATCH
          ]
        };
        let validator: cert.CertChainValidator = cert.createCertChainValidator(algName);
        await validator.validate(leafExpiredX509CertGm!, validatorParams);
        expect(null).assertFail();
      } catch (error) {
        console.error(`"${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.ERR_PARAMETER_CHECK_FAILED);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_New_Chain_Func_3800
     * @tc.number SUB_Security_Cert_Framework_New_Chain_Func_3800
     * @tc.desc   完整校验，设置过期待校验实体证书，设置空ignoreErrs数组的功能测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_New_Chain_Func_3800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "PKIX";
        let validatorParams: cert.X509CertValidatorParams = {
          trustedCerts: [rootX509CertGm!],
          untrustedCerts: [interX509CertGm!],
          userId: new Uint8Array([
            0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39,
            0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39
          ]),
          ignoreErrs: []
        };
        let validator: cert.CertChainValidator = cert.createCertChainValidator(algName);
        await validator.validate(leafExpiredX509CertGm!, validatorParams);
        expect(null).assertFail();
      } catch (error) {
        console.error(`"${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.ERR_CERT_HAS_EXPIRED);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_New_Chain_Func_3900
     * @tc.number SUB_Security_Cert_Framework_New_Chain_Func_3900
     * @tc.desc   完整校验，设置过期待校验实体证书，设置validateDate为false的功能测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_New_Chain_Func_3900",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "PKIX";
        let validatorParams: cert.X509CertValidatorParams = {
          trustedCerts: [rootX509CertGm!],
          untrustedCerts: [interX509CertGm!],
          userId: new Uint8Array([
            0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39,
            0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39
          ]),
          validateDate: false
        };
        let validator: cert.CertChainValidator = cert.createCertChainValidator(algName);
        let chainResult: cert.VerifyCertResult = await validator.validate(leafExpiredX509CertGm!, validatorParams);
        expect(chainResult.certChain.length).assertEqual(3);
      } catch (error) {
        console.error(`"${error}", error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_New_Chain_Func_4000
     * @tc.number SUB_Security_Cert_Framework_New_Chain_Func_4000
     * @tc.desc   完整校验，设置待校验实体证书，设置trustedCerts超过100个的功能测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_New_Chain_Func_4000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "PKIX";
        let trustedCertsArray: cert.X509Cert[] = [];
        for (let i = 0; i < 101; i++) {
          trustedCertsArray.push(rootX509CertGm!);
        }
        let validatorParams: cert.X509CertValidatorParams = {
          trustedCerts: trustedCertsArray,
          userId: new Uint8Array([
            0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39,
            0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39
          ])
        };
        let validator: cert.CertChainValidator = cert.createCertChainValidator(algName);
        await validator.validate(leafX509CertGm!, validatorParams);
        expect(null).assertFail();
      } catch (error) {
        console.error(`"${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.ERR_PARAMETER_CHECK_FAILED);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_New_Chain_Func_4100
     * @tc.number SUB_Security_Cert_Framework_New_Chain_Func_4100
     * @tc.desc   完整校验，设置待校验实体证书，设置untrustedCerts超过100个的功能测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_New_Chain_Func_4100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "PKIX";
        let untrustedCertsArray: cert.X509Cert[] = [];
        for (let i = 0; i < 101; i++) {
          untrustedCertsArray.push(interX509CertGm!);
        }
        let validatorParams: cert.X509CertValidatorParams = {
          trustedCerts: [rootX509CertGm!],
          untrustedCerts: untrustedCertsArray,
          userId: new Uint8Array([
            0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39,
            0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39
          ])
        };
        let validator: cert.CertChainValidator = cert.createCertChainValidator(algName);
        await validator.validate(leafX509CertGm!, validatorParams);
        expect(null).assertFail();
      } catch (error) {
        console.error(`"${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.ERR_PARAMETER_CHECK_FAILED);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_New_Chain_Func_4200
     * @tc.number SUB_Security_Cert_Framework_New_Chain_Func_4200
     * @tc.desc   完整校验，设置待校验实体证书，设置hostnames超过100个的功能测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_New_Chain_Func_4200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "PKIX";
        let hostnamesArray: string[] = [];
        for (let i = 0; i < 101; i++) {
          hostnamesArray.push("example" + i + ".com");
        }
        let validatorParams: cert.X509CertValidatorParams = {
          trustedCerts: [rootX509CertGm!],
          untrustedCerts: [interX509CertGm!],
          userId: new Uint8Array([
            0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39,
            0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39
          ]),
          hostnames: hostnamesArray
        };
        let validator: cert.CertChainValidator = cert.createCertChainValidator(algName);
        await validator.validate(leafX509CertGm!, validatorParams);
        expect(null).assertFail();
      } catch (error) {
        console.error(`"${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.ERR_PARAMETER_CHECK_FAILED);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_New_Chain_Func_4300
     * @tc.number SUB_Security_Cert_Framework_New_Chain_Func_4300
     * @tc.desc   完整校验，设置待校验实体证书，设置hostname长度超过128的功能测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_New_Chain_Func_4300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "PKIX";
        let longHostname: string = "a".repeat(129) + ".com";
        let validatorParams: cert.X509CertValidatorParams = {
          trustedCerts: [rootX509CertGm!],
          untrustedCerts: [interX509CertGm!],
          userId: new Uint8Array([
            0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39,
            0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39
          ]),
          hostnames: [longHostname]
        };
        let validator: cert.CertChainValidator = cert.createCertChainValidator(algName);
        await validator.validate(leafX509CertGm!, validatorParams);
        expect(null).assertFail();
      } catch (error) {
        console.error(`"${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.ERR_PARAMETER_CHECK_FAILED);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_New_Chain_Func_4400
     * @tc.number SUB_Security_Cert_Framework_New_Chain_Func_4400
     * @tc.desc   完整校验，设置待校验实体证书，设置emailAddress长度超过128的功能测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_New_Chain_Func_4400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "PKIX";
        let longEmail: string = "a".repeat(120) + "@example.com";
        let validatorParams: cert.X509CertValidatorParams = {
          trustedCerts: [rootX509CertGm!],
          untrustedCerts: [interX509CertGm!],
          userId: new Uint8Array([
            0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39,
            0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39
          ]),
          emailAddresses: [longEmail]
        };
        let validator: cert.CertChainValidator = cert.createCertChainValidator(algName);
        await validator.validate(leafX509CertGm!, validatorParams);
        expect(null).assertFail();
      } catch (error) {
        console.error(`"${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.ERR_PARAMETER_CHECK_FAILED);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_New_Chain_Func_4500
     * @tc.number SUB_Security_Cert_Framework_New_Chain_Func_4500
     * @tc.desc   完整校验，设置待校验实体证书，设置date格式无效的功能测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_New_Chain_Func_4500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "PKIX";
        let validatorParams: cert.X509CertValidatorParams = {
          trustedCerts: [rootX509CertGm!],
          untrustedCerts: [interX509CertGm!],
          userId: new Uint8Array([
            0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39,
            0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39
          ]),
          date: "20360406132433A"
        };
        let validator: cert.CertChainValidator = cert.createCertChainValidator(algName);
        await validator.validate(leafX509CertGm!, validatorParams);
        expect(null).assertFail();
      } catch (error) {
        console.error(`"${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.ERR_PARAMETER_CHECK_FAILED);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_New_Chain_Func_4600
     * @tc.number SUB_Security_Cert_Framework_New_Chain_Func_4600
     * @tc.desc   完整校验，设置待校验实体证书，设置date长度小于13的功能测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_New_Chain_Func_4600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "PKIX";
        let validatorParams: cert.X509CertValidatorParams = {
          trustedCerts: [rootX509CertGm!],
          untrustedCerts: [interX509CertGm!],
          userId: new Uint8Array([
            0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39,
            0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39
          ]),
          date: "20241231Z"
        };
        let validator: cert.CertChainValidator = cert.createCertChainValidator(algName);
        await validator.validate(leafX509CertGm!, validatorParams);
        expect(null).assertFail();
      } catch (error) {
        console.error(`"${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.ERR_PARAMETER_CHECK_FAILED);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_New_Chain_Func_4700
     * @tc.number SUB_Security_Cert_Framework_New_Chain_Func_4700
     * @tc.desc   完整校验，设置待校验实体证书，设置date长度大于15的功能测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_New_Chain_Func_4700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "PKIX";
        let validatorParams: cert.X509CertValidatorParams = {
          trustedCerts: [rootX509CertGm!],
          untrustedCerts: [interX509CertGm!],
          userId: new Uint8Array([
            0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39,
            0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39
          ]),
          date: "20241231235959000Z"
        };
        let validator: cert.CertChainValidator = cert.createCertChainValidator(algName);
        await validator.validate(leafX509CertGm!, validatorParams);
        expect(null).assertFail();
      } catch (error) {
        console.error(`"${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.ERR_PARAMETER_CHECK_FAILED);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_New_Chain_Func_4800
     * @tc.number SUB_Security_Cert_Framework_New_Chain_Func_4800
     * @tc.desc   完整校验，设置待校验实体证书，设置ignoreErrs超过100个的功能测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_New_Chain_Func_4800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "PKIX";
        let ignoreErrsArray: cert.CertResult[] = [];
        for (let i = 0; i < 101; i++) {
          ignoreErrsArray.push(cert.CertResult.ERR_CERT_HAS_EXPIRED);
        }
        let validatorParams: cert.X509CertValidatorParams = {
          trustedCerts: [rootX509CertGm!],
          untrustedCerts: [interX509CertGm!],
          userId: new Uint8Array([
            0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39,
            0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39
          ]),
          ignoreErrs: ignoreErrsArray
        };
        let validator: cert.CertChainValidator = cert.createCertChainValidator(algName);
        await validator.validate(leafX509CertGm!, validatorParams);
        expect(null).assertFail();
      } catch (error) {
        console.error(`"${error}", error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.ERR_PARAMETER_CHECK_FAILED);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_New_Chain_Func_4900
     * @tc.number SUB_Security_Cert_Framework_New_Chain_Func_4900
     * @tc.desc   完整校验，设置待校验实体证书，不信任中间证书，信任根证书，开启吊销检查，设置SM2用户ID参数的功能测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_New_Chain_Func_4900",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "PKIX";
          let validatorParams: cert.X509CertValidatorParams = {
            trustedCerts: [rootX509CertGm!],
            untrustedCerts: [interX509CertGm!],
            userId: new Uint8Array([ // 01234567890123456789
              0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39,
              0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39
            ]), // 开启吊销检查后不支持设置userId
            revokedParams: {
              revocationFlags: [cert.CertRevocationFlag.CERT_REVOCATION_CRL_CHECK],
              crls: [interX509CrlGm!]
            }
          };
          let validator: cert.CertChainValidator = cert.createCertChainValidator(algName);
          await validator.validate(leafX509CertGm!, validatorParams);
          expect(null).assertFail();
        } catch (error) {
          console.error(`"${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_PARAMETER_CHECK_FAILED);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_New_Chain_Func_5000
     * @tc.number SUB_Security_Cert_Framework_New_Chain_Func_5000
     * @tc.desc   不完整校验，设置待校验实体证书，不信任中间证书（无密钥用途无签名），信任根证书，功能测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_New_Chain_Func_5000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "PKIX";
          let validatorParams: cert.X509CertValidatorParams = {
            trustedCerts: [rootDefaultX509CertGm!],
            untrustedCerts: [interNoCertSignX509CertGm!]
          };
          let validator: cert.CertChainValidator = cert.createCertChainValidator(algName);
          await validator.validate(leafDefaultX509CertGm!, validatorParams);
          expect(null).assertFail();
        } catch (error) {
          console.error(`"${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_KEYUSAGE_NO_CERTSIGN);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_New_Chain_Func_5100
     * @tc.number SUB_Security_Cert_Framework_New_Chain_Func_5100
     * @tc.desc   不完整校验，设置待校验实体证书，不信任中间证书，信任根证书，开启吊销检查，功能测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_New_Chain_Func_5100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "PKIX";
          let validatorParams: cert.X509CertValidatorParams = {
            trustedCerts: [rootDefaultX509CertGm!],
            untrustedCerts: [interDefaultX509CertGm!],
            revokedParams: {
              revocationFlags: [cert.CertRevocationFlag.CERT_REVOCATION_CRL_CHECK],
              crls: [interDefaultX509CrlGm!]
            }
          };
          let validator: cert.CertChainValidator = cert.createCertChainValidator(algName);
          await validator.validate(leafDefaultX509CertGm!, validatorParams);
          expect(null).assertFail();
        } catch (error) {
          console.error(`"${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_CERT_HAS_REVOKED);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_New_Chain_Func_5200
     * @tc.number SUB_Security_Cert_Framework_New_Chain_Func_5200
     * @tc.desc   完整校验，设置待校验实体证书，不信任中间证书，信任根证书，openssl默认userId功能测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_New_Chain_Func_5200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "PKIX";
          let validatorParams: cert.X509CertValidatorParams = {
            trustedCerts: [rootDefaultX509CertGm!],
            untrustedCerts: [interDefaultX509CertGm!]
          };
          let validator: cert.CertChainValidator = cert.createCertChainValidator(algName);
          let chainResult: cert.VerifyCertResult = await validator.validate(leafDefaultX509CertGm!, validatorParams);
          expect(chainResult.certChain.length).assertEqual(3);
        } catch (error) {
          console.error(`"${error}", error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_New_Chain_Func_5300
     * @tc.number SUB_Security_Cert_Framework_New_Chain_Func_5300
     * @tc.desc   完整校验，设置待校验实体证书，设置date为空字符串的功能测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_New_Chain_Func_5300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "PKIX";
          let validatorParams: cert.X509CertValidatorParams = {
            trustedCerts: [rootX509CertGm!],
            untrustedCerts: [interX509CertGm!],
            userId: new Uint8Array([
              0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39,
              0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39
            ]),
            date: ""
          };
          let validator: cert.CertChainValidator = cert.createCertChainValidator(algName);
          await validator.validate(leafX509CertGm!, validatorParams);
          expect(null).assertFail();
        } catch (error) {
          console.error(`"${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_PARAMETER_CHECK_FAILED);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_New_Chain_Func_5400
     * @tc.number SUB_Security_Cert_Framework_New_Chain_Func_5400
     * @tc.desc   部分证书链校验，设置待校验实体证书，不信任中间证书，开启预置根证书能力（预置的中间证书）功能测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_New_Chain_Func_5400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "PKIX";
          let validatorParams: cert.X509CertValidatorParams = {
            trustSystemCa: true, // 953b6f93.0 中间证书，未设置userId
            untrustedCerts: [inter1SystemCaX509CertGm!],
            partialChain: true
          };
          let validator: cert.CertChainValidator = cert.createCertChainValidator(algName);
          let chainResult: cert.VerifyCertResult = await validator.validate(leafSystemCaX509CertGm!, validatorParams);
          expect(chainResult.certChain.length).assertEqual(3);
        } catch (error) {
          console.error(`"${error}", error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_New_Chain_Func_5500
     * @tc.number SUB_Security_Cert_Framework_New_Chain_Func_5500
     * @tc.desc   部分证书链校验，设置待校验实体证书，开启预置根证书能力（预置的中间证书），userId设置为空数组的功能测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_New_Chain_Func_5500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "PKIX";
          let validatorParams: cert.X509CertValidatorParams = {
            trustSystemCa: true, // 953b6f93.0 中间证书，未设置userId
            untrustedCerts: [inter1SystemCaX509CertGm!],
            userId: new Uint8Array([]),
            partialChain: true
          };
          let validator: cert.CertChainValidator = cert.createCertChainValidator(algName);
          let chainResult: cert.VerifyCertResult = await validator.validate(leafSystemCaX509CertGm!, validatorParams);
          expect(chainResult.certChain.length).assertEqual(3);
          let signAlgName: string = chainResult.certChain[0].getSignatureAlgName();
          expect(signAlgName).assertEqual("SM3withSM2");
        } catch (error) {
          console.error(`"${error}", error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_New_Chain_Func_5600
     * @tc.number SUB_Security_Cert_Framework_New_Chain_Func_5600
     * @tc.desc   完整校验，设置过期待校验实体证书，设置忽略多个错误的功能测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_New_Chain_Func_5600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "PKIX";
          let validatorParams: cert.X509CertValidatorParams = {
            trustedCerts: [rootX509CertGm!],
            untrustedCerts: [interX509CertGm!],
            userId: new Uint8Array([
              0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39,
              0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39
            ]),
            ignoreErrs: [
              cert.CertResult.ERR_CERT_HAS_EXPIRED,
              cert.CertResult.ERR_CERT_NOT_YET_VALID,
              cert.CertResult.ERR_UNKNOWN_CRITICAL_EXTENSION
            ]
          };
          let validator: cert.CertChainValidator = cert.createCertChainValidator(algName);
          let chainResult: cert.VerifyCertResult = await validator.validate(leafExpiredX509CertGm!, validatorParams);
          expect(chainResult.certChain.length).assertEqual(3);
        } catch (error) {
          console.error(`"${error}", error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_New_Chain_Func_5700
     * @tc.number SUB_Security_Cert_Framework_New_Chain_Func_5700
     * @tc.desc   部分证书链校验，设置待校验实体证书，不信任中间证书， 信任中间证书、根证书的功能测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_New_Chain_Func_5700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "PKIX";
          let validatorParams: cert.X509CertValidatorParams = {
            trustedCerts: [rootX509Cert!, interX509Cert!],
            untrustedCerts: [interX509Cert!],
            partialChain: true
          };
          let validator: cert.CertChainValidator = cert.createCertChainValidator(algName);
          let chainResult: cert.VerifyCertResult = await validator.validate(leafX509Cert!, validatorParams);
          expect(chainResult.certChain.length).assertEqual(2);
        } catch (error) {
          console.error(`"${error}", error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_New_Chain_Func_5800
     * @tc.number SUB_Security_Cert_Framework_New_Chain_Func_5800
     * @tc.desc   部分证书链校验，设置待校验实体证书，不信任中间证书， 信任中间证书的功能测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_New_Chain_Func_5800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "PKIX";
          let validatorParams: cert.X509CertValidatorParams = {
            trustedCerts: [leafX509Cert!],
            untrustedCerts: [interX509Cert!],
            partialChain: true
          };
          let validator: cert.CertChainValidator = cert.createCertChainValidator(algName);
          let chainResult: cert.VerifyCertResult = await validator.validate(leafX509Cert!, validatorParams);
          expect(chainResult.certChain.length).assertEqual(1);
        } catch (error) {
          console.error(`"${error}", error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_New_Chain_Func_5900
     * @tc.number SUB_Security_Cert_Framework_New_Chain_Func_5900
     * @tc.desc   完整证书链校验，设置待校验实体证书，开启预置根证书能力，根证书不存在的功能测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_New_Chain_Func_5900",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "PKIX";
          let validatorParams: cert.X509CertValidatorParams = {
            trustSystemCa: true, // 根证书不存在
            untrustedCerts: [interX509CertGm2!],
            partialChain: true
          };
          let validator: cert.CertChainValidator = cert.createCertChainValidator(algName);
          await validator.validate(leafX509CertGm2!, validatorParams);
          expect(null).assertFail();
        } catch (error) {
          console.error(`"${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_UNABLE_TO_GET_ISSUER_CERT_LOCALLY);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_New_Chain_Func_6000
     * @tc.number SUB_Security_Cert_Framework_New_Chain_Func_6000
     * @tc.desc   完整证书链校验，设置待校验实体证书，不开启预置根证书能力的功能测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_New_Chain_Func_6000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "PKIX";
          let validatorParams: cert.X509CertValidatorParams = {
            trustSystemCa: false, // 必须设置可信证书或者开启预置根证书能力
            untrustedCerts: [interX509CertGm2!],
            partialChain: true
          };
          let validator: cert.CertChainValidator = cert.createCertChainValidator(algName);
          await validator.validate(leafX509CertGm2!, validatorParams);
          expect(null).assertFail();
        } catch (error) {
          console.error(`"${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_PARAMETER_CHECK_FAILED);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_New_Chain_Func_6100
     * @tc.number SUB_Security_Cert_Framework_New_Chain_Func_6100
     * @tc.desc   完整证书链校验，设置待校验实体证书，信任根证书，不开启下载中间证书能力的功能测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_New_Chain_Func_6100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "PKIX";
          let validatorParams: cert.X509CertValidatorParams = {
            trustedCerts: [rootX509Cert!],
            allowDownloadIntermediateCa: false
          };
          let validator: cert.CertChainValidator = cert.createCertChainValidator(algName);
          await validator.validate(leafX509Cert!, validatorParams);
          expect(null).assertFail();
        } catch (error) {
          console.error(`"${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_UNABLE_TO_GET_ISSUER_CERT_LOCALLY);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_New_Chain_Func_6200
     * @tc.number SUB_Security_Cert_Framework_New_Chain_Func_6200
     * @tc.desc   完整校验，设置未生效待校验实体证书，不信任过期中间证书，信任过期根证书，开启时间校验，忽略时间过期未生效错误的功能测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_New_Chain_Func_6200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "PKIX";
          let validatorParams: cert.X509CertValidatorParams = {
            trustedCerts: [rootExpiredX509Cert!],
            untrustedCerts: [interExpiredX509Cert!],
            validateDate: true,
            ignoreErrs: [
              cert.CertResult.ERR_CERT_NOT_YET_VALID,
              cert.CertResult.ERR_CERT_HAS_EXPIRED
            ]
          };
          let validator: cert.CertChainValidator = cert.createCertChainValidator(algName);
          let chainResult: cert.VerifyCertResult = await validator.validate(leafYetX509Cert!, validatorParams);
          expect(chainResult.certChain.length).assertEqual(3);
        } catch (error) {
          console.error(`"${error}", error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_New_Chain_Func_6300
     * @tc.number SUB_Security_Cert_Framework_New_Chain_Func_6300
     * @tc.desc   完整校验，设置待校验实体证书，不信任中间证书，信任根证书，设置与中间证书不匹配的密钥用途的功能测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_New_Chain_Func_6300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "PKIX";
          let validatorParams: cert.X509CertValidatorParams = {
            trustedCerts: [rootExpiredX509Cert!],
            untrustedCerts: [interExpiredX509Cert!],
            validateDate: false,
            keyUsage: [
              cert.KeyUsageType.KEYUSAGE_ENCIPHER_ONLY // 只对叶子证书作用，中间证书密钥没有加密用途
            ]
          };
          let validator: cert.CertChainValidator = cert.createCertChainValidator(algName);
          let chainResult: cert.VerifyCertResult = await validator.validate(leafYetX509Cert!, validatorParams);
          expect(chainResult.certChain.length).assertEqual(3);
        } catch (error) {
          console.error(`"${error}", error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_New_Chain_Func_6400
     * @tc.number SUB_Security_Cert_Framework_New_Chain_Func_6400
     * @tc.desc   完整校验，设置待校验实体证书，不信任中间证书，信任根证书，开启CRL吊销检查且找不到CRL的功能测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_New_Chain_Func_6400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "PKIX";
          let validatorParams: cert.X509CertValidatorParams = {
            trustedCerts: [rootDefaultX509CertGm!],
            untrustedCerts: [interDefaultX509CertGm!],
            revokedParams: {
              revocationFlags: [cert.CertRevocationFlag.CERT_REVOCATION_CRL_CHECK],
              crls: []
            }
          };
          let validator: cert.CertChainValidator = cert.createCertChainValidator(algName);
          await validator.validate(leafDefaultX509CertGm!, validatorParams);
          expect(null).assertFail();
        } catch (error) {
          console.error(`"${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_CRL_NOT_FOUND);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_New_Chain_Func_6500
     * @tc.number SUB_Security_Cert_Framework_New_Chain_Func_6500
     * @tc.desc   完整校验，设置待校验实体证书，不信任中间证书，信任根证书，开启CRL吊销检查且找不到CRL，同时忽略找不到CRL错误的功能测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_New_Chain_Func_6500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "PKIX";
          let validatorParams: cert.X509CertValidatorParams = {
            trustedCerts: [rootDefaultX509CertGm!],
            untrustedCerts: [interDefaultX509CertGm!],
            revokedParams: {
              revocationFlags: [cert.CertRevocationFlag.CERT_REVOCATION_CRL_CHECK],
              crls: []
            },
            ignoreErrs: [
              cert.CertResult.ERR_CRL_NOT_FOUND
            ]
          };
          let validator: cert.CertChainValidator = cert.createCertChainValidator(algName);
          let chainResult: cert.VerifyCertResult = await validator.validate(leafDefaultX509CertGm!, validatorParams);
          expect(chainResult.certChain.length).assertEqual(3);
        } catch (error) {
          console.error(`"${error}", error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_New_Chain_Func_6700
     * @tc.number SUB_Security_Cert_Framework_New_Chain_Func_6700
     * @tc.desc   完整校验，设置待校验实体证书，不信任中间证书，信任根证书，开启CRL吊销检查且不允许下载CRL，期望ERR_CRL_NOT_FOUND
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_New_Chain_Func_6700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "PKIX";
          let validatorParams: cert.X509CertValidatorParams = {
            trustedCerts: [rootDefaultX509CertGm!],
            untrustedCerts: [interDefaultX509CertGm!],
            revokedParams: {
              revocationFlags: [cert.CertRevocationFlag.CERT_REVOCATION_CRL_CHECK],
              crls: [],
              allowDownloadCrl: false
            }
          };
          let validator: cert.CertChainValidator = cert.createCertChainValidator(algName);
          await validator.validate(leafDefaultX509CertGm!, validatorParams);
          expect(null).assertFail();
        } catch (error) {
          console.error(`"${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_CRL_NOT_FOUND);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_New_Chain_Func_6800
     * @tc.number SUB_Security_Cert_Framework_New_Chain_Func_6800
     * @tc.desc   完整校验，设置待校验实体证书，不信任中间证书，信任根证书，开启OCSP吊销检查且设置ocspResponses为空数组的功能测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_New_Chain_Func_6800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "PKIX";
          let validatorParams: cert.X509CertValidatorParams = {
            trustedCerts: [rootDefaultX509CertGm!],
            untrustedCerts: [interDefaultX509CertGm!],
            revokedParams: {
              revocationFlags: [cert.CertRevocationFlag.CERT_REVOCATION_OCSP_CHECK],
              ocspResponses: []
            }
          };
          let validator: cert.CertChainValidator = cert.createCertChainValidator(algName);
          await validator.validate(leafDefaultX509CertGm!, validatorParams);
          expect(null).assertFail();
        } catch (error) {
          console.error(`"${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_OCSP_RESPONSE_NOT_FOUND);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_New_Chain_Func_6900
     * @tc.number SUB_Security_Cert_Framework_New_Chain_Func_6900
     * @tc.desc   完整校验，设置待校验实体证书，不信任中间证书，信任根证书，开启OCSP吊销检查且设置ocspResponses为无效数据的功能测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_New_Chain_Func_6900",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "PKIX";
          let validatorParams: cert.X509CertValidatorParams = {
            trustedCerts: [rootDefaultX509CertGm!],
            untrustedCerts: [interDefaultX509CertGm!],
            revokedParams: {
              revocationFlags: [cert.CertRevocationFlag.CERT_REVOCATION_OCSP_CHECK],
              ocspResponses: [new Uint8Array([0x30, 0x03, 0x0A, 0x01, 0x00])]
            }
          };
          let validator: cert.CertChainValidator = cert.createCertChainValidator(algName);
          await validator.validate(leafDefaultX509CertGm!, validatorParams);
          expect(null).assertFail();
        } catch (error) {
          console.error(`"${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_New_Chain_Func_7000
     * @tc.number SUB_Security_Cert_Framework_New_Chain_Func_7000
     * @tc.desc   完整校验，设置待校验实体证书，不信任中间证书，信任根证书，开启OCSP吊销检查且允许在线OCSP检查的功能测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_New_Chain_Func_7000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "PKIX";
          let validatorParams: cert.X509CertValidatorParams = {
            trustedCerts: [rootDefaultX509CertGm!],
            untrustedCerts: [interDefaultX509CertGm!],
            revokedParams: {
              revocationFlags: [cert.CertRevocationFlag.CERT_REVOCATION_OCSP_CHECK],
              ocspResponses: [
                CHAIN_SM2_DEFAULT_3_1_OCSP_RESPONSE_REVOKED_DER
              ], // 本地吊销后不继续在线检查
              allowOcspCheckOnline: true
            }
          };
          let validator: cert.CertChainValidator = cert.createCertChainValidator(algName);
          await validator.validate(leafDefaultX509CertGm!, validatorParams);
          expect(null).assertFail();
        } catch (error) {
          console.error(`"${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_CERT_HAS_REVOKED);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_New_Chain_Func_7100
     * @tc.number SUB_Security_Cert_Framework_New_Chain_Func_7100
     * @tc.desc   完整校验，设置待校验实体证书，不信任中间证书，信任根证书，开启OCSP吊销检查且不允许在线OCSP检查的功能测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_New_Chain_Func_7100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "PKIX";
          let validatorParams: cert.X509CertValidatorParams = {
            trustedCerts: [rootDefaultX509CertGm!],
            untrustedCerts: [interDefaultX509CertGm!],
            revokedParams: {
              revocationFlags: [cert.CertRevocationFlag.CERT_REVOCATION_OCSP_CHECK],
              ocspResponses: [],
              allowOcspCheckOnline: false
            }
          };
          let validator: cert.CertChainValidator = cert.createCertChainValidator(algName);
          await validator.validate(leafDefaultX509CertGm!, validatorParams);
          expect(null).assertFail();
        } catch (error) {
          console.error(`"${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_OCSP_RESPONSE_NOT_FOUND);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_New_Chain_Func_7600
     * @tc.number SUB_Security_Cert_Framework_New_Chain_Func_7600
     * @tc.desc   完整校验，设置待校验实体证书，不信任中间证书，信任根证书，开启OCSP吊销检查的功能测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_New_Chain_Func_7600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "PKIX";
          let validatorParams: cert.X509CertValidatorParams = {
            trustedCerts: [rootDefaultX509CertGm!],
            untrustedCerts: [interDefaultX509CertGm!],
            revokedParams: {
              revocationFlags: [cert.CertRevocationFlag.CERT_REVOCATION_OCSP_CHECK],
              ocspResponses: [],
              allowOcspCheckOnline: true
            }
          };
          let validator: cert.CertChainValidator = cert.createCertChainValidator(algName);
          await validator.validate(leafDefaultX509CertGm!, validatorParams);
          expect(null).assertFail();
        } catch (error) {
          console.error(`"${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_NETWORK_TIMEOUT);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_New_Chain_Func_7700
     * @tc.number SUB_Security_Cert_Framework_New_Chain_Func_7700
     * @tc.desc   完整校验，设置待校验实体证书，不信任中间证书，信任根证书，开启CRL和OCSP吊销检查且优先OCSP的功能测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_New_Chain_Func_7700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "PKIX";
          let validatorParams: cert.X509CertValidatorParams = {
            trustedCerts: [rootDefaultX509CertGm!],
            untrustedCerts: [interDefaultX509CertGm!],
            revokedParams: {
              revocationFlags: [
                cert.CertRevocationFlag.CERT_REVOCATION_CRL_CHECK,
                cert.CertRevocationFlag.CERT_REVOCATION_OCSP_CHECK,
                cert.CertRevocationFlag.CERT_REVOCATION_PREFER_OCSP
              ],
              crls: [interDefaultX509CrlGm!],
              ocspResponses: [],
              allowOcspCheckOnline: true
            }
          };
          let validator: cert.CertChainValidator = cert.createCertChainValidator(algName);
          await validator.validate(leafDefaultX509CertGm!, validatorParams);
          expect(null).assertFail();
        } catch (error) {
          console.error(`"${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_CERT_HAS_REVOKED);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_New_Chain_Func_7800
     * @tc.number SUB_Security_Cert_Framework_New_Chain_Func_7800
     * @tc.desc   完整校验，设置待校验实体证书，不信任中间证书，信任根证书，开启CRL吊销检查且检查所有证书的功能测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_New_Chain_Func_7800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "PKIX";
          let validatorParams: cert.X509CertValidatorParams = {
            trustedCerts: [rootDefaultX509CertGm!],
            untrustedCerts: [interDefaultX509CertGm!],
            revokedParams: {
              revocationFlags: [
                cert.CertRevocationFlag.CERT_REVOCATION_CRL_CHECK,
                cert.CertRevocationFlag.CERT_REVOCATION_CHECK_ALL_CERT
              ],
              crls: [interDefaultX509CrlGm!]
            }
          };
          let validator: cert.CertChainValidator = cert.createCertChainValidator(algName);
          await validator.validate(leafDefaultX509CertGm!, validatorParams);
          expect(null).assertFail();
        } catch (error) {
          console.error(`"${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_CERT_HAS_REVOKED);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_New_Chain_Func_8000
     * @tc.number SUB_Security_Cert_Framework_New_Chain_Func_8000
     * @tc.desc   完整校验，设置待校验实体证书，不信任中间证书，信任根证书，设置crls超过100个的功能测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_New_Chain_Func_8000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "PKIX";
          let crlsArray: cert.X509CRL[] = [];
          for (let i = 0; i < 101; i++) {
            crlsArray.push(interDefaultX509CrlGm!);
          }
          let validatorParams: cert.X509CertValidatorParams = {
            trustedCerts: [rootDefaultX509CertGm!],
            untrustedCerts: [interDefaultX509CertGm!],
            revokedParams: {
              revocationFlags: [cert.CertRevocationFlag.CERT_REVOCATION_CRL_CHECK],
              crls: crlsArray
            }
          };
          let validator: cert.CertChainValidator = cert.createCertChainValidator(algName);
          await validator.validate(leafDefaultX509CertGm!, validatorParams);
          expect(null).assertFail();
        } catch (error) {
          console.error(`"${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_PARAMETER_CHECK_FAILED);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_New_Chain_Func_8100
     * @tc.number SUB_Security_Cert_Framework_New_Chain_Func_8100
     * @tc.desc   完整校验，设置待校验实体证书，不信任中间证书，信任根证书，设置ocspResponses超过100个的功能测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_New_Chain_Func_8100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "PKIX";
          let ocspResponsesArray: Uint8Array[] = [];
          for (let i = 0; i < 101; i++) {
            ocspResponsesArray.push(new Uint8Array([0x30, 0x03, 0x0A, 0x01, 0x00]));
          }
          let validatorParams: cert.X509CertValidatorParams = {
            trustedCerts: [rootDefaultX509CertGm!],
            untrustedCerts: [interDefaultX509CertGm!],
            revokedParams: {
              revocationFlags: [cert.CertRevocationFlag.CERT_REVOCATION_OCSP_CHECK],
              ocspResponses: ocspResponsesArray
            }
          };
          let validator: cert.CertChainValidator = cert.createCertChainValidator(algName);
          await validator.validate(leafDefaultX509CertGm!, validatorParams);
          expect(null).assertFail();
        } catch (error) {
          console.error(`"${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_PARAMETER_CHECK_FAILED);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_New_Chain_Func_8200
     * @tc.number SUB_Security_Cert_Framework_New_Chain_Func_8200
     * @tc.desc   完整校验，设置待校验实体证书，不信任中间证书，信任根证书，同时开启CRL和OCSP吊销检查的功能测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_New_Chain_Func_8200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "PKIX";
          let validatorParams: cert.X509CertValidatorParams = {
            trustedCerts: [rootDefaultX509CertGm!],
            untrustedCerts: [interDefaultX509CertGm!],
            revokedParams: {
              revocationFlags: [
                cert.CertRevocationFlag.CERT_REVOCATION_CRL_CHECK,
                cert.CertRevocationFlag.CERT_REVOCATION_OCSP_CHECK
              ],
              crls: [interDefaultX509CrlGm!],
              ocspResponses: [],
              allowOcspCheckOnline: true
            }
          };
          let validator: cert.CertChainValidator = cert.createCertChainValidator(algName);
          await validator.validate(leafDefaultX509CertGm!, validatorParams);
          expect(null).assertFail();
        } catch (error) {
          console.error(`"${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_CERT_HAS_REVOKED);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_New_Chain_Func_8300
     * @tc.number SUB_Security_Cert_Framework_New_Chain_Func_8300
     * @tc.desc   完整校验，设置待校验实体证书，不信任中间证书，信任根证书，开启OCSP吊销检查且设置ocspResponses不可解析的数据的功能测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_New_Chain_Func_8300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "PKIX";
          let validatorParams: cert.X509CertValidatorParams = {
            trustedCerts: [rootDefaultX509CertGm!],
            untrustedCerts: [interDefaultX509CertGm!],
            revokedParams: {
              revocationFlags: [cert.CertRevocationFlag.CERT_REVOCATION_OCSP_CHECK],
              ocspResponses: [new Uint8Array([0x00])]
            }
          };
          let validator: cert.CertChainValidator = cert.createCertChainValidator(algName);
          await validator.validate(leafDefaultX509CertGm!, validatorParams);
          expect(null).assertFail();
        } catch (error) {
          console.error(`"${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_OCSP_RESPONSE_INVALID);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_New_Chain_Func_8400
     * @tc.number SUB_Security_Cert_Framework_New_Chain_Func_8400
     * @tc.desc   部分证书链校验，设置待校验实体证书，不信任中间证书，开启预置根证书能力（预置的中间证书、根证书）功能测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_New_Chain_Func_8400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "PKIX";
          let validatorParams: cert.X509CertValidatorParams = {
            trustSystemCa: true, // a9fc73bc.0 根证书签发了多本同级中间证书
            untrustedCerts: [interCaCertGm!], // 另一本中间证书 1e276aec.0
          };
          let validator: cert.CertChainValidator = cert.createCertChainValidator(algName);
          await validator.validate(leafCaCertGm!, validatorParams);
          expect(null).assertFail();
        } catch (error) {
          console.error(`"${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_CERT_SIGNATURE_FAILURE);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_New_Chain_Func_8500
     * @tc.number SUB_Security_Cert_Framework_New_Chain_Func_8500
     * @tc.desc   完整校验，设置待校验实体证书，不信任中间证书，没有设置信任锚点的功能测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_New_Chain_Func_8500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "PKIX";
          let validatorParams: cert.X509CertValidatorParams = {
            untrustedCerts: [interDefaultX509CertGm!],
          };
          let validator: cert.CertChainValidator = cert.createCertChainValidator(algName);
          await validator.validate(leafDefaultX509CertGm!, validatorParams);
          expect(null).assertFail();
        } catch (error) {
          console.error(`"${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_PARAMETER_CHECK_FAILED);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_New_Chain_Func_8600
     * @tc.number SUB_Security_Cert_Framework_New_Chain_Func_8600
     * @tc.desc   完整校验，设置待校验实体证书，不信任中间证书，设置信任锚点为空数组的功能测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_New_Chain_Func_8600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "PKIX";
          let validatorParams: cert.X509CertValidatorParams = {
            trustedCerts: [],
            untrustedCerts: [interDefaultX509CertGm!],
          };
          let validator: cert.CertChainValidator = cert.createCertChainValidator(algName);
          await validator.validate(leafDefaultX509CertGm!, validatorParams);
          expect(null).assertFail();
        } catch (error) {
          console.error(`"${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_PARAMETER_CHECK_FAILED);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_New_Chain_Func_8700
     * @tc.number SUB_Security_Cert_Framework_New_Chain_Func_8700
     * @tc.desc   完整校验，设置待校验实体证书，不信任中间证书，设置信任锚点为空数组的功能测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_New_Chain_Func_8700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "PKIX";
          let validatorParams: cert.X509CertValidatorParams = {
            trustedCerts: [interDefaultX509CertGm!],
            untrustedCerts: [],
            partialChain: true
          };
          let validator: cert.CertChainValidator = cert.createCertChainValidator(algName);
          let chainResult: cert.VerifyCertResult = await validator.validate(leafDefaultX509CertGm!, validatorParams);
          expect(chainResult.certChain.length).assertEqual(2);
        } catch (error) {
          console.error(`"${error}", error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_New_Chain_Func_8800
     * @tc.number SUB_Security_Cert_Framework_New_Chain_Func_8800
     * @tc.desc   完整校验，设置待校验实体证书，不信任中间证书，信任根证书，设置email数组含空字符串的功能测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_New_Chain_Func_8800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "PKIX";
          let validatorParams: cert.X509CertValidatorParams = {
            trustedCerts: [rootX509CertGm!],
            untrustedCerts: [interX509CertGm!],
            userId: new Uint8Array([ // 01234567890123456789
              0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39,
              0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39
            ]),
            emailAddresses: [""] // 空字符串
          };
          let validator: cert.CertChainValidator = cert.createCertChainValidator(algName);
          await validator.validate(leafX509CertGm!, validatorParams);
          expect(null).assertFail();
        } catch (error) {
          console.error(`"${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_PARAMETER_CHECK_FAILED);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_New_Chain_Func_8900
     * @tc.number SUB_Security_Cert_Framework_New_Chain_Func_8900
     * @tc.desc   完整校验，设置待校验实体证书，不信任中间证书，信任根证书，设置hostname数组含空字符串的功能测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_New_Chain_Func_8900",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "PKIX";
          let validatorParams: cert.X509CertValidatorParams = {
            trustedCerts: [rootX509CertGm!],
            untrustedCerts: [interX509CertGm!],
            userId: new Uint8Array([ // 01234567890123456789
              0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39,
              0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39
            ]),
            hostnames: [""] // 空字符串
          };
          let validator: cert.CertChainValidator = cert.createCertChainValidator(algName);
          await validator.validate(leafX509CertGm!, validatorParams);
          expect(null).assertFail();
        } catch (error) {
          console.error(`"${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_PARAMETER_CHECK_FAILED);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_New_Chain_Func_9000
     * @tc.number SUB_Security_Cert_Framework_New_Chain_Func_9000
     * @tc.desc   不完整校验，设置待校验实体证书，不信任中间证书、根证书，信任其他根证书功能测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_New_Chain_Func_9000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "PKIX";
          let validatorParams: cert.X509CertValidatorParams = {
            trustedCerts: [rootCaCertGm!],
            untrustedCerts: [interDefaultX509CertGm!, rootDefaultX509CertGm!],
            validateDate: false
          };
          let validator: cert.CertChainValidator = cert.createCertChainValidator(algName);
          await validator.validate(leafDefaultX509CertGm!, validatorParams);
          expect(null).assertFail();
        } catch (error) {
          console.error(`"${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_CERT_UNTRUSTED);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_New_Chain_Func_9100
     * @tc.number SUB_Security_Cert_Framework_New_Chain_Func_9100
     * @tc.desc   不完整校验，设置待校验实体证书（不认识的关键扩展），不信任中间证书，信任根证书功能测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_New_Chain_Func_9100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "PKIX";
          let validatorParams: cert.X509CertValidatorParams = {
            trustedCerts: [rootDefaultX509CertGm!],
            untrustedCerts: [interDefaultX509CertGm!],
            validateDate: false
          };
          let validator: cert.CertChainValidator = cert.createCertChainValidator(algName);
          await validator.validate(leafUnkownCriticalExtensionX509CertGm!, validatorParams);
          expect(null).assertFail();
        } catch (error) {
          console.error(`"${error}", error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_UNKNOWN_CRITICAL_EXTENSION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_New_Chain_Func_9200
     * @tc.number SUB_Security_Cert_Framework_New_Chain_Func_9200
     * @tc.desc   不完整校验，设置待校验实体证书（不认识的关键扩展），不信任中间证书，信任根证书，忽略不认识关键扩展错误功能测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_New_Chain_Func_9200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let algName: string = "PKIX";
          let validatorParams: cert.X509CertValidatorParams = {
            trustedCerts: [rootDefaultX509CertGm!],
            untrustedCerts: [interDefaultX509CertGm!],
            validateDate: false,
            ignoreErrs: [
              cert.CertResult.ERR_UNKNOWN_CRITICAL_EXTENSION
            ]
          };
          let validator: cert.CertChainValidator = cert.createCertChainValidator(algName);
          let chainResult: cert.VerifyCertResult = await validator.validate(leafUnkownCriticalExtensionX509CertGm!, validatorParams);
          expect(chainResult.certChain.length).assertEqual(3);
        } catch (error) {
          console.error(`"${error}", error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

  });
}
