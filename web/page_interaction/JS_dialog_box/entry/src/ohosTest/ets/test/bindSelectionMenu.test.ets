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
let emitKey = "bindSelectionMenuType01";

const EVENT_ID_SET_SUITE_KEY = 177001;
let driver = Driver.create();

export default function webViewSrollableJsunit() {
  describe('bindSelectionMenuTest',  () =>{
    beforeAll(async  (done: Function) =>{
      let options: router.RouterOptions = {
        url: "testability/pages/bindSelectionMenu"
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get bindSelectionMenu state success " + JSON.stringify(pages));
        if (!("bindSelectionMenu" == pages.name)) {
          console.info("get bindSelectionMenu state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push bindSelectionMenu page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push bindSelectionMenu page error: " + err);
      }
      done()
    });
    beforeEach(async  (done: Function) =>{
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("bindSelectionMenu beforeEach start");
      try{
        await driver.waitForComponent(ON.id("webcomponentSelectionMenu"), 10000);
      }catch (err) {
        console.error("push bindSelectionMenu page error: " + err);
      }
      done();
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_BINDSELECTIONMENUTYPE_API_001
     *tc.name bindSelectionMenuType01
     *tc.desic test bindSelectionMenuType01 interface when choose callback mode.
     */
    it('bindSelectionMenuType01',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      Utils.emitEvent("bindSelectionMenuType01", EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent("bindSelectionMenuType01", true, 177010, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "webcomponentSelectionMenu", "bindSelectionMenuType01");
      await Utils.waitForExist(() => isReturn, "bindSelectionMenuType01" + '_returnCheck', true, 1000);
      done();
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_BINDSELECTIONMENUTYPE_API_002
     *tc.name bindSelectionMenuType02
     *tc.desic test bindSelectionMenuType02 interface when choose callback mode.
     */
    it('bindSelectionMenuType02',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async  (done: Function) =>{
      Utils.emitEvent("bindSelectionMenuType02", EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent("bindSelectionMenuType02", 1, 177020, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "webcomponentSelectionMenu", "bindSelectionMenuType02");
      await Utils.waitForExist(() => isReturn, "bindSelectionMenuType02" + '_returnCheck', true, 1000);
      done();
    })

  })
}
