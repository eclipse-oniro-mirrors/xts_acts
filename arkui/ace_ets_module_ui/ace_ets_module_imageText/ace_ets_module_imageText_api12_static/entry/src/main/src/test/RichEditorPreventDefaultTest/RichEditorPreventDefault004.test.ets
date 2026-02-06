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
export default function RichEditorPreventDefault004() {
  describe('RichEditorPreventDefault004', () => {
    beforeAll(() => {
      console.info("RichEditorPreventDefault004 beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility");
    });
    beforeEach(async (): Promise<void> => {
      const defaultRouter = AppStorage.get<Router>("router") as Router
      console.info("RichEditorPreventDefault004 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorPreventDefault/RichEditorPreventDefault004',
      }
      try {
        defaultRouter.clear();
        let pages:router.RouterState = defaultRouter.getState();
        console.info("get RichEditorPreventDefault004 state pages: " + JSON.stringify(pages));
        if (!("RichEditorPreventDefault004" == pages.name)) {
          console.info("get RichEditorPreventDefault004 state pages.name: " + JSON.stringify(pages.name));
          defaultRouter.pushUrl(options);
          await CommonFunc.sleep(1000);
          console.info("push RichEditorPreventDefault004 success");
        }
      } catch (err) {
        console.error("push RichEditorPreventDefault004 page error: " + err);
        expect().assertFail();
      }
    });

    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_PREVENTDEFAULT_static_0005
     * @tc.name     SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_PREVENTDEFAULT_static_0005
     * @tc.desc     SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_PREVENTDEFAULT_static_0005
     * @tc.level   Level.LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_PREVENTDEFAULT_static_0005', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_PREVENTDEFAULT_static_0005 START');
      let driver = Driver.create();
      let rich = await (driver.findComponent(ON.id('RichEditorPreventDefault004')) as Promise<Component>);
      let getBounds = await rich.getBounds();
      await CommonFunc.sleep(100);

      await driver.longClick(getBounds.left + 30, getBounds.top + 30);
      await CommonFunc.sleep(100);

      let callClick = await (driver.findComponent(ON.id('callClick')) as Promise<Component>);
      let callClickText = await callClick.getText();
      await CommonFunc.sleep(100);
      expect(callClickText).assertContain('callClick');

      let callLongPress = await (driver.findComponent(ON.id('callLongPress')) as Promise<Component>);
      let callLongPressText = await callLongPress.getText();
      await CommonFunc.sleep(100);
      expect(callLongPressText).assertContain('callLongPress');
      driver.triggerCombineKeys(KeyCode.KEYCODE_CTRL_LEFT, KeyCode.KEYCODE_A);
      await CommonFunc.sleep(500);
      driver.triggerCombineKeys(KeyCode.KEYCODE_CTRL_LEFT, KeyCode.KEYCODE_X);
      await CommonFunc.sleep(500);
      await driver.longClick(getBounds.left + 30, getBounds.top + 30);
      await CommonFunc.sleep(100);
      driver.triggerCombineKeys(KeyCode.KEYCODE_CTRL_LEFT, KeyCode.KEYCODE_V);
      await CommonFunc.sleep(500);

      let boundsCenter = await rich.getBoundsCenter();
      await CommonFunc.sleep(100);
      await driver.longClick(boundsCenter.x, boundsCenter.y);
      await CommonFunc.sleep(500);
      driver.triggerCombineKeys(KeyCode.KEYCODE_CTRL_LEFT, KeyCode.KEYCODE_A);
      await CommonFunc.sleep(1000);
      driver.triggerCombineKeys(KeyCode.KEYCODE_CTRL_LEFT, KeyCode.KEYCODE_C);
      await CommonFunc.sleep(1000);
      driver.triggerCombineKeys(KeyCode.KEYCODE_CTRL_LEFT, KeyCode.KEYCODE_V);
      await CommonFunc.sleep(1000);
      done();
    });

  })
}


