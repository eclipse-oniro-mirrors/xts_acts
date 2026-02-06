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

export default function swiperMargin() {
  describe('swiperMarPadTest01', () => {
    beforeAll(() => {
      console.info("swiperMargin beforeAll start");

      await UtilsTest.startAbility("com.arkui.ace.swiper.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Swiper/Swiper_ParmsChange/swiperMargin',
      };
      try {
        const router = AppStorage.get<Router>("router") as Router;
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get swiperMargin state success " + JSON.stringify(pages));
        if (!("swiperMargin" == pages.name)) {
          console.info("get swiperMargin state success " + JSON.stringify(pages.name));
          router.pushUrl(options)
          console.info("push swiperMargin page success ");
        }

      } catch (err) {
        console.error("push swiperMargin page error " + JSON.stringify(err));
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("swiperVertical after each called");
    });


    
    /**
     * @tc.number   testSwiperSetMargin_static
     * @tc.name     testSwiperSetMargin_static
     * @tc.desc     testSwiperSetMargin_static
     * @tc.level    Level.LEVEL0
     */
it('testSwiperSetMargin_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testSwiperSetMargin_static START');
      let strJson = inspector.getInspectorByKey('swiperMargin');

      await CommonFunc.sleep(1000);
      let swiperMargin: RectValue = CommonFunc.getComponentRect('swiperMargin');
      let swiperMargin01: RectValue = CommonFunc.getComponentRect('swiperMargin01');
      let swiperMargin02: RectValue = CommonFunc.getComponentRect('swiperMargin02');
      let swiperMargin03: RectValue = CommonFunc.getComponentRect('swiperMargin03');
      let swiperMargin04: RectValue = CommonFunc.getComponentRect('swiperMargin04');
      let swiperMargin05: RectValue = CommonFunc.getComponentRect('swiperMargin05');
      let swiperMargin06: RectValue = CommonFunc.getComponentRect('swiperMargin06');
      // Before flipping the page
      console.info("Before page turning , the swiperMargin.left value is " + JSON.stringify(swiperMargin.left));
      console.info("Before page turning , the swiperMargin01.left value is " + JSON.stringify(swiperMargin01.left));
      expect(swiperMargin.left).assertEqual(swiperMargin01.left);
      expect(swiperMargin.right).assertEqual(swiperMargin01.right);
      expect(swiperMargin.top).assertEqual(swiperMargin01.top);
      expect(swiperMargin.bottom).assertEqual(swiperMargin01.bottom);
      // Page turning.
      let driver = Driver.create();
      // await CommonFunc.sleep(500);
      // //  await driver.swipe(250, 230, 200, 230);
      //   await driver.swipe(UIContext.resolveUIContext()!.vp2px(180), vp2px(100), vp2px(20), vp2px(100));
      await CommonFunc.sleep(1000);
      let gridRect: RectValue = CommonFunc.getComponentRectOnScreen('swiperMargin')
      await driver.swipe(
        Number.parseInt(`${(gridRect.right - gridRect.left) * 0.8 + gridRect.left}`) as Int,
        Number.parseInt(`${(gridRect.bottom - gridRect.top) * 0.5 + gridRect.top}`) as Int,
        Number.parseInt(`${(gridRect.right - gridRect.left) * 0.1 + gridRect.left}`) as Int,
        Number.parseInt(`${(gridRect.bottom - gridRect.top) * 0.5 + gridRect.top}`) as Int,
        1000);
      await CommonFunc.sleep(3000);
      swiperMargin = CommonFunc.getComponentRectOnScreen('swiperMargin');
      swiperMargin01 = CommonFunc.getComponentRectOnScreen('swiperMargin01');
      swiperMargin02 = CommonFunc.getComponentRectOnScreen('swiperMargin02');
      swiperMargin03 = CommonFunc.getComponentRectOnScreen('swiperMargin03');
      swiperMargin04 = CommonFunc.getComponentRectOnScreen('swiperMargin04');
      swiperMargin05 = CommonFunc.getComponentRectOnScreen('swiperMargin05');
      swiperMargin06 = CommonFunc.getComponentRectOnScreen('swiperMargin06');
      // After flipping the page.
      console.info("After page turning , the swiperMargin.left value is " + JSON.stringify(swiperMargin.left));
      console.info("After page turning , the swiperMargin02.left value is " + JSON.stringify(swiperMargin02.left));
      expect(swiperMargin.left).assertEqual(swiperMargin02.left);
      expect(swiperMargin.right).assertEqual(swiperMargin02.right);
      expect(swiperMargin.top).assertEqual(swiperMargin02.top);
      expect(swiperMargin.bottom).assertEqual(swiperMargin02.bottom);
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
      console.info('new testSwiperSetMargin_static END');
      done();
    });
  })
}