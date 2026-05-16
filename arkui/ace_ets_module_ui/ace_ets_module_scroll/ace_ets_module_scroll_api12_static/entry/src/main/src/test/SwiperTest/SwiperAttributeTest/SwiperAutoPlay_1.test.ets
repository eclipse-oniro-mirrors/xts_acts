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

export default function SwiperAutoPlay_1() {
  describe('SwiperAutoPlay_1', () => {
    beforeAll(() => {

      
      await UtilsTest.startAbility("com.arkui.ace.scroll12.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("SwiperAutoPlay_1 beforeEach start");
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get SwiperAutoPlay_1 state pages:" + JSON.stringify(pages));
        if (!("SwiperAutoPlay_1" == pages.name)) {
          console.info("get Context pages.name:" + JSON.stringify(pages.name));
          router.pushUrl({
            url: "MainAbility/pages/Swiper/SwiperAttribute/SwiperAutoPlay_1"
          })
          await CommonFunc.sleep(2000);
          console.info("push SwiperAutoPlay_1 page result:");
        }
      } catch (err) {
        console.error("push SwiperAutoPlay_1 page error:" + err);
      }
      console.info("SwiperAutoPlay_1 foreEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SwiperAutoPlay_1 after each called");
    });



    
      
  
/**
     * @tc.number   SwiperAutoPlay_1120
     * @tc.name     SwiperAutoPlay_1120
     * @tc.desc     SwiperAutoPlay_1120
     * @tc.level    Level.LEVEL0
     */
it('SwiperAutoPlay_1120', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SwiperAutoPlay_1120] START');

      let strJson = inspector.getInspectorByKey('swiperAutoPlay_1');
      console.info("[SwiperAutoPlay_1120] The autoPlay value is " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('autoPlay')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('autoPlay')).assertEqual('false');

      console.info('[SwiperAutoPlay_1120] END');
      done();
    });
  })
}
