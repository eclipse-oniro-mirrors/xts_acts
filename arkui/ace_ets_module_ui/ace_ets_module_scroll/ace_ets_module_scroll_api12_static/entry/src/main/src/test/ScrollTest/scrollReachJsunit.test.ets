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
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import { Router } from '@ohos.arkui.UIContext';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import UIAbility from '@ohos.app.ability.UIAbility';
import hilog from '@ohos.hilog'
import common from '@ohos.app.ability.common';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { BusinessError } from '@ohos.base';
import inspector from '@ohos.arkui.inspector'

import { UtilsTest } from '../Util.test';

let testAbilityContext: common.UIAbilityContext;
let domain: int = 0x0000;
let tag: string = 'testTag';
const waitUiReadyMs = 1000;

export default function scrollReachJsunit() {
  describe('scrollReachJsunit', () => {
    beforeAll(() => {

      
      await UtilsTest.startAbility("com.arkui.ace.scroll12.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("scrollReachJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Scroll/scrollReach',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get scrollReachJsunit state pages: " + JSON.stringify(pages));
        if (!("scrollReach" == pages.name)) {
          console.info("get scrollReachJsunit state pages.name: " + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push scrollReachJsunit page error: " + err);
        expect().assertFail();
      }
    });
    
      
  
/**
     * @tc.number   scrollReachJsunit_0100
     * @tc.name     scrollReachJsunit_0100
     * @tc.desc     scrollReachJsunit_0100
     * @tc.level    Level.LEVEL0
     */
it('scrollReachJsunit_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('scrollReachJsunit_0100 START');
      let driver = Driver.create();
      let onReachStartText = await driver.findComponent(ON.id('scroll_reachStart'));
      let text1 = await onReachStartText!.getText();
      console.info('[waterFlowStart1_0100] onReachStartText' + text1);
      expect(text1).assertEqual('onReachStart:succ');
      await CommonFunc.sleep(1000);
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('scrollEdge_btn'));
      await button!.click();
      await CommonFunc.sleep(3000);
      console.info('[scrollReachJsunit_0100] ScrollBottom success');

      let onReachEndText = await driver.findComponent(ON.id('scroll_reachEnd'));
      let text2 = await onReachEndText!.getText();
      console.info('[scrollReachJsunit_0100] onReachEndText: ' + text2);
      expect(text2).assertEqual('onReachEnd:succ');

      let onScrollEdgeText = await driver.findComponent(ON.id('scroll_edge'));
      let text3 = await onScrollEdgeText!.getText();
      console.info('[scrollReachJsunit_0100] onScrollEdgeText: ' + text3);
      expect(text3).assertEqual('onScrollEdge:succ');
      await CommonFunc.sleep(1000);

      console.info('[scrollReachJsunit_0100] END');
      done();
    });
  })
}

