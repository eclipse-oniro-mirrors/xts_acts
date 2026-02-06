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
import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import Utils from '../../MainAbility/common/Utils'

export default function commonColorModeJsunit() {
  describe('commonColorModeTest', () => {
    beforeEach(async (done: Function) => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/imageEffects/common',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get common state success " + JSON.stringify(pages));
        if (!("common" == pages.name)) {
          console.info("get common state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push common page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push common page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("commonColorMode after each called");
    });

    /**
     * @tc.name   testCommonColorMode0011
     * @tc.number SUB_ACE_BASIC_ETS_API_0011
     * @tc.desc   testCommonColorMode0011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCommonColorMode0011', Level.LEVEL2, async (done: Function) => {
      console.info('commonColorMode testCommonColorMode0011 START');
      await Utils.sleep(2000);
      let strJson: string = getInspectorByKey('ThinText');
      console.info("[testCommonColorMode0011] component textAlign strJson:" + strJson);
      expect(JSON.parse(strJson).$type).assertEqual('Text');
      console.info("[testCommonColorMode0011] backgroundBlurStyle value :" + JSON.parse(strJson)
        .$attrs
        .backgroundBlurStyle);
      expect(JSON.parse(strJson).$attrs.backgroundBlurStyle instanceof Object).assertTrue();
      done();
    });

    /**
     * @tc.name   testCommonColorMode0012
     * @tc.number SUB_ACE_BASIC_ETS_API_0012
     * @tc.desc   testCommonColorMode0012
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCommonColorMode0012', Level.LEVEL2, async (done: Function) => {
      console.info('commonColorMode testCommonColorMode0012 START');
      await Utils.sleep(2000);
      let strJson: string = getInspectorByKey('ThickText');
      console.info("[testCommonColorMode0012] component textAlign strJson:" + strJson);

      expect(JSON.parse(strJson).$type).assertEqual('Text');
      console.info("[testCommonColorMode0012] backgroundBlurStyle value :" + JSON.parse(strJson)
        .$attrs
        .backgroundBlurStyle);

      expect(JSON.parse(strJson).$attrs.backgroundBlurStyle instanceof Object).assertTrue();
      done();
    });

    /**
     * @tc.name   testCommonMiddle0001
     * @tc.number SUB_ACE_BASIC_ETS_API_00017
     * @tc.desc   testCommonMiddle0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCommonMiddle0001', Level.LEVEL2, async (done: Function) => {
      console.info('commonMiddle testCommonMiddle0001 START');
      await Utils.sleep(2000);
      let strJson: string = getInspectorByKey('middleText');
      console.info("[testCommonMiddle0001] component textAlign strJson:" + strJson);

      expect(JSON.parse(strJson).$type).assertEqual('Text');
      console.info("[testCommonMiddle0001] alignRules value :" + JSON.parse(strJson).$attrs.alignRules);
      expect(JSON.parse(strJson).$attrs.alignRules).assertEqual(undefined);
      console.info("[testCommonMiddle0001] alignRules value :" + JSON.parse(strJson).$attrs.alignRules);
      done();
    });

    /**
     * @tc.name   testCommonOutset0001
     * @tc.number SUB_ACE_BASIC_ETS_API_00018
     * @tc.desc   testCommonOutset0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCommonOutset0001', Level.LEVEL2, async (done: Function) => {
      console.info('commonOutset testCommonOutset0001 START');
      await Utils.sleep(2000);
      let strJson: string = getInspectorByKey('outsetText');
      console.info("[testCommonOutset0001] component textAlign strJson:" + strJson);

      expect(JSON.parse(strJson).$type).assertEqual('Text');
      console.info("[testCommonOutset0001] borderImage value :" + JSON.parse(strJson).$attrs.borderImage);
      expect(JSON.parse(JSON.parse(strJson).$attrs.borderImage).width).assertEqual("10.00px");
      done();
    });

    /**
     * @tc.name   testCommonRepeat0001
     * @tc.number SUB_ACE_BASIC_ETS_API_00019
     * @tc.desc   testCommonRepeat0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCommonRepeat0001', Level.LEVEL2, async (done: Function) => {
      console.info('commonRepeat testCommonRepeat0001 START');
      await Utils.sleep(2000);
      let strJson: string = getInspectorByKey('RepeatText');
      console.info("[testCommonRepeat0001] component textAlign strJson:" + strJson);

      expect(JSON.parse(strJson).$type).assertEqual('Text');
      console.info("[testCommonOutset0001] borderImage value :" + JSON.parse(strJson).$attrs.borderImage);
      expect(JSON.parse(JSON.parse(strJson).$attrs.borderImage).width).assertEqual("10.00px");
      done();
    });

    /**
     * @tc.name   testCommonSpace0001
     * @tc.number SUB_ACE_BASIC_ETS_API_00020
     * @tc.desc   testCommonSpace0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCommonSpace0001', Level.LEVEL2, async (done: Function) => {
      console.info('commonSpace testCommonSpace0001 START');
      await Utils.sleep(2000);
      let strJson: string = getInspectorByKey('SpaceText');
      console.info("[testCommonSpace0001] component textAlign strJson:" + strJson);

      expect(JSON.parse(strJson).$type).assertEqual('Text');
      console.info("[testCommonSpace0001] borderImage value :" + JSON.parse(strJson).$attrs.borderImage);
      expect(JSON.parse(JSON.parse(strJson).$attrs.borderImage).width).assertEqual("10.00px");
      done();
    });

    /**
     * @tc.name   testCommonSlice0001
     * @tc.number SUB_ACE_BASIC_ETS_API_00021
     * @tc.desc   testCommonSlice0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCommonSlice0001', Level.LEVEL2, async (done: Function) => {
      console.info('commonSlice testCommonSlice0001 START');
      await Utils.sleep(2000);
      let strJson: string = getInspectorByKey('sliceText');
      console.info("[testCommonSlice0001] component textAlign strJson:" + strJson);

      expect(JSON.parse(strJson).$type).assertEqual('Text');
      console.info("[testCommonSlice0001] borderImage value :" + JSON.parse(strJson).$attrs.borderImage);
      expect(JSON.parse(JSON.parse(strJson).$attrs.borderImage).width).assertEqual("10.00px");
      done();
    });

    /**
     * @tc.name   testCommonArea0001
     * @tc.number SUB_ACE_BASIC_ETS_API_00022
     * @tc.desc   testCommonArea0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCommonArea0001', Level.LEVEL2, async (done: Function) => {
      console.info('commonSlice testCommonArea0001 START');
      await Utils.sleep(500);
      try {
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 60312,
          priority: events_emitter.EventPriority.LOW
        }
        let callback = (eventData: events_emitter.EventData) => {
          console.info("testCommonArea0001 get event state result is: " + JSON.stringify(eventData));
          expect(eventData.data?.STATUS).assertEqual(320);
        }
        events_emitter.on(innerEvent, callback);
        console.info("testCommonArea0001 click result is: " + JSON.stringify(sendEventByKey('areaText', 10, "")));
        await Utils.sleep(2000);
      } catch (err) {
        console.info("testCommonArea0001 on click err : " + JSON.stringify(err));
      }
      done();
    });

    /**
     * @tc.name   testCommonTouches0001
     * @tc.number SUB_ACE_BASIC_ETS_API_00023
     * @tc.desc   testCommonTouches0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCommonTouches0001', Level.LEVEL2, async (done: Function) => {
      console.info('commonSlice testCommonTouches0001 START');
      await Utils.sleep(500);
      try {
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 60313,
          priority: events_emitter.EventPriority.LOW
        }
        let callback = (eventData: events_emitter.EventData) => {
          console.info("testCommonTouches0001 get event state result is: " + JSON.stringify(eventData));
          expect(eventData.data?.STATUS).assertEqual(undefined);

        }
        events_emitter.on(innerEvent, callback);
        console.info("testCommonTouches0001 click result is: " + JSON.stringify(sendEventByKey('touchesText', 10, "")));
        await Utils.sleep(2000);
      } catch (err) {
        console.info("testCommonTouches0001 on click err : " + JSON.stringify(err));
      }
      done();
    });

    /**
     * @tc.name   testCommonChangedTouches0001
     * @tc.number SUB_ACE_BASIC_ETS_API_00024
     * @tc.desc   testCommonChangedTouches0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCommonChangedTouches0001', Level.LEVEL2, async (done: Function) => {
      console.info('commonSlice testCommonChangedTouches0001 START');
      await Utils.sleep(500);
      try {
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 60314,
          priority: events_emitter.EventPriority.LOW
        }
        let callback = (eventData: events_emitter.EventData) => {
          console.info("testCommonChangedTouches0001 get event state result is: " + JSON.stringify(eventData));
          expect(eventData.data?.STATUS).assertEqual(undefined);
        }
        events_emitter.on(innerEvent, callback);
        console.info("changedTouches0001 click is: " + JSON.stringify(sendEventByKey('changedTouchesText', 10, "")));
        await Utils.sleep(2000);
      } catch (err) {
        console.info("testCommonChangedTouches0001 on click err : " + JSON.stringify(err));
      }
      done();
    });
  })
}
