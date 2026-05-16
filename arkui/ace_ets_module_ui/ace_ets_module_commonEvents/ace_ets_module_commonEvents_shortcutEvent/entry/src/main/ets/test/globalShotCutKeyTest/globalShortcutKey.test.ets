/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router'
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import events_emitter from '@ohos.events.emitter';
import input from '@ohos.multimodalInput.keyCode';
import { BusinessError } from '@ohos.base';
import CommonFunc from '../../MainAbility/common/Common';
import { MessageManager, Callback } from '../../MainAbility/common/MessageManager';

// to test Ctrl + A ,Ctrl + C ..
const  keycodeMap = new Map<string|FunctionKey, number>();
keycodeMap.set("C", input.KeyCode.KEYCODE_C);
keycodeMap.set("A", input.KeyCode.KEYCODE_A);
keycodeMap.set("Z", input.KeyCode.KEYCODE_Z);
keycodeMap.set("Y", input.KeyCode.KEYCODE_Y);
keycodeMap.set("V", input.KeyCode.KEYCODE_V);

keycodeMap.set(FunctionKey.ESC, input.KeyCode.KEYCODE_ESCAPE);
keycodeMap.set(FunctionKey.F1, input.KeyCode.KEYCODE_F1);
keycodeMap.set(FunctionKey.F2, input.KeyCode.KEYCODE_F2);
keycodeMap.set(FunctionKey.F3, input.KeyCode.KEYCODE_F3);
keycodeMap.set(FunctionKey.F4, input.KeyCode.KEYCODE_F4);
keycodeMap.set(FunctionKey.F5, input.KeyCode.KEYCODE_F5);
keycodeMap.set(FunctionKey.F6, input.KeyCode.KEYCODE_F6);
keycodeMap.set(FunctionKey.F7, input.KeyCode.KEYCODE_F7);
keycodeMap.set(FunctionKey.F8, input.KeyCode.KEYCODE_F8);
keycodeMap.set(FunctionKey.F9, input.KeyCode.KEYCODE_F9);
keycodeMap.set(FunctionKey.F10, input.KeyCode.KEYCODE_F10);
keycodeMap.set(FunctionKey.F11, input.KeyCode.KEYCODE_F11);
keycodeMap.set(FunctionKey.F12, input.KeyCode.KEYCODE_F12);
keycodeMap.set(FunctionKey.TAB, input.KeyCode.KEYCODE_TAB);
keycodeMap.set(FunctionKey.DPAD_UP, input.KeyCode.KEYCODE_DPAD_UP);
keycodeMap.set(FunctionKey.DPAD_DOWN, input.KeyCode.KEYCODE_DPAD_DOWN);
keycodeMap.set(FunctionKey.DPAD_LEFT, input.KeyCode.KEYCODE_DPAD_LEFT);
keycodeMap.set(FunctionKey.DPAD_RIGHT, input.KeyCode.KEYCODE_DPAD_RIGHT);


async function testAsyncFunctionSingle2(keyChar: string|FunctionKey) {
  console.info('test  + ' + keyChar + " start");
  globalThis.value.message.notify({name:'changeChar2',value:keyChar})
  await CommonFunc.sleep(500);
  let driver = Driver.create();
  // keyboard to sumilate single press key
  await driver.triggerKey(keycodeMap.get(keyChar));
  await CommonFunc.sleep(2000);
  // to get the data to check
  let tt2 = getInspectorByKey('keyTest2');
  let obj2: ESObject = JSON.parse(tt2);
  console.info('SUB_ACE_SUPPORT_GLOBAL_SHORTCUT_KEY_REGISTRATION_0230 '+ obj2.$attrs.content);
  if (keyChar === 'C' || keyChar === 'A' || keyChar === 'Z' || keyChar === 'Y' || keyChar === 'V') {
    expect(obj2.$attrs.content).assertEqual("single key test");
  } else {
    expect(obj2.$attrs.content).assertEqual("I clicked Button2 " + keyChar);
  }

}

async function testAsyncFunction3(keyChar: string|FunctionKey) {
  console.info('test three key + ' + keyChar + " start");
  globalThis.value.message.notify({name:'changeChar3',value:keyChar})
  await CommonFunc.sleep(500);
  let driver = Driver.create();
  // keyboard to sumilate
  if(keyChar === 'Z') {
    globalThis.value.message.notify({name:'keys',value:[ModifierKey.SHIFT,ModifierKey.CTRL]})
    await CommonFunc.sleep(500);
    await driver.triggerCombineKeys(input.KeyCode.KEYCODE_CTRL_LEFT, input.KeyCode.KEYCODE_SHIFT_LEFT, keycodeMap.get(keyChar));
    await CommonFunc.sleep(2000);
    // to get the data to check
    let tt2 = getInspectorByKey('keyTest3');
    let obj2: ESObject = JSON.parse(tt2);
    console.info('SUB_ACE_SUPPORT_GLOBAL_SHORTCUT_KEY_REGISTRATION_0280  '+ obj2.$attrs.content);
    expect(obj2.$attrs.content).assertEqual('I clicked Button3 ' + keyChar);
  }

  if(keyChar === FunctionKey.TAB) {
    globalThis.value.message.notify({name:'keys',value:[ModifierKey.SHIFT,ModifierKey.ALT]})
    await CommonFunc.sleep(500);
    await driver.triggerCombineKeys(input.KeyCode.KEYCODE_ALT_LEFT, input.KeyCode.KEYCODE_SHIFT_LEFT, keycodeMap.get(keyChar));
    await CommonFunc.sleep(2000);
    // to get the data to check
    let tt2 = getInspectorByKey('keyTest3');
    let obj2: ESObject = JSON.parse(tt2);
    console.info('SUB_ACE_SUPPORT_GLOBAL_SHORTCUT_KEY_REGISTRATION_0280  '+ obj2.$attrs.content);
    expect(obj2.$attrs.content).assertEqual('three key test');
  }

}

export default function globalShortcutKeyTest() {
  describe('globalShortcutKeyTest', () => {
    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/shotCutKeyTest/globalShortcutKeyTest",
      }
      try {
        router.clear();
        let pages = router.getState();
        if (pages == null || !("globalShortcutKeyTest" == pages.name)) {
          await router.pushUrl(options).then(() => {
            console.info(`globalShortcutKeyTest router.pushUrl success`);
          }).catch((err: BusinessError) => {
            console.error(`globalShortcutKeyTest router.pushUrl failed, code is ${err.code}, message is ${err.message}`);
          })
          await CommonFunc.sleep(2500);
        }
      } catch (err) {
        console.error(`SglobalShortcutKeyTest beforeEach error:` + JSON.stringify(err));
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(500);
    });

    /**
     * @tc.name   SUB_ACE_SUPPORT_GLOBAL_SHORTCUT_KEY_REGISTRATION_0230
     * @tc.number SUB_ACE_SUPPORT_GLOBAL_SHORTCUT_KEY_REGISTRATION_0230
     * @tc.desc   simulate the keyboard single key test press "F1,F2"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_SUPPORT_GLOBAL_SHORTCUT_KEY_REGISTRATION_0230', Level.LEVEL0, async (done: Function) => {
      let keyStrings: (string | FunctionKey)[] = ["C", "A", "Z", "Y", "V",FunctionKey.ESC, FunctionKey.F1, FunctionKey.F2,
        FunctionKey.F3, FunctionKey.F3,
        FunctionKey.F4, FunctionKey.F5,
        FunctionKey.F6, FunctionKey.F7,
        FunctionKey.F8, FunctionKey.F9,
        FunctionKey.F10, FunctionKey.F12,
        FunctionKey.TAB, FunctionKey.DPAD_UP,
        FunctionKey.DPAD_DOWN, FunctionKey.DPAD_LEFT,
        FunctionKey.DPAD_RIGHT];
      // to single press C ,A ,Z ,Y ..
      for (const keyChar of keyStrings) {
        await testAsyncFunctionSingle2(keyChar);
      }
      let strJson: string = getInspectorByKey('keyTest2');
      console.info("component width strJson:" + strJson);
      expect(JSON.parse(strJson).$type).assertEqual('Text');
      console.info("SUB_ACE_SUPPORT_GLOBAL_SHORTCUT_KEY_REGISTRATION_0230 end");
      done();
    });

    /**
     * @tc.name   SUB_ACE_SUPPORT_GLOBAL_SHORTCUT_KEY_REGISTRATION_0280
     * @tc.number SUB_ACE_SUPPORT_GLOBAL_SHORTCUT_KEY_REGISTRATION_0280
     * @tc.desc   simulate the keyboard operate “CTRL + SHIFT + Z”
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_SUPPORT_GLOBAL_SHORTCUT_KEY_REGISTRATION_0280', Level.LEVEL0, async (done: Function) => {
      let keyStrings: (string | FunctionKey)[] = [FunctionKey.TAB, 'Z'];
      // to test Ctrl + SHIT + Z..
      for (const keyChar of keyStrings) {
        await testAsyncFunction3(keyChar);
      }
      let strJson: string = getInspectorByKey('keyTest2');
      console.info("component width strJson:" + strJson);
      expect(JSON.parse(strJson).$type).assertEqual('Text');
      console.info("SUB_ACE_SUPPORT_GLOBAL_SHORTCUT_KEY_REGISTRATION_0280 end");
      done();
    });
    /**
     * @tc.name   SUB_ACE_SUPPORT_GLOBAL_SHORTCUT_KEY_REGISTRATION_0340
     * @tc.number SUB_ACE_SUPPORT_GLOBAL_SHORTCUT_KEY_REGISTRATION_0340
     * @tc.desc   'CTRAL + M' is enable when button is unfocuesed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_SUPPORT_GLOBAL_SHORTCUT_KEY_REGISTRATION_0340', Level.LEVEL0, async (done: Function) => {
      let driver = Driver.create();
      // keyboard to sumilate 'CTRL + M'
      await driver.triggerCombineKeys(input.KeyCode.KEYCODE_CTRL_LEFT, input.KeyCode.KEYCODE_M);
      await CommonFunc.sleep(1500);
      // to get the data to check
      let tt2 = getInspectorByKey('keyTest5');
      let obj2: ESObject = JSON.parse(tt2);
      console.info('SUB_ACE_SUPPORT_GLOBAL_SHORTCUT_KEY_REGISTRATION_0340' + obj2.$attrs.content);
      expect(obj2.$attrs.content).assertEqual('I clicked Button 5');
      done();
    });

    /**
     * @tc.name   SUB_ACE_SUPPORT_GLOBAL_SHORTCUT_KEY_REGISTRATION_0380
     * @tc.number SUB_ACE_SUPPORT_GLOBAL_SHORTCUT_KEY_REGISTRATION_0380
     * @tc.desc   'CTRAL + SHIFT + ←' is unenable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_SUPPORT_GLOBAL_SHORTCUT_KEY_REGISTRATION_0380', Level.LEVEL0, async (done: Function) => {
      let driver = Driver.create();
      // keyboard to sumilate 'CTRAL + ←'
      await driver.triggerCombineKeys(input.KeyCode.KEYCODE_CTRL_LEFT,input.KeyCode.KEYCODE_CTRL_LEFT, input.KeyCode.KEYCODE_DPAD_LEFT);
      await CommonFunc.sleep(1500);
      // to get the data to check
      let tt2 = getInspectorByKey('keyTest6');
      let obj2: ESObject = JSON.parse(tt2);
      console.info('SUB_ACE_SUPPORT_GLOBAL_SHORTCUT_KEY_REGISTRATION_0380' + obj2.$attrs.content);
      expect(obj2.$attrs.content).assertEqual('');
      done();
    });

    /**
     * @tc.name   SUB_ACE_SUPPORT_GLOBAL_SHORTCUT_KEY_REGISTRATION_0370
     * @tc.number SUB_ACE_SUPPORT_GLOBAL_SHORTCUT_KEY_REGISTRATION_0370
     * @tc.desc   'CTRAL + I' is reponse when button is hidden
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_SUPPORT_GLOBAL_SHORTCUT_KEY_REGISTRATION_0370', Level.LEVEL0, async (done: Function) => {
      let driver = Driver.create();
      // keyboard to sumilate 'CTRAL + I'
      await driver.triggerCombineKeys(input.KeyCode.KEYCODE_CTRL_LEFT, input.KeyCode.KEYCODE_I);
      await CommonFunc.sleep(1500);
      // to get the data to check
      let tt2 = getInspectorByKey('keyTest7');
      let obj2: ESObject = JSON.parse(tt2);
      console.info('SUB_ACE_SUPPORT_GLOBAL_SHORTCUT_KEY_REGISTRATION_0370' + obj2.$attrs.content);
      expect(obj2.$attrs.content).assertEqual('I clicked Button 7');
      done();
    });


    /**
     * @tc.name   SUB_ACE_SUPPORT_GLOBAL_SHORTCUT_KEY_REGISTRATION_0330
     * @tc.number SUB_ACE_SUPPORT_GLOBAL_SHORTCUT_KEY_REGISTRATION_0330
     * @tc.desc   'SHIFT + + ->' is reponse when button is hidden
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_SUPPORT_GLOBAL_SHORTCUT_KEY_REGISTRATION_0330', Level.LEVEL0, async (done: Function) => {
      let driver = Driver.create();
      // keyboard to sumilate 'SHIFT + ->'
      await driver.triggerCombineKeys(input.KeyCode.KEYCODE_SHIFT_LEFT, input.KeyCode.KEYCODE_DPAD_RIGHT);
      await CommonFunc.sleep(1500);
      // to get the data to check
      let tt2 = getInspectorByKey('keyTest8');
      let obj2: ESObject = JSON.parse(tt2);
      console.info('SUB_ACE_SUPPORT_GLOBAL_SHORTCUT_KEY_REGISTRATION_0330' + obj2.$attrs.content);
      expect(obj2.$attrs.content).assertEqual('I clicked Button 8');
      done();
    });

  })
}
