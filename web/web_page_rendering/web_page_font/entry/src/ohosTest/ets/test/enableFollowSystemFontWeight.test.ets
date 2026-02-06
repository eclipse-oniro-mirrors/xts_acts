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
import { Driver, ON } from '@kit.TestKit';

const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
let emitKey = "enableFollowSystemFontWeight01";
export default function webenableFollowSystemFontWeightJsunit() {
  describe('enableFollowSystemFontWeightTest',  () =>{
    beforeAll(async  (done: Function) =>{
      let options: router.RouterOptions = {
        url: "MainAbility/pages/enableFollowSystemFontWeight"
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get enableFollowSystemFontWeight state success " + JSON.stringify(pages));
        if (!("enableFollowSystemFontWeight" == pages.name)) {
          console.info("get enableFollowSystemFontWeight state success " + JSON.stringify(pages.name));
          let result = await router.push(options);

          console.info("push enableFollowSystemFontWeight page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push enableFollowSystemFontWeight page error: " + err);
      }
      await driver.waitForComponent(ON.id("enableFollowSystemFontWeightButton"), 10000);
      console.log("waitForComponent enableFollowSystemFontWeightButton");
      done()
    });
    beforeEach(async  (done: Function) =>{
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("enableFollowSystemFontWeight beforeEach start");
      done();
    })
   
    /*
     *tc.number SUB_ACE_BASIC_ETS_ENABLESMOOTHDRAGRESIZE_API_001
     *tc.name enableSmoothDragResize01
     *tc.desic test enableSmoothDragResize01 interface when choose callback mode.
     */
    it('enableFollowSystemFontWeight01',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey="enableFollowSystemFontWeight01";
      Utils.emitEvent(emitKey, 150000)
      Utils.registerEvent("enableFollowSystemFontWeight01",'enableFollowSystemFontWeight',150010,done);
      let component = await driver.findComponent(ON.id("enableFollowSystemFontWeightButton"));
      await component.click();
    })
  })
}