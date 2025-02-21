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
// @ts-nocheck
import { describe, beforeEach, afterEach, it, expect, beforeAll} from "@ohos/hypium";
import events_emitter from '@ohos.events.emitter';
import router from '@system.router';
import Utils from './Utils.ets';
let emitKey = "emitOnConsole";
export default function webTwoJsunit() {
  describe('overviewTest', function () {
    beforeAll(async function (done) {
      let options = {
        uri: 'MainAbility/pages/webTwo',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webTwo state success " + JSON.stringify(pages));
        if (!("webTwo" == pages.name)) {
          console.info("get webTwo state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push webTwo page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webTwo page error: " + err);
      }
      done()
    });
    beforeEach(async function (done) {
      await Utils.sleep(2000);
      console.info("web beforeEach start");
      done();
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
     *tc.number SUB_ACE_BASIC_ETS_API_076                                                                                                                                                                  
     *tc.name getLineNumber                                                                                                                                                                                                              
     *tc.desic return the number of console message lines
     */
    it('getLineNumber',0,async function(done){
      emitKey="emitOnConsole";
      Utils.registerEvent("getLineNumber","51",420,done);
      sendEventByKey('webcomponenttwo',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_077                                                                                                                                                                  
     *tc.name getSourceId                                                                                                                                                                                                              
     *tc.desic return the source url
     */
    it('getSourceId',0,async function(done){
      emitKey="emitGetSourceId";
      Utils.registerEvent("getSourceId","file:///data/storage/el1/bundle/phone/resources/rawfile/index.html",422,done);
      sendEventByKey('webcomponenttwo',10,'');
    })
  })
}