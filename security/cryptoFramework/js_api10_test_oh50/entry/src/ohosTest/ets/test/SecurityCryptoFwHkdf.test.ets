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
import * as commonUtils from './utils/common/commonUtils';
import * as hkdfUtils from './utils/hkdf/hkdfUtils';


export default function SecurityCryptoFwHkdfTestUnit() {
  describe('SecurityCryptoFwHkdfTestUnit', () => {
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
     * @tc.number SUB_Security_CryptoFramework_Hkdf_Func_0100
     * @tc.name Test HKDF derived algorithm traversal test. Callback style. Process success
     * @tc.desc algorithm is HKDF
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Hkdf_Func_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let key: string = "hello world";
      let isKeyString: boolean = false;
      let salt: string = "0123456789";
      let info: string = "kdf test";
      let algName: string = "HKDF";
      try {
        for (let mdName of hkdfUtils.HKDF_DIGEST_SPEC) {
          for ( let modeName of hkdfUtils.HKDF_MODE_SPEC) {
            let keySize: number = 128;
            let mdInfo: hkdfUtils.mdData = hkdfUtils.getMdLen(mdName, modeName);
            keySize = mdInfo.isExtract ? mdInfo.mdSize : keySize;
            let spec: cryptoFramework.HKDFSpec = hkdfUtils.hkdfSpec(key, isKeyString, salt, info, keySize);
            let kdfAlgName: string = algName + "|" + mdName;
            if (modeName) {
              kdfAlgName = kdfAlgName + "|" + modeName;
            }
            let secret: cryptoFramework.DataBlob = await hkdfUtils.hkdfCallback(kdfAlgName, spec);
            expect(secret.data.length).assertEqual(keySize);
          }
        }
      } catch (error) {
        console.error(`HKDF “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Hkdf_Func_0200
     * @tc.name Test HKDF derived algorithm traversal test. Promise style. Process success
     * @tc.desc algorithm is HKDF
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Hkdf_Func_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let key: string = "hello world";
      let isKeyString: boolean = true;
      let salt: string = "0123456789";
      let info: string = "kdf test";
      let algName: string = "HKDF";
      try {
        for (let mdName of hkdfUtils.HKDF_DIGEST_SPEC) {
          for ( let modeName of hkdfUtils.HKDF_MODE_SPEC) {
            let keySize: number = 128;
            let mdInfo: hkdfUtils.mdData = hkdfUtils.getMdLen(mdName, modeName);
            keySize = mdInfo.isExtract ? mdInfo.mdSize : keySize;
            let spec: cryptoFramework.HKDFSpec = hkdfUtils.hkdfSpec(key, isKeyString, salt, info, keySize);
            let kdfAlgName: string = algName + "|" + mdName;
            if (modeName) {
              kdfAlgName = kdfAlgName + "|" + modeName;
            }
            let secret: cryptoFramework.DataBlob = await hkdfUtils.hkdfPromise(kdfAlgName, spec);
            expect(secret.data.length).assertEqual(keySize);
          }
        }
      } catch (error) {
        console.error(`HKDF “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });
    
    /**
     * @tc.number SUB_Security_CryptoFramework_Hkdf_Func_0300
     * @tc.name Test HKDF algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is HKDF
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Hkdf_Func_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let key: string = "hello world";
      let isKeyString: boolean = true;
      let salt: string = "0123456789";
      let info: string = "kdf test";
      let algName: string = "HKDF";
      try {
        for (let mdName of hkdfUtils.HKDF_DIGEST_SPEC) {
          for ( let modeName of hkdfUtils.HKDF_MODE_SPEC) {
            let keySize: number = 128;
            let mdInfo: hkdfUtils.mdData = hkdfUtils.getMdLen(mdName, modeName);
            keySize = mdInfo.isExtract ? mdInfo.mdSize : keySize;
            let spec: cryptoFramework.HKDFSpec = hkdfUtils.hkdfSpec(key, isKeyString, salt, info, keySize);
            let kdfAlgName: string = algName + "|" + mdName;
            if (modeName) {
              kdfAlgName = kdfAlgName + "|" + modeName;
            }
            let secret: cryptoFramework.DataBlob = hkdfUtils.hkdfSync(kdfAlgName, spec);
            expect(secret.data.length).assertEqual(keySize);
          }
        }
      } catch (error) {
        console.error(`HKDF “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Hkdf_Func_0400
     * @tc.name Test HKDF derived algorithm traversal test, keySize = 0. Promise style. Process success
     * @tc.desc algorithm is HKDF
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Hkdf_Func_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let key: string = "hello world";
      let isKeyString: boolean = false;
      let salt: string = "0123456789";
      let info: string = "kdf test";
      let keySize: number = 0;
      let algName: string = "HKDF";
      let spec: cryptoFramework.HKDFSpec = hkdfUtils.hkdfSpec(key, isKeyString, salt, info, keySize);
      let kdfAlgName: string = algName + "|SHA1|EXTRACT_AND_EXPAND";
      try {
        await hkdfUtils.hkdfPromise(kdfAlgName, spec);
        expect(null).assertFail();
      } catch (error) {
        console.error(`HKDF “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Hkdf_Func_0500
     * @tc.name Test HKDF derived algorithm traversal test, keySize = 1. Promise style. Process success
     * @tc.desc algorithm is HKDF
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Hkdf_Func_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let key: string = "hello world";
      let isKeyString: boolean = false;
      let salt: string = "0123456789";
      let info: string = "kdf test";
      let keySize: number = 1;
      let kdfAlgName: string = "HKDF|SHA256|EXTRACT_ONLY";
      let spec: cryptoFramework.HKDFSpec = hkdfUtils.hkdfSpec(key, isKeyString, salt, info, keySize);
      try {
        await hkdfUtils.hkdfPromise(kdfAlgName, spec);
        expect(null).assertFail();
      } catch (error) {
        console.error(`HKDF “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Hkdf_Func_0600
     * @tc.name Test HKDF derived algorithm traversal test, keySize = 31. Promise style. Process success
     * @tc.desc algorithm is HKDF
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Hkdf_Func_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let key: string = "hello world";
      let isKeyString: boolean = true;
      let salt: string = "0123456789";
      let info: string = "kdf test";
      let keySize: number = 31;
      let kdfAlgName: string = "HKDF|SHA256|EXTRACT_ONLY";
      let spec: cryptoFramework.HKDFSpec = hkdfUtils.hkdfSpec(key, isKeyString, salt, info, keySize);
      try {
        await hkdfUtils.hkdfPromise(kdfAlgName, spec);
        expect(null).assertFail();
      } catch (error) {
        console.error(`HKDF “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Hkdf_Func_0700
     * @tc.name Test HKDF derived algorithm traversal test, keySize = 33. Promise style. Process success
     * @tc.desc algorithm is HKDF
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Hkdf_Func_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let key: string = "hello world";
      let isKeyString: boolean = true;
      let salt: string = "0123456789";
      let info: string = "kdf test";
      let keySize: number = 65;
      let kdfAlgName: string = "HKDF|SHA512|EXTRACT_ONLY";
      let spec: cryptoFramework.HKDFSpec = hkdfUtils.hkdfSpec(key, isKeyString, salt, info, keySize);
      try {
        await hkdfUtils.hkdfCallback(kdfAlgName, spec);
        expect(null).assertFail();
      } catch (error) {
        console.error(`HKDF “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Hkdf_Func_0800
     * @tc.name Test HKDF derived algorithm traversal test, keySize = mdSize * 255 + 1. Promise style. Process success
     * @tc.desc algorithm is HKDF
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Hkdf_Func_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let key: string = "hello world";
      let isKeyString: boolean = true;
      let salt: string = "0123456789";
      let info: string = "kdf test";
      let keySize: number = 28 * 255 + 1;
      let kdfAlgName: string = "HKDF|SHA224|EXTRACT_AND_EXPAND";
      let spec: cryptoFramework.HKDFSpec = hkdfUtils.hkdfSpec(key, isKeyString, salt, info, keySize);
      try {
        await hkdfUtils.hkdfCallback(kdfAlgName, spec);
        expect(null).assertFail();
      } catch (error) {
        console.error(`HKDF “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Hkdf_Func_0900
     * @tc.name Test HKDF derived algorithm traversal test, keySize = mdSize * 255 + 1. Promise style. Process success
     * @tc.desc algorithm is HKDF
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Hkdf_Func_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let key: string = "hello world";
      let isKeyString: boolean = true;
      let salt: string = "0123456789";
      let info: string = "kdf test";
      let keySize: number = 48 * 255 + 1;
      let kdfAlgName: string = "HKDF|SHA384|EXPAND_ONLY";
      let spec: cryptoFramework.HKDFSpec = hkdfUtils.hkdfSpec(key, isKeyString, salt, info, keySize);
      try {
        await hkdfUtils.hkdfPromise(kdfAlgName, spec);
        expect(null).assertFail();
      } catch (error) {
        console.error(`HKDF “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Hkdf_Func_1000
     * @tc.name Test HKDF derived algorithm traversal test, keySize = mdSize * 255 + 1. Promise style. Process success
     * @tc.desc algorithm is HKDF
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Hkdf_Func_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let key: string = "hello world";
      let isKeyString: boolean = true;
      let salt: string = "0123456789";
      let info: string = "kdf test";
      let keySize: number = 64 * 255 + 1;
      let kdfAlgName: string = "HKDF|SHA512";
      let spec: cryptoFramework.HKDFSpec = hkdfUtils.hkdfSpec(key, isKeyString, salt, info, keySize);
      try {
        await hkdfUtils.hkdfPromise(kdfAlgName, spec);
        expect(null).assertFail();
      } catch (error) {
        console.error(`HKDF “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Hkdf_Func_1100
     * @tc.name Test HKDF derived algorithm traversal test, saltLen = 0. Promise style. Process success
     * @tc.desc algorithm is HKDF
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Hkdf_Func_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let key: string = "hello world";
      let isKeyString: boolean = true;
      let salt: string = "";
      let info: string = "kdf test";
      let keySize: number = 128;
      let kdfAlgName: string = "HKDF|SHA224|EXTRACT_AND_EXPAND";
      let spec: cryptoFramework.HKDFSpec = hkdfUtils.hkdfSpec(key, isKeyString, salt, info, keySize);
      try {
        let secret: cryptoFramework.DataBlob = await hkdfUtils.hkdfPromise(kdfAlgName, spec);
        expect(secret.data.byteLength).assertEqual(keySize);
      } catch (error) {
        console.error(`HKDF “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Hkdf_Func_1200
     * @tc.name Test HKDF derived algorithm traversal test, keyLen = 0. Promise style. Process success
     * @tc.desc algorithm is HKDF
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Hkdf_Func_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let key: string = "";
      let isKeyString: boolean = true;
      let salt: string = "0123456789";
      let info: string = "kdf test";
      let keySize: number = 128;
      let kdfAlgName: string = "HKDF|SHA256|EXPAND_ONLY";
      let spec: cryptoFramework.HKDFSpec = hkdfUtils.hkdfSpec(key, isKeyString, salt, info, keySize);
      try {
        await hkdfUtils.hkdfPromise(kdfAlgName, spec);
        expect(null).assertFail();
      } catch (error) {
        console.error(`HKDF “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Hkdf_Func_1300
     * @tc.name Test HKDF derived algorithm traversal test, keyLen = 0. Promise style. Process success
     * @tc.desc algorithm is HKDF
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Hkdf_Func_1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let key: string = "";
      let isKeyString: boolean = true;
      let salt: string = "0123456789";
      let info: string = "kdf test";
      let keySize: number = 64;
      let kdfAlgName: string = "HKDF|SHA512|EXTRACT_ONLY";
      let spec: cryptoFramework.HKDFSpec = hkdfUtils.hkdfSpec(key, isKeyString, salt, info, keySize);
      try {
        await hkdfUtils.hkdfPromise(kdfAlgName, spec);
        expect(null).assertFail();
      } catch (error) {
        console.error(`HKDF “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Hkdf_Func_1400
     * @tc.name Test HKDF derived algorithm traversal test, keyLen = 0. Promise style. Process success
     * @tc.desc algorithm is HKDF
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Hkdf_Func_1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let key: string = "";
      let isKeyString: boolean = true;
      let salt: string = "0123456789";
      let info: string = "kdf test";
      let keySize: number = 128;
      let kdfAlgName: string = "HKDF|SHA256|EXTRACT_AND_EXPAND";
      let spec: cryptoFramework.HKDFSpec = hkdfUtils.hkdfSpec(key, isKeyString, salt, info, keySize);
      try {
        await hkdfUtils.hkdfPromise(kdfAlgName, spec);
        expect(null).assertFail();
      } catch (error) {
        console.error(`HKDF “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Hkdf_Func_1500
     * @tc.name Test HKDF derived algorithm traversal test, infoLen = 0. Promise style. Process success
     * @tc.desc algorithm is HKDF
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Hkdf_Func_1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let key: string = "hello world";
      let isKeyString: boolean = true;
      let salt: string = "0123456789";
      let info: string = "";
      let keySize: number = 128;
      let kdfAlgName: string = "HKDF|SHA256|EXTRACT_AND_EXPAND";
      let spec: cryptoFramework.HKDFSpec = hkdfUtils.hkdfSpec(key, isKeyString, salt, info, keySize);
      try {
        let secret: cryptoFramework.DataBlob = await hkdfUtils.hkdfPromise(kdfAlgName, spec);
        expect(secret.data.byteLength).assertEqual(keySize);
      } catch (error) {
        console.error(`HKDF “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Hkdf_Func_1600
     * @tc.name Test HKDF derived algorithm traversal test, infoLen = 0. Promise style. Process success
     * @tc.desc algorithm is HKDF
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Hkdf_Func_1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let key: string = "hello world";
      let isKeyString: boolean = true;
      let salt: string = "0123456789";
      let info: string = "";
      let keySize: number = 32;
      let kdfAlgName: string = "HKDF|SHA256|EXPAND_ONLY";
      let spec: cryptoFramework.HKDFSpec = hkdfUtils.hkdfSpec(key, isKeyString, salt, info, keySize);
      try {
        let secret: cryptoFramework.DataBlob = await hkdfUtils.hkdfPromise(kdfAlgName, spec);
        expect(secret.data.byteLength).assertEqual(keySize);
      } catch (error) {
        console.error(`HKDF “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Hkdf_Func_1700
     * @tc.name Test HKDF derived algorithm traversal test, saltLen = 0. Promise style. Process success
     * @tc.desc algorithm is HKDF
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Hkdf_Func_1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let key: string = "hello world";
      let isKeyString: boolean = true;
      let salt: string = "";
      let info: string = "0123456789";
      let keySize: number = 20;
      let kdfAlgName: string = "HKDF|SHA1|EXTRACT_ONLY";
      let spec: cryptoFramework.HKDFSpec = hkdfUtils.hkdfSpec(key, isKeyString, salt, info, keySize);
      try {
        let secret: cryptoFramework.DataBlob = await hkdfUtils.hkdfPromise(kdfAlgName, spec);
        expect(secret.data.byteLength).assertEqual(keySize);
      } catch (error) {
        console.error(`HKDF “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Hkdf_Func_1800
     * @tc.name Test HKDF derived algorithm traversal test, saltLen = 0. Promise style. Process success
     * @tc.desc algorithm is HKDF
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Hkdf_Func_1800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let key: string = "hello world";
      let isKeyString: boolean = false;
      let salt: string = "";
      let info: string = "0123456789";
      let keySize: number = 128;
      let kdfAlgName: string = "HKDF|SHA1|EXTRACT_AND_EXPAND";
      let spec: cryptoFramework.HKDFSpec = hkdfUtils.hkdfSpec(key, isKeyString, salt, info, keySize);
      try {
        let secret: cryptoFramework.DataBlob = await hkdfUtils.hkdfPromise(kdfAlgName, spec);
        expect(secret.data.byteLength).assertEqual(keySize);
      } catch (error) {
        console.error(`HKDF “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Hkdf_Func_1900
     * @tc.name Test HKDF derived algorithm traversal test. Promise style. Process success
     * @tc.desc algorithm is HKDF
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Hkdf_Func_1900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let kdfAlgName: string = "HKDF|MD5";
        cryptoFramework.createKdf(kdfAlgName);
      } catch (error) {
        console.error(`HKDF “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Hkdf_Func_2000
     * @tc.name Test HKDF derived algorithm traversal test. Promise style. Process success
     * @tc.desc algorithm is HKDF
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Hkdf_Func_2000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let kdfAlgName: string = "SCRYPT|SHA256";
        cryptoFramework.createKdf(kdfAlgName);
      } catch (error) {
        console.error(`HKDF “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Hkdf_Func_2100
     * @tc.name Test HKDF derived algorithm traversal test, KAT. Promise style. Process success
     * @tc.desc algorithm is HKDF
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Hkdf_Func_2100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        for (let vectors of hkdfUtils.KAT_VECTOR_DATA) {
          let key = vectors.key;
          let salt = vectors.salt;
          let info = vectors.info;
          let keySize = vectors.keySize;
          let expectSecret = vectors.expectSecret;
          let hashName = vectors.hashName;
          let spec: cryptoFramework.HKDFSpec = {
            algName: "HKDF",
            key: new Uint8Array(key),
            salt: new Uint8Array(salt),
            info: new Uint8Array(info),
            keySize: keySize
          };
          let kdfAlgName: string = "HKDF|" + hashName + "|EXTRACT_AND_EXPAND";
          let secret: cryptoFramework.DataBlob = await hkdfUtils.hkdfPromise(kdfAlgName, spec);
          let hexSecret: string = commonUtils.decToHexString(secret);
          let hkdfSecret: number[] = commonUtils.convertToUint8Array(hexSecret);
          let ret: boolean = commonUtils.compareNumber(hkdfSecret, expectSecret);
          expect(ret).assertTrue();
          expect(secret.data.length).assertEqual(keySize);
        }
      } catch (error) {
        console.error(`HKDF “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Hkdf_Func_2200
     * @tc.name Test HKDF derived algorithm traversal test, KAT. Callback style. Process success
     * @tc.desc algorithm is HKDF
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Hkdf_Func_2200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        for (let vectors of hkdfUtils.KAT_VECTOR_DATA) {
          let key = vectors.key;
          let salt = vectors.salt;
          let info = vectors.info;
          let keySize = vectors.keySize;
          let expectSecret = vectors.expectSecret;
          let hashName = vectors.hashName;
          let spec: cryptoFramework.HKDFSpec = {
            algName: "HKDF",
            key: new Uint8Array(key),
            salt: new Uint8Array(salt),
            info: new Uint8Array(info),
            keySize: keySize
          };
          let kdfAlgName: string = "HKDF|" + hashName + "|EXTRACT_AND_EXPAND";
          let secret: cryptoFramework.DataBlob = await hkdfUtils.hkdfCallback(kdfAlgName, spec);
          let hexSecret: string = commonUtils.decToHexString(secret);
          let hkdfSecret: number[] = commonUtils.convertToUint8Array(hexSecret);
          let ret: boolean = commonUtils.compareNumber(hkdfSecret, expectSecret);
          expect(ret).assertTrue();
          expect(secret.data.length).assertEqual(keySize);
        }
      } catch (error) {
        console.error(`HKDF “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });
  });
}