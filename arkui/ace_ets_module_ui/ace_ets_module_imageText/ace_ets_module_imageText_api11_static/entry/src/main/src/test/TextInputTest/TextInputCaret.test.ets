'use static';
/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import {Component,MouseButton,  Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
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
let testAbilityContext:common.UIAbilityContext;

export default function textInput_caret() {
  describe('textInput_caret', () => {

    beforeAll(() => {
      console.info("textInput_caret beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("textInput_caret beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextInput/textInput_caret',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get textInput_caret state pages:" + JSON.stringify(pages));
        if (!("textInput_caret" == pages.name)) {
          console.info("get textInput_caret pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push textInput_caret page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textInput_caret page error:" + err);
      }
      console.info("textInput_caret beforeEach end");
    });


    
    /**
     * @tc.number   textInput_caret_static_001
     * @tc.name     textInput_caret_static_001
     * @tc.desc     textInput_caret_static_001
     * @tc.level    Level.LEVEL3
     */
    it('textInput_caret_static_001', Level.LEVEL3, async (done: ()=>void) => {

      console.info('[textInput_caret_static_001] START');
      let driver = Driver.create();
      await driver.mouseClick({x:300, y:200}, MouseButton.MOUSE_BUTTON_LEFT);
      console.info('mouse click success');
      await CommonFunc.sleep(1000);
	  await driver.triggerKey(2070);
	  await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('inputGetCaret'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('textInput_caret_static_001 click success');
      let strJson1 = inspector.getInspectorByKey('inputCaretText');
      let obj1   = JSON.parseJsonElement(strJson1);
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('5');

      console.info('[textInput_caret_static_001] END');
      done();
    });
  })
}
