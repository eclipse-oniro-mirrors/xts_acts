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
import * as pbkdf2Utils from './utils/pbkdf2/pbkdf2Utils';


export default function SecurityCryptoFwPbkdf2TestUnit() {
  describe('SecurityCryptoFwPbkdf2TestUnit', () => {
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
     * @tc.number SUB_Security_CryptoFramework_pbKdf2_Func_0100
     * @tc.name Test PBKDF2 algorithm traversal test. Callback style. Process success
     * @tc.desc algorithm is PBKDF2
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_pbKdf2_Func_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let password: string = "hello world";
      let isKeyString: boolean = false;
      let salt: string = "0123456789";
      let keySize: number = 128;
      let iterations: number = 10000;
      let algName: string = "PBKDF2";
      let spec: cryptoFramework.PBKDF2Spec = pbkdf2Utils.getPbkdf2Spec(password, isKeyString, salt, iterations, keySize);
      try {
        for (let digest of pbkdf2Utils.KDF_DIGEST_SPEC) {
          let kdfAlgName: string = algName + "|" + digest;
          let secret: cryptoFramework.DataBlob = pbkdf2Utils.generateKdfKey(kdfAlgName, spec);
          expect(secret.data.byteLength).assertEqual(keySize);
        }
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_pbKdf2_Func_0200
     * @tc.name Test PBKDF2 algorithm traversal test. Callback style. Process success
     * @tc.desc algorithm is PBKDF2
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_pbKdf2_Func_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let password: string = "hello world";
      let isKeyString: boolean = false;
      let salt: string = "0123456789";
      let keySize: number = 0;
      let iterations: number = 10000;
      let algName: string = "PBKDF2";
      let spec: cryptoFramework.PBKDF2Spec = pbkdf2Utils.getPbkdf2Spec(password, isKeyString, salt, iterations, keySize);
      try {
        for (let digest of pbkdf2Utils.KDF_DIGEST_SPEC) {
          let kdfAlgName: string = algName + "|" + digest;
          pbkdf2Utils.generateKdfKey(kdfAlgName, spec);
          expect(null).assertFail();
        }
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_pbKdf2_Func_0201
     * @tc.name Test PBKDF2 algorithm traversal test. Callback style. Process success
     * @tc.desc algorithm is PBKDF2
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_pbKdf2_Func_0201", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let password: string = "hello world";
      let isKeyString: boolean = false;
      let salt: string = "0123456789";
      let keySize: number = 1;
      let iterations: number = 10000;
      let algName: string = "PBKDF2";
      let spec: cryptoFramework.PBKDF2Spec = pbkdf2Utils.getPbkdf2Spec(password, isKeyString, salt, iterations, keySize);
      try {
        for (let digest of pbkdf2Utils.KDF_DIGEST_SPEC) {
          let kdfAlgName: string = algName + "|" + digest;
          let secret: cryptoFramework.DataBlob = pbkdf2Utils.generateKdfKey(kdfAlgName, spec);
          expect(secret.data.byteLength).assertEqual(keySize);
        }
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_pbKdf2_Func_0202
     * @tc.name Test PBKDF2 algorithm traversal test. Callback style. Process success
     * @tc.desc algorithm is PBKDF2
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_pbKdf2_Func_0202", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let password: string = "hello world";
      let isKeyString: boolean = false;
      let salt: string = "0123456789";
      let keySize: number = 21 * 4294967295;
      let iterations: number = 10000;
      let algName: string = "PBKDF2";
      let digest:string = "SHA1";
      let spec: cryptoFramework.PBKDF2Spec = pbkdf2Utils.getPbkdf2Spec(password, isKeyString, salt, iterations, keySize);
      try {
        let kdfAlgName: string = algName + "|" + digest;
        pbkdf2Utils.generateKdfKey(kdfAlgName, spec);
        expect(null).assertFail();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_pbKdf2_Func_0300
     * @tc.name Test PBKDF2 algorithm traversal test. Callback style. Process success
     * @tc.desc algorithm is PBKDF2
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_pbKdf2_Func_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let password: string = "hello world";
      let isKeyString: boolean = false;
      let salt: string = "";
      let keySize: number = 16;
      let iterations: number = 20000;
      let algName: string = "PBKDF2";
      let spec: cryptoFramework.PBKDF2Spec = pbkdf2Utils.getPbkdf2Spec(password, isKeyString, salt, iterations, keySize);
      try {
        for (let digest of pbkdf2Utils.KDF_DIGEST_SPEC) {
          let kdfAlgName: string = algName + "|" + digest;
          let secret: cryptoFramework.DataBlob = pbkdf2Utils.generateKdfKey(kdfAlgName, spec);
          expect(secret.data.byteLength).assertEqual(keySize);
        }
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_pbKdf2_Func_0400
     * @tc.name Test PBKDF2 algorithm traversal test. Callback style. Process success
     * @tc.desc algorithm is PBKDF2
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_pbKdf2_Func_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let password: string = "";
      let isKeyString: boolean = false;
      let salt: string = "0123456789";
      let keySize: number = 16;
      let iterations: number = 20000;
      let algName: string = "PBKDF2";
      let spec: cryptoFramework.PBKDF2Spec = pbkdf2Utils.getPbkdf2Spec(password, isKeyString, salt, iterations, keySize);
      try {
        for (let digest of pbkdf2Utils.KDF_DIGEST_SPEC) {
          let kdfAlgName: string = algName + "|" + digest;
          let secret: cryptoFramework.DataBlob = pbkdf2Utils.generateKdfKey(kdfAlgName, spec);
          expect(secret.data.byteLength).assertEqual(keySize);
        }
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_pbKdf2_Func_0500
     * @tc.name Test PBKDF2 algorithm traversal test. Callback style. Process success
     * @tc.desc algorithm is PBKDF2
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_pbKdf2_Func_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let password: string = "0123456789";
      let isKeyString: boolean = false;
      let salt: string = "0123456789";
      let keySize: number = 16;
      let iterations: number = 0;
      let algName: string = "PBKDF2|SHA256";
      let spec: cryptoFramework.PBKDF2Spec = pbkdf2Utils.getPbkdf2Spec(password, isKeyString, salt, iterations, keySize);
      try {
        pbkdf2Utils.generateKdfKey(algName, spec);
        expect(null).assertFail();
      } catch (error) {
        console.error(`PBKDF2 “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_pbKdf2_Func_0501
     * @tc.name Test PBKDF2 algorithm traversal test. Callback style. Process success
     * @tc.desc algorithm is PBKDF2
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_pbKdf2_Func_0501", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let password: string = "0123456789";
      let isKeyString: boolean = false;
      let salt: string = "0123456789";
      let keySize: number = 16;
      let iterations: number = 1;
      let algName: string = "PBKDF2|SHA256";
      let spec: cryptoFramework.PBKDF2Spec = pbkdf2Utils.getPbkdf2Spec(password, isKeyString, salt, iterations, keySize);
      try {
        let secret: cryptoFramework.DataBlob = pbkdf2Utils.generateKdfKey(algName, spec);
        expect(secret.data.byteLength).assertEqual(keySize);
      } catch (error) {
        console.error(`PBKDF2 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_pbKdf2_Func_0502
     * @tc.name Test PBKDF2 algorithm traversal test. Callback style. Process success
     * @tc.desc algorithm is PBKDF2
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_pbKdf2_Func_0502", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let password: string = "0123456789";
      let isKeyString: boolean = false;
      let salt: string = "0123456789";
      let keySize: number = 16;
      let iterations: number = -1;
      let algName: string = "PBKDF2|SHA256";
      let spec: cryptoFramework.PBKDF2Spec = pbkdf2Utils.getPbkdf2Spec(password, isKeyString, salt, iterations, keySize);
      try {
        pbkdf2Utils.generateKdfKey(algName, spec);
        expect(null).assertFail();
      } catch (error) {
        console.error(`PBKDF2 “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_pbKdf2_Func_0503
     * @tc.name Test PBKDF2 algorithm traversal test. Callback style. Process success
     * @tc.desc algorithm is PBKDF2
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_pbKdf2_Func_0503", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let password: string = "0123456789";
      let isKeyString: boolean = false;
      let salt: string = "0123456789";
      let keySize: number = 16;
      let iterations: number = 1000.56;
      let algName: string = "PBKDF2|SHA224";
      let spec: cryptoFramework.PBKDF2Spec = pbkdf2Utils.getPbkdf2Spec(password, isKeyString, salt, iterations, keySize);
      try {
        let secret: cryptoFramework.DataBlob = pbkdf2Utils.generateKdfKey(algName, spec);
        expect(secret.data.byteLength).assertEqual(keySize);
      } catch (error) {
        console.error(`PBKDF2 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_pbKdf2_Func_0600
     * @tc.name Test PBKDF2 algorithm traversal test. Callback style. Process success
     * @tc.desc algorithm is PBKDF2
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_pbKdf2_Func_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let password: string = "0123456789";
      let isKeyString: boolean = false;
      let salt: string = "0123456789";
      let keySize: number = 16;
      let iterations: number = 10000;
      let algName: string = "PBKDF2|SHA3-256";
      let spec: cryptoFramework.PBKDF2Spec = pbkdf2Utils.getPbkdf2Spec(password, isKeyString, salt, iterations, keySize);
      try {
        pbkdf2Utils.generateKdfKey(algName, spec);
        expect(null).assertFail();
      } catch (error) {
        console.error(`PBKDF2 “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_pbKdf2_Func_0700
     * @tc.name Test PBKDF2 algorithm traversal test. Sync style. Process success
     * @tc.desc algorithm is PBKDF2
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_pbKdf2_Func_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let password: string = "0123456789";
      let isKeyString: boolean = false;
      let salt: string = "0123456789";
      let keySize: number = 16;
      let iterations: number = 10000;
      let algName: string = "SCRYPT|SHA256";
      let spec: cryptoFramework.PBKDF2Spec = pbkdf2Utils.getPbkdf2Spec(password, isKeyString, salt, iterations, keySize);
      try {
        pbkdf2Utils.generateKdfKey(algName, spec);
        expect(null).assertFail();
      } catch (error) {
        console.error(`PBKDF2 “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });


  });
}