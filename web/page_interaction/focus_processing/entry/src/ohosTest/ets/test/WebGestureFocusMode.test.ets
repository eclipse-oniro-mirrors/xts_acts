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
import { Driver, ON, MouseButton } from '@ohos.UiTest';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
let emitKey = ""
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
          await Utils.sleep(2000);
          console.info("push WebGestureFocusMode page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebGestureFocusMode page error: " + err);
      }
      let driver: Driver = Driver.create();
      await driver.waitForComponent(ON.id("WebGestureFocusModeButton"),10000);
      done()
    });
    beforeEach(async  (done: Function) =>{
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      await Utils.sleep(2000);
      console.info("blurMode beforeEach start");
      done();
    })
    afterEach(async  (done: Function) =>{
      console.info("blurMode afterEach start:"+emitKey);
      try {
        let backData: events_emitter.EventData = {
          data: {
            "ACTION": emitKey
          }
        }
        let backEvent: events_emitter.InnerEvent = {
          eventId:10,
          priority:events_emitter.EventPriority.LOW
        }
        console.info("start send emitKey");
        events_emitter.emit(backEvent, backData);
      } catch (err) {
        console.info("emit emitKey  err: " + JSON.stringify(err));
      }
      await Utils.sleep(2000);
      done();
    })

    /*
    * @tc.number     : SUB_WEB_WEBGESTUREFOCUSMODE_0100
    * @tc.name       : testWebGestureFocusMode001
    * @tc.desc       : testWebGestureFocusMode001
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 0
    */
    it('testWebGestureFocusMode001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async  (done: Function) =>{
      emitKey="testWebGestureFocusMode001";
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebGestureFocusMode001",true,20250722,done);
      sendEventByKey('WebGestureFocusModeButton',10,'');
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
      emitKey="testWebGestureFocusMode002";
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebGestureFocusMode002",true,20250723,done);
      sendEventByKey('WebGestureFocusModeButton',10,'');
    })
 })
}

