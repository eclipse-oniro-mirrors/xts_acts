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
import { UtilsTest } from '../../Util.test';

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function SwiperAdd0510() {
  describe('SwiperAdd0510', () => {
    beforeAll(() => {

      
      await UtilsTest.startAbility("com.arkui.ace.scroll12.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("SwiperAdd0510 beforeEach start");
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get SwiperAdd0510 state pages:" + JSON.stringify(pages));
        if (!("SwiperAdd0510" == pages.name)) {
	          console.info("get Context pages.name:" + JSON.stringify(pages.name));
          router.pushUrl({
            url: 'MainAbility/pages/Swiper/SwiperAdd/SwiperAdd0510'
          })
          await CommonFunc.sleep(2000);
          console.info("push SwiperAdd0510 page result:");
        }
      } catch (err) {
        console.error("push SwiperAdd0510 page error:" + err);
      }
      console.info("SwiperAdd0510 foreEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SwiperAdd0510 after each called");
    });


      
  
/**
     * @tc.number   SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ADD_static_0510
     * @tc.name     SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ADD_static_0510
     * @tc.desc     SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ADD_static_0510
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ADD_static_0510', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ADD_static_0510 START");
      await CommonFunc.sleep(5000);
      let strJson2: string = inspector.getInspectorByKey('swiper_add_0510');
      let marq = JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content');
      expect(marq).assertEqual("1");
      await CommonFunc.sleep(1000);
      console.info('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ADD_static_0510 END');
      done();
    });

  })
}