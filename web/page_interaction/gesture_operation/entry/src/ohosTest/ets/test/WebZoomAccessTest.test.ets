/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { afterEach, beforeAll, beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import Utils from './Utils';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

const EVENT_ID_SET_SUITE_KEY = 181201;
const driver = Driver.create();

export default function webZoomAccessTest() {
  describe('WebZoomAccessTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebZoomAccessTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebZoomAccessTest state success " + JSON.stringify(pages));
        if (!("WebZoomAccessTest" == pages.name)) {
          console.info("get WebZoomAccessTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await driver.waitForComponent(ON.id("WebZoomAccessTestButton"), 10000);
          console.info("push WebZoomAccessTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebZoomAccessTest page error: " + err);
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

    /*
    * @tc.number      : SUB_WEB_ZOOMACCESS_0100
    * @tc.name        : testWebZoomAccess001
    * @tc.desc        : test zoomAccess false zoomOut
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebZoomAccess001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebZoomAccess001", EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent("testWebZoomAccess001", true, 181210, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebZoomAccessTestButton", "testWebZoomAccess001");
      await Utils.waitForExist(() => isReturn, "testWebZoomAccess001" + '_returnCheck', true, 1000);
      done();
    })

    /*
    * @tc.number      : SUB_WEB_ZOOMACCESS_0200
    * @tc.name        : testWebZoomAccess002
    * @tc.desc        : test zoomAccess false zoomIn
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebZoomAccess002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebZoomAccess002", EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent("testWebZoomAccess002", true, 181220, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebZoomAccessTestButton", "testWebZoomAccess002");
      await Utils.waitForExist(() => isReturn, "testWebZoomAccess002" + '_returnCheck', true, 1000);
      done();
    })

    /*
    * @tc.number      : SUB_WEB_ZOOMACCESS_0300
    * @tc.name        : testWebZoomAccess003
    * @tc.desc        : test zoomAccess true zoomOut
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebZoomAccess003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebZoomAccess003", EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent("testWebZoomAccess003", true, 181230, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebZoomAccessTestButton", "testWebZoomAccess003");
      await Utils.waitForExist(() => isReturn, "testWebZoomAccess003" + '_returnCheck', true, 1000);
      done();
    })

    /*
    * @tc.number      : SUB_WEB_ZOOMACCESS_0400
    * @tc.name        : testWebZoomAccess004
    * @tc.desc        : test zoomAccess true zoomIn
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebZoomAccess004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebZoomAccess004", EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent("testWebZoomAccess004", true, 181240, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebZoomAccessTestButton", "testWebZoomAccess004");
      await Utils.waitForExist(() => isReturn, "testWebZoomAccess004" + '_returnCheck', true, 1000);
      done();
    })
  })
}