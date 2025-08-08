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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
import {PointerMatrix, UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode} from '@ohos.UiTest';

export default function RotationGestureHandlerAllowedTypesTest() {
  describe('RotationGestureHandlerAllowedTypesTest', () => {
    beforeEach(async (done: Function) => {
      console.info("RotationGestureHandlerAllowedTypesTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/GestureHandlerAllowedTypes/RotationGestureHandlerAllowedTypes',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RotationGestureHandlerAllowedTypesTest state pages:" + JSON.stringify(pages));
        if (!("RotationGestureHandlerAllowedTypes" == pages.name)) {
          console.info("get RotationGestureHandlerAllowedTypesTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push RotationGestureHandlerAllowedTypesTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RotationGestureHandlerAllowedTypesTest page error:" + err);
      }
      console.info("RotationGestureHandlerAllowedTypesTest beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("RotationGestureHandlerAllowedTypesTest after each called");
    });

    /**
     * @tc.number
     * @tc.name      RotationGestureHandlerAllowedTypesTest_0010
     * @tc.desc      allowedTypes api test for RotationGesture, will do the following test scenarios:
     *               1、try to trigger LongPressGesture with Mouse and Finger with allowedTypes setting to [], which is default setting.
     *               2、press button to change allowedTypes to [SourceTool.Mouse] and try to trigger the gesture again with Mouse and Finger
     *               3、press button to change allowedTypes to [SourceTool.Finger] and try to trigger the gesture again with Mouse and Finger
     *               4、press button to change allowedTypes to invalid values, [null, undefined], and try to trigger the gesture again
     * @tc.level:    Level
     * @tc.type :
     * @tc.size :
     */
    it('RotationGestureHandlerAllowedTypesTest_0010', Level.LEVEL0, async (done: Function) => {
      console.info('RotationGestureHandlerAllowedTypesTest_0010 START');
      await CommonFunc.sleep(1000);
      let windowOffsetX:number = globalThis.winLeft
      let windowOffsetY:number = globalThis.winTop
      console.log('RotationGestureHandlerAllowedTypesTest_0010 windowOffsetX and windowOffsetY',windowOffsetX, windowOffsetY)
      let areaObj1 = CommonFunc.getComponentRectOnScreen('RotationGestureHandlerAllowedTypes_Text');
      let areaHeight1 = areaObj1.bottom - areaObj1.top
      let areaWidth1 = areaObj1.right - areaObj1.left
      console.log('RotationGestureHandlerAllowedTypesTest_0010 areaObj1 start',areaObj1.left,areaObj1.top,areaObj1.right,areaObj1.bottom)
      console.log('RotationGestureHandlerAllowedTypesTest_0010 areaObj1 clicked finger[0] start',Math.round(areaObj1.left),Math.round(areaObj1.top))
      console.log('RotationGestureHandlerAllowedTypesTest_0010 areaObj1 clicked finger[0] end',Math.round(areaObj1.right),Math.round(areaObj1.top))
      console.log('RotationGestureHandlerAllowedTypesTest_0010 areaObj1 clicked finger[1] start',Math.round(areaObj1.right),Math.round(areaObj1.bottom))
      console.log('RotationGestureHandlerAllowedTypesTest_0010 areaObj1 clicked finger[1] end',Math.round(areaObj1.left),Math.round(areaObj1.bottom))
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let pointers: PointerMatrix = PointerMatrix.create(2,2);
      pointers.setPoint(0,0,{x: Math.round(areaObj1.left),y: Math.round(areaObj1.top) });
      pointers.setPoint(0,1,{x: Math.round(areaObj1.right),y: Math.round(areaObj1.top) });
      pointers.setPoint(1,0,{x: Math.round(areaObj1.right),y: Math.round(areaObj1.bottom) });
      pointers.setPoint(1,1,{x: Math.round(areaObj1.left),y: Math.round(areaObj1.bottom) });
      await driver.injectMultiPointerAction(pointers);
      await CommonFunc.sleep(4000);

      let text1 = getInspectorByKey('RotationGestureHandlerAllowedTypes_result');
      let obj1: ESObject = JSON.parse(text1);
      console.log('RotationGestureHandlerAllowedTypesTest_0010 obj1 $attrs content',obj1.$attrs.content,obj1)
      expect(obj1.$attrs.content).assertEqual('allowed types success');

      // click button to change types to [SourceTool.MOUSE]
      let button1 = await driver.findComponent(ON.id('Mouse_Type'));
      await button1.click();
      await CommonFunc.sleep(3000);
      let text2 = getInspectorByKey('RotationGestureHandlerAllowedTypes_result');
      let obj2: ESObject = JSON.parse(text2);
      console.log('RotationGestureHandlerAllowedTypesTest_0010 obj2 $attrs content',obj2.$attrs.content,obj2)
      expect(obj2.$attrs.content).assertEqual('allowed types default');

      // trigger gesture again with finger
      await CommonFunc.sleep(1000);
      await driver.injectMultiPointerAction(pointers);
      await CommonFunc.sleep(4000);
      let text3 = getInspectorByKey('RotationGestureHandlerAllowedTypes_result');
      let obj3: ESObject = JSON.parse(text3);
      console.log('RotationGestureHandlerAllowedTypesTest_0010 obj3 $attrs content',obj3.$attrs.content,obj3)
      expect(obj3.$attrs.content).assertEqual('allowed types default');

      // change types to invalid types
      await CommonFunc.sleep(1000);
      let button3 = await driver.findComponent(ON.id('Invalid_type'));
      await button3.click();
      await CommonFunc.sleep(3000);
      let text9 = getInspectorByKey('RotationGestureHandlerAllowedTypes_result');
      let obj9: ESObject = JSON.parse(text9);
      console.log('RotationGestureHandlerAllowedTypesTest_0010 obj9 $attrs content',obj9.$attrs.content,obj9)
      expect(obj9.$attrs.content).assertEqual('allowed types default');

      // trigger gesture again with finger
      await CommonFunc.sleep(1000);
      await driver.injectMultiPointerAction(pointers);
      await CommonFunc.sleep(4000);
      let text10 = getInspectorByKey('RotationGestureHandlerAllowedTypes_result');
      let obj10: ESObject = JSON.parse(text10);
      console.log('RotationGestureHandlerAllowedTypesTest_0010 obj10 $attrs content',obj10.$attrs.content,obj10)
      expect(obj10.$attrs.content).assertEqual('allowed types success');
      
      console.info('RotationGestureHandlerAllowedTypesTest_0010 END');
      done();
    });
  })
}