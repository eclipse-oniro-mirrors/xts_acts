/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from "@kit.TestKit";
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
const EVENT_ID_SET_SUITE_KEY = 177008;
let driver = Driver.create();

export default function SaveImageMenuJsunit() {
  describe('SaveImageMenuTest',  () =>{
    beforeAll(async  (done: Function) =>{
      let options: router.RouterOptions = {
        url: "testability/pages/SaveImageMenu"
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get bindSelectionMenu state success " + JSON.stringify(pages));
        if (!("SaveImageMenu" == pages.name)) {
          console.info("get SaveImageMenu state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push SaveImageMenu page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SaveImageMenu page error: " + err);
      }
      done()
    });
    beforeEach(async  (done: Function) =>{
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("SaveImageMenu beforeEach start");
      try{
        await driver.waitForComponent(ON.id("webSaveImageMenu"), 10000);
      }catch (err) {
        console.error("push SaveImageMenu page error: " + err);
      }
      done();
    })
    /**
     * @tc.name   SaveImageMenu01
     * @tc.number SUB_ACE_BASIC_ETS_SAVE IMAGE_API_001
     * @tc.desc   saveImage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SaveImageMenu01',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      Utils.emitEvent("SaveImageMenu01", EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent("SaveImageMenu01","image", 20230319, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "webSaveImageMenu", "SaveImageMenu01");
      await Utils.waitForExist(() => isReturn, "SaveImageMenu01" + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   SaveImageMenu02
     * @tc.number SUB_ACE_BASIC_ETS_SAVE IMAGE_API_002
     * @tc.desc   saveImage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SaveImageMenu02',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      Utils.emitEvent("SaveImageMenu02", EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent("SaveImageMenu02","onLineImage", 20230320, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "webSaveImageMenu", "SaveImageMenu02");
      await Utils.waitForExist(() => isReturn, "SaveImageMenu02" + '_returnCheck', true, 1000);
      done();
    })


    /**
     * @tc.name   SaveImageMenu03
     * @tc.number SUB_ACE_BASIC_ETS_SAVE IMAGE_API_003
     * @tc.desc   saveImage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SaveImageMenu03',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      Utils.emitEvent("SaveImageMenu03", EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent("SaveImageMenu03","canvas", 20230321, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "webSaveImageMenu", "SaveImageMenu03");
      await Utils.waitForExist(() => isReturn, "SaveImageMenu03" + '_returnCheck', true, 1000);
      done();
    })

  })
}
