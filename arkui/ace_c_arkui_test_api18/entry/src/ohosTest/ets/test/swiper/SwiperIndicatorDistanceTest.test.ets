/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import { router } from '@kit.ArkUI';
import Utils from '../common/Utils';
import { Component, Driver, On, ON, MouseButton } from '@kit.TestKit';

export default function swiperIndicatorDistanceTest() {
  console.info('push page export');
  describe('SwiperIndicatorDistanceTest', () => {
    console.info('push page trying');
    afterEach(async (done: Function) => {
      await Utils.sleep(100)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_POST_FRAME_0100
     * @tc.name       : testSwiperIndicatorDistanceTest001
     * @tc.desc       : testing Swiper
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */

    it('DigitIndicator_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) => {
      let PAGE_TAG = 'SwiperIndicatorDistanceTest';
      await Utils.pushPage(`swiper/${PAGE_TAG}`,() => setTimeout(() => {}, 20000));
      console.info('push page success');
      await Utils.sleep(1000);

      console.info('Swiper_DigitIndicator START');
      let driverDigit: Driver = Driver.create();
      let BottomButton: Component = await driverDigit.findComponent(ON.id('bottom'));
      let IgnoreSizeButton: Component = await driverDigit.findComponent(ON.id('ignoreSize'));
      let driverDot: Driver = Driver.create();
      let SpaceButton: Component = await driverDot.findComponent(ON.id('Space'))

      await IgnoreSizeButton.click();
      await Utils.sleep(500)
      await IgnoreSizeButton.click();
      await Utils.sleep(500)
      await BottomButton.click();
      await Utils.sleep(500)
      await SpaceButton.click();
      await Utils.sleep(500)

      let strJson1Digit = getInspectorByKey('SwiperDigitIndicator');
      let strJson1Dot = getInspectorByKey('SwiperDotIndicator');

      let obj1Digit: ESObject = JSON.parse(strJson1Digit);
      let objDigit1: ESObject = JSON.parse(obj1Digit.$attrs.indicator);
      let obj1Dot: ESObject = JSON.parse(strJson1Dot);
      let objDot1: ESObject = JSON.parse(obj1Dot.$attrs.indicator);

      expect(Number.parseFloat(objDigit1.bottom)).assertEqual(20);
      expect(Number.parseFloat(objDot1.space)).assertEqual(8);
      console.info("Swiper_Indicator ignoreSize unit: " + objDot1.ignoreSize)
      expect(objDot1.ignoreSize).assertEqual('true');

      expect(objDigit1.bottom.substr(objDigit1.bottom.length - 2, 2)).assertEqual("vp");
      expect(objDot1.space.substr(objDot1.space.length - 2, 2)).assertEqual("vp");

      await Utils.sleep(500)
      await BottomButton.click();
      await Utils.sleep(500)
      await SpaceButton.click();
      await Utils.sleep(500)
      let strJson2Digit = getInspectorByKey('SwiperDigitIndicator');
      let strJson2Dot = getInspectorByKey('SwiperDotIndicator');

      let obj2Digit: ESObject = JSON.parse(strJson2Digit);
      let obj2Dot: ESObject = JSON.parse(strJson2Dot);
      let objDigit2: ESObject = JSON.parse(obj2Digit.$attrs.indicator);
      let objDot2: ESObject = JSON.parse(obj2Dot.$attrs.indicator);
      expect(Number.parseFloat(objDigit2.bottom)).assertEqual(0);
      expect(Number.parseFloat(objDot2.space)).assertEqual(8);

      expect(objDigit2.bottom.substr(objDigit2.bottom.length - 2, 2)).assertEqual("vp");
      expect(objDot2.space.substr(objDot2.space.length - 2, 2)).assertEqual("vp");

      await Utils.sleep(500)
      await BottomButton.click();
      await Utils.sleep(500)
      await SpaceButton.click();
      await Utils.sleep(500)
      let strJson3Digit = getInspectorByKey('SwiperDigitIndicator');
      let strJson3Dot = getInspectorByKey('SwiperDotIndicator');
      let obj3Digit: ESObject = JSON.parse(strJson3Digit);
      let obj3Dot: ESObject = JSON.parse(strJson3Dot);
      let objDigit3: ESObject = JSON.parse(obj3Digit.$attrs.indicator);
      let objDot3: ESObject = JSON.parse(obj3Dot.$attrs.indicator);
      expect(Number.parseFloat(objDigit3.bottom)).assertEqual(30);
      expect(Number.parseFloat(objDot3.space)).assertEqual(5);
      expect(objDigit3.bottom.substr(objDigit3.bottom.length - 2, 2)).assertEqual("vp");
      expect(objDot3.space.substr(objDot3.space.length - 2, 2)).assertEqual("vp");

      await Utils.sleep(500)
      await BottomButton.click();
      await Utils.sleep(500)
      await SpaceButton.click();
      await Utils.sleep(500)
      await IgnoreSizeButton.click();
      await Utils.sleep(500)
      let strJson4Digit = getInspectorByKey('SwiperDigitIndicator');
      let strJson4Dot = getInspectorByKey('SwiperDotIndicator');
      console.info('Swiper_DigitIndicator START  :' + JSON.stringify(strJson4Digit));
      let obj4Digit: ESObject = JSON.parse(strJson4Digit);
      let obj4Dot: ESObject = JSON.parse(strJson4Dot);
      let objDigit4: ESObject = JSON.parse(obj4Digit.$attrs.indicator);
      let objDot4: ESObject = JSON.parse(obj4Dot.$attrs.indicator);
      expect(Number.parseFloat(objDigit4.bottom)).assertEqual(0);
      expect(Number.parseFloat(objDot4.space)).assertEqual(20);
      console.info("Swiper_Indicator bottom " + Number.parseFloat(objDigit4.bottom));
      expect(objDigit4.bottom.substr(objDigit4.bottom.length - 2, 2)).assertEqual("vp");
      expect(objDot4.space.substr(objDot4.space.length - 2, 2)).assertEqual("vp");
      console.info("Swiper_Indicator bottom unit: " + objDigit4.bottom.substr(objDigit4.bottom.length - 2, 2))
      expect(objDigit4.ignoreSize).assertEqual("false");
      console.info('Swiper_Indicator END ');
      await Utils.sleep(500)
      done();
    })
  })
}