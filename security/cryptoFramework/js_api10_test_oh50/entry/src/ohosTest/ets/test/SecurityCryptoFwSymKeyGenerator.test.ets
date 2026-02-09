/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, TestType, Size, Level, expect } from '@ohos/hypium';
import cryptoFramework from '@ohos.security.cryptoFramework';
import * as symKeySyncUtils from './utils/syncSymKey/syncSymKeyUtils'
import * as commonUtils from './utils/common/commonUtils'


export default function SecurityCryptoFwSymKeyGeneratorTestUnit() {
  describe('SecurityCryptoFwSymKeyGeneratorTestUnit', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
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
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SymKeyGenerator_Func_0100
     * @tc.number SUB_Security_CryptoFramework_SymKeyGenerator_Func_0100
     * @tc.desc   algorithm is AES128
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SymKeyGenerator_Func_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let algName: string = "AES128";
        let expectKeyLen: number = 16;
        let encodedKey: cryptoFramework.DataBlob = symKeySyncUtils.createSymKeySync(algName);
        let symKeyConvertSync: cryptoFramework.SymKey = symKeySyncUtils.convertSymKeySync(algName, encodedKey);
        let encodedKeyConvert: cryptoFramework.DataBlob = symKeyConvertSync.getEncoded();
        let ret: boolean = commonUtils.compareDataBlob(encodedKey, encodedKeyConvert);
        let keyLen: number = encodedKey.data.byteLength;
        expect(keyLen).assertEqual(expectKeyLen);
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SymKeyGenerator_Func_0200
     * @tc.number SUB_Security_CryptoFramework_SymKeyGenerator_Func_0200
     * @tc.desc   algorithm is AES192
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SymKeyGenerator_Func_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let algName: string = "AES192";
        let expectKeyLen: number = 24;
        let encodedKey: cryptoFramework.DataBlob = symKeySyncUtils.createSymKeySync(algName);
        let symKeyConvertSync: cryptoFramework.SymKey = symKeySyncUtils.convertSymKeySync(algName, encodedKey);
        let encodedKeyConvert: cryptoFramework.DataBlob = symKeyConvertSync.getEncoded();
        let ret: boolean = commonUtils.compareDataBlob(encodedKey, encodedKeyConvert);
        let keyLen: number = encodedKey.data.byteLength;
        expect(keyLen).assertEqual(expectKeyLen);
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SymKeyGenerator_Func_0300
     * @tc.number SUB_Security_CryptoFramework_SymKeyGenerator_Func_0300
     * @tc.desc   algorithm is AES256
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SymKeyGenerator_Func_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let algName: string = "AES256";
        let expectKeyLen: number = 32;
        let encodedKey: cryptoFramework.DataBlob = symKeySyncUtils.createSymKeySync(algName);
        let symKeyConvertSync: cryptoFramework.SymKey = symKeySyncUtils.convertSymKeySync(algName, encodedKey);
        let encodedKeyConvert: cryptoFramework.DataBlob = symKeyConvertSync.getEncoded();
        let ret: boolean = commonUtils.compareDataBlob(encodedKey, encodedKeyConvert);
        let keyLen: number = encodedKey.data.byteLength;
        expect(keyLen).assertEqual(expectKeyLen);
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SymKeyGenerator_Func_0400
     * @tc.number SUB_Security_CryptoFramework_SymKeyGenerator_Func_0400
     * @tc.desc   algorithm is 3DES192
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SymKeyGenerator_Func_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let algName: string = "3DES192";
        let expectKeyLen: number = 24;
        let encodedKey: cryptoFramework.DataBlob = symKeySyncUtils.createSymKeySync(algName);
        let symKeyConvertSync: cryptoFramework.SymKey = symKeySyncUtils.convertSymKeySync(algName, encodedKey);
        let encodedKeyConvert: cryptoFramework.DataBlob = symKeyConvertSync.getEncoded();
        let ret: boolean = commonUtils.compareDataBlob(encodedKey, encodedKeyConvert);
        let keyLen: number = encodedKey.data.byteLength;
        expect(keyLen).assertEqual(expectKeyLen);
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SymKeyGenerator_Func_0500
     * @tc.number SUB_Security_CryptoFramework_SymKeyGenerator_Func_0500
     * @tc.desc   algorithm is SM4_128
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SymKeyGenerator_Func_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let algName: string = "SM4_128";
        let expectKeyLen: number = 16;
        let encodedKey: cryptoFramework.DataBlob = symKeySyncUtils.createSymKeySync(algName);
        let symKeyConvertSync: cryptoFramework.SymKey = symKeySyncUtils.convertSymKeySync(algName, encodedKey);
        let encodedKeyConvert: cryptoFramework.DataBlob = symKeyConvertSync.getEncoded();
        let ret: boolean = commonUtils.compareDataBlob(encodedKey, encodedKeyConvert);
        let keyLen: number = encodedKey.data.byteLength;
        expect(keyLen).assertEqual(expectKeyLen);
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SymKeyGenerator_Func_0600
     * @tc.number SUB_Security_CryptoFramework_SymKeyGenerator_Func_0600
     * @tc.desc   algorithm is HMAC|SHA1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SymKeyGenerator_Func_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let algName: string = "HMAC|SHA1";
        let expectKeyLen: number = 20;
        let encodedKey: cryptoFramework.DataBlob = symKeySyncUtils.createSymKeySync(algName);
        let symKeyConvertSync: cryptoFramework.SymKey = symKeySyncUtils.convertSymKeySync(algName, encodedKey);
        let encodedKeyConvert: cryptoFramework.DataBlob = symKeyConvertSync.getEncoded();
        let ret: boolean = commonUtils.compareDataBlob(encodedKey, encodedKeyConvert);
        let keyLen: number = encodedKey.data.byteLength;
        expect(keyLen).assertEqual(expectKeyLen);
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SymKeyGenerator_Func_0700
     * @tc.number SUB_Security_CryptoFramework_SymKeyGenerator_Func_0700
     * @tc.desc   algorithm is HMAC|SHA224
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SymKeyGenerator_Func_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let algName: string = "HMAC|SHA224";
        let expectKeyLen: number = 28;
        let encodedKey: cryptoFramework.DataBlob = symKeySyncUtils.createSymKeySync(algName);
        let symKeyConvertSync: cryptoFramework.SymKey = symKeySyncUtils.convertSymKeySync(algName, encodedKey);
        let encodedKeyConvert: cryptoFramework.DataBlob = symKeyConvertSync.getEncoded();
        let ret: boolean = commonUtils.compareDataBlob(encodedKey, encodedKeyConvert);
        let keyLen: number = encodedKey.data.byteLength;
        expect(keyLen).assertEqual(expectKeyLen);
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SymKeyGenerator_Func_0800
     * @tc.number SUB_Security_CryptoFramework_SymKeyGenerator_Func_0800
     * @tc.desc   algorithm is HMAC|SHA256
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SymKeyGenerator_Func_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let algName: string = "HMAC|SHA256";
        let expectKeyLen: number = 32;
        let encodedKey: cryptoFramework.DataBlob = symKeySyncUtils.createSymKeySync(algName);
        let symKeyConvertSync: cryptoFramework.SymKey = symKeySyncUtils.convertSymKeySync(algName, encodedKey);
        let encodedKeyConvert: cryptoFramework.DataBlob = symKeyConvertSync.getEncoded();
        let ret: boolean = commonUtils.compareDataBlob(encodedKey, encodedKeyConvert);
        let keyLen: number = encodedKey.data.byteLength;
        expect(keyLen).assertEqual(expectKeyLen);
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SymKeyGenerator_Func_0900
     * @tc.number SUB_Security_CryptoFramework_SymKeyGenerator_Func_0900
     * @tc.desc   algorithm is HMAC|SHA384
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SymKeyGenerator_Func_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let algName: string = "HMAC|SHA384";
        let expectKeyLen: number = 48;
        let encodedKey: cryptoFramework.DataBlob = symKeySyncUtils.createSymKeySync(algName);
        let symKeyConvertSync: cryptoFramework.SymKey = symKeySyncUtils.convertSymKeySync(algName, encodedKey);
        let encodedKeyConvert: cryptoFramework.DataBlob = symKeyConvertSync.getEncoded();
        let ret: boolean = commonUtils.compareDataBlob(encodedKey, encodedKeyConvert);
        let keyLen: number = encodedKey.data.byteLength;
        expect(keyLen).assertEqual(expectKeyLen);
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SymKeyGenerator_Func_1000
     * @tc.number SUB_Security_CryptoFramework_SymKeyGenerator_Func_1000
     * @tc.desc   algorithm is HMAC|SHA512
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SymKeyGenerator_Func_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let algName: string = "HMAC|SHA512";
        let expectKeyLen: number = 64;
        let encodedKey: cryptoFramework.DataBlob = symKeySyncUtils.createSymKeySync(algName);
        let symKeyConvertSync: cryptoFramework.SymKey = symKeySyncUtils.convertSymKeySync(algName, encodedKey);
        let encodedKeyConvert: cryptoFramework.DataBlob = symKeyConvertSync.getEncoded();
        let ret: boolean = commonUtils.compareDataBlob(encodedKey, encodedKeyConvert);
        let keyLen: number = encodedKey.data.byteLength;
        expect(keyLen).assertEqual(expectKeyLen);
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SymKeyGenerator_Func_1100
     * @tc.number SUB_Security_CryptoFramework_SymKeyGenerator_Func_1100
     * @tc.desc   algorithm is HMAC|SM3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SymKeyGenerator_Func_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let algName: string = "HMAC|SM3";
        let expectKeyLen: number = 32;
        let encodedKey: cryptoFramework.DataBlob = symKeySyncUtils.createSymKeySync(algName);
        let symKeyConvertSync: cryptoFramework.SymKey = symKeySyncUtils.convertSymKeySync(algName, encodedKey);
        let encodedKeyConvert: cryptoFramework.DataBlob = symKeyConvertSync.getEncoded();
        let ret: boolean = commonUtils.compareDataBlob(encodedKey, encodedKeyConvert);
        let keyLen: number = encodedKey.data.byteLength;
        expect(keyLen).assertEqual(expectKeyLen);
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SymKeyGenerator_Func_1200
     * @tc.number SUB_Security_CryptoFramework_SymKeyGenerator_Func_1200
     * @tc.desc   algorithm is SM4_256
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SymKeyGenerator_Func_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let algName: string = "SM4_256";
        symKeySyncUtils.createSymKeySync(algName);
        expect(null).assertFail();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(801);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SymKeyGenerator_Func_1300
     * @tc.number SUB_Security_CryptoFramework_SymKeyGenerator_Func_1300
     * @tc.desc   algorithm is AES128|AES192
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SymKeyGenerator_Func_1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let algName: string = "AES128";
        let convertAlgName: string = "AES192";
        let encodedKey: cryptoFramework.DataBlob = symKeySyncUtils.createSymKeySync(algName);
        symKeySyncUtils.convertSymKeySync(convertAlgName, encodedKey);
        expect(null).assertFail();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SymKeyGenerator_Func_1400
     * @tc.number SUB_Security_CryptoFramework_SymKeyGenerator_Func_1400
     * @tc.desc   algorithm is AES192|AES128
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SymKeyGenerator_Func_1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let algName: string = "AES192";
        let convertAlgName: string = "AES128";
        let encodedKey: cryptoFramework.DataBlob = symKeySyncUtils.createSymKeySync(algName);
        symKeySyncUtils.convertSymKeySync(convertAlgName, encodedKey);
        expect(null).assertFail();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SymKeyGenerator_Func_1500
     * @tc.number SUB_Security_CryptoFramework_SymKeyGenerator_Func_1500
     * @tc.desc   algorithm is HMAC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SymKeyGenerator_Func_1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let data: string = "hello";
        let expectKeyLen: number = data.length;
        let dataArray: Uint8Array = commonUtils.stringToUint8Array(data);
        let encodedKey: cryptoFramework.DataBlob = {
          data: dataArray
        };
        let convertAlgName: string = "HMAC";
        let convertSymKey: cryptoFramework.SymKey = symKeySyncUtils.convertSymKeySync(convertAlgName, encodedKey);
        let keyLen: number = convertSymKey.getEncoded().data.byteLength;
        expect(keyLen).assertEqual(expectKeyLen);
        expect(null).assertNull();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_SymKeyGenerator_Func_1600
     * @tc.number SUB_Security_CryptoFramework_SymKeyGenerator_Func_1600
     * @tc.desc   algorithm is HMAC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_SymKeyGenerator_Func_1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let data: string = "";
        let dataArray: Uint8Array = commonUtils.stringToUint8Array(data);
        let encodedKey: cryptoFramework.DataBlob = {
          data: dataArray
        };
        let convertAlgName: string = "HMAC";
        symKeySyncUtils.convertSymKeySync(convertAlgName, encodedKey);
        expect(null).assertFail();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

  });
}