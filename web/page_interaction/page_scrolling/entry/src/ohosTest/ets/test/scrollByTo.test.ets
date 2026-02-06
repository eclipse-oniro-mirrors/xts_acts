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
let emitKey = "scroll01";

const EVENT_ID_SET_SUITE_KEY = 179101;
let driver: Driver = Driver.create();

export default function webViewSrollableJsunit() {
  describe('scrollByToTest',  () =>{
    beforeAll(async  (done: Function) =>{
      let options: router.RouterOptions = {
        url: "testability/pages/scrollByTo"
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get scroll state success " + JSON.stringify(pages));
        if (!("scrollByTo" == pages.name)) {
          console.info("get scroll state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await driver.waitForComponent(ON.id("scrollByToButton"), 10000);
          console.info("push scroll page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push scroll page error: " + err);
      }

      done()
    });
    beforeEach(async  (done: Function) =>{
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("scroll beforeEach start");
      done();
    })

    /**
     * @tc.name   scrollByTo01
     * @tc.number SUB_SCTOLL_BY_TO__API_001
     * @tc.desc   scrollByTo01
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('scrollByTo01',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async  (done: Function) =>{
      Utils.emitEvent("scrollByTo01", EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent("scrollByTo01", 0, 179110, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "scrollByToButton", "scrollByTo01");
      await Utils.waitForExist(() => isReturn, "scrollByTo01" + '_returnCheck', true, 1000);
      done();
    })



  })
}
