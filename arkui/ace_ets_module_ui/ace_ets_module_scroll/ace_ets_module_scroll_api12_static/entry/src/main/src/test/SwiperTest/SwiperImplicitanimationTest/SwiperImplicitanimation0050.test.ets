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

export default function SwiperImplicitanimation0050() {
  describe('SwiperImplicitanimation0050', () => {
    beforeAll(() => {

      
      await UtilsTest.startAbility("com.arkui.ace.scroll12.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("SwiperImplicitanimation0050 beforeEach start");
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get SwiperImplicitanimation0050 state pages:" + JSON.stringify(pages));
        if (!("SwiperImplicitanimation0050" == pages.name)) {
          console.info("get Context pages.name:" + JSON.stringify(pages.name));
          router.pushUrl({
            url: 'MainAbility/pages/Swiper/SwiperImplicitanimation/SwiperImplicitanimation0050'
          })
          await CommonFunc.sleep(2000);
          console.info("push SwiperImplicitanimation0050 page result:");
        }
      } catch (err) {
        console.error("push SwiperImplicitanimation0050 page error:" + err);
      }
      console.info("SwiperImplicitanimation0050 foreEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SwiperImplicitanimation0050 after each called");
    });

  
    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IMPLICITANIMATION_static_0050
     * @tc.name     SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IMPLICITANIMATION_static_0050
     * @tc.desc     SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IMPLICITANIMATION_static_0050
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IMPLICITANIMATION_static_0050', Level.LEVEL0, async (done: () => void): Promise<void> => {
        console.info("SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IMPLICITANIMATION_static_0050 START");
        await CommonFunc.sleep(6000);
        let driver: Driver = Driver.create();
        let btn = await driver.findComponent(ON.id('btnswiper0050'));
        await (btn?.click() as Promise<void>);
        await CommonFunc.sleep(1000);
        let strJson2: string = inspector.getInspectorByKey('implicitanimation_0050');
        let marq2 = JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content');
        expect(marq2).assertEqual("1");
        await CommonFunc.sleep(1000);
        console.info('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IMPLICITANIMATION_static_0050 END');
        done();
      });

  })
}