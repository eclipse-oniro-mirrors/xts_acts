/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import events_emitter from '@ohos.events.emitter';
import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import Utils from '../../MainAbility/common/Utils'

export default function videoOnFullscreenChangeJsunit() {
  describe('videoOnFullscreenChangeTest', () => {
    beforeAll(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/video/videoApI",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get video state success " + JSON.stringify(pages));
        if (!("videoApI" == pages.name)) {
          console.info("get video state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push video page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push video page error: " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("videoOnFullscreenChange after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         testvideoOnFullscreenChange0001
     * @tc.desic         acevideoOnFullscreenChangeEtsTest0001
     */
    it('testvideoOnFullscreenChange0001', 0, async () => {
      console.info('videoOnFullscreenChange testvideoOnFullscreenChange0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onFullscreenChangeText');
      console.info("[testvideoOnFullscreenChange0001] component width strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Video');
      expect(JSON.parse(strJson).$attrs.width).assertEqual("600.00vp");
      console.info("[testvideoOnFullscreenChange0001] width value :" + JSON.parse(strJson).$attrs.width);

    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0002
     * @tc.name         testvideoOnFullscreenChange0002
     * @tc.desic         acevideoOnFullscreenChangeEtsTest0002
     */
    it('testvideoOnFullscreenChange0002', 0, async () => {
      console.info('videoOnFullscreenChange testvideoOnFullscreenChange0002 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onFullscreenChangeText');
      console.info("[testvideoOnFullscreenChange0002] component height strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Video');
      expect(JSON.parse(strJson).$attrs.height).assertEqual("400.00vp");
      console.info("[testvideoOnFullscreenChange0002] height value :" + JSON.parse(strJson).$attrs.height);

    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0003
     * @tc.name         testvideoOnFullscreenChange0003
     * @tc.desic         acevideoOnFullscreenChangeEtsTest0003
     */
    it('testvideoOnFullscreenChange0003', 0, async () => {
      console.info('videoOnFullscreenChange testvideoOnFullscreenChange0003 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onFullscreenChangeText');
      console.info("[testvideoOnFullscreenChange0003] component fontSize strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Video');
      expect(JSON.parse(strJson).$attrs.fontSize).assertEqual(undefined);
      console.info("[testvideoOnFullscreenChange0003] fontSize value :" + JSON.parse(strJson).$attrs.fontSize);

    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0004
     * @tc.name         testvideoOnFullscreenChange0004
     * @tc.desic         acevideoOnFullscreenChangeEtsTest0004
     */
    it('testvideoOnFullscreenChange0004', 0, async () => {
      console.info('videoOnFullscreenChange testvideoOnFullscreenChange0004 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onFullscreenChangeText');
      console.info("[testvideoOnFullscreenChange0004] component opacity strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Video');
      expect(JSON.parse(strJson).$attrs.opacity).assertEqual(1);
      console.info("[testvideoOnFullscreenChange0004] opacity value :" + JSON.parse(strJson).$attrs.opacity);

    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0005
     * @tc.name         testvideoOnFullscreenChange0005
     * @tc.desic         acevideoOnFullscreenChangeEtsTest0005
     */
    it('testvideoOnFullscreenChange0005', 0, async () => {
      console.info('videoOnFullscreenChange testvideoOnFullscreenChange0005 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onFullscreenChangeText');
      console.info("[testvideoOnFullscreenChange0005] component align strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Video');
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.Center");
      console.info("[testvideoOnFullscreenChange0005] align value :" + JSON.parse(strJson).$attrs.align);

    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0006
     * @tc.name         testvideoOnFullscreenChange0006
     * @tc.desic         acevideoOnFullscreenChangeEtsTest0006
     */
    it('testvideoOnFullscreenChange0006', 0, async () => {
      console.info('videoOnFullscreenChange testvideoOnFullscreenChange0006 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onFullscreenChangeText');
      console.info("[testvideoOnFullscreenChange0006] component fontColor strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Video');
      expect(JSON.parse(strJson).$attrs.fontColor).assertEqual(undefined);
      console.info("[testvideoOnFullscreenChange0006] fontColor value :" + JSON.parse(strJson).$attrs.fontColor);

    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0007
     * @tc.name         testvideoOnFullscreenChange0007
     * @tc.desic         acevideoOnFullscreenChangeEtsTest0007
     */
    it('testvideoOnFullscreenChange0007', 0, async () => {
      console.info('videoOnFullscreenChange testvideoOnFullscreenChange0007 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onFullscreenChangeText');
      console.info("[testvideoOnFullscreenChange0007] component lineHeight strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Video');
      expect(JSON.parse(strJson).$attrs.lineHeight).assertEqual(undefined);
      console.info("[testvideoOnFullscreenChange0007] lineHeight value :" + JSON.parse(strJson).$attrs.lineHeight);

    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0009
     * @tc.name         testvideoOnFullscreenChange0009
     * @tc.desic         acevideoOnFullscreenChangeEtsTest0009
     */
    it('testvideoOnFullscreenChange0009', 0, async () => {
      console.info('videoOnFullscreenChange testvideoOnFullscreenChange009 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onFullscreenChangeText');
      console.info("[testvideoOnFullscreenChange0009] component padding strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Video');
      expect(JSON.parse(strJson).$attrs.padding).assertEqual("0.00vp");
      console.info("[testvideoOnFullscreenChange0009] padding value :" + JSON.parse(strJson).$attrs.padding);

    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0010
     * @tc.name         testvideoOnFullscreenChange0010
     * @tc.desic         acevideoOnFullscreenChangeEtsTest0010
     */
    it('testvideoOnFullscreenChange0010', 0, async () => {
      console.info('videoOnFullscreenChange testvideoOnFullscreenChange0010 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onFullscreenChangeText');
      console.info("[testvideoOnFullscreenChange0010] component textAlign strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Video');
      expect(JSON.parse(strJson).$attrs.textAlign).assertEqual(undefined);
      console.info("[testvideoOnFullscreenChange0010] textAlign value :" + JSON.parse(strJson).$attrs.textAlign);

    });

    it('testvideoOnFullscreenChange0011', 0, async () => {
      console.info('videoOnFullscreenChange testvideoOnFullscreenChange0011 START');
      let innerEvent: events_emitter.InnerEvent = {
        eventId: 60227,
        priority: events_emitter.EventPriority.LOW
      }
      let callback = (eventData) => {
        try {
          console.info("callback success");
          console.info("eventData.data.result result is: " + eventData.data.result);
          expect(eventData.data.result).assertEqual("success");
          console.info("video_101 end: ");
        } catch (err) {
          console.info("video_101 on events_emitter err : " + JSON.stringify(err));
        }
      }
      try {
        events_emitter.on(innerEvent, callback);
        await Utils.sleep(500);
        console.info("video_101 click result is: " + JSON.stringify(sendEventByKey('fullScreen', 10, "")));
        await Utils.sleep(2000);

      } catch (err) {
        console.info("video_101 on events_emitter err : " + JSON.stringify(err));
      }
    });
  })
}
