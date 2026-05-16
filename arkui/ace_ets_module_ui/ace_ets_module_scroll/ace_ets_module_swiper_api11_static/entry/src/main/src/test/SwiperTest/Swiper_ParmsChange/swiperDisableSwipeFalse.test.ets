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

export default function swiperDisableSwipeFalse() {
  describe('swiperDisableSwipeTest', () => {
    beforeAll(() => {
      console.info("swiperDisableSwipeFalse beforeAll start");

      await UtilsTest.startAbility("com.arkui.ace.swiper.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Swiper/Swiper_ParmsChange/swiperDisableSwipeFalse',
      };
      try {
        const router = AppStorage.get<Router>("router") as Router;
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get DisableSwipe state success " + JSON.stringify(pages));
        if (!("DisableSwipe" == pages.name)) {
          console.info("get DisableSwipe state success " + JSON.stringify(pages.name));
          router.pushUrl(options)
          console.info("push DisableSwipe page success ");
        }
      } catch (err) {
        console.error("push DisableSwipe page error " + JSON.stringify(err));
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("DisableSwipe after each called");
    });


    
    /**
     * @tc.number   testSwiperDisableSwipeFalse_static
     * @tc.name     testSwiperDisableSwipeFalse_static
     * @tc.desc     testSwiperDisableSwipeFalse_static
     * @tc.level    Level.LEVEL0
     */
it('testSwiperDisableSwipeFalse_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testSwiperDisableSwipeFalse_static START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('disableFalse');

      let disableFalse = CommonFunc.getComponentRectOnScreen('disableFalse');
      let disableFalse01 = CommonFunc.getComponentRectOnScreen('disableFalse01');
      let disableFalse02 = CommonFunc.getComponentRectOnScreen('disableFalse02');
      let disableFalse03 = CommonFunc.getComponentRectOnScreen('disableFalse03');
      let disableFalse04 = CommonFunc.getComponentRectOnScreen('disableFalse04');
      let disableFalse05 = CommonFunc.getComponentRectOnScreen('disableFalse05');
      let disableFalse06 = CommonFunc.getComponentRectOnScreen('disableFalse06');
      // Before flipping the page.
      console.info("Before page turning , the disableFalse.left value is " + JSON.stringify(disableFalse.left));
      console.info("Before page turning , the disableFalse01.left value is " + JSON.stringify(disableFalse01.left));
      expect(disableFalse.left).assertEqual(disableFalse01.left);
      expect(disableFalse.right).assertEqual(disableFalse01.right);
      expect(disableFalse.top).assertEqual(disableFalse01.top);
      expect(disableFalse.bottom).assertEqual(disableFalse01.bottom);
      let driver = Driver.create();
      // await CommonFunc.sleep(500);
      //   await driver.swipe(UIContext.resolveUIContext()!.vp2px(180), vp2px(100), vp2px(20), vp2px(100));
      // //  await driver.swipe(250, 230, 200, 230);
      // await CommonFunc.sleep(1000);
      let gridRect: RectValue = CommonFunc.getComponentRectOnScreen('disableFalse')
      await driver.swipe(
        Number.parseInt(`${(gridRect.right - gridRect.left) * 0.8 + gridRect.left}`) as Int,
        Number.parseInt(`${(gridRect.bottom - gridRect.top) * 0.5 + gridRect.top}`) as Int,
        Number.parseInt(`${(gridRect.right - gridRect.left) * 0.1 + gridRect.left}`) as Int,
        Number.parseInt(`${(gridRect.bottom - gridRect.top) * 0.5 + gridRect.top}`) as Int,
        1000);
      await CommonFunc.sleep(3000);
      // After flipping the page.
      disableFalse = CommonFunc.getComponentRectOnScreen('disableFalse');
      disableFalse01 = CommonFunc.getComponentRectOnScreen('disableFalse01');
      disableFalse02 = CommonFunc.getComponentRectOnScreen('disableFalse02');
      disableFalse03 = CommonFunc.getComponentRectOnScreen('disableFalse03');
      disableFalse04 = CommonFunc.getComponentRectOnScreen('disableFalse04');
      disableFalse05 = CommonFunc.getComponentRectOnScreen('disableFalse05');
      disableFalse06 = CommonFunc.getComponentRectOnScreen('disableFalse06');
      console.info("After page turning , the disableFalse.left value is " + JSON.stringify(disableFalse.left));
      console.info("After page turning , the disableFalse02.left value is " + JSON.stringify(disableFalse02.left));
      expect(disableFalse.left).assertEqual(disableFalse02.left);
      expect(disableFalse.right).assertEqual(disableFalse02.right);
      expect(disableFalse.top).assertEqual(disableFalse02.top);
      expect(disableFalse.bottom).assertEqual(disableFalse02.bottom);
      console.info("The type value is " +
      JSON.stringify(JSON.parseJsonElement(strJson).getString('$type')));
      console.info("The loop value is " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('loop')));
      console.info("The disableSwipe value is " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('disableSwipe')));
      console.info("The displayCount value is " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getInteger('displayCount')));
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Swiper');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('loop')).assertEqual('true');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('disableSwipe')).assertEqual('false');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getInteger('displayCount')).assertEqual(1);
      console.info('new testSwiperDisableSwipeFalse_static END');
      done();
    });
  })
}