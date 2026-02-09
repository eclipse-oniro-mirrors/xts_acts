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
import * as pkcs1topkcs8 from './utils/pkcs1Topkcs8/pkcs1topkcs8';
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let testAbilityContext:common.UIAbilityContext;


export default function SecurityCryptoFwPkcs1ToPkcs8TestUnit() {
  describe("SecurityCryptoFwPkcs1ToPkcs8TestUnit", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');
    
    /**
     * @tc.name   SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0001
     * @tc.number SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0001
     * @tc.desc   algorithm is RSA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let priString  = "";
      try {
        priString  = await pkcs1topkcs8.doPrivatePkcs1ToPkcs8ByPromise('RSA512', pkcs1topkcs8.priKeyPkcs1Str512);
        expect(priString).assertEqual(pkcs1topkcs8.priKeyPkcs8Str512);
      } catch (error: BusinessError) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        priString  = await pkcs1topkcs8.doPrivatePkcs1ToPkcs8ByPromise('RSA768', pkcs1topkcs8.priKeyPkcs1Str768);
        expect(priString).assertEqual(pkcs1topkcs8.priKeyPkcs8Str768);
      } catch (error: BusinessError) {
        console.error(`RSA768 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        priString  = await pkcs1topkcs8.doPrivatePkcs1ToPkcs8ByPromise('RSA1024', pkcs1topkcs8.priKeyPkcs1Str1024);
        expect(priString).assertEqual(pkcs1topkcs8.priKeyPkcs8Str1024);
      } catch (error: BusinessError) {
        console.error(`RSA1024 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        priString  = await pkcs1topkcs8.doPrivatePkcs1ToPkcs8ByPromise('RSA2048', pkcs1topkcs8.priKeyPkcs1Str2048);
        expect(priString).assertEqual(pkcs1topkcs8.priKeyPkcs8Str2048);
      } catch (error: BusinessError) {
        console.error(`RSA2048 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        priString  = await pkcs1topkcs8.doPrivatePkcs1ToPkcs8ByPromise('RSA3072', pkcs1topkcs8.priKeyPkcs1Str3072);
        expect(priString).assertEqual(pkcs1topkcs8.priKeyPkcs8Str3072);
      } catch (error: BusinessError) {
        console.error(`RSA3072 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        priString  = await pkcs1topkcs8.doPrivatePkcs1ToPkcs8ByPromise('RSA4096', pkcs1topkcs8.priKeyPkcs1Str4096);
        expect(priString).assertEqual(pkcs1topkcs8.priKeyPkcs8Str4096);
      } catch (error: BusinessError) {
        console.error(`RSA4096 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        priString  = await pkcs1topkcs8.doPrivatePkcs1ToPkcs8ByPromise('RSA8192', pkcs1topkcs8.priKeyPkcs1Str8192);
        expect(priString).assertEqual(pkcs1topkcs8.priKeyPkcs8Str8192);
      } catch (error: BusinessError) {
        console.error(`RSA8192 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0002
     * @tc.number SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0002
     * @tc.desc   algorithm is RSA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let priString  = "";
      try {
        priString  = pkcs1topkcs8.doPrivatePkcs1ToPkcs8BySync('RSA512', pkcs1topkcs8.priKeyPkcs1Str512);
        expect(priString).assertEqual(pkcs1topkcs8.priKeyPkcs8Str512);
      } catch (error: BusinessError) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        priString  = pkcs1topkcs8.doPrivatePkcs1ToPkcs8BySync('RSA768', pkcs1topkcs8.priKeyPkcs1Str768);
        expect(priString).assertEqual(pkcs1topkcs8.priKeyPkcs8Str768);
      } catch (error: BusinessError) {
        console.error(`RSA768 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        priString  = pkcs1topkcs8.doPrivatePkcs1ToPkcs8BySync('RSA1024', pkcs1topkcs8.priKeyPkcs1Str1024);
        expect(priString).assertEqual(pkcs1topkcs8.priKeyPkcs8Str1024);
      } catch (error: BusinessError) {
        console.error(`RSA1024 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        priString  = pkcs1topkcs8.doPrivatePkcs1ToPkcs8BySync('RSA2048', pkcs1topkcs8.priKeyPkcs1Str2048);
        expect(priString).assertEqual(pkcs1topkcs8.priKeyPkcs8Str2048);
      } catch (error: BusinessError) {
        console.error(`RSA2048 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        priString  = pkcs1topkcs8.doPrivatePkcs1ToPkcs8BySync('RSA3072', pkcs1topkcs8.priKeyPkcs1Str3072);
        expect(priString).assertEqual(pkcs1topkcs8.priKeyPkcs8Str3072);
      } catch (error: BusinessError) {
        console.error(`RSA3072 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        priString  = pkcs1topkcs8.doPrivatePkcs1ToPkcs8BySync('RSA4096', pkcs1topkcs8.priKeyPkcs1Str4096);
        expect(priString).assertEqual(pkcs1topkcs8.priKeyPkcs8Str4096);
      } catch (error: BusinessError) {
        console.error(`RSA4096 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        priString  = pkcs1topkcs8.doPrivatePkcs1ToPkcs8BySync('RSA8192', pkcs1topkcs8.priKeyPkcs1Str8192);
        expect(priString).assertEqual(pkcs1topkcs8.priKeyPkcs8Str8192);
      } catch (error: BusinessError) {
        console.error(`RSA8192 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0003
     * @tc.number SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0003
     * @tc.desc   algorithm is RSA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let priString  = "";
      try {
        priString  = await pkcs1topkcs8.doPrivatePkcs8ToPkcs1ByPromise('RSA512', pkcs1topkcs8.priKeyPkcs8Str512);
        expect(priString).assertEqual(pkcs1topkcs8.priKeyPkcs1Str512);
      } catch (error: BusinessError) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        priString  = await pkcs1topkcs8.doPrivatePkcs8ToPkcs1ByPromise('RSA768', pkcs1topkcs8.priKeyPkcs8Str768);
        expect(priString).assertEqual(pkcs1topkcs8.priKeyPkcs1Str768);
      } catch (error: BusinessError) {
        console.error(`RSA768 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        priString  = await pkcs1topkcs8.doPrivatePkcs8ToPkcs1ByPromise('RSA1024', pkcs1topkcs8.priKeyPkcs8Str1024);
        expect(priString).assertEqual(pkcs1topkcs8.priKeyPkcs1Str1024);
      } catch (error: BusinessError) {
        console.error(`RSA1024 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        priString  = await pkcs1topkcs8.doPrivatePkcs8ToPkcs1ByPromise('RSA2048', pkcs1topkcs8.priKeyPkcs8Str2048);
        expect(priString).assertEqual(pkcs1topkcs8.priKeyPkcs1Str2048);
      } catch (error: BusinessError) {
        console.error(`RSA2048 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        priString  = await pkcs1topkcs8.doPrivatePkcs8ToPkcs1ByPromise('RSA3072', pkcs1topkcs8.priKeyPkcs8Str3072);
        expect(priString).assertEqual(pkcs1topkcs8.priKeyPkcs1Str3072);
      } catch (error: BusinessError) {
        console.error(`RSA3072 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        priString  = await pkcs1topkcs8.doPrivatePkcs8ToPkcs1ByPromise('RSA4096', pkcs1topkcs8.priKeyPkcs8Str4096);
        expect(priString).assertEqual(pkcs1topkcs8.priKeyPkcs1Str4096);
      } catch (error: BusinessError) {
        console.error(`RSA4096 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        priString  = await pkcs1topkcs8.doPrivatePkcs8ToPkcs1ByPromise('RSA8192', pkcs1topkcs8.priKeyPkcs8Str8192);
        expect(priString).assertEqual(pkcs1topkcs8.priKeyPkcs1Str8192);
      } catch (error: BusinessError) {
        console.error(`RSA8192 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0004
     * @tc.number SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0004
     * @tc.desc   algorithm is RSA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let priString  = "";
      try {
        priString  = pkcs1topkcs8.doPrivatePkcs8ToPkcs1BySync('RSA512', pkcs1topkcs8.priKeyPkcs8Str512);
        expect(priString).assertEqual(pkcs1topkcs8.priKeyPkcs1Str512);
      } catch (error: BusinessError) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        priString  = pkcs1topkcs8.doPrivatePkcs8ToPkcs1BySync('RSA768', pkcs1topkcs8.priKeyPkcs8Str768);
        expect(priString).assertEqual(pkcs1topkcs8.priKeyPkcs1Str768);
      } catch (error: BusinessError) {
        console.error(`RSA768 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        priString  = pkcs1topkcs8.doPrivatePkcs8ToPkcs1BySync('RSA1024', pkcs1topkcs8.priKeyPkcs8Str1024);
        expect(priString).assertEqual(pkcs1topkcs8.priKeyPkcs1Str1024);
      } catch (error: BusinessError) {
        console.error(`RSA1024 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        priString  = pkcs1topkcs8.doPrivatePkcs8ToPkcs1BySync('RSA2048', pkcs1topkcs8.priKeyPkcs8Str2048);
        expect(priString).assertEqual(pkcs1topkcs8.priKeyPkcs1Str2048);
      } catch (error: BusinessError) {
        console.error(`RSA2048 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        priString  = pkcs1topkcs8.doPrivatePkcs8ToPkcs1BySync('RSA3072', pkcs1topkcs8.priKeyPkcs8Str3072);
        expect(priString).assertEqual(pkcs1topkcs8.priKeyPkcs1Str3072);
      } catch (error: BusinessError) {
        console.error(`RSA3072 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        priString  = pkcs1topkcs8.doPrivatePkcs8ToPkcs1BySync('RSA4096', pkcs1topkcs8.priKeyPkcs8Str4096);
        expect(priString).assertEqual(pkcs1topkcs8.priKeyPkcs1Str4096);
      } catch (error: BusinessError) {
        console.error(`RSA4096 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        priString  = pkcs1topkcs8.doPrivatePkcs8ToPkcs1BySync('RSA8192', pkcs1topkcs8.priKeyPkcs8Str8192);
        expect(priString).assertEqual(pkcs1topkcs8.priKeyPkcs1Str8192);
      } catch (error: BusinessError) {
        console.error(`RSA8192 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0005
     * @tc.number SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0005
     * @tc.desc   algorithm is RSA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let pubString  = "";
      try {
        pubString  = await pkcs1topkcs8.doPublicPkcs1ToX509ByPromise('RSA512', pkcs1topkcs8.pubKeyPkcs1Str512);
        expect(pubString).assertEqual(pkcs1topkcs8.pubKeyX509Str512);
      } catch (error: BusinessError) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        pubString  = await pkcs1topkcs8.doPublicPkcs1ToX509ByPromise('RSA768', pkcs1topkcs8.pubKeyPkcs1Str768);
        expect(pubString).assertEqual(pkcs1topkcs8.pubKeyX509Str768);
      } catch (error: BusinessError) {
        console.error(`RSA768 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        pubString  = await pkcs1topkcs8.doPublicPkcs1ToX509ByPromise('RSA1024', pkcs1topkcs8.pubKeyPkcs1Str1024);
        expect(pubString).assertEqual(pkcs1topkcs8.pubKeyX509Str1024);
      } catch (error: BusinessError) {
        console.error(`RSA1024 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        pubString  = await pkcs1topkcs8.doPublicPkcs1ToX509ByPromise('RSA2048', pkcs1topkcs8.pubKeyPkcs1Str2048);
        expect(pubString).assertEqual(pkcs1topkcs8.pubKeyX509Str2048);
      } catch (error: BusinessError) {
        console.error(`RSA2048 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        pubString  = await pkcs1topkcs8.doPublicPkcs1ToX509ByPromise('RSA3072', pkcs1topkcs8.pubKeyPkcs1Str3072);
        expect(pubString).assertEqual(pkcs1topkcs8.pubKeyX509Str3072);
      } catch (error: BusinessError) {
        console.error(`RSA3072 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        pubString  = await pkcs1topkcs8.doPublicPkcs1ToX509ByPromise('RSA4096', pkcs1topkcs8.pubKeyPkcs1Str4096);
        expect(pubString).assertEqual(pkcs1topkcs8.pubKeyX509Str4096);
      } catch (error: BusinessError) {
        console.error(`RSA4096 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        pubString  = await pkcs1topkcs8.doPublicPkcs1ToX509ByPromise('RSA8192', pkcs1topkcs8.pubKeyPkcs1Str8192);
        expect(pubString).assertEqual(pkcs1topkcs8.pubKeyX509Str8192);
      } catch (error: BusinessError) {
        console.error(`RSA8192 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0006
     * @tc.number SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0006
     * @tc.desc   algorithm is RSA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let pubString  = "";
      try {
        pubString  = pkcs1topkcs8.doPublicPkcs1ToX509BySync('RSA512', pkcs1topkcs8.pubKeyPkcs1Str512);
        expect(pubString).assertEqual(pkcs1topkcs8.pubKeyX509Str512);
      } catch (error: BusinessError) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        pubString  = pkcs1topkcs8.doPublicPkcs1ToX509BySync('RSA768', pkcs1topkcs8.pubKeyPkcs1Str768);
        expect(pubString).assertEqual(pkcs1topkcs8.pubKeyX509Str768);
      } catch (error: BusinessError) {
        console.error(`RSA768 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        pubString  = pkcs1topkcs8.doPublicPkcs1ToX509BySync('RSA1024', pkcs1topkcs8.pubKeyPkcs1Str1024);
        expect(pubString).assertEqual(pkcs1topkcs8.pubKeyX509Str1024);
      } catch (error: BusinessError) {
        console.error(`RSA1024 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        pubString  = pkcs1topkcs8.doPublicPkcs1ToX509BySync('RSA2048', pkcs1topkcs8.pubKeyPkcs1Str2048);
        expect(pubString).assertEqual(pkcs1topkcs8.pubKeyX509Str2048);
      } catch (error: BusinessError) {
        console.error(`RSA2048 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        pubString  = pkcs1topkcs8.doPublicPkcs1ToX509BySync('RSA3072', pkcs1topkcs8.pubKeyPkcs1Str3072);
        expect(pubString).assertEqual(pkcs1topkcs8.pubKeyX509Str3072);
      } catch (error: BusinessError) {
        console.error(`RSA3072 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        pubString  = pkcs1topkcs8.doPublicPkcs1ToX509BySync('RSA4096', pkcs1topkcs8.pubKeyPkcs1Str4096);
        expect(pubString).assertEqual(pkcs1topkcs8.pubKeyX509Str4096);
      } catch (error: BusinessError) {
        console.error(`RSA4096 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        pubString  = pkcs1topkcs8.doPublicPkcs1ToX509BySync('RSA8192', pkcs1topkcs8.pubKeyPkcs1Str8192);
        expect(pubString).assertEqual(pkcs1topkcs8.pubKeyX509Str8192);
      } catch (error: BusinessError) {
        console.error(`RSA8192 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0007
     * @tc.number SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0007
     * @tc.desc   algorithm is RSA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let pubString  = "";
      try {
        pubString  = await pkcs1topkcs8.doPublicX509ToPkcs1ByPromise('RSA512', pkcs1topkcs8.pubKeyX509Str512);
        expect(pubString).assertEqual(pkcs1topkcs8.pubKeyPkcs1Str512);
      } catch (error: BusinessError) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        pubString  = await pkcs1topkcs8.doPublicX509ToPkcs1ByPromise('RSA768', pkcs1topkcs8.pubKeyX509Str768);
        expect(pubString).assertEqual(pkcs1topkcs8.pubKeyPkcs1Str768);
      } catch (error: BusinessError) {
        console.error(`RSA768 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        pubString  = await pkcs1topkcs8.doPublicX509ToPkcs1ByPromise('RSA1024', pkcs1topkcs8.pubKeyX509Str1024);
        expect(pubString).assertEqual(pkcs1topkcs8.pubKeyPkcs1Str1024);
      } catch (error: BusinessError) {
        console.error(`RSA1024 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        pubString  = await pkcs1topkcs8.doPublicX509ToPkcs1ByPromise('RSA2048', pkcs1topkcs8.pubKeyX509Str2048);
        expect(pubString).assertEqual(pkcs1topkcs8.pubKeyPkcs1Str2048);
      } catch (error: BusinessError) {
        console.error(`RSA2048 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        pubString  = await pkcs1topkcs8.doPublicX509ToPkcs1ByPromise('RSA3072', pkcs1topkcs8.pubKeyX509Str3072);
        expect(pubString).assertEqual(pkcs1topkcs8.pubKeyPkcs1Str3072);
      } catch (error: BusinessError) {
        console.error(`RSA3072 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        pubString  = await pkcs1topkcs8.doPublicX509ToPkcs1ByPromise('RSA4096', pkcs1topkcs8.pubKeyX509Str4096);
        expect(pubString).assertEqual(pkcs1topkcs8.pubKeyPkcs1Str4096);
      } catch (error: BusinessError) {
        console.error(`RSA4096 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        pubString  = await pkcs1topkcs8.doPublicX509ToPkcs1ByPromise('RSA8192', pkcs1topkcs8.pubKeyX509Str8192);
        expect(pubString).assertEqual(pkcs1topkcs8.pubKeyPkcs1Str8192);
      } catch (error: BusinessError) {
        console.error(`RSA8192 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0008
     * @tc.number SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0008
     * @tc.desc   algorithm is RSA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let pubString  = "";
      try {
        pubString  = pkcs1topkcs8.doPublicX509ToPkcs1BySync('RSA512', pkcs1topkcs8.pubKeyX509Str512);
        expect(pubString).assertEqual(pkcs1topkcs8.pubKeyPkcs1Str512);
      } catch (error: BusinessError) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        pubString  = pkcs1topkcs8.doPublicX509ToPkcs1BySync('RSA768', pkcs1topkcs8.pubKeyX509Str768);
        expect(pubString).assertEqual(pkcs1topkcs8.pubKeyPkcs1Str768);
      } catch (error: BusinessError) {
        console.error(`RSA768 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        pubString  = pkcs1topkcs8.doPublicX509ToPkcs1BySync('RSA1024', pkcs1topkcs8.pubKeyX509Str1024);
        expect(pubString).assertEqual(pkcs1topkcs8.pubKeyPkcs1Str1024);
      } catch (error: BusinessError) {
        console.error(`RSA1024 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        pubString  = pkcs1topkcs8.doPublicX509ToPkcs1BySync('RSA2048', pkcs1topkcs8.pubKeyX509Str2048);
        expect(pubString).assertEqual(pkcs1topkcs8.pubKeyPkcs1Str2048);
      } catch (error: BusinessError) {
        console.error(`RSA2048 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        pubString  = pkcs1topkcs8.doPublicX509ToPkcs1BySync('RSA3072', pkcs1topkcs8.pubKeyX509Str3072);
        expect(pubString).assertEqual(pkcs1topkcs8.pubKeyPkcs1Str3072);
      } catch (error: BusinessError) {
        console.error(`RSA3072 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        pubString  = pkcs1topkcs8.doPublicX509ToPkcs1BySync('RSA4096', pkcs1topkcs8.pubKeyX509Str4096);
        expect(pubString).assertEqual(pkcs1topkcs8.pubKeyPkcs1Str4096);
      } catch (error: BusinessError) {
        console.error(`RSA4096 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        pubString  = pkcs1topkcs8.doPublicX509ToPkcs1BySync('RSA8192', pkcs1topkcs8.pubKeyX509Str8192);
        expect(pubString).assertEqual(pkcs1topkcs8.pubKeyPkcs1Str8192);
      } catch (error: BusinessError) {
        console.error(`RSA8192 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0009
     * @tc.number SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0009
     * @tc.desc   algorithm is RSA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let keyPair: cryptoFramework.KeyPair;
      let pubstring  = "";
      let pristring  = "";
      try {
        keyPair  = await pkcs1topkcs8.doConvertPemKeyByPromise('RSA512', pkcs1topkcs8.pubKeyPkcs1Str512, pkcs1topkcs8.priKeyPkcs1Str512);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemX509(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyX509Str512);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs8(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs8Str512);
      } catch (error: BusinessError) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  = await pkcs1topkcs8.doConvertPemKeyByPromise('RSA768', pkcs1topkcs8.pubKeyPkcs1Str768, pkcs1topkcs8.priKeyPkcs1Str768);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemX509(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyX509Str768);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs8(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs8Str768);
      } catch (error: BusinessError) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  = await pkcs1topkcs8.doConvertPemKeyByPromise('RSA1024', pkcs1topkcs8.pubKeyPkcs1Str1024, pkcs1topkcs8.priKeyPkcs1Str1024);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemX509(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyX509Str1024);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs8(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs8Str1024);
      } catch (error: BusinessError) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  = await pkcs1topkcs8.doConvertPemKeyByPromise('RSA2048', pkcs1topkcs8.pubKeyPkcs1Str2048, pkcs1topkcs8.priKeyPkcs1Str2048);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemX509(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyX509Str2048);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs8(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs8Str2048);
      } catch (error: BusinessError) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  = await pkcs1topkcs8.doConvertPemKeyByPromise('RSA3072', pkcs1topkcs8.pubKeyPkcs1Str3072, pkcs1topkcs8.priKeyPkcs1Str3072);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemX509(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyX509Str3072);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs8(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs8Str3072);
      } catch (error: BusinessError) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  = await pkcs1topkcs8.doConvertPemKeyByPromise('RSA4096', pkcs1topkcs8.pubKeyPkcs1Str4096, pkcs1topkcs8.priKeyPkcs1Str4096);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemX509(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyX509Str4096);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs8(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs8Str4096);
      } catch (error: BusinessError) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  = await pkcs1topkcs8.doConvertPemKeyByPromise('RSA8192', pkcs1topkcs8.pubKeyPkcs1Str8192, pkcs1topkcs8.priKeyPkcs1Str8192);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemX509(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyX509Str8192);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs8(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs8Str8192);
      } catch (error: BusinessError) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0010
     * @tc.number SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0010
     * @tc.desc   algorithm is RSA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let keyPair: cryptoFramework.KeyPair;
      let pubstring  = "";
      let pristring  = "";
      try {
        keyPair  = pkcs1topkcs8.doConvertPemKeyBySync('RSA512', pkcs1topkcs8.pubKeyPkcs1Str512, pkcs1topkcs8.priKeyPkcs1Str512);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemX509(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyX509Str512);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs8(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs8Str512);
      } catch (error: BusinessError) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  = pkcs1topkcs8.doConvertPemKeyBySync('RSA768', pkcs1topkcs8.pubKeyPkcs1Str768, pkcs1topkcs8.priKeyPkcs1Str768);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemX509(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyX509Str768);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs8(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs8Str768);
      } catch (error: BusinessError) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  = pkcs1topkcs8.doConvertPemKeyBySync('RSA1024', pkcs1topkcs8.pubKeyPkcs1Str1024, pkcs1topkcs8.priKeyPkcs1Str1024);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemX509(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyX509Str1024);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs8(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs8Str1024);
      } catch (error: BusinessError) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  = pkcs1topkcs8.doConvertPemKeyBySync('RSA2048', pkcs1topkcs8.pubKeyPkcs1Str2048, pkcs1topkcs8.priKeyPkcs1Str2048);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemX509(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyX509Str2048);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs8(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs8Str2048);
      } catch (error: BusinessError) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  = pkcs1topkcs8.doConvertPemKeyBySync('RSA3072', pkcs1topkcs8.pubKeyPkcs1Str3072, pkcs1topkcs8.priKeyPkcs1Str3072);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemX509(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyX509Str3072);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs8(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs8Str3072);
      } catch (error: BusinessError) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  = pkcs1topkcs8.doConvertPemKeyBySync('RSA4096', pkcs1topkcs8.pubKeyPkcs1Str4096, pkcs1topkcs8.priKeyPkcs1Str4096);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemX509(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyX509Str4096);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs8(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs8Str4096);
      } catch (error: BusinessError) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  = pkcs1topkcs8.doConvertPemKeyBySync('RSA8192', pkcs1topkcs8.pubKeyPkcs1Str8192, pkcs1topkcs8.priKeyPkcs1Str8192);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemX509(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyX509Str8192);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs8(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs8Str8192);
      } catch (error: BusinessError) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0011
     * @tc.number SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0011
     * @tc.desc   algorithm is RSA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let keyPair: cryptoFramework.KeyPair;
      let pubstring  = "";
      let pristring  = "";
      try {
        keyPair  = await pkcs1topkcs8.doConvertPemKeyByPromise('RSA512', pkcs1topkcs8.pubKeyPkcs1Str512, pkcs1topkcs8.priKeyPkcs8Str512);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemX509(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyX509Str512);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs1(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs1Str512);
      } catch (error: BusinessError) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  = await pkcs1topkcs8.doConvertPemKeyByPromise('RSA768', pkcs1topkcs8.pubKeyPkcs1Str768, pkcs1topkcs8.priKeyPkcs8Str768);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemX509(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyX509Str768);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs1(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs1Str768);
      } catch (error: BusinessError) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  = await pkcs1topkcs8.doConvertPemKeyByPromise('RSA1024', pkcs1topkcs8.pubKeyPkcs1Str1024, pkcs1topkcs8.priKeyPkcs8Str1024);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemX509(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyX509Str1024);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs1(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs1Str1024);
      } catch (error: BusinessError) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  = await pkcs1topkcs8.doConvertPemKeyByPromise('RSA2048', pkcs1topkcs8.pubKeyPkcs1Str2048, pkcs1topkcs8.priKeyPkcs8Str2048);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemX509(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyX509Str2048);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs1(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs1Str2048);
      } catch (error: BusinessError) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  = await pkcs1topkcs8.doConvertPemKeyByPromise('RSA3072', pkcs1topkcs8.pubKeyPkcs1Str3072, pkcs1topkcs8.priKeyPkcs8Str3072);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemX509(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyX509Str3072);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs1(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs1Str3072);
      } catch (error: BusinessError) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  = await pkcs1topkcs8.doConvertPemKeyByPromise('RSA4096', pkcs1topkcs8.pubKeyPkcs1Str4096, pkcs1topkcs8.priKeyPkcs8Str4096);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemX509(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyX509Str4096);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs1(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs1Str4096);
      } catch (error: BusinessError) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  = await pkcs1topkcs8.doConvertPemKeyByPromise('RSA8192', pkcs1topkcs8.pubKeyPkcs1Str8192, pkcs1topkcs8.priKeyPkcs8Str8192);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemX509(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyX509Str8192);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs1(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs1Str8192);
      } catch (error: BusinessError) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0012
     * @tc.number SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0012
     * @tc.desc   algorithm is RSA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let keyPair: cryptoFramework.KeyPair;
      let pubstring  = "";
      let pristring  = "";
      try {
        keyPair  =  pkcs1topkcs8.doConvertPemKeyBySync('RSA512', pkcs1topkcs8.pubKeyPkcs1Str512, pkcs1topkcs8.priKeyPkcs8Str512);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemX509(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyX509Str512);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs1(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs1Str512);
      } catch (error: BusinessError) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  =  pkcs1topkcs8.doConvertPemKeyBySync('RSA768', pkcs1topkcs8.pubKeyPkcs1Str768, pkcs1topkcs8.priKeyPkcs8Str768);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemX509(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyX509Str768);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs1(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs1Str768);
      } catch (error: BusinessError) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  =  pkcs1topkcs8.doConvertPemKeyBySync('RSA1024', pkcs1topkcs8.pubKeyPkcs1Str1024, pkcs1topkcs8.priKeyPkcs8Str1024);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemX509(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyX509Str1024);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs1(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs1Str1024);
      } catch (error: BusinessError) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  =  pkcs1topkcs8.doConvertPemKeyBySync('RSA2048', pkcs1topkcs8.pubKeyPkcs1Str2048, pkcs1topkcs8.priKeyPkcs8Str2048);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemX509(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyX509Str2048);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs1(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs1Str2048);
      } catch (error: BusinessError) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  =  pkcs1topkcs8.doConvertPemKeyBySync('RSA3072', pkcs1topkcs8.pubKeyPkcs1Str3072, pkcs1topkcs8.priKeyPkcs8Str3072);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemX509(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyX509Str3072);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs1(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs1Str3072);
      } catch (error: BusinessError) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  =  pkcs1topkcs8.doConvertPemKeyBySync('RSA4096', pkcs1topkcs8.pubKeyPkcs1Str4096, pkcs1topkcs8.priKeyPkcs8Str4096);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemX509(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyX509Str4096);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs1(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs1Str4096);
      } catch (error: BusinessError) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  =  pkcs1topkcs8.doConvertPemKeyBySync('RSA8192', pkcs1topkcs8.pubKeyPkcs1Str8192, pkcs1topkcs8.priKeyPkcs8Str8192);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemX509(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyX509Str8192);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs1(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs1Str8192);
      } catch (error: BusinessError) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0013
     * @tc.number SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0013
     * @tc.desc   algorithm is RSA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let keyPair: cryptoFramework.KeyPair;
      let pubstring  = "";
      let pristring  = "";
      try {
        keyPair  = await pkcs1topkcs8.doConvertPemKeyByPromise('RSA512', pkcs1topkcs8.pubKeyX509Str512, pkcs1topkcs8.priKeyPkcs1Str512);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemPkcs1(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyPkcs1Str512);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs8(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs8Str512);
      } catch (error: BusinessError) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  = await pkcs1topkcs8.doConvertPemKeyByPromise('RSA768', pkcs1topkcs8.pubKeyX509Str768, pkcs1topkcs8.priKeyPkcs1Str768);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemPkcs1(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyPkcs1Str768);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs8(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs8Str768);
      } catch (error: BusinessError) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  = await pkcs1topkcs8.doConvertPemKeyByPromise('RSA1024', pkcs1topkcs8.pubKeyX509Str1024, pkcs1topkcs8.priKeyPkcs1Str1024);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemPkcs1(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyPkcs1Str1024);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs8(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs8Str1024);
      } catch (error: BusinessError) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  = await pkcs1topkcs8.doConvertPemKeyByPromise('RSA2048', pkcs1topkcs8.pubKeyX509Str2048, pkcs1topkcs8.priKeyPkcs1Str2048);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemPkcs1(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyPkcs1Str2048);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs8(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs8Str2048);
      } catch (error: BusinessError) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  = await pkcs1topkcs8.doConvertPemKeyByPromise('RSA3072', pkcs1topkcs8.pubKeyX509Str3072, pkcs1topkcs8.priKeyPkcs1Str3072);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemPkcs1(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyPkcs1Str3072);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs8(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs8Str3072);
      } catch (error: BusinessError) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  = await pkcs1topkcs8.doConvertPemKeyByPromise('RSA4096', pkcs1topkcs8.pubKeyX509Str4096, pkcs1topkcs8.priKeyPkcs1Str4096);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemPkcs1(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyPkcs1Str4096);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs8(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs8Str4096);
      } catch (error: BusinessError) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  = await pkcs1topkcs8.doConvertPemKeyByPromise('RSA8192', pkcs1topkcs8.pubKeyX509Str8192, pkcs1topkcs8.priKeyPkcs1Str8192);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemPkcs1(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyPkcs1Str8192);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs8(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs8Str8192);
      } catch (error: BusinessError) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0014
     * @tc.number SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0014
     * @tc.desc   algorithm is RSA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let keyPair: cryptoFramework.KeyPair;
      let pubstring  = "";
      let pristring  = "";
      try {
        keyPair  =  pkcs1topkcs8.doConvertPemKeyBySync('RSA512', pkcs1topkcs8.pubKeyX509Str512, pkcs1topkcs8.priKeyPkcs1Str512);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemPkcs1(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyPkcs1Str512);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs8(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs8Str512);
      } catch (error: BusinessError) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  =  pkcs1topkcs8.doConvertPemKeyBySync('RSA768', pkcs1topkcs8.pubKeyX509Str768, pkcs1topkcs8.priKeyPkcs1Str768);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemPkcs1(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyPkcs1Str768);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs8(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs8Str768);
      } catch (error: BusinessError) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  =  pkcs1topkcs8.doConvertPemKeyBySync('RSA1024', pkcs1topkcs8.pubKeyX509Str1024, pkcs1topkcs8.priKeyPkcs1Str1024);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemPkcs1(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyPkcs1Str1024);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs8(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs8Str1024);
      } catch (error: BusinessError) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  =  pkcs1topkcs8.doConvertPemKeyBySync('RSA2048', pkcs1topkcs8.pubKeyX509Str2048, pkcs1topkcs8.priKeyPkcs1Str2048);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemPkcs1(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyPkcs1Str2048);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs8(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs8Str2048);
      } catch (error: BusinessError) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  =  pkcs1topkcs8.doConvertPemKeyBySync('RSA3072', pkcs1topkcs8.pubKeyX509Str3072, pkcs1topkcs8.priKeyPkcs1Str3072);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemPkcs1(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyPkcs1Str3072);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs8(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs8Str3072);
      } catch (error: BusinessError) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  =  pkcs1topkcs8.doConvertPemKeyBySync('RSA4096', pkcs1topkcs8.pubKeyX509Str4096, pkcs1topkcs8.priKeyPkcs1Str4096);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemPkcs1(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyPkcs1Str4096);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs8(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs8Str4096);
      } catch (error: BusinessError) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  =  pkcs1topkcs8.doConvertPemKeyBySync('RSA8192', pkcs1topkcs8.pubKeyX509Str8192, pkcs1topkcs8.priKeyPkcs1Str8192);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemPkcs1(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyPkcs1Str8192);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs8(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs8Str8192);
      } catch (error: BusinessError) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0015
     * @tc.number SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0015
     * @tc.desc   algorithm is RSA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let keyPair: cryptoFramework.KeyPair;
      let pubstring  = "";
      let pristring  = "";
      try {
        keyPair  = await pkcs1topkcs8.doConvertPemKeyByPromise('RSA512', pkcs1topkcs8.pubKeyX509Str512, pkcs1topkcs8.priKeyPkcs8Str512);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemPkcs1(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyPkcs1Str512);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs1(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs1Str512);
      } catch (error: BusinessError) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  = await pkcs1topkcs8.doConvertPemKeyByPromise('RSA768', pkcs1topkcs8.pubKeyX509Str768, pkcs1topkcs8.priKeyPkcs8Str768);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemPkcs1(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyPkcs1Str768);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs1(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs1Str768);
      } catch (error: BusinessError) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  = await pkcs1topkcs8.doConvertPemKeyByPromise('RSA1024', pkcs1topkcs8.pubKeyX509Str1024, pkcs1topkcs8.priKeyPkcs8Str1024);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemPkcs1(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyPkcs1Str1024);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs1(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs1Str1024);
      } catch (error: BusinessError) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  = await pkcs1topkcs8.doConvertPemKeyByPromise('RSA2048', pkcs1topkcs8.pubKeyX509Str2048, pkcs1topkcs8.priKeyPkcs8Str2048);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemPkcs1(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyPkcs1Str2048);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs1(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs1Str2048);
      } catch (error: BusinessError) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  = await pkcs1topkcs8.doConvertPemKeyByPromise('RSA3072', pkcs1topkcs8.pubKeyX509Str3072, pkcs1topkcs8.priKeyPkcs8Str3072);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemPkcs1(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyPkcs1Str3072);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs1(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs1Str3072);
      } catch (error: BusinessError) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  = await pkcs1topkcs8.doConvertPemKeyByPromise('RSA4096', pkcs1topkcs8.pubKeyX509Str4096, pkcs1topkcs8.priKeyPkcs8Str4096);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemPkcs1(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyPkcs1Str4096);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs1(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs1Str4096);
      } catch (error: BusinessError) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  = await pkcs1topkcs8.doConvertPemKeyByPromise('RSA8192', pkcs1topkcs8.pubKeyX509Str8192, pkcs1topkcs8.priKeyPkcs8Str8192);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemPkcs1(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyPkcs1Str8192);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs1(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs1Str8192);
      } catch (error: BusinessError) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0016
     * @tc.number SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0016
     * @tc.desc   algorithm is RSA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let keyPair: cryptoFramework.KeyPair;
      let pubstring  = "";
      let pristring  = "";
      try {
        keyPair  =  pkcs1topkcs8.doConvertPemKeyBySync('RSA512', pkcs1topkcs8.pubKeyX509Str512, pkcs1topkcs8.priKeyPkcs8Str512);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemPkcs1(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyPkcs1Str512);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs1(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs1Str512);
      } catch (error: BusinessError) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  =  pkcs1topkcs8.doConvertPemKeyBySync('RSA768', pkcs1topkcs8.pubKeyX509Str768, pkcs1topkcs8.priKeyPkcs8Str768);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemPkcs1(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyPkcs1Str768);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs1(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs1Str768);
      } catch (error: BusinessError) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  =  pkcs1topkcs8.doConvertPemKeyBySync('RSA1024', pkcs1topkcs8.pubKeyX509Str1024, pkcs1topkcs8.priKeyPkcs8Str1024);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemPkcs1(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyPkcs1Str1024);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs1(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs1Str1024);
      } catch (error: BusinessError) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  =  pkcs1topkcs8.doConvertPemKeyBySync('RSA2048', pkcs1topkcs8.pubKeyX509Str2048, pkcs1topkcs8.priKeyPkcs8Str2048);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemPkcs1(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyPkcs1Str2048);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs1(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs1Str2048);
      } catch (error: BusinessError) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  =  pkcs1topkcs8.doConvertPemKeyBySync('RSA3072', pkcs1topkcs8.pubKeyX509Str3072, pkcs1topkcs8.priKeyPkcs8Str3072);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemPkcs1(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyPkcs1Str3072);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs1(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs1Str3072);
      } catch (error: BusinessError) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  =  pkcs1topkcs8.doConvertPemKeyBySync('RSA4096', pkcs1topkcs8.pubKeyX509Str4096, pkcs1topkcs8.priKeyPkcs8Str4096);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemPkcs1(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyPkcs1Str4096);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs1(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs1Str4096);
      } catch (error: BusinessError) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      try {
        keyPair  =  pkcs1topkcs8.doConvertPemKeyBySync('RSA8192', pkcs1topkcs8.pubKeyX509Str8192, pkcs1topkcs8.priKeyPkcs8Str8192);
        pubstring = pkcs1topkcs8.doPubGetEncodedPemPkcs1(keyPair);
        expect(pubstring).assertEqual(pkcs1topkcs8.pubKeyPkcs1Str8192);
        pristring = pkcs1topkcs8.doPriGetEncodedPemPkcs1(keyPair);
        expect(pristring).assertEqual(pkcs1topkcs8.priKeyPkcs1Str8192);
      } catch (error: BusinessError) {
        console.error(`RSA512 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0100
     * @tc.number SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0100
     * @tc.desc   algorithm is RSA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "RSA768";
        let rsaGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        await rsaGenerator.convertPemKey(null, null);
        expect(null).assertFail();
      } catch (error: BusinessError) {
        console.error(`RSA768 “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0200
     * @tc.number SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0200
     * @tc.desc   algorithm is RSA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "RSA1024";
        let rsaGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        await rsaGenerator.convertPemKey(pkcs1topkcs8.pubKeyError, null);
        expect(null).assertFail();
      } catch (error: BusinessError) {
        console.error(`RSA768 “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0300
     * @tc.number SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0300
     * @tc.desc   algorithm is RSA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "RSA1024";
        let rsaGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        await rsaGenerator.convertPemKey(null, pkcs1topkcs8.priKeyError);
        expect(null).assertFail();
      } catch (error: BusinessError) {
        console.error(`RSA768 “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0400
     * @tc.number SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0400
     * @tc.desc   algorithm is RSA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "RSA3072";
        let rsaGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        await rsaGenerator.convertPemKey(pkcs1topkcs8.pubKeyError, pkcs1topkcs8.priKeyError);
        expect(null).assertFail();
      } catch (error: BusinessError) {
        console.error(`RSA768 “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0500
     * @tc.number SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0500
     * @tc.desc   algorithm is RSA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "RSA1024";
        let rsaGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        await rsaGenerator.convertPemKey(pkcs1topkcs8.pubKeyError, pkcs1topkcs8.priKeyPkcs1Str1024);
        expect(null).assertFail();
      } catch (error: BusinessError) {
        console.error(`RSA768 “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0600
     * @tc.number SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0600
     * @tc.desc   algorithm is RSA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "RSA1024";
        let rsaGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        await rsaGenerator.convertPemKey(pkcs1topkcs8.pubKeyPkcs1Str1024, pkcs1topkcs8.priKeyError);
        expect(null).assertFail();
      } catch (error: BusinessError) {
        console.error(`RSA768 “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0700
     * @tc.number SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0700
     * @tc.desc   algorithm is RSA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "RSA1024";
        let rsaGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        await rsaGenerator.convertPemKey(pkcs1topkcs8.pubKeyPkcs1Str768, pkcs1topkcs8.priKeyPkcs1Str768);
      } catch (error: BusinessError) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0800
     * @tc.number SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0800
     * @tc.desc   algorithm is RSA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "RSA768";
        let rsaGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        let keyPair: cryptoFramework.KeyPair = await rsaGenerator.convertPemKey(pkcs1topkcs8.pubKeyPkcs1Str768, pkcs1topkcs8.priKeyPkcs8Str768);
        let pubString = keyPair.pubKey.getEncodedPem('PKCS1');
        let priString = keyPair.priKey.getEncodedPem('PKCS8');
        expect(pubString).assertEqual(pkcs1topkcs8.pubKeyPkcs1Str768);
        expect(priString).assertEqual(pkcs1topkcs8.priKeyPkcs8Str768);
      } catch (error: BusinessError) {
        console.error(`RSA768 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0900
     * @tc.number SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0900
     * @tc.desc   algorithm is RSA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "RSA768";
        let rsaGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        await rsaGenerator.convertPemKey(pkcs1topkcs8.pubKeyPkcs1Str768, pkcs1topkcs8.priKeyPkcs1Str1024);
      } catch (error: BusinessError) {
        console.error(`RSA768 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_1000
     * @tc.number SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_1000
     * @tc.desc   algorithm is RSA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "RSA2048";
        let rsaGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        await rsaGenerator.convertPemKey(pkcs1topkcs8.pubKeyPkcs1Str768, pkcs1topkcs8.priKeyPkcs1Str2048);
      } catch (error: BusinessError) {
        console.error(`RSA768 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_1100
     * @tc.number SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_1100
     * @tc.desc   algorithm is RSA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "RSA2048";
        let rsaGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        await rsaGenerator.convertPemKey(pkcs1topkcs8.pubKeyPkcs1Str2048, pkcs1topkcs8.priKeyPkcs1Str2048_B);
      } catch (error: BusinessError) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_1200
     * @tc.number SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_1200
     * @tc.desc   algorithm is RSA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "RSA768";
        let rsaGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        rsaGenerator.convertPemKeySync(null, null);
        expect(null).assertFail();
      } catch (error: BusinessError) {
        console.error(`RSA768 “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_1300
     * @tc.number SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_1300
     * @tc.desc   algorithm is RSA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "RSA768";
        let rsaGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        rsaGenerator.convertPemKeySync(pkcs1topkcs8.pubKeyError, null);
        expect(null).assertFail();
      } catch (error: BusinessError) {
        console.error(`RSA768 “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_1400
     * @tc.number SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_1400
     * @tc.desc   algorithm is RSA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "RSA1024";
        let rsaGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        rsaGenerator.convertPemKeySync(null, pkcs1topkcs8.priKeyError);
        expect(null).assertFail();
      } catch (error: BusinessError) {
        console.error(`RSA768 “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_1500
     * @tc.number SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_1500
     * @tc.desc   algorithm is RSA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "RSA3072";
        let rsaGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        rsaGenerator.convertPemKeySync(pkcs1topkcs8.pubKeyError, pkcs1topkcs8.priKeyError);
        expect(null).assertFail();
      } catch (error: BusinessError) {
        console.error(`RSA768 “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_1600
     * @tc.number SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_1600
     * @tc.desc   algorithm is RSA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "RSA1024";
        let rsaGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        rsaGenerator.convertPemKeySync(pkcs1topkcs8.pubKeyError, pkcs1topkcs8.priKeyPkcs1Str1024);
        expect(null).assertFail();
      } catch (error: BusinessError) {
        console.error(`RSA768 “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_1700
     * @tc.number SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_1700
     * @tc.desc   algorithm is RSA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "RSA1024";
        let rsaGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        rsaGenerator.convertPemKeySync(pkcs1topkcs8.pubKeyPkcs1Str1024, pkcs1topkcs8.priKeyError);
        expect(null).assertFail();
      } catch (error: BusinessError) {
        console.error(`RSA768 “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(17630001);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_1800
     * @tc.number SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_1800
     * @tc.desc   algorithm is RSA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_1800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "RSA1024";
        let rsaGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        rsaGenerator.convertPemKeySync(pkcs1topkcs8.pubKeyPkcs1Str768, pkcs1topkcs8.priKeyPkcs1Str768);
        expect(null).assertNull();
      } catch (error: BusinessError) {
        console.error(`RSA768 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_1900
     * @tc.number SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_1900
     * @tc.desc   algorithm is RSA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_1900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "RSA768";
        let rsaGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        let keyPair: cryptoFramework.KeyPair = rsaGenerator.convertPemKeySync(pkcs1topkcs8.pubKeyPkcs1Str768, pkcs1topkcs8.priKeyPkcs8Str768);
        let pubString = keyPair.pubKey.getEncodedPem('PKCS1');
        let priString = keyPair.priKey.getEncodedPem('PKCS8');
        expect(pubString).assertEqual(pkcs1topkcs8.pubKeyPkcs1Str768);
        expect(priString).assertEqual(pkcs1topkcs8.priKeyPkcs8Str768);
      } catch (error: BusinessError) {
        console.error(`RSA768 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_2000
     * @tc.number SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_2000
     * @tc.desc   algorithm is RSA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_2000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "RSA768";
        let rsaGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        rsaGenerator.convertPemKeySync(pkcs1topkcs8.pubKeyPkcs1Str768, pkcs1topkcs8.priKeyPkcs1Str1024);
        expect(null).assertNull();
      } catch (error: BusinessError) {
        console.error(`RSA768 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_2100
     * @tc.number SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_2100
     * @tc.desc   algorithm is RSA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_2100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "RSA2048";
        let rsaGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        rsaGenerator.convertPemKeySync(pkcs1topkcs8.pubKeyPkcs1Str768, pkcs1topkcs8.priKeyPkcs1Str2048);
        expect(null).assertNull();
      } catch (error: BusinessError) {
        console.error(`RSA768 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_2200
     * @tc.number SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_2200
     * @tc.desc   algorithm is RSA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_2200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "RSA2048";
        let rsaGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        rsaGenerator.convertPemKeySync(pkcs1topkcs8.pubKeyPkcs1Str2048, pkcs1topkcs8.priKeyPkcs1Str2048_B);
        expect(null).assertNull();
      } catch (error: BusinessError) {
        console.error(`RSA768 “${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_2300
     * @tc.number SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_2300
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_2300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "RSA1024";
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        let keyPair: cryptoFramework.KeyPair = generator.convertPemKeySync(pkcs1topkcs8.pubKeyX509Str1024, null);
        keyPair.pubKey.getEncodedPem("PKCS8");
        expect(null).assertFail();
      } catch (error: BusinessError) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_2400
     * @tc.number SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_2400
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_2400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "RSA2048";
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        let keyPair: cryptoFramework.KeyPair = await generator.convertPemKey(pkcs1topkcs8.pubKeyX509Str2048, null);
        keyPair.pubKey.getEncodedPem("PKCS8");
        expect(null).assertFail();
      } catch (error: BusinessError) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_2500
     * @tc.number SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_2500
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_2500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "RSA1024";
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        let keyPair: cryptoFramework.KeyPair = await generator.generateKeyPair();
        keyPair.pubKey.getEncodedPem("PKCS8");
        expect(null).assertFail();
      } catch (error: BusinessError) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_2600
     * @tc.number SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_2600
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_2600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "RSA3072";
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        let keyPair: cryptoFramework.KeyPair = await generator.generateKeyPair();
        keyPair.priKey.getEncodedPem("X509");
        expect(null).assertFail();
      } catch (error: BusinessError) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_2700
     * @tc.number SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_2700
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_2700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "RSA4096";
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        let keyPair: cryptoFramework.KeyPair = await generator.convertPemKey(null, pkcs1topkcs8.priKeyPkcs1Str4096);
        keyPair.priKey.getEncodedPem("X509");
        expect(null).assertFail();
      } catch (error: BusinessError) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_2800
     * @tc.number SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_2800
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_2800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "RSA8192";
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        let keyPair: cryptoFramework.KeyPair = generator.convertPemKeySync(null, pkcs1topkcs8.priKeyPkcs1Str8192);
        keyPair.priKey.getEncodedPem("X509");
        expect(null).assertFail();
      } catch (error: BusinessError) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_2900
     * @tc.number SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_2900
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_2900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "RSA768";
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        let keyPair: cryptoFramework.KeyPair = generator.convertPemKeySync(null, pkcs1topkcs8.priKeyPkcs8Str768);
        keyPair.priKey.getEncodedPem("X509");
        expect(null).assertFail();
      } catch (error: BusinessError) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_3000
     * @tc.number SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_3000
     * @tc.desc   algorithm is Sign and verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Security_CryptoFramework_Pkcs1ToPkcs8_Func_3000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        let algName: string = "RSA1024";
        let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
        let keyPair: cryptoFramework.KeyPair = await generator.convertPemKey(null, pkcs1topkcs8.priKeyPkcs8Str1024);
        keyPair.priKey.getEncodedPem("X509");
        expect(null).assertFail();
      } catch (error: BusinessError) {
        console.error(`SignVerify “${error}“, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });


  });
}