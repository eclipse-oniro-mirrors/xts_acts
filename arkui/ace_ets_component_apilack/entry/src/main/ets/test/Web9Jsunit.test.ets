/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { describe, beforeEach, afterEach, it, expect } from "@ohos/hypium";
import events_emitter from '@ohos.events.emitter';
import router from '@system.router';
import Utils from './Utils.ets';
let emitKey = "emitUserAgent";
export default function web9Jsunit() {

  describe('web9Jsunit', function () {
    beforeEach(async function (done) {
      let options = {
        uri: 'MainAbility/pages/web_api_9',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get web9Jsunit state success " + JSON.stringify(pages));
        if (!("AlphabetIndexer" == pages.name)) {
          console.info("get web9Jsunit state success " + JSON.stringify(pages.name));
          let result = await router.push(options)
          console.info("push web9Jsunit page success " + JSON.stringify(result));
        }
      } catch (err) {
         console.error("push web9Jsunit page error " + JSON.stringify(err));
      }
      await Utils.sleep(2000);
      console.info("web beforeEach start");
      done()

    })
    afterEach(async function (done) {
      console.info("web afterEach start:"+emitKey);
      try {
            let backData = {
                data: {
                    "ACTION": emitKey
                }
            }
            let backEvent = {
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
     * tc.number SUB_ACE_BASIC_ETS_API_0001
     * tc.name WebContextMenuResult
     * tc.desic webContextMenuResult
     */
    it('webContextMenuResultTest001',0,async function(done){
      emitKey="emitwebContextMenuResult";
      Utils.registerContainEvent("webContextMenuResult",true,1101,done);
    })

    /*
     * tc.number SUB_ACE_BASIC_ETS_API_0002
     * tc.name  HitTestValue
     * tc.desic webContextMenuResult
     */
    it('setWebControllerTest002',0,async function(done){
      emitKey="emitsetWebController";
      Utils.registerContainEvent("setWebController",true,1102,done);
    })

    /*
    * tc.number SUB_ACE_BASIC_ETS_API_0002
    * tc.name  HitTestValue
    * tc.desic webContextMenuResult
    */
    it('setWebControllerTest003',0,async function(done){
      emitKey="emitHitTestValue";
      Utils.registerContainEvent("HitTestValue",true,1103,done);
      sendEventByKey('web2',10,'');
    })




  })
}
