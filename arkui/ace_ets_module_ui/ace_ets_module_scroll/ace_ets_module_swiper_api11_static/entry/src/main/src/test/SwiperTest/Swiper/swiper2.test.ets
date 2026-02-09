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

export default function swiper2() {
  describe('swiper2', () => {
    beforeAll(() => {
      console.info("swiper2 beforeAll start");

      await UtilsTest.startAbility("com.arkui.ace.swiper.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("swiper2 beforeEach start");
      try {
        const router = AppStorage.get<Router>("router") as Router;
        router.clear();
        let pages = router.getState();
        console.info("get swiper2 state pages:" + JSON.stringify(pages));
        if (!("swiper2" == pages.name)) {
          console.info("get  swiper2 pages.name:" + JSON.stringify(pages.name));
          let result = router.pushUrl({
            url: "MainAbility/pages/Swiper/Swiper/swiper2"
          })
          await CommonFunc.sleep(2000);
          console.info("push swiper2 page result:");
        }
      } catch (err) {
        console.error("push swiper2 page error:" + err);
      }
      console.info("swiper2 foreEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("swiper2 after each called");
    });


    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_static_0260
     * @tc.name     SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_static_0260
     * @tc.desc     SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_static_0260
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_static_0260', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_static_0260] START');
      await CommonFunc.sleep(2000);
      let bt = CommonFunc.getComponentRect('swiperTest2');
      //180,87,540,327
      let btTop = bt.top;
      let btBottom = bt.bottom;
      let btRight = bt.right;
      let btLeft = bt.left;
      console.info("[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_static_0260] swiper top:" + btTop + "bottom:" + btBottom +
        "right:" + btRight + "left:" + btLeft);
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      await driver.swipe(Math.round(btLeft) as Int, Math.round(btBottom / 2) as Int, (Math.round(btRight) + 40) as Int,
        Math.round(btBottom / 2) as Int);
      await CommonFunc.sleep(5000);

      let strJson = inspector.getInspectorByKey('swiperText2');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_static_0260] obj is: " +
      JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content') == '').assertTrue();

      console.info('[SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_UX_static_0130] END');
      done();
    });
  })
}