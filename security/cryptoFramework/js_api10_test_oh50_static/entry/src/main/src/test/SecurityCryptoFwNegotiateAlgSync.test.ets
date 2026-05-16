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
import * as negotiateAlgSyncUtils from './utils/negotiate/negotiateAlgSync';
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let testAbilityContext:common.UIAbilityContext;


export default function SecurityCryptoFwAgreementSyncTestUnit() {
  describe("SecurityCryptoFwAgreementSyncTestUnit", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');
    
    /**
     * @tc.name   SUB_Security_CryptoFramework_AgreementSync_Func_0100
     * @tc.number SUB_Security_CryptoFramework_AgreementSync_Func_0100
     * @tc.desc   algorithm is digest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_AgreementSync_Func_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        for (let algName of negotiateAlgSyncUtils.ECDH_SPEC) {
          let keyAlgName: string = algName;
          if (algName === "ECC") {
            keyAlgName = "ECC256";
          }
          let keyPair_A: cryptoFramework.KeyPair = await negotiateAlgSyncUtils.generateKey(keyAlgName);
          let keyPair_B: cryptoFramework.KeyPair = await negotiateAlgSyncUtils.generateKey(keyAlgName);
          let secret_A: cryptoFramework.DataBlob = negotiateAlgSyncUtils.eccKeyAgreement(algName, keyPair_A.pubKey, keyPair_B.priKey);
          let secret_B: cryptoFramework.DataBlob = negotiateAlgSyncUtils.eccKeyAgreement(algName, keyPair_B.pubKey, keyPair_A.priKey);
          let ret: boolean = commonUtils.compareDataBlob(secret_A, secret_B);
          expect(ret).assertTrue();
        }
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_AgreementSync_Func_0200
     * @tc.number SUB_Security_CryptoFramework_AgreementSync_Func_0200
     * @tc.desc   algorithm is digest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_AgreementSync_Func_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        for (let algName of negotiateAlgSyncUtils.X25519_SPEC) {
          let keyPair_A: cryptoFramework.KeyPair = await negotiateAlgSyncUtils.generateKey(algName);
          let keyPair_B: cryptoFramework.KeyPair = await negotiateAlgSyncUtils.generateKey(algName);
          let secret_A: cryptoFramework.DataBlob = negotiateAlgSyncUtils.eccKeyAgreement(algName, keyPair_A.pubKey, keyPair_B.priKey);
          let secret_B: cryptoFramework.DataBlob = negotiateAlgSyncUtils.eccKeyAgreement(algName, keyPair_B.pubKey, keyPair_A.priKey);
          let ret: boolean = commonUtils.compareDataBlob(secret_A, secret_B);
          expect(ret).assertTrue();
        }
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_AgreementSync_Func_0300
     * @tc.number SUB_Security_CryptoFramework_AgreementSync_Func_0300
     * @tc.desc   algorithm is digest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_AgreementSync_Func_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        for (let algName of negotiateAlgSyncUtils.DH_SPEC) {
          let keyAlgName: string = algName;
          if (algName === "DH") {
            keyAlgName = "DH_modp2048";
          }
          let keyPair_A: cryptoFramework.KeyPair = await negotiateAlgSyncUtils.generateKey(keyAlgName);
          let keyPair_B: cryptoFramework.KeyPair = await negotiateAlgSyncUtils.generateKey(keyAlgName);
          let secret_A: cryptoFramework.DataBlob = negotiateAlgSyncUtils.eccKeyAgreement(algName, keyPair_A.pubKey, keyPair_B.priKey);
          let secret_B: cryptoFramework.DataBlob = negotiateAlgSyncUtils.eccKeyAgreement(algName, keyPair_B.pubKey, keyPair_A.priKey);
          let ret: boolean = commonUtils.compareDataBlob(secret_A, secret_B);
          expect(ret).assertTrue();
        }
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_AgreementSync_Func_0400
     * @tc.number SUB_Security_CryptoFramework_AgreementSync_Func_0400
     * @tc.desc   algorithm is digest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_AgreementSync_Func_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "SM2_256";
        let keyPair_A: cryptoFramework.KeyPair = await negotiateAlgSyncUtils.generateKey(algName);
        let keyPair_B: cryptoFramework.KeyPair = await negotiateAlgSyncUtils.generateKey(algName);
        negotiateAlgSyncUtils.eccKeyAgreement(algName, keyPair_A.pubKey, keyPair_B.priKey);
        expect(null).assertFail();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect((error as BusinessError).code).assertEqual(801);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_AgreementSync_Func_0500
     * @tc.number SUB_Security_CryptoFramework_AgreementSync_Func_0500
     * @tc.desc   algorithm is digest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_AgreementSync_Func_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let keyAlgName_A: string = "DH_modp1536";
      let keyAlgName_B: string = "DH_modp2048";
      let keyPair_A: cryptoFramework.KeyPair = await negotiateAlgSyncUtils.generateKey(keyAlgName_A);
      let keyPair_B: cryptoFramework.KeyPair = await negotiateAlgSyncUtils.generateKey(keyAlgName_B);
      try {
        negotiateAlgSyncUtils.eccKeyAgreement(keyAlgName_B, keyPair_A.pubKey, keyPair_B.priKey);
        expect(null).assertFail();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect((error as BusinessError).code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_AgreementSync_Func_0600
     * @tc.number SUB_Security_CryptoFramework_AgreementSync_Func_0600
     * @tc.desc   algorithm is digest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_AgreementSync_Func_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let keyAlgName_A: string = "ECC224";
      let keyAlgName_B: string = "ECC256";
      let keyPair_A: cryptoFramework.KeyPair = await negotiateAlgSyncUtils.generateKey(keyAlgName_A);
      let keyPair_B: cryptoFramework.KeyPair = await negotiateAlgSyncUtils.generateKey(keyAlgName_B);
      try {
        negotiateAlgSyncUtils.eccKeyAgreement(keyAlgName_B, keyPair_A.pubKey, keyPair_B.priKey);
        expect(null).assertFail();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect((error as BusinessError).code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_AgreementSync_Func_0700
     * @tc.number SUB_Security_CryptoFramework_AgreementSync_Func_0700
     * @tc.desc   algorithm is agreeAlg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_AgreementSync_Func_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let keyAlgName_A: string = "ECC521";
      let keyAlgName_B: string = "ECC384";
      let keyPair_A: cryptoFramework.KeyPair = await negotiateAlgSyncUtils.generateKey(keyAlgName_A);
      let keyPair_B: cryptoFramework.KeyPair = await negotiateAlgSyncUtils.generateKey(keyAlgName_B);
      try {
        negotiateAlgSyncUtils.eccKeyAgreement(keyAlgName_B, keyPair_A.pubKey, keyPair_B.priKey);
        expect(null).assertFail();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect((error as BusinessError).code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_AgreementSync_Func_0800
     * @tc.number SUB_Security_CryptoFramework_AgreementSync_Func_0800
     * @tc.desc   algorithm is agreeAlg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_AgreementSync_Func_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let keyAlgName: string = "ECC521";
      let keyAlgName_B: string = "DH_modp2048";
      let keyPair_A: cryptoFramework.KeyPair = await negotiateAlgSyncUtils.generateKey(keyAlgName);
      let keyPair_B: cryptoFramework.KeyPair = await negotiateAlgSyncUtils.generateKey(keyAlgName);
      try {
        negotiateAlgSyncUtils.eccKeyAgreement(keyAlgName_B, keyPair_A.pubKey, keyPair_B.priKey);
        expect(null).assertFail();
      } catch (error) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect((error as BusinessError).code).assertEqual(401);
      }
      done();
    });


  });
}