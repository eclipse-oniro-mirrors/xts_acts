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

const EVENT_ID_SET_SUITE_KEY = 181203;
const driver = Driver.create();

export default function WebEnableDragTest() {
  describe('WebEnableDragTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebEnableDrag',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebEnableDrag state success " + JSON.stringify(pages));
        if (!("WebEnableDrag" == pages.name)) {
          console.info("get WebEnableDrag state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await driver.waitForComponent(ON.id("webEnableDragButton"), 10000);
          console.info("push WebEnableDrag page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebEnableDrag page error: " + err);
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
     * @tc.name   testEnableDrag01
     * @tc.number SUB_WEB_ENABLE_DRAG_0100
     * @tc.desc   test enabledrag false zoomOut
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEnableDrag01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitEnableDrag01", EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent("testEnableDrag01", true, 20260418, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "webEnableDragButton", "testEnableDrag01");
      await Utils.waitForExist(() => isReturn, "testEnableDrag01" + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testEnableDrag02
     * @tc.number SUB_WEB_ENABLE_DRAG_0200
     * @tc.desc   test enabledrag false zoomIn
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEnableDrag02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitEnableDrag02", EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent("testEnableDrag02", true, 20260419, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "webEnableDragButton", "testEnableDrag02");
      await Utils.waitForExist(() => isReturn, "testEnableDrag02" + '_returnCheck', true, 1000);
      done();
    })

  })
}