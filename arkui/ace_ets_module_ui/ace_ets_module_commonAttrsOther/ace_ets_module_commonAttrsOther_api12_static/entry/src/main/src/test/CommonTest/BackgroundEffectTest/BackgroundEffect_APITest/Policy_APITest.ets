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

export default function Bgde_Policy_APITest() {
  describe('Bgde_Policy_APITest', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsOther.api12.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("Bgde_Policy_APITest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Common/BackgroundEffect/BackgroundEffectOptions/Policy",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get Bgde_Policy_APITest state pages:" + JSON.stringify(pages));
        if (!("Policy" == pages.name)) {
          console.info("get Bgde_Policy_APITest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push Bgde_Policy_APITest page error:" + err);
      }
      console.info("Bgde_Policy_APITest beforeEach end");
    });
    
    
/**
     * @tc.number   Bgde_Policy_APITest_static_0100
     * @tc.name     Bgde_Policy_APITest_static_0100
     * @tc.desc     Bgde_Policy_APITest_static_0100
     * @tc.level    Level.LEVEL0
     */
it('Bgde_Policy_APITest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('Bgde_Policy_APITest_0100 START');
      await CommonFunc.sleep(1000);
      let bgde_policy = inspector.getInspectorByKey('policy');
      await CommonFunc.sleep(2000);
      console.info("[Bgde_Policy_APITest_0100] Tabs animationMode attrs is: " +
      JSON.stringify(JSON.parseJsonElement(bgde_policy).getElement('$attrs')));
      expect(JSON.parseJsonElement(bgde_policy)
        .getElement('$attrs')
        .getElement('backgroundBlurStyle')
        .getElement('options')
        .getString('policy')).assertEqual('BlurStyleActivePolicy.FOLLOWS_WINDOW_ACTIVE_STATE');
      console.info('[Bgde_Policy_APITest_0100] END');
      done();
    });
  })
}