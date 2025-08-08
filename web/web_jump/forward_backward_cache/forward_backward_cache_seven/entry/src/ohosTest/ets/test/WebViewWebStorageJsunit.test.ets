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
import { describe, beforeEach, afterEach, it, expect,beforeAll , TestType, Size, Level } from "@ohos/hypium";
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
// import router from '@system.router';
import router from '@ohos.router';
let emitKey = 'emitGetOriginsCallbackLoadWebkit01';
export default function WebViewWebStorageJsunit() {
  describe('actsAceWebViewWebStorageJsunit',  () => {
    beforeAll(async  (done: Function) => {
      let options: router.RouterOptions = {
        url: "testability/pages/webStorage"
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webStorage state success " + JSON.stringify(pages));
        if (!("webStorage" == pages.name)) {
          console.info("get webStorage state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push webStorage page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webStorage page error: " + err);
      }
      await Utils.sleep(10000);
      done()
    });

    afterEach(async  (done: Function) =>{
      try {
        let backData: events_emitter.EventData  = {
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
    *tc.number SUB_ACE_BASIC_ETS_API_GETORIGINS_0100
    *tc.name testGetOriginsCallbackLoadWebkit01
    *tc.desc test api getOrigins callback mode by checking the value 0f Origins[0].origin when load website which
    * address is 'https://docs.qq.com/'
    */
    it('testGetOriginsCallbackLoadWebkit01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) =>{
      await Utils.sleep(10000);
      emitKey = 'emitGetOriginsCallbackLoadWebkit02';
      let origin = 'https://docs.qq.com/';
      Utils.registerEvent("testGetOriginsCallbackLoadWebkit01", origin, 7136, done);
      sendEventByKey('webStorage',10,'');
    })
    /*
    *tc.number SUB_ACE_BASIC_ETS_API_GETORIGINS_0200
    *tc.name testGetOriginsCallbackLoadWebkit02
    *tc.desc test api getOrigins callback mode by checking the value 0f  Origins[0].usage when load website which
    * address is 'https://docs.qq.com/'
    */
    it('testGetOriginsCallbackLoadWebkit02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) =>{
      emitKey = 'emitGetOriginsCallbackLoadWebkit03';
      Utils.registerEvent("testGetOriginsCallbackLoadWebkit02", true, 7138, done);
      sendEventByKey('webStorage',10,'');
    })
    /*
    *tc.number SUB_ACE_BASIC_ETS_API_GETORIGINS_0300
    *tc.name testGetOriginsCallbackLoadWebkit03
    *tc.desc test api getOrigins callback mode by the value 0f checking Origins[0].quote when load website which
    * address is 'https://docs.qq.com/'
    */
    it('testGetOriginsCallbackLoadWebkit03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) =>{
      emitKey = 'emitGetOriginsPromiseLoadWebkit01';
      Utils.registerLargerEvent("testGetOriginsCallbackLoadWebkit03", 7140, done);
      sendEventByKey('webStorage',10,'');
    })
    /*
    *tc.number SUB_ACE_BASIC_ETS_API_GETORIGINS_0400
    *tc.name testGetOriginsPromiseLoadWebkit01
    *tc.desc test api getOrigins promise mode by checking the value 0f Origins[0].origin when load website which address
    * is 'https://docs.qq.com/'
    */
    it('testGetOriginsPromiseLoadWebkit01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) =>{
      emitKey = 'emitGetOriginsPromiseLoadWebkit02';
      let origin = 'https://docs.qq.com/';
      Utils.registerEvent("testGetOriginsPromiseLoadWebkit01", origin, 7142, done);
      sendEventByKey('webStorage',10,'');
    })
    /*
    *tc.number SUB_ACE_BASIC_ETS_API_GETORIGINS_0500
    *tc.name testGetOriginsPromiseLoadWebkit02
    *tc.desc test api getOrigins promise mode by checking the value 0f  Origins[0].usage when load website which address
    * is 'https://docs.qq.com/'
    */
    it('testGetOriginsPromiseLoadWebkit02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) =>{
      emitKey = 'emitGetOriginsPromiseLoadWebkit03';
      Utils.registerEvent("testGetOriginsPromiseLoadWebkit02", true, 7144, done);
      sendEventByKey('webStorage',10,'');
    })
    /*
    *tc.number SUB_ACE_BASIC_ETS_API_GETORIGINS_0600
    *tc.name testGetOriginsPromiseLoadWebkit03
    *tc.desc test api getOrigins promise mode by the value 0f checking Origins[0].quote when load website which address
    * is 'https://docs.qq.com/'
    */
    it('testGetOriginsPromiseLoadWebkit03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) =>{
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
    it('testGetOriginsCallbackLoadBaidu01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) =>{
      emitKey = 'emitGetOriginsCallbackLoadBaidu02';
      let length = 1
      Utils.registerEvent("testGetOriginsCallbackLoadBaidu01", length, 7148, done);
      sendEventByKey('webStorage',10,'');
    })
    /*
    *tc.number SUB_ACE_BASIC_ETS_API_GETORIGINS_0800
    *tc.name testGetOriginsLoadBaidu02
    *tc.desc test api getOrigins callback mode by checking the value 0f Origins[0].usage when load website which address
    * is 'https://www.baidu.com'
    */
    it('testGetOriginsCallbackLoadBaidu02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) =>{
      emitKey = 'emitGetOriginsCallbackLoadBaidu03';
      Utils.registerEvent("testGetOriginsCallbackLoadBaidu02", true, 7150, done);
      sendEventByKey('webStorage',10,'');
    })
    /*
    *tc.number SUB_ACE_BASIC_ETS_API_GETORIGINS_0900
    *tc.name testGetOriginsCallbackLoadBaidu03
    *tc.desc test api getOrigins callback mode by checking the value 0f Origins[0].quota when load website which address
    * is 'https://www.baidu.com'
    */
    it('testGetOriginsCallbackLoadBaidu03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) =>{
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
    it('testGetOriginsPromiseLoadBaidu01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) =>{
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
    it('testGetOriginsPromiseLoadBaidu02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) =>{
      emitKey = 'emitGetOriginsPromiseLoadBaidu03';
      // let usage = 73219;
      Utils.registerEvent("testGetOriginsPromiseLoadBaidu02", true, 7156, done);
      sendEventByKey('webStorage',10,'');
    })
    /*
    *tc.number SUB_ACE_BASIC_ETS_API_GETORIGINS_1200
    *tc.name testGetOriginsPromiseLoadBaidu03
    *tc.desc test api getOrigins Promise mode by checking the value 0f Origins[0].quota when load website which address
    * is 'https://www.baidu.com'
    */
    it('testGetOriginsPromiseLoadBaidu03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) =>{
      emitKey = 'emitGetOriginsCallbackLoadLocalHtml01';
      Utils.registerLargerEvent("testGetOriginsPromiseLoadBaidu03", 7158, done);
      sendEventByKey('webStorage',10,'');
    })
    /*
    *tc.number SUB_ACE_BASIC_ETS_API_GETORIGINS_1300
    *tc.name testGetOriginsCallbackLoadLocalHtml01
    *tc.desc test api getOrigins callback mode by checking the length of origins when load local html
    */
    it('testGetOriginsCallbackLoadLocalHtml01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) =>{
      emitKey = 'emitGetOriginsCallbackLoadLocalHtml02';
      let length = 1
      Utils.registerEvent("testGetOriginsCallbackLoadLocalHtml01", length, 7160, done);
      sendEventByKey('webStorage',10,'');
    })
    /*
    *tc.number SUB_ACE_BASIC_ETS_API_GETORIGINS_1400
    *tc.name testGetOriginsLoadCallbackLocalHtml02
    *tc.desc test api getOrigins callback mode by checking the value 0f Origins[0].usage when load local html
    */
    it('testGetOriginsLoadCallbackLocalHtml02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) =>{
      emitKey = 'emitGetOriginsCallbackLoadLocalHtml03';
      Utils.registerEvent("testGetOriginsLoadCallbackLocalHtml02", true, 7162, done);
      sendEventByKey('webStorage',10,'');
    })
    /*
    *tc.number SUB_ACE_BASIC_ETS_API_GETORIGINS_1500
    *tc.name testGetOriginsCallbackLoadLocalHtml03
    *tc.desc test api getOrigins callback mode by checking the value 0f Origins[0].quota when load local html
    */
    it('testGetOriginsCallbackLoadLocalHtml03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) =>{
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
    it('testGetOriginsLoadPromiseLocalHtml02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) =>{
      emitKey = 'emitGetOriginsPromiseLoadLocalHtml03';
      // let usage = 3835;
      Utils.registerEvent("testGetOriginsPromiseLoadLocalHtml02", true, 7168, done);
      sendEventByKey('webStorage',10,'');
    })
    /*
    *tc.number SUB_ACE_BASIC_ETS_API_GETORIGINS_1800
    *tc.name testGetOriginsPromiseLoadLocalHtml03
    *tc.desc test api getOrigins Promise mode by checking the value 0f Origins[0].quota when load local html
    */
    it('testGetOriginsPromiseLoadLocalHtml03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) =>{
      emitKey = 'emitDeleteOrigin';
      Utils.registerLargerEvent("testGetOriginsPromiseLoadLocalHtml03", 7170, done);
      sendEventByKey('webStorage',10,'');
    })
    /*
    *tc.number SUB_ACE_BASIC_ETS_API_GETORIGINS_1900
    *tc.name testDeleteOrigin
    *tc.desc test api deleteOrigin by checking the value 0f getOriginUsage when delete 'resource://rawfile/'
    */
    it('testDeleteOrigin', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) =>{
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
    it('testDeleteAllData', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) =>{
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
    it('testGetOriginQuotaCallback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) =>{
      emitKey = 'emitGetOriginQuotaPromise';
      Utils.registerLargerEvent("testGetOriginQuotaCallback", 7176, done);
      sendEventByKey('webStorage',10,'');
    })
    /*
    *tc.number SUB_ACE_BASIC_ETS_API_GETORIGINS_2200
    *tc.name testGetOriginQuotaPromise
    *tc.desc test api getOriginQuota callbcak mode by load loacal html
    */
    it('testGetOriginQuotaPromise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) =>{
      emitKey = 'emitGetOriginUsageCallback';
      Utils.registerLargerEvent("testGetOriginQuotaPromise", 7178, done);
      sendEventByKey('webStorage',10,'');
    })
    /*
    *tc.number SUB_ACE_BASIC_ETS_API_GETORIGINS_2300
    *tc.name testGetOriginUsageCallback
    *tc.desc test api getOriginUsage callbcak mode by load loacal html
    */
    it('testGetOriginUsageCallback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) =>{
      emitKey = 'emitGetOriginUsagePromise';
      Utils.registerEvent("testGetOriginUsageCallback", true, 7180, done);
      sendEventByKey('webStorage',10,'');
    })
    /*
    *tc.number SUB_ACE_BASIC_ETS_API_GETORIGINS_2400
    *tc.name testGetOriginUsagePromise
    *tc.desc test api getOriginUsage callbcak mode by load loacal html
    */
    it('testGetOriginUsagePromise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) =>{
      emitKey = 'emitGetOriginsDomStorageAccessFalse';
      Utils.registerEvent("testGetOriginUsagePromise", true, 7182, done);
      sendEventByKey('webStorage',10,'');
    })

  })
}