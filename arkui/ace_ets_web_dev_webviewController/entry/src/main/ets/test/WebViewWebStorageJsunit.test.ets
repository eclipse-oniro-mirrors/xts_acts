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
import router from '@system.router';
let emitKey = 'emitGetOriginsCallbackLoadWebkit';
export default function WebViewWebStorageJsunit() {
  describe('actsAceWebViewWebStorageJsunit', function () {
    beforeEach(async function (done) {
      let options = {
        uri: "MainAbility/pages/webStorage"
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webStorage state success " + JSON.stringify(pages));
        if (!("webStorage" == pages.name)) {
          console.info("get webStorage state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push webStorage page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webStorage page error: " + err);
      }
      await Utils.sleep(2000);
      done()
    })
    afterEach(async function (done) {
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
    *tc.number SUB_ACE_BASIC_ETS_API_GETORIGINS_0100
    *tc.name testGetOriginsCallbackLoadWebkit01
    *tc.desc test api getOrigins callback mode by checking the value 0f Origins[0].origin when load website which
    * address is 'https://webkit.org/demos/sticky-notes/index.html'
    */
    it('testGetOriginsCallbackLoadWebkit01', 0, async function(done){
      emitKey = 'emitGetOriginsCallbackLoadWebkit02';
      let origin = 'https://webkit.org/';
      Utils.registerEvent("testGetOriginsCallbackLoadWebkit01", origin, 7136, done);
      sendEventByKey('webStorage',10,'');
    })
    /*
    *tc.number SUB_ACE_BASIC_ETS_API_GETORIGINS_0200
    *tc.name testGetOriginsCallbackLoadWebkit02
    *tc.desc test api getOrigins callback mode by checking the value 0f  Origins[0].usage when load website which
    * address is 'https://webkit.org/demos/sticky-notes/index.html'
    */
    it('testGetOriginsCallbackLoadWebkit02', 0, async function(done){
      emitKey = 'emitGetOriginsCallbackLoadWebkit03';
      let usage = 24576;
      Utils.registerEvent("testGetOriginsCallbackLoadWebkit02", usage, 7138, done);
      sendEventByKey('webStorage',10,'');
    })
    /*
    *tc.number SUB_ACE_BASIC_ETS_API_GETORIGINS_0300
    *tc.name testGetOriginsCallbackLoadWebkit03
    *tc.desc test api getOrigins callback mode by the value 0f checking Origins[0].quote when load website which
    * address is 'https://webkit.org/demos/sticky-notes/index.html'
    */
    it('testGetOriginsCallbackLoadWebkit03', 0, async function(done){
      emitKey = 'emitGetOriginsPromiseLoadWebkit01';
      Utils.registerLargerEvent("testGetOriginsCallbackLoadWebkit03", 7140, done);
      sendEventByKey('webStorage',10,'');
    })
    /*
    *tc.number SUB_ACE_BASIC_ETS_API_GETORIGINS_0400
    *tc.name testGetOriginsPromiseLoadWebkit01
    *tc.desc test api getOrigins promise mode by checking the value 0f Origins[0].origin when load website which address
    * is 'https://webkit.org/demos/sticky-notes/index.html'
    */
    it('testGetOriginsPromiseLoadWebkit01', 0, async function(done){
      emitKey = 'emitGetOriginsPromiseLoadWebkit02';
      let origin = 'https://webkit.org/';
      Utils.registerEvent("testGetOriginsPromiseLoadWebkit01", origin, 7142, done);
      sendEventByKey('webStorage',10,'');
    })
    /*
    *tc.number SUB_ACE_BASIC_ETS_API_GETORIGINS_0500
    *tc.name testGetOriginsPromiseLoadWebkit02
    *tc.desc test api getOrigins promise mode by checking the value 0f  Origins[0].usage when load website which address
    * is 'https://webkit.org/demos/sticky-notes/index.html'
    */
    it('testGetOriginsPromiseLoadWebkit02', 0, async function(done){
      emitKey = 'emitGetOriginsPromiseLoadWebkit03';
      let usage = 24576;
      Utils.registerEvent("testGetOriginsPromiseLoadWebkit02", usage, 7144, done);
      sendEventByKey('webStorage',10,'');
    })
    /*
    *tc.number SUB_ACE_BASIC_ETS_API_GETORIGINS_0600
    *tc.name testGetOriginsPromiseLoadWebkit03
    *tc.desc test api getOrigins promise mode by the value 0f checking Origins[0].quote when load website which address
    * is 'https://webkit.org/demos/sticky-notes/index.html'
    */
    it('testGetOriginsPromiseLoadWebkit03', 0, async function(done){
      emitKey = 'emitGetOriginsCallbackLoadBaidu01';
      Utils.registerLargerEvent("testGetOriginsPromiseLoadWebkit03", 7146, done);
      sendEventByKey('webStorage',10,'');
    })
    /*
    *tc.number SUB_ACE_BASIC_ETS_API_GETORIGINS_0700
    *tc.name testGetOriginsCallbackLoadBaidu01
    *tc.desc test api getOrigins callback mode by checking the length of origins when load website which address
    * is 'https://www.baidu.com'
    */
    it('testGetOriginsCallbackLoadBaidu01', 0, async function(done){
      emitKey = 'emitGetOriginsCallbackLoadBaidu02';
      let length  = 1;
      Utils.registerEvent("testGetOriginsCallbackLoadBaidu01", length, 7148, done);
      sendEventByKey('webStorage',10,'');
    })
    /*
    *tc.number SUB_ACE_BASIC_ETS_API_GETORIGINS_0800
    *tc.name testGetOriginsLoadBaidu02
    *tc.desc test api getOrigins callback mode by checking the value 0f Origins[0].usage when load website which address
    * is 'https://www.baidu.com'
    */
    it('testGetOriginsCallbackLoadBaidu02', 0, async function(done){
      emitKey = 'emitGetOriginsCallbackLoadBaidu03';
      let usage = 24576;
      Utils.registerEvent("testGetOriginsCallbackLoadBaidu02", usage, 7150, done);
      sendEventByKey('webStorage',10,'');
    })
    /*
    *tc.number SUB_ACE_BASIC_ETS_API_GETORIGINS_0900
    *tc.name testGetOriginsCallbackLoadBaidu03
    *tc.desc test api getOrigins callback mode by checking the value 0f Origins[0].quota when load website which address
    * is 'https://www.baidu.com'
    */
    it('testGetOriginsCallbackLoadBaidu03', 0, async function(done){
      emitKey = 'emitGetOriginsPromiseLoadBaidu01';
      Utils.registerLargerEvent("testGetOriginsCallbackLoadBaidu03", 7152, done);
      sendEventByKey('webStorage',10,'');
    })
    /*
    *tc.number SUB_ACE_BASIC_ETS_API_GETORIGINS_1000
    *tc.name testGetOriginsPromiseLoadBaidu01
    *tc.desc test api getOrigins Promise mode by checking the length of origins when load website which address
    * is 'https://www.baidu.com'
    */
    it('testGetOriginsPromiseLoadBaidu01', 0, async function(done){
      emitKey = 'emitGetOriginsPromiseLoadBaidu02';
      let length  = 1;
      Utils.registerEvent("testGetOriginsPromiseLoadBaidu01", length, 7154, done);
      sendEventByKey('webStorage',10,'');
    })
    /*
    *tc.number SUB_ACE_BASIC_ETS_API_GETORIGINS_1100
    *tc.name testGetOriginsPromiseLoadBaidu02
    *tc.desc test api getOrigins Promise mode by checking the value 0f Origins[0].usage when load website which address
    * is 'https://www.baidu.com'
    */
    it('testGetOriginsPromiseLoadBaidu02', 0, async function(done){
      emitKey = 'emitGetOriginsPromiseLoadBaidu03';
      let usage = 24576;
      Utils.registerEvent("testGetOriginsPromiseLoadBaidu02", usage, 7156, done);
      sendEventByKey('webStorage',10,'');
    })
    /*
    *tc.number SUB_ACE_BASIC_ETS_API_GETORIGINS_1200
    *tc.name testGetOriginsPromiseLoadBaidu03
    *tc.desc test api getOrigins Promise mode by checking the value 0f Origins[0].quota when load website which address
    * is 'https://www.baidu.com'
    */
    it('testGetOriginsPromiseLoadBaidu03', 0, async function(done){
      emitKey = 'emitGetOriginsCallbackLoadLocalHtml01';
      Utils.registerLargerEvent("testGetOriginsPromiseLoadBaidu03", 7158, done);
      sendEventByKey('webStorage',10,'');
    })
    /*
    *tc.number SUB_ACE_BASIC_ETS_API_GETORIGINS_1300
    *tc.name testGetOriginsCallbackLoadLocalHtml01
    *tc.desc test api getOrigins callback mode by checking the length of origins when load local html
    */
    it('testGetOriginsCallbackLoadLocalHtml01', 0, async function(done){
      emitKey = 'emitGetOriginsCallbackLoadLocalHtml02';
      let length = 1;
      Utils.registerEvent("testGetOriginsCallbackLoadLocalHtml01", length, 7160, done);
      sendEventByKey('webStorage',10,'');
    })
    /*
    *tc.number SUB_ACE_BASIC_ETS_API_GETORIGINS_1400
    *tc.name testGetOriginsLoadCallbackLocalHtml02
    *tc.desc test api getOrigins callback mode by checking the value 0f Origins[0].usage when load local html
    */
    it('testGetOriginsLoadCallbackLocalHtml02', 0, async function(done){
      emitKey = 'emitGetOriginsCallbackLoadLocalHtml03';
      let usage = 24576;
      Utils.registerEvent("testGetOriginsLoadCallbackLocalHtml02", usage, 7162, done);
      sendEventByKey('webStorage',10,'');
    })
    /*
    *tc.number SUB_ACE_BASIC_ETS_API_GETORIGINS_1500
    *tc.name testGetOriginsCallbackLoadLocalHtml03
    *tc.desc test api getOrigins callback mode by checking the value 0f Origins[0].quota when load local html
    */
    it('testGetOriginsCallbackLoadLocalHtml03', 0, async function(done){
      emitKey = 'emitGetOriginsPromiseLoadLocalHtml02';
      Utils.registerLargerEvent("testGetOriginsCallbackLoadLocalHtml03", 7164, done);
      sendEventByKey('webStorage',10,'');
    })
    /*
    *tc.number SUB_ACE_BASIC_ETS_API_GETORIGINS_1600

    /*
    *tc.number SUB_ACE_BASIC_ETS_API_GETORIGINS_1700
    *tc.name testGetOriginsPromiseLoadLocalHtml02
    *tc.desc test api getOrigins callback mode by checking the value 0f Origins[0].usage when load local html
    */
    it('testGetOriginsLoadPromiseLocalHtml02', 0, async function(done){
      emitKey = 'emitGetOriginsPromiseLoadLocalHtml03';
      let usage = 24576;
      Utils.registerEvent("testGetOriginsPromiseLoadLocalHtml02", usage, 7168, done);
      sendEventByKey('webStorage',10,'');
    })
    /*
    *tc.number SUB_ACE_BASIC_ETS_API_GETORIGINS_1800
    *tc.name testGetOriginsPromiseLoadLocalHtml03
    *tc.desc test api getOrigins Promise mode by checking the value 0f Origins[0].quota when load local html
    */
    it('testGetOriginsPromiseLoadLocalHtml03', 0, async function(done){
      emitKey = 'emitDeleteOrigin';
      Utils.registerLargerEvent("testGetOriginsPromiseLoadLocalHtml03", 7170, done);
      sendEventByKey('webStorage',10,'');
    })
    /*
    *tc.number SUB_ACE_BASIC_ETS_API_GETORIGINS_1900
    *tc.name testDeleteOrigin
    *tc.desc test api deleteOrigin by checking the value 0f getOriginUsage when delete 'resource://rawfile/'
    */
    it('testDeleteOrigin', 0, async function(done){
      emitKey = 'emitDeleteAllData';
      let usage = 0;
      Utils.registerEvent("testDeleteOrigin", usage, 7172, done);
      sendEventByKey('webStorage',10,'');
    })
    /*
    *tc.number SUB_ACE_BASIC_ETS_API_GETORIGINS_2000
    *tc.name testDeleteAllData
    *tc.desc test api deleteAllData by checking the value 0f getOriginUsage when delete 'resource://rawfile/'
    */
    it('testDeleteAllData', 0, async function(done){
      emitKey = 'emitGetOriginQuotaCallback';
      let usage = 0;
      Utils.registerEvent("testDeleteAllData", usage, 7174, done);
      sendEventByKey('webStorage',10,'');
    })
    /*
    *tc.number SUB_ACE_BASIC_ETS_API_GETORIGINS_2100
    *tc.name testGetOriginQuotaCallback
    *tc.desc test api getOriginQuota callbcak mode by load loacal html
    */
    it('testGetOriginQuotaCallback', 0, async function(done){
      emitKey = 'emitGetOriginQuotaPromise';
      Utils.registerLargerEvent("testGetOriginQuotaCallback", 7176, done);
      sendEventByKey('webStorage',10,'');
    })
    /*
    *tc.number SUB_ACE_BASIC_ETS_API_GETORIGINS_2200
    *tc.name testGetOriginQuotaPromise
    *tc.desc test api getOriginQuota callbcak mode by load loacal html
    */
    it('testGetOriginQuotaPromise', 0, async function(done){
      emitKey = 'emitGetOriginUsageCallback';
      Utils.registerLargerEvent("testGetOriginQuotaPromise", 7178, done);
      sendEventByKey('webStorage',10,'');
    })
    /*
    *tc.number SUB_ACE_BASIC_ETS_API_GETORIGINS_2300
    *tc.name testGetOriginUsageCallback
    *tc.desc test api getOriginUsage callbcak mode by load loacal html
    */
    it('testGetOriginUsageCallback', 0, async function(done){
      emitKey = 'emitGetOriginUsagePromise';
      let usage = 24576;
      Utils.registerEvent("testGetOriginUsageCallback", usage, 7180, done);
      sendEventByKey('webStorage',10,'');
    })
    /*
    *tc.number SUB_ACE_BASIC_ETS_API_GETORIGINS_2400
    *tc.name testGetOriginUsagePromise
    *tc.desc test api getOriginUsage callbcak mode by load loacal html
    */
    it('testGetOriginUsagePromise', 0, async function(done){
      emitKey = 'emitGetOriginsDomStorageAccessFalse';
      let usage = 24576;
      Utils.registerEvent("testGetOriginUsagePromise", usage, 7182, done);
      sendEventByKey('webStorage',10,'');
    })
    /*
    *tc.number SUB_ACE_BASIC_ETS_API_0900
    *tc.name testGetOriginsDomStorageAccessFalse
    *tc.desc test api blockNetWork set to false by load online website
    */
    it('testGetOriginsDomStorageAccessFalse',0,async function(done){
      Utils.registerLargerEvent("testGetOriginsDomStorageAccessFalse", 7184, done);
      sendEventByKey('webStorage', 10, '');
    })
  })
}