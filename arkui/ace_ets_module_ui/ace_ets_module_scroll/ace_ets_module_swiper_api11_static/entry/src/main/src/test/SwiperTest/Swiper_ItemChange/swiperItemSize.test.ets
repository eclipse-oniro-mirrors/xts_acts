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
import { Message, GlobalMessage } from '../../../../ets/MainAbility/common/MessageManager1';
import RectValue from '../../../../ets/MainAbility/common/Rect';
import { UtilsTest, startAbility } from '../../Util.test';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function swiperItemSize() {
  describe('swiperItemSizeTest', () => {
    beforeAll(() => {
      console.info("swiperItemSize beforeAll start");

      await UtilsTest.startAbility("com.arkui.ace.swiper.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Swiper/Swiper_ItemChange/swiperItemSize',
      };
      try {
        const router = AppStorage.get<Router>("router") as Router;
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get swiperItemSize state success " + JSON.stringify(pages));
        if (!("swiperItemSize" == pages.name)) {
          console.info("get swiperItemSize state success " + JSON.stringify(pages.name));
          router.pushUrl(options)
          console.info("push swiperItemSize page success ");
        }
      } catch (err) {
        console.error("push swiperItemSize page error " + JSON.stringify(err));
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("swiperItemSize after each called");
    });


    
    /**
     * @tc.number   testSwiperItemSize_static
     * @tc.name     testSwiperItemSize_static
     * @tc.desc     testSwiperItemSize_static
     * @tc.level    Level.LEVEL0
     */
it('testSwiperItemSize_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testSwiperItemSize_static START');
      let strJson = inspector.getInspectorByKey('itemSizekey');

      let itemSizekey = CommonFunc.getComponentRectOnScreen('itemSizekey');
      let itemSizekey01 = CommonFunc.getComponentRectOnScreen('itemSizekey01');
      let itemSizekey02 = CommonFunc.getComponentRectOnScreen('itemSizekey02');
      let itemSizekey03 = CommonFunc.getComponentRectOnScreen('itemSizekey03');
      // Before flipping the page.
      console.info("Before page turning , the itemSizekey.left value is " + JSON.stringify(itemSizekey.left));
      console.info("Before page turning , the itemSizekey01.left value is " + JSON.stringify(itemSizekey01.left));
      expect(itemSizekey.left).assertEqual(itemSizekey01.left);
      expect(itemSizekey.top).assertEqual(itemSizekey01.top);
      expect(itemSizekey.right).assertEqual(itemSizekey01.right);

      // Flipping.
      let driver = Driver.create();
      //  await driver.swipe(250, 230, 200, 230); 原代码注释
      await CommonFunc.sleep(2500);
      //   await driver.swipe(UIContext.resolveUIContext()!.vp2px(180), vp2px(100), vp2px(20), vp2px(100));原代码注释
      // await CommonFunc.sleep(1000);原代码注释
      await CommonFunc.sleep(1000);
      let gridRect: RectValue = CommonFunc.getComponentRectOnScreen('itemSizekey')
      await driver.swipe(
        Number.parseInt(`${(gridRect.right - gridRect.left) * 0.8 + gridRect.left}`) as Int,
        Number.parseInt(`${(gridRect.bottom - gridRect.top) * 0.5 + gridRect.top}`) as Int,
        Number.parseInt(`${(gridRect.right - gridRect.left) * 0.1 + gridRect.left}`) as Int,
        Number.parseInt(`${(gridRect.bottom - gridRect.top) * 0.5 + gridRect.top}`) as Int,
        1000);
      await CommonFunc.sleep(3000);
      // After flipping the page.
      itemSizekey = CommonFunc.getComponentRectOnScreen('itemSizekey');
      itemSizekey01 = CommonFunc.getComponentRectOnScreen('itemSizekey01');
      itemSizekey02 = CommonFunc.getComponentRectOnScreen('itemSizekey02');
      itemSizekey03 = CommonFunc.getComponentRectOnScreen('itemSizekey03');
      console.info("After page turning , the itemSizekey.left value is " + JSON.stringify(itemSizekey.left));
      console.info("After page turning , the itemSizekey02.left value is " + JSON.stringify(itemSizekey02.left));
      expect(itemSizekey.left).assertEqual(itemSizekey02.left);
      expect(itemSizekey.top).assertEqual(itemSizekey02.top);
      expect(itemSizekey.right).assertEqual(itemSizekey02.right);

      console.info("The type value is " +
      JSON.stringify(JSON.parseJsonElement(strJson).getString('$type')));
      console.info("The loop value is " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('loop')));
      console.info("The displayCount value is " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getInteger('displayCount')));
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Swiper');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('loop')).assertEqual('true');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getInteger('displayCount')).assertEqual(1);
      console.info('new testSwiperItemSize END');
      done();
    });
  })
}