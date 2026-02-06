'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium';
import router from '@ohos.router';
import {Driver, Component, UiWindow, ON,  MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {MessageManager,Callback} from '../../../ets/MainAbility/common/MessageManager';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from '../../../ets/MainAbility/common/Utils';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import {UtilsTest, startAbility, stopApplication} from "../Util.test"
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function ProgressContentModifierTest() {
  describe('ProgressContentModifierTest', () => {
    beforeAll(() => {
      console.info("ProgressContentModifierTest beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.information.api16.static", "EntryAbility");
    });
    beforeEach(async (): Promise<void> => {
      console.info('ProgressContentModifierTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/progress/ProgressContentModifier',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get ProgressContentModifierTest state pages:' + JSON.stringify(pages));
        if (!('ProgressContentModifier' == pages.name)) {
          console.info('get ProgressContentModifierTest pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(2500);
        }
      } catch (err) {
        console.error('push ProgressContentModifierTest page error:' + err);
      }
      console.info('ProgressContentModifierTest beforeEach end');
    });
    
    /**
     * @tc.number   ProgressContentModifierTest_static_001
     * @tc.name     ProgressContentModifierTest_static_001
     * @tc.desc     ProgressContentModifierTest_static_001
     * @tc.level    Level.LEVEL0
     */
it('ProgressContentModifierTest_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ProgressContentModifierTest_001 START');

      let strJson = inspector.getInspectorByKey('ProgressContentModifier_total');
      await Utils.sleep(1000);
      let obj = JSON.parseJsonElement(strJson);
      await Utils.sleep(1000);
      console.info("[ProgressContentModifierTest_001] obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('Current progress is：0/3');
      console.info('[ProgressContentModifierTest_001] END');
      done();
    });
  })
}
