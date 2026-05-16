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

export default function swiperNextPreTest() {
  describe('swiperNextPreTest', () => {
    beforeAll(() => {
      console.info("swiperNextPreTest beforeAll start");

      await UtilsTest.startAbility("com.arkui.ace.swiper.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("swiperNextPreTest beforeEach start");
      try {
        const router = AppStorage.get<Router>("router") as Router;
        router.clear();
        let pages = router.getState();
        console.info("get swiperNextPreTest state pages:" + JSON.stringify(pages));
        if (!("swiper_next_previous" == pages.name)) {
          console.info("get swiperPageTest pages.name:" + JSON.stringify(pages.name));
          let result = router.pushUrl({
            url: "MainAbility/pages/Swiper/swiper2/swiper_next_previous"
          })
          await CommonFunc.sleep(2000);
          console.info("push swiperNextPreTest page result:");
        }
      } catch (err) {
        console.error("push swiperNextPreTest page error:" + err);
      }
      console.info("swiperNextPreTest foreEach end");
    });
    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("swiperNextPreTest after each called");
    });


    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_static_0050
     * @tc.name     SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_static_0050
     * @tc.desc     SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_static_0050
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_static_0050', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_static_0050] START');
      await CommonFunc.sleep(2000);
      // click the next button
      let driver = Driver.create();
      let buttonNext: Component = await driver.findComponent(ON.id('showNextT')) as Component;
      await (buttonNext?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      // get the component of text_3
      let text3: Component = await driver.findComponent(ON.text('3')) as Component;
      let ttContent = await text3.getText();
      expect(ttContent).assertEqual("3")
      console.info('[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_static_0050] END');
      done();
    });


    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_static_0060
     * @tc.name     SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_static_0060
     * @tc.desc     SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_static_0060
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_static_0060', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[] START');
      await CommonFunc.sleep(2000);
      // click the next button
      let driver = Driver.create();
      let buttonNext: Component = await driver.findComponent(ON.id('showPreviousT')) as Component;
      await (buttonNext?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      // get the component of text_2
      let text3: Component = await driver.findComponent(ON.text('2')) as Component;
      let ttContent = await text3.getText();
      expect(ttContent).assertEqual("2")
      console.info('[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_static_0060] END');
      done();
    });
  })
}
