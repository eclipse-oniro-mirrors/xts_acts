/**
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

import { afterEach, beforeAll, beforeEach, describe, it, TestType, Size, Level } from '@ohos/hypium';
import Utils from './Utils.test';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@ohos.UiTest';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

const EVENT_ID_SET_SUITE_KEY = 181100;
const driver = Driver.create();

export default function webZoomAccessTest() {
  describe('WebZoomAccessTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebZoomAccessTestPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebZoomAccessTestPage state success " + JSON.stringify(pages));
        if (!("WebZoomAccessTestPage" == pages.name)) {
          console.info("get WebZoomAccessTestPage state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await driver.waitForComponent(ON.id("WebZoomAccessTestButton"), 10000);
          console.info("push WebZoomAccessTestPage success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebZoomAccessTestPage error: " + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("web beforeEach start");
      done();
    })

    /**
     * @tc.name   testWebZoomAccessFalse
     * @tc.number SUB_WEB_ZOOMACCESS_0100
     * @tc.desc   Test zoomAccess set to false, pinch gesture should not zoom the web content
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebZoomAccessFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebZoomAccessFalse", EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent("testWebZoomAccessFalse", true, 181101, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebZoomAccessTestButton", "testWebZoomAccessFalse");
      await Utils.waitForExist(() => isReturn, "testWebZoomAccessFalse" + '_returnCheck', true, 5000);
      done();
    })

    /**
     * @tc.name   testWebZoomAccessTrue
     * @tc.number SUB_WEB_ZOOMACCESS_0200
     * @tc.desc   Test zoomAccess set to true, pinch gesture should zoom the web content
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebZoomAccessTrue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebZoomAccessTrue", EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent("testWebZoomAccessTrue", true, 181102, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebZoomAccessTestButton", "testWebZoomAccessTrue");
      await Utils.waitForExist(() => isReturn, "testWebZoomAccessTrue" + '_returnCheck', true, 5000);
      done();
    })

    /**
     * @tc.name   testWebZoomAccessZoomIn
     * @tc.number SUB_WEB_ZOOMACCESS_0300
     * @tc.desc   Test zoomAccess with zoom-in gesture (pinch out)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebZoomAccessZoomIn', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebZoomAccessZoomIn", EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent("testWebZoomAccessZoomIn", true, 181103, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebZoomAccessTestButton", "testWebZoomAccessZoomIn");
      await Utils.waitForExist(() => isReturn, "testWebZoomAccessZoomIn" + '_returnCheck', true, 5000);
      done();
    })

    /**
     * @tc.name   testWebZoomAccessZoomOut
     * @tc.number SUB_WEB_ZOOMACCESS_0400
     * @tc.desc   Test zoomAccess with zoom-out gesture (pinch in)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebZoomAccessZoomOut', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebZoomAccessZoomOut", EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent("testWebZoomAccessZoomOut", true, 181104, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebZoomAccessTestButton", "testWebZoomAccessZoomOut");
      await Utils.waitForExist(() => isReturn, "testWebZoomAccessZoomOut" + '_returnCheck', true, 5000);
      done();
    })

    /**
     * @tc.name   testWebZoomAccessToggle
     * @tc.number SUB_WEB_ZOOMACCESS_0500
     * @tc.desc   Test toggling zoomAccess between false and true during runtime
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebZoomAccessToggle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testWebZoomAccessToggle", EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent("testWebZoomAccessToggle", true, 181105, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebZoomAccessTestButton", "testWebZoomAccessToggle");
      await Utils.waitForExist(() => isReturn, "testWebZoomAccessToggle" + '_returnCheck', true, 5000);
      done();
    })
  })
}
