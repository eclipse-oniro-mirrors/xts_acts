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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import CommonFunc from '../../../ets/MainAbility/common/Common'
import {  Driver, ON } from '@ohos.UiTest';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function textAreaOnCaretAndKeyboardTest() {
  describe('textAreaOnCaretAndKeyboardTest', () => {
    beforeAll(() => {
      console.info("textAreaOnCaretAndKeyboardTest beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("textAreaOnCaretAndKeyboardTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextArea/textAreaOnCaretAndKeyboard',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        // routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get textAreaOnCaretAndKeyboardTest state pages:" + JSON.stringify(pages));
        if (!("textAreaOnCaretAndKeyboard" == pages.name)) {
          console.info("get textAreaOnCaretAndKeyboardTest pages.name:" + '');
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push textAreaOnCaretAndKeyboardTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textAreaOnCaretAndKeyboardTest page error:" + err);
      }
      console.info("textAreaOnCaretAndKeyboardTest beforeEach end");
    });


    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("textAreaOnCaretAndKeyboard after each called");
    });

    
    /**
     * @tc.number   textAreaOnCaretAndKeyboard001
     * @tc.name     textAreaOnCaretAndKeyboard001
     * @tc.desc     textAreaOnCaretAndKeyboard001
     * @tc.level    Level.LEVEL1
     */
    it('textAreaOnCaretAndKeyboard001', Level.LEVEL1, async () => {
      console.info('textAreaOnCaretAndKeyboard001 START');
      let driver: Driver = Driver.create();
      let textAreaComponent = await driver.findComponent(ON.id('textAreaOnCaretAndKeyboard'));
      await (textAreaComponent?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);
      let buttonComponent = await driver.findComponent(ON.id('button'));
      await (buttonComponent?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let strJson = inspector.getInspectorByKey('textAreaOnCaretAndKeyboard');
      await CommonFunc.sleep(300);
      console.info(`[textAreaOnCaretAndKeyboard001] strJson is:${strJson}`);
      let obj = JSON.parseJsonElement(strJson);
      await CommonFunc.sleep(500);
      expect(obj.getElement('$attrs').getString('caretPosition')).assertEqual('5');

      await (textAreaComponent?.inputText('hello world') as Promise<void>);
      await driver.triggerKey(2047)
      await CommonFunc.sleep(500);
      await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);
      await (buttonComponent?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let strJson2 = inspector.getInspectorByKey('textAreaOnCaretAndKeyboard');
      await CommonFunc.sleep(500);
      console.info(`[textAreaOnCaretAndKeyboard001] strJson2 is:${strJson2}`);
      let obj2 = JSON.parseJsonElement(strJson2);
      await CommonFunc.sleep(500);
      expect(obj2.getElement('$attrs').getString('caretPosition')).assertEqual('8');
    });

    
    /**
     * @tc.number   textAreaOnCaretAndKeyboard_static_002
     * @tc.name     textAreaOnCaretAndKeyboard_static_002
     * @tc.desc     textAreaOnCaretAndKeyboard_static_002
     * @tc.level    Level.LEVEL1
     */
    it('textAreaOnCaretAndKeyboard_static_002', Level.LEVEL1, async () => {
      console.info('textAreaOnCaretAndKeyboard_static_002 START');
      let driver = Driver.create();
      let textAreaComponent = await driver.findComponent(ON.id('textAreaOnCaretAndKeyboard'));
      await (textAreaComponent?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);
      let buttonComponent = await driver.findComponent(ON.id('button_1'));
      await (buttonComponent?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let strJson = inspector.getInspectorByKey('textAreaOnCaretAndKeyboard');
      console.info(`[textAreaOnCaretAndKeyboard_static_002] strJson is:${strJson}`);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('caretPosition')).assertEqual('0');
    });

  })
}