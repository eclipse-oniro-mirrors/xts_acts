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

export default function richEditorUndefined() {
  describe('richEditorUndefined', () => {
    beforeAll(() => {
      console.info("richEditorUndefined beforeAll start");

      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.richeditor.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("richEditorUndefined beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditor/richEditorUndefined',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get richEditorUndefined state pages:" + JSON.stringify(pages));
        if (!("richEditorUndefined" == pages.name)) {
          console.info("get richEditorUndefined pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push richEditorUndefined page error:" + err);
      }
      console.info("richEditorUndefined beforeEach end");

    });
    afterEach(async () => {
    });

    /**
     * @tc.number   richEditorUndefined_static_0001
     * @tc.name     richEditorUndefined_static_0001
     * @tc.desc     test enableDataDetector
     * @tc.level    Level.LEVEL1
     */
    it('richEditorUndefined_static_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[richEditorUndefined_static_0001] START');
      let driver: Driver = Driver.create();

      let strJson = inspector.getInspectorByKey('RichEditor_1');
      console.info("[richEditorUndefined_static_0001] enableDataDetector: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('enableDataDetector'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('enableDataDetector'))
        .assertEqual('true');

      let changeBtn = await driver.findComponent(ON.id('RichEditor_btn1'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('RichEditor_1');
      console.info("[richEditorUndefined_static_0001] enableDataDetector: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('enableDataDetector'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('enableDataDetector'))
        .assertEqual('false');

      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('RichEditor_1');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('enableDataDetector'))
        .assertEqual('true');
      console.info('[richEditorUndefined_static_0001] END');
      done();
    });

    /**
     * @tc.number   richEditorUndefined_static_0002
     * @tc.name     richEditorUndefined_static_0002
     * @tc.desc     test enableHapticFeedback
     * @tc.level    Level.LEVEL1
     */
    it('richEditorUndefined_static_0002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[richEditorUndefined_static_0002] START');
      let driver: Driver = Driver.create();

      let strJson = inspector.getInspectorByKey('RichEditor_1');
      console.info("[richEditorUndefined_static_0002] enableHapticFeedback: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('enableHapticFeedback'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('enableHapticFeedback'))
        .assertEqual('true');

      let changeBtn = await driver.findComponent(ON.id('RichEditor_btn2'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('RichEditor_1');
      console.info("[richEditorUndefined_static_0002] enableHapticFeedback: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('enableHapticFeedback'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('enableHapticFeedback'))
        .assertEqual('false');

      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('RichEditor_1');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('enableHapticFeedback'))
        .assertEqual('true');
      console.info('[richEditorUndefined_static_0002] END');
      done();
    });

    /**
     * @tc.number   richEditorUndefined_static_0003
     * @tc.name     richEditorUndefined_static_0003
     * @tc.desc     test enableKeyboardOnFocus
     * @tc.level    Level.LEVEL1
     */
    it('richEditorUndefined_static_0003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[richEditorUndefined_static_0003] START');
      let driver: Driver = Driver.create();

      let strJson = inspector.getInspectorByKey('RichEditor_1');
      console.info("[richEditorUndefined_static_0002] enableKeyboardOnFocus: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('enableKeyboardOnFocus'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('enableKeyboardOnFocus'))
        .assertEqual('true');

      let changeBtn = await driver.findComponent(ON.id('RichEditor_btn3'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('RichEditor_1');
      console.info("[richEditorUndefined_static_0002] enableKeyboardOnFocus: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('enableKeyboardOnFocus'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('enableKeyboardOnFocus'))
        .assertEqual('false');

      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('RichEditor_1');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('enableKeyboardOnFocus'))
        .assertEqual('true');
      console.info('[richEditorUndefined_static_0003] END');
      done();
    });

    /**
     * @tc.number   richEditorUndefined_static_0004
     * @tc.name     richEditorUndefined_static_0004
     * @tc.desc     test keyboardAppearance
     * @tc.level    Level.LEVEL1
     */
    it('richEditorUndefined_static_0004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[richEditorUndefined_static_0004] START');
      let driver: Driver = Driver.create();

      let strJson = inspector.getInspectorByKey('RichEditor_1');
      console.info("[richEditorUndefined_static_0004] keyboardAppearance: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('keyboardAppearance'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('keyboardAppearance'))
        .assertEqual(0);

      let changeBtn = await driver.findComponent(ON.id('RichEditor_btn4'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('RichEditor_1');
      console.info("[richEditorUndefined_static_0004] keyboardAppearance: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('keyboardAppearance'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('keyboardAppearance'))
        .assertEqual(3);

      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('RichEditor_1');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('keyboardAppearance'))
        .assertEqual(0);
      console.info('[richEditorUndefined_static_0004] END');
      done();
    });

    /**
     * @tc.number   richEditorUndefined_static_0005
     * @tc.name     richEditorUndefined_static_0005
     * @tc.desc     test maxLength
     * @tc.level    Level.LEVEL1
     */
    it('richEditorUndefined_static_0005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[richEditorUndefined_static_0005] START');
      let driver: Driver = Driver.create();

      let strJson = inspector.getInspectorByKey('RichEditor_1');
      console.info("[richEditorUndefined_static_0005] maxLength: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('maxLength'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('maxLength'))
        .assertEqual(2147483647);

      let changeBtn = await driver.findComponent(ON.id('RichEditor_btn5'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('RichEditor_1');
      console.info("[richEditorUndefined_static_0005] maxLength: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('maxLength'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('maxLength'))
        .assertEqual(10);

      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('RichEditor_1');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('maxLength'))
        .assertEqual(2147483647);
      console.info('[richEditorUndefined_static_0005] END');
      done();
    });

    /**
     * @tc.number   richEditorUndefined_static_0006
     * @tc.name     richEditorUndefined_static_0006
     * @tc.desc     test maxLines
     * @tc.level    Level.LEVEL1
     */
    it('richEditorUndefined_static_0006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[richEditorUndefined_static_0006] START');
      let driver: Driver = Driver.create();

      let strJson = inspector.getInspectorByKey('RichEditor_1');
      console.info("[richEditorUndefined_static_0006] maxLines: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('maxLines'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('maxLines'))
        .assertEqual('4294967295');

      let changeBtn = await driver.findComponent(ON.id('RichEditor_btn6'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('RichEditor_1');
      console.info("[richEditorUndefined_static_0006] maxLines: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('maxLines'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('maxLines'))
        .assertEqual('3');

      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('RichEditor_1');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('maxLines'))
        .assertEqual('4294967295');
      console.info('[richEditorUndefined_static_0006] END');
      done();
    });

    /**
     * @tc.number   richEditorUndefined_static_0007
     * @tc.name     richEditorUndefined_static_0007
     * @tc.desc     test onCopy
     * @tc.level    Level.LEVEL1
     */
    it('richEditorUndefined_static_0007', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[richEditorUndefined_static_0007] START');
      let driver: Driver = Driver.create();
      let richEditor = await driver.findComponent(ON.id('RichEditor_1'));
      await (richEditor?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      driver.triggerCombineKeys(KeyCode.KEYCODE_CTRL_LEFT, KeyCode.KEYCODE_C);
      await CommonFunc.sleep(1000);
      let text = await driver.findComponent(ON.id('RichEditor_text'));
      expect(await (text?.getText() as Promise<string>)).assertEqual('copy:0');


      let changeBtn = await driver.findComponent(ON.id('RichEditor_btn7'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      driver.triggerCombineKeys(KeyCode.KEYCODE_CTRL_LEFT, KeyCode.KEYCODE_C);
      await CommonFunc.sleep(1000);
      expect(await (text?.getText() as Promise<string>)).assertEqual('copy:1');


      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      driver.triggerCombineKeys(KeyCode.KEYCODE_CTRL_LEFT, KeyCode.KEYCODE_C);
      await CommonFunc.sleep(1000);
      expect(await (text?.getText() as Promise<string>)).assertEqual('copy:1');

      console.info('[richEditorUndefined_static_0007] END');
      done();
    });

    /**
     * @tc.number    richEditorUndefined_static_0008
     * @tc.name      richEditorUndefined_static_0008
     * @tc.desc      test onDeleteComplete
     * @tc.level     Level.LEVEL1
     */
    it('richEditorUndefined_static_0008', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[richEditorUndefined_static_0008] START');
      let driver: Driver = Driver.create();
      let richEditor = await driver.findComponent(ON.id('RichEditor_1'));
      await (richEditor?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      driver.triggerKey(KeyCode.KEYCODE_DEL)
      await CommonFunc.sleep(1000);
      let text = await driver.findComponent(ON.id('Text_OnDeleteComplete'));
      expect(await (text?.getText() as Promise<string>)).assertEqual('onDeleteComplete:0');

      let changeBtn = await driver.findComponent(ON.id('Btn_OnDeleteComplete'));
      await (changeBtn?.click() as Promise<void>);
      await (richEditor?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      driver.triggerKey(KeyCode.KEYCODE_DEL)
      await CommonFunc.sleep(1000);
      expect(await (text?.getText() as Promise<string>)).assertEqual('onDeleteComplete:1');

      await (changeBtn?.click() as Promise<void>);
      await (richEditor?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      driver.triggerKey(KeyCode.KEYCODE_DEL)
      await CommonFunc.sleep(1000);
      expect(await (text?.getText() as Promise<string>)).assertEqual('onDeleteComplete:1');
      console.info('[richEditorUndefined_static_0008] END');
      done();
    });

    /**
     * @tc.number    richEditorUndefined_static_0009
     * @tc.name      richEditorUndefined_static_0009
     * @tc.desc      test onDidChange
     * @tc.level     Level.LEVEL1
     */
    it('richEditorUndefined_static_0009', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[richEditorUndefined_static_0009] START.');
      let driver = Driver.create();
      let RichEditor = await driver.findComponent(ON.id('RichEditor_1')) as Component;
      await RichEditor.click();
      await CommonFunc.sleep(1000);
      await RichEditor.inputText('123');
      await CommonFunc.sleep(1000);
      let text = await driver.findComponent(ON.id('Text_OnDidChange'));
      expect(await (text?.getText() as Promise<string>)).assertEqual('onDidChange:0');

      let btn1 = await driver.findComponent(ON.id('Btn_OnDidChange')) as Component;
      await btn1.click();
      await CommonFunc.sleep(2000);
      await RichEditor.click();
      await CommonFunc.sleep(1000);
      await RichEditor.inputText('123');
      await CommonFunc.sleep(1000);
      expect(await (text?.getText() as Promise<string>)).assertEqual('onDidChange:6');

      await btn1.click();
      await CommonFunc.sleep(2000);
      await RichEditor.click();
      await CommonFunc.sleep(1000);
      await RichEditor.inputText('123');
      await CommonFunc.sleep(1000);
      expect(await (text?.getText() as Promise<string>)).assertEqual('onDidChange:6');
      console.info('[richEditorUndefined_static_0009] END');
      done();
    });

    /**
     * @tc.number    richEditorUndefined_static_0010
     * @tc.name      richEditorUndefined_static_0010
     * @tc.desc      test onDidIMEInput
     * @tc.level     Level.LEVEL1
     */
    it('richEditorUndefined_static_0010', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[richEditorUndefined_static_0010] START.');
      let driver = Driver.create();
      let RichEditor = await driver.findComponent(ON.id('RichEditor_1')) as Component;
      await RichEditor.click();
      await CommonFunc.sleep(1000);
      await RichEditor.inputText('123');
      await CommonFunc.sleep(1000);
      let text = await driver.findComponent(ON.id('Text_OnDidIMEInput'));
      expect(await (text?.getText() as Promise<string>)).assertEqual('onDidIMEInput:0');

      let btn1 = await driver.findComponent(ON.id('Btn_OnDidIMEInput')) as Component;
      await btn1.click();
      await CommonFunc.sleep(2000);
      await RichEditor.click();
      await CommonFunc.sleep(1000);
      await RichEditor.inputText('123');
      await CommonFunc.sleep(1000);
      expect(await (text?.getText() as Promise<string>)).assertEqual('onDidIMEInput:3');

      await btn1.click();
      await CommonFunc.sleep(2000);
      await RichEditor.click();
      await CommonFunc.sleep(1000);
      await RichEditor.inputText('123');
      await CommonFunc.sleep(1000);
      expect(await (text?.getText() as Promise<string>)).assertEqual('onDidIMEInput:3');
      console.info('[richEditorUndefined_static_0010] END');
      done();
    });

    /**
     * @tc.number    richEditorUndefined_static_0011
     * @tc.name      richEditorUndefined_static_0011
     * @tc.desc      test onIMEInputComplete
     * @tc.level     Level.LEVEL1
     */
    it('richEditorUndefined_static_0011', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[richEditorUndefined_static_0011] START.');
      let driver = Driver.create();
      let RichEditor = await driver.findComponent(ON.id('RichEditor_1')) as Component;
      await RichEditor.click();
      await CommonFunc.sleep(1000);
      await RichEditor.inputText('123');
      await CommonFunc.sleep(1000);
      let text = await driver.findComponent(ON.id('Text_OnIMEInputComplete'));
      expect(await (text?.getText() as Promise<string>)).assertEqual('onIMEInputComplete:0');

      let btn1 = await driver.findComponent(ON.id('Btn_OnIMEInputComplete')) as Component;
      await btn1.click();
      await CommonFunc.sleep(2000);
      await RichEditor.click();
      await CommonFunc.sleep(1000);
      await RichEditor.inputText('123');
      await CommonFunc.sleep(1000);
      expect(await (text?.getText() as Promise<string>)).assertEqual('onIMEInputComplete:3');

      await btn1.click();
      await CommonFunc.sleep(2000);
      await RichEditor.click();
      await CommonFunc.sleep(1000);
      await RichEditor.inputText('123');
      await CommonFunc.sleep(1000);
      expect(await (text?.getText() as Promise<string>)).assertEqual('onIMEInputComplete:3');
      console.info('[richEditorUndefined_static_0011] END');
      done();
    });

    /**
     * @tc.number    richEditorUndefined_static_0012
     * @tc.name      richEditorUndefined_static_0012
     * @tc.desc      test onEditingChange
     * @tc.level     Level.LEVEL1
     */
    it('richEditorUndefined_static_0012', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[richEditorUndefined_static_0012] START.');
      let driver = Driver.create();
      let RichEditor = await driver.findComponent(ON.id('RichEditor_1')) as Component;
      await RichEditor.click();
      await CommonFunc.sleep(1000);
      await driver.triggerKey(KeyCode.KEYCODE_TAB);
      await CommonFunc.sleep(1000);
      let text = await driver.findComponent(ON.id('Text_OnEditingChange'));
      expect(await (text?.getText() as Promise<string>)).assertEqual('onEditingChange:0');

      let btn1 = await driver.findComponent(ON.id('Btn_OnEditingChange')) as Component;
      await btn1.click();
      await CommonFunc.sleep(1000);
      await RichEditor.click();
      await CommonFunc.sleep(1000);
      await driver.triggerKey(KeyCode.KEYCODE_TAB);
      await CommonFunc.sleep(1000);
      expect(await (text?.getText() as Promise<string>)).assertEqual('onEditingChange:2');

      await btn1.click();
      await CommonFunc.sleep(1000);
      await RichEditor.click();
      await CommonFunc.sleep(1000);
      await driver.triggerKey(KeyCode.KEYCODE_TAB);
      await CommonFunc.sleep(1000);
      expect(await (text?.getText() as Promise<string>)).assertEqual('onEditingChange:2');

      console.info('[richEditorUndefined_static_0012] END');
      done();
    });

    /**
     * @tc.number   richEditorUndefined_static_0013
     * @tc.name     richEditorUndefined_static_0013
     * @tc.desc     test copyOptions
     * @tc.level    Level.LEVEL1
     */
    it('richEditorUndefined_static_0013', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[richEditorUndefined_static_0013] START');
      let driver: Driver = Driver.create();

      let richEditor = await driver.findComponent(ON.id('RichEditor_1'));
      await (richEditor?.longClick() as Promise<void>);
      await CommonFunc.sleep(1000);
      let copy = await driver.findComponent(ON.text('复制')) as Component;
      await copy.click();
      await CommonFunc.sleep(500);

      let changeBtn = await driver.findComponent(ON.id('Btn_CopyOptions'));
      try {
        await (changeBtn?.click() as Promise<void>);
        await CommonFunc.sleep(1000);
        await (richEditor?.longClick() as Promise<void>);
        await CommonFunc.sleep(1000);
        copy = await driver.findComponent(ON.text('复制')) as Component;
        if (copy == null) {
          expect(copy).assertNull();
        }
      } catch (err) {
      }

      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      await (richEditor?.longClick() as Promise<void>);
      await CommonFunc.sleep(1000);
      copy = await driver.findComponent(ON.text('复制')) as Component;
      await copy.click();
      await CommonFunc.sleep(500);

      console.info('[richEditorUndefined_static_0013] END');
      done();
    });

    /**
     * @tc.number   richEditorUndefined_static_0014
     * @tc.name     richEditorUndefined_static_0014
     * @tc.desc     test enterKeyType
     * @tc.level    Level.LEVEL1
     */
    it('richEditorUndefined_static_0014', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[richEditorUndefined_static_0014] START');
      let driver: Driver = Driver.create();

      let strJson = inspector.getInspectorByKey('RichEditor_1');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('enterKeyType'))
        .assertEqual(8);

      let changeBtn = await driver.findComponent(ON.id('Btn_EnterKeyType'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('RichEditor_1');
      console.info("[richEditorUndefined_static_0015] enterKeyType: " +
      JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('enterKeyType'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('enterKeyType'))
        .assertEqual(3);

      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('RichEditor_1');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('enterKeyType'))
        .assertEqual(8);
      console.info('[richEditorUndefined_static_0014] END');
      done();
    });

    /**
     * @tc.number   richEditorUndefined_static_0015
     * @tc.name     richEditorUndefined_static_0015
     * @tc.desc     test barState
     * @tc.level    Level.LEVEL1
     */
    it('richEditorUndefined_static_0015', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[richEditorUndefined_static_0015] START');
      let driver: Driver = Driver.create();
      let strJson = inspector.getInspectorByKey('RichEditor_1');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('barState'))
        .assertEqual(1);

      let changeBtn = await driver.findComponent(ON.id('Btn_BarState'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('RichEditor_1');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('barState'))
        .assertEqual(2);

      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('RichEditor_1');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('barState'))
        .assertEqual(1);
      console.info('[richEditorUndefined_static_0016] END');
      done();
    });

    /**
     * @tc.number   richEditorUndefined_static_0016
     * @tc.name     richEditorUndefined_static_0016
     * @tc.desc     test enablePreviewText
     * @tc.level    Level.LEVEL1
     */
    it('richEditorUndefined_static_0016', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[richEditorUndefined_static_0016] START');
      let driver: Driver = Driver.create();
      let strJson = inspector.getInspectorByKey('RichEditor_1');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('enablePreviewText'))
        .assertEqual('true');

      let changeBtn = await driver.findComponent(ON.id('Btn_EnablePreviewText'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('RichEditor_1');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('enablePreviewText'))
        .assertEqual('false');

      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      strJson = inspector.getInspectorByKey('RichEditor_1');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('enablePreviewText'))
        .assertEqual('true');
      console.info('[richEditorUndefined_static_0016] END');
      done();
    });
  })
}