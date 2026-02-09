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
import { Message, GlobalMessage, MessageManager } from '../../../../ets/MainAbility/common/MessageManager1';
import RectValue from '../../../../ets/MainAbility/common/Rect';
import { UtilsTest, startAbility } from '../../Util.test';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function swiperItemSpace() {
  describe('swiperItemSpaceTest', () => {
    beforeAll(() => {
      console.info("swiperItemSpace beforeAll start");

      await UtilsTest.startAbility("com.arkui.ace.swiper.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Swiper/Swiper_ParmsChange/swiperItemSpace',
      };
      try {
        const routerSwiper = AppStorage.get<Router>("router") as Router;
        routerSwiper.clear();
        await CommonFunc.sleep(1000);
        let pages = routerSwiper.getState();
        console.info("get swiperItemSpace state success " + JSON.stringify(pages));
        if (!("swiperItemSpace" == pages.name)) {
          console.info("get swiperItemSpace state success " + JSON.stringify(pages.name));
          routerSwiper.pushUrl(options)
          await CommonFunc.sleep(2000);
          console.info("push swiperItemSpace page success ");
        }
      } catch (err) {
        console.error("push swiperItemSpace page error " + JSON.stringify(err));
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("swiperItemSpace after each called");
    });


    
    /**
     * @tc.number   testSwiperSetItemSpace_static
     * @tc.name     testSwiperSetItemSpace_static
     * @tc.desc     testSwiperSetItemSpace_static
     * @tc.level    Level.LEVEL0
     */
it('testSwiperSetItemSpace_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testSwiperSetItemSpace_static START');
    AppStorage.get<MessageManager<number>>('messageManager')?.notify({
      name: 'itemspace', value: 20
    });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('itemspacekey');

      let itemspacekey = CommonFunc.getComponentRect('itemspacekey');
      let itemspacekey01 = CommonFunc.getComponentRect('itemspacekey01');
      let itemspacekey02 = CommonFunc.getComponentRect('itemspacekey02');
      let itemspacekey03 = CommonFunc.getComponentRect('itemspacekey03');
      let itemspacekey04 = CommonFunc.getComponentRect('itemspacekey04');
      let itemspacekey05 = CommonFunc.getComponentRect('itemspacekey05');
      let itemspacekey06 = CommonFunc.getComponentRect('itemspacekey06');
      // Before flipping the page.
      console.info("Before page turning , the itemspacekey.left value is " + JSON.stringify(itemspacekey.left));
      console.info("Before page turning , the itemspacekey01.left value is " + JSON.stringify(itemspacekey01.left));
      expect(Math.abs(itemspacekey.left - itemspacekey01.left) <= 1).assertTrue();
      expect(Math.abs(itemspacekey.top - itemspacekey01.top) <= 1).assertTrue();
      expect(Math.abs(itemspacekey.bottom - itemspacekey01.bottom) <= 1).assertTrue();
      // Page turning.
      expect(Math.abs(itemspacekey.top - itemspacekey02.top) <= 1).assertTrue();
      expect(Math.abs(itemspacekey.bottom - itemspacekey02.bottom) <= 1).assertTrue();
      const uiContext = new UIContext();
      expect(Math.abs(Math.round(itemspacekey02.left - itemspacekey01.right) - Math.round(UIContext.resolveUIContext()!.vp2px(20))) <= 1)
        .assertTrue();
      expect(Math.abs(itemspacekey.right - itemspacekey02.right) <= 1).assertTrue();

      let driver = Driver.create();
      // await CommonFunc.sleep(500);
      //   await driver.swipe(UIContext.resolveUIContext()!.vp2px(180), vp2px(100), vp2px(20), vp2px(100));
      await CommonFunc.sleep(1000);

      let gridRect: RectValue = CommonFunc.getComponentRectOnScreen('itemspacekey')
      const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      let x1 = Number.parseInt(`${(gridRect.right - gridRect.left) * 0.8 + gridRect.left}`) as Int;
      let y1 = Number.parseInt(`${(gridRect.bottom - gridRect.top) * 0.5 + gridRect.top}`) as Int;
      let x2 = Number.parseInt(`${(gridRect.right - gridRect.left) * 0.1 + gridRect.left}`) as Int;
      let y2 = Number.parseInt(`${(gridRect.bottom - gridRect.top) * 0.5 + gridRect.top}`) as Int;
      let time = (x1 - x2) / 0.5;
      let cmd = 'uinput -T -m ' + JSON.stringify(x1) + ' ' + JSON.stringify(y1) + ' ' + JSON.stringify(x2) + ' ' +
      JSON.stringify(y2) + ' ' + JSON.stringify(time);
      await delegator.executeShellCommand(cmd);

      await CommonFunc.sleep(3000);
      itemspacekey = CommonFunc.getComponentRect('itemspacekey');
      itemspacekey01 = CommonFunc.getComponentRect('itemspacekey01');
      itemspacekey02 = CommonFunc.getComponentRect('itemspacekey02');
      itemspacekey03 = CommonFunc.getComponentRect('itemspacekey03');
      itemspacekey04 = CommonFunc.getComponentRect('itemspacekey04');
      itemspacekey05 = CommonFunc.getComponentRect('itemspacekey05');
      itemspacekey06 = CommonFunc.getComponentRect('itemspacekey06');
      // After flipping the page.
      console.info("After page turning , the itemspacekey.left value is " + JSON.stringify(itemspacekey.left));
      console.info("After page turning , the itemspacekey02.left value is " + JSON.stringify(itemspacekey02.left));
      expect(Math.abs(itemspacekey.left - itemspacekey02.left) <= 1).assertTrue();
      expect(Math.abs(itemspacekey.top - itemspacekey02.top) <= 1).assertTrue();
      expect(Math.abs(itemspacekey.bottom - itemspacekey02.bottom) <= 1).assertTrue();

      expect(Math.abs(itemspacekey.top - itemspacekey03.top) <= 1).assertTrue();
      expect(Math.abs(itemspacekey.bottom - itemspacekey03.bottom) <= 1).assertTrue();
      expect(Math.abs(Math.round(itemspacekey03.left - itemspacekey02.right) - Math.round(UIContext.resolveUIContext()!.vp2px(20))) <= 1)
        .assertTrue();
      expect(Math.abs(itemspacekey.right - itemspacekey03.right) <= 1).assertTrue();
      console.info("The type value is " +
      JSON.stringify(JSON.parseJsonElement(strJson).getString('$type')));
      console.info("The loop value is " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('loop')));
      console.info("The itemSpace value is " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('itemSpace')));
      console.info("The displayCount value is " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getInteger('displayCount')));
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Swiper');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('loop')).assertEqual('true');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('itemSpace')).assertEqual('20.00vp');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getInteger('displayCount')).assertEqual(2);
      console.info('new testSwiperSetItemSpace_static END');
      done();
    });


    
    /**
     * @tc.number   testSwiperSetItemSpaceInvalid_static
     * @tc.name     testSwiperSetItemSpaceInvalid_static
     * @tc.desc     testSwiperSetItemSpaceInvalid_static
     * @tc.level    Level.LEVEL0
     */
it('testSwiperSetItemSpaceInvalid_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testSwiperSetItemSpaceInvalid_static START');
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'itemspace', value: -20
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('itemspacekey');

      let itemspacekey = CommonFunc.getComponentRect('itemspacekey');
      let itemspacekey01 = CommonFunc.getComponentRect('itemspacekey01');
      let itemspacekey02 = CommonFunc.getComponentRect('itemspacekey02');
      let itemspacekey03 = CommonFunc.getComponentRect('itemspacekey03');
      let itemspacekey04 = CommonFunc.getComponentRect('itemspacekey04');
      let itemspacekey05 = CommonFunc.getComponentRect('itemspacekey05');
      let itemspacekey06 = CommonFunc.getComponentRect('itemspacekey06');
      // Before flipping the page.
      console.info("Before page turning , the itemspacekey.left value is " + JSON.stringify(itemspacekey.left));
      console.info("Before page turning , the itemspacekey01.left value is " + JSON.stringify(itemspacekey01.left));
      expect(Math.abs(itemspacekey.left - itemspacekey01.left) <= 1).assertTrue();
      expect(Math.abs(itemspacekey.top - itemspacekey01.top) <= 1).assertTrue();
      expect(Math.abs(itemspacekey.bottom - itemspacekey01.bottom) <= 1).assertTrue();

      expect(Math.abs(itemspacekey.top - itemspacekey02.top) <= 1).assertTrue();
      expect(Math.abs(itemspacekey.bottom - itemspacekey02.bottom) <= 1).assertTrue();
      expect(Math.abs(itemspacekey02.left - itemspacekey01.right) <= 1).assertTrue();
      expect(Math.abs(itemspacekey02.right - itemspacekey.right) <= 1).assertTrue();
      // After flipping the page.
      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let gridRect: RectValue = CommonFunc.getComponentRectOnScreen('itemspacekey')
      const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      let x1 = Number.parseInt(`${(gridRect.right - gridRect.left) * 0.8 + gridRect.left}`) as Int;
      let y1 = Number.parseInt(`${(gridRect.bottom - gridRect.top) * 0.5 + gridRect.top}`) as Int;
      let x2 = Number.parseInt(`${(gridRect.right - gridRect.left) * 0.1 + gridRect.left}`) as Int;
      let y2 = Number.parseInt(`${(gridRect.bottom - gridRect.top) * 0.5 + gridRect.top}`) as Int;
      let time = (x1 - x2) / 0.5;
      let cmd = 'uinput -T -m ' + JSON.stringify(x1) + ' ' + JSON.stringify(y1) + ' ' + JSON.stringify(x2) + ' ' +
      JSON.stringify(y2) + ' ' + JSON.stringify(time);
      await (delegator.executeShellCommand(cmd) as Promise<abilityDelegatorRegistry.ShellCmdResult>);

      await CommonFunc.sleep(3000);
      itemspacekey = CommonFunc.getComponentRect('itemspacekey');
      itemspacekey01 = CommonFunc.getComponentRect('itemspacekey01');
      itemspacekey02 = CommonFunc.getComponentRect('itemspacekey02');
      itemspacekey03 = CommonFunc.getComponentRect('itemspacekey03');
      itemspacekey04 = CommonFunc.getComponentRect('itemspacekey04');
      itemspacekey05 = CommonFunc.getComponentRect('itemspacekey05');
      itemspacekey06 = CommonFunc.getComponentRect('itemspacekey06');

      console.info("After page turning , the itemspacekey.left value is " + JSON.stringify(itemspacekey.left));
      console.info("After page turning , the itemspacekey02.left value is " + JSON.stringify(itemspacekey02.left));
      expect(Math.abs(itemspacekey.left - itemspacekey02.left) <= 1).assertTrue();
      expect(Math.abs(itemspacekey.top - itemspacekey02.top) <= 1).assertTrue();
      expect(Math.abs(itemspacekey.bottom - itemspacekey02.bottom) <= 1).assertTrue();

      expect(Math.abs(itemspacekey.top - itemspacekey03.top) <= 1).assertTrue();
      expect(Math.abs(itemspacekey.bottom - itemspacekey03.bottom) <= 1).assertTrue();
      expect(Math.abs(itemspacekey03.left - itemspacekey02.right) <= 1).assertTrue();
      expect(Math.abs(itemspacekey03.right - itemspacekey.right) <= 1).assertTrue();
      console.info("The type value is " +
      JSON.stringify(JSON.parseJsonElement(strJson).getString('$type')));
      console.info("The loop value is " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('loop')));
      console.info("The itemSpace value is " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('itemSpace')));
      console.info("The displayCount value is " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getInteger('displayCount')));
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Swiper');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('loop')).assertEqual('true');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('itemSpace')).assertEqual('0.00vp');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getInteger('displayCount')).assertEqual(2);
      console.info('new testSwiperSetItemSpaceInvalid_static END');
      done();
    });
  })
}