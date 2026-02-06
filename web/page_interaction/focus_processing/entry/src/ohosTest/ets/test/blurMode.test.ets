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

import { describe, beforeEach, afterEach, it, expect, beforeAll , TestType, Size, Level } from "@ohos/hypium";
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
// import router from '@system.router';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from "@kit.TestKit";

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
let emitKey = "";

const EVENT_ID_SET_SUITE_KEY = 178201;
const driver = Driver.create();

export default function blurModeTest() {
  describe('blurOnKeyboardHideModeTest',  () =>{
    beforeAll(async  (done: Function) =>{
      let options: router.RouterOptions = {
        url: "testability/pages/blurMode"
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get blurOnKeyboardHideMode state success " + JSON.stringify(pages));
        if (!("blurMode" == pages.name)) {
          console.info("get blurMode state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push blurMode page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push blurMode page error: " + err);
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
      await driver.waitForComponent(ON.id("blurOnKeyboardHideMode01"), 10000);
      done();
    })

    /*
     *tc.number SUB_ACE_BASIC_ETS_BLURONKEYBOARDHIDEMODE_API_001
     *tc.name blurMode01
     *tc.desic test blurMode01 interface when choose callback mode.
     */
    it('blurMode01',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async  (done: Function) =>{
      emitKey="blurMode01";
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY);
      let isReturn = false;
      Utils.registerEvent("blurMode01", true, 178210, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "blurOnKeyboardHideMode01",emitKey);
      await Utils.waitForExist(() => isReturn, "blurMode01" + '_returnCheck', true, 1000);
      done();
    })

    /*
   *tc.number SUB_ACE_BASIC_ETS_BLURONKEYBOARDHIDEMODE_API_002
   *tc.name blurMode02
   *tc.desic test blurMode02 interface when choose callback mode.
   */
    it('blurMode02',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async  (done: Function) =>{
      emitKey="blurMode02";
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY);
      let isReturn = false;
      Utils.registerEvent("blurMode02", true, 178220, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "blurOnKeyboardHideMode01",emitKey);
      await Utils.waitForExist(() => isReturn, "blurMode02" + '_returnCheck', true, 1000);
      done();
    })

  })
}
