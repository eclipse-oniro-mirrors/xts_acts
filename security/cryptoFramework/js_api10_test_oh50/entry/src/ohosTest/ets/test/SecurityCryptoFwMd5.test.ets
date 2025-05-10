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
import * as commonUtils from './utils/common/commonUtils'
import * as md5Utils from './utils/md5/md5Utils'


export default function SecurityCryptoFwMd5TestUnit() {
  describe('SecurityCryptoFwMd5TestUnit', () => {
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
     * @tc.number SUB_Security_CryptoFramework_Md5_Func_0100
     * @tc.name Test Md5. Callback style. Process success
     * @tc.desc algorithm is Md5
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Md5_Func_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let symKeyAlgName: string = "AES128";
        let msgLen: number = 1024;
        let macAlgName:string = "MD5";
        let message: cryptoFramework.DataBlob = await commonUtils.createData(msgLen);
        let macResult: cryptoFramework.DataBlob = await md5Utils.doHmac(symKeyAlgName, macAlgName, message);
        expect(macResult.data.byteLength).assertEqual(16);
      } catch (error) {
        console.error(`HKDF “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Md5_Func_0200
     * @tc.name Test Md5. Callback style. Process success
     * @tc.desc algorithm is Md5
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Md5_Func_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let symKeyAlgName: string = "AES128";
        let msgLen: number = 64;
        let macAlgName:string = "MD5";
        let blockSize: number = 64;
        let message: cryptoFramework.DataBlob = await commonUtils.createData(msgLen);
        let key: cryptoFramework.SymKey = await md5Utils.genSymKey(symKeyAlgName);
        let macResult1: cryptoFramework.DataBlob = await md5Utils.doHmacWithSplit(macAlgName, key, message, blockSize);
        let macResult2: cryptoFramework.DataBlob = await md5Utils.doHmacWithKey(key, macAlgName, message);
        let ret: boolean = commonUtils.compareDataBlob(macResult1, macResult2);
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`HKDF “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Md5_Func_0300
     * @tc.name Test Md5. Callback style. Process success
     * @tc.desc algorithm is Md5
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Md5_Func_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let symKeyAlgName: string = "AES128";
        let macAlgName:string = "MD5";
        let macResult: cryptoFramework.DataBlob = await md5Utils.doHmacNoUpdate(symKeyAlgName, macAlgName);
        expect(macResult.data.byteLength).assertEqual(16);
      } catch (error) {
        console.error(`HKDF “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Md5_Func_0400
     * @tc.name Test Md5. Callback style. Process success
     * @tc.desc algorithm is Md5
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Md5_Func_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let symKeyAlgName: string = "AES128";
        let macAlgName:string = "MD5";
        let message: cryptoFramework.DataBlob = {data: new Uint8Array()};
        await md5Utils.doHmac(symKeyAlgName, macAlgName, message);
        expect(null).assertFail();
      } catch (error) {
        console.error(`HKDF “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CryptoFramework_Md5_Func_0500
     * @tc.name Test Md5. Callback style. Process success
     * @tc.desc algorithm is Md5
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Md5_Func_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let symKeyAlgName: string = "AES256";
        let msgLen: number = 1024;
        let macAlgName:string = "MD5";
        let message: cryptoFramework.DataBlob = await commonUtils.createData(msgLen);
        let macResult: cryptoFramework.DataBlob = await md5Utils.doHmac(symKeyAlgName, macAlgName, message);
        expect(macResult.data.byteLength).assertEqual(16);
      } catch (error) {
        console.error(`HKDF “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });
    
    /**
     * @tc.number SUB_Security_CryptoFramework_Md5_Func_0600
     * @tc.name Test Md5. Callback style. Process success
     * @tc.desc algorithm is Md5
     * @tc.size Medium
     * @tc.type Func
     * @tc.level Level3
     */
    it("SUB_Security_CryptoFramework_Md5_Func_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let msgLen: number = 1024;
        let macAlgName:string = "MD5";
        let message: cryptoFramework.DataBlob = await commonUtils.createData(msgLen);
        let mac: cryptoFramework.Mac = cryptoFramework.createMac(macAlgName);
        try {
          await mac.update(message);
        } catch (error) {
          console.error(`HKDF No INIT “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(17630001);
        }
        try {
          await mac.doFinal();
        } catch (error) {
          console.error(`HKDF No INIT “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(17630001);
        }
      } catch (error) {
        console.error(`HKDF “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

  });
}