/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import { afterEach, beforeAll, beforeEach, describe, it } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import router from '@ohos.router';
import Utils from './Utils';

let emitKey = "emitOverviewModeAccessTrue";

export default function webTwoJsunit() {
  describe('overviewTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/webTwo',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webTwo state success " + JSON.stringify(pages));
        if (!("webTwo" == pages.name)) {
          console.info("get webTwo state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push webTwo page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webTwo page error: " + err);
      }
      done();
    });
    beforeEach(async (done: Function) => {
      await Utils.sleep(2000);
      console.info("web beforeEach start");
      done();
    })
    afterEach(async (done: Function) => {
      console.info("web afterEach start:" + emitKey);
      try {
        let backData: events_emitter.EventData = {
          data: {
            "ACTION": emitKey
          }
        }
        let backEvent: events_emitter.InnerEvent = {
          eventId: 10,
          priority: events_emitter.EventPriority.LOW
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
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV02_API_001                                                                                                                                                                     
     *tc.name overviewModeAccessTrue                                                                                                                                                                                                                 
     *tc.desic Sets allow the Web access overview mode
     */
    it('overviewModeAccessTrue', 0, async (done: Function) => {
      emitKey = "emitOverviewModeAccessFalse";
      Utils.registerLargerEvent("overviewModeAccessTrue", 168, done);
      sendEventByKey('webcomponenttwo', 10, '');
    })

    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV02_API_002                      
     *tc.name overviewModeAccessFalse                                                                                                                                                                                                                 
     *tc.desic Sets not allow the Web access overview mode
     */
    it('overviewModeAccessFalse', 0, async (done: Function) => {
      emitKey = "emitOverviewModeAccessFalse";
      Utils.registerLargerEvent("overviewModeAccessFalse", 170, done);
      sendEventByKey('webcomponenttwo', 10, '');
    })
  })
}