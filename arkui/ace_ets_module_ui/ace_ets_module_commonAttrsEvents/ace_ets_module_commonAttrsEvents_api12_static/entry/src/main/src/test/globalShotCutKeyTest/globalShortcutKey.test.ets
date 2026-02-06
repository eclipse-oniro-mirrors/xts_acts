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

import type { KeyCode } from '@ohos.multimodalInput.keyCode';
import { KeyCode } from '@ohos.multimodalInput.keyCode'
import { BusinessError } from '@ohos.base';
import { Callback, Message, MessageManager } from '../../../ets/MainAbility/common/MessageManager';
import { afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium';
import { Component, Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { FunctionKey, ModifierKey } from '@ohos.arkui.component'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { UtilsTest } from '../Util.test'

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

// to test Ctrl + A ,Ctrl + C ..
const keycodeMap = new Map<string | FunctionKey, int>();
keycodeMap.set("C", KeyCode.KEYCODE_C);
keycodeMap.set("A", KeyCode.KEYCODE_A);
keycodeMap.set("Z", KeyCode.KEYCODE_Z);
keycodeMap.set("Y", KeyCode.KEYCODE_Y);
keycodeMap.set("V", KeyCode.KEYCODE_V);

keycodeMap.set(FunctionKey.ESC, KeyCode.KEYCODE_ESCAPE);
keycodeMap.set(FunctionKey.F1, KeyCode.KEYCODE_F1);
keycodeMap.set(FunctionKey.F2, KeyCode.KEYCODE_F2);
keycodeMap.set(FunctionKey.F3, KeyCode.KEYCODE_F3);
keycodeMap.set(FunctionKey.F4, KeyCode.KEYCODE_F4);
keycodeMap.set(FunctionKey.F5, KeyCode.KEYCODE_F5);
keycodeMap.set(FunctionKey.F6, KeyCode.KEYCODE_F6);
keycodeMap.set(FunctionKey.F7, KeyCode.KEYCODE_F7);
keycodeMap.set(FunctionKey.F8, KeyCode.KEYCODE_F8);
keycodeMap.set(FunctionKey.F9, KeyCode.KEYCODE_F9);
keycodeMap.set(FunctionKey.F10, KeyCode.KEYCODE_F10);
keycodeMap.set(FunctionKey.F11, KeyCode.KEYCODE_F11);
keycodeMap.set(FunctionKey.F12, KeyCode.KEYCODE_F12);
keycodeMap.set(FunctionKey.TAB, KeyCode.KEYCODE_TAB);
keycodeMap.set(FunctionKey.DPAD_UP, KeyCode.KEYCODE_DPAD_UP);
keycodeMap.set(FunctionKey.DPAD_DOWN, KeyCode.KEYCODE_DPAD_DOWN);
keycodeMap.set(FunctionKey.DPAD_LEFT, KeyCode.KEYCODE_DPAD_LEFT);
keycodeMap.set(FunctionKey.DPAD_RIGHT, KeyCode.KEYCODE_DPAD_RIGHT);

export default function globalShortcutKeyTest() {
  describe('globalShortcutKeyTest', () => {
    beforeAll(() => {
      console.info("assemblyCallbackTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsEvents.api12.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/shotCutKeyTest/globalShortcutKeyTest",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        if (pages == null || !("globalShortcutKeyTest" == pages.name)) {
          routerInstance.pushUrl(options).then(() => {
            console.info(`globalShortcutKeyTest router.pushUrl success`);
          }).catch((err: Error): void => {
            console.error(`globalShortcutKeyTest router.pushUrl failed, code is ${err.code}, message is ${err.message}`);
          })
          await CommonFunc.sleep(2500);
        }
      } catch (err) {
        console.error(`SglobalShortcutKeyTest beforeEach error:` + JSON.stringify(err));
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(500);
    });

    /**
     * @tc.number    SUB_ACE_SUPPORT_GLOBAL_SHORTCUT_KEY_REGISTRATION_STATIC_0230
     * @tc.name      SUB_ACE_SUPPORT_GLOBAL_SHORTCUT_KEY_REGISTRATION_STATIC_0230
     * @tc.desc      simulate the keyboard single key test press "F1,F2"
     * @tc.level:    Level 0
     */
    it('SUB_ACE_SUPPORT_GLOBAL_SHORTCUT_KEY_REGISTRATION_STATIC_0230', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let keyStrings: (string | FunctionKey)[] =
          new Array<string | FunctionKey>("C", "A", "Z", "Y", "V", FunctionKey.ESC, FunctionKey.F1, FunctionKey.F2,
            FunctionKey.F3, FunctionKey.F3,
            FunctionKey.F4, FunctionKey.F5,
            FunctionKey.F6, FunctionKey.F7,
            FunctionKey.F8, FunctionKey.F9,
            FunctionKey.F10, FunctionKey.F12,
            FunctionKey.TAB, FunctionKey.DPAD_UP,
            FunctionKey.DPAD_DOWN, FunctionKey.DPAD_LEFT,
            FunctionKey.DPAD_RIGHT);
        // to single press C ,A ,Z ,Y ..
        for (const keyChar of keyStrings) {
          await testAsyncFunctionSingle2(keyChar);
        }
        console.info("SUB_ACE_SUPPORT_GLOBAL_SHORTCUT_KEY_REGISTRATION_STATIC_0230 end");
        done();
      });

    /**
     * @tc.number    SUB_ACE_SUPPORT_GLOBAL_SHORTCUT_KEY_REGISTRATION_STATIC_0280
     * @tc.name      SUB_ACE_SUPPORT_GLOBAL_SHORTCUT_KEY_REGISTRATION_STATIC_0280
     * @tc.desc      simulate the keyboard operate “CTRL + SHIFT + Z”
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('SUB_ACE_SUPPORT_GLOBAL_SHORTCUT_KEY_REGISTRATION_STATIC_0280', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let keyStrings = [FunctionKey.ESC, FunctionKey.F4, FunctionKey.TAB, 'Z'];
        // to test Ctrl + SHIT + Z..
        for (const keyChar of keyStrings) {
          await testAsyncFunction3(keyChar);
        }
        console.info("SUB_ACE_SUPPORT_GLOBAL_SHORTCUT_KEY_REGISTRATION_STATIC_0280 end");
        done();
      });
    /**
     * @tc.number    SUB_ACE_SUPPORT_GLOBAL_SHORTCUT_KEY_REGISTRATION_STATIC_0340
     * @tc.name      SUB_ACE_SUPPORT_GLOBAL_SHORTCUT_KEY_REGISTRATION_STATIC_0340
     * @tc.desc      'CTRAL + M' is enable when button is unfocuesed
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('SUB_ACE_SUPPORT_GLOBAL_SHORTCUT_KEY_REGISTRATION_STATIC_0340', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let driver = Driver.create();
        // keyboard to sumilate 'CTRL + M'
        await driver.triggerCombineKeys(KeyCode.KEYCODE_CTRL_LEFT, KeyCode.KEYCODE_M);
        await CommonFunc.sleep(1500);
        // to get the data to check
        let tt2 = inspector.getInspectorByKey('keyTest5');
        let obj2 = JSON.parseJsonElement(tt2);
        console.info('SUB_ACE_SUPPORT_GLOBAL_SHORTCUT_KEY_REGISTRATION_STATIC_0340' +
        obj2.getElement('$attrs').getString('content'));
        expect(obj2.getElement('$attrs').getString('content')).assertEqual('I clicked Button 5');
        done();
      });

    /**
     * @tc.number    SUB_ACE_SUPPORT_GLOBAL_SHORTCUT_KEY_REGISTRATION_STATIC_0380
     * @tc.name      SUB_ACE_SUPPORT_GLOBAL_SHORTCUT_KEY_REGISTRATION_STATIC_0380
     * @tc.desc      'CTRAL + SHIFT + ←' is unenable
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('SUB_ACE_SUPPORT_GLOBAL_SHORTCUT_KEY_REGISTRATION_STATIC_0380', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let driver = Driver.create();
        // keyboard to sumilate 'CTRAL + ←'
        await driver.triggerCombineKeys(KeyCode.KEYCODE_CTRL_LEFT, KeyCode.KEYCODE_CTRL_LEFT,
          KeyCode.KEYCODE_DPAD_LEFT);
        await CommonFunc.sleep(1500);
        // to get the data to check
        let tt2 = inspector.getInspectorByKey('keyTest6');
        let obj2 = JSON.parseJsonElement(tt2);
        console.info('SUB_ACE_SUPPORT_GLOBAL_SHORTCUT_KEY_REGISTRATION_STATIC_0380' +
        obj2.getElement('$attrs').getString('content'));
        expect(obj2.getElement('$attrs').getString('content')).assertEqual('');
        done();
      });

    /**
     * @tc.number    SUB_ACE_SUPPORT_GLOBAL_SHORTCUT_KEY_REGISTRATION_STATIC_0370
     * @tc.name      SUB_ACE_SUPPORT_GLOBAL_SHORTCUT_KEY_REGISTRATION_STATIC_0370
     * @tc.desc      'CTRAL + I' is reponse when button is hidden
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('SUB_ACE_SUPPORT_GLOBAL_SHORTCUT_KEY_REGISTRATION_STATIC_0370', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let driver = Driver.create();
        // keyboard to sumilate 'CTRAL + I'
        await driver.triggerCombineKeys(KeyCode.KEYCODE_CTRL_LEFT, KeyCode.KEYCODE_I);
        await CommonFunc.sleep(1500);
        // to get the data to check
        let tt2 = inspector.getInspectorByKey('keyTest7');
        let obj2 = JSON.parseJsonElement(tt2);
        console.info('SUB_ACE_SUPPORT_GLOBAL_SHORTCUT_KEY_REGISTRATION_STATIC_0370' +
        obj2.getElement('$attrs').getString('content'));
        expect(obj2.getElement('$attrs').getString('content')).assertEqual('I clicked Button 7');
        done();
      });


    /**
     * @tc.number    SUB_ACE_SUPPORT_GLOBAL_SHORTCUT_KEY_REGISTRATION_STATIC_0330
     * @tc.name      SUB_ACE_SUPPORT_GLOBAL_SHORTCUT_KEY_REGISTRATION_STATIC_0330
     * @tc.desc      'SHIFT + + ->' is reponse when button is hidden
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('SUB_ACE_SUPPORT_GLOBAL_SHORTCUT_KEY_REGISTRATION_STATIC_0330', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let driver = Driver.create();
        // keyboard to sumilate 'SHIFT + ->'
        await driver.triggerCombineKeys(KeyCode.KEYCODE_SHIFT_LEFT, KeyCode.KEYCODE_DPAD_RIGHT);
        await CommonFunc.sleep(1500);
        // to get the data to check
        let tt2 = inspector.getInspectorByKey('keyTest8');
        let obj2 = JSON.parseJsonElement(tt2);
        console.info('SUB_ACE_SUPPORT_GLOBAL_SHORTCUT_KEY_REGISTRATION_STATIC_0330' +
        obj2.getElement('$attrs').getString('content'));
        expect(obj2.getElement('$attrs').getString('content')).assertEqual('I clicked Button 8');
        done();
      });

  })
}
async function testAsyncFunctionSingle2(keyChar: string | FunctionKey): Promise<void> {
  console.info('test  + ' + keyChar + " start");
  AppStorage.get<MessageManager<string | FunctionKey>>("messageManager")!.notify({
    name: 'changeChar2', value: keyChar
  });

  await CommonFunc.sleep(500);
  let driver = Driver.create();
  // keyboard to sumilate single press key
  driver.triggerKey(keycodeMap.get(keyChar) as int);
  await CommonFunc.sleep(2000);
  // to get the data to check
  let tt2 = inspector.getInspectorByKey('keyTest2');
  let obj2 = JSON.parseJsonElement(tt2);
  console.info('SUB_ACE_SUPPORT_GLOBAL_SHORTCUT_KEY_REGISTRATION_STATIC_0230 ' +
  obj2.getElement('$attrs').getString('content'));
  if (keyChar === 'C' || keyChar === 'A' || keyChar === 'Z' || keyChar === 'Y' || keyChar === 'V') {
    expect(obj2.getElement('$attrs').getString('content')).assertEqual("single key test");
  } else {
    expect(obj2.getElement('$attrs').getString('content')).assertEqual("I clicked Button2 " + keyChar);
  }

}

async function testAsyncFunction3(keyChar: string | FunctionKey): Promise<void> {
  console.info('test three key + ' + keyChar + " start");
  AppStorage.get<MessageManager<string | FunctionKey>>("messageManager")!.notify({
    name: 'changeChar3', value: keyChar
  });
  await CommonFunc.sleep(500);
  let driver = Driver.create();
  // keyboard to sumilate
  if (keyChar === FunctionKey.ESC) {
    AppStorage.get<MessageManager<ModifierKey[]>>("messageManager")!.notify({
      name: 'keys', value: new Array<ModifierKey>(ModifierKey.SHIFT, ModifierKey.CTRL)
    });
    await CommonFunc.sleep(500);
    driver.triggerCombineKeys(KeyCode.KEYCODE_CTRL_LEFT, KeyCode.KEYCODE_SHIFT_LEFT, keycodeMap.get(keyChar));
    await CommonFunc.sleep(2000);
    // to get the data to check
    let tt2 = inspector.getInspectorByKey('keyTest3');
    let obj2 = JSON.parseJsonElement(tt2);
    console.info('SUB_ACE_SUPPORT_GLOBAL_SHORTCUT_KEY_REGISTRATION_STATIC_0280  ' +
    obj2.getElement('$attrs').getString('content'));
    expect(obj2.getElement('$attrs').getString('content')).assertEqual('three key test');
  }

  if (keyChar === 'Z') {

    AppStorage.get<MessageManager<ModifierKey[]>>("messageManager")!.notify({
      name: 'keys', value: new Array<ModifierKey>(ModifierKey.SHIFT, ModifierKey.CTRL)
    });
    await CommonFunc.sleep(500);
    driver.triggerCombineKeys(KeyCode.KEYCODE_CTRL_LEFT, KeyCode.KEYCODE_SHIFT_LEFT, keycodeMap.get(keyChar));
    await CommonFunc.sleep(2000);
    // to get the data to check
    let tt2 = inspector.getInspectorByKey('keyTest3');
    let obj2 = JSON.parseJsonElement(tt2);
    console.info('SUB_ACE_SUPPORT_GLOBAL_SHORTCUT_KEY_REGISTRATION_STATIC_0280  ' +
    obj2.getElement('$attrs').getString('content'));
    expect(obj2.getElement('$attrs').getString('content')).assertEqual('I clicked Button3 ' + keyChar);
  }

  if (keyChar === FunctionKey.F4) {

    AppStorage.get<MessageManager<ModifierKey[]>>("messageManager")!.notify({
      name: 'keys', value: new Array<ModifierKey>(ModifierKey.SHIFT, ModifierKey.ALT)
    });
    await CommonFunc.sleep(500);
    driver.triggerCombineKeys(KeyCode.KEYCODE_ALT_LEFT, KeyCode.KEYCODE_SHIFT_LEFT, keycodeMap.get(keyChar));
    await CommonFunc.sleep(2000);
    // to get the data to check
    let tt2 = inspector.getInspectorByKey('keyTest3');
    let obj2 = JSON.parseJsonElement(tt2);
    console.info('SUB_ACE_SUPPORT_GLOBAL_SHORTCUT_KEY_REGISTRATION_STATIC_0280  ' +
    obj2.getElement('$attrs').getString('content'));
    expect(obj2.getElement('$attrs').getString('content')).assertEqual('three key test');
  }

  if (keyChar === FunctionKey.TAB) {

    AppStorage.get<MessageManager<ModifierKey[]>>("messageManager")!.notify({
      name: 'keys', value: new Array<ModifierKey>(ModifierKey.SHIFT, ModifierKey.ALT)
    });
    await CommonFunc.sleep(500);
    driver.triggerCombineKeys(KeyCode.KEYCODE_ALT_LEFT, KeyCode.KEYCODE_SHIFT_LEFT, keycodeMap.get(keyChar));
    await CommonFunc.sleep(2000);
    // to get the data to check
    let tt2 = inspector.getInspectorByKey('keyTest3');
    let obj2 = JSON.parseJsonElement(tt2);
    console.info('SUB_ACE_SUPPORT_GLOBAL_SHORTCUT_KEY_REGISTRATION_STATIC_0280  ' +
    obj2.getElement('$attrs').getString('content'));
    expect(obj2.getElement('$attrs').getString('content')).assertEqual('three key test');
  }

}