/**
 * Copyright (c) 2023 iSoftStone Information Technology (Group) Co.,Ltd.
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
import {describe, beforeEach, afterEach, it, expect, beforeAll} from "@ohos/hypium";
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils.ets';
import router from '@system.router';
// @ts-nocheck
let emitKey = "emitOnBeforeUnloadWebC";
export default function webOnBeforeUnload() {
  describe('ActsAceWebDevWebOnBeforeUnloadTest', function () {
    beforeEach(async function (done) {
      await Utils.sleep(2000);
      console.info("webOnBeforeUnload beforeEach start");
      done();
    })
    afterEach(async function (done) {
      console.info("webOnBeforeUnload afterEach start:" + emitKey);
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
     *tc.number SUB_ACE_BASIC_ETS_WEB_API_0100
     *tc.name testOnBeforeUnloadWebC
     *tc.desc onBeforeUnload after page refresh
     */
    it('testOnBeforeUnloadWebC',0,async function(done){
      emitKey="emitOnBeforeUnloadAgainWebC";
      Utils.registerEvent("testOnBeforeUnloadWebC","Is it OK to leave/reload this page?",402,done);
      sendEventByKey('webOnBeforeUnload',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_API_0200
     *tc.name testOnBeforeUnloadAgainWebC
     *tc.desc onBeforeUnload after page loadUrl new
     */
    it('testOnBeforeUnloadAgainWebC',0,async function(done){
      emitKey="emitOnBeforeUnloadAgainWebC";
      Utils.registerEvent("testOnBeforeUnloadAgainWebC","Is it OK to leave/reload this page?",404,done);
      sendEventByKey('webOnBeforeUnload',10,'');
    })
  })
}