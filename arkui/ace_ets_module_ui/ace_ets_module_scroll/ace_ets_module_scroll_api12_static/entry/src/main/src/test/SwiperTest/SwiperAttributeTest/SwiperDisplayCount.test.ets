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

export default function SwiperMargin() {
  describe('SwiperDisplayCount', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.arkui.ace.scroll12.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("SwiperDisplayCount beforeEach start");
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get SwiperDisplayCount state pages:" + JSON.stringify(pages));
        if (!("SwiperDisplayCount" == pages.name)) {
          console.info("get Context pages.name:" + JSON.stringify(pages.name));
          router.pushUrl({
            url: "MainAbility/pages/Swiper/SwiperAttribute/SwiperDisplayCount"
          })
          await CommonFunc.sleep(1000);
        }
      } catch (err) {
        console.error("push SwiperDisplayCount page error:" + err);
      }
      console.info("SwiperDisplayCount foreEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SwiperDisplayCount after each called");
    });



    
      
  
/**
     * @tc.number   SwiperDisplayCount_static_0160
     * @tc.name     SwiperDisplayCount_static_0160
     * @tc.desc     SwiperDisplayCount_static_0160
     * @tc.level    Level.LEVEL0
     */
it('SwiperDisplayCount_static_0160', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SwiperDisplayCount_static_0160] START');

      let strJson = inspector.getInspectorByKey('swiperDisplayCount');
      console.info("[SwiperDisplayCount_static_0160] The autoPlay value is " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('autoPlay'));
      console.info("[SwiperDisplayCount_static_0160] The loop value is " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('loop'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('autoPlay')).assertEqual('true');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('loop')).assertEqual('true');

      console.info('[SwiperDisplayCount_static_0160] END');
      done();
    });

  })
}
