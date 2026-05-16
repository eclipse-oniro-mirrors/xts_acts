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
     * @tc.name   ACE_global_setTimeout
     * @tc.number ACE_global_setTimeout
     * @tc.desc   ACE_global_setTimeout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   ACE_global_canIUse
     * @tc.number ACE_global_canIUse
     * @tc.desc   ACE_global_canIUse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   ACE_global_console_log_0100
     * @tc.number ACE_global_console_log_0100
     * @tc.desc   Test console log printing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   ACE_global_console_info_0100
     * @tc.number ACE_global_console_info_0100
     * @tc.desc   Test console info printing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   ACE_global_console_warn_0100
     * @tc.number ACE_global_console_warn_0100
     * @tc.desc   Test console warn printing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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