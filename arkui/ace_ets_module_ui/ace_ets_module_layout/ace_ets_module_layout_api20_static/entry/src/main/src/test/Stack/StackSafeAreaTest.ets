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


import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import {
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';

import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import { UtilsTest, startAbility, stopApplication } from "../Util.test"
import CommonFunc from '../../../ets/MainAbility/common/Common';
import RectValue from '../../../ets/MainAbility/common/Rect';
import Utils from '../../../ets/MainAbility/common/Utils';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function StackSafeAreaTest() {
  describe('StackSafeAreaTest', () => {
    beforeAll(() => {
      console.info("StackSafeAreaTest beforeAll start");

      await UtilsTest.startAbility("com.arkui.ace.layout.api20.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("StackSafeAreaTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Stack/StackSafeArea',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get StackSafeAreaTest state pages:" + JSON.stringify(pages));
        if (!("StackSafeAreaTest" == pages.name)) {
          console.info("get StackSafeAreaTest pages.name:" + JSON.stringify(pages.name));
          
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          
        }
      } catch (err) {
        console.error("push StackSafeAreaTest page error:" + err);
      }
      console.info("StackSafeAreaTest beforeEach end");
      
    });
    afterEach(async () => {
    });


    
/**
     * @tc.number   StackSafeAreaTest_static_0100
     * @tc.name     StackSafeAreaTest_static_0100
     * @tc.desc     StackSafeAreaTest_static_0100
     * @tc.level    Level.LEVEL1
     */
it('StackSafeAreaTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[StackSafeAreaTest_static_0100] START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);

      let stack_child_actual: RectValue = CommonFunc.getComponentRect('StackSafeArea1');
      let stack_father_actual: RectValue = CommonFunc.getComponentRect('StackSafeArea2');
      expect(stack_child_actual.top - stack_father_actual.top > 0).assertTrue();
      expect(stack_child_actual.bottom - stack_father_actual.bottom < 0).assertTrue();
      expect(stack_child_actual.left - stack_father_actual.left > 0).assertTrue();
      expect(stack_child_actual.right - stack_father_actual.right < 0).assertTrue();

      let button1 = await driver.findComponent(ON.id('SystemButton1'));
      await (button1?.click() as Promise<void>);
      await Utils.sleep(2000)
      let strJson1 = inspector.getInspectorByKey('GetSafeAreaNumber1');
      console.log('[IgnoreStackSafeAreaTest_static_0100] GetSafeAreaNumber1 is:' +
      JSON.stringify(JSON.parseJsonElement(strJson1).getElement('$attrs').getString("content")));

      let button4 = await driver.findComponent(ON.id('NullButton1'));
      await (button4?.click() as Promise<void>);
      await Utils.sleep(2000)
      let strJson4 = inspector.getInspectorByKey('GetSafeAreaNumber1');
      console.log('[IgnoreStackSafeAreaTest_static_0100] GetSafeAreaNumber4 is:' +
      JSON.stringify(JSON.parseJsonElement(strJson4).getElement('$attrs').getString("content")));

      let button5 = await driver.findComponent(ON.id('UndefinedButton1'));
      await (button5?.click() as Promise<void>);
      await Utils.sleep(2000)
      let strJson5 = inspector.getInspectorByKey('GetSafeAreaNumber1');
      console.log('[IgnoreStackSafeAreaTest_static_0100] GetSafeAreaNumber5 is:' +
      JSON.stringify(JSON.parseJsonElement(strJson5).getElement('$attrs').getString("content")));

      let button6 = await driver.findComponent(ON.id('TopButton1'));
      await (button6?.click() as Promise<void>);
      await Utils.sleep(2000)
      let strJson6 = inspector.getInspectorByKey('GetSafeAreaNumber1');
      console.log('[IgnoreStackSafeAreaTest_static_0100] GetSafeAreaNumber6 is:' +
      JSON.stringify(JSON.parseJsonElement(strJson6).getElement('$attrs').getString("content")));
      let stack_child_actual2: RectValue = CommonFunc.getComponentRect('StackSafeArea1');
      expect(stack_child_actual2.top).assertEqual(stack_father_actual.top);
      expect(stack_child_actual2.bottom - stack_father_actual.bottom < 0).assertTrue();
      expect(stack_child_actual2.left - stack_father_actual.left > 0).assertTrue();
      expect(stack_child_actual2.right - stack_father_actual.right < 0).assertTrue();
      expect(stack_child_actual2.left).assertEqual(stack_child_actual.left);
      expect(stack_child_actual2.right).assertEqual(stack_child_actual.right);
      expect(stack_child_actual2.bottom).assertEqual(stack_child_actual.bottom);

      let button7 = await driver.findComponent(ON.id('BottomButton1'));
      await (button7?.click() as Promise<void>);
      await Utils.sleep(2000)
      let strJson7 = inspector.getInspectorByKey('GetSafeAreaNumber1');
      console.log('[IgnoreStackSafeAreaTest_static_0100] GetSafeAreaNumber7 is:' +
      JSON.stringify(JSON.parseJsonElement(strJson7).getElement('$attrs').getString("content")));
      let stack_child_actual3: RectValue = CommonFunc.getComponentRect('StackSafeArea1');
      expect(stack_child_actual3.top - stack_father_actual.top > 0).assertTrue();
      expect(stack_child_actual3.bottom).assertEqual(stack_father_actual.bottom);
      expect(stack_child_actual3.left - stack_father_actual.left > 0).assertTrue();
      expect(stack_child_actual3.right - stack_father_actual.right < 0).assertTrue();
      expect(stack_child_actual3.top).assertEqual(stack_child_actual.top);
      expect(stack_child_actual3.left).assertEqual(stack_child_actual.left);
      expect(stack_child_actual3.right).assertEqual(stack_child_actual.right);

      let button8 = await driver.findComponent(ON.id('StartButton1'));
      await (button8?.click() as Promise<void>);
      await Utils.sleep(2000)
      let strJson8 = inspector.getInspectorByKey('GetSafeAreaNumber1');
      console.log('[IgnoreStackSafeAreaTest_static_0100] GetSafeAreaNumber8 is:' +
      JSON.stringify(JSON.parseJsonElement(strJson8).getElement('$attrs').getString("content")));
      let stack_child_actual4: RectValue = CommonFunc.getComponentRect('StackSafeArea1');
      expect(stack_child_actual4.top - stack_father_actual.top > 0).assertTrue();
      expect(stack_child_actual4.bottom - stack_father_actual.bottom < 0).assertTrue();
      expect(stack_child_actual4.left).assertEqual(stack_father_actual.left);
      expect(stack_child_actual4.right - stack_father_actual.right < 0).assertTrue();
      expect(stack_child_actual4.top).assertEqual(stack_child_actual.top);
      expect(stack_child_actual4.bottom).assertEqual(stack_child_actual.bottom);
      expect(stack_child_actual4.right).assertEqual(stack_child_actual.right);

      let button9 = await driver.findComponent(ON.id('EndButton1'));
      await (button9?.click() as Promise<void>);
      await Utils.sleep(2000)
      let strJson9 = inspector.getInspectorByKey('GetSafeAreaNumber1');
      console.log('[IgnoreStackSafeAreaTest_static_0100] GetSafeAreaNumber9 is:' +
      JSON.stringify(JSON.parseJsonElement(strJson9).getElement('$attrs').getString("content")));
      let stack_child_actual5: RectValue = CommonFunc.getComponentRect('StackSafeArea1');
      expect(stack_child_actual5.top - stack_father_actual.top > 0).assertTrue();
      expect(stack_child_actual5.bottom - stack_father_actual.bottom < 0).assertTrue();
      expect(stack_child_actual5.left - stack_father_actual.left > 0).assertTrue();
      expect(stack_child_actual5.right).assertEqual(stack_father_actual.right);
      expect(stack_child_actual5.top).assertEqual(stack_child_actual.top);
      expect(stack_child_actual5.bottom).assertEqual(stack_child_actual.bottom);
      expect(stack_child_actual5.left).assertEqual(stack_child_actual.left);


      let button10 = await driver.findComponent(ON.id('VerticalButton1'));
      await (button10?.click() as Promise<void>);
      await Utils.sleep(2000)
      let strJson10 = inspector.getInspectorByKey('GetSafeAreaNumber1');
      console.log('[IgnoreStackSafeAreaTest_static_0100] GetSafeAreaNumber10 is:' +
      JSON.stringify(JSON.parseJsonElement(strJson10).getElement('$attrs').getString("content")));
      let stack_child_actual6: RectValue = CommonFunc.getComponentRect('StackSafeArea1');
      expect(stack_child_actual6.top).assertEqual(stack_father_actual.top);
      expect(stack_child_actual6.bottom).assertEqual(stack_father_actual.bottom);
      expect((stack_child_actual6.left - stack_father_actual.left) > 0).assertTrue();
      expect((stack_child_actual6.right - stack_father_actual.right) < 0).assertTrue();
      expect(stack_child_actual6.left).assertEqual(stack_child_actual.left);
      expect(stack_child_actual6.right).assertEqual(stack_child_actual.right);

      let button11 = await driver.findComponent(ON.id('HorizontalButton1'));
      await (button11?.click() as Promise<void>);
      await Utils.sleep(2000)
      let strJson11 = inspector.getInspectorByKey('GetSafeAreaNumber1');
      console.log('[IgnoreStackSafeAreaTest_static_0100] GetSafeAreaNumber11 is:' +
      JSON.stringify(JSON.parseJsonElement(strJson11).getElement('$attrs').getString("content")));
      let stack_child_actual7: RectValue = CommonFunc.getComponentRect('StackSafeArea1');
      expect(stack_child_actual7.top - stack_father_actual.top > 0).assertTrue();
      expect(stack_child_actual7.bottom - stack_father_actual.bottom < 0).assertTrue();
      expect(stack_child_actual7.left).assertEqual(stack_father_actual.left);
      expect(stack_child_actual7.right).assertEqual(stack_father_actual.right);
      expect(stack_child_actual7.top).assertEqual(stack_child_actual.top);
      expect(stack_child_actual7.bottom).assertEqual(stack_child_actual.bottom);

      let button12 = await driver.findComponent(ON.id('AllButton2'));
      await (button12?.click() as Promise<void>);
      await Utils.sleep(2000)
      let strJson12 = inspector.getInspectorByKey('GetSafeAreaNumber1');
      console.log('[IgnoreStackSafeAreaTest_static_0100] GetSafeAreaNumber12 is:' +
      JSON.stringify(JSON.parseJsonElement(strJson12).getElement('$attrs').getString("content")));
      let stack_child_actual8: RectValue = CommonFunc.getComponentRect('StackSafeArea1');
      expect(stack_child_actual8.top).assertEqual(stack_father_actual.top);
      expect(stack_child_actual8.bottom).assertEqual(stack_father_actual.bottom);
      expect(stack_child_actual8.left).assertEqual(stack_father_actual.left);
      expect(stack_child_actual8.right).assertEqual(stack_father_actual.right);

      let button13 = await driver.findComponent(ON.id('NullButton2'));
      await (button13?.click() as Promise<void>);
      await Utils.sleep(2000)
      let strJson13 = inspector.getInspectorByKey('GetSafeAreaNumber1');
      console.log('[IgnoreStackSafeAreaTest_static_0100] GetSafeAreaNumber13 is:' +
      JSON.stringify(JSON.parseJsonElement(strJson13).getElement('$attrs').getString("content")));
      let stack_child_actual9: RectValue = CommonFunc.getComponentRect('StackSafeArea1');
      expect(stack_child_actual9.top).assertEqual(stack_father_actual.top);
      expect(stack_child_actual9.bottom).assertEqual(stack_father_actual.bottom);
      expect(stack_child_actual9.left).assertEqual(stack_father_actual.left);
      expect(stack_child_actual9.right).assertEqual(stack_father_actual.right);

      let button14 = await driver.findComponent(ON.id('UndefinedButton2'));
      await (button14?.click() as Promise<void>);
      await Utils.sleep(2000)
      let strJson14 = inspector.getInspectorByKey('GetSafeAreaNumber1');
      console.log('[IgnoreStackSafeAreaTest_static_0100] GetSafeAreaNumber14 is:' +
      JSON.stringify(JSON.parseJsonElement(strJson14).getElement('$attrs').getString("content")));
      let stack_child_actual10: RectValue = CommonFunc.getComponentRect('StackSafeArea1');
      expect(stack_child_actual10.top).assertEqual(stack_father_actual.top);
      expect(stack_child_actual10.bottom).assertEqual(stack_father_actual.bottom);
      expect(stack_child_actual10.left).assertEqual(stack_father_actual.left);
      expect(stack_child_actual10.right).assertEqual(stack_father_actual.right);

      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString("content")).assertEqual('0');
      expect(JSON.parseJsonElement(strJson4).getElement('$attrs').getString("content")).assertEqual('null');
      expect(JSON.parseJsonElement(strJson5).getElement('$attrs').getString("content")).assertEqual('undefined');
      expect(JSON.parseJsonElement(strJson6).getElement('$attrs').getString("content")).assertEqual('0');
      expect(JSON.parseJsonElement(strJson7).getElement('$attrs').getString("content")).assertEqual('1');
      expect(JSON.parseJsonElement(strJson8).getElement('$attrs').getString("content")).assertEqual('2');
      expect(JSON.parseJsonElement(strJson9).getElement('$attrs').getString("content")).assertEqual('3');
      expect(JSON.parseJsonElement(strJson10).getElement('$attrs').getString("content")).assertEqual('4');
      expect(JSON.parseJsonElement(strJson11).getElement('$attrs').getString("content")).assertEqual('5');
      expect(JSON.parseJsonElement(strJson12).getElement('$attrs').getString("content")).assertEqual('6');
      expect(JSON.parseJsonElement(strJson13).getElement('$attrs').getString("content")).assertEqual('null');
      expect(JSON.parseJsonElement(strJson14).getElement('$attrs').getString("content")).assertEqual('undefined');

      console.info('[StackSafeAreaTest_static_0100] END');
      done();
    });

  })
}