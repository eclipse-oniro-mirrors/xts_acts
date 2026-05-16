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
import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import Utils from './Util.test';
import  buffer  from '@ohos.buffer';
import cryptoFramework from '@ohos.security.cryptoFramework';
import * as commonUtils from './utils/common/commonUtils';
import * as hmacSyncUtils from './utils/hmac/hmacSyncUtils';
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let testAbilityContext:common.UIAbilityContext;


export default function SecurityCryptoFwHmacSyncTestUnit() {
  describe("SecurityCryptoFwHmacSyncTestUnit", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');
    
    /**
     * @tc.name   SUB_Security_CryptoFramework_HMACSync_Func_0100
     * @tc.number SUB_Security_CryptoFramework_HMACSync_Func_0100
     * @tc.desc   algorithm is HMAC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_HMACSync_Func_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let keyAlgName: string = "AES256";
        let messageLen: int = 128;
        let message: cryptoFramework.DataBlob = await hmacSyncUtils.createData(messageLen);
        let key: cryptoFramework.SymKey = await hmacSyncUtils.genSymKey(keyAlgName);
        for(let algName of hmacSyncUtils.H_MAC_SPEC) {
          let macRes: hmacSyncUtils.macInfo = hmacSyncUtils.doHmacSync(algName, message, key);
          let macLen: number = hmacSyncUtils.getMacSize(algName);
          expect(macLen).assertEqual(macRes.macObj.getMacLength());
        }
      } catch (error: BusinessError) {
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
    it("SUB_Security_CryptoFramework_HMACSync_Func_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let keyAlgName: string = "AES256";
        let messageLen: int = 16384;
        let message: cryptoFramework.DataBlob = await hmacSyncUtils.createData(messageLen);
        let key: cryptoFramework.SymKey = await hmacSyncUtils.genSymKey(keyAlgName);
        for(let algName of hmacSyncUtils.H_MAC_SPEC) {
          let macRes: hmacSyncUtils.macInfo = hmacSyncUtils.doHmacSync(algName, message, key);
          let macLen: number = hmacSyncUtils.getMacSize(algName);
          expect(macLen).assertEqual(macRes.macObj.getMacLength());
        }
      } catch (error: BusinessError) {
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
    // it("SUB_Security_CryptoFramework_HMACSync_Func_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
    //   try {
    //     let algName: string = "SHA256";
    //     let key: cryptoFramework.SymKey;
    //     let mac: cryptoFramework.Mac = cryptoFramework.createMac(algName);
    //     mac.initSync(key);
    //     expect(null).assertTrue()
    //   } catch (error: BusinessError) {
    //     console.error(`HMAC “${error}“, error code: ${error.code}`);
    //     expect(error.code).assertEqual(401);
    //   }
    //   done();
    // }); // arkts1.2 let undefined

    /**
     * @tc.name   SUB_Security_CryptoFramework_HMACSync_Func_0400
     * @tc.number SUB_Security_CryptoFramework_HMACSync_Func_0400
     * @tc.desc   algorithm is HMAC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_HMACSync_Func_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let keyAlgName: string = "HMAC";
        let data: string = '0123456789';
        let dataArray: Uint8Array = commonUtils.stringToUint8Array(data);
        let dataKey: cryptoFramework.DataBlob = {
          data: dataArray
        }
        let messageLen: int = 128;
        let message: cryptoFramework.DataBlob = await hmacSyncUtils.createData(messageLen);
        let key: cryptoFramework.SymKey = await hmacSyncUtils.convertSymKey(keyAlgName, dataKey);
        for(let algName of hmacSyncUtils.H_MAC_SPEC) {
          let macRes: hmacSyncUtils.macInfo = hmacSyncUtils.doHmacSync(algName, message, key);
          let macLen: number = hmacSyncUtils.getMacSize(algName);
          expect(macLen).assertEqual(macRes.macObj.getMacLength());
        }
        expect(data.length).assertEqual(key.getEncoded().data.length);
      } catch (error: BusinessError) {
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
    it("SUB_Security_CryptoFramework_HMACSync_Func_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let keyAlgName: string = "HMAC";
        let messageLen: int = 128;
        let message: cryptoFramework.DataBlob = await hmacSyncUtils.createData(messageLen);
        for(let algName of hmacSyncUtils.H_MAC_SPEC) {
          let macLen: int = hmacSyncUtils.getMacSize(algName) as int;
          let keyLen: int = macLen + 16;
          let dataKey: cryptoFramework.DataBlob = await hmacSyncUtils.createData(keyLen);
          let key: cryptoFramework.SymKey = await hmacSyncUtils.convertSymKey(keyAlgName, dataKey);
          let macRes: hmacSyncUtils.macInfo = hmacSyncUtils.doHmacSync(algName, message, key);
          expect(macLen).assertEqual(macRes.macObj.getMacLength());
          expect(keyLen).assertEqual(key.getEncoded().data.length);
        }
      } catch (error: BusinessError) {
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
    it("SUB_Security_CryptoFramework_HMACSync_Func_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let keyAlgName: string = "HMAC";
        let messageLen: int = 128;
        let message: cryptoFramework.DataBlob = await hmacSyncUtils.createData(messageLen);
        for(let algName of hmacSyncUtils.H_MAC_SPEC) {
          let macLen: number = hmacSyncUtils.getMacSize(algName);
          let keyLen: int = macLen as int;
          let dataKey: cryptoFramework.DataBlob = await hmacSyncUtils.createData(keyLen);
          let key: cryptoFramework.SymKey = await hmacSyncUtils.convertSymKey(keyAlgName, dataKey);
          let macRes: hmacSyncUtils.macInfo = hmacSyncUtils.doHmacSync(algName, message, key);
          expect(macLen).assertEqual(macRes.macObj.getMacLength());
          expect(keyLen).assertEqual(key.getEncoded().data.length);
        }
      } catch (error: BusinessError) {
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
    it("SUB_Security_CryptoFramework_HMACSync_Func_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let keyAlgName: string = "AES256";
        let key: cryptoFramework.SymKey = await hmacSyncUtils.genSymKey(keyAlgName);
        for(let algName of hmacSyncUtils.H_MAC_SPEC) {
          let macLen: number = hmacSyncUtils.getMacSize(algName);
          let macRes: hmacSyncUtils.macInfo = hmacSyncUtils.doHmacNoMessageSync(algName, key);
          expect(macLen).assertEqual(macRes.macObj.getMacLength());
        }
      } catch (error: BusinessError) {
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
    it("SUB_Security_CryptoFramework_HMACSync_Func_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
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
      } catch (error: BusinessError) {
        console.error(`HMAC “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401); // 1.1:30001
      }
      done();
    });

    });
}