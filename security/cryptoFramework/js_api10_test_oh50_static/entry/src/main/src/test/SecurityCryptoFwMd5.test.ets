/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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
import * as commonUtils from './utils/common/commonUtils'
import * as md5Utils from './utils/md5/md5Utils'
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let testAbilityContext:common.UIAbilityContext;


export default function SecurityCryptoFwMd5TestUnit() {
  describe("SecurityCryptoFwMd5TestUnit", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');
    
    /**
     * @tc.name   SUB_Security_CryptoFramework_Md5_Func_0100
     * @tc.number SUB_Security_CryptoFramework_Md5_Func_0100
     * @tc.desc   algorithm is Md5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_Md5_Func_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let symKeyAlgName: string = "AES128";
        let msgLen: int = 1024;
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
     * @tc.name   SUB_Security_CryptoFramework_Md5_Func_0200
     * @tc.number SUB_Security_CryptoFramework_Md5_Func_0200
     * @tc.desc   algorithm is Md5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_Md5_Func_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let symKeyAlgName: string = "AES128";
        let msgLen: int = 64;
        let macAlgName:string = "MD5";
        let blockSize: int = 64;
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
     * @tc.name   SUB_Security_CryptoFramework_Md5_Func_0300
     * @tc.number SUB_Security_CryptoFramework_Md5_Func_0300
     * @tc.desc   algorithm is Md5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_Md5_Func_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
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
     * @tc.name   SUB_Security_CryptoFramework_Md5_Func_0400
     * @tc.number SUB_Security_CryptoFramework_Md5_Func_0400
     * @tc.desc   algorithm is Md5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_Md5_Func_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let symKeyAlgName: string = "AES128";
        let macAlgName:string = "MD5";
        let message: cryptoFramework.DataBlob = {data: new Uint8Array()};
        await md5Utils.doHmac(symKeyAlgName, macAlgName, message);
        expect(null).assertFail();
      } catch (error) {
        console.error(`HKDF “${error}“, error code: ${error.code}`);
        expect((error as BusinessError).code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Md5_Func_0500
     * @tc.number SUB_Security_CryptoFramework_Md5_Func_0500
     * @tc.desc   algorithm is Md5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_Md5_Func_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let symKeyAlgName: string = "AES256";
        let msgLen: int = 1024;
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
     * @tc.name   SUB_Security_CryptoFramework_Md5_Func_0600
     * @tc.number SUB_Security_CryptoFramework_Md5_Func_0600
     * @tc.desc   algorithm is Md5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_Md5_Func_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let msgLen: int = 1024;
        let macAlgName:string = "MD5";
        let message: cryptoFramework.DataBlob = await commonUtils.createData(msgLen);
        let mac: cryptoFramework.Mac = cryptoFramework.createMac(macAlgName);
        try {
          await mac.update(message);
        } catch (error) {
          console.error(`HKDF No INIT “${error}“, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(17630001);
        }
        try {
          await mac.doFinal();
        } catch (error) {
          console.error(`HKDF No INIT “${error}“, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(17630001);
        }
      } catch (error) {
        console.error(`HKDF “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

  });
}