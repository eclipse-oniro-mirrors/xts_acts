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
import { Component, Driver, On, ON, MouseButton } from '@kit.TestKit';

export default function IndexTest() {
  describe('SwiperIndicatorDistance', () => {
    beforeEach(async (done: Function) => {
      const SUITE: string = 'SwiperIndicatorDistance'
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Swiper/SwiperIndicatorDistanceTest",
      }
      try {
        router.clear();
        let pages: router.RouterState = router.getState();
        if (pages == null || !("DigitIndicator" == pages.name)) {
          await router.pushUrl(options).then(() => {
            console.info(`${SUITE} router.pushUrl success`);
          })
        }
      } catch (err) {
        console.error(`${SUITE} beforeEach error:` + JSON.stringify(err));
      }
      done()
    });


    /**
     * @tc.name   SwiperIndicatorDistance_0100
     * @tc.number SwiperIndicatorDistance_0100
     * @tc.desc   SwiperIndicatorDistance_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SwiperIndicatorDistance_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async () => {
      console.info('Swiper_DigitIndicator START');
      await sleep(1500)
      let driverDigit: Driver = Driver.create();
      let BottomButton: Component = await driverDigit.findComponent(ON.id('Bottom'));
      let IgnoreSizeButton: Component = await driverDigit.findComponent(ON.id('IgnoreSize'));
      let driverDot: Driver = Driver.create();
      let SpaceButton: Component = await driverDot.findComponent(ON.id('Space'))

      await IgnoreSizeButton.click();
      await sleep(500)
      let strJson1Digit = getInspectorByKey('Swiper_DigitIndicator');
      let strJson1Dot = getInspectorByKey('Swiper_DotIndicator');
      let obj1Digit: ESObject = JSON.parse(strJson1Digit);
      let objDigit1: ESObject = JSON.parse(obj1Digit.$attrs.indicator);
      let obj1Dot: ESObject = JSON.parse(strJson1Dot);
      let objDot1: ESObject = JSON.parse(obj1Dot.$attrs.indicator);
      expect(Number.parseFloat(objDigit1.bottom)).assertEqual(3);
      expect(Number.parseFloat(objDot1.space)).assertEqual(8);
      console.info("Swiper_Indicator ignoreSize unit: " + objDot1.ignoreSize)
      expect(objDot1.ignoreSize).assertEqual("true");

      expect(objDigit1.bottom.substr(objDigit1.bottom.length - 2, 2)).assertEqual("vp");
      expect(objDot1.space.substr(objDot1.space.length - 2, 2)).assertEqual("vp");

      await sleep(500)
      await BottomButton.click();
      await sleep(500)
      await SpaceButton.click();
      await sleep(500)
      let strJson2Digit = getInspectorByKey('Swiper_DigitIndicator');
      let strJson2Dot = getInspectorByKey('Swiper_DotIndicator');
      let obj2Digit: ESObject = JSON.parse(strJson2Digit);
      let obj2Dot: ESObject = JSON.parse(strJson2Dot);
      let objDigit2: ESObject = JSON.parse(obj2Digit.$attrs.indicator);
      let objDot2: ESObject = JSON.parse(obj2Dot.$attrs.indicator);
      expect(Number.parseFloat(objDigit2.bottom)).assertEqual(0);
      expect(Number.parseFloat(objDot2.space)).assertEqual(8);
      expect(objDigit2.bottom.substr(objDigit2.bottom.length - 2, 2)).assertEqual("vp");
      expect(objDot2.space.substr(objDot2.space.length - 2, 2)).assertEqual("vp");

      await sleep(500)
      await BottomButton.click();
      await sleep(500)
      await SpaceButton.click();
      await sleep(500)
      let strJson3Digit = getInspectorByKey('Swiper_DigitIndicator');
      let strJson3Dot = getInspectorByKey('Swiper_DotIndicator');
      let obj3Digit: ESObject = JSON.parse(strJson3Digit);
      let obj3Dot: ESObject = JSON.parse(strJson3Dot);
      let objDigit3: ESObject = JSON.parse(obj3Digit.$attrs.indicator);
      let objDot3: ESObject = JSON.parse(obj3Dot.$attrs.indicator);
      expect(Number.parseFloat(objDigit3.bottom)).assertEqual(0);
      expect(Number.parseFloat(objDot3.space)).assertEqual(8);
      expect(objDigit3.bottom.substr(objDigit3.bottom.length - 2, 2)).assertEqual("vp");
      expect(objDot3.space.substr(objDot3.space.length - 2, 2)).assertEqual("vp");

      await sleep(500)
      await BottomButton.click();
      await sleep(500)
      await SpaceButton.click();
      await sleep(500)
      await IgnoreSizeButton.click();
      await sleep(500)
      let strJson4Digit = getInspectorByKey('Swiper_DigitIndicator');
      let strJson4Dot = getInspectorByKey('Swiper_DotIndicator');
      console.info('Swiper_DigitIndicator START  :' + JSON.stringify(strJson4Digit));
      let obj4Digit: ESObject = JSON.parse(strJson4Digit);
      let obj4Dot: ESObject = JSON.parse(strJson4Dot);
      let objDigit4: ESObject = JSON.parse(obj4Digit.$attrs.indicator);
      let objDot4: ESObject = JSON.parse(obj4Dot.$attrs.indicator);
      expect(Number.parseFloat(objDigit4.bottom)).assertEqual(3);
      expect(Number.parseFloat(objDot4.space)).assertEqual(3);
      console.info("Swiper_Indicator bottom " + Number.parseFloat(objDigit4.bottom));
      expect(objDigit4.bottom.substr(objDigit4.bottom.length - 2, 2)).assertEqual("vp");
      expect(objDot4.space.substr(objDot4.space.length - 2, 2)).assertEqual("vp");
      console.info("Swiper_Indicator bottom unit: " + objDigit4.bottom.substr(objDigit4.bottom.length - 2, 2))

      expect(objDigit4.ignoreSize).assertEqual("false");
      console.info('Swiper_Indicator END ');
      await sleep(1500)
    })
  })
}

async function sleep(time: number) {
  return new Promise((resolve: (value: string) => void, reject) => {
    setTimeout(() => {
      resolve("sleep")
    }, time)
  }).then(() => {
    console.info(`sleep ${time} over...`)
  })
}
