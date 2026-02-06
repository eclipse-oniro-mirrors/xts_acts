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
import { UtilsTest } from '../../Util.test';

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function SwiperLoopFalse() {
  describe('SwiperLoopFalse', () => {
    beforeAll(() => {

      
      await UtilsTest.startAbility("com.arkui.ace.scroll12.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("SwiperLoopFalse beforeEach start");
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get SwiperLoopFalse state pages:" + JSON.stringify(pages));
        if (!("SwiperLoopFalse" == pages.name)) {
          console.info("get Context pages.name:" + JSON.stringify(pages.name));
          router.pushUrl({
            url: "MainAbility/pages/Swiper/SwiperAttribute/SwiperLoopFalse"
          })
          await CommonFunc.sleep(2000);
          console.info("push SwiperLoopFalse page result:");
        }
      } catch (err) {
        console.error("push SwiperLoopFalse page error:" + err);
      }
      console.info("SwiperLoopFalse foreEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SwiperLoopFalse after each called");
    });



    
      
  
/**
     * @tc.number   SwiperLoopFalse_3400
     * @tc.name     SwiperLoopFalse_3400
     * @tc.desc     SwiperLoopFalse_3400
     * @tc.level    Level.LEVEL0
     */
it('SwiperLoopFalse_3400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SwiperLoopFalse_3400] START');

      let strJson = inspector.getInspectorByKey('swiperLoopFalse');
      console.info("[SwiperLoopFalse_3400] The loop value is " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('loop')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('loop')).assertEqual('false');

      console.info('[SwiperLoopFalse_3400] END');
      done();
    });

  })
}
