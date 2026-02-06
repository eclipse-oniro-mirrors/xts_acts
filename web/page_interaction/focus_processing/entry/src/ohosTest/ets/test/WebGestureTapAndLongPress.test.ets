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

import { describe, beforeEach, afterEach, it, expect, beforeAll , TestType, Size, Level } from "@ohos/hypium";
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
// import router from '@system.router';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from "@kit.TestKit";

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
let emitKey = ""

const EVENT_ID_SET_SUITE_KEY = 178101;
let driver = Driver.create();

export default function WebGestureTapAndLongPressJsunit() {
  describe('WebGestureTapAndLongPressTest',  () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: "testability/pages/WebGestureTapAndLongPress"
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebGestureTapAndLongPress state success " + JSON.stringify(pages));
        if (!("WebGestureTapAndLongPress" == pages.name)) {
          console.info("get WebGestureTapAndLongPress state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push WebGestureTapAndLongPress page success " + JSON.stringify(result));
          await driver.waitForComponent(ON.id("WebGestureFocusModeButton"), 10000);
        }

      } catch (err) {
        console.error("push WebGestureTapAndLongPress page error: " + err);
      }
      await driver.waitForComponent(ON.id("WebWebViewWebGestureTapAndLongPressButton"), 10000);
      done()
    });
    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("blurMode beforeEach start");
      done();
    })

    /*
    * @tc.number     : SUB_WEB_WEBGESTURETAPANDLONGPRESS_0100
    * @tc.name       : testWebGestureTapAndLongPress001
    * @tc.desc       : testWebGestureTapAndLongPress001
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 0
    */
    it('testWebGestureTapAndLongPress001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "testWebGestureTapAndLongPress001";
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebGestureTapAndLongPress001", true, 178110,  () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebWebViewWebGestureTapAndLongPressButton","testWebGestureTapAndLongPress001");
      await Utils.waitForExist(() => isReturn, "testWebGestureTapAndLongPress001" + '_returnCheck', true, 1000);
      done();
    })


    /*
    * @tc.number     : SUB_WEB_WEBGESTURETAPANDLONGPRESS_0200
    * @tc.name       : testWebGestureTapAndLongPress002
    * @tc.desc       : testWebGestureTapAndLongPress002
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebGestureTapAndLongPress002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "testWebGestureTapAndLongPress002";
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebGestureTapAndLongPress002", true, 178120, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebWebViewWebGestureTapAndLongPressButton", emitKey);
      await Utils.waitForExist(() => isReturn, "testWebGestureTapAndLongPress002" + '_returnCheck', true, 1000);
      done();
    })
  })
}


