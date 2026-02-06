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

import events_emitter from '@ohos.events.emitter';
import { describe, beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import {
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix,
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility } from '../Util.test';
import type { KeyCode } from '@ohos.multimodalInput.keyCode';

export default function richEditorModifierUndefined3() {
  describe('richEditorModifierUndefined3', () => {
    beforeAll(() => {
      console.info("richEditorModifierUndefined3 beforeAll start");

      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.richeditor.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("richEditorModifierUndefined3 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditor/richEditorModifierUndefined3',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get richEditorModifierUndefined3 state pages:" + JSON.stringify(pages));
        if (!("richEditorModifierUndefined3" == pages.name)) {
          console.info("get richEditorModifierUndefined3 pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push richEditorModifierUndefined3 page error:" + err);
      }
      console.info("richEditorModifierUndefined3 beforeEach end");

    });
    afterEach(async () => {
    });

    /**
     * @tc.number    richEditorModifierUndefined_static_3001
     * @tc.name      richEditorModifierUndefined_static_3001
     * @tc.desc      test aboutToDelete
     * @tc.level     Level.LEVEL1
     */
    it('richEditorModifierUndefined_static_3001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[richEditorModifierUndefined_static_3001] START');
      let driver: Driver = Driver.create();
      let richEditor = await driver.findComponent(ON.id('RichEditorM_3'));
      await (richEditor?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      driver.triggerKey(KeyCode.KEYCODE_DEL)
      await CommonFunc.sleep(1000);
      let text = await driver.findComponent(ON.id('Text_AboutToDelete'));
      expect(await (text?.getText() as Promise<string>)).assertEqual('aboutToDelete:0');

      let changeBtn = await driver.findComponent(ON.id('Btn_AboutToDelete'));
      await (changeBtn?.click() as Promise<void>);
      await (richEditor?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      driver.triggerKey(KeyCode.KEYCODE_DEL)
      await CommonFunc.sleep(1000);
      expect(await (text?.getText() as Promise<string>)).assertEqual('aboutToDelete:1');

      await (changeBtn?.click() as Promise<void>);
      await (richEditor?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      driver.triggerKey(KeyCode.KEYCODE_DEL)
      await CommonFunc.sleep(1000);
      expect(await (text?.getText() as Promise<string>)).assertEqual('aboutToDelete:1');
      console.info('[richEditorModifierUndefined_static_3001] END');
      done();
    });

    /**
    * @tc.number    richEditorModifierUndefined_static_3002
    * @tc.name      richEditorModifierUndefined_static_3002
    * @tc.desc      test aboutToIMEInput
    * @tc.level     Level.LEVEL1
    */
    it('richEditorModifierUndefined_static_3002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[richEditorModifierUndefined_static_3002] START.');
      let driver = Driver.create();
      let RichEditor = await driver.findComponent(ON.id('RichEditorM_3')) as Component;
      await RichEditor.click();
      await CommonFunc.sleep(1000);
      await RichEditor.inputText('123');
      await CommonFunc.sleep(1000);
      let text = await driver.findComponent(ON.id('Text_AboutToIMEInput'));
      expect(await (text?.getText() as Promise<string>)).assertEqual('aboutToIMEInput:0');

      let btn1 = await driver.findComponent(ON.id('Btn_AboutToIMEInput')) as Component;
      await btn1.click();
      await CommonFunc.sleep(2000);
      await RichEditor.click();
      await CommonFunc.sleep(1000);
      await RichEditor.inputText('123');
      await CommonFunc.sleep(1000);
      expect(await (text?.getText() as Promise<string>)).assertEqual('aboutToIMEInput:3');

      await btn1.click();
      await CommonFunc.sleep(2000);
      await RichEditor.click();
      await CommonFunc.sleep(1000);
      await RichEditor.inputText('123');
      await CommonFunc.sleep(1000);
      expect(await (text?.getText() as Promise<string>)).assertEqual('aboutToIMEInput:3');

      console.info('[richEditorModifierUndefined_static_3002] END');
      done();
    });

    /**
     * @tc.number   richEditorModifierUndefined_static_3003
     * @tc.name     richEditorModifierUndefined_static_3003
     * @tc.desc     test onCut
     * @tc.level    Level.LEVEL1
     */
    it('richEditorModifierUndefined_static_3003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[richEditorModifierUndefined_static_3003] START');
      let driver: Driver = Driver.create();
      let richEditor = await driver.findComponent(ON.id('RichEditorM_3'));
      let changeBtnOffset = await driver.findComponent(ON.id('RichEditor_setCaretOffset'));
      await (changeBtnOffset?.click() as Promise<void>);
      await (richEditor?.longClick() as Promise<void>);
      await CommonFunc.sleep(3000);
      driver.triggerCombineKeys(KeyCode.KEYCODE_CTRL_LEFT, KeyCode.KEYCODE_X);
      await CommonFunc.sleep(1000);
      let text = await driver.findComponent(ON.id('RichEditor_text_OnCut'));
      let strJson = inspector.getInspectorByKey('RichEditor_text_OnCut');
      expect(await (text?.getText() as Promise<string>)).assertEqual('cut:0');

      let changeBtn = await driver.findComponent(ON.id('RichEditor_btn_OnCut'));
      await (changeBtn?.click() as Promise<void>);
      await (changeBtnOffset?.click() as Promise<void>);
      await (richEditor?.longClick() as Promise<void>);
      await CommonFunc.sleep(3000);
      driver.triggerCombineKeys(KeyCode.KEYCODE_CTRL_LEFT, KeyCode.KEYCODE_X);
      await CommonFunc.sleep(1000);
      expect(await (text?.getText() as Promise<string>)).assertEqual('cut:1');

      await (changeBtn?.click() as Promise<void>);
      await (changeBtnOffset?.click() as Promise<void>);
      await (richEditor?.longClick() as Promise<void>);
      await CommonFunc.sleep(3000);
      driver.triggerCombineKeys(KeyCode.KEYCODE_CTRL_LEFT, KeyCode.KEYCODE_X);
      await CommonFunc.sleep(1000);
      expect(await (text?.getText() as Promise<string>)).assertEqual('cut:1');
      console.info('[richEditorModifierUndefined_static_3003] END');
      done();
    });
  })
}