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
import { Driver, ON, MouseButton } from '@ohos.UiTest';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
let emitKey = "";

const EVENT_ID_SET_SUITE_KEY = 133850;
const driver = Driver.create();

export default function OnWindowNewTest() {
  describe('OnWindowNewTest',  () =>{
    beforeAll(async  (done: Function) =>{
      let options: router.RouterOptions = {
        url: "MainAbility/pages/OnWindowNew"
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get OnWindowNew state success " + JSON.stringify(pages));
        if (!("OnWindowNew" == pages.name)) {
          console.info("get OnWindowNew state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push OnWindowNew page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push OnWindowNew page error: " + err);
      }
      await driver.waitForComponent(ON.id("WebOnWindowNewButton"),10000);
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
     * @tc.name   testAllowWindowOpenMethod
     * @tc.number testAllowWindowOpenMethod
     * @tc.desc   testAllowWindowOpenMethod
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAllowWindowOpenMethod',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async  (done: Function) =>{
      emitKey="emitonWindowNewMethod";
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY);
      let isReturn = false;
      Utils.registerEvent("testAllowWindowOpenMethod", "isAlertfalseisUserTriggerfalsetargetUrlhttps://www.example.com/", 20251126, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebOnWindowNewButton",emitKey);
      await Utils.waitForExist(() => isReturn, "testAllowWindowOpenMethod" + '_returnCheck', true, 1000);
      done();
    })

  })
}


