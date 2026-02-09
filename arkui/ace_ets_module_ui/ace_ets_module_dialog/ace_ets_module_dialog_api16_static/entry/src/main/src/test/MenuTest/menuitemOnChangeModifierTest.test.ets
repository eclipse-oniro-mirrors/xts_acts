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
import { describe, beforeAll, beforeEach, afterEach, it, expect, Level, TestType, Size } from "../../../../hypium/index"
import router from '@ohos.router';
import {
  Component,
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
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import deviceInfo from "@ohos.deviceInfo"
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';

const uiContext = new UIContext();

export default function menuitemOnChangeModifierTest() {
  describe('menuitemOnChangeModifierTest', () => {
    beforeAll(() => {

      
      await UtilsTest.startAbility("com.arkui.ace.dialog.api16.static", "EntryAbility")
      
    })

    beforeEach(async () => {
      console.info('menuitemOnChangeModifierTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Menu/menuitemOnChangeModifier',
      }
      try {
        const closePopupTest = AppStorage.get<Router>("router") as Router
        closePopupTest.clear();
        let pages = closePopupTest.getState();
        console.info('get menuitemOnChangeModifier state pages:' + JSON.stringify(pages));
        if (!('menuitemOnChangeModifier' == pages.name)) {
          console.info('get menuitemOnChangeModifier pages.name:' + JSON.stringify(pages.name));
          closePopupTest.pushUrl(options);
          await CommonFunc.sleep(2500);
        }
      } catch (err) {
        console.error('push menuitemOnChangeModifier page error:' + err);
      }
      console.info('menuitemOnChangeModifier beforeEach end');
    });

    
    /**
     * @tc.number   ArkUX_Modifier_MenuItem_OnChange_static_1001
     * @tc.name     ArkUX_Modifier_MenuItem_OnChange_static_1001
     * @tc.desc     ArkUX_Modifier_MenuItem_OnChange_static_1001
     * @tc.level    Level.LEVEL2
     */
it('ArkUX_Modifier_MenuItem_OnChange_static_1001', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Modifier_MenuItem_OnChange_static_1001 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('MenuItemOnButtonID'));

      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000)
      let buttonOnchange = await driver.findComponent(ON.id('MenuItemOnChangeID'));
      await (buttonOnchange?.click() as Promise<void>);
      await CommonFunc.sleep(1000)

      let strJsonNew = inspector.getInspectorByKey('MenuItemOnChangValueKey');
      console.info("ArkUX_Modifier_MenuItem_OnChange_static_1001 component  is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew)
        .getElement('$attrs')));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('content')).assertEqual('true');
      console.info('ArkUX_Modifier_MenuItem_OnChange_static_1001 END');
      done();
    });
  })
}
