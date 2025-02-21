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
import { describe, beforeEach, afterEach, it, expect } from "@ohos/hypium";
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils.ets';
let emitKey = "emitPostMessageInitErr";
export default function webViewContMessageError() {
  describe('ActsAceWebDevWebViewContMessageErrorTest', function () {
    beforeEach(async function (done) {
      await Utils.sleep(2000);
      console.info("webViewContMessageError beforeEach start");
      done();
    })
    afterEach(async function (done) {
      console.info("webViewContMessageError afterEach start:"+emitKey);
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
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWCONTMESSAGEERROR_0100
     *tc.name testPostMessageInitErr
     *tc.desc test interface of postMessage with not been associated with specific Web Components
     */
    it('testPostMessageInitErr',0,async function(done){
      emitKey="emitPostMessageEventUnPortErr";
      Utils.registerEvent("testPostMessageInitErr","17100001",600,done);
      Utils.registerEvent("testPostMessageInitErr","Init error. The WebviewController must be associated with a Web component",601,done);
      sendEventByKey('webViewContMessageError',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWCONTMESSAGEERROR_0200
     *tc.name testPostMessageEventPortClose
     *tc.desc test interface of postMessageEvent with WebMessagePort been closed by ets
     */
    it('testPostMessageEventPortClose',0,async function(done){
      emitKey="emitPostMessageEventUnPortErr";
      Utils.registerEvent("testPostMessageEventPortClose","17100010",602,done);
      Utils.registerEvent("testPostMessageEventPortClose","Can not post message using this port",603,done);
      sendEventByKey('webViewContMessageError',10,'');
    })
  })
}