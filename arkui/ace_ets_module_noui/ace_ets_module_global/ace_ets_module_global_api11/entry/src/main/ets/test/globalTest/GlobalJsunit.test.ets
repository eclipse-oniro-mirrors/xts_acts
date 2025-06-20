/**
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from "@ohos/hypium"
import router from '@ohos.router';
import Utils from '../Utils';
import deviceInfo from '@ohos.deviceInfo';
export default function globalJsunit() {
  describe('globalJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("global beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/global/global',
      }
      try {
        router.clear();
        let pages: router.RouterState = router.getState();
        console.info("get global state pages:" + JSON.stringify(pages));
        if (!("global" == pages.name)) {
          console.info("get global state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push global page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push global page error:" + err);
      }
      done()
    });
    afterEach(async () => {
      await Utils.sleep(1000);
    });
    /**
     * @tc.number ACE_global_setTimeout
     * @tc.name setTimeout()
     * @tc.desc Test setTimeout
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : LEVEL0
     */

    it('ACE_global_setTimeout', Level.LEVEL0, async (done: Function) => {
      let caseName: string = "ACE_global_setTimeout"
      console.info(`${caseName} START`);
      setTimeout(() => {
        expect(true).assertTrue();
      }, 100)
      console.info(`${caseName} END`);
      done()
    });
    /**
     * @tc.number ACE_global_canIUse
     * @tc.name canIUse()
     * @tc.desc Test canIUse
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : LEVEL0
     */

    it('ACE_global_canIUse', Level.LEVEL0, async (done: Function) => {
      let caseName: string = "ACE_global_canIUse"
      console.info(`${caseName} START`);
      let syscapName: string = "";
      let result = canIUse(syscapName);
      expect(result === false).assertTrue();
      console.info(`${caseName} END`);
      done()
    });

    /**
     * @tc.number ACE_global_isApiVersionGreaterOrEqual
     * @tc.name ACE_global_isApiVersionGreaterOrEqual
     * @tc.desc Test isApiVersionGreaterOrEqual
     */
    it('ACE_global_isApiVersionGreaterOrEqual', Level.LEVEL0, async (done: Function) => {
      let caseName: string = "ACE_global_isApiVersionGreaterOrEqual"
      console.info(`${caseName} START`);

      let majorApiVersion: number = deviceInfo.sdkApiVersion;
      let minorApiVersion: number = deviceInfo.sdkMinorApiVersion;
      let patchApiVersion: number = deviceInfo.sdkPatchApiVersion;
      console.info('IsApiVersionGreaterOrEqual, major:' + majorApiVersion + ', minor:' + minorApiVersion + ', patch:' + patchApiVersion);
      // 验证非法版本
      let result: boolean = isApiVersionGreaterOrEqual('0.2.3');
      expect(result).assertEqual(false);
      result = isApiVersionGreaterOrEqual('1000.2.3');
      expect(result).assertEqual(false);
      result = isApiVersionGreaterOrEqual('1.-1.3');
      expect(result).assertEqual(false);
      result = isApiVersionGreaterOrEqual('1.1000.3');
      expect(result).assertEqual(false);
      result = isApiVersionGreaterOrEqual('1.2.-1');
      expect(result).assertEqual(false);
      result = isApiVersionGreaterOrEqual('1.2.1000');
      expect(result).assertEqual(false);

      if (majorApiVersion < 2 || majorApiVersion > 999 || minorApiVersion < 0 || patchApiVersion < 0) {
        done();
      } else {
        // 验证传参等于系统版本时返回1
        let result1: boolean = isApiVersionGreaterOrEqual(`${majorApiVersion}.${minorApiVersion}.${patchApiVersion}`);
        console.info('IsApiVersionGreaterOrEqual result1:' + result1);
        expect(result1).assertEqual(true);

        // 验证传参小于系统版本时返回1
        majorApiVersion -= 1;
        let result2 : boolean = isApiVersionGreaterOrEqual(`${majorApiVersion}.${minorApiVersion}.${patchApiVersion}`);
        console.info('IsApiVersionGreaterOrEqual result2:' + result2);
        expect(result2).assertEqual(true);

        // 验证传参大于系统版本时返回0
        majorApiVersion += 2;
        let result3 : boolean = isApiVersionGreaterOrEqual(`${majorApiVersion}.${minorApiVersion}.${patchApiVersion}`);
        console.info('IsApiVersionGreaterOrEqual result3:' + result3);
        expect(result3).assertEqual(false);
      }
      console.info(`${caseName} END`);
      done()
    });

    /**
     * @tc.number ACE_global_console_log_0100
     * @tc.name console::log
     * @tc.desc Test console log printing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : LEVEL0
     */
    it("ACE_global_console_log_0100", Level.LEVEL0, async (done: Function) => {
      let casename: string = "ACE_global_001";
      console.log("-----------------------ACE_global_console_log Test is starting-----------------------");
      try {
        console.log("ACE_global_console_log test ok");
        expect(true).assertTrue();
      } catch (error) {
        console.log(casename + "errorcode: " + casename);
        expect().assertFail();
        done();
      }
      console.log("-----------------------ACE_global_console_log Test end-----------------------");
      done()
    });
    /**
     * @tc.number ACE_global_console_info_0100
     * @tc.name console::info
     * @tc.desc Test console info printing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : LEVEL0
     */
    it("ACE_global_console_info_0100", Level.LEVEL0, async (done: Function) => {
      let casename: string = "ACE_global_002";
      console.log("-----------------------ACE_global_console_info Test is starting-----------------------");
      try {
        console.info("ACE_global_console_info test ok");
        expect(true).assertTrue();
      } catch (error) {
        console.log(casename + "errorcode: " + casename);
        expect().assertFail();
        done();
      }
      console.log("-----------------------ACE_global_console_info Test end-----------------------");
      done()
    });
    /**
     * @tc.number ACE_global_console_warn_0100
     * @tc.name console::warn
     * @tc.desc Test console warn printing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : LEVEL0
     */
    it("ACE_global_console_warn_0100", Level.LEVEL0, async (done: Function) => {
      let casename: string = "ACE_global_003";
      console.log("-----------------------ACE_global_console_warn Test is starting-----------------------");
      try {
        console.warn("ACE_global_console_warn test ok");
        expect(true).assertTrue();
      } catch (error) {
        console.log(casename + "errorcode: " + casename);
        expect().assertFail();
        done();
      }
      console.log("-----------------------ACE_global_console_warn Test end-----------------------");
      done()
    });
  })
}