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

import { describe, beforeEach, afterEach, it, expect, beforeAll , TestType, Size, Level, afterAll } from "@ohos/hypium";
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from "@kit.TestKit";

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
let emitKey = ""

const EVENT_ID_SET_SUITE_KEY = 178219;
let driver = Driver.create();

export default function webViewSrollableJsunit() {
  describe('WebOnInputMethodAttachedTest',  () =>{
    beforeAll(async  (done: Function) =>{
      let options: router.RouterOptions = {
        url: "testability/pages/WebOnInputMethodAttached"
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebOnInputMethodAttached state success " + JSON.stringify(pages));
        if (!("WebOnInputMethodAttached" == pages.name)) {
          console.info("get WebOnInputMethodAttached state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push WebOnInputMethodAttached page success " + JSON.stringify(result));
          await driver.waitForComponent(ON.id("WebOnInputMethodAttachedButton"), 10000);
        }
      } catch (err) {
        console.error("push WebOnInputMethodAttached page error: " + err);
      }
      done()
    });
    beforeEach(async  (done: Function) =>{
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("blurMode beforeEach start");
      done();
    })


    /**
     * @tc.name   emitOnInputMethodAttached01
     * @tc.number SUB_WEB_ONINPUTMETHOD_ATTACHED_0100
     * @tc.desc   testOnInputMethodAttached001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitOnInputMethodAttached01',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async  (done: Function) =>{
      Utils.emitEvent("emitOnInputMethodAttached01", EVENT_ID_SET_SUITE_KEY);
      let isReturn = false;
      Utils.registerEvent("emitOnInputMethodAttached01", true, 20250418, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebOnInputMethodAttachedButton","emitOnInputMethodAttached01");
      await Utils.waitForExist(() => isReturn, "emitOnInputMethodAttached01" + '_returnCheck', true, 1000);
      done();
    })


    /**
     * @tc.name   emitOnInputMethodAttached02
     * @tc.number SUB_WEB_ONINPUTMETHOD_ATTACHED_0200
     * @tc.desc   testOnInputMethodAttached002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('emitOnInputMethodAttached02',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async  (done: Function) =>{
      Utils.emitEvent("emitOnInputMethodAttached02", EVENT_ID_SET_SUITE_KEY);
      let isReturn = false;
      Utils.registerEvent("emitOnInputMethodAttached02", true, 20250419,  () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebOnInputMethodAttachedButton","emitOnInputMethodAttached02");
      await Utils.waitForExist(() => isReturn, "emitOnInputMethodAttached02" + '_returnCheck', true, 1000);
      done();
    })

  })
}

