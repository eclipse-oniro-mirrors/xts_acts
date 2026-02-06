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

export default function swiperDelAddTest() {
  describe('swiperDelAddTest', () => {
    beforeAll(() => {
      console.info("swiperDelAddTest beforeAll start");

      await UtilsTest.startAbility("com.arkui.ace.swiper.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("swiperDelAddTest beforeEach start");
      try {
        const routerSwiper = AppStorage.get<Router>("router") as Router;
        routerSwiper.clear();
        let pages = routerSwiper.getState();
        console.info("get swiperDelAddTest state pages:" + JSON.stringify(pages));
        if (!("siwper_adddelete_test" == pages.name)) {
          console.info("get swiperDelAddTest pages.name:" + JSON.stringify(pages.name));
          routerSwiper.pushUrl({
            url: "MainAbility/pages/Swiper/swiper2/siwper_adddelete_test"
          })
          await CommonFunc.sleep(2000);
          console.info("push swiperDelAddTest page result:");
        }
      } catch (err) {
        console.error("push swiperDelAddTest page error:" + err);
      }
      console.info("swiperDelAddTest foreEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("swiperDelAddTest after each called");
    });


    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_static_0070
     * @tc.name     SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_static_0070
     * @tc.desc     SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_static_0070
     * @tc.level    Level.LEVEL1
     */
it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_static_0070', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_static_0070] START');
      await CommonFunc.sleep(2000);
      // click the delete button
      let driver = Driver.create();
      let buttonDele: Component = await driver.findComponent(ON.id('deleteTT')) as Component;
      await buttonDele.click();
      await CommonFunc.sleep(2000);

      // right scroll
      let bt = CommonFunc.getComponentRect('swiperTestWidth5');
      let btBottom = bt.bottom;
      let btTop = bt.top;
      let btRight = bt.right;
      let btLeft = bt.left;
      let btWidth = Math.round(btRight - btLeft);
      let btHeight = Math.round(btBottom - btTop);
      console.info("[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_static_0700] swiper width " + btWidth);
      const uiContext = new UIContext();
      const winLeft = AppStorage.get<number>('winLeft') ?? 0;
      const winTop = AppStorage.get<number>('winTop as Int') ?? 0;
      await driver.swipe(winLeft + Math.round(btLeft)  + Math.round(UIContext.resolveUIContext()!.vp2px(20) )as Int,
      (winTop + btTop + Math.round(btHeight / 2))as Int, (winLeft + Math.round(btRight)) as Int, (winTop + btTop + Math.round(btHeight / 2))as Int);
      await CommonFunc.sleep(3000);

      // click the Previous button
      let buttonPrevious: Component = await driver.findComponent(ON.id('showPreviousTT')) as Component;
      await (buttonPrevious?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      // get the component of text_2
      let text9: Component = await driver.findComponent(ON.text('8')) as Component;
      let ttContent = await text9.getText();
      expect(ttContent).assertEqual("8")
      console.info('[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_static_0070] END');
      done();
    });


    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_static_0080
     * @tc.name     SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_static_0080
     * @tc.desc     SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_static_0080
     * @tc.level    Level.LEVEL1
     */
it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_static_0080', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_static_0080] START');
      await CommonFunc.sleep(2000);
      // click the add button
      let driver = Driver.create();
      let buttonAdd: Component = await driver.findComponent(ON.id('addTT')) as Component;
      await buttonAdd.click();
      await CommonFunc.sleep(2000);

      let changeIndex: Component = await driver.findComponent(ON.id('change_8')) as Component;
      await changeIndex.click();
      await CommonFunc.sleep(2000);

      // left scroll
      let bt = CommonFunc.getComponentRect('swiperTestWidth5');
      let btBottom = bt.bottom;
      let btTop = bt.top;
      let btRight = bt.right;
      let btLeft = bt.left;
      let btWidth = Math.round(btRight - btLeft);
      let btHeight = Math.round(btBottom - btTop);
      console.info("[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_static_0080] swiper width " + btWidth);
      const uiContext = new UIContext();
      const winLeft = AppStorage.get<number>('winLeft') ?? 0;
      const winTop = AppStorage.get<number>('winTop as Int') ?? 0;
      // right scroll
      await driver.swipe(Math.round(winLeft + Math.round(btRight) - UIContext.resolveUIContext()!.vp2px(10)) as Int,
        Math.round(winTop + btTop + Math.round(btHeight / 2)) as Int,
        Math.round(winLeft + Math.round(btLeft) as Int + Math.round(UIContext.resolveUIContext()!.vp2px(20) as Int)) as Int,
        Math.round(winTop + btTop + Math.round(btHeight / 2)) as Int);
      await CommonFunc.sleep(5000);

      // click the next button
      let buttonNext: Component = await driver.findComponent(ON.id('showNextTT')) as Component;
      await (buttonNext?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      // get the component of text_10
      let text10: Component = await driver.findComponent(ON.text('10')) as Component;
      let ttContent = await text10.getText();
      expect(ttContent).assertEqual("10")
      console.info('[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_static_0080] END');
      done();
    });
  })
}
