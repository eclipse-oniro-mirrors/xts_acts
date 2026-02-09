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
import { KeyCode } from '@ohos.multimodalInput.keyCode'
import { describe, beforeAll, beforeEach, afterEach, it, expect, Level } from '../../../../hypium/index';
import { Driver, ON, Component, PointerMatrix, MouseButton } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import RectValue from '../../../ets/MainAbility/common/Rect';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

import { Driver, ON } from '@ohos.UiTest';
import {UtilsTest} from '../Util.test'
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function onKeyEventDispatchTest3() {
  describe('onKeyEventDispatchTest3', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.open.harmony.acetestcommenventapi15.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("onKeyEventDispatchTest3 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/keyEventDispatchTest/onkeyEventDispatch03",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get onKeyEventDispatchTest3 state pages: " + JSON.stringify(pages));
        if (!("onkeyEventDispatch03" == pages.name)) {
          console.info("get onkeyEventDispatchTest03 state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push onkeyEventDispatchTest03 page error: " + err);
        expect().assertFail();
      }
    });

    
    
    
/**
     * @tc.number   onKeyEventDispatchTest3_static_0100
     * @tc.name     onKeyEventDispatchTest3_static_0100
     * @tc.desc     onKeyEventDispatchTest3_static_0100
     * @tc.level    Level.LEVEL0
     */
it('onKeyEventDispatchTest3_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[onKeyEventDispatchTest3_static_0100] START');
      let driver = Driver.create();
      await driver.triggerKey(2049);
      await CommonFunc.sleep(1500);
      // test ctrl & alt & shift
      await driver.triggerCombineKeys(KeyCode.KEYCODE_CTRL_LEFT, KeyCode.KEYCODE_ALT_LEFT, KeyCode.KEYCODE_SHIFT_LEFT)
      await CommonFunc.sleep(1500);

      let strJson = inspector.getInspectorByKey('modifierStatePress');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[onKeyEventDispatchTest3_static_0100] obj is: " + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('ctrl & alt & shift  is press');

      // test ctrl & shift
      await driver.triggerCombineKeys(KeyCode.KEYCODE_SHIFT_LEFT, KeyCode.KEYCODE_CTRL_LEFT)
      await CommonFunc.sleep(1500);
      let strJson3 = inspector.getInspectorByKey('modifierStatePress');
      let obj3 = JSON.parseJsonElement(strJson3);
      console.info("[onKeyEventDispatchTest3_static_0100] obj is: " + obj3.getElement('$attrs').getString('content'));
      expect(obj3.getElement('$attrs').getString('content')).assertEqual('ctrl & shift  is press');

      // test ctrl & alt
      await driver.triggerCombineKeys(KeyCode.KEYCODE_ALT_LEFT, KeyCode.KEYCODE_CTRL_LEFT)
      await CommonFunc.sleep(1500);
      let strJson4 = inspector.getInspectorByKey('modifierStatePress');
      let obj4 = JSON.parseJsonElement(strJson4);
      console.info("[onKeyEventDispatchTest3_static_0100] obj is: " + obj4.getElement('$attrs').getString('content'));
      expect(obj4.getElement('$attrs').getString('content')).assertEqual('ctrl & alt  is press');

      // test alt & shift
      await driver.triggerCombineKeys(KeyCode.KEYCODE_ALT_LEFT, KeyCode.KEYCODE_SHIFT_LEFT)
      await CommonFunc.sleep(1500);
      let strJson6 = inspector.getInspectorByKey('modifierStatePress');
      let obj6 = JSON.parseJsonElement(strJson6);
      console.info("[onKeyEventDispatchTest3_static_0100] obj is: " + obj6.getElement('$attrs').getString('content'));
      expect(obj6.getElement('$attrs').getString('content')).assertEqual('alt & shift  is press');

      //  test ctrl
      await driver.triggerKey(KeyCode.KEYCODE_CTRL_LEFT)
      await CommonFunc.sleep(1500);
      let strJson8 = inspector.getInspectorByKey('modifierStatePress');
      let obj8 = JSON.parseJsonElement(strJson8);
      console.info("[onKeyEventDispatchTest3_static_0100] obj is: " + obj8.getElement('$attrs').getString('content'));
      expect(obj8.getElement('$attrs').getString('content')).assertEqual('ctrl is press');

      //  test alt
      await driver.triggerKey(KeyCode.KEYCODE_ALT_LEFT)
      await CommonFunc.sleep(1500);
      let strJson9 = inspector.getInspectorByKey('modifierStatePress');
      let obj9 = JSON.parseJsonElement(strJson9);
      console.info("[onKeyEventDispatchTest3_static_0100] obj is: " + obj9.getElement('$attrs').getString('content'));
      expect(obj9.getElement('$attrs').getString('content')).assertEqual('alt is press');

      //  test shift
      await driver.triggerKey(KeyCode.KEYCODE_SHIFT_LEFT)
      await CommonFunc.sleep(1500);
      let strJson10 = inspector.getInspectorByKey('modifierStatePress');
      let obj10 = JSON.parseJsonElement(strJson10);
      console.info("[onKeyEventDispatchTest3_static_0100] obj is: " + obj10.getElement('$attrs').getString('content'));
      expect(obj10.getElement('$attrs').getString('content')).assertEqual('shift is press');

      console.info('[onKeyEventDispatchTest3_static_0100] END');

      done();
    });
  })
}