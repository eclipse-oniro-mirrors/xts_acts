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

export default function swiperDisableSwipeTrue() {
  describe('swiperDisableSwipeTest', () => {
    beforeAll(() => {
      console.info("swiperDisableSwipeTrue beforeAll start");

      await UtilsTest.startAbility("com.arkui.ace.swiper.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Swiper/Swiper_ParmsChange/swiperDisableSwipeTrue',
      };
      try {
        const router = AppStorage.get<Router>("router") as Router;
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get swiperDisableSwipeTrue state success " + JSON.stringify(pages));
        if (!("swiperDisableSwipeTrue" == pages.name)) {
          console.info("get swiperDisableSwipeTrue state success " + JSON.stringify(pages.name));
          router.pushUrl(options)
          console.info("push swiperDisableSwipeTrue page success ");
        }
      } catch (err) {
        console.error("push swiperDisableSwipeTrue page error " + JSON.stringify(err));
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("DisableSwipe after each called");
    });


    
    /**
     * @tc.number   testSwiperDisableSwipeTrue_static
     * @tc.name     testSwiperDisableSwipeTrue_static
     * @tc.desc     testSwiperDisableSwipeTrue_static
     * @tc.level    Level.LEVEL0
     */
it('testSwiperDisableSwipeTrue_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testSwiperDisableSwipeTrue_static START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('disableTrue');

      let disableTrue = CommonFunc.getComponentRectOnScreen('disableTrue');
      let disableTrue01 = CommonFunc.getComponentRectOnScreen('disableTrue01');
      let disableTrue02 = CommonFunc.getComponentRectOnScreen('disableTrue02');
      let disableTrue03 = CommonFunc.getComponentRectOnScreen('disableTrue03');
      let disableTrue04 = CommonFunc.getComponentRectOnScreen('disableTrue04');
      let disableTrue05 = CommonFunc.getComponentRectOnScreen('disableTrue05');
      let disableTrue06 = CommonFunc.getComponentRectOnScreen('disableTrue06');
      // Before flipping the page.
      console.info("Before page turning , the disableTrue.left value is " + JSON.stringify(disableTrue.left));
      console.info("Before page turning , the disableTrue01.left value is " + JSON.stringify(disableTrue01.left));
      expect(disableTrue.left).assertEqual(disableTrue01.left);
      expect(disableTrue.right).assertEqual(disableTrue01.right);
      expect(disableTrue.top).assertEqual(disableTrue01.top);
      expect(disableTrue.bottom).assertEqual(disableTrue01.bottom);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      const uiContext = new UIContext();
      await driver.swipe(Math.round(UIContext.resolveUIContext()!.vp2px(150)) as Int, Math.round(UIContext.resolveUIContext()!.vp2px(100)) as Int,
        Math.round(UIContext.resolveUIContext()!.vp2px(100)) as Int, Math.round(UIContext.resolveUIContext()!.vp2px(100)) as Int);
      //  await driver.swipe(250, 230, 200, 230);
      await CommonFunc.sleep(1000);
      disableTrue01 = CommonFunc.getComponentRectOnScreen('disableTrue01');
      disableTrue02 = CommonFunc.getComponentRectOnScreen('disableTrue02');
      disableTrue03 = CommonFunc.getComponentRectOnScreen('disableTrue03');
      disableTrue04 = CommonFunc.getComponentRectOnScreen('disableTrue04');
      disableTrue05 = CommonFunc.getComponentRectOnScreen('disableTrue05');
      disableTrue06 = CommonFunc.getComponentRectOnScreen('disableTrue06');
      // After flipping the page.
      console.info("After page turning , the disableTrue.left value is " + JSON.stringify(disableTrue.left));
      console.info("After page turning , the disableTrue01.left value is " + JSON.stringify(disableTrue01.left));
      expect(disableTrue.left).assertEqual(disableTrue01.left);
      expect(disableTrue.right).assertEqual(disableTrue01.right);
      expect(disableTrue.top).assertEqual(disableTrue01.top);
      expect(disableTrue.bottom).assertEqual(disableTrue01.bottom);
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
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('disableSwipe')).assertEqual('true');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getInteger('displayCount')).assertEqual(1);
      console.info('new testSwiperDisableSwipeTrue_static END');
      done();
    });
  })
}