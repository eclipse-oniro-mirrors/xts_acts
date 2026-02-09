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
import * as hmacSyncUtils from './utils/hmac/hmacSyncUtils';


export default function SecurityCryptoFwHmacSyncTestUnit() {
  describe('SecurityCryptoFwHmacSyncTestUnit', () => {
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
     * @tc.name   SUB_Security_CryptoFramework_HMACSync_Func_0100
     * @tc.number SUB_Security_CryptoFramework_HMACSync_Func_0100
     * @tc.desc   algorithm is HMAC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_HMACSync_Func_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let keyAlgName: string = "AES256";
        let messageLen: number = 128;
        let message: cryptoFramework.DataBlob = await hmacSyncUtils.createData(messageLen);
        let key: cryptoFramework.SymKey = await hmacSyncUtils.genSymKey(keyAlgName);
        for(let algName of hmacSyncUtils.H_MAC_SPEC) {
          let macRes: hmacSyncUtils.macInfo = hmacSyncUtils.doHmacSync(algName, message, key);
          let macLen: number = hmacSyncUtils.getMacSize(algName);
          expect(macLen).assertEqual(macRes.macObj.getMacLength());
        }
      } catch (error) {
        console.error(`HMAC “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_HMACSync_Func_0200
     * @tc.number SUB_Security_CryptoFramework_HMACSync_Func_0200
     * @tc.desc   algorithm is HMAC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_HMACSync_Func_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let keyAlgName: string = "AES256";
        let messageLen: number = 16384;
        let message: cryptoFramework.DataBlob = await hmacSyncUtils.createData(messageLen);
        let key: cryptoFramework.SymKey = await hmacSyncUtils.genSymKey(keyAlgName);
        for(let algName of hmacSyncUtils.H_MAC_SPEC) {
          let macRes: hmacSyncUtils.macInfo = hmacSyncUtils.doHmacSync(algName, message, key);
          let macLen: number = hmacSyncUtils.getMacSize(algName);
          expect(macLen).assertEqual(macRes.macObj.getMacLength());
        }
      } catch (error) {
        console.error(`HMAC “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_HMACSync_Func_0300
     * @tc.number SUB_Security_CryptoFramework_HMACSync_Func_0300
     * @tc.desc   algorithm is HMAC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_HMACSync_Func_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let algName: string = "SHA256";
        let key: cryptoFramework.SymKey = {} as cryptoFramework.SymKey;
        let mac: cryptoFramework.Mac = cryptoFramework.createMac(algName);
        mac.initSync(key);
        expect(null).assertTrue()
      } catch (error) {
        console.error(`HMAC “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_HMACSync_Func_0400
     * @tc.number SUB_Security_CryptoFramework_HMACSync_Func_0400
     * @tc.desc   algorithm is HMAC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_HMACSync_Func_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let keyAlgName: string = "HMAC";
        let data: string = '0123456789';
        let dataArray: Uint8Array = commonUtils.stringToUint8Array(data);
        let dataKey: cryptoFramework.DataBlob = {
          data: dataArray
        }
        let messageLen: number = 128;
        let message: cryptoFramework.DataBlob = await hmacSyncUtils.createData(messageLen);
        let key: cryptoFramework.SymKey = await hmacSyncUtils.convertSymKey(keyAlgName, dataKey);
        for(let algName of hmacSyncUtils.H_MAC_SPEC) {
          let macRes: hmacSyncUtils.macInfo = hmacSyncUtils.doHmacSync(algName, message, key);
          let macLen: number = hmacSyncUtils.getMacSize(algName);
          expect(macLen).assertEqual(macRes.macObj.getMacLength());
        }
        expect(data.length).assertEqual(key.getEncoded().data.length);
      } catch (error) {
        console.error(`HMAC “${error}“, error code: ${error.code}`);
        expect(null).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_HMACSync_Func_0500
     * @tc.number SUB_Security_CryptoFramework_HMACSync_Func_0500
     * @tc.desc   algorithm is HMAC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_HMACSync_Func_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let keyAlgName: string = "HMAC";
        let messageLen: number = 128;
        let message: cryptoFramework.DataBlob = await hmacSyncUtils.createData(messageLen);
        for(let algName of hmacSyncUtils.H_MAC_SPEC) {
          let macLen: number = hmacSyncUtils.getMacSize(algName);
          let keyLen: number = macLen + 16;
          let dataKey: cryptoFramework.DataBlob = await hmacSyncUtils.createData(keyLen);
          let key: cryptoFramework.SymKey = await hmacSyncUtils.convertSymKey(keyAlgName, dataKey);
          let macRes: hmacSyncUtils.macInfo = hmacSyncUtils.doHmacSync(algName, message, key);
          expect(macLen).assertEqual(macRes.macObj.getMacLength());
          expect(keyLen).assertEqual(key.getEncoded().data.length);
        }
      } catch (error) {
        console.error(`HMAC “${error}“, error code: ${error.code}`);
        expect(null).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_HMACSync_Func_0600
     * @tc.number SUB_Security_CryptoFramework_HMACSync_Func_0600
     * @tc.desc   algorithm is HMAC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_HMACSync_Func_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let keyAlgName: string = "HMAC";
        let messageLen: number = 128;
        let message: cryptoFramework.DataBlob = await hmacSyncUtils.createData(messageLen);
        for(let algName of hmacSyncUtils.H_MAC_SPEC) {
          let macLen: number = hmacSyncUtils.getMacSize(algName);
          let keyLen: number = macLen;
          let dataKey: cryptoFramework.DataBlob = await hmacSyncUtils.createData(keyLen);
          let key: cryptoFramework.SymKey = await hmacSyncUtils.convertSymKey(keyAlgName, dataKey);
          let macRes: hmacSyncUtils.macInfo = hmacSyncUtils.doHmacSync(algName, message, key);
          expect(macLen).assertEqual(macRes.macObj.getMacLength());
          expect(keyLen).assertEqual(key.getEncoded().data.length);
        }
      } catch (error) {
        console.error(`HMAC “${error}“, error code: ${error.code}`);
        expect(null).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_HMACSync_Func_0700
     * @tc.number SUB_Security_CryptoFramework_HMACSync_Func_0700
     * @tc.desc   algorithm is HMAC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_HMACSync_Func_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let keyAlgName: string = "AES256";
        let key: cryptoFramework.SymKey = await hmacSyncUtils.genSymKey(keyAlgName);
        for(let algName of hmacSyncUtils.H_MAC_SPEC) {
          let macLen: number = hmacSyncUtils.getMacSize(algName);
          let macRes: hmacSyncUtils.macInfo = hmacSyncUtils.doHmacNoMessageSync(algName, key);
          expect(macLen).assertEqual(macRes.macObj.getMacLength());
        }
      } catch (error) {
        console.error(`HMAC “${error}“, error code: ${error.code}`);
        expect(null).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_HMACSync_Func_0800
     * @tc.number SUB_Security_CryptoFramework_HMACSync_Func_0800
     * @tc.desc   algorithm is HMAC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_HMACSync_Func_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let keyAlgName: string = "AES256";
        let algName: string = "SHA256";
        let data: string = "";
        let dataArray: Uint8Array = commonUtils.stringToUint8Array(data);
        let message: cryptoFramework.DataBlob = {
          data: dataArray
        }
        let key: cryptoFramework.SymKey = await hmacSyncUtils.genSymKey(keyAlgName);
        let mac: cryptoFramework.Mac = cryptoFramework.createMac(algName);
        mac.initSync(key);
        mac.updateSync(message);
      } catch (error) {
        console.error(`HMAC “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(17630001);
      }
      done();
    });

    });
}