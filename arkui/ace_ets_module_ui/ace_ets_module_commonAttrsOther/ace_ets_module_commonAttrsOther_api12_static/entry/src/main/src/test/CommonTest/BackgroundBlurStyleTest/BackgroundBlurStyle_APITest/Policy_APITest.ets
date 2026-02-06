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
import events_emitter from '@ohos.events.emitter';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../../../hypium/index'
import router from '@ohos.router';
import {
  Component,
  DisplayRotation,
  Driver,
  MatchPattern,
  ON,
  Point,
  PointerMatrix,
  Rect,
  ResizeDirection,
  UiWindow,
  WindowMode
} from '@ohos.UiTest';
import CommonFunc from '../../../../../ets/MainAbility/common/Common';
import { Callback, MessageManager } from '../../../../../ets/MainAbility/utils/MessageManager';
import window from '@ohos.window';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import inspector from '@ohos.arkui.inspector'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement'
import display from '@ohos.display'
import { $r } from '@ohos.arkui.component'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import { startAbility, stopApplication, UtilsTest } from '../../../Util.test';

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function Policy_APITest() {
  describe('Policy_APITest', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsOther.api12.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("Policy_APITest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Common/backgroundBlurStyle/backgroundBlurStyleOptions/Policy",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get Policy_APITest state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get Policy_APITest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push Policy_APITest page error:" + err);
      }
      console.info("Policy_APITest beforeEach end");
    });

    
    
/**
     * @tc.number   Policy_APITest_static_0100
     * @tc.name     Policy_APITest_static_0100
     * @tc.desc     Policy_APITest_static_0100
     * @tc.level    Level.LEVEL0
     */
it('Policy_APITest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('Policy_APITest_0100 START');
      await CommonFunc.sleep(1000);
      let Policy = inspector.getInspectorByKey('policy');
      await CommonFunc.sleep(1000);
      console.info("[Policy_APITest_0100] Tabs animationMode attrs is: " +
      JSON.stringify(JSON.parseJsonElement(Policy).getElement('$attrs')));
      expect(JSON.parseJsonElement(Policy)
        .getElement('$attrs')
        .getElement('backgroundBlurStyle')
        .getElement('options')
        .getString('policy')).assertEqual('BlurStyleActivePolicy.FOLLOWS_WINDOW_ACTIVE_STATE');
      console.info('[Policy_APITest_0100] END');
      done();
    });
  })
}