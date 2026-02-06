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

export default function menuFontsizeModifierTest() {
  describe('menuFontsizeModifierTest', () => {
    beforeAll(() => {

      
      await UtilsTest.startAbility("com.arkui.ace.dialog.api16.static", "EntryAbility")
      
    })

    beforeEach(async () => {
      console.info('menuFontsizeModifierTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Menu/menuFontsizeModifier',
      }
      try {
        const closePopupTest = AppStorage.get<Router>("router") as Router
        // closePopupTest.clear();
        let pages = closePopupTest.getState();
        console.info('get menuFontsizeModifier state pages:' + JSON.stringify(pages));
        if (!('menuFontsizeModifier' == pages.name)) {
          console.info('get menuFontsizeModifier pages.name:' + JSON.stringify(pages.name));
          closePopupTest.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push menuFontsizeModifier page error:' + err);
      }
      console.info('menuFontsizeModifier beforeEach end');
    });

    
    /**
     * @tc.number   ArkUX_Modifier_Menu_FontSize_static_1001
     * @tc.name     ArkUX_Modifier_Menu_FontSize_static_1001
     * @tc.desc     ArkUX_Modifier_Menu_FontSize_static_1001
     * @tc.level    Level.LEVEL2
     */
it('ArkUX_Modifier_Menu_FontSize_static_1001', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Modifier_Menu_FontSize_static_1001 START');
      let driver = Driver.create();
      let buttonOnchange = await driver.findComponent(ON.id('MenuFontSizeButtonID'));
      await (buttonOnchange?.click() as Promise<void>);
      await CommonFunc.sleep(1000)

        let strJsonNew = inspector.getInspectorByKey('MenuFontSizeValueKey');
        console.info("ArkUX_Modifier_Menu_FontSize_static_1001 component  is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew)
          .getElement('$attrs')));
        expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('content')).assertEqual('50px');
        console.info('ArkUX_Modifier_Menu_FontSize_static_1001 END');
        await (buttonOnchange?.click() as Promise<void>);
        await CommonFunc.sleep(1000)
        done();
      });


    
    /**
     * @tc.number   ArkUX_Modifier_Menu_FontSize_static_1002
     * @tc.name     ArkUX_Modifier_Menu_FontSize_static_1002
     * @tc.desc     ArkUX_Modifier_Menu_FontSize_static_1002
     * @tc.level    Level.LEVEL2
     */
it('ArkUX_Modifier_Menu_FontSize_static_1002', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Modifier_Menu_FontSize_static_1002 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('MenuFontSizeChangeButtonID'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(2000)
      let buttonOnchange = await driver.findComponent(ON.id('MenuFontSizeButtonID'));
      await (buttonOnchange?.click() as Promise<void>);
      await CommonFunc.sleep(1000)

        let strJsonNew = inspector.getInspectorByKey('MenuFontSizeValueKey');
        console.info("ArkUX_Modifier_Menu_FontSize_static_1002 component  is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew)
          .getElement('$attrs')));
        expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('content')).assertEqual('-20');
        console.info('ArkUX_Modifier_Menu_FontSize_static_1002 END');
        await (buttonOnchange?.click() as Promise<void>);
        await CommonFunc.sleep(1000)
        done();
      });


    
    /**
     * @tc.number   ArkUX_Modifier_Menu_FontSize_static_1003
     * @tc.name     ArkUX_Modifier_Menu_FontSize_static_1003
     * @tc.desc     ArkUX_Modifier_Menu_FontSize_static_1003
     * @tc.level    Level.LEVEL2
     */
it('ArkUX_Modifier_Menu_FontSize_static_1003', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Modifier_Menu_FontSize_static_1003 START');
      let driver = Driver.create();
      let buttonTwo = await driver.findComponent(ON.id('MenuFontSizeChangeButtonID'));
      await (buttonTwo?.click() as Promise<void>);
      await CommonFunc.sleep(2000)
      let buttonOnchange = await driver.findComponent(ON.id('MenuFontSizeButtonID'));
      await (buttonOnchange?.click() as Promise<void>);
      await CommonFunc.sleep(1000)

        let strJsonNew = inspector.getInspectorByKey('MenuFontSizeValueKey');
        console.info("ArkUX_Modifier_Menu_FontSize_static_1003 component  is: " + JSON.stringify(JSON.parseJsonElement(strJsonNew)
          .getElement('$attrs')));
        expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('content')).assertEqual('0');
        console.info('ArkUX_Modifier_Menu_FontSize_static_1003 END');
        await (buttonOnchange?.click() as Promise<void>);
        await CommonFunc.sleep(1000)
        done();
      });
    })
}
