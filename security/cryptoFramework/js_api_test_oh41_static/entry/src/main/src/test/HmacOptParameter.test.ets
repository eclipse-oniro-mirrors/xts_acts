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
import cryptoFramework from '@ohos.security.cryptoFramework';
import cpFw from '@ohos.security.cryptoFramework';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import Utils from './Util.test';
import * as digCallback from './utils/digestalgorithm/publicDigestCallback.test';
import * as digPromise from './utils/digestalgorithm/publicDigestPromise.test';
import * as commons from './utils/common/publicDoString.test';
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let testAbilityContext:common.UIAbilityContext;


export default function cryptoHmacOptParaJsTestUnit() {
  describe("cryptoHmacOptParaJsTestUnit", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');

    /**
     * @tc.name   Security_CryptoFramework_HmacOptPara_Func_0100
     * @tc.number Security_CryptoFramework_HmacOptPara_Func_0100
     * @tc.desc   3. Test interface with AsyncCallback style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_CryptoFramework_HmacOptPara_Func_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let retData = await digCallback.HmacDigestProcess("SHA1", "HMAC|SHA1");
        let outputLength: number = retData.output.data.length;
        expect(outputLength == retData.macLength && retData.macLength == 20).assertTrue();
      } catch (err) {
        console.error(`Security_CryptoFramework_HmacOptPara_Func_0100 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_HmacOptPara_Func_0200
     * @tc.number Security_CryptoFramework_HmacOptPara_Func_0200
     * @tc.desc   3. Test interface with AsyncCallback style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_CryptoFramework_HmacOptPara_Func_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let retData = await digCallback.HmacDigestProcess("SHA224", "HMAC|SHA224");
        let outputLength: number = retData.output.data.length;
        expect(outputLength == retData.macLength && retData.macLength == 28).assertTrue();
      } catch (err) {
        console.error(`Security_CryptoFramework_HmacOptPara_Func_0200 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_HmacOptPara_Func_0300
     * @tc.number Security_CryptoFramework_HmacOptPara_Func_0300
     * @tc.desc   3. Test interface with AsyncCallback style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_CryptoFramework_HmacOptPara_Func_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let retData = await digCallback.HmacDigestProcess("SHA256", "HMAC|SHA256");
        let outputLength: number = retData.output.data.length;
        expect(outputLength == retData.macLength && retData.macLength == 32).assertTrue();
      } catch (err) {
        console.error(`Security_CryptoFramework_HmacOptPara_Func_0300 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_HmacOptPara_Func_0400
     * @tc.number Security_CryptoFramework_HmacOptPara_Func_0400
     * @tc.desc   3. Test interface with AsyncCallback style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_CryptoFramework_HmacOptPara_Func_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let retData = await digCallback.HmacDigestProcess("SHA384", "HMAC|SHA384");
        let outputLength: number = retData.output.data.length;
        expect(outputLength == retData.macLength && retData.macLength == 48).assertTrue();
      } catch (err) {
        console.error(`Security_CryptoFramework_HmacOptPara_Func_0400 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_HmacOptPara_Func_0500
     * @tc.number Security_CryptoFramework_HmacOptPara_Func_0500
     * @tc.desc   3. Test interface with AsyncCallback style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_CryptoFramework_HmacOptPara_Func_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let retData = await digCallback.HmacDigestProcess("SHA512", "HMAC|SHA512");
        let outputLength: number = retData.output.data.length;
        expect(outputLength == retData.macLength && retData.macLength == 64).assertTrue();
      } catch (err) {
        console.error(`Security_CryptoFramework_HmacOptPara_Func_0500 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_HmacOptPara_Func_0600
     * @tc.number Security_CryptoFramework_HmacOptPara_Func_0600
     * @tc.desc   3. Test interface with AsyncCallback style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_CryptoFramework_HmacOptPara_Func_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let retData = await digCallback.HmacDigestProcess("SM3", "HMAC|SM3");
        let outputLength: number = retData.output.data.length;
        expect(outputLength == retData.macLength && retData.macLength == 32).assertTrue();
      } catch (err) {
        console.error(`Security_CryptoFramework_HmacOptPara_Func_0600 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_HmacOptPara_Func_0700
     * @tc.number Security_CryptoFramework_HmacOptPara_Func_0700
     * @tc.desc   2. Test interface with AsyncCallback style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_CryptoFramework_HmacOptPara_Func_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await digCallback.HmacDigestProcess("SM3", "hmac|SM3");
        expect(null).assertFail();
      } catch (err) {
        console.error(`Security_CryptoFramework_HmacOptPara_Func_0700 catch error1: “${err}“, error code: ${err.code}`);
        expect((err as BusinessError).code).assertEqual(801);
      }
      try {
        await digCallback.HmacDigestProcess("sm3", "HMAC|SM3");
        expect(null).assertFail();
      } catch (err) {
        console.error(`Security_CryptoFramework_HmacOptPara_Func_0700 catch error2: “${err}“, error code: ${err.code}`);
        expect((err as BusinessError).code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_HmacOptPara_Func_0800
     * @tc.number Security_CryptoFramework_HmacOptPara_Func_0800
     * @tc.desc   3. Test interface with AsyncCallback style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_CryptoFramework_HmacOptPara_Func_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let keyBlob: cryptoFramework.DataBlob = {
        data: commons.stringTouInt8Array("123ab")
      };
      try {
        let retData = await digCallback.HmacAnyLengthKeyDigestProcess("SHA512", keyBlob);
        let outputLength: number = retData.output.data.length;
        expect(outputLength == retData.macLength && retData.macLength == 64).assertTrue();
      } catch (err) {
        console.error(`Security_CryptoFramework_HmacOptPara_Func_0800 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_HmacOptPara_Func_0900
     * @tc.number Security_CryptoFramework_HmacOptPara_Func_0900
     * @tc.desc   3. Test interface with AsyncCallback style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_CryptoFramework_HmacOptPara_Func_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let strLen: number = 4097;
      let srcStr: string = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefhijklmnopqrstuvwxyz0123456789";
      let randomStr: string = "";
      for (let i = 0; i < strLen; i++) {
        randomStr += srcStr.charAt(Math.floor(Math.random() * srcStr.length).toInt());
      }
      commons.sliceAndPrintString(randomStr, 500);
      let keyBlob: cryptoFramework.DataBlob = {
        data: commons.stringTouInt8Array(randomStr)
      };
      try {
        await digCallback.HmacAnyLengthKeyDigestProcess("SM3", keyBlob);
        expect(null).assertFail();
      } catch (err) {
        console.error(`Security_CryptoFramework_HmacOptPara_Func_0900 catch error: “${err}“, error code: ${err.code}`);
        expect((err as BusinessError).code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_HmacOptPara_Func_1000
     * @tc.number Security_CryptoFramework_HmacOptPara_Func_1000
     * @tc.desc   3. Test interface with AsyncCallback style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_CryptoFramework_HmacOptPara_Func_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let keyBlob: cryptoFramework.DataBlob = {
        data: commons.stringTouInt8Array("")
      };
      try {
        await digCallback.HmacAnyLengthKeyDigestProcess("SM3", keyBlob);
        expect(null).assertFail();
      } catch (err) {
        console.error(`Security_CryptoFramework_HmacOptPara_Func_1000 catch error: “${err}“, error code: ${err.code}`);
        expect((err as BusinessError).code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_HmacOptPara_Func_1100
     * @tc.number Security_CryptoFramework_HmacOptPara_Func_1100
     * @tc.desc   3. Test interface with Promise style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_CryptoFramework_HmacOptPara_Func_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let retData = await digPromise.HmacDigestProcess("SHA1", "HMAC|SHA1");
        let outputLength: number = retData.output.data.length;
        expect(outputLength == retData.macLength && retData.macLength == 20).assertTrue();
      } catch (err) {
        console.error(`Security_CryptoFramework_HmacOptPara_Func_1100 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_HmacOptPara_Func_1200
     * @tc.number Security_CryptoFramework_HmacOptPara_Func_1200
     * @tc.desc   3. Test interface with Promise style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_CryptoFramework_HmacOptPara_Func_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let retData = await digPromise.HmacDigestProcess("SHA224", "HMAC|SHA224");
        let outputLength: number = retData.output.data.length;
        expect(outputLength == retData.macLength && retData.macLength == 28).assertTrue();
      } catch (err) {
        console.error(`Security_CryptoFramework_HmacOptPara_Func_1200 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_HmacOptPara_Func_1300
     * @tc.number Security_CryptoFramework_HmacOptPara_Func_1300
     * @tc.desc   3. Test interface with Promise style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_CryptoFramework_HmacOptPara_Func_1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let retData = await digPromise.HmacDigestProcess("SHA256", "HMAC|SHA256");
        let outputLength: number = retData.output.data.length;
        expect(outputLength == retData.macLength && retData.macLength == 32).assertTrue();
      } catch (err) {
        console.error(`Security_CryptoFramework_HmacOptPara_Func_1300 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_HmacOptPara_Func_1400
     * @tc.number Security_CryptoFramework_HmacOptPara_Func_1400
     * @tc.desc   3. Test interface with Promise style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_CryptoFramework_HmacOptPara_Func_1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let retData = await digPromise.HmacDigestProcess("SHA384", "HMAC|SHA384");
        let outputLength: number = retData.output.data.length;
        expect(outputLength == retData.macLength && retData.macLength == 48).assertTrue();
      } catch (err) {
        console.error(`Security_CryptoFramework_HmacOptPara_Func_1400 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_HmacOptPara_Func_1500
     * @tc.number Security_CryptoFramework_HmacOptPara_Func_1500
     * @tc.desc   3. Test interface with Promise style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_CryptoFramework_HmacOptPara_Func_1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let retData = await digPromise.HmacDigestProcess("SHA512", "HMAC|SHA512");
        let outputLength: number = retData.output.data.length;
        expect(outputLength == retData.macLength && retData.macLength == 64).assertTrue();
      } catch (err) {
        console.error(`Security_CryptoFramework_HmacOptPara_Func_1500 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_HmacOptPara_Func_1600
     * @tc.number Security_CryptoFramework_HmacOptPara_Func_1600
     * @tc.desc   3. Test interface with Promise style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_CryptoFramework_HmacOptPara_Func_1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let retData = await digPromise.HmacDigestProcess("SM3", "HMAC|SM3");
        let outputLength: number = retData.output.data.length;
        expect(outputLength == retData.macLength && retData.macLength == 32).assertTrue();
      } catch (err) {
        console.error(`Security_CryptoFramework_HmacOptPara_Func_1600 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_HmacOptPara_Func_1700
     * @tc.number Security_CryptoFramework_HmacOptPara_Func_1700
     * @tc.desc   2. Test interface with Promise style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_CryptoFramework_HmacOptPara_Func_1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await digPromise.HmacDigestProcess("SM3", "HMAC|Sha256");
        expect(null).assertFail();
      } catch (err) {
        console.error(`Security_CryptoFramework_HmacOptPara_Func_0700 catch error1: “${err}“, error code: ${err.code}`);
        expect((err as BusinessError).code).assertEqual(801);
      }
      try {
        await digPromise.HmacDigestProcess("sha384", "HMAC|SHA384");
        expect(null).assertFail();
      } catch (err) {
        console.error(`Security_CryptoFramework_HmacOptPara_Func_1700 catch error2: “${err}“, error code: ${err.code}`);
        expect((err as BusinessError).code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_HmacOptPara_Func_1800
     * @tc.number Security_CryptoFramework_HmacOptPara_Func_1800
     * @tc.desc   3. Test interface with Promise style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_CryptoFramework_HmacOptPara_Func_1800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let keyBlob: cryptoFramework.DataBlob = {
        data: commons.stringTouInt8Array("123ab")
      };
      try {
        let retData = await digPromise.HmacAnyLengthKeyDigestProcess("SHA384", keyBlob);
        let outputLength: number = retData.output.data.length;
        expect(outputLength == retData.macLength && retData.macLength == 48).assertTrue();
      } catch (err) {
        console.error(`Security_CryptoFramework_HmacOptPara_Func_1800 catch error: “${err}“, error code: ${err.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_HmacOptPara_Func_1900
     * @tc.number Security_CryptoFramework_HmacOptPara_Func_1900
     * @tc.desc   3. Test interface with Promise style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_CryptoFramework_HmacOptPara_Func_1900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let strLen: number = 4097;
      let srcStr: string = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefhijklmnopqrstuvwxyz0123456789";
      let randomStr: string = "";
      for (let i = 0; i < strLen; i++) {
        randomStr += srcStr.charAt(Math.floor(Math.random() * srcStr.length).toInt());
      }
      commons.sliceAndPrintString(randomStr, 500);
      let keyBlob: cryptoFramework.DataBlob = {
        data: commons.stringTouInt8Array(randomStr)
      };
      try {
        await digPromise.HmacAnyLengthKeyDigestProcess("SHA256", keyBlob);
        expect(null).assertFail();
      } catch (err) {
        console.error(`Security_CryptoFramework_HmacOptPara_Func_1900 catch error: “${err}“, error code: ${err.code}`);
        expect((err as BusinessError).code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_HmacOptPara_Func_2000
     * @tc.number Security_CryptoFramework_HmacOptPara_Func_2000
     * @tc.desc   3. Test interface with Promise style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_CryptoFramework_HmacOptPara_Func_2000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let keyBlob: cryptoFramework.DataBlob = {
        data: commons.stringTouInt8Array("")
      };
      try {
        await digPromise.HmacAnyLengthKeyDigestProcess("SHA1", keyBlob);
        expect(null).assertFail();
      } catch (err) {
        console.error(`Security_CryptoFramework_HmacOptPara_Func_2000 catch error: “${err}“, error code: ${err.code}`);
        expect((err as BusinessError).code).assertEqual(401);
      }
      done();
    });
  })
}