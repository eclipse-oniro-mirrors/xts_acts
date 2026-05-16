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

export default function WebEmulateTouchFromMouseEventTest() {
  describe('WebEmulateTouchFromMouseEventTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebEmulateTouchFromMouseEvent',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebEmulateTouchFromMouseEvent state success " + JSON.stringify(pages));
        if (!("WebEmulateTouchFromMouseEvent" == pages.name)) {
          console.info("get WebEmulateTouchFromMouseEvent state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await driver.waitForComponent(ON.id("WebEmulateTouchFromMouseEventButton"), 10000);
          console.info("push WebEmulateTouchFromMouseEvent page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebEmulateTouchFromMouseEvent page error: " + err);
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
     * @tc.name   testWebEmulateTouchFromMouseEvent001
     * @tc.number SUB_WEB_EMULATETOUCHFROMMOUSEEVENT_0300
     * @tc.desc   emulateTouchFromMouseEvent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebEmulateTouchFromMouseEvent001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitWebEmulateTouchFromMouseEvent001", EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent("testWebEmulateTouchFromMouseEvent001", 'emulateTouchFromMouseEvent', 20251212, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebEmulateTouchFromMouseEventButton", "testWebEmulateTouchFromMouseEvent001");
      await Utils.waitForExist(() => isReturn, "testWebEmulateTouchFromMouseEvent001" + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testWebEmulateTouchFromMouseEvent002
     * @tc.number SUB_WEB_EMULATETOUCHFROMMOUSEEVENT_0400
     * @tc.desc   emulateTouchFromMouseEvent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebEmulateTouchFromMouseEvent002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitWebEmulateTouchFromMouseEvent002", EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent("testWebEmulateTouchFromMouseEvent002", true, 20251214, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebEmulateTouchFromMouseEventButton", "testWebEmulateTouchFromMouseEvent002");
      await Utils.waitForExist(() => isReturn, "testWebEmulateTouchFromMouseEvent002" + '_returnCheck', true, 1000);
      done();
    })
  })
}