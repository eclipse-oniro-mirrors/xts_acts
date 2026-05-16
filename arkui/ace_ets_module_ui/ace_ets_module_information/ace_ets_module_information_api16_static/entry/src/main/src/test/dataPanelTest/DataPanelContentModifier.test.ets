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


export default function DataPanelContentModifierTest() {
  describe('DataPanelContentModifierTest', () => {
    beforeAll(() => {
      console.info("DataPanelContentModifierTest beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.information.api16.static", "EntryAbility");
    });
    beforeEach(async (): Promise<void> => {
      console.info('DataPanelContentModifierTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/dataPanel/DataPanelContentModifier',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get DataPanelContentModifierTest state pages:' + JSON.stringify(pages));
        if (!('DataPanelContentModifier' == pages.name)) {
          console.info('get DataPanelContentModifierTest pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(2500);
        }
      } catch (err) {
        console.error('push DataPanelContentModifierTest page error:' + err);
      }
      console.info('DataPanelContentModifierTest beforeEach end');
    });
    
    /**
     * @tc.number   DataPanelContentModifierTest_static_001
     * @tc.name     DataPanelContentModifierTest_static_001
     * @tc.desc     DataPanelContentModifierTest_static_001
     * @tc.level    Level.LEVEL0
     */
it('DataPanelContentModifierTest_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('DataPanelContentModifierTest_001 START');

      let strJson = inspector.getInspectorByKey('DataPanelContentModifier_max');
      await Utils.sleep(1000);
      let obj = JSON.parseJsonElement(strJson);
      await Utils.sleep(1000);
      console.info("[DataPanelContentModifierTest_001] obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('Max=140');
      console.info('[DataPanelContentModifierTest_001] END');
      done();
    });
  })
}
