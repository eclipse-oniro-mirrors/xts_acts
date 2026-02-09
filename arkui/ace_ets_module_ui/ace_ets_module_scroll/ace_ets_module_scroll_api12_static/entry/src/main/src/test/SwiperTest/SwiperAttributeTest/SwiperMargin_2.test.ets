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
import inspector from '@ohos.arkui.inspector'
import { UtilsTest } from '../../Util.test'

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function SwiperMargin_2() {
  describe('SwiperMargin_2', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.scroll12.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("SwiperMargin_2 beforeEach start");
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get SwiperMargin_2 state pages:" + JSON.stringify(pages));
        if (!("SwiperMargin_2" == pages.name)) {
          console.info("get Context pages.name:" + JSON.stringify(pages.name));
          router.pushUrl({
            url: "MainAbility/pages/Swiper/SwiperAttribute/SwiperMargin_2"
          })
          
        }
      } catch (err) {
        console.error("push SwiperMargin_2 page error:" + err);
      }
      console.info("SwiperMargin_2 foreEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SwiperMargin_2 after each called");
    });



    
      
  
/**
     * @tc.number   SwiperMargin_static_0040
     * @tc.name     SwiperMargin_static_0040
     * @tc.desc     SwiperMargin_static_0040
     * @tc.level    Level.LEVEL0
     */
it('SwiperMargin_static_0040', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SwiperMargin_static_0040] START');

      let strJson = inspector.getInspectorByKey('swiperMargin_2');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[SwiperMargin_static_0040] component obj is: " + JSON.stringify(obj));

      console.info("[SwiperMargin_static_0040] The prevMargin value is " +
      JSON.stringify(obj.getElement('$attrs').getString('prevMargin')));
      expect(obj.getElement('$attrs').getString('prevMargin')).assertEqual('10.00vp');

      let swiperRect = CommonFunc.getComponentRect('swiperMargin_2');
      let swiperRight = swiperRect.right;

      let textRect = CommonFunc.getComponentRect('swiperMargin_2Column01');
      let textRight = textRect.right;

      let spaceMargin = swiperRight - textRight;
      console.info("[SwiperMargin_static_0040] The spaceMargin value is " + spaceMargin);
      const uiContext = AppStorage.get<UIContext>('uiContext')!;
      console.info("[SwiperMargin_static_0040] The vp2px value is " + uiContext.vp2px(30));
      expect(Math.abs(Math.round(spaceMargin)) - uiContext.vp2px(30) <= 1).assertTrue();
      console.info('[SwiperMargin_static_0040] END');
      done();
    });

    
      
  
/**
     * @tc.number   SwiperMargin_static_0170
     * @tc.name     SwiperMargin_static_0170
     * @tc.desc     SwiperMargin_static_0170
     * @tc.level    Level.LEVEL0
     */
it('SwiperMargin_static_0170', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SwiperMargin_static_0170] START');
      let rect = CommonFunc.getComponentRectOnScreen('swiperMargin_2')
      console.info("SwiperMargin_static_0170 swiper rect is " + rect.left + " --" + rect.right + "--" + rect.top +
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

      let swiperRect = CommonFunc.getComponentRect('swiperMargin_2');
      let swiperLeft = swiperRect.left;

      let textRect = CommonFunc.getComponentRect('swiperMargin_2Column02');
      let textLeft = textRect.left;

      let spaceMargin = swiperLeft - textLeft;
      console.info("[SwiperMargin_static_0170] The spaceMargin value is " + spaceMargin);
      const uiContext = AppStorage.get<UIContext>('uiContext')!;
      expect(Math.abs(Math.round(spaceMargin)) - uiContext.vp2px(30) <= 1).assertTrue();

      console.info('[SwiperMargin_static_0170] END');
      done();
    });

  })
}
