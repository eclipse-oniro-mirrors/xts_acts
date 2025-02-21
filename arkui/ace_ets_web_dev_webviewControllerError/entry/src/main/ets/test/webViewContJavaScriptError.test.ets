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

let emitKey = "emitRegisterJavaScriptProxyInitErr";
export default function webViewContJavaScriptError() {
  describe('ActsAceWebDevWebViewContJavaScriptErrorTest', function () {
    beforeAll(async function (done) {
      let options = {
        uri: 'MainAbility/pages/webViewContJavaScriptError',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webViewContJavaScriptError state success " + JSON.stringify(pages));
        if (!("webViewContJavaScriptError" == pages.name)) {
          console.info("get webViewContJavaScriptError state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push webViewContJavaScriptError page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webViewContJavaScriptError page error: " + err);
      }
      done()
    });
    beforeEach(async function (done) {
      await Utils.sleep(2000);
      console.info("webViewContJavaScriptError beforeEach start");
      done();
    })
    afterEach(async function (done) {
      console.info("webViewContJavaScriptError afterEach start:"+emitKey);
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
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_2600
     *tc.name testRegisterJavaScriptProxyInitErr
     *tc.desc test interface of registerJavaScriptProxy with not been associated with specific Web Components
     */
    it('testRegisterJavaScriptProxyInitErr',0,async function(done){
      emitKey="emitRunJavaScriptCallbackInitErr";
      Utils.registerEvent("testRegisterJavaScriptProxyInitErr","17100001",650,done);
      Utils.registerEvent("testRegisterJavaScriptProxyInitErr","Init error. The WebviewController must be associated with a Web component",651,done);
      sendEventByKey('webViewContJavaScriptError',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_2700
     *tc.name testRunJavaScriptCallbackInitErr
     *tc.desc test interface of runJavaScript (callback) with not been associated with specific Web Components
     */
    it('testRunJavaScriptCallbackInitErr',0,async function(done){
      emitKey="emitRunJavaScriptPromiseInitErr";
      Utils.registerEvent("testRunJavaScriptCallbackInitErr","17100001",652,done);
      Utils.registerEvent("testRunJavaScriptCallbackInitErr","Init error. The WebviewController must be associated with a Web component",653,done);
      sendEventByKey('webViewContJavaScriptError',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_2800
     *tc.name testRunJavaScriptPromiseInitErr
     *tc.desc test interface of runJavaScript (promise) with not been associated with specific Web Components
     */
    it('testRunJavaScriptPromiseInitErr',0,async function(done){
      emitKey="emitRunJavaScriptExtCallbackInitErr";
      Utils.registerEvent("testRunJavaScriptPromiseInitErr","17100001",654,done);
      Utils.registerEvent("testRunJavaScriptPromiseInitErr","Init error. The WebviewController must be associated with a Web component",655,done);
      sendEventByKey('webViewContJavaScriptError',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_2900
     *tc.name testRunJavaScriptExtCallbackInitErr
     *tc.desc test interface of runJavaScriptExt (callback) with not been associated with specific Web Components
     */
    it('testRunJavaScriptExtCallbackInitErr',0,async function(done){
      emitKey="emitRunJavaScriptExtPromiseInitErr";
      Utils.registerEvent("testRunJavaScriptExtCallbackInitErr","17100001",656,done);
      Utils.registerEvent("testRunJavaScriptExtCallbackInitErr","Init error. The WebviewController must be associated with a Web component",657,done);
      sendEventByKey('webViewContJavaScriptError',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_3000
     *tc.name testRunJavaScriptExtPromiseInitErr
     *tc.desc test interface of runJavaScriptExt (promise) with not been associated with specific Web Components
     */
    it('testRunJavaScriptExtPromiseInitErr',0,async function(done){
      emitKey="emitDeleteJavaScriptRegisterInitErr";
      Utils.registerEvent("testRunJavaScriptExtPromiseInitErr","17100001",658,done);
      Utils.registerEvent("testRunJavaScriptExtPromiseInitErr","Init error. The WebviewController must be associated with a Web component",659,done);
      sendEventByKey('webViewContJavaScriptError',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_3100
     *tc.name testDeleteJavaScriptRegisterInitErr
     *tc.desc test interface of deleteJavaScriptRegister with not been associated with specific Web Components
     */
    it('testDeleteJavaScriptRegisterInitErr',0,async function(done){
      emitKey="emitDeleteJavaScriptRegisterNameErr";
      Utils.registerEvent("testDeleteJavaScriptRegisterInitErr","17100001",660,done);
      Utils.registerEvent("testDeleteJavaScriptRegisterInitErr","Init error. The WebviewController must be associated with a Web component",661,done);
      sendEventByKey('webViewContJavaScriptError',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_3200
     *tc.name testDeleteJavaScriptRegisterNameErr
     *tc.desc test interface of deleteJavaScriptRegister with not been registered name
     */
    it('testDeleteJavaScriptRegisterNameErr',0,async function(done){
      emitKey="emitDeleteJavaScriptRegisterNameErr";
      Utils.registerEvent("testDeleteJavaScriptRegisterNameErr","17100008",662,done);
      Utils.registerEvent("testDeleteJavaScriptRegisterNameErr","Cannot delete JavaScriptProxy.",663,done);
      sendEventByKey('webViewContJavaScriptError',10,'');
    })
  })
}