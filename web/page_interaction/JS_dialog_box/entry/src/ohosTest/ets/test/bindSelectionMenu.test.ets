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
import Utils from './UtilsTwo';
// import router from '@system.router';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
let emitKey = "bindSelectionMenuType01";
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
          await Utils.sleep(2000);
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
      await Utils.sleep(2000);
      console.info("bindSelectionMenu beforeEach start");
      done();
    })
    afterEach(async  (done: Function) =>{
      console.info("bindSelectionMenu afterEach start:"+emitKey);
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
     *tc.number SUB_ACE_BASIC_ETS_BINDSELECTIONMENUTYPE_API_001
     *tc.name bindSelectionMenuType01
     *tc.desic test bindSelectionMenuType01 interface when choose callback mode.
     */
    it('bindSelectionMenuType01',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      emitKey="bindSelectionMenuType02";
      Utils.registerEvent("bindSelectionMenuType01",true,8301,done);
      sendEventByKey('webcomponentSelectionMenu',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_BINDSELECTIONMENUTYPE_API_002
     *tc.name bindSelectionMenuType02
     *tc.desic test bindSelectionMenuType02 interface when choose callback mode.
     */
    it('bindSelectionMenuType02',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async  (done: Function) =>{
      emitKey="bindSelectionMenuType02";
      Utils.registerEvent("bindSelectionMenuType02",1,8302,done);
      sendEventByKey('webcomponentSelectionMenu',10,'');
    })

  })
}
