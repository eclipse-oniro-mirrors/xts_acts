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
export default function RichEditorShortCutKeys023() {
  describe('RichEditorShortCutKeys023', () => {
    beforeAll(() => {
      console.info("RichEditorShortCutKeys023 beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility");
    });
    beforeEach(async (): Promise<void> => {
      const defaultRouter = AppStorage.get<Router>("router") as Router
      console.info("RichEditorShortCutKeys023 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorShortCutKeys/RichEditorShortCutKeys023',
      }
      try {
        defaultRouter.clear();
        let pages:router.RouterState = defaultRouter.getState();
        console.info("get RichEditorShortCutKeys023 state pages: " + JSON.stringify(pages));
        if (!("RichEditorShortCutKeys023" == pages.name)) {
          console.info("get RichEditorShortCutKeys023 state pages.name: " + JSON.stringify(pages.name));
          defaultRouter.pushUrl(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorShortCutKeys023 success");
        }
      } catch (err) {
        console.error("push RichEditorShortCutKeys023 page error: " + err);
        expect().assertFail();
      }
    });

    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_TEXT_RICHEDIT0R_SHORTCUTKEYS_static_0035
     * @tc.name     SUB_ACE_UI_COMPONENT_TEXT_RICHEDIT0R_SHORTCUTKEYS_static_0035
     * @tc.desc     SUB_ACE_UI_COMPONENT_TEXT_RICHEDIT0R_SHORTCUTKEYS_static_0035
     * @tc.level   Level.LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDIT0R_SHORTCUTKEYS_static_0035', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDIT0R_SHORTCUTKEYS_static_0035 START');
      let driver = Driver.create();
      let rich = await (driver.findComponent(ON.id('RichEditorShortCutKeys023')) as Promise<Component>);
      let pointCenter = await rich.getBoundsCenter();
      await driver.click(pointCenter.x, pointCenter.y);
      await CommonFunc.sleep(500);
      let builder = await (driver.findComponent(ON.id('builder')) as Promise<Component>);
      await builder.click();
      await CommonFunc.sleep(500);
      driver.triggerCombineKeys(KeyCode.KEYCODE_CTRL_LEFT, KeyCode.KEYCODE_DPAD_UP);
      await CommonFunc.sleep(500);
      let getPosition = await (driver.findComponent(ON.id('getPosition')) as Promise<Component>);
      await getPosition.click();
      await CommonFunc.sleep(500);
      let carePosition = await (driver.findComponent(ON.id('carePosition')) as Promise<Component>);
      let carePositionText = await carePosition.getText();
      await CommonFunc.sleep(500);
      expect(carePositionText).assertContain('carePosition:8');
      driver.triggerCombineKeys(KeyCode.KEYCODE_CTRL_LEFT, KeyCode.KEYCODE_DPAD_UP);
      await CommonFunc.sleep(500);
      await getPosition.click();
      await CommonFunc.sleep(500);
      carePositionText = await carePosition.getText();
      await CommonFunc.sleep(500);
      expect(carePositionText).assertContain('carePosition:0');
      done();
    });

    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_TEXT_RICHEDIT0R_SHORTCUTKEYS_static_0036
     * @tc.name     SUB_ACE_UI_COMPONENT_TEXT_RICHEDIT0R_SHORTCUTKEYS_static_0036
     * @tc.desc     SUB_ACE_UI_COMPONENT_TEXT_RICHEDIT0R_SHORTCUTKEYS_static_0036
     * @tc.level   Level.LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDIT0R_SHORTCUTKEYS_static_0036', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDIT0R_SHORTCUTKEYS_static_0036 START');
      let driver = Driver.create();

      driver.triggerCombineKeys(KeyCode.KEYCODE_CTRL_LEFT, KeyCode.KEYCODE_DPAD_DOWN);
      await CommonFunc.sleep(500);
      let getPosition = await (driver.findComponent(ON.id('getPosition')) as Promise<Component>);
      await getPosition.click();
      await CommonFunc.sleep(500);
      let carePosition = await (driver.findComponent(ON.id('carePosition')) as Promise<Component>);
      let carePositionText = await carePosition.getText();
      await CommonFunc.sleep(500);
      expect(carePositionText).assertContain('carePosition:7');
      driver.triggerCombineKeys(KeyCode.KEYCODE_CTRL_LEFT, KeyCode.KEYCODE_DPAD_DOWN);
      await CommonFunc.sleep(500);
      await getPosition.click();
      await CommonFunc.sleep(500);
      carePositionText = await carePosition.getText();
      await CommonFunc.sleep(500);
      expect(carePositionText).assertContain('carePosition:13');
      done();
    });

  })
}


