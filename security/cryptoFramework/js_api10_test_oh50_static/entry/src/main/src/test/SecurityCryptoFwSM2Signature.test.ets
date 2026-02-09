/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import cryptoFramework from '@ohos.security.cryptoFramework';
import { doSignSync, doVerifySync, generateSignKey } from './utils/signVerify/signVerifySyncUtils';
import { compareDataBlob, compareString, createData } from './utils/common/commonUtils';
import { BusinessError } from '@ohos.base';

export default function SecurityCryptoFwSM2TestUnit() {
  describe('SecurityCryptoFwSM2TestUnit', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SM2_ASN1ToRS_Func_0100
     * @tc.number SUB_Security_CryptoFramework_SM2_ASN1ToRS_Func_0100
     * @tc.desc   algorithm is SM2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_SM2_ASN1ToRS_Func_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let msgLen: int = 64;
        let msg: cryptoFramework.DataBlob = await createData(msgLen);
        let algName: string = "SM2_256";
        let digest: string = "SM3";
        let keyPair = await generateSignKey(algName);
        let signAlgName: string = algName + "|" + digest;
        let dataSign = doSignSync(signAlgName, keyPair.priKey, msg);
        let RS: cryptoFramework.EccSignatureSpec = cryptoFramework.SignatureUtils.genEccSignatureSpec(dataSign.data);
        let asn1: Uint8Array = cryptoFramework.SignatureUtils.genEccSignature(RS);
        let ret: boolean = compareDataBlob({data: asn1}, dataSign);
        ret = ret && doVerifySync(signAlgName, keyPair.pubKey, msg, {data: asn1});
        expect(ret).assertTrue();
      } catch (error) {
        console.error(` “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SM2_ASN1ToRS_Func_0200
     * @tc.number SUB_Security_CryptoFramework_SM2_ASN1ToRS_Func_0200
     * @tc.desc   algorithm is ECC256
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_SM2_ASN1ToRS_Func_0200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let msgLen: int = 64;
          let msg: cryptoFramework.DataBlob = await createData(msgLen);
          let algName: string = "ECC256";
          let digest: string = "SHA256";
          let keyPair = await generateSignKey(algName);
          let signAlgName: string = algName + "|" + digest;
          let dataSign = doSignSync(signAlgName, keyPair.priKey, msg);
          let RS: cryptoFramework.EccSignatureSpec = cryptoFramework.SignatureUtils.genEccSignatureSpec(dataSign.data);
          let asn1: Uint8Array = cryptoFramework.SignatureUtils.genEccSignature(RS);
          let ret: boolean = compareDataBlob({data: asn1}, dataSign);
          ret = ret && doVerifySync(signAlgName, keyPair.pubKey, msg, {data: asn1});
          expect(ret).assertTrue();
        } catch (error) {
          console.error(` “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SM2_ASN1ToRS_Func_0300
     * @tc.number SUB_Security_CryptoFramework_SM2_ASN1ToRS_Func_0300
     * @tc.desc   algorithm is SM2 Len:0x45
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_SM2_ASN1ToRS_Func_0300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let asn1ToRS: Uint8Array = new Uint8Array([
            0x30, 0x45, 0x02, 0x20, 0x71, 0xA0, 0xF5, 0x4F, 0x43, 0xEF, 0x29, 0xFA, 0xBA, 0x54, 0xE2, 0x27,
            0x6C, 0xD2, 0xFB, 0x25, 0x0B, 0x9C, 0xFE, 0x38, 0x19, 0x12, 0xE4, 0xCB, 0x7B, 0x4D, 0x98, 0xCA,
            0x52, 0x7F, 0xA5, 0x44, 0x02, 0x21, 0x00, 0xDF, 0x35, 0x07, 0xF6, 0x7F, 0x76, 0xDE, 0x94, 0x22,
            0x34, 0x9F, 0x57, 0xFE, 0x36, 0x03, 0xC6, 0xC2, 0x54, 0xCC, 0xEF, 0x76, 0x26, 0x74, 0x38, 0xD7,
            0x30, 0xBC, 0xB4, 0xB1, 0xF1, 0x59, 0x99
          ]);
          let RS: cryptoFramework.EccSignatureSpec = cryptoFramework.SignatureUtils.genEccSignatureSpec(asn1ToRS);
          let RSToAsn1: Uint8Array = cryptoFramework.SignatureUtils.genEccSignature(RS);
          let ret: boolean = compareDataBlob({data: RSToAsn1}, {data: asn1ToRS});
          expect(ret).assertTrue();
        } catch (error) {
          console.error(` “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SM2_ASN1ToRS_Func_0400
     * @tc.number SUB_Security_CryptoFramework_SM2_ASN1ToRS_Func_0400
     * @tc.desc   algorithm is SM2 Len:0x46
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_SM2_ASN1ToRS_Func_0400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let asn1ToRS: Uint8Array = new Uint8Array([
            0x30, 0x46, 0x02, 0x21, 0x00, 0xE8, 0xF5, 0x4F, 0x43, 0xEF, 0x29, 0xFA, 0xBA, 0x54, 0xE2, 0x27,
            0x6C, 0xD2, 0xFB, 0x25, 0x0B, 0x9C, 0xFE, 0x38, 0x19, 0x12, 0xE4, 0xCB, 0x7B, 0x4D, 0x98, 0xCA,
            0x52, 0x7F, 0xA5, 0x44, 0xFE, 0x02, 0x21, 0x00, 0xDF, 0x35, 0x07, 0xF6, 0x7F, 0x76, 0xDE, 0x94,
            0x22, 0x34, 0x9F, 0x57, 0xFE, 0x36, 0x03, 0xC6, 0xC2, 0x54, 0xCC, 0xEF, 0x76, 0x26, 0x74, 0x38,
            0xD7, 0x30, 0xBC, 0xB4, 0xB1, 0xF1, 0x59, 0xE8
          ]);
          let RS: cryptoFramework.EccSignatureSpec = cryptoFramework.SignatureUtils.genEccSignatureSpec(asn1ToRS);
          let RSToAsn1: Uint8Array = cryptoFramework.SignatureUtils.genEccSignature(RS);
          let ret: boolean = compareDataBlob({data: RSToAsn1}, {data: asn1ToRS});
          expect(ret).assertTrue();
        } catch (error) {
          console.error(` “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SM2_ASN1ToRS_Func_0500
     * @tc.number SUB_Security_CryptoFramework_SM2_ASN1ToRS_Func_0500
     * @tc.desc   algorithm is SM2 Len:0x43
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_SM2_ASN1ToRS_Func_0500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let asn1ToRS: Uint8Array = new Uint8Array([
            0x30, 0x43, 0x02, 0x20, 0x00, 0xDE, 0x4F, 0x43, 0xEF, 0x29, 0xFA, 0xBA, 0x54, 0xE2, 0x27, 0x6C,
            0xD2, 0xFB, 0x25, 0x0B, 0x9C, 0xFE, 0x38, 0x19, 0x12, 0xE4, 0xCB, 0x7B, 0x4D, 0x98, 0xCA, 0x52,
            0x7F, 0xA5, 0x44, 0xFE, 0x02, 0x1F, 0x35, 0x07, 0xF6, 0x7F, 0x76, 0xDE, 0x94, 0x22, 0x34, 0x9F,
            0x57, 0xFE, 0x36, 0x03, 0xC6, 0xC2, 0x54, 0xCC, 0xEF, 0x76, 0x26, 0x74, 0x38, 0xD7, 0x30, 0xBC,
            0xB4, 0xB1, 0xF1, 0x59, 0xE8
          ]);
          let RS: cryptoFramework.EccSignatureSpec = cryptoFramework.SignatureUtils.genEccSignatureSpec(asn1ToRS);
          let RSToAsn1: Uint8Array = cryptoFramework.SignatureUtils.genEccSignature(RS);
          let ret: boolean = compareDataBlob({data: RSToAsn1}, {data: asn1ToRS});
          expect(ret).assertTrue();
        } catch (error) {
          console.error(` “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SM2_ASN1ToRS_Func_0600
     * @tc.number SUB_Security_CryptoFramework_SM2_ASN1ToRS_Func_0600
     * @tc.desc   algorithm is SM2 Len:0x44
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_SM2_ASN1ToRS_Func_0600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let asn1ToRS: Uint8Array = new Uint8Array([
            0x30, 0x44, 0x02, 0x21, 0x00, 0xEA, 0xDE, 0x4F, 0x43, 0xEF, 0x29, 0xFA, 0xBA, 0x54, 0xE2, 0x27,
            0x6C, 0xD2, 0xFB, 0x25, 0x0B, 0x9C, 0xFE, 0x38, 0x19, 0x12, 0xE4, 0xCB, 0x7B, 0x4D, 0x98, 0xCA,
            0x52, 0x7F, 0xA5, 0x44, 0xFE, 0x02, 0x1F, 0x35, 0x07, 0xF6, 0x7F, 0x76, 0xDE, 0x94, 0x22, 0x34,
            0x9F, 0x57, 0xFE, 0x36, 0x03, 0xC6, 0xC2, 0x54, 0xCC, 0xEF, 0x76, 0x26, 0x74, 0x38, 0xD7, 0x30,
            0xBC, 0xB4, 0xB1, 0xF1, 0x59, 0xE8
          ]);
          let RS: cryptoFramework.EccSignatureSpec = cryptoFramework.SignatureUtils.genEccSignatureSpec(asn1ToRS);
          let RSToAsn1: Uint8Array = cryptoFramework.SignatureUtils.genEccSignature(RS);
          let ret: boolean = compareDataBlob({data: RSToAsn1}, {data: asn1ToRS});
          expect(ret).assertTrue();
        } catch (error) {
          console.error(` “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SM2_ASN1ToRS_Func_0700
     * @tc.number SUB_Security_CryptoFramework_SM2_ASN1ToRS_Func_0700
     * @tc.desc   algorithm is SM2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_SM2_ASN1ToRS_Func_0700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let asn1ToRS: Uint8Array = new Uint8Array([
            0x30, 0x23, 0x44, 0x25, 0x01, 0xEA, 0xDE, 0x4F, 0x43, 0xEF, 0x29, 0xFA, 0xBA, 0x54, 0xE2, 0x27,
            0x6C, 0xD2, 0xFB, 0x25, 0x0B, 0x9C, 0xFE, 0x38, 0x19, 0x12, 0xE4, 0xCB, 0x7B, 0x4D, 0x98, 0xCA,
            0x52, 0x7F, 0xA5, 0x44, 0xFE, 0x42, 0xFF, 0x35, 0x07, 0xF6, 0x7F, 0x76, 0xDE, 0x94, 0x22, 0x34,
            0x9F, 0x57, 0xFE, 0x36, 0x03, 0xC6, 0xC2, 0x54, 0xCC, 0xEF, 0x76, 0x26, 0x74, 0x38, 0xD7, 0x30,
            0xBC, 0xB4, 0xB1, 0xF1, 0x59, 0xE8
          ]);
          cryptoFramework.SignatureUtils.genEccSignatureSpec(asn1ToRS);
        } catch (error) {
          console.error(` “${error}“, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SM2_ASN1ToRS_Func_0800
     * @tc.number SUB_Security_CryptoFramework_SM2_ASN1ToRS_Func_0800
     * @tc.desc   algorithm is SM2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_SM2_ASN1ToRS_Func_0800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let asn1ToRS: Uint8Array = new Uint8Array([
            0x30, 0x44, 0x02, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
            0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
            0x00, 0x00, 0x00, 0x00, 0x02, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
            0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
            0x00, 0x00, 0x00, 0x00, 0x00, 0x00
          ]);
          cryptoFramework.SignatureUtils.genEccSignatureSpec(asn1ToRS);
          expect(null).assertFail();
        } catch (error) {
          console.error(` “${error}“, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
        }
        try {
          let asn1ToRS: Uint8Array = new Uint8Array([
            0x30, 0x44, 0x02, 0x20, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
            0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
            0xFF, 0xFF, 0xFF, 0xFF, 0x02, 0x20, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
            0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
            0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
          ]);
          cryptoFramework.SignatureUtils.genEccSignatureSpec(asn1ToRS);
          expect(null).assertFail();
        } catch (error) {
          console.error(` “${error}“, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SM2_ASN1ToRS_Func_0900
     * @tc.number SUB_Security_CryptoFramework_SM2_ASN1ToRS_Func_0900
     * @tc.desc   algorithm is SM2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_SM2_ASN1ToRS_Func_0900",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let asn1ToRS: Uint8Array = new Uint8Array([
            0x31, 0x44, 0x02, 0x21, 0x00, 0xEA, 0xDE, 0x4F, 0x43, 0xEF, 0x29, 0xFA, 0xBA, 0x54, 0xE2, 0x27,
            0x6C, 0xD2, 0xFB, 0x25, 0x0B, 0x9C, 0xFE, 0x38, 0x19, 0x12, 0xE4, 0xCB, 0x7B, 0x4D, 0x98, 0xCA,
            0x52, 0x7F, 0xA5, 0x44, 0xFE, 0x02, 0x1F, 0x35, 0x07, 0xF6, 0x7F, 0x76, 0xDE, 0x94, 0x22, 0x34,
            0x9F, 0x57, 0xFE, 0x36, 0x03, 0xC6, 0xC2, 0x54, 0xCC, 0xEF, 0x76, 0x26, 0x74, 0x38, 0xD7, 0x30,
            0xBC, 0xB4, 0xB1, 0xF1, 0x59, 0xE8
          ]);
          cryptoFramework.SignatureUtils.genEccSignatureSpec(asn1ToRS);
          expect(null).assertFail();
        } catch (error) {
          console.error(` “${error}“, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SM2_ASN1ToRS_Func_1000
     * @tc.number SUB_Security_CryptoFramework_SM2_ASN1ToRS_Func_1000
     * @tc.desc   algorithm is SM2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_SM2_ASN1ToRS_Func_1000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let asn1ToRS: Uint8Array = new Uint8Array([
            0x31, 0x43, 0x02, 0x21, 0x00, 0xEA, 0xDE, 0x4F, 0x43, 0xEF, 0x29, 0xFA, 0xBA, 0x54, 0xE2, 0x27,
            0x6C, 0xD2, 0xFB, 0x25, 0x0B, 0x9C, 0xFE, 0x38, 0x19, 0x12, 0xE4, 0xCB, 0x7B, 0x4D, 0x98, 0xCA,
            0x52, 0x7F, 0xA5, 0x44, 0xFE, 0x02, 0x1F, 0x35, 0x07, 0xF6, 0x7F, 0x76, 0xDE, 0x94, 0x22, 0x34,
            0x9F, 0x57, 0xFE, 0x36, 0x03, 0xC6, 0xC2, 0x54, 0xCC, 0xEF, 0x76, 0x26, 0x74, 0x38, 0xD7, 0x30,
            0xBC, 0xB4, 0xB1, 0xF1, 0x59, 0xE8
          ]);
          cryptoFramework.SignatureUtils.genEccSignatureSpec(asn1ToRS);
          expect(null).assertFail();
        } catch (error) {
          console.error(` “${error}“, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SM2_ASN1ToRS_Func_1100
     * @tc.number SUB_Security_CryptoFramework_SM2_ASN1ToRS_Func_1100
     * @tc.desc   algorithm is SM2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_SM2_ASN1ToRS_Func_1100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let asn1ToRS: Uint8Array = new Uint8Array([
            0x31, 0x45, 0x02, 0x21, 0x00, 0xEA, 0xDE, 0x4F, 0x43, 0xEF, 0x29, 0xFA, 0xBA, 0x54, 0xE2, 0x27,
            0x6C, 0xD2, 0xFB, 0x25, 0x0B, 0x9C, 0xFE, 0x38, 0x19, 0x12, 0xE4, 0xCB, 0x7B, 0x4D, 0x98, 0xCA,
            0x52, 0x7F, 0xA5, 0x44, 0xFE, 0x02, 0x1F, 0x35, 0x07, 0xF6, 0x7F, 0x76, 0xDE, 0x94, 0x22, 0x34,
            0x9F, 0x57, 0xFE, 0x36, 0x03, 0xC6, 0xC2, 0x54, 0xCC, 0xEF, 0x76, 0x26, 0x74, 0x38, 0xD7, 0x30,
            0xBC, 0xB4, 0xB1, 0xF1, 0x59, 0xE8
          ]);
          cryptoFramework.SignatureUtils.genEccSignatureSpec(asn1ToRS);
          expect(null).assertFail();
        } catch (error) {
          console.error(` “${error}“, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SM2_ASN1ToRS_Func_1200
     * @tc.number SUB_Security_CryptoFramework_SM2_ASN1ToRS_Func_1200
     * @tc.desc   algorithm is SM2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_SM2_ASN1ToRS_Func_1200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let asn1ToRS: Uint8Array = new Uint8Array([
            0x31, 0x44, 0x12, 0x21, 0x00, 0xEA, 0xDE, 0x4F, 0x43, 0xEF, 0x29, 0xFA, 0xBA, 0x54, 0xE2, 0x27,
            0x6C, 0xD2, 0xFB, 0x25, 0x0B, 0x9C, 0xFE, 0x38, 0x19, 0x12, 0xE4, 0xCB, 0x7B, 0x4D, 0x98, 0xCA,
            0x52, 0x7F, 0xA5, 0x44, 0xFE, 0x02, 0x1F, 0x35, 0x07, 0xF6, 0x7F, 0x76, 0xDE, 0x94, 0x22, 0x34,
            0x9F, 0x57, 0xFE, 0x36, 0x03, 0xC6, 0xC2, 0x54, 0xCC, 0xEF, 0x76, 0x26, 0x74, 0x38, 0xD7, 0x30,
            0xBC, 0xB4, 0xB1, 0xF1, 0x59, 0xE8
          ]);
          cryptoFramework.SignatureUtils.genEccSignatureSpec(asn1ToRS);
          expect(null).assertFail();
        } catch (error) {
          console.error(` “${error}“, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
        }
        try {
          let asn1ToRS: Uint8Array = new Uint8Array([
            0x31, 0x44, 0x02, 0x21, 0x00, 0xEA, 0xDE, 0x4F, 0x43, 0xEF, 0x29, 0xFA, 0xBA, 0x54, 0xE2, 0x27,
            0x6C, 0xD2, 0xFB, 0x25, 0x0B, 0x9C, 0xFE, 0x38, 0x19, 0x12, 0xE4, 0xCB, 0x7B, 0x4D, 0x98, 0xCA,
            0x52, 0x7F, 0xA5, 0x44, 0xFE, 0x12, 0x1F, 0x35, 0x07, 0xF6, 0x7F, 0x76, 0xDE, 0x94, 0x22, 0x34,
            0x9F, 0x57, 0xFE, 0x36, 0x03, 0xC6, 0xC2, 0x54, 0xCC, 0xEF, 0x76, 0x26, 0x74, 0x38, 0xD7, 0x30,
            0xBC, 0xB4, 0xB1, 0xF1, 0x59, 0xE8
          ]);
          cryptoFramework.SignatureUtils.genEccSignatureSpec(asn1ToRS);
          expect(null).assertFail();
        } catch (error) {
          console.error(` “${error}“, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SM2_ASN1ToRS_Func_1300
     * @tc.number SUB_Security_CryptoFramework_SM2_ASN1ToRS_Func_1300
     * @tc.desc   algorithm is SM2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_SM2_ASN1ToRS_Func_1300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let asn1ToRS: Uint8Array = new Uint8Array([
            0x31, 0x44, 0x02, 0x20, 0x00, 0xEA, 0xDE, 0x4F, 0x43, 0xEF, 0x29, 0xFA, 0xBA, 0x54, 0xE2, 0x27,
            0x6C, 0xD2, 0xFB, 0x25, 0x0B, 0x9C, 0xFE, 0x38, 0x19, 0x12, 0xE4, 0xCB, 0x7B, 0x4D, 0x98, 0xCA,
            0x52, 0x7F, 0xA5, 0x44, 0xFE, 0x02, 0x1F, 0x35, 0x07, 0xF6, 0x7F, 0x76, 0xDE, 0x94, 0x22, 0x34,
            0x9F, 0x57, 0xFE, 0x36, 0x03, 0xC6, 0xC2, 0x54, 0xCC, 0xEF, 0x76, 0x26, 0x74, 0x38, 0xD7, 0x30,
            0xBC, 0xB4, 0xB1, 0xF1, 0x59, 0xE8
          ]);
          cryptoFramework.SignatureUtils.genEccSignatureSpec(asn1ToRS);
          expect(null).assertFail();
        } catch (error) {
          console.error(` “${error}“, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
        }
        try {
          let asn1ToRS: Uint8Array = new Uint8Array([
            0x31, 0x44, 0x02, 0x21, 0x00, 0xEA, 0xDE, 0x4F, 0x43, 0xEF, 0x29, 0xFA, 0xBA, 0x54, 0xE2, 0x27,
            0x6C, 0xD2, 0xFB, 0x25, 0x0B, 0x9C, 0xFE, 0x38, 0x19, 0x12, 0xE4, 0xCB, 0x7B, 0x4D, 0x98, 0xCA,
            0x52, 0x7F, 0xA5, 0x44, 0xFE, 0x02, 0x1E, 0x35, 0x07, 0xF6, 0x7F, 0x76, 0xDE, 0x94, 0x22, 0x34,
            0x9F, 0x57, 0xFE, 0x36, 0x03, 0xC6, 0xC2, 0x54, 0xCC, 0xEF, 0x76, 0x26, 0x74, 0x38, 0xD7, 0x30,
            0xBC, 0xB4, 0xB1, 0xF1, 0x59, 0xE8
          ]);
          cryptoFramework.SignatureUtils.genEccSignatureSpec(asn1ToRS);
          expect(null).assertFail();
        } catch (error) {
          console.error(` “${error}“, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SM2_ASN1ToRS_Func_1400
     * @tc.number SUB_Security_CryptoFramework_SM2_ASN1ToRS_Func_1400
     * @tc.desc   algorithm is SM2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_SM2_ASN1ToRS_Func_1400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let asn1ToRS: Uint8Array = new Uint8Array([
            0x31, 0x44, 0x02, 0x22, 0x00, 0xEA, 0xDE, 0x4F, 0x43, 0xEF, 0x29, 0xFA, 0xBA, 0x54, 0xE2, 0x27,
            0x6C, 0xD2, 0xFB, 0x25, 0x0B, 0x9C, 0xFE, 0x38, 0x19, 0x12, 0xE4, 0xCB, 0x7B, 0x4D, 0x98, 0xCA,
            0x52, 0x7F, 0xA5, 0x44, 0xFE, 0x02, 0x1F, 0x35, 0x07, 0xF6, 0x7F, 0x76, 0xDE, 0x94, 0x22, 0x34,
            0x9F, 0x57, 0xFE, 0x36, 0x03, 0xC6, 0xC2, 0x54, 0xCC, 0xEF, 0x76, 0x26, 0x74, 0x38, 0xD7, 0x30,
            0xBC, 0xB4, 0xB1, 0xF1, 0x59, 0xE8
          ]);
          cryptoFramework.SignatureUtils.genEccSignatureSpec(asn1ToRS);
          expect(null).assertFail();
        } catch (error) {
          console.error(` “${error}“, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
        }
        try {
          let asn1ToRS: Uint8Array = new Uint8Array([
            0x31, 0x44, 0x02, 0x21, 0x00, 0xEA, 0xDE, 0x4F, 0x43, 0xEF, 0x29, 0xFA, 0xBA, 0x54, 0xE2, 0x27,
            0x6C, 0xD2, 0xFB, 0x25, 0x0B, 0x9C, 0xFE, 0x38, 0x19, 0x12, 0xE4, 0xCB, 0x7B, 0x4D, 0x98, 0xCA,
            0x52, 0x7F, 0xA5, 0x44, 0xFE, 0x02, 0x20, 0x35, 0x07, 0xF6, 0x7F, 0x76, 0xDE, 0x94, 0x22, 0x34,
            0x9F, 0x57, 0xFE, 0x36, 0x03, 0xC6, 0xC2, 0x54, 0xCC, 0xEF, 0x76, 0x26, 0x74, 0x38, 0xD7, 0x30,
            0xBC, 0xB4, 0xB1, 0xF1, 0x59, 0xE8
          ]);
          cryptoFramework.SignatureUtils.genEccSignatureSpec(asn1ToRS);
          expect(null).assertFail();
        } catch (error) {
          console.error(` “${error}“, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SM2_ASN1ToRS_Func_1500
     * @tc.number SUB_Security_CryptoFramework_SM2_ASN1ToRS_Func_1500
     * @tc.desc   algorithm is SM2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_SM2_ASN1ToRS_Func_1500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let asn1ToRS: Uint8Array = new Uint8Array([
            0x31, 0x43, 0x02, 0x20, 0xEA, 0xDE, 0x4F, 0x43, 0xEF, 0x29, 0xFA, 0xBA, 0x54, 0xE2, 0x27,
            0x6C, 0xD2, 0xFB, 0x25, 0x0B, 0x9C, 0xFE, 0x38, 0x19, 0x12, 0xE4, 0xCB, 0x7B, 0x4D, 0x98, 0xCA,
            0x52, 0x7F, 0xA5, 0x44, 0xFE, 0x02, 0x1F, 0x35, 0x07, 0xF6, 0x7F, 0x76, 0xDE, 0x94, 0x22, 0x34,
            0x9F, 0x57, 0xFE, 0x36, 0x03, 0xC6, 0xC2, 0x54, 0xCC, 0xEF, 0x76, 0x26, 0x74, 0x38, 0xD7, 0x30,
            0xBC, 0xB4, 0xB1, 0xF1, 0x59, 0xE8
          ]);
          cryptoFramework.SignatureUtils.genEccSignatureSpec(asn1ToRS);
          expect(null).assertFail();
        } catch (error) {
          console.error(` “${error}“, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SM2_ASN1ToRS_Func_1600
     * @tc.number SUB_Security_CryptoFramework_SM2_ASN1ToRS_Func_1600
     * @tc.desc   algorithm is SM2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_SM2_ASN1ToRS_Func_1600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let asn1ToRS: Uint8Array = new Uint8Array([
            0x30, 0x44, 0x02, 0x21, 0x00, 0xEA, 0xDE, 0x4F, 0x43, 0xEF, 0x29, 0xFA, 0xBA, 0x54, 0xE2, 0x27,
            0x6C, 0xD2, 0xFB, 0x25, 0x0B, 0x9C, 0xFE, 0x38, 0x19, 0x12, 0xE4, 0xCB, 0x7B, 0x4D, 0x98, 0xCA,
            0x52, 0x7F, 0xA5, 0x44, 0xFE, 0x02, 0x20, 0x00, 0x35, 0x07, 0xF6, 0x7F, 0x76, 0xDE, 0x94, 0x22, 0x34,
            0x9F, 0x57, 0xFE, 0x36, 0x03, 0xC6, 0xC2, 0x54, 0xCC, 0xEF, 0x76, 0x26, 0x74, 0x38, 0xD7, 0x30,
            0xBC, 0xB4, 0xB1, 0xF1, 0x59, 0xE8
          ]);
          cryptoFramework.SignatureUtils.genEccSignatureSpec(asn1ToRS);
          expect(null).assertFail();
        } catch (error) {
          console.error(` “${error}“, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SM2_ASN1ToRS_Func_1700
     * @tc.number SUB_Security_CryptoFramework_SM2_ASN1ToRS_Func_1700
     * @tc.desc   algorithm is SM2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_SM2_ASN1ToRS_Func_1700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let asn1ToRS: Uint8Array = new Uint8Array([
            0x30, 0x44, 0x02, 0x21, 0x00, 0xEA, 0xDE, 0x4F, 0x43, 0xEF, 0x29, 0xFA, 0xBA, 0x54, 0xE2, 0x27,
            0x6C, 0xD2, 0xFB, 0x25, 0x0B, 0x9C, 0xFE, 0x38, 0x19, 0x12, 0xE4, 0xCB, 0x7B, 0x4D, 0x98, 0xCA,
            0x52, 0x7F, 0xA5, 0x44, 0xFE, 0x02, 0x20, 0x00, 0x35, 0x07, 0xF6, 0x7F, 0x76, 0xDE, 0x94, 0x22, 0x34,
            0x9F, 0x57, 0xFE, 0x36, 0x03, 0xC6, 0xC2, 0x54, 0xCC, 0xEF, 0x76, 0x26, 0x74, 0x38, 0xD7, 0x30,
            0xBC, 0xB4, 0xB1, 0xF1, 0x59, 0xE8
          ]);
          cryptoFramework.SignatureUtils.genEccSignatureSpec(asn1ToRS);
          expect(null).assertFail();
        } catch (error) {
          console.error(` “${error}“, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SM2_ASN1ToRS_Func_1800
     * @tc.number SUB_Security_CryptoFramework_SM2_ASN1ToRS_Func_1800
     * @tc.desc   algorithm is SM2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_SM2_ASN1ToRS_Func_1800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          // Big endian
          let expect_r: bigint = BigInt("106233993686329866388788451887415352037722042843148312087371682210961017881854");
          let expect_s: bigint = BigInt("93697852228123118915154723168640764937685372513279798486783690220994910696");
          let asn1ToRS: Uint8Array = new Uint8Array([
            0x30, 0x44, 0x02, 0x21, 0x00, 0xEA, 0xDE, 0x4F, 0x43, 0xEF, 0x29, 0xFA, 0xBA, 0x54, 0xE2, 0x27,
            0x6C, 0xD2, 0xFB, 0x25, 0x0B, 0x9C, 0xFE, 0x38, 0x19, 0x12, 0xE4, 0xCB, 0x7B, 0x4D, 0x98, 0xCA,
            0x52, 0x7F, 0xA5, 0x44, 0xFE, 0x02, 0x1F, 0x35, 0x07, 0xF6, 0x7F, 0x76, 0xDE, 0x94, 0x22, 0x34,
            0x9F, 0x57, 0xFE, 0x36, 0x03, 0xC6, 0xC2, 0x54, 0xCC, 0xEF, 0x76, 0x26, 0x74, 0x38, 0xD7, 0x30,
            0xBC, 0xB4, 0xB1, 0xF1, 0x59, 0xE8
          ]);
          let RS: cryptoFramework.EccSignatureSpec = cryptoFramework.SignatureUtils.genEccSignatureSpec(asn1ToRS);
          expect(RS.r === expect_r).assertTrue();
          expect(RS.s === expect_s).assertTrue();
        } catch (error) {
          console.error(` “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SM2_ASN1ToRS_Func_1900
     * @tc.number SUB_Security_CryptoFramework_SM2_ASN1ToRS_Func_1900
     * @tc.desc   algorithm is SM2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_SM2_ASN1ToRS_Func_1900",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let asn1ToRS: Uint8Array = new Uint8Array([
            0x30, 0x44, 0x02, 0x21, 0x00, 0xEA, 0xDE, 0x4F, 0x43, 0xEF, 0x29, 0xFA, 0xBA, 0x54, 0xE2, 0x27,
            0x6C, 0xD2, 0xFB, 0x25, 0x0B, 0x9C, 0xFE, 0x38, 0x19, 0x12, 0xE4, 0xCB, 0x7B, 0x4D, 0x98, 0xCA,
            0x52, 0x7F, 0xA5, 0x44, 0xFE, 0x02, 0xFF, 0x35, 0x07, 0xF6, 0x7F, 0x76, 0xDE, 0x94, 0x22, 0x34,
            0x9F, 0x57, 0xFE, 0x36, 0x03, 0xC6, 0xC2, 0x54, 0xCC, 0xEF, 0x76, 0x26, 0x74, 0x38, 0xD7, 0x30,
            0x9F, 0x57, 0xFE, 0x36, 0x03, 0xC6, 0xC2, 0x54, 0xCC, 0xEF, 0x76, 0x26, 0x74, 0x38, 0xD7, 0x30,
            0x9F, 0x57, 0xFE, 0x36, 0x03, 0xC6, 0xC2, 0x54, 0xCC, 0xEF, 0x76, 0x26, 0x74, 0x38, 0xD7, 0x30,
            0x9F, 0x57, 0xFE, 0x36, 0x03, 0xC6, 0xC2, 0x54, 0xCC, 0xEF, 0x76, 0x26, 0x74, 0x38, 0xD7, 0x30,
            0xBC, 0xB4, 0xB1, 0xF1, 0x59, 0xE8
          ]);
          cryptoFramework.SignatureUtils.genEccSignatureSpec(asn1ToRS);
          expect(null).assertFail();
        } catch (error) {
          console.error(` “${error}“, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SM2_ASN1ToRS_Func_2000
     * @tc.number SUB_Security_CryptoFramework_SM2_ASN1ToRS_Func_2000
     * @tc.desc   algorithm is SM2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_CryptoFramework_SM2_ASN1ToRS_Func_2000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let asn1ToRS: Uint8Array = new Uint8Array([
            0x30, 0xFF, 0xFF, 0xFF, 0x02, 0x21, 0x00, 0xEA, 0xDE, 0x4F, 0x43, 0xEF, 0x29, 0xFA, 0xBA, 0x54, 0xE2, 0x27,
            0x6C, 0xD2, 0xFB, 0x25, 0x0B, 0x9C, 0xFE, 0x38, 0x19, 0x12, 0xE4, 0xCB, 0x7B, 0x4D, 0x98, 0xCA,
            0x52, 0x7F, 0xA5, 0x44, 0xFE, 0x02, 0x1F, 0x35, 0x07, 0xF6, 0x7F, 0x76, 0xDE, 0x94, 0x22, 0x34,
            0x9F, 0x57, 0xFE, 0x36, 0x03, 0xC6, 0xC2, 0x54, 0xCC, 0xEF, 0x76, 0x26, 0x74, 0x38, 0xD7, 0x30,
            0xBC, 0xB4, 0xB1, 0xF1, 0x59, 0xE8
          ]);
          cryptoFramework.SignatureUtils.genEccSignatureSpec(asn1ToRS);
          expect(null).assertFail();
        } catch (error) {
          console.error(` “${error}“, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
        }
        done();
      });
  })
}