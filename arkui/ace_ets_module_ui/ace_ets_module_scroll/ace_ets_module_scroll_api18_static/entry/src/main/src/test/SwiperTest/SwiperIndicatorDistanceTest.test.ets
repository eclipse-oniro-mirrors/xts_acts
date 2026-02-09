'use static';
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

import { afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index'
import router from '@ohos.router';
import {
  Component,
  DisplayRotation,
  Driver,
  MatchPattern,
  ON,
  PointerMatrix,
  ResizeDirection,
  UiWindow,
  WindowMode
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { startAbility, UtilsTest } from '../Util.test';

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function IndexTest() {
  describe('SwiperIndicatorDistance', () => {
    beforeAll(() => {
      console.info("SwiperIndicatorDistance beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.scroll18.static", "EntryAbility");
      
    });

    beforeEach(async (): Promise<void> => {
      const SUITE: string = 'SwiperIndicatorDistance'
      const swiperIndicatorDistanceTest = AppStorage.get<Router>("router") as Router
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Swiper/SwiperIndicatorDistanceTest",
      }
      try {
        swiperIndicatorDistanceTest.clear();
        let pages: router.RouterState = swiperIndicatorDistanceTest.getState();
        console.info("before push " + JSON.stringify(pages));
        if (pages == null || !("SwiperIndicatorDistanceTest" == pages.name)) {
          swiperIndicatorDistanceTest.pushUrl(options).then(() => {
            console.info(`${SUITE} router.pushUrl success`);
          })
          console.info("after push " + JSON.stringify(pages));
          await sleep(1000)
        }
      } catch (err) {
        console.error(`${SUITE} beforeEach error:` + JSON.stringify(err));
      }
    });

    
    /**
     * @tc.number   SwiperIndicatorDistance_static_0100
     * @tc.name     SwiperIndicatorDistance_static_0100
     * @tc.desc     SwiperIndicatorDistance_static_0100
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
it('SwiperIndicatorDistance_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
        console.info('Swiper_DigitIndicator START');
        await sleep(1500)
        let driverDigit: Driver = Driver.create();
        let BottomButton: Component = await driverDigit.findComponent(ON.id('Bottom')) as Component;
        let IgnoreSizeButton: Component = await driverDigit.findComponent(ON.id('IgnoreSize')) as Component;
        let driverDot: Driver = Driver.create();
        let SpaceButton: Component = await driverDot.findComponent(ON.id('Space')) as Component

        await (IgnoreSizeButton?.click() as Promise<void>);
        await sleep(500)
        let strJson1Digit = inspector.getInspectorByKey('Swiper_DigitIndicator');
        let strJson1Dot = inspector.getInspectorByKey('Swiper_DotIndicator');
        let obj1Digit = JSON.parseJsonElement(strJson1Digit);
        let objDigit1 = JSON.parseJsonElement(obj1Digit.getElement('$attrs').getString('indicator'));
        let obj1Dot = JSON.parseJsonElement(strJson1Dot);
        console.info("Swiper_Indicator indicator" + obj1Dot.getElement('$attrs').getString('indicator'))
        let objDot1 = JSON.parseJsonElement(obj1Dot.getElement('$attrs').getString('indicator'));
        // expect(Number.parseFloat(objDigit1.getString('bottom'))).assertEqual(3);
        expect(Number.parseFloat(objDot1.getString('space'))).assertEqual(8);
        console.info("Swiper_Indicator ignoreSize unit: " + objDot1.getString('ignoreSize'))
        // expect(objDot1.getString('ignoreSize')).assertEqual("true");
        //
        // expect(objDigit1.getString('bottom').substr(objDigit1.getString('bottom').length - 2, 2)).assertEqual("vp");
        // expect(objDot1.getString('space').substr(objDot1.getString('space').length - 2, 2)).assertEqual("vp");
        //
        // await sleep(500)
        // await (BottomButton?.click() as Promise<void>);
        // await sleep(500)
        // await (SpaceButton?.click() as Promise<void>);
        // await sleep(500)
        // let strJson2Digit = inspector.getInspectorByKey('Swiper_DigitIndicator');
        // let strJson2Dot = inspector.getInspectorByKey('Swiper_DotIndicator');
        // let obj2Digit = JSON.parseJsonElement(strJson2Digit);
        // let obj2Dot = JSON.parseJsonElement(strJson2Dot);
        // let objDigit2 = JSON.parseJsonElement(obj2Digit.getElement('$attrs').getString('indicator'));
        // let objDot2 = JSON.parseJsonElement(obj2Dot.getElement('$attrs').getString('indicator'));
        // expect(Number.parseFloat(objDigit2.getString('bottom'))).assertEqual(0);
        // expect(Number.parseFloat(objDot2.getString('space'))).assertEqual(8);
        // expect(objDigit2.getString('bottom').substr(objDigit2.getString('bottom').length - 2, 2)).assertEqual("vp");
        // expect(objDot2.getString('space').substr(objDot2.getString('space').length - 2, 2)).assertEqual("vp");
        //
        // await sleep(500)
        // await (BottomButton?.click() as Promise<void>);
        // await sleep(500)
        // await (SpaceButton?.click() as Promise<void>);
        // await sleep(500)
        // let strJson3Digit = inspector.getInspectorByKey('Swiper_DigitIndicator');
        // let strJson3Dot = inspector.getInspectorByKey('Swiper_DotIndicator');
        // let obj3Digit = JSON.parseJsonElement(strJson3Digit);
        // let obj3Dot = JSON.parseJsonElement(strJson3Dot);
        // let objDigit3 = JSON.parseJsonElement(obj3Digit.getElement('$attrs').getString('indicator'));
        // let objDot3 = JSON.parseJsonElement(obj3Dot.getElement('$attrs').getString('indicator'));
        // expect(Number.parseFloat(objDigit3.getString('bottom'))).assertEqual(0);
        // expect(Number.parseFloat(objDot3.getString('space'))).assertEqual(8);
        // expect(objDigit3.getString('bottom').substr(objDigit3.getString('bottom').length - 2, 2)).assertEqual("vp");
        // expect(objDot3.getString('space').substr(objDot3.getString('space').length - 2, 2)).assertEqual("vp");
        //
        // await sleep(500)
        // await (BottomButton?.click() as Promise<void>);
        // await sleep(500)
        // await (SpaceButton?.click() as Promise<void>);
        // await sleep(500)
        // await IgnoreSizeButton.click();
        // await sleep(500)
        // let strJson4Digit = inspector.getInspectorByKey('Swiper_DigitIndicator');
        // let strJson4Dot = inspector.getInspectorByKey('Swiper_DotIndicator');
        // console.info('Swiper_DigitIndicator START  :' + JSON.stringify(strJson4Digit));
        // let obj4Digit = JSON.parseJsonElement(strJson4Digit);
        // let obj4Dot = JSON.parseJsonElement(strJson4Dot);
        // let objDigit4 = JSON.parseJsonElement(obj4Digit.getElement('$attrs').getString('indicator'));
        // let objDot4 = JSON.parseJsonElement(obj4Dot.getElement('$attrs').getString('indicator'));
        // expect(Number.parseFloat(objDigit4.getString('bottom'))).assertEqual(3);
        // expect(Number.parseFloat(objDot4.getString('space'))).assertEqual(3);
        // console.info("Swiper_Indicator bottom " + Number.parseFloat(objDigit4.getString('bottom')));
        // expect(objDigit4.getString('bottom').substr(objDigit4.getString('bottom').length - 2, 2)).assertEqual("vp");
        // expect(objDot4.getString('space').substr(objDot4.getString('space').length - 2, 2)).assertEqual("vp");
        // console.info("Swiper_Indicator bottom unit: " +
        // objDigit4.getString('bottom').substr(objDigit4.getString('bottom').length - 2, 2))
        //
        // expect(objDigit4.getString('ignoreSize')).assertEqual("false");
        // console.info('Swiper_Indicator END ');
        // await sleep(1500)
      })
  })
}

async function sleep(time: number) {
  return new Promise<string>((resolve: (value: string) => void, reject) => {
    setTimeout(() => {
      resolve("sleep")
    }, time.toInt())
  }).then(() => {
    console.info(`sleep ${time} over...`)
  })
}
