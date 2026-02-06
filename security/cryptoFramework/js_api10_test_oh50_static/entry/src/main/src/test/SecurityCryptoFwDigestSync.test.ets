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
import * as commonUtils from './utils/common/commonUtils';
import * as digestSyncUtils from './utils/digest/digestSyncUtils';
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let testAbilityContext:common.UIAbilityContext;


export default function SecurityCryptoFwDigestSyncTestUnit() {
  describe("SecurityCryptoFwDigestSyncTestUnit", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');
    
    /**
     * @tc.name   SUB_Security_CryptoFramework_DigestSync_Func_0100
     * @tc.number SUB_Security_CryptoFramework_DigestSync_Func_0100
     * @tc.desc   algorithm is digest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_DigestSync_Func_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let messageLen: int = 128;
        let message: cryptoFramework.DataBlob = await commonUtils.createData(messageLen);
        for(let algName of digestSyncUtils.DIGEST_SPEC) {
          let dataRes: digestSyncUtils.mdInfo = digestSyncUtils.doMdSync(algName, message);
          let mdSize: number = digestSyncUtils.getMdSize(algName);
          expect(dataRes.mdObj.getMdLength()).assertEqual(mdSize);
        }
      } catch (error) {
        console.error(`Digest “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_DigestSync_Func_0200
     * @tc.number SUB_Security_CryptoFramework_DigestSync_Func_0200
     * @tc.desc   algorithm is digest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_DigestSync_Func_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let messageLen: int = 128;
        let blockSize: int = 20;
        let message: cryptoFramework.DataBlob = await commonUtils.createData(messageLen);
        for(let algName of digestSyncUtils.DIGEST_SPEC) {
          let dataResSpilt: digestSyncUtils.mdInfo = digestSyncUtils.doMdSyncSplit(algName, message, blockSize);
          let dataRes: digestSyncUtils.mdInfo = digestSyncUtils.doMdSync(algName, message);
          let ret: boolean = commonUtils.compareDataBlob(dataRes.dataRes, dataResSpilt.dataRes);
          let mdSize: number = digestSyncUtils.getMdSize(algName);
          expect(ret).assertTrue();
          expect(dataResSpilt.mdObj.getMdLength()).assertEqual(mdSize);
          expect(dataRes.mdObj.getMdLength()).assertEqual(mdSize);
        }
      } catch (error) {
        console.error(`Digest “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_DigestSync_Func_0300
     * @tc.number SUB_Security_CryptoFramework_DigestSync_Func_0300
     * @tc.desc   algorithm is digest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_DigestSync_Func_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        for(let algName of digestSyncUtils.DIGEST_SPEC) {
          let dataRes: digestSyncUtils.mdInfo = digestSyncUtils.doMdWithNoUpdateSync(algName);
          let mdSize: number = digestSyncUtils.getMdSize(algName);
          expect(dataRes.mdObj.getMdLength()).assertEqual(mdSize);
        }
      } catch (error) {
        console.error(`Digest “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_DigestSync_Func_0400
     * @tc.number SUB_Security_CryptoFramework_DigestSync_Func_0400
     * @tc.desc   algorithm is digest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_DigestSync_Func_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let data: string = '';
        let dataArray: Uint8Array = commonUtils.stringToUint8Array(data);
        let message: cryptoFramework.DataBlob = {
          data: dataArray
        }
        for(let algName of digestSyncUtils.DIGEST_SPEC) {
          let md: cryptoFramework.Md = cryptoFramework.createMd(algName);
          try {
            md.updateSync(message);
          } catch (error) {
            console.error(`Digest Update “${error}“, error code: ${error.code}`);
            expect((error as BusinessError).code).assertEqual(401); // 1.1: 30001
          }
        }
        expect(null).assertNull();
      } catch (error) {
        console.error(`Digest “${error}“, error code: ${error.code}`);
        expect(null).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_DigestSync_Func_0500
     * @tc.number SUB_Security_CryptoFramework_DigestSync_Func_0500
     * @tc.desc   algorithm is digest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_DigestSync_Func_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "SHA3-224";
        cryptoFramework.createMd(algName);
        expect(null).assertTrue();
      } catch (error) {
        console.error(`Digest “${error}“, error code: ${error.code}`);
        expect((error as BusinessError).code).assertEqual(401);
      }
      done();
    });


  });
}