'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, TestType, Size } from "../../../../hypium/index";
import Utils from '../common/Utils';
import { Driver, ON, PointerMatrix, Rect, Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test'
import { LibUtil } from '../../../ets/pages/LibUtil';

const libUtil: LibUtil = new LibUtil();

export default function swiperIndicatorDistanceTest() {
  console.info('push page export');
  describe('SwiperIndicatorDistanceTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility("com.openharmony.arkui_capi_xts_api18.static", "EntryAbility")
    });
    console.info('push page trying');
    afterEach(async (): Promise<void> => {
      await Utils.sleep(100)
    })

    
    /**
     * @tc.number   DigitIndicator_0100
     * @tc.name     DigitIndicator_0100
     * @tc.desc     DigitIndicator_0100
     * @tc.level    TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0
     */
    it('DigitIndicator_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'SwiperIndicatorDistanceTest';
      Utils.pushPage(`swiper/${PAGE_TAG}`, false);
      console.info('push page success');
      await Utils.sleep(1000);

      console.info('Swiper_DigitIndicator START');
      let driverDigit: Driver = Driver.create();
      await Utils.sleep(1000)
      let BottomButton: Component | null = await driverDigit.findComponent(ON.id('bottom'));
      let IgnoreSizeButton: Component | null = await driverDigit.findComponent(ON.id('ignoreSize'));
      let driverDot: Driver = Driver.create();
      let SpaceButton: Component | null = await driverDot.findComponent(ON.id('Space'))

      await (IgnoreSizeButton?.click() as Promise<void>);
      await Utils.sleep(500)
      await (IgnoreSizeButton?.click() as Promise<void>);
      await Utils.sleep(500)
      await (BottomButton?.click() as Promise<void>);
      await Utils.sleep(500)
      await (SpaceButton?.click() as Promise<void>);
      await Utils.sleep(500)

      let strJson1Digit = inspector.getInspectorByKey('SwiperDigitIndicator');
      let strJson1Dot = inspector.getInspectorByKey('SwiperDotIndicator');

      let obj1Digit = JSON.parseJsonElement(strJson1Digit);
      let objDigit1 = JSON.parseJsonElement(obj1Digit.getElement('$attrs').getString('indicator'));
      let obj1Dot = JSON.parseJsonElement(strJson1Dot);
      let objDot1 = JSON.parseJsonElement(obj1Dot.getElement('$attrs').getString('indicator'));

      expect(Number.parseFloat(objDigit1.getString('bottom'))).assertEqual(20);
      expect(Number.parseFloat(objDot1.getString('space'))).assertEqual(8);
      console.info("[SwiperIndicatorDistanceTest]77  -->: " + objDot1.getString('ignoreSize'))
      expect(objDot1.getString('ignoreSize')).assertEqual('true');

      expect(objDigit1.getString('bottom').substr(objDigit1.getString('bottom').length - 2, 2)).assertEqual("vp");
      expect(objDot1.getString('space').substr(objDot1.getString('space').length - 2, 2)).assertEqual("vp");

      await Utils.sleep(500)
      await (BottomButton?.click() as Promise<void>);
      await Utils.sleep(500)
      await (SpaceButton?.click() as Promise<void>);
      await Utils.sleep(500)
      let strJson2Digit = inspector.getInspectorByKey('SwiperDigitIndicator');
      let strJson2Dot = inspector.getInspectorByKey('SwiperDotIndicator');

      let obj2Digit = JSON.parseJsonElement(strJson2Digit);
      let obj2Dot = JSON.parseJsonElement(strJson2Dot);
      let objDigit2 = JSON.parseJsonElement(obj2Digit.getElement('$attrs').getString('indicator'));
      let objDot2 = JSON.parseJsonElement(obj2Dot.getElement('$attrs').getString('indicator'));
      console.info("[SwiperIndicatorDistanceTest]95 -->: " + Number.parseFloat(objDot2.getString('space')));
      expect(Number.parseFloat(objDigit2.getString('bottom'))).assertEqual(0);
      expect(Number.parseFloat(objDot2.getString('space'))).assertEqual(8);

      expect(objDigit2.getString('bottom').substr(objDigit2.getString('bottom').length - 2, 2)).assertEqual("vp");
      expect(objDot2.getString('space').substr(objDot2.getString('space').length - 2, 2)).assertEqual("vp");

      await Utils.sleep(500)
      await (BottomButton?.click() as Promise<void>);
      await Utils.sleep(500)
      await (SpaceButton?.click() as Promise<void>);
      await Utils.sleep(500)
      let strJson3Digit = inspector.getInspectorByKey('SwiperDigitIndicator');
      let strJson3Dot = inspector.getInspectorByKey('SwiperDotIndicator');
      let obj3Digit = JSON.parseJsonElement(strJson3Digit);
      let obj3Dot = JSON.parseJsonElement(strJson3Dot);
      let objDigit3 = JSON.parseJsonElement(obj3Digit.getElement('$attrs').getString('indicator'));
      let objDot3 = JSON.parseJsonElement(obj3Dot.getElement('$attrs').getString('indicator'));
      console.info("[SwiperIndicatorDistanceTest]113 -->: " + Number.parseFloat(objDigit3.getString('bottom')));
      expect(Number.parseFloat(objDigit3.getString('bottom'))).assertEqual(30);
      expect(Number.parseFloat(objDot3.getString('space'))).assertEqual(5);
      expect(objDigit3.getString('bottom').substr(objDigit3.getString('bottom').length - 2, 2)).assertEqual("vp");
      expect(objDot3.getString('space').substr(objDot3.getString('space').length - 2, 2)).assertEqual("vp");

      await Utils.sleep(500)
      await (BottomButton?.click() as Promise<void>);
      await Utils.sleep(500)
      await (SpaceButton?.click() as Promise<void>);
      await Utils.sleep(500)
      await (IgnoreSizeButton?.click() as Promise<void>);
      await Utils.sleep(500)
      let strJson4Digit = inspector.getInspectorByKey('SwiperDigitIndicator');
      let strJson4Dot = inspector.getInspectorByKey('SwiperDotIndicator');
      console.info('[SwiperIndicatorDistanceTest]128 -->:' + strJson4Digit);
      let obj4Digit = JSON.parseJsonElement(strJson4Digit);
      let obj4Dot = JSON.parseJsonElement(strJson4Dot);
      let objDigit4 = JSON.parseJsonElement(obj4Digit.getElement('$attrs').getString('indicator'));
      let objDot4 = JSON.parseJsonElement(obj4Dot.getElement('$attrs').getString('indicator'));
      expect(Number.parseFloat(objDigit4.getString('bottom'))).assertEqual(0);
      expect(Number.parseFloat(objDot4.getString('space'))).assertEqual(20);
      console.info("[SwiperIndicatorDistanceTest]135 -->: " + Number.parseFloat(objDigit4.getString('bottom')));
      expect(objDigit4.getString('bottom').substr(objDigit4.getString('bottom').length - 2, 2)).assertEqual("vp");
      expect(objDot4.getString('space').substr(objDot4.getString('space').length - 2, 2)).assertEqual("vp");
      console.info("Swiper_Indicator bottom unit: " + objDigit4.getString('bottom').substr(objDigit4.getString('bottom').length - 2, 2))
      expect(objDigit4.getString('ignoreSize')).assertEqual("false");
      console.info('Swiper_Indicator END ');
      await Utils.sleep(500)
      done();
    })
  })
}