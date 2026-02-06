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
import { afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index';
import { Component, Driver, MouseButton, ON, PointerMatrix } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import RectValue from '../../../ets/MainAbility/common/Rect';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test'

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function keyEventDispatchTest2() {
  describe('keyEventDispatchTest2', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.open.harmony.acetestcommenventapi15.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("keyEventDispatchTest2 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/keyEventDispatchTest/keyEventDispatchTest02",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get keyEventDispatchTest2 state pages: " + JSON.stringify(pages));
        if (!("keyEventDispatchTest02" == pages.name)) {
          console.info("get keyEventDispatchTest02 state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push keyEventDispatchTest02 page error: " + err);
        expect().assertFail();
      }
    });


    
    
/**
     * @tc.number   keyEventDispatchTest2_static_0100
     * @tc.name     keyEventDispatchTest2_static_0100
     * @tc.desc     keyEventDispatchTest2_static_0100
     * @tc.level    Level.LEVEL0
     */
it('keyEventDispatchTest2_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[keyEventDispatchTest2_static_0100] START');
      let driver = Driver.create();
      await driver.triggerKey(2049);
      await CommonFunc.sleep(2000);

      // test the  child component response
      let strJson = inspector.getInspectorByKey('childText');
      await CommonFunc.sleep(2000);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[keyEventDispatchTest2_static_0100] obj is: " + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('childResponse');

      // parent component not response
      let strJson1 = inspector.getInspectorByKey('parentText');
      await CommonFunc.sleep(2000);
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[keyEventDispatchTest2_010] obj is: " + obj1.getElement('$attrs').getString('content'));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('');

      console.info('[keyEventDispatchTest2_static_0100] END');
      done();
    });
  })
}