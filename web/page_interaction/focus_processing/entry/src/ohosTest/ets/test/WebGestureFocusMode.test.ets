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
// import router from '@system.router';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from "@kit.TestKit";

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
let emitKey = ""

const EVENT_ID_SET_SUITE_KEY = 178001;
let driver = Driver.create();

export default function webViewSrollableJsunit() {
  describe('WebGestureFocusModeTest',  () =>{
    beforeAll(async  (done: Function) =>{
      let options: router.RouterOptions = {
        url: "testability/pages/WebGestureFocusMode"
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebGestureFocusMode state success " + JSON.stringify(pages));
        if (!("WebGestureFocusMode" == pages.name)) {
          console.info("get WebGestureFocusMode state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push WebGestureFocusMode page success " + JSON.stringify(result));
          await driver.waitForComponent(ON.id("WebGestureFocusModeButton"), 10000);
        }
      } catch (err) {
        console.error("push WebGestureFocusMode page error: " + err);
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

    // afterEach(async  (done: Function) =>{
    //   console.info("blurMode afterEach start:"+emitKey);
    //   try {
    //     let backData: events_emitter.EventData = {
    //       data: {
    //         "ACTION": emitKey
    //       }
    //     }
    //     let backEvent: events_emitter.InnerEvent = {
    //       eventId:10,
    //       priority:events_emitter.EventPriority.LOW
    //     }
    //     console.info("start send emitKey");
    //     events_emitter.emit(backEvent, backData);
    //   } catch (err) {
    //     console.info("emit emitKey  err: " + JSON.stringify(err));
    //   }
    //   done();
    // })

    /*
    * @tc.number     : SUB_WEB_WEBGESTUREFOCUSMODE_0100
    * @tc.name       : testWebGestureFocusMode001
    * @tc.desc       : testWebGestureFocusMode001
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 0
    */
    it('testWebGestureFocusMode001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async  (done: Function) =>{
      Utils.emitEvent("testWebGestureFocusMode001", EVENT_ID_SET_SUITE_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebGestureFocusMode001", true, 178010, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebGestureFocusModeButton","testWebGestureFocusMode001");
      await Utils.waitForExist(() => isReturn, "testWebGestureFocusMode001" + '_returnCheck', true, 1000);
      done();
    })


    /*
    * @tc.number     : SUB_WEB_WEBGESTUREFOCUSMODE_0200
    * @tc.name       : testWebGestureFocusMode002
    * @tc.desc       : testWebGestureFocusMode002
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebGestureFocusMode002',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async  (done: Function) =>{
      Utils.emitEvent("testWebGestureFocusMode002", EVENT_ID_SET_SUITE_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebGestureFocusMode002", true, 178020,  () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebGestureFocusModeButton","testWebGestureFocusMode002");
      await Utils.waitForExist(() => isReturn, "testWebGestureFocusMode002" + '_returnCheck', true, 1000);
      done();
    })
    /*
    * @tc.number     : SUB_WEB_WEBGESTUREFOCUSMODE_0300
    * @tc.name       : testWebGestureFocusMode003
    * @tc.desc       : testWebGestureFocusMode003
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebGestureFocusMode003',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,async  (done: Function) =>{
      Utils.emitEvent("testWebGestureFocusMode003", EVENT_ID_SET_SUITE_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebGestureFocusMode003", true, 178030, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebGestureFocusModeButton", "testWebGestureFocusMode003");
      await Utils.waitForExist(() => isReturn, "testWebGestureFocusMode003" + '_returnCheck', true, 1000);
      done();
    })
  })
}

