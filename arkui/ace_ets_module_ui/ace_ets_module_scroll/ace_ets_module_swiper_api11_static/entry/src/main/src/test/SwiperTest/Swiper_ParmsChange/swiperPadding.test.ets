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

export default function swiperPadding() {
  describe('swiperMarPadTest02', () => {
    beforeAll(() => {
      console.info("swiperPadding beforeAll start");

      await UtilsTest.startAbility("com.arkui.ace.swiper.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Swiper/Swiper_ParmsChange/swiperPadding',
      };
      try {
        const router = AppStorage.get<Router>("router") as Router;
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get swiperPadding state success " + JSON.stringify(pages));
        if (!("swiperPadding" == pages.name)) {
          console.info("get swiperPadding state success " + JSON.stringify(pages.name));
          router.pushUrl(options)
          console.info("push swiperPadding page success ");
        }

      } catch (err) {
        console.error("push swiperPadding page error " + JSON.stringify(err));
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("swiperVertical after each called");
    });


    
    /**
     * @tc.number   testSwiperSetPadding_static
     * @tc.name     testSwiperSetPadding_static
     * @tc.desc     testSwiperSetPadding_static
     * @tc.level    Level.LEVEL0
     */
it('testSwiperSetPadding_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testSwiperSetPadding_static START');
      let strJson = inspector.getInspectorByKey('swiperPadding');

      await CommonFunc.sleep(1000);
      let swiperPadding: RectValue = CommonFunc.getComponentRectOnScreen('swiperPadding');
      let swiperPadding01: RectValue = CommonFunc.getComponentRectOnScreen('swiperPadding01');
      let swiperPadding02: RectValue = CommonFunc.getComponentRectOnScreen('swiperPadding02');
      let swiperPadding03: RectValue = CommonFunc.getComponentRectOnScreen('swiperPadding03');
      let swiperPadding04: RectValue = CommonFunc.getComponentRectOnScreen('swiperPadding04');
      let swiperPadding05: RectValue = CommonFunc.getComponentRectOnScreen('swiperPadding05');
      let swiperPadding06: RectValue = CommonFunc.getComponentRectOnScreen('swiperPadding06');
      // Before flipping the page
      const uiContext = new UIContext();
      console.info("Before page turning , swiperPadding01.left - swiperPadding.left value is " +
      JSON.stringify(swiperPadding01.left - swiperPadding.left));
      expect(Math.abs(Math.round(swiperPadding01.left - swiperPadding.left) - Math.round(UIContext.resolveUIContext()!.vp2px(20))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(swiperPadding.right - swiperPadding01.right) - Math.round(UIContext.resolveUIContext()!.vp2px(20))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(swiperPadding01.top - swiperPadding.top) - Math.round(UIContext.resolveUIContext()!.vp2px(20))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(swiperPadding.bottom - swiperPadding01.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(20))) <= 1)
        .assertTrue();
      // Page turning.
      let driver = Driver.create();
      // await CommonFunc.sleep(500);
      //   await driver.swipe(UIContext.resolveUIContext()!.vp2px(180), vp2px(100), vp2px(20), vp2px(100));
      // //  await driver.swipe(250, 230, 200, 230);
      // await CommonFunc.sleep(1000);
      let gridRect: RectValue = CommonFunc.getComponentRectOnScreen('swiperPadding')
      await driver.swipe(
        Number.parseInt(`${(gridRect.right - gridRect.left) * 0.8 + gridRect.left}`) as Int,
        Number.parseInt(`${(gridRect.bottom - gridRect.top) * 0.5 + gridRect.top}`) as Int,
        Number.parseInt(`${(gridRect.right - gridRect.left) * 0.1 + gridRect.left}`) as Int,
        Number.parseInt(`${(gridRect.bottom - gridRect.top) * 0.5 + gridRect.top}`) as Int,
        1000);
      await CommonFunc.sleep(3000);
      swiperPadding = CommonFunc.getComponentRectOnScreen('swiperPadding');
      swiperPadding01 = CommonFunc.getComponentRectOnScreen('swiperPadding01');
      swiperPadding02 = CommonFunc.getComponentRectOnScreen('swiperPadding02');
      swiperPadding03 = CommonFunc.getComponentRectOnScreen('swiperPadding03');
      swiperPadding04 = CommonFunc.getComponentRectOnScreen('swiperPadding04');
      swiperPadding05 = CommonFunc.getComponentRectOnScreen('swiperPadding05');
      swiperPadding06 = CommonFunc.getComponentRectOnScreen('swiperPadding06');
      // After flipping the page.
      console.info("After page turning, swiperPadding02.left - swiperPadding.left value is " +
      JSON.stringify(swiperPadding02.left - swiperPadding.left));
      expect(Math.abs(Math.round(swiperPadding02.left - swiperPadding.left) - Math.round(UIContext.resolveUIContext()!.vp2px(20))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(swiperPadding.right - swiperPadding02.right) - Math.round(UIContext.resolveUIContext()!.vp2px(20))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(swiperPadding02.top - swiperPadding.top) - Math.round(UIContext.resolveUIContext()!.vp2px(20))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(swiperPadding.bottom - swiperPadding02.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(20))) <= 1)
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
      console.info('new testSwiperSetPadding_static END');
      done();
    });
  })
}