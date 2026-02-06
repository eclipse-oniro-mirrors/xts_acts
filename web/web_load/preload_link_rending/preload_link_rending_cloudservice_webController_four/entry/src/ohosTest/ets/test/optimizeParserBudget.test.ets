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

import { describe, beforeEach, it, beforeAll, TestType, Size, Level } from "@ohos/hypium";
import Utils from './Utils';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const EVENT_ID_SET_EMIT_KEY = 201250;
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webenableSmoothDragResizeTestJsunit() {
  describe('optimizeParserBudgetTest',  () =>{
    beforeAll(async  (done: Function) =>{
      let options: router.RouterOptions = {
        url: "testability/pages/optimizeParserBudget"
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get optimizeParserBudget state success " + JSON.stringify(pages));
        if (!("optimizeParserBudget" == pages.name)) {
          console.info("get optimizeParserBudget state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push optimizeParserBudget page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push optimizeParserBudget page error: " + err);
      }
      await driver.waitForComponent(ON.id("optimizeParserBudgetButton"), 10000);
      console.log("waitForComponent optimizeParserBudgetButton");
      done()
    });

    beforeEach(async  (done: Function) =>{
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("optimizeParserBudget beforeEach start");
      done();
    })

    /**
     * @tc.name   optimizeParserBudget01
     * @tc.number SUB_ACE_BASIC_ETS_ENABLESMOOTHDRAGRESIZE_API_001
     * @tc.desc   optimizeParserBudget01
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('optimizeParserBudget01',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      Utils.emitEvent("optimizeParserBudget01", EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("optimizeParserBudget01", "optimizeParserBudget", 201260, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "optimizeParserBudgetButton");
      if (await Utils.waitForExist(() => isReturn, 'optimizeParserBudget01' + '_returnCheck', true, 1000)) {
        done();
      }
    })
  })
}