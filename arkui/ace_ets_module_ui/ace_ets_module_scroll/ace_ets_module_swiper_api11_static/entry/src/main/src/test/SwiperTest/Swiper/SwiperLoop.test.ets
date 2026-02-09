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
import { UtilsTest, startAbility } from '../../Util.test';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function SwiperLoop() {
  describe('SwiperLoop', () => {
    beforeAll(() => {
      console.info("SwiperLoop beforeAll start");

      await UtilsTest.startAbility("com.arkui.ace.swiper.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("SwiperLoop beforeEach start");
      try {
        const router = AppStorage.get<Router>("router") as Router;
        router.clear();
        let pages = router.getState();
        console.info("get SwiperLoop state pages:" + JSON.stringify(pages));
        if (!("SwiperLoop" == pages.name)) {
          console.info("get  SwiperLoop pages.name:" + JSON.stringify(pages.name));
          let result = router.pushUrl({
            url: "MainAbility/pages/Swiper/Swiper/SwiperLoop"
          })
          await CommonFunc.sleep(2000);
          console.info("push SwiperLoop page result:");
        }
      } catch (err) {
        console.error("push SwiperLoop page error:" + err);
      }
      console.info("SwiperLoop foreEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("SwiperLoop after each called");
    });


    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_static_0270
     * @tc.name     SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_static_0270
     * @tc.desc     SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_static_0270
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_static_0270', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_static_0270] START');
      await CommonFunc.sleep(2000);
      let bt = CommonFunc.getComponentRect('swiperLoop');
      //180,87,540,327
      let btTop = bt.top;
      let btBottom = bt.bottom;
      let btRight = bt.right;
      let btLeft = bt.left;
      console.info("[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_static_0270] swiper top:" + btTop + "bottom:" + btBottom +
        "right:" + btRight + "left:" + btLeft);
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button_Bottom = await driver.findComponent(ON.id('swiperLoopButton1'));
      await (button_Bottom?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      const uiContext = new UIContext();
      const winLeft = AppStorage.get<number>('winLeft') ?? 0;
      const winTop = AppStorage.get<number>('winTop as Int') ?? 0;
      await driver.swipe(Math.round(winLeft + btRight) as Int, Math.round(winTop + btBottom / 2) as Int,
        (Math.round(winLeft + btLeft) as Int + Math.round(UIContext.resolveUIContext()!.vp2px(27) as Int) as Int),
        Math.round(btBottom / 2) as Int + winTop as Int as Int);
      await CommonFunc.sleep(3500);

      let strJson = inspector.getInspectorByKey('SwiperLoopText10');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_static_0270] obj is: " +
      JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content') == '10').assertTrue();
      console.info('[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_static_0270] END');
      done();
    });


    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_static_0280
     * @tc.name     SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_static_0280
     * @tc.desc     SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_static_0280
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_static_0280', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_static_0280] START');
      await CommonFunc.sleep(2000);
      let bt = CommonFunc.getComponentRect('swiperLoop');
      //180,87,540,327
      let btTop = bt.top;
      let btBottom = bt.bottom;
      let btRight = bt.right;
      let btLeft = bt.left;
      console.info("[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_static_0280] swiper top:" + btTop + "bottom:" + btBottom +
        "right:" + btRight + "left:" + btLeft);
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button_Bottom = await driver.findComponent(ON.id('swiperLoopButton2'));
      await (button_Bottom?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      const uiContext = new UIContext();
      const winLeft = AppStorage.get<number>('winLeft') ?? 0;
      const winTop = AppStorage.get<number>('winTop as Int') ?? 0;
      await driver.swipe((winLeft as Int + Math.round(btLeft) as Int + Math.round(UIContext.resolveUIContext()!.vp2px(27) as Int) as Int),
        Math.round(winTop + btBottom / 2) as Int, Math.round(winLeft + btRight) as Int,
        Math.round(winTop + btBottom / 2) as Int);
      await CommonFunc.sleep(3500);

      let strJson = inspector.getInspectorByKey('SwiperLoopText10');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_static_0280] obj is: " +
      JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content') == '10').assertTrue();

      console.info('[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_static_0280] END');
      done();
    });


    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_static_0340
     * @tc.name     SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_static_0340
     * @tc.desc     SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_static_0340
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_static_0340', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_static_0340] START');
      await CommonFunc.sleep(2000);
      let bt = CommonFunc.getComponentRect('swiperLoop');
      let btTop = bt.top;
      let btBottom = bt.bottom;
      let btRight = bt.right;
      let btLeft = bt.left;
      console.info("[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_static_0340] swiper top:" + btTop + "bottom:" + btBottom +
        "right:" + btRight + "left:" + btLeft);
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button_Bottom = await driver.findComponent(ON.id('swiperLoopButton3'));
      await (button_Bottom?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      const uiContext = new UIContext();
      const winLeft = AppStorage.get<number>('winLeft') ?? 0;
      const winTop = AppStorage.get<number>('winTop as Int') ?? 0;
      await driver.swipe((Math.round(winLeft + btRight - UIContext.resolveUIContext()!.vp2px(50)) as Int),
        Math.round(winTop + btBottom / 2) as Int,
        (Math.round(winLeft + btLeft + Math.round(UIContext.resolveUIContext()!.vp2px(27))) as Int),
        Math.round(winTop + btBottom / 2) as Int);
      await CommonFunc.sleep(3500);

      let strJson = inspector.getInspectorByKey('SwiperLoopText6');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_static_0340] obj is: " +
      JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content') == '6').assertTrue();

      console.info('[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_static_0340] END');
      done();
    });


    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_static_0350
     * @tc.name     SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_static_0350
     * @tc.desc     SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_static_0350
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_static_0350', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_static_0350] START');
      await CommonFunc.sleep(2000);
      let bt = CommonFunc.getComponentRect('swiperLoop');
      let btTop = bt.top;
      let btBottom = bt.bottom;
      let btRight = bt.right;
      let btLeft = bt.left;
      console.info("[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_static_0350] swiper top:" + btTop + "bottom:" + btBottom +
        "right:" + btRight + "left:" + btLeft);
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      const uiContext = new UIContext();
      const winLeft = AppStorage.get<number>('winLeft') ?? 0;
      const winTop = AppStorage.get<number>('winTop as Int') ?? 0;
      await driver.swipe((Math.round(winLeft + btLeft) + Math.round(UIContext.resolveUIContext()!.vp2px(27)) as Int),
        Math.round(winTop + btBottom / 2) as Int, Math.round(winLeft + btRight) as Int,
        Math.round(winTop + btBottom / 2) as Int);
      await CommonFunc.sleep(3500);

      let strJson = inspector.getInspectorByKey('SwiperLoopText5');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_static_0350] obj is: " +
      JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content') == '5').assertTrue();

      console.info('[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_static_0350] END');
      done();
    });


    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_static_0480
     * @tc.name     SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_static_0480
     * @tc.desc     SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_static_0480
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_static_0480', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_static_0480] START');
      await CommonFunc.sleep(2000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button_Bottom = await driver.findComponent(ON.id('swiperLoopButton4'));
      await (button_Bottom?.click() as Promise<void>);
      await CommonFunc.sleep(4000);

      let strJson = inspector.getInspectorByKey('SwiperLoopText10');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_static_0480] obj is: " +
      JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content') == '10').assertTrue();

      console.info('[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_static_0480] END');
      done();
    });
  })
}
