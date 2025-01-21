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

import events_emitter from '@ohos.events.emitter';
import router from '@system.router';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "hypium/index"
import Utils from './Utils.ets'

export default function videoOnFullscreenChangeJsunit() {
  describe('videoOnFullscreenChangeTest', function () {
    beforeAll(async function (done) {
      console.info("flex beforeEach start");
      let options = {
        uri: 'pages/video',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get video state success " + JSON.stringify(pages));
        if (!("video" == pages.name)) {
          console.info("get video state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push video page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push video page error: " + err);
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("videoOnFullscreenChange after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         testvideoOnFullscreenChange0001
     * @tc.desic         acevideoOnFullscreenChangeEtsTest0001
     */
    it('testvideoOnFullscreenChange0001', 0, async function (done) {
      console.info('videoOnFullscreenChange testvideoOnFullscreenChange0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onFullscreenChangeText');
      console.info("[testvideoOnFullscreenChange0001] component width strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Video');
      expect(obj.$attrs.width).assertEqual("600.00vp");
      console.info("[testvideoOnFullscreenChange0001] width value :" + obj.$attrs.width);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0002
     * @tc.name         testvideoOnFullscreenChange0002
     * @tc.desic         acevideoOnFullscreenChangeEtsTest0002
     */
    it('testvideoOnFullscreenChange0002', 0, async function (done) {
      console.info('videoOnFullscreenChange testvideoOnFullscreenChange0002 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onFullscreenChangeText');
      console.info("[testvideoOnFullscreenChange0002] component height strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Video');
      expect(obj.$attrs.height).assertEqual("400.00vp");
      console.info("[testvideoOnFullscreenChange0002] height value :" + obj.$attrs.height);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0003
     * @tc.name         testvideoOnFullscreenChange0003
     * @tc.desic         acevideoOnFullscreenChangeEtsTest0003
     */
    it('testvideoOnFullscreenChange0003', 0, async function (done) {
      console.info('videoOnFullscreenChange testvideoOnFullscreenChange0003 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onFullscreenChangeText');
      console.info("[testvideoOnFullscreenChange0003] component fontSize strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Video');
      expect(obj.$attrs.fontSize).assertEqual(undefined);
      console.info("[testvideoOnFullscreenChange0003] fontSize value :" + obj.$attrs.fontSize);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0004
     * @tc.name         testvideoOnFullscreenChange0004
     * @tc.desic         acevideoOnFullscreenChangeEtsTest0004
     */
    it('testvideoOnFullscreenChange0004', 0, async function (done) {
      console.info('videoOnFullscreenChange testvideoOnFullscreenChange0004 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onFullscreenChangeText');
      console.info("[testvideoOnFullscreenChange0004] component opacity strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Video');
      expect(obj.$attrs.opacity).assertEqual(1);
      console.info("[testvideoOnFullscreenChange0004] opacity value :" + obj.$attrs.opacity);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0005
     * @tc.name         testvideoOnFullscreenChange0005
     * @tc.desic         acevideoOnFullscreenChangeEtsTest0005
     */
    it('testvideoOnFullscreenChange0005', 0, async function (done) {
      console.info('videoOnFullscreenChange testvideoOnFullscreenChange0005 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onFullscreenChangeText');
      console.info("[testvideoOnFullscreenChange0005] component align strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Video');
      expect(obj.$attrs.align).assertEqual("Alignment.Center");
      console.info("[testvideoOnFullscreenChange0005] align value :" + obj.$attrs.align);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0006
     * @tc.name         testvideoOnFullscreenChange0006
     * @tc.desic         acevideoOnFullscreenChangeEtsTest0006
     */
    it('testvideoOnFullscreenChange0006', 0, async function (done) {
      console.info('videoOnFullscreenChange testvideoOnFullscreenChange0006 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onFullscreenChangeText');
      console.info("[testvideoOnFullscreenChange0006] component fontColor strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Video');
      expect(obj.$attrs.fontColor).assertEqual(undefined);
      console.info("[testvideoOnFullscreenChange0006] fontColor value :" + obj.$attrs.fontColor);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0007
     * @tc.name         testvideoOnFullscreenChange0007
     * @tc.desic         acevideoOnFullscreenChangeEtsTest0007
     */
    it('testvideoOnFullscreenChange0007', 0, async function (done) {
      console.info('videoOnFullscreenChange testvideoOnFullscreenChange0007 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onFullscreenChangeText');
      console.info("[testvideoOnFullscreenChange0007] component lineHeight strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Video');
      expect(obj.$attrs.lineHeight).assertEqual(undefined);
      console.info("[testvideoOnFullscreenChange0007] lineHeight value :" + obj.$attrs.lineHeight);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0009
     * @tc.name         testvideoOnFullscreenChange0009
     * @tc.desic         acevideoOnFullscreenChangeEtsTest0009
     */
    it('testvideoOnFullscreenChange0009', 0, async function (done) {
      console.info('videoOnFullscreenChange testvideoOnFullscreenChange009 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onFullscreenChangeText');
      console.info("[testvideoOnFullscreenChange0009] component padding strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Video');
      expect(obj.$attrs.padding).assertEqual("0.00px");
      console.info("[testvideoOnFullscreenChange0009] padding value :" + obj.$attrs.padding);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0010
     * @tc.name         testvideoOnFullscreenChange0010
     * @tc.desic         acevideoOnFullscreenChangeEtsTest0010
     */
    it('testvideoOnFullscreenChange0010', 0, async function (done) {
      console.info('videoOnFullscreenChange testvideoOnFullscreenChange0010 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onFullscreenChangeText');
      console.info("[testvideoOnFullscreenChange0010] component textAlign strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Video');
      expect(obj.$attrs.textAlign).assertEqual(undefined);
      console.info("[testvideoOnFullscreenChange0010] textAlign value :" + obj.$attrs.textAlign);
      done();
    });

    it('testvideoOnFullscreenChange0011', 0, async function (done) {
      console.info('videoOnFullscreenChange testvideoOnFullscreenChange0011 START');
      var innerEvent = {
        eventId: 60227,
        priority: events_emitter.EventPriority.LOW
      }
      var callback = (eventData) => {
        try{
          console.info("callback success" );
          console.info("eventData.data.result result is: " + eventData.data.result);
          expect(eventData.data.result).assertEqual("success");
          console.info("video_101 end: ");
        }catch(err){
          console.info("video_101 on events_emitter err : " + JSON.stringify(err));
        }
      }
      try {
        events_emitter.on(innerEvent, callback);
         await Utils.sleep(500);
        console.info("video_101 click result is: " + JSON.stringify(sendEventByKey('fullScreen', 10, "")));
        await Utils.sleep(2000);
        done();
      } catch (err) {
        console.info("video_101 on events_emitter err : " + JSON.stringify(err));
      }
    });
  })
}
