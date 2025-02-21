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

export default function commonColorModeJsunit() {
  describe('commonColorModeTest', function () {
    beforeEach(async function (done) {
      console.info("flex beforeEach start");
      let options = {
        uri: 'pages/common',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get common state success " + JSON.stringify(pages));
        if (!("common" == pages.name)) {
          console.info("get common state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push common page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push common page error: " + err);
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("commonColorMode after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0011
     * @tc.name         testCommonColorMode0011
     * @tc.desic        acecommonColorModeEtsTest0011
     */
    it('testCommonColorMode0011', 0, async function (done) {
      console.info('commonColorMode testCommonColorMode0011 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('ThinText');
      console.info("[testCommonColorMode0011] component textAlign strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.backgroundBlurStyle).assertEqual(undefined);
      console.info("[testCommonColorMode0011] backgroundBlurStyle value :" + obj.$attrs.backgroundBlurStyle);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0012
     * @tc.name         testCommonColorMode0012
     * @tc.desic        acecommonColorModeEtsTest0012
     */
    it('testCommonColorMode0012', 0, async function (done) {
      console.info('commonColorMode testCommonColorMode0012 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('ThickText');
      console.info("[testCommonColorMode0012] component textAlign strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.backgroundBlurStyle).assertEqual(undefined);
      console.info("[testCommonColorMode0012] backgroundBlurStyle value :" + obj.$attrs.backgroundBlurStyle);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_00017
     * @tc.name         testCommonMiddle0001
     * @tc.desic        acecommonMiddleEtsTest0001
     */
    it('testCommonMiddle0001', 0, async function (done) {
      console.info('commonMiddle testCommonMiddle0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('middleText');
      console.info("[testCommonMiddle0001] component textAlign strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      console.info("[testCommonMiddle0001] alignRules value :" + obj.$attrs.alignRules);
      expect(obj.$attrs.alignRules).assertEqual(undefined);
      console.info("[testCommonMiddle0001] alignRules value :" + obj.$attrs.alignRules);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_00018
     * @tc.name         testCommonOutset0001
     * @tc.desic        acecommonOutsetEtsTest0001
     */
    it('testCommonOutset0001', 0, async function (done) {
      console.info('commonOutset testCommonOutset0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('outsetText');
      console.info("[testCommonOutset0001] component textAlign strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      console.info("[testCommonOutset0001] borderImage value :" + obj.$attrs.borderImage);
      expect(obj.$attrs.borderImage).assertEqual(undefined);
      console.info("[testCommonOutset0001] borderImage value :" + obj.$attrs.borderImage);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_00019
     * @tc.name         testCommonRepeat0001
     * @tc.desic        acecommonRepeatEtsTest0001
     */
    it('testCommonRepeat0001', 0, async function (done) {
      console.info('commonRepeat testCommonRepeat0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('RepeatText');
      console.info("[testCommonRepeat0001] component textAlign strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.borderImage).assertEqual(undefined);
      console.info("[testCommonOutset0001] borderImage value :" + obj.$attrs.borderImage);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_00020
     * @tc.name         testCommonSpace0001
     * @tc.desic        acecommonSpaceEtsTest0001
     */
    it('testCommonSpace0001', 0, async function (done) {
      console.info('commonSpace testCommonSpace0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('SpaceText');
      console.info("[testCommonSpace0001] component textAlign strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.borderImage).assertEqual(undefined);
      console.info("[testCommonSpace0001] borderImage value :" + obj.$attrs.borderImage);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_00021
     * @tc.name         testCommonSlice0001
     * @tc.desic        acecommonSliceEtsTest0001
     */
    it('testCommonSlice0001', 0, async function (done) {
      console.info('commonSlice testCommonSlice0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('sliceText');
      console.info("[testCommonSlice0001] component textAlign strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      console.info("[testCommonSlice0001] borderImage value :" + obj.$attrs.borderImage);
      expect(obj.$attrs.borderImage).assertEqual(undefined);
      console.info("[testCommonSlice0001] borderImage value :" + obj.$attrs.borderImage);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_00022
     * @tc.name         testCommonArea0001
     * @tc.desic        acecommonAreaEtsTest0001
     */
    it('testCommonArea0001', 0, async function (done) {
      console.info('commonSlice testCommonArea0001 START');
      await Utils.sleep(500);
      try {
        var innerEvent = {
          eventId: 60312,
          priority: events_emitter.EventPriority.LOW
        }
        var callback = (eventData) => {
          console.info("testCommonArea0001 get event state result is: " + JSON.stringify(eventData));
          expect(eventData.data.STATUS).assertEqual(320);
          done();
        }
        console.info("testCommonArea0001 click result is: " + JSON.stringify(sendEventByKey('areaText', 10, "")));
        events_emitter.on(innerEvent, callback);
      } catch (err) {
        console.info("testCommonArea0001 on click err : " + JSON.stringify(err));
      }
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_00023
     * @tc.name         testCommonTouches0001
     * @tc.desic        acecommonTouchesEtsTest0001
     */
    it('testCommonTouches0001', 0, async function (done) {
      console.info('commonSlice testCommonTouches0001 START');
      await Utils.sleep(500);
      try {
        var innerEvent = {
          eventId: 60313,
          priority: events_emitter.EventPriority.LOW
        }
        var callback = (eventData) => {
          console.info("testCommonTouches0001 get event state result is: " + JSON.stringify(eventData));
          expect(eventData.data.STATUS).assertEqual(undefined);
          done();
        }
        console.info("testCommonTouches0001 click result is: " + JSON.stringify(sendEventByKey('touchesText', 10, "")));
        events_emitter.on(innerEvent, callback);
      } catch (err) {
        console.info("testCommonTouches0001 on click err : " + JSON.stringify(err));
      }
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_00024
     * @tc.name         testCommonChangedTouches0001
     * @tc.desic        acecommonTouchesEtsTest0001
     */
    it('testCommonChangedTouches0001', 0, async function (done) {
      console.info('commonSlice testCommonChangedTouches0001 START');
      await Utils.sleep(500);
      try {
        var innerEvent = {
          eventId: 60314,
          priority: events_emitter.EventPriority.LOW
        }
        var callback = (eventData) => {
          console.info("testCommonChangedTouches0001 get event state result is: " + JSON.stringify(eventData));
          expect(eventData.data.STATUS).assertEqual(undefined);
          done();
        }
        console.info("changedTouches0001 click is: " + JSON.stringify(sendEventByKey('changedTouchesText', 10, "")));
        events_emitter.on(innerEvent, callback);
      } catch (err) {
        console.info("testCommonChangedTouches0001 on click err : " + JSON.stringify(err));
      }
    });
  })
}
