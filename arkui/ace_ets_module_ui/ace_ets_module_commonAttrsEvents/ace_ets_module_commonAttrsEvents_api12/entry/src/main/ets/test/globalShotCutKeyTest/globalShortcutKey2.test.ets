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
import input from '@ohos.multimodalInput.keyCode';
import { BusinessError } from '@ohos.base';
import CommonFunc from '../../MainAbility/common/Common';


// to test SHIFT +TAB
const  keycodeMap = new Map<string|FunctionKey, number>();

keycodeMap.set(FunctionKey.TAB, input.KeyCode.KEYCODE_TAB);

async function testAsyncFunction(keyChar: string|FunctionKey, driver:Driver) {
  console.info('test SHIFT + ' + keyChar + " start");
  // keyboard to simulate
  await driver.triggerCombineKeys(input.KeyCode.KEYCODE_SHIFT_LEFT, keycodeMap.get(keyChar));
  await CommonFunc.sleep(2000);
  // to get the data to check
  let tt2 = getInspectorByKey('keyTest2Tab');
  let obj2: ESObject = JSON.parse(tt2);
  console.info('SUB_ACE_SUPPORT_GLOBAL_SHORTCUT_KEY_REGISTRATION_0160 '+ obj2.$attrs.content);
  expect(obj2.$attrs.content).assertEqual("I clicked Button 1");
}

export default function globalShortcutKeyTest2() {
  describe('globalShortcutKeyTest2', () => {
    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/shotCutKeyTest/globalShortcutKeyTest2",
      }
      try {
        router.clear();
        let pages = router.getState();
        if (pages == null || !("globalShortcutKeyTest2" == pages.name)) {
          await router.pushUrl(options).then(() => {
            console.info(`globalShortcutKeyTest2 router.pushUrl success`);
          }).catch((err: BusinessError) => {
            console.error(`globalShortcutKeyTest2 router.pushUrl failed, code is ${err.code}, message is ${err.message}`);
          })
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error(`SglobalShortcutKeyTest2 beforeEach error:` + JSON.stringify(err));
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(500);
    });

    /**
     * @tc.name   SUB_ACE_SUPPORT_GLOBAL_SHORTCUT_KEY_REGISTRATION_0160
     * @tc.number SUB_ACE_SUPPORT_GLOBAL_SHORTCUT_KEY_REGISTRATION_0160
     * @tc.desc   simulate the keyboard operate “SHIFT + TAB”
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_SUPPORT_GLOBAL_SHORTCUT_KEY_REGISTRATION_0160', Level.LEVEL0, async (done: Function) => {
      let keyStrings: (string | FunctionKey)[] = [
        FunctionKey.TAB];
      let driver = Driver.create();
      // SHIT + TAB
      for (const keyChar of keyStrings) {
        await testAsyncFunction(keyChar, driver);
      }
      console.info("SUB_ACE_SUPPORT_GLOBAL_SHORTCUT_KEY_REGISTRATION_0160 end");
      done();
    });
  })
}
