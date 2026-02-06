'use static';
/**
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

import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level
} from '../../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import {
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import { UIContext, Router } from "@ohos.arkui.UIContext";
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';
import { Message, GlobalMessage } from '../../../../ets/MainAbility/common/MessageManager';
import RectValue from '../../../../ets/MainAbility/common/Rect';
import { UtilsTest, startAbility } from '../../Util.test';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function swiperMarPad() {
  describe('swiperMarPadTest03', () => {
    beforeAll(() => {
      console.info("swiperMarPad beforeAll start");

      await UtilsTest.startAbility("com.arkui.ace.swiper.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Swiper/Swiper_ParmsChange/swiperMarPad',
      };
      try {
        const router = AppStorage.get<Router>("router") as Router;
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get swiperMarPad state success " + JSON.stringify(pages));
        if (!("swiperMarPad" == pages.name)) {
          console.info("get swiperMarPad state success " + JSON.stringify(pages.name));
          router.pushUrl(options)
          console.info("push swiperMarPad page success ");
        }
      } catch (err) {
        console.error("push swiperMarPad page error " + JSON.stringify(err));
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("swiperVertical after each called");
    });


    
    /**
     * @tc.number   testSwiperSetPaddingMargin_static
     * @tc.name     testSwiperSetPaddingMargin_static
     * @tc.desc     testSwiperSetPaddingMargin_static
     * @tc.level    Level.LEVEL0
     */
it('testSwiperSetPaddingMargin_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testSwiperSetPaddingMargin_static START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('swiperMarPad');

      let swiperMarPad = CommonFunc.getComponentRectOnScreen('swiperMarPad');
      let swiperMarPad01 = CommonFunc.getComponentRectOnScreen('swiperMarPad01');
      let swiperMarPad02 = CommonFunc.getComponentRectOnScreen('swiperMarPad02');
      let swiperMarPad03 = CommonFunc.getComponentRectOnScreen('swiperMarPad03');
      let swiperMarPad04 = CommonFunc.getComponentRectOnScreen('swiperMarPad04');
      let swiperMarPad05 = CommonFunc.getComponentRectOnScreen('swiperMarPad05');
      let swiperMarPad06 = CommonFunc.getComponentRectOnScreen('swiperMarPad06');
      // Before flipping the page
      const uiContext = new UIContext();
      console.info("Before page turning , swiperMarPad01.left - swiperMarPad.left value is " +
      JSON.stringify(swiperMarPad01.left - swiperMarPad.left));
      expect(Math.abs(Math.round(swiperMarPad01.left - swiperMarPad.left) - Math.round(UIContext.resolveUIContext()!.vp2px(20))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(swiperMarPad.right - swiperMarPad01.right) - Math.round(UIContext.resolveUIContext()!.vp2px(20))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(swiperMarPad01.top - swiperMarPad.top) - Math.round(UIContext.resolveUIContext()!.vp2px(20))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(swiperMarPad.bottom - swiperMarPad01.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(20))) <= 1)
        .assertTrue();
      // Page turning.
      let driver = Driver.create();
      // await CommonFunc.sleep(500)
      // //  await driver.swipe(250, 230, 200, 230);
      //   await driver.swipe(UIContext.resolveUIContext()!.vp2px(180), vp2px(100), vp2px(20), vp2px(100));
      // await CommonFunc.sleep(1000);
      let gridRect: RectValue = CommonFunc.getComponentRectOnScreen('swiperMarPad')
      await driver.swipe(
        Number.parseInt(`${(gridRect.right - gridRect.left) * 0.8 + gridRect.left}`) as Int,
        Number.parseInt(`${(gridRect.bottom - gridRect.top) * 0.5 + gridRect.top}`) as Int,
        Number.parseInt(`${(gridRect.right - gridRect.left) * 0.1 + gridRect.left}`) as Int,
        Number.parseInt(`${(gridRect.bottom - gridRect.top) * 0.5 + gridRect.top}`) as Int,
        1000);
      await CommonFunc.sleep(3000);
      swiperMarPad = CommonFunc.getComponentRectOnScreen('swiperMarPad');
      swiperMarPad01 = CommonFunc.getComponentRectOnScreen('swiperMarPad01');
      swiperMarPad02 = CommonFunc.getComponentRectOnScreen('swiperMarPad02');
      swiperMarPad03 = CommonFunc.getComponentRectOnScreen('swiperMarPad03');
      swiperMarPad04 = CommonFunc.getComponentRectOnScreen('swiperMarPad04');
      swiperMarPad05 = CommonFunc.getComponentRectOnScreen('swiperMarPad05');
      swiperMarPad06 = CommonFunc.getComponentRectOnScreen('swiperMarPad06');
      // After flipping the page.
      console.info("After page turning, swiperMarPad02.left - swiperMarPad.left value is " +
      JSON.stringify(swiperMarPad02.left - swiperMarPad.left));
      expect(Math.abs(Math.round(swiperMarPad02.left - swiperMarPad.left) - Math.round(UIContext.resolveUIContext()!.vp2px(20))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(swiperMarPad.right - swiperMarPad02.right) - Math.round(UIContext.resolveUIContext()!.vp2px(20))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(swiperMarPad02.top - swiperMarPad.top) - Math.round(UIContext.resolveUIContext()!.vp2px(20))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(swiperMarPad.bottom - swiperMarPad02.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(20))) <= 1)
        .assertTrue();
      console.info("The type value is " +
      JSON.stringify(JSON.parseJsonElement(strJson).getString('$type')));
      console.info("The indicator value is " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('indicator')));
      console.info("The loop value is " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('loop')));
      console.info("The displayCount value is " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getInteger('displayCount')));
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Swiper');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('loop')).assertEqual('true');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getInteger('displayCount')).assertEqual(1);
      console.info('new testSwiperSetPaddingMargin_static END');
      done();
    });
  })
}