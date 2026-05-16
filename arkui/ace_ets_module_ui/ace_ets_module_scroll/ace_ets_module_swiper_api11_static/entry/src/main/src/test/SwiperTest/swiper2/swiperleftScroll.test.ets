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

export default function swipeleftScrollTest() {
  describe('swipeleftScrollTest', () => {
    beforeAll(() => {
      console.info("swipeleftScrollTest beforeAll start");

      await UtilsTest.startAbility("com.arkui.ace.swiper.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("swipeleftScrollTest beforeEach start");
      try {
        const router = AppStorage.get<Router>("router") as Router;
        router.clear();
        let pages = router.getState();
        console.info("get swipeleftScrollTest state pages:" + JSON.stringify(pages));
        if (!("siwpe_leftscroll" == pages.name)) {
          console.info("get swipeleftScrollTest pages.name:" + JSON.stringify(pages.name));
          let result = router.pushUrl({
            url: "MainAbility/pages/Swiper/swiper2/siwpe_leftscroll"
          })
          await CommonFunc.sleep(2000);
          console.info("push swipeleftScrollTest page result:");
        }
      } catch (err) {
        console.error("push swipeleftScrollTest page error:" + err);
      }
      console.info("swipeleftScrollTest foreEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("swipeleftScrollTest after each called");
    });


    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_static_0310
     * @tc.name     SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_static_0310
     * @tc.desc     SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_static_0310
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_static_0310', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_static_0310] START');
      await CommonFunc.sleep(2000);
      let bt = CommonFunc.getComponentRect('swiperTestWidth8');
      let btBottom = bt.bottom;
      let btRight = bt.right;
      let btLeft = bt.left;
      let btWidth = Math.round(btRight - btLeft);
      console.info("[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_static_0310] swiper width " + btWidth);
      // left scroll
      let driver = Driver.create();
      const uiContext = new UIContext();
      const winLeft = AppStorage.get<number>('winLeft') ?? 0;
      const winTop = AppStorage.get<number>('winTop as Int') ?? 0;
      await driver.swipe(Math.round(winLeft + Math.round(btRight) - UIContext.resolveUIContext()!.vp2px(50)) as Int,
        Math.round(winTop + Math.round(btBottom / 2)) as Int,
        Math.round((winLeft + Math.round(btLeft) as Int + Math.round(UIContext.resolveUIContext()!.vp2px(27) as Int))) as Int,
        Math.round(winTop + Math.round(btBottom / 2)) as Int);
      await CommonFunc.sleep(5000);

      // get the component of text_1
      let text1: Component = await driver.findComponent(ON.text('1')) as Component;
      let ttContent = await text1.getText();
      expect(ttContent).assertEqual("1")
      console.info('[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_static_0310] END');
      done();
    });
  })
}