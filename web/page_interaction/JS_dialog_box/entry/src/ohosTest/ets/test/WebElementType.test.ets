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
let emitKey = "WebElementType01";
export default function WebElementTypeJsunit() {
  describe('WebElementTypeTest',  () =>{
    beforeAll(async  (done: Function) =>{
      let options: router.RouterOptions = {
        url: "testability/pages/WebElementType"
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebElementType state success " + JSON.stringify(pages));
        if (!("WebElementType" == pages.name)) {
          console.info("get WebElementType state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push WebElementType page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebElementType page error: " + err);
      }
      done()
    });
    beforeEach(async  (done: Function) =>{
      await Utils.sleep(2000);
      console.info("WebElementType beforeEach start");
      done();
    })
    afterEach(async  (done: Function) =>{
      console.info("WebElementType afterEach start:"+emitKey);
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
  * @tc.number      : SUB_WEB_WEBELEMENTTYPE_0100
  * @tc.name        : WebElementType01
  * @tc.desc        : WebElementType01
  * @tc.size        : MediumTest
  * @tc.type        : Function
  * @tc.level       : Level 1
  */
    it('WebElementType01',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey="WebElementType01";
      Utils.registerEvent("WebElementType01",'WebElementType',20250609,done);
      sendEventByKey('WebElementTypeButton',10,'');
    })


  })
}
