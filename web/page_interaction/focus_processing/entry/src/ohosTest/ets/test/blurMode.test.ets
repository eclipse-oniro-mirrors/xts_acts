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
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
let emitKey = "blurMode01";
export default function webViewSrollableJsunit() {
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
          await Utils.sleep(2000);
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
     *tc.number SUB_ACE_BASIC_ETS_BLURONKEYBOARDHIDEMODE_API_001
     *tc.name blurMode01
     *tc.desic test blurMode01 interface when choose callback mode.
     */
    it('blurMode01',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async  (done: Function) =>{
      emitKey="blurMode02";
      Utils.registerEvent("blurMode01",true,20241133,done);
      sendEventByKey('blurOnKeyboardHideMode01',10,'');
    })

    /*
   *tc.number SUB_ACE_BASIC_ETS_BLURONKEYBOARDHIDEMODE_API_002
   *tc.name blurMode02
   *tc.desic test blurMode02 interface when choose callback mode.
   */
    it('blurMode02',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async  (done: Function) =>{
      emitKey="blurMode02";
      Utils.registerEvent("blurMode02",true,20241134,done);
      sendEventByKey('blurOnKeyboardHideMode01',10,'');
    })

  })
}
