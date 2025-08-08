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

async function testAsyncFunction(keyChar: string|FunctionKey, driver:Driver) {
  console.info('test Ctrl + ' + keyChar + " start");
  globalThis.value.message.notify({name:'changeChar',value:keyChar})
  await CommonFunc.sleep(500);
  // keyboard to sumilate
  await driver.triggerCombineKeys(input.KeyCode.KEYCODE_CTRL_LEFT, keycodeMap.get(keyChar));
  await CommonFunc.sleep(2000);
  // to get the data to check
  let tt2 = getInspectorByKey('keyTest');
  let obj2: ESObject = JSON.parse(tt2);
  console.info('SUB_ACE_SUPPORT_GLOBAL_SHORTCUT_KEY_REGISTRATION_0800 '+ obj2.$attrs.content);
  expect(obj2.$attrs.content).assertEqual("I clicked Button " + keyChar);
}

export default function globalShortcutKeyTest3() {
  describe('globalShortcutKeyTest3', () => {
    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/shotCutKeyTest/globalShortcutKeyTest3",
      }
      try {
        router.clear();
        let pages = router.getState();
        if (pages == null || !("globalShortcutKeyTest3" == pages.name)) {
          await router.pushUrl(options).then(() => {
            console.info(`globalShortcutKeyTest3 router.pushUrl success`);
          }).catch((err: BusinessError) => {
            console.error(`globalShortcutKeyTest3 router.pushUrl failed, code is ${err.code}, message is ${err.message}`);
          })
          await CommonFunc.sleep(2500);
        }
      } catch (err) {
        console.error(`SglobalShortcutKeyTest3 beforeEach error:` + JSON.stringify(err));
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(500);
    });

    /**
     * @tc.number
     * @tc.name      SUB_ACE_SUPPORT_GLOBAL_SHORTCUT_KEY_REGISTRATION_0080
     * @tc.desc      simulate the keyboard operate “CTRL + C”
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('SUB_ACE_SUPPORT_GLOBAL_SHORTCUT_KEY_REGISTRATION_0080', Level.LEVEL0, async (done: Function) => {
      let keyStrings: (string | FunctionKey)[] = ["C", "A", "Z", "Y", "V",FunctionKey.ESC, FunctionKey.F1, FunctionKey.F2,
        FunctionKey.F3, FunctionKey.F3,
        FunctionKey.F4, FunctionKey.F5,
        FunctionKey.F6, FunctionKey.F7,
        FunctionKey.F8, FunctionKey.F9,
        FunctionKey.F10, FunctionKey.F12,
        FunctionKey.TAB, FunctionKey.DPAD_UP,
        FunctionKey.DPAD_DOWN, FunctionKey.DPAD_LEFT,
        FunctionKey.DPAD_RIGHT];
        let driver = Driver.create();
        // to test Ctrl + A ,Ctrl + C ..
        for (const keyChar of keyStrings) {
          await testAsyncFunction(keyChar, driver);
        }
        console.info("SUB_ACE_SUPPORT_GLOBAL_SHORTCUT_KEY_REGISTRATION_0800 end");
        done();
    });
  })
}
