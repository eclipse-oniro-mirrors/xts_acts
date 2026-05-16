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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../../hypium/index";
import router from '@ohos.router';
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import {
  Component,
  Driver,
  MouseButton,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import text from "@ohos.graphics.text"
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../../Util.test'

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function SwiperMargin_1() {
  describe('SwiperMargin_1', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.scroll12.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("SwiperMargin_1 beforeEach start");
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get SwiperMargin_1 state pages:" + JSON.stringify(pages));
        if (!("SwiperMargin_1" == pages.name)) {
          console.info("get Context pages.name:" + JSON.stringify(pages.name));
          router.pushUrl({
            url: "MainAbility/pages/Swiper/SwiperAttribute/SwiperMargin_1"
          })
          await CommonFunc.sleep(1000);
        }
      } catch (err) {
        console.error("push SwiperMargin_1 page error:" + err);
      }
      console.info("SwiperMargin_1 foreEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SwiperMargin_1 after each called");
    });



    
      
  
/**
     * @tc.number   SwiperMargin_static_0070
     * @tc.name     SwiperMargin_static_0070
     * @tc.desc     SwiperMargin_static_0070
     * @tc.level    Level.LEVEL0
     */
it('SwiperMargin_static_0070', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SwiperMargin_static_0070] START');

      let swiperRect = CommonFunc.getComponentRect('swiperMargin_1');
      let swiperLeft = swiperRect.left;

      let textRect = CommonFunc.getComponentRect('swiperMargin_1Column01');
      let textLeft = textRect.left;

      let spaceMargin = swiperLeft - textLeft;
      console.info("[SwiperMargin_static_0070] The spaceMargin value is " + spaceMargin);
      const uiContext = AppStorage.get<UIContext>('uiContext')!;
      expect(Math.abs(Math.round(swiperLeft - textLeft)) - uiContext.vp2px(10) <= 1).assertTrue();
      console.info('[SwiperMargin_static_0070] END');
      done();
    });

    
      
  
/**
     * @tc.number   SwiperMargin_static_0200
     * @tc.name     SwiperMargin_static_0200
     * @tc.desc     SwiperMargin_static_0200
     * @tc.level    Level.LEVEL0
     */
it('SwiperMargin_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SwiperMargin_static_0200] START');

      let rect = CommonFunc.getComponentRectOnScreen('swiperMargin_1')
      console.info("SwiperMargin_static_0200 swiper rect is " + rect.left + " --" + rect.right + "--" + rect.top +
        "--" +
      rect.bottom);
      let driver = Driver.create()
      await driver.swipe(
        (Number.parseInt(`${(rect.right - rect.left) * 0.8 + rect.left}`)).toInt(),
        (Number.parseInt(`${(rect.bottom - rect.top) * 0.5 + rect.top}`)).toInt(),
        (Number.parseInt(`${(rect.right - rect.left) * 0.1 + rect.left}`)).toInt(),
        (Number.parseInt(`${(rect.bottom - rect.top) * 0.5 + rect.top}`)).toInt(),
        1000);
      await CommonFunc.sleep(1000);

      let swiperRect = CommonFunc.getComponentRect('swiperMargin_1');
      let swiperRight = swiperRect.right;

      let columnRect = CommonFunc.getComponentRect('swiperMargin_1Column02');
      let columnLeft = columnRect.right;

      let spaceMargin = swiperRight - columnLeft;
      console.info("[SwiperMargin_static_0200] The spaceMargin value is " + JSON.stringify(spaceMargin));
      const uiContext = AppStorage.get<UIContext>('uiContext')!;
      expect(Math.abs(Math.round(spaceMargin)) - uiContext.vp2px(20) <= 1).assertTrue();

      console.info('[SwiperMargin_static_0200] END');
      done();
    });

  })
}
