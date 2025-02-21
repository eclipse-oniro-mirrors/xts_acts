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

import { describe, beforeEach, afterEach, it, expect, beforeAll } from "@ohos/hypium";
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
// import router from '@system.router';
import router from '@ohos.router';
let emitKey = "NestedScrollMode01";
export default function webViewSrollableJsunit() {
  describe('NestedScrollModeTest',  () =>{
    beforeAll(async  (done: Function) =>{
      let options: router.RouterOptions = {
        url: "MainAbility/pages/NestedScrollMode"
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get NestedScrollMode state success " + JSON.stringify(pages));
        if (!("NestedScrollMode" == pages.name)) {
          console.info("get NestedScrollMode state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push NestedScrollMode page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push NestedScrollModepage error: " + err);
      }
      done()
    });
    beforeEach(async  (done: Function) =>{
      await Utils.sleep(2000);
      console.info("NestedScrollMode beforeEach start");
      done();
    })
    afterEach(async  (done: Function) =>{
      console.info("NestedScrollMode afterEach start:"+emitKey);
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
     *tc.number SUB_ACE_BASIC_ETS_NESTEDSCROLLMODELEFT_API_001
     *tc.name NestedScrollMode01
     *tc.desic test NestedScrollMode01 interface when choose callback mode.
     */
    it('NestedScrollMode01',0,async (done: Function) =>{
      emitKey="NestedScrollMode02";
      Utils.registerEvent("NestedScrollMode01",true,20241129,done);
      sendEventByKey('NestedScrollModeTest',10,'');
    })

    /*
  *tc.number SUB_ACE_BASIC_ETS_NESTEDSCROLLMODERIGHT_API_002
  *tc.name NestedScrollMode02
  *tc.desic test NestedScrollMode02 interface when choose callback mode.
  */
    it('NestedScrollMode02',0,async (done: Function) =>{
      emitKey="NestedScrollMode03";
      Utils.registerEvent("NestedScrollMode02",true,20241130,done);
      sendEventByKey('NestedScrollModeTest',10,'');
    })

    /*
    *tc.number SUB_ACE_BASIC_ETS_NESTEDSCROLLMODETOP_API_003
    *tc.name NestedScrollMode03
    *tc.desic test NestedScrollMode03 interface when choose callback mode.
    */
    it('NestedScrollMode03',0,async (done: Function) =>{
      emitKey="NestedScrollMode04";
      Utils.registerEvent("NestedScrollMode03",true,20241131,done);
      sendEventByKey('NestedScrollModeTest',10,'');
    })

      /*
  *tc.number SUB_ACE_BASIC_ETS_NESTEDSCROLLMODEBOTTOM_API_004
  *tc.name NestedScrollMode04
  *tc.desic test NestedScrollMode04 interface when choose callback mode.
  */
    it('NestedScrollMode04',0,async (done: Function) =>{
      emitKey="NestedScrollMode04";
      Utils.registerEvent("NestedScrollMode04",true,20241132,done);
      sendEventByKey('NestedScrollModeTest',10,'');
    })

  })
}
