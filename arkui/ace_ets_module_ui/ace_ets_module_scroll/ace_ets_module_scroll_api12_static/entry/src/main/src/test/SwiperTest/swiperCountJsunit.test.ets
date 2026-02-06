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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
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
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function swiperCountJsunit() {
  describe('swiperCountJsunit', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.scroll12.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("swiperCountJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Swiper/swiperCount',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get swiperCountJsunit state pages: " + JSON.stringify(pages));
        if (!("swiperCount" == pages.name)) {
          console.info("get swiperCountJsunit state pages.name: " + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push swiperCountJsunit success: ");
        }
      } catch (err) {
        console.error("push swiperCountJsunit page error: " + err);
        expect().assertFail();
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info(" swiperCountJsunit after each called");
    });

    
      
  
/**
     * @tc.number   swiperCountJsunit_static_0100
     * @tc.name     swiperCountJsunit_static_0100
     * @tc.desc     swiperCountJsunit_static_0100
     * @tc.level    Level.LEVEL0
     */
it('swiperCountJsunit_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('swiperCountJsunit_static_0100 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('maxDisplayCount_mess');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[swiperCountJsunit_static_0100] component obj is: " + JSON.stringify(obj));
      console.info("[swiperCountJsunit_static_0100] swiper: " + JSON.stringify(obj.getElement('$attrs')));
      console.info("[swiperCountJsunit_static_0100] indicator: " +
      JSON.stringify(obj.getElement('$attrs').getString('indicator')));
      expect(JSON.parseJsonElement(obj.getElement('$attrs').getString('indicator')).getDouble('maxDisplayCount'))
        .assertEqual(5);
      console.info('[swiperCountJsunit_static_0100] END');
      done();
    });

  })
}