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
import { Visibility } from '@ohos.arkui.component';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import { UIContext, Router } from "@ohos.arkui.UIContext";
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';
import { Message, GlobalMessage,MessageManager } from '../../../../ets/MainAbility/common/MessageManager1';
import RectValue from '../../../../ets/MainAbility/common/Rect';
import { UtilsTest, startAbility } from '../../Util.test';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function swiperItemVisibility() {
  describe('swiperVisbleTest', () => {
    beforeAll(() => {
      console.info("swiperItemVisibility beforeAll start");

      await UtilsTest.startAbility("com.arkui.ace.swiper.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Swiper/Swiper_ItemChange/swiperItemVisibility',
      };
      try {
        const router = AppStorage.get<Router>("router") as Router;
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get swiperItemVisibility state success " + JSON.stringify(pages));
        if (!("MainAbility/pages/Swiper/Swiper_ItemChange/swiperItemVisibility" == pages.name)) {
          console.info("get swiperItemVisibility state success " + JSON.stringify(pages.name));
          router.replaceUrl(options)
          console.info("push swiperItemVisibility page success ");
        }
      } catch (err) {
        console.error("push swiperItemVisibility page error " + JSON.stringify(err));
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      const globalMessage =
        AppStorage.get<MessageManager<number>>('SwiperItemVisibilityTest');

      globalMessage?.notify({
        name: 'index', value: 0
      });
      globalMessage?.notify({
        name: 'visibility', value: Visibility.Visible
      });
      console.info("swiperItemVisibility after each called");
    });


    
    /**
     * @tc.number   SUB_ACE_SWIPER_VISIBLECHANGED_static_0100
     * @tc.name     SUB_ACE_SWIPER_VISIBLECHANGED_static_0100
     * @tc.desc     SUB_ACE_SWIPER_VISIBLECHANGED_static_0100
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_SWIPER_VISIBLECHANGED_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new SUB_ACE_SWIPER_VISIBLECHANGED_static_0100 START');
      const globalMessage =
        AppStorage.get<MessageManager<number>>('SwiperItemVisibilityTest');
      globalMessage?.notify({
        name: 'index', value: 0
      });
      let strJson = inspector.getInspectorByKey('visiblekey');

      let strJson1 = inspector.getInspectorByKey('visiblekey01');
      let visiblekey: RectValue = CommonFunc.getComponentRect('visiblekey');
      let visiblekey01: RectValue = CommonFunc.getComponentRect('visiblekey01');
      // 翻页前子组件1大小及位置与父组件一致
      console.info("Before page turning , the visiblekey.left value is " + JSON.stringify(visiblekey.left));
      console.info("Before page turning , the visiblekey01.left value is " + JSON.stringify(visiblekey01.left));
      expect(visiblekey.left).assertEqual(visiblekey01.left);
      expect(visiblekey.right).assertEqual(visiblekey01.right);
      expect(visiblekey.top).assertEqual(visiblekey01.top);
      expect(visiblekey.bottom).assertEqual(visiblekey01.bottom);
      let driver = Driver.create();
      await CommonFunc.sleep(2500);
      //   await driver.swipe(UIContext.resolveUIContext()!.vp2px(180), vp2px(100), vp2px(20), vp2px(100));原代码注释
      // //  await driver.swipe(250, 230, 200, 230);原代码注释
      // await CommonFunc.sleep(1000);原代码注释
      await CommonFunc.sleep(1000);
      let gridRect: RectValue = CommonFunc.getComponentRectOnScreen('visiblekey')
      await driver.swipe(
        Number.parseInt(`${(gridRect.right - gridRect.left) * 0.8 + gridRect.left}`) as Int,
        Number.parseInt(`${(gridRect.bottom - gridRect.top) * 0.5 + gridRect.top}`) as Int,
        Number.parseInt(`${(gridRect.right - gridRect.left) * 0.1 + gridRect.left}`) as Int,
        Number.parseInt(`${(gridRect.bottom - gridRect.top) * 0.5 + gridRect.top}`) as Int,
        1000);
      await CommonFunc.sleep(3000);
      // 翻页后子组件2大小及位置与父组件一致，翻页成功
      visiblekey = CommonFunc.getComponentRect('visiblekey');
      let visiblekey02: RectValue = CommonFunc.getComponentRect('visiblekey02');
      console.info("After page turning , the visiblekey.left value is " + JSON.stringify(visiblekey.left));
      console.info("After page turning , the visiblekey02.left value is " + JSON.stringify(visiblekey02.left));
      expect(visiblekey.left).assertEqual(visiblekey02.left);
      expect(visiblekey.right).assertEqual(visiblekey02.right);
      expect(visiblekey.top).assertEqual(visiblekey02.top);
      expect(visiblekey.bottom).assertEqual(visiblekey02.bottom);
      console.info("The type value is " +
      JSON.stringify(JSON.parseJsonElement(strJson).getString('$type')));
      console.info("The indicator value is " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('indicator')));
      console.info("The loop value is " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('loop')));
      console.info("The displayCount value is " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getInteger('displayCount')));
      console.info("The visibility value is " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('visibility')));
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Swiper');
      //      expect(JSON.parse(strJson).$attrs.indicator).assertEqual('true');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('loop')).assertEqual('true');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getInteger('displayCount')).assertEqual(1);
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('visibility'))
        .assertEqual('Visibility.Visible');
      console.info('new SUB_ACE_SWIPER_VISIBLECHANGED_static_0100 END');
      done();
    });


    
    /**
     * @tc.number   SUB_ACE_SWIPER_VISIBLECHANGED_static_0200
     * @tc.name     SUB_ACE_SWIPER_VISIBLECHANGED_static_0200
     * @tc.desc     SUB_ACE_SWIPER_VISIBLECHANGED_static_0200
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_SWIPER_VISIBLECHANGED_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new SUB_ACE_SWIPER_VISIBLECHANGED_static_0200 START');
      const globalMessage =
        AppStorage.get<MessageManager<number>>('SwiperItemVisibilityTest');
      globalMessage?.notify({
        name: 'visibility3', value: Visibility.Hidden
      });
      globalMessage?.notify({
        name: 'index', value: 4
      });
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('visiblekey');

      let strJson1 = inspector.getInspectorByKey('visiblekey05');
      let visiblekey: RectValue = CommonFunc.getComponentRect('visiblekey');
      let visiblekey05: RectValue = CommonFunc.getComponentRect('visiblekey05');
      // 翻页前子组件5大小及位置与父组件一致
      console.info("Before page turning , the visiblekey.left value is " + JSON.stringify(visiblekey.left));
      console.info("Before page turning , the visiblekey05.left value is " + JSON.stringify(visiblekey05.left));
      expect(visiblekey.left).assertEqual(visiblekey05.left);
      expect(visiblekey.right).assertEqual(visiblekey05.right);
      expect(visiblekey.top).assertEqual(visiblekey05.top);
      expect(visiblekey.bottom).assertEqual(visiblekey05.bottom);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let gridRect: RectValue = CommonFunc.getComponentRectOnScreen('visiblekey')
      await driver.swipe(
        Number.parseInt(`${(gridRect.right - gridRect.left) * 0.8 + gridRect.left}`) as Int,
        Number.parseInt(`${(gridRect.bottom - gridRect.top) * 0.5 + gridRect.top}`) as Int,
        Number.parseInt(`${(gridRect.right - gridRect.left) * 0.1 + gridRect.left}`) as Int,
        Number.parseInt(`${(gridRect.bottom - gridRect.top) * 0.5 + gridRect.top}`) as Int,
        1000);
      await CommonFunc.sleep(3000);
      // 翻页后子组件6大小及位置与父组件一致，翻页成功
      visiblekey = CommonFunc.getComponentRect('visiblekey');
      let visiblekey06: RectValue = CommonFunc.getComponentRect('visiblekey06');
      console.info("After page turning , the visiblekey.left value is " + visiblekey.left + ', ' + visiblekey.top + ', ' + visiblekey.right + ', ' + visiblekey.bottom);
      console.info("After page turning , the visiblekey.left value is " + visiblekey06.left + ', ' + visiblekey06.top + ', ' + visiblekey06.right + ', ' + visiblekey06.bottom);
      expect(visiblekey.left).assertEqual(visiblekey06.left);
      expect(visiblekey.right).assertEqual(visiblekey06.right);
      expect(visiblekey.top).assertEqual(visiblekey06.top);
      expect(visiblekey.bottom).assertEqual(visiblekey06.bottom);
      console.info("The type value is " +
      JSON.stringify(JSON.parseJsonElement(strJson).getString('$type')));
      console.info("The indicator value is " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('indicator')));
      console.info("The loop value is " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('loop')));
      console.info("The displayCount value is " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getInteger('displayCount')));
      console.info("The visibility value is " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('visibility')));
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Swiper');
      //      expect(JSON.parse(strJson).$attrs.indicator).assertEqual('true');原代码注释
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('loop')).assertEqual('true');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getInteger('displayCount')).assertEqual(1);
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('visibility'))
        .assertEqual('Visibility.Hidden');
      console.info('new SUB_ACE_SWIPER_VISIBLECHANGED_static_0200 END');
      done();
    });


    
    /**
     * @tc.number   SUB_ACE_SWIPER_VISIBLECHANGED_static_0300
     * @tc.name     SUB_ACE_SWIPER_VISIBLECHANGED_static_0300
     * @tc.desc     SUB_ACE_SWIPER_VISIBLECHANGED_static_0300
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_SWIPER_VISIBLECHANGED_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new SUB_ACE_SWIPER_VISIBLECHANGED_static_0300 START');
      const globalMessage =
        AppStorage.get<MessageManager<number>>('SwiperItemVisibilityTest');
      globalMessage?.notify({
        name: 'visibility2', value: Visibility.None
      });
      globalMessage?.notify({
        name: 'index', value: 2
      });
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('visiblekey');

      let strJson1 = inspector.getInspectorByKey('visiblekey03');
      let visiblekey: RectValue = CommonFunc.getComponentRect('visiblekey');
      let visiblekey03: RectValue = CommonFunc.getComponentRect('visiblekey03');
      // 翻页前子组件3隐藏不占位
      console.info("Before page turning , the visiblekey03.left value is " + JSON.stringify(visiblekey03.left));
      console.info("Before page turning , the visiblekey03.right value is " + JSON.stringify(visiblekey03.right));
      expect(visiblekey03.left).assertEqual(visiblekey03.right)
      expect(visiblekey03.top).assertEqual(visiblekey03.bottom)
      visiblekey = CommonFunc.getComponentRect('visiblekey');
      visiblekey03 = CommonFunc.getComponentRect('visiblekey03');
      let driver = Driver.create();
      // await CommonFunc.sleep(500);原代码注释
      //   await driver.swipe(UIContext.resolveUIContext()!.vp2px(180), vp2px(100), vp2px(20), vp2px(100));原代码注释
      // //  await driver.swipe(250, 230, 200, 230);原代码注释
      // await CommonFunc.sleep(1000);原代码注释
      await CommonFunc.sleep(1000);
      let gridRect: RectValue = CommonFunc.getComponentRectOnScreen('visiblekey')
      await driver.swipe(
        Number.parseInt(`${(gridRect.right - gridRect.left) * 0.8 + gridRect.left}`) as Int,
        Number.parseInt(`${(gridRect.bottom - gridRect.top) * 0.5 + gridRect.top}`) as Int,
        Number.parseInt(`${(gridRect.right - gridRect.left) * 0.1 + gridRect.left}`) as Int,
        Number.parseInt(`${(gridRect.bottom - gridRect.top) * 0.5 + gridRect.top}`) as Int,
        1000);
      await CommonFunc.sleep(3000);
      // 翻页后子组件4大小及位置与父组件一致，翻页成功
      visiblekey = CommonFunc.getComponentRect('visiblekey');
      let visiblekey04: RectValue = CommonFunc.getComponentRect('visiblekey04');
      console.info("After page turning , the visiblekey.left value is " + JSON.stringify(visiblekey.left));
      console.info("After page turning , the visiblekey04.left value is " + JSON.stringify(visiblekey04.left));
      expect(visiblekey.left).assertEqual(visiblekey04.left);
      expect(visiblekey.right).assertEqual(visiblekey04.right);
      expect(visiblekey.top).assertEqual(visiblekey04.top);
      expect(visiblekey.bottom).assertEqual(visiblekey04.bottom);
      console.info("The type value is " +
      JSON.stringify(JSON.parseJsonElement(strJson).getString('$type')));
      console.info("The indicator value is " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('indicator')));
      console.info("The loop value is " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('loop')));
      console.info("The displayCount value is " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getInteger('displayCount')));
      console.info("The visibility value is " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('visibility')));
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Swiper');
      //      expect(JSON.parse(strJson).$attrs.indicator).assertEqual('true');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('loop')).assertEqual('true');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getInteger('displayCount')).assertEqual(1);
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('visibility'))
        .assertEqual('Visibility.None');
      console.info('new SUB_ACE_SWIPER_VISIBLECHANGED_static_0300 END');
      done();
    });
  })
}