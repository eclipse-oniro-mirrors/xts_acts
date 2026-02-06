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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../../hypium/index"
import router from '@ohos.router';
import {
  Driver,
  Component,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../../../ets/MainAbility/common/Common';
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

export default function SwiperImplicitanimation0010() {
  describe('SwiperImplicitanimation0010', () => {
    beforeAll(() => {

      
      await UtilsTest.startAbility("com.arkui.ace.scroll12.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("SwiperImplicitanimation0010 beforeEach start");
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get SwiperImplicitanimation0010 state pages:" + JSON.stringify(pages));
        if (!("SwiperImplicitanimation0010" == pages.name)) {
          console.info("get Context pages.name:" + JSON.stringify(pages.name));
          router.pushUrl({
            url: 'MainAbility/pages/Swiper/SwiperImplicitanimation/SwiperImplicitanimation0010'
          })
          await CommonFunc.sleep(2000);
          console.info("push SwiperImplicitanimation0010 page result:");
        }
      } catch (err) {
        console.error("push SwiperImplicitanimation0010 page error:" + err);
      }
      console.info("SwiperImplicitanimation0010 foreEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SwiperImplicitanimation0010 after each called");
    });

   
    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IMPLICITANIMATION_static_0010
     * @tc.name     SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IMPLICITANIMATION_static_0010
     * @tc.desc     SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IMPLICITANIMATION_static_0010
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IMPLICITANIMATION_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
        console.info("SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IMPLICITANIMATION_static_0010 START");
        await CommonFunc.sleep(6000);
        let swiperOffset = CommonFunc.getComponentRectOnScreen('swiper0010');
        let top = swiperOffset.top;
        let right = swiperOffset.right;
        let left = swiperOffset.left;
        let bottom = swiperOffset.bottom;
        let height = bottom - top;
        let width = right - left;
        let driver = Driver.create()
        await CommonFunc.sleep(1000);
        await driver.drag((Math.round(left + width * 0.8)).toInt(), (Math.round(bottom - height / 2)).toInt(),
          (Math.round(left + width * 0.1)).toInt(), (Math.round(bottom - height / 2)).toInt());
        await CommonFunc.sleep(3000);
        let strJson2: string = inspector.getInspectorByKey('implicitanimation_0010');
        let marq2 = JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content');
        expect(marq2).assertEqual("1");
        await CommonFunc.sleep(1000);
        console.info('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IMPLICITANIMATION_static_0010 END');
        done();
      });

  })
}