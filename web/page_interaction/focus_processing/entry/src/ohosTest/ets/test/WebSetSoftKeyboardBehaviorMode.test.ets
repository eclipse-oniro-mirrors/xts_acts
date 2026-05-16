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
import router from '@ohos.router';
import { Driver, ON, MouseButton } from '@ohos.UiTest';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
let emitKey = "";

const EVENT_ID_SET_SUITE_KEY = 178208;
const driver = Driver.create();

export default function SetSoftKeyboardBehaviorModeTest() {
  describe('WebSetSoftKeyboardBehaviorModeTest',  () =>{
    beforeAll(async  (done: Function) =>{
      let options: router.RouterOptions = {
        url: "testability/pages/WebSetSoftKeyboardBehaviorMode"
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebSetSoftKeyboardBehaviorMode state success " + JSON.stringify(pages));
        if (!("WebSetSoftKeyboardBehaviorMode" == pages.name)) {
          console.info("get WebSetSoftKeyboardBehaviorMode state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push WebSetSoftKeyboardBehaviorMode page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebSetSoftKeyboardBehaviorMode page error: " + err);
      }
      await driver.waitForComponent(ON.id("setSoftKeyboardBehaviorModeButton"),10000);
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
     * @tc.name   emitSetSoftKeyboardBehaviorMode01
     * @tc.number SUB_WEB_SETSOFTKEYBOARDBEHAVIORMODE_0100
     * @tc.desc   test  setSoftKeyboardBehaviorMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitSetSoftKeyboardBehaviorMode01',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async  (done: Function) =>{
      emitKey="emitSetSoftKeyboardBehaviorMode02";
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY);
      let isReturn = false;
      Utils.registerEvent("emitSetSoftKeyboardBehaviorMode01", true, 20251115, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "setSoftKeyboardBehaviorModeButton",emitKey);
      await Utils.waitForExist(() => isReturn, "emitSetSoftKeyboardBehaviorMode01" + '_returnCheck', true, 1000);
      done();
    })


    /**
     * @tc.name   emitSetSoftKeyboardBehaviorMode02
     * @tc.number SUB_WEB_SETSOFTKEYBOARDBEHAVIORMODE_0200
     * @tc.desc   test  setSoftKeyboardBehaviorMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitSetSoftKeyboardBehaviorMode02',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async  (done: Function) =>{
      emitKey="emitSetSoftKeyboardBehaviorMode02";
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY);
      let isReturn = false;
      Utils.registerEvent("emitSetSoftKeyboardBehaviorMode02", true, 20251116, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "setSoftKeyboardBehaviorModeButton",emitKey);
      await Utils.waitForExist(() => isReturn, "emitSetSoftKeyboardBehaviorMode02" + '_returnCheck', true, 1000);
      done();
    })



  })
}


