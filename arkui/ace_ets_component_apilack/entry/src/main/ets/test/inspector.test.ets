/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import router from '@system.router';
import events_emitter from '@ohos.events.emitter';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "hypium/index"
import Utils from './Utils.ets'

export default function inspectorJsunit() {
  describe('inspectorTest', function () {
    beforeAll(async function (done) {
      console.info("flex beforeEach start");
      let options = {
        uri: 'pages/inspector',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get inspector state success " + JSON.stringify(pages));
        if (!("inspector" == pages.name)) {
          console.info("get inspector state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push inspector page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push inspector page error: " + err);
      }
      done()
    });

    afterEach(async function () {
      console.info("inspectorTest after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         testlazyForEachOnDataAdd0001
     * @tc.desic         acelazyForEachOnDataAddEtsTest0001
     */
    it('testInspectorTestAdd0001', 0, async function (done) {
      console.info('Inspector testInspectorTestAdd0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('inspectorApiOne');
      console.info("[testInspectorTestAdd0001] component width strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.fontSize).assertEqual("50.00fp");
      console.info("[testInspectorTestAdd0001] fontSize value :" + obj.$attrs.fontSize);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0002
     * @tc.name         testInspectorTestAdd0002
     * @tc.desic         aceTestInspectorTestAdd0002
     */
    it('testInspectorTestAdd0002', 0, async function (done) {
      console.info('Inspector testInspectorTestAdd0002 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('inspectorApiOne');
      console.info("[testInspectorTestAdd0002] component width strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.fontWeight).assertEqual("FontWeight.Bold");
      console.info("[testInspectorTestAdd0002] fontWeight value :" + obj.$attrs.fontWeight);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0003
     * @tc.name         testInspectorTestAdd0003
     * @tc.desic         aceTestInspectorTestAdd0003
     */
    it('testInspectorTestAdd0003', 0, async function (done) {
      console.info("testInspectorTestAdd0003 start test");
      var innerEvent1 = {
        eventId: 60208,
        priority: events_emitter.EventPriority.LOW
      }
      var callback1 = (eventData) => {
        console.info("eventData.data.getInspectorNodes result is: " + eventData.data.getInspectorNodes);
        try{
          console.info("callback1 success" );
          console.info("inspector_101 eventData.data.result result is: " + eventData.data.result);
          expect(eventData.data.result).assertEqual("success");
          console.info("inspector_101 end: ");
          if(eventData.data.getInspectorNodes != null){
            console.info("eventData.data.result result is: " + eventData.data.result);
            expect(eventData.data.result).assertEqual("success");
          }
        }catch(err){
          console.info("inspector_101 on events_emitter err : " + JSON.stringify(err));
        }
        done();
      }
      try {
        events_emitter.on(innerEvent1, callback1);
        console.info("inspector_101 click result is: " + JSON.stringify(sendEventByKey('inspectorApiOne', 10, "")));
      } catch (err) {
        console.info("inspector_101 on events_emitter err : " + JSON.stringify(err));
      }
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0004
     * @tc.name         testInspectorTestAdd0004
     * @tc.desic         aceTestInspectorTestAdd0004
     */
    it('testInspectorTestAdd0004', 0, async function (done) {
      var innerEvent2 = {
        eventId: 60209,
        priority: events_emitter.EventPriority.LOW
      }
      var callback2 = (eventData) => {
        console.info("eventData.data.getInspectorNodeById result is: " + eventData.data.getInspectorNodeById);
        try{
          console.info("callback2 success" );
          console.info("inspector_102 eventData.data.result result is: " + eventData.data.result);
          expect(eventData.data.result).assertEqual("success");
          console.info("inspector_102 end");
        }catch(err){
          console.info("inspector_102 on events_emitter err : " + JSON.stringify(err));
        }
        done();
      }
      try{
        console.info("inspector_102 click result is: " + JSON.stringify(sendEventByKey('inspectorApiTwo', 10, "")));
        events_emitter.on(innerEvent2, callback2);
      }catch(err){
        console.info("inspector_102 on events_emitter err : " + JSON.stringify(err));
      }
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0005
     * @tc.name         testInspectorTestAdd0005
     * @tc.desic         aceTestInspectorTestAdd0005
     */
    it('testInspectorTestAdd0005', 0, async function (done) {
      console.info('testInspectorTestAdd0005 START');
      try {
        var eventData = {
          data: {
            "setColor": 'red'
          }
        }
        var innerEvent = {
          eventId: 60211,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testInspectorTestAdd0005] change component data error: " + err.message);
      }
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0006
     * @tc.name         testInspectorTestAdd0006
     * @tc.desic         aceTestInspectorTestAdd0006
     */
    it('testInspectorTestAdd0006', 0, async function (done) {
      var innerEvent3 = {
        eventId: 60210,
        priority: events_emitter.EventPriority.LOW
      }
      var callback3 = (eventData) => {
        try{
          console.info("callback3 success" );
          console.info("inspector_103 eventData.data.result result is: " + eventData.data.catchStatus);
          expect(eventData.data.catchStatus).assertEqual("callBackSuccess");
          console.info("inspector_103 end");
        }catch(err){
          console.info("inspector_103 on events_emitter err : " + JSON.stringify(err));
        }
        done();
      }
      try{
        console.info("inspector_103 click result is: " + JSON.stringify(sendEventByKey('inspectorApiFour', 10, "")));
        events_emitter.on(innerEvent3, callback3);
      }catch(err){
        console.info("inspector_103 on events_emitter err : " + JSON.stringify(err));
      }
    });
  })
}
