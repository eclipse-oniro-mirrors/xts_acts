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
let emitKey = "NestedScrollMode01";

const EVENT_ID_SET_SUITE_KEY = 179001;
let driver: Driver = Driver.create();

export default function webViewSrollableJsunit() {
  describe('NestedScrollModeTest',  () =>{
    beforeAll(async  (done: Function) =>{
      let options: router.RouterOptions = {
        url: "testability/pages/NestedScrollMode"
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get NestedScrollMode state success " + JSON.stringify(pages));
        if (!("NestedScrollMode" == pages.name)) {
          console.info("get NestedScrollMode state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await driver.waitForComponent(ON.id("NestedScrollModeTest"), 10000);
          console.info("push NestedScrollMode page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push NestedScrollModepage error: " + err);
      }
      done()
    });
    beforeEach(async  (done: Function) =>{
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("NestedScrollMode beforeEach start");
      done();
    })
    /**
     * @tc.name   NestedScrollMode01
     * @tc.number SUB_ACE_BASIC_ETS_NESTEDSCROLLMODELEFT_API_001
     * @tc.desc   NestedScrollMode01
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('NestedScrollMode01',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      Utils.emitEvent("NestedScrollMode01", EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent("NestedScrollMode01", true, 179010, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "NestedScrollModeTest", "NestedScrollMode01");
      await Utils.waitForExist(() => isReturn, "NestedScrollMode01" + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   NestedScrollMode02
     * @tc.number SUB_ACE_BASIC_ETS_NESTEDSCROLLMODERIGHT_API_002
     * @tc.desc   NestedScrollMode02
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('NestedScrollMode02',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      Utils.emitEvent("NestedScrollMode02", EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent("NestedScrollMode02", true, 179020, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "NestedScrollModeTest", "NestedScrollMode01");
      await Utils.waitForExist(() => isReturn, "NestedScrollMode01" + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   NestedScrollMode03
     * @tc.number SUB_ACE_BASIC_ETS_NESTEDSCROLLMODETOP_API_003
     * @tc.desc   NestedScrollMode03
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('NestedScrollMode03',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      Utils.emitEvent("NestedScrollMode03", EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent("NestedScrollMode03", true, 179030, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "NestedScrollModeTest", "NestedScrollMode03");
      await Utils.waitForExist(() => isReturn, "NestedScrollMode03" + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   NestedScrollMode04
     * @tc.number SUB_ACE_BASIC_ETS_NESTEDSCROLLMODEBOTTOM_API_004
     * @tc.desc   NestedScrollMode04
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('NestedScrollMode04',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      Utils.emitEvent("NestedScrollMode04", EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent("NestedScrollMode04", true, 179040, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "NestedScrollModeTest", "NestedScrollMode04");
      await Utils.waitForExist(() => isReturn, "NestedScrollMode04" + '_returnCheck', true, 1000);
      done();
    })

  })
}
