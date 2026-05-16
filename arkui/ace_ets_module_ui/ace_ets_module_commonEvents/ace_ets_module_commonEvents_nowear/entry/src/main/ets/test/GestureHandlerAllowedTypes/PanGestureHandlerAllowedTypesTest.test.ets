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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
import {UiComponent,MouseButton, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function PanGestureHandlerAllowedTypesTest() {
  describe('PanGestureHandlerAllowedTypesTest', () => {
    beforeEach(async (done: Function) => {
      console.info("PanGestureAllowedTypesTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/GestureHandlerAllowedTypes/PanGestureHandlerAllowedTypes',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get PanGestureHandlerAllowedTypesTest state pages:" + JSON.stringify(pages));
        if (!("PanGestureHandlerAllowedTypes" == pages.name)) {
          console.info("get PanGestureHandlerAllowedTypesTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push PanGestureHandlerAllowedTypesTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push PanGestureHandlerAllowedTypesTest page error:" + err);
      }
      console.info("PanGestureHandlerAllowedTypesTest beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("PanGestureHandlerAllowedTypesTest after each called");
    });

    /**
     * @tc.name   PanGestureHandlerAllowedTypesTest_0010
     * @tc.number PanGestureHandlerAllowedTypesTest_0010
     * @tc.desc   allowedTypes api test for PanGesture, will do the following test scenarios:
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PanGestureHandlerAllowedTypesTest_0010', Level.LEVEL0, async (done: Function) => {
      console.info('PanGestureHandlerAllowedTypesTest_0010 START');
      await CommonFunc.sleep(1000);
      let windowOffsetX:number = globalThis.winLeft
      let windowOffsetY:number = globalThis.winTop
      console.log('PanGestureHandlerAllowedTypesTest_0010 windowOffsetX and windowOffsetY',windowOffsetX, windowOffsetY)
      let areaObj1 = CommonFunc.getComponentRectOnScreen('PanGestureHandlerAllowedTypes_Text');
      let areaHeight1 = areaObj1.bottom - areaObj1.top
      let areaWidth1 = areaObj1.right - areaObj1.left
      console.log('PanGestureHandlerAllowedTypesTest_0010 areaObj1',areaObj1.left,areaObj1.top,areaObj1.right,areaObj1.bottom)
      console.log('PanGestureHandlerAllowedTypesTest_0010 areaObj1 clicked start',Math.round(areaObj1.left + areaWidth1 * 0.2),Math.round(areaObj1.top + areaHeight1/2))
      console.log('PanGestureHandlerAllowedTypesTest_0010 areaObj1 clicked end',Math.round(areaObj1.left + areaWidth1 * 0.8),Math.round(areaObj1.top + areaHeight1/2))

      // trigger gesture with finger
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      await driver.swipe(Math.round(areaObj1.left + areaWidth1 * 0.2),Math.round(areaObj1.top + areaHeight1/2),Math.round(areaObj1.left + areaWidth1 * 0.8),Math.round(areaObj1.top + areaHeight1/2))
      await CommonFunc.sleep(3000);
      let text1 = getInspectorByKey('PanGestureHandlerAllowedTypes_result');
      let obj1: ESObject = JSON.parse(text1);
      console.log('PanGestureHandlerAllowedTypesTest_0010 obj1 $attrs content',obj1.$attrs.content,obj1)
      expect(obj1.$attrs.content).assertEqual('allowed types success');

      // trigger gesture with mouse
      await CommonFunc.sleep(1000);
      await driver.mouseDrag({x: Math.round(areaObj1.left + areaWidth1 * 0.2),y: Math.round(areaObj1.top + areaHeight1/2)}, {x: Math.round(areaObj1.left + areaWidth1 * 0.8), y: Math.round(areaObj1.top + areaHeight1/2)})
      await CommonFunc.sleep(3000);
      let text2 = getInspectorByKey('PanGestureHandlerAllowedTypes_result');
      let obj2: ESObject = JSON.parse(text2);
      console.log('PanGestureHandlerAllowedTypesTest_0010 obj2 $attrs content',obj2.$attrs.content,obj2)
      expect(obj2.$attrs.content).assertEqual('allowed types success');

      // click button to change types to [SourceTool.MOUSE]
      let button1 = await driver.findComponent(ON.id('Mouse_Type'));
      await button1.click();
      await CommonFunc.sleep(3000);
      let text3 = getInspectorByKey('PanGestureHandlerAllowedTypes_result');
      let obj3: ESObject = JSON.parse(text3);
      console.log('PanGestureHandlerAllowedTypesTest_0010 obj3 $attrs content',obj3.$attrs.content,obj3)
      expect(obj3.$attrs.content).assertEqual('allowed types default');

      // trigger gesture again with finger
      await CommonFunc.sleep(1000);
      await driver.swipe(Math.round(areaObj1.left + areaWidth1 * 0.2),Math.round(areaObj1.top + areaHeight1/2),Math.round(areaObj1.left + areaWidth1 * 0.8),Math.round(areaObj1.top + areaHeight1/2))
      await CommonFunc.sleep(3000);
      let text4 = getInspectorByKey('PanGestureHandlerAllowedTypes_result');
      let obj4: ESObject = JSON.parse(text4);
      console.log('PanGestureHandlerAllowedTypesTest_0010 obj4 $attrs content',obj4.$attrs.content,obj4)
      expect(obj4.$attrs.content).assertEqual('allowed types default');

      // trigger gesture again with mouse
      await CommonFunc.sleep(1000);
      await driver.mouseDrag({x: Math.round(areaObj1.left + areaWidth1 * 0.2),y: Math.round(areaObj1.top + areaHeight1/2)}, {x: Math.round(areaObj1.left + areaWidth1 * 0.8), y: Math.round(areaObj1.top + areaHeight1/2)})
      await CommonFunc.sleep(3000);
      let text5 = getInspectorByKey('PanGestureHandlerAllowedTypes_result');
      let obj5: ESObject = JSON.parse(text5);
      console.log('PanGestureHandlerAllowedTypesTest_0010 obj5 $attrs content',obj5.$attrs.content,obj5)
      expect(obj5.$attrs.content).assertEqual('allowed types success');

      // click button to change types to [SourceTool.Finger]
      let button2 = await driver.findComponent(ON.id('Finger_Type'));
      await button2.click();
      await CommonFunc.sleep(3000);
      let text6 = getInspectorByKey('PanGestureHandlerAllowedTypes_result');
      let obj6: ESObject = JSON.parse(text6);
      console.log('PanGestureHandlerAllowedTypesTest_0010 obj6 $attrs content',obj6.$attrs.content,obj6)
      expect(obj6.$attrs.content).assertEqual('allowed types default');

      // trigger gesture again with mouse
      await CommonFunc.sleep(1000);
      await driver.mouseDrag({x: Math.round(areaObj1.left + areaWidth1 * 0.2),y: Math.round(areaObj1.top + areaHeight1/2)}, {x: Math.round(areaObj1.left + areaWidth1 * 0.8), y: Math.round(areaObj1.top + areaHeight1/2)})
      await CommonFunc.sleep(3000);
      let text7 = getInspectorByKey('PanGestureHandlerAllowedTypes_result');
      let obj7: ESObject = JSON.parse(text7);
      console.log('PanGestureHandlerAllowedTypesTest_0010 obj7 $attrs content',obj7.$attrs.content,obj7)
      expect(obj7.$attrs.content).assertEqual('allowed types default');

      // trigger gesture again with finger
      await CommonFunc.sleep(1000);
      await driver.swipe(Math.round(areaObj1.left + areaWidth1 * 0.2),Math.round(areaObj1.top + areaHeight1/2),Math.round(areaObj1.left + areaWidth1 * 0.8),Math.round(areaObj1.top + areaHeight1/2))
      await CommonFunc.sleep(3000);
      let text8 = getInspectorByKey('PanGestureHandlerAllowedTypes_result');
      let obj8: ESObject = JSON.parse(text8);
      console.log('PanGestureHandlerAllowedTypesTest_0010 obj8 $attrs content',obj8.$attrs.content,obj8)
      expect(obj8.$attrs.content).assertEqual('allowed types success');
      
      // change types to invalid types
      await CommonFunc.sleep(1000);
      let button3 = await driver.findComponent(ON.id('Invalid_type'));
      await button3.click();
      await CommonFunc.sleep(3000);
      let text9 = getInspectorByKey('PanGestureHandlerAllowedTypes_result');
      let obj9: ESObject = JSON.parse(text9);
      console.log('PanGestureHandlerAllowedTypesTest_0010 obj9 $attrs content',obj9.$attrs.content,obj9)
      expect(obj9.$attrs.content).assertEqual('allowed types default');

      // trigger gesture again with finger
      await CommonFunc.sleep(1000);
      await driver.swipe(Math.round(areaObj1.left + areaWidth1 * 0.2),Math.round(areaObj1.top + areaHeight1/2),Math.round(areaObj1.left + areaWidth1 * 0.8),Math.round(areaObj1.top + areaHeight1/2))
      await CommonFunc.sleep(3000);
      let text10 = getInspectorByKey('PanGestureHandlerAllowedTypes_result');
      let obj10: ESObject = JSON.parse(text10);
      console.log('PanGestureHandlerAllowedTypesTest_0010 obj10 $attrs content',obj10.$attrs.content,obj10)
      expect(obj10.$attrs.content).assertEqual('allowed types success');
      
      console.info('PanGestureHandlerAllowedTypesTest_0010 END');
      done();
    });
  })
}