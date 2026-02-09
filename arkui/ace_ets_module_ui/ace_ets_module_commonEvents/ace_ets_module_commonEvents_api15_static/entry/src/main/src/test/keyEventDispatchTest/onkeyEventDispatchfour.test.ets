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

export default function onkeyEventDispatchTest4() {
  describe('onkeyEventDispatchTest4', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.open.harmony.acetestcommenventapi15.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("onkeyEventDispatchTest4 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/keyEventDispatchTest/onkeyEventDispatch04",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get onkeyEventDispatchTest4 state pages: " + JSON.stringify(pages));
        if (!("nkeyEventDispatch04" == pages.name)) {
          console.info("get keyEventDispatchTest04 state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          // let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push keyEventDispatchTest04 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push keyEventDispatchTest04 page error: " + err);
        expect().assertFail();
      }
    });

    
    
    
/**
     * @tc.number   onkeyEventDispatchTest4_static_0100
     * @tc.name     onkeyEventDispatchTest4_static_0100
     * @tc.desc     onkeyEventDispatchTest4_static_0100
     * @tc.level    Level.LEVEL0
     */
it('onkeyEventDispatchTest4_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[onkeyEventDispatchTest4_static_0100] START');
      let driver = Driver.create();
      await driver.triggerKey(2049);
      await CommonFunc.sleep(2000);

      // test the child component response
      let strJson = inspector.getInspectorByKey('tabChild');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[onkeyEventDispatchTest4_static_0100] obj is: " + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('');

      // parent component response
      let strJson1 = inspector.getInspectorByKey('tabParent');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[onkeyEventDispatchTest4_010] obj is: " + obj1.getElement('$attrs').getString('content'));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('parentTab');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(2000);

      // tab key focus
      let strJson2 = inspector.getInspectorByKey('tabChild');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[onkeyEventDispatchTest4_static_0100] obj is: " + obj1.getElement('$attrs').getString('content'));
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('');

      console.info('[onkeyEventDispatchTest4_static_0100] END');
      done();
    });
  })
}