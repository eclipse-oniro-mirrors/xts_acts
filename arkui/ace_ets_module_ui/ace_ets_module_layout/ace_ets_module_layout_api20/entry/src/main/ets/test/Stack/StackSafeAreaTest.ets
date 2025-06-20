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

import CommonFunc, { RectValue } from '../../MainAbility/common/Common';
import Utils from '../../MainAbility/common/Utils';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function StackSafeAreaTest() {
  describe('StackSafeAreaTest', () => {
    beforeEach(async (done: Function) => {
      console.info("StackSafeAreaTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Stack/StackSafeArea',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get StackSafeAreaTest state pages:" + JSON.stringify(pages));
        if (!("StackSafeAreaTest" == pages.name)) {
          console.info("get StackSafeAreaTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push StackSafeAreaTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push StackSafeAreaTest page error:" + err);
      }
      console.info("StackSafeAreaTest beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    
     it('StackSafeAreaTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[StackSafeAreaTest_0100] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let stack_child_actual: RectValue = CommonFunc.getComponentRect('StackSafeArea1');
      let stack_father_actual: RectValue = CommonFunc.getComponentRect('StackSafeArea2');
      expect(stack_child_actual.top - stack_father_actual.top> 0).assertTrue();
      expect(stack_child_actual.bottom - stack_father_actual.bottom < 0).assertTrue();
      expect(stack_child_actual.left - stack_father_actual.left > 0).assertTrue();
      expect(stack_child_actual.right - stack_father_actual.right < 0).assertTrue();

      let button1 = await driver.findComponent(ON.id('SystemButton1'));
      await button1.click();
      await Utils.sleep(2000)
      let strJson1 = getInspectorByKey('GetSafeAreaNumber1');
      console.log('[IgnoreStackSafeAreaTest_0100] GetSafeAreaNumber1 is:' + JSON.stringify(JSON.parse(strJson1).$attrs.content));

      let button4 = await driver.findComponent(ON.id('NullButton1'));
      await button4.click();
      await Utils.sleep(2000)
      let strJson4 = getInspectorByKey('GetSafeAreaNumber1');
      console.log('[IgnoreStackSafeAreaTest_0100] GetSafeAreaNumber4 is:' + JSON.stringify(JSON.parse(strJson4).$attrs.content));

      let button5 = await driver.findComponent(ON.id('UndefinedButton1'));
      await button5.click();
      await Utils.sleep(2000)
      let strJson5 = getInspectorByKey('GetSafeAreaNumber1');
      console.log('[IgnoreStackSafeAreaTest_0100] GetSafeAreaNumber5 is:' + JSON.stringify(JSON.parse(strJson5).$attrs.content));

      let button6 = await driver.findComponent(ON.id('TopButton1'));
      await button6.click();
      await Utils.sleep(2000)
      let strJson6 = getInspectorByKey('GetSafeAreaNumber1');
      console.log('[IgnoreStackSafeAreaTest_0100] GetSafeAreaNumber6 is:' + JSON.stringify(JSON.parse(strJson6).$attrs.content));
      let stack_child_actual2: RectValue = CommonFunc.getComponentRect('StackSafeArea1');
      expect(stack_child_actual2.top).assertEqual(stack_father_actual.top);
      expect(stack_child_actual2.bottom - stack_father_actual.bottom < 0).assertTrue();
      expect(stack_child_actual2.left - stack_father_actual.left > 0).assertTrue();
      expect(stack_child_actual2.right - stack_father_actual.right < 0).assertTrue();
      expect(stack_child_actual2.left).assertEqual(stack_child_actual.left);
      expect(stack_child_actual2.right).assertEqual(stack_child_actual.right);
      expect(stack_child_actual2.bottom).assertEqual(stack_child_actual.bottom);

      let button7 = await driver.findComponent(ON.id('BottomButton1'));
      await button7.click();
      await Utils.sleep(2000)
      let strJson7 = getInspectorByKey('GetSafeAreaNumber1');
      console.log('[IgnoreStackSafeAreaTest_0100] GetSafeAreaNumber7 is:' + JSON.stringify(JSON.parse(strJson7).$attrs.content));
      let stack_child_actual3: RectValue = CommonFunc.getComponentRect('StackSafeArea1');
      expect(stack_child_actual3.top - stack_father_actual.top > 0).assertTrue();
      expect(stack_child_actual3.bottom).assertEqual(stack_father_actual.bottom);
      expect(stack_child_actual3.left - stack_father_actual.left > 0).assertTrue();
      expect(stack_child_actual3.right - stack_father_actual.right < 0).assertTrue();
      expect(stack_child_actual3.top).assertEqual(stack_child_actual.top);
      expect(stack_child_actual3.left).assertEqual(stack_child_actual.left);
      expect(stack_child_actual3.right).assertEqual(stack_child_actual.right);

      let button8 = await driver.findComponent(ON.id('StartButton1'));
      await button8.click();
      await Utils.sleep(2000)
      let strJson8 = getInspectorByKey('GetSafeAreaNumber1');
      console.log('[IgnoreStackSafeAreaTest_0100] GetSafeAreaNumber8 is:' + JSON.stringify(JSON.parse(strJson8).$attrs.content));
      let stack_child_actual4: RectValue = CommonFunc.getComponentRect('StackSafeArea1');
      expect(stack_child_actual4.top - stack_father_actual.top > 0).assertTrue();
      expect(stack_child_actual4.bottom - stack_father_actual.bottom < 0).assertTrue();
      expect(stack_child_actual4.left).assertEqual(stack_father_actual.left);
      expect(stack_child_actual4.right - stack_father_actual.right < 0).assertTrue();
      expect(stack_child_actual4.top).assertEqual(stack_child_actual.top);
      expect(stack_child_actual4.bottom).assertEqual(stack_child_actual.bottom);
      expect(stack_child_actual4.right).assertEqual(stack_child_actual.right);
     
      let button9 = await driver.findComponent(ON.id('EndButton1'));
      await button9.click();
      await Utils.sleep(2000)
      let strJson9 = getInspectorByKey('GetSafeAreaNumber1');
      console.log('[IgnoreStackSafeAreaTest_0100] GetSafeAreaNumber9 is:' + JSON.stringify(JSON.parse(strJson9).$attrs.content));
      let stack_child_actual5: RectValue = CommonFunc.getComponentRect('StackSafeArea1');
      expect(stack_child_actual5.top - stack_father_actual.top > 0).assertTrue();
      expect(stack_child_actual5.bottom - stack_father_actual.bottom < 0).assertTrue();
      expect(stack_child_actual5.left - stack_father_actual.left > 0).assertTrue();
      expect(stack_child_actual5.right).assertEqual(stack_father_actual.right);
      expect(stack_child_actual5.top).assertEqual(stack_child_actual.top);
      expect(stack_child_actual5.bottom).assertEqual(stack_child_actual.bottom);
      expect(stack_child_actual5.left).assertEqual(stack_child_actual.left);
    

      let button10 = await driver.findComponent(ON.id('VerticalButton1'));
      await button10.click();
      await Utils.sleep(2000)
      let strJson10 = getInspectorByKey('GetSafeAreaNumber1');
      console.log('[IgnoreStackSafeAreaTest_0100] GetSafeAreaNumber10 is:' + JSON.stringify(JSON.parse(strJson10).$attrs.content));
      let stack_child_actual6: RectValue = CommonFunc.getComponentRect('StackSafeArea1');
      expect(stack_child_actual6.top).assertEqual(stack_father_actual.top);
      expect(stack_child_actual6.bottom).assertEqual(stack_father_actual.bottom);
      expect((stack_child_actual6.left - stack_father_actual.left) > 0).assertTrue();
      expect((stack_child_actual6.right - stack_father_actual.right) < 0).assertTrue();
      expect(stack_child_actual6.left).assertEqual(stack_child_actual.left);
      expect(stack_child_actual6.right).assertEqual(stack_child_actual.right);
    
      let button11 = await driver.findComponent(ON.id('HorizontalButton1'));
      await button11.click();
      await Utils.sleep(2000)
      let strJson11 = getInspectorByKey('GetSafeAreaNumber1');
      console.log('[IgnoreStackSafeAreaTest_0100] GetSafeAreaNumber11 is:' + JSON.stringify(JSON.parse(strJson11).$attrs.content));
      let stack_child_actual7: RectValue = CommonFunc.getComponentRect('StackSafeArea1');
      expect(stack_child_actual7.top - stack_father_actual.top > 0).assertTrue();
      expect(stack_child_actual7.bottom - stack_father_actual.bottom < 0).assertTrue();
      expect(stack_child_actual7.left).assertEqual(stack_father_actual.left);
      expect(stack_child_actual7.right).assertEqual(stack_father_actual.right);
      expect(stack_child_actual7.top).assertEqual(stack_child_actual.top);
      expect(stack_child_actual7.bottom).assertEqual(stack_child_actual.bottom);
  
      let button12 = await driver.findComponent(ON.id('AllButton2'));
      await button12.click();
      await Utils.sleep(2000)
      let strJson12 = getInspectorByKey('GetSafeAreaNumber1');
      console.log('[IgnoreStackSafeAreaTest_0100] GetSafeAreaNumber12 is:' + JSON.stringify(JSON.parse(strJson12).$attrs.content));
      let stack_child_actual8: RectValue = CommonFunc.getComponentRect('StackSafeArea1');
      expect(stack_child_actual8.top).assertEqual(stack_father_actual.top);
      expect(stack_child_actual8.bottom).assertEqual(stack_father_actual.bottom);
      expect(stack_child_actual8.left).assertEqual(stack_father_actual.left);
      expect(stack_child_actual8.right).assertEqual(stack_father_actual.right);

      let button13 = await driver.findComponent(ON.id('NullButton2'));
      await button13.click();
      await Utils.sleep(2000)
      let strJson13 = getInspectorByKey('GetSafeAreaNumber1');
      console.log('[IgnoreStackSafeAreaTest_0100] GetSafeAreaNumber13 is:' + JSON.stringify(JSON.parse(strJson13).$attrs.content));
      let stack_child_actual9: RectValue = CommonFunc.getComponentRect('StackSafeArea1');
      expect(stack_child_actual9.top).assertEqual(stack_father_actual.top);
      expect(stack_child_actual9.bottom).assertEqual(stack_father_actual.bottom);
      expect(stack_child_actual9.left).assertEqual(stack_father_actual.left);
      expect(stack_child_actual9.right).assertEqual(stack_father_actual.right);

      let button14 = await driver.findComponent(ON.id('UndefinedButton2'));
      await button14.click();
      await Utils.sleep(2000)
      let strJson14 = getInspectorByKey('GetSafeAreaNumber1');
      console.log('[IgnoreStackSafeAreaTest_0100] GetSafeAreaNumber14 is:' + JSON.stringify(JSON.parse(strJson14).$attrs.content));
      let stack_child_actual10: RectValue = CommonFunc.getComponentRect('StackSafeArea1');
      expect(stack_child_actual10.top).assertEqual(stack_father_actual.top);
      expect(stack_child_actual10.bottom).assertEqual(stack_father_actual.bottom);
      expect(stack_child_actual10.left).assertEqual(stack_father_actual.left);
      expect(stack_child_actual10.right).assertEqual(stack_father_actual.right);

      expect(JSON.parse(strJson1).$attrs.content).assertEqual('0');
      expect(JSON.parse(strJson4).$attrs.content).assertEqual('null');
      expect(JSON.parse(strJson5).$attrs.content).assertEqual('undefined');
      expect(JSON.parse(strJson6).$attrs.content).assertEqual('0');
      expect(JSON.parse(strJson7).$attrs.content).assertEqual('1');
      expect(JSON.parse(strJson8).$attrs.content).assertEqual('2');
      expect(JSON.parse(strJson9).$attrs.content).assertEqual('3');
      expect(JSON.parse(strJson10).$attrs.content).assertEqual('4');
      expect(JSON.parse(strJson11).$attrs.content).assertEqual('5');
      expect(JSON.parse(strJson12).$attrs.content).assertEqual('6');
      expect(JSON.parse(strJson13).$attrs.content).assertEqual('null');
      expect(JSON.parse(strJson14).$attrs.content).assertEqual('undefined');
      
      console.info('[StackSafeAreaTest_0100] END');
      done();
    });
  
  })
}