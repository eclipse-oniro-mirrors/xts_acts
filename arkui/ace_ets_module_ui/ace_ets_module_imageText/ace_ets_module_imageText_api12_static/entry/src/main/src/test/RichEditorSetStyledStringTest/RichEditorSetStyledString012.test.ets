'use static';
/*
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from "../../../../hypium/index";
import router from '@ohos.router';
import {
  Component,
  Driver,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import RectValue from '../../../ets/MainAbility/common/Rect';
import {MessageManager,Callback,Message} from '../../../ets/MainAbility/common/MessageManager';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { UIContext } from '@ohos.arkui.UIContext'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import text from "@ohos.graphics.text";
import {KeyCode} from '@ohos.multimodalInput.keyCode';
import {UtilsTest,startAbility} from '../Util.test';
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
export default function RichEditorSetStyledString012() {
  describe('RichEditorSetStyledString012', () => {
    beforeAll(() => {
      console.info("RichEditorSetStyledString012 beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility");
    });
    beforeEach(async (): Promise<void> => {
      const defaultRouter = AppStorage.get<Router>("router") as Router
      console.info("RichEditorSetStyledString012 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorSetStyledString/RichEditorSetStyledString012',
      }
      try {
        defaultRouter.clear();
        let pages:router.RouterState = defaultRouter.getState();
        console.info("get RichEditorSetStyledString012 state pages: " + JSON.stringify(pages));
        if (!("RichEditorSetStyledString012" == pages.name)) {
          console.info("get RichEditorSetStyledString012 state pages.name: " + JSON.stringify(pages.name));
          defaultRouter.pushUrl(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorSetStyledString012 success");
        }
      } catch (err) {
        console.error("push RichEditorSetStyledString012 page error: " + err);
        expect().assertFail();
      }
    });

    
    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_static_0022
     * @tc.name     SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_static_0022
     * @tc.desc     SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_static_0022
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_static_0022', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_static_0022 START');
      let driver = Driver.create();
      let rich = await (driver.findComponent(ON.id('RichEditorSetStyledString012')) as Promise<Component>);
      let getBounds = await rich.getBoundsCenter();
      await CommonFunc.sleep(500);
      await driver.click(getBounds.x, getBounds.y);
      await CommonFunc.sleep(1000);
      let image_top = await (driver.findComponent(ON.id('image_top')) as Promise<Component>);
      await image_top.click();
      await CommonFunc.sleep(500);
      driver.triggerCombineKeys(KeyCode.KEYCODE_CTRL_LEFT, KeyCode.KEYCODE_A);
      await CommonFunc.sleep(500);
      let onSelectionChangeCall = await (driver.findComponent(ON.id('onSelectionChangeCall')) as Promise<Component>);
      let onSelectionChangeCallText = await onSelectionChangeCall.getText();
      await CommonFunc.sleep(500);
      expect(onSelectionChangeCallText).assertContain('onSelectionChangeCall:true');
      let message = await (driver.findComponent(ON.id('message')) as Promise<Component>);
      let messageText = await message.getText();
      await CommonFunc.sleep(500);
      expect(messageText).assertContain('message:{"end":3,"start":0}');
      done();
    });

    
    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_static_0025
     * @tc.name     SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_static_0025
     * @tc.desc     SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_static_0025
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_static_0025', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_static_0025 START');
      let driver = Driver.create();
      let rich = await (driver.findComponent(ON.id('RichEditorSetStyledString012')) as Promise<Component>);
      let getBounds = await rich.getBoundsCenter();
      await CommonFunc.sleep(500);
      await driver.click(getBounds.x, getBounds.y);
      await CommonFunc.sleep(1000);
      driver.triggerCombineKeys(KeyCode.KEYCODE_CTRL_LEFT, KeyCode.KEYCODE_A);
      await CommonFunc.sleep(500);
      let onSelectCallBack = await (driver.findComponent(ON.id('onSelectCallBack')) as Promise<Component>);
      let onSelectCallBackText = await onSelectCallBack.getText();
      await CommonFunc.sleep(500);
      expect(onSelectCallBackText).assertContain('onSelectCallBack:false');
      done();
    });

    
    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_static_0026
     * @tc.name     SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_static_0026
     * @tc.desc     SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_static_0026
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_static_0026', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_static_0026 START');
      let driver = Driver.create();
      let rich = await (driver.findComponent(ON.id('RichEditorSetStyledString012')) as Promise<Component>);
      let getBounds = await rich.getBoundsCenter();
      await CommonFunc.sleep(500);
      await driver.click(getBounds.x, getBounds.y);
      await driver.triggerKey(KeyCode.KEYCODE_A);
      await CommonFunc.sleep(500);
      let aboutToIMEInputCall = await (driver.findComponent(ON.id('aboutToIMEInputCall')) as Promise<Component>);
      let aboutToIMEInputCallText = await aboutToIMEInputCall.getText();
      await CommonFunc.sleep(500);
      expect(aboutToIMEInputCallText).assertContain('aboutToIMEInputCall:false');
      done();
    });

    
    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_static_0035
     * @tc.name     SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_static_0035
     * @tc.desc     SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_static_0035
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_static_0035', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_static_0035 START');
      let driver = Driver.create();
      await driver.triggerKey(KeyCode.KEYCODE_B);
      await CommonFunc.sleep(500);
      let onIMEInputCompleteCall = await (driver.findComponent(ON.id('onIMEInputCompleteCall')) as Promise<Component>);
      let onIMEInputCompleteCallText = await onIMEInputCompleteCall.getText();
      await CommonFunc.sleep(500);
      expect(onIMEInputCompleteCallText).assertContain('onIMEInputCompleteCall:false');
      done();
    });

    
    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_static_0036
     * @tc.name     SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_static_0036
     * @tc.desc     SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_static_0036
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_static_0036', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_static_0036 START');
      let driver = Driver.create();
      await driver.triggerKey(KeyCode.KEYCODE_DEL);
      await CommonFunc.sleep(500);
      await driver.triggerKey(KeyCode.KEYCODE_DEL);
      await CommonFunc.sleep(500);
      let aboutToDeleteCall = await (driver.findComponent(ON.id('aboutToDeleteCall')) as Promise<Component>);
      let aboutToDeleteCallText = await aboutToDeleteCall.getText();
      await CommonFunc.sleep(500);
      expect(aboutToDeleteCallText).assertContain('aboutToDeleteCall:false');
      done();
    });

    
    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_static_0037
     * @tc.name     SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_static_0037
     * @tc.desc     SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_static_0037
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_static_0037', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_static_0037 START');
      let driver = Driver.create();
      await driver.triggerKey(KeyCode.KEYCODE_DEL);
      await CommonFunc.sleep(500);
      await driver.triggerKey(KeyCode.KEYCODE_DEL);
      await CommonFunc.sleep(500);
      let onDeleteCompleteCall = await (driver.findComponent(ON.id('onDeleteCompleteCall')) as Promise<Component>);
      let onDeleteCompleteCallText = await onDeleteCompleteCall.getText();
      await CommonFunc.sleep(500);
      expect(onDeleteCompleteCallText).assertContain('onDeleteCompleteCall:false');
      done();
    });

  })
}


