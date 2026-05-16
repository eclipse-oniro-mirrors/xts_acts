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
export default function RichEditorShortCutKeys004() {
  describe('RichEditorShortCutKeys004', () => {
    beforeAll(() => {
      console.info("RichEditorShortCutKeys004 beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility");
    });
    beforeEach(async (): Promise<void> => {
      const defaultRouter = AppStorage.get<Router>("router") as Router
      console.info("RichEditorShortCutKeys004 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorShortCutKeys/RichEditorShortCutKeys004',
      }
      try {
        defaultRouter.clear();
        let pages:router.RouterState = defaultRouter.getState();
        console.info("get RichEditorShortCutKeys004 state pages: " + JSON.stringify(pages));
        if (!("RichEditorShortCutKeys004" == pages.name)) {
          console.info("get RichEditorShortCutKeys004 state pages.name: " + JSON.stringify(pages.name));
          defaultRouter.pushUrl(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorShortCutKeys004 success");
        }
      } catch (err) {
        console.error("push RichEditorShortCutKeys004 page error: " + err);
        expect().assertFail();
      }
    });

    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_TEXT_RICHEDIT0R_SHORTCUTKEYS_static_0007
     * @tc.name     SUB_ACE_UI_COMPONENT_TEXT_RICHEDIT0R_SHORTCUTKEYS_static_0007
     * @tc.desc     SUB_ACE_UI_COMPONENT_TEXT_RICHEDIT0R_SHORTCUTKEYS_static_0007
     * @tc.level   Level.LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDIT0R_SHORTCUTKEYS_static_0007', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDIT0R_SHORTCUTKEYS_static_0007 START');
      let driver = Driver.create();
      let rich = await (driver.findComponent(ON.id('RichEditorShortCutKeys004')) as Promise<Component>);
      let pointCenter = await rich.getBoundsCenter();
      await driver.click(pointCenter.x, pointCenter.y);
      await CommonFunc.sleep(500);
      driver.triggerCombineKeys(KeyCode.KEYCODE_SHIFT_LEFT, KeyCode.KEYCODE_DPAD_LEFT);
      await CommonFunc.sleep(500);
      driver.triggerCombineKeys(KeyCode.KEYCODE_SHIFT_LEFT, KeyCode.KEYCODE_DPAD_LEFT);
      await CommonFunc.sleep(500);
      driver.triggerCombineKeys(KeyCode.KEYCODE_SHIFT_LEFT, KeyCode.KEYCODE_DPAD_UP);
      await CommonFunc.sleep(500);
      let selection = await (driver.findComponent(ON.id('selection')) as Promise<Component>);
      let selectionText = await selection.getText();
      await CommonFunc.sleep(500);
      expect(selectionText).assertContain('"start"');
      expect(selectionText).assertContain('"end"');
      let set_position = await (driver.findComponent(ON.id('set_position')) as Promise<Component>);
      await set_position.click();
      await CommonFunc.sleep(500);
      driver.triggerCombineKeys(KeyCode.KEYCODE_SHIFT_LEFT, KeyCode.KEYCODE_DPAD_RIGHT);
      await CommonFunc.sleep(500);
      driver.triggerCombineKeys(KeyCode.KEYCODE_SHIFT_LEFT, KeyCode.KEYCODE_DPAD_RIGHT);
      await CommonFunc.sleep(500);
      driver.triggerCombineKeys(KeyCode.KEYCODE_SHIFT_LEFT, KeyCode.KEYCODE_DPAD_DOWN);
      await CommonFunc.sleep(500);
      selectionText = await selection.getText();
      await CommonFunc.sleep(500);
      expect(selectionText).assertContain('"start"');
      expect(selectionText).assertContain('"end"');
      driver.triggerKey(KeyCode.KEYCODE_DPAD_UP);
      await CommonFunc.sleep(500);
      driver.triggerCombineKeys(KeyCode.KEYCODE_SHIFT_LEFT, KeyCode.KEYCODE_DPAD_UP);
      await CommonFunc.sleep(500);
      let get_position = await (driver.findComponent(ON.id('get_position')) as Promise<Component>);
      await get_position.click();
      await CommonFunc.sleep(500);
      let positionNum = await (driver.findComponent(ON.id('positionNum')) as Promise<Component>);
      let positionNumText = await positionNum.getText();
      await CommonFunc.sleep(500);
      expect(positionNumText).assertEqual('positionNum:0');
      driver.triggerKey(KeyCode.KEYCODE_DPAD_DOWN);
      await CommonFunc.sleep(500);
      driver.triggerCombineKeys(KeyCode.KEYCODE_SHIFT_LEFT, KeyCode.KEYCODE_DPAD_DOWN);
      await CommonFunc.sleep(500);
      await get_position.click();
      await CommonFunc.sleep(500);
      positionNumText = await positionNum.getText();
      await CommonFunc.sleep(500);
      expect(positionNumText).assertEqual('positionNum:22');
      done();
    });

  })
}


