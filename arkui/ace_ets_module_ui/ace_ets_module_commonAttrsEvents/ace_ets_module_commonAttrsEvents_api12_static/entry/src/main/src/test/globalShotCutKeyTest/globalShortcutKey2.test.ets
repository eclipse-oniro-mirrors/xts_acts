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

// to test SHIFT +TAB
const keycodeMap = new Map<string | FunctionKey, int>();

keycodeMap.set(FunctionKey.TAB, KeyCode.KEYCODE_TAB);

export default function globalShortcutKeyTest2() {
  describe('globalShortcutKeyTest2', () => {
    beforeAll(() => {
      console.info("assemblyCallbackTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsEvents.api12.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/shotCutKeyTest/globalShortcutKeyTest2",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        if (pages == null || !("globalShortcutKeyTest2" == pages.name)) {
          routerInstance.pushUrl(options).then(() => {
            console.info(`globalShortcutKeyTest2 router.pushUrl success`);
          }).catch((err: Error): void => {
            console.error(`globalShortcutKeyTest2 router.pushUrl failed, code is ${err.code}, message is ${err.message}`);
          })
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error(`SglobalShortcutKeyTest2 beforeEach error:` + JSON.stringify(err));
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(500);
    });

    /**
     * @tc.number    SUB_ACE_SUPPORT_GLOBAL_SHORTCUT_KEY_REGISTRATION_STATIC_0160
     * @tc.name      SUB_ACE_SUPPORT_GLOBAL_SHORTCUT_KEY_REGISTRATION_STATIC_0160
     * @tc.desc      simulate the keyboard operate “SHIFT + TAB”
     * @tc.level:    Level 3
     * @tc.type :
     * @tc.size :
     */
    it('SUB_ACE_SUPPORT_GLOBAL_SHORTCUT_KEY_REGISTRATION_STATIC_0160', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let keyStrings: (string | FunctionKey)[] = [
          FunctionKey.TAB];
        let driver = Driver.create();
        // SHIT + TAB
        for (const keyChar of keyStrings) {
          await testAsyncFunction(keyChar, driver);
        }
        console.info("SUB_ACE_SUPPORT_GLOBAL_SHORTCUT_KEY_REGISTRATION_STATIC_0160 end");
        done();
      });
  })
}
async function testAsyncFunction(keyChar: string | FunctionKey, driver: Driver): Promise<void> {
  console.info('test SHIFT + ' + keyChar + " start");
  // keyboard to simulate
  driver.triggerCombineKeys(KeyCode.KEYCODE_SHIFT_LEFT, keycodeMap.get(keyChar) as int);
  await CommonFunc.sleep(2000);
  // to get the data to check
  let tt2 = inspector.getInspectorByKey('keyTest2Tab');
  let obj2 = JSON.parseJsonElement(tt2);
  console.info('SUB_ACE_SUPPORT_GLOBAL_SHORTCUT_KEY_REGISTRATION_STATIC_0160 ' +
  obj2.getElement('$attrs').getString('content'));
  expect(obj2.getElement('$attrs').getString('content')).assertEqual("I clicked Button 1");
}