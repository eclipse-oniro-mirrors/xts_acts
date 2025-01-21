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
import { describe, beforeEach, afterEach, it, expect } from "@ohos/hypium";
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils.ets';
let emitKey = "emitOnLoadIntercept";
export default function webJsunit() {
  describe('ActsAceWebDevTest', function () {
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
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_FOUR_API_001
     *tc.name OnLoadIntercept                                                                                                                                                                                                                     *tc.desic Injects the JavaScript object into window and invoke the function in window
     */
    it('OnLoadIntercept',0,async function(done){
      emitKey="emitOnControllerAttached";
      Utils.registerEvent("OnLoadIntercept","https://www.baidu.com/",2,done);
      sendEventByKey('webcomponent',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_FOUR_API_002
     *tc.name OnControllerAttached                                                                                                                                                                                                                     *tc.desic Injects the JavaScript object into window and invoke the function in window
     */
    it('OnControllerAttached',0,async function(done){
      emitKey="emitOnControllerAttached";
      Utils.registerEvent("OnControllerAttached",1,7,done);
      sendEventByKey('webcomponent',10,'');
    })
  })
}
