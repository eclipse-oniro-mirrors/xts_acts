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

export default function keyEventDispatchTest() {
  describe('keyEventDispatchTest', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.open.harmony.acetestcommenventapi15.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("keyEventDispatchTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/keyEventDispatchTest/keyEventDispatchTest01",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get keyEventDispatchTest state pages: " + JSON.stringify(pages));
        if (!("keyEventDispatchTest01" == pages.name)) {
          console.info("get keyEventDispatchTest01 state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push keyEventDispatchTest page error: " + err);
        expect().assertFail();
      }
    });


    
    
/**
     * @tc.number   keyEventDispatchTest_static_0100
     * @tc.name     keyEventDispatchTest_static_0100
     * @tc.desc     keyEventDispatchTest_static_0100
     * @tc.level    Level.LEVEL0
     */
it('keyEventDispatchTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[keyEventDispatchTest_static_0100] START');
      let driver = Driver.create();
      await driver.triggerKey(2049);
      await CommonFunc.sleep(2000);
      // test the  keyEvent.type
      let strJson = inspector.getInspectorByKey('keyEvent0');
      await CommonFunc.sleep(2000);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[keyEventDispatchTest_static_0100] obj is: " + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('0');
      let strJson1 = inspector.getInspectorByKey('keyEvent1');
      await CommonFunc.sleep(2000);
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[keyEventDispatchTest_static_0100] obj is: " + obj1.getElement('$attrs').getString('content'));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('1');

      // test the keyCode
      let strJson2 = inspector.getInspectorByKey('keyEvent2');
      await CommonFunc.sleep(2000);
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[keyEventDispatchTest_static_0100] obj is: " + obj2.getElement('$attrs').getString('content'));
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('2049');

      // test key source
      let strJson3 = inspector.getInspectorByKey('keyEvent3');
      await CommonFunc.sleep(2000);
      let obj3 = JSON.parseJsonElement(strJson3);
      console.info("[keyEventDispatchTest_static_0100] obj is: " + obj3.getElement('$attrs').getString('content'));
      expect(obj3.getElement('$attrs').getString('content')).assertEqual('4');

      // test keyText
      let strJson5 = inspector.getInspectorByKey('keyEvent5');
      await CommonFunc.sleep(2000);
      let obj5 = JSON.parseJsonElement(strJson5);
      console.info("[keyEventDispatchTest_0500] obj is: " + obj5.getElement('$attrs').getString('content'));
      expect(obj5.getElement('$attrs').getString('content')).assertEqual("KEYCODE_TAB");

      // test metaKey
      let strJson6 = inspector.getInspectorByKey('keyEvent6');
      await CommonFunc.sleep(2000);
      let obj6 = JSON.parseJsonElement(strJson6);
      console.info("[keyEventDispatchTest_0600] obj is: " + obj6.getElement('$attrs').getString('content'));
      expect(obj6.getElement('$attrs').getString('content')).assertEqual("0");

      // test timestamp
      let strJson7 = inspector.getInspectorByKey('keyEvent7');
      await CommonFunc.sleep(2000);
      let obj7 = JSON.parseJsonElement(strJson7);
      console.info("[keyEventDispatchTest_0700] obj is: " + obj7.getElement('$attrs').getString('content'));
      expect(Number(obj7.getElement('$attrs').getString('content')) > 0).assertTrue();

      // test intentionCode
      let strJson8 = inspector.getInspectorByKey('keyEvent8');
      await CommonFunc.sleep(2000);
      let obj8 = JSON.parseJsonElement(strJson8);
      console.info("[keyEventDispatchTest_0800] obj is: " + obj8.getElement('$attrs').getString('content'));
      expect(obj8.getElement('$attrs').getString('content')).assertEqual("-1");

      console.info('[keyEventDispatchTest_static_0100] END');
      done();
    });
  })
}