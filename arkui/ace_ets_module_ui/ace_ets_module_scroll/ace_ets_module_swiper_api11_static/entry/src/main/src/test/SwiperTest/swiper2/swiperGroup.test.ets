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

export default function swiperGroupTest() {
  describe('swiperGroupTest', () => {
    beforeAll(() => {
      console.info("swiperGroupTest beforeAll start");

      await UtilsTest.startAbility("com.arkui.ace.swiper.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("swiperGroupTest beforeEach start");
      try {
        const router = AppStorage.get<Router>("router") as Router;
        router.clear();
        let pages = router.getState();
        console.info("get swiperGroupTest state pages:" + JSON.stringify(pages));
        if (!("siwper_group_test" == pages.name)) {
          console.info("get swiperPageTest pages.name:" + JSON.stringify(pages.name));
          let result = router.pushUrl({
            url: "MainAbility/pages/Swiper/swiper2/siwper_group_test"
          })
          await CommonFunc.sleep(2000);
          console.info("push swiperGroupTest page result:");
        }
      } catch (err) {
        console.error("push swiperGroupTest page error:" + err);
      }
      console.info("swiperGroupTest foreEach end");
    });
    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("swiperGroupTest after each called");
    });


    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_static_0040
     * @tc.name     SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_static_0040
     * @tc.desc     SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_static_0040
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_static_0040', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_static_0040] START');
      await CommonFunc.sleep(2000);
      let bt = CommonFunc.getComponentRect('swiperTestWidth3');

      let btTop = bt.top;
      let btBottom = bt.bottom;
      let btRight = bt.right;
      let btLeft = bt.left;
      let btWidth = Math.round(btRight - btLeft);
      let btHeight = Math.round(btTop - btBottom);
      console.info("[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_static_0040] swiper width " + btWidth + "----" + btHeight);

      // swipe the component of swiper to right by  group
      let driver = Driver.create();
      const uiContext = new UIContext();
      const winLeft = AppStorage.get<number>('winLeft') ?? 0;
      const winTop = AppStorage.get<number>('winTop as Int') ?? 0;
      await driver.swipe(Math.round(winLeft + Math.round(btRight) - Math.round(UIContext.resolveUIContext()!.vp2px(20))) as Int,
        Math.round(winTop + Math.round(btBottom / 2)) as Int,
        Math.round(winLeft + Math.round(btLeft) as Int + Math.round(UIContext.resolveUIContext()!.vp2px(10))) as Int,
        Math.round(winTop + Math.round(btBottom / 2)) as Int);
      await CommonFunc.sleep(4800);
      // get the component of text_6
      let text3: Component = await driver.findComponent(ON.text('6')) as Component;
      let ttContent = await text3.getText();
      expect(ttContent).assertEqual("6")
      console.info('[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_static_0040] END');
      done();
    });
  })
}
