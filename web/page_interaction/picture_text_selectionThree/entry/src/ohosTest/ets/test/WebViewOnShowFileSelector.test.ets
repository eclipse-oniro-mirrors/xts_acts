/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { beforeAll, beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils.test';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';
import { waitForExist} from './WaitTest.test';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

const EVENT_ID_SET_SUITE_KEY = 183124;
const driver = Driver.create();

export default function WebViewOnShowFileSelectorType() {

  describe('WebViewOnShowFileSelectorTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebViewOnShowFileSelector',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebViewOnShowFileSelector state success " + JSON.stringify(pages));
        if (!("WebViewOnShowFileSelector" == pages.name)) {
          console.info("get WebViewOnShowFileSelector state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WebViewOnShowFileSelector page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebViewOnShowFileSelector page error: " + err);
      }
      await driver.waitForComponent(ON.id("WebViewOnShowFileSelectorButton"), 10000)
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("webViewController beforeEach start");
      done();
    })


    /**
     * @tc.name   testOnShowFileSelector01
     * @tc.number SUB_WEB_TESTONSHOWFILESELECTOR_0100
     * @tc.desc   test onShowFileSelector
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOnShowFileSelector01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitOnShowFileSelector01", EVENT_ID_SET_SUITE_KEY);
      let isReturn = false;
      Utils.registerEvent("testOnShowFileSelector01", 'test-file.mp4', 20260105, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebViewOnShowFileSelectorButton", "testOnShowFileSelector01");
      await Utils.waitForExist(() => isReturn, "emitOnShowFileSelector01" + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testOnShowFileSelector02
     * @tc.number SUB_WEB_TESTONSHOWFILESELECTOR_0200
     * @tc.desc   test onShowFileSelector
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOnShowFileSelector02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitOnShowFileSelector02", EVENT_ID_SET_SUITE_KEY);
      let isReturn = false;
      Utils.registerEvent("testOnShowFileSelector02", 'downloads', 20260106, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebViewOnShowFileSelectorButton", "testOnShowFileSelector02");
      await Utils.waitForExist(() => isReturn, "emitOnShowFileSelector02" + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testOnShowFileSelector03
     * @tc.number SUB_WEB_TESTONSHOWFILESELECTOR_0300
     * @tc.desc   test onShowFileSelector
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOnShowFileSelector03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitOnShowFileSelector03", EVENT_ID_SET_SUITE_KEY);
      let isReturn = false;
      Utils.registerEvent("testOnShowFileSelector03", 1, 20260107, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebViewOnShowFileSelectorButton", "testOnShowFileSelector03");
      await Utils.waitForExist(() => isReturn, "emitOnShowFileSelector03" + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testOnShowFileSelector04
     * @tc.number SUB_WEB_TESTONSHOWFILESELECTOR_0400
     * @tc.desc   test onShowFileSelector
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOnShowFileSelector04', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitOnShowFileSelector04", EVENT_ID_SET_SUITE_KEY);
      let isReturn = false;
      Utils.registerEvent("testOnShowFileSelector04", true, 20260108, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebViewOnShowFileSelectorButton", "testOnShowFileSelector04");
      await Utils.waitForExist(() => isReturn, "emitOnShowFileSelector04" + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testOnShowFileSelector05
     * @tc.number SUB_WEB_TESTONSHOWFILESELECTOR_0500
     * @tc.desc   test onShowFileSelector
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOnShowFileSelector05', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitOnShowFileSelector05", EVENT_ID_SET_SUITE_KEY);
      let isReturn = false;
      Utils.registerEvent("testOnShowFileSelector05", "video/*", 20260109, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebViewOnShowFileSelectorButton", "testOnShowFileSelector05");
      await Utils.waitForExist(() => isReturn, "emitOnShowFileSelector05" + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testOnShowFileSelector06
     * @tc.number SUB_WEB_TESTONSHOWFILESELECTOR_0600
     * @tc.desc   test onShowFileSelector
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOnShowFileSelector06', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitOnShowFileSelector06", EVENT_ID_SET_SUITE_KEY);
      let isReturn = false;
      Utils.registerEvent("testOnShowFileSelector06", '[".mp4",".ogm",".wmv",".mpg"]', 20260110, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebViewOnShowFileSelectorButton", "testOnShowFileSelector06");
      await Utils.waitForExist(() => isReturn, "emitOnShowFileSelector06" + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testOnShowFileSelector07
     * @tc.number SUB_WEB_TESTONSHOWFILESELECTOR_0700
     * @tc.desc   test onShowFileSelector
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOnShowFileSelector07', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitOnShowFileSelector07", EVENT_ID_SET_SUITE_KEY);
      let isReturn = false;
      Utils.registerEvent("testOnShowFileSelector07", 0, 202601077, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebViewOnShowFileSelectorButton", "testOnShowFileSelector07");
      await Utils.waitForExist(() => isReturn, "emitOnShowFileSelector07" + '_returnCheck', true, 500);
      done();
    })


    /**
     * @tc.name   testOnShowFileSelector08
     * @tc.number SUB_WEB_TESTONSHOWFILESELECTOR_0800
     * @tc.desc   test onShowFileSelector
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOnShowFileSelector08', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitOnShowFileSelector08", EVENT_ID_SET_SUITE_KEY);
      let isReturn = false;
      Utils.registerEvent("testOnShowFileSelector08",  false, 202601078, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebViewOnShowFileSelectorButton", "testOnShowFileSelector08");
      await Utils.waitForExist(() => isReturn, "emitOnShowFileSelector08" + '_returnCheck', true, 500);
      done();
    })
    /**
     * @tc.name   testOnShowFileSelector09
     * @tc.number SUB_WEB_TESTONSHOWFILESELECTOR_0900
     * @tc.desc   test onShowFileSelector
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOnShowFileSelector09', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitOnShowFileSelector09", EVENT_ID_SET_SUITE_KEY);
      let isReturn = false;
      Utils.registerEvent("testOnShowFileSelector09",  0, 202601079, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebViewOnShowFileSelectorButton", "testOnShowFileSelector09");
      await Utils.waitForExist(() => isReturn, "emitOnShowFileSelector09" + '_returnCheck', true, 500);
      done();
    })
    /**
     * @tc.name   testOnShowFileSelector10
     * @tc.number SUB_WEB_TESTONSHOWFILESELECTOR_01000
     * @tc.desc   test onShowFileSelector
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOnShowFileSelector10', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitOnShowFileSelector10", EVENT_ID_SET_SUITE_KEY);
      let isReturn = false;
      Utils.registerEvent("testOnShowFileSelector10",  1, 2026010710, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebViewOnShowFileSelectorButton", "testOnShowFileSelector10");
      await Utils.waitForExist(() => isReturn, "emitOnShowFileSelector10" + '_returnCheck', true, 500);
      done();
    })

  })
}
