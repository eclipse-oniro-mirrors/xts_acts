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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "@ohos/hypium"
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
import {UiComponent,MouseButton, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function TapGestureAllowedTypesTest() {
  describe('TapGestureAllowedTypesTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/GestureAllowedTypes/TapGestureAllowedTypes',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TapGestureAllowedTypes state pages: " + JSON.stringify(pages));
        if (!("TapGestureAllowedTypes" == pages.name)) {
          console.info("get TapGestureAllowedTypes state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push TapGestureAllowedTypes success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TapGestureAllowedTypes page error: " + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("TapGestureAllowedTypes after each called");
    });

    /**
     * @tc.number
     * @tc.name      TapGestureAllowedTypesTest_0010
     * @tc.desc      allowedTypes api test for TapGesture, will do the following test scenarios:
     *               1、try to trigger LongPressGesture with Mouse and Finger with allowedTypes setting to [], which is default setting.
     *               2、press button to change allowedTypes to [SourceTool.Mouse] and try to trigger the gesture again with Mouse and Finger
     *               3、press button to change allowedTypes to [SourceTool.Finger] and try to trigger the gesture again with Mouse and Finger
     *               4、press button to change allowedTypes to invalid values, [null, undefined], and try to trigger the gesture again
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('TapGestureAllowedTypesTest_0010', 0, async (done: Function) => {
      console.info('TapGestureAllowedTypesTest_0010 START');
      await CommonFunc.sleep(1000);
      let windowOffsetX:number = globalThis.winLeft
      let windowOffsetY:number = globalThis.winTop
      console.log('TapGestureAllowedTypesTest_0010 windowOffsetX and windowOffsetY',windowOffsetX, windowOffsetY)
      let FatherObj = CommonFunc.getComponentRectOnScreen('TapGestureAllowedTypes_Father');
      let FatherObjHeight = FatherObj.bottom - FatherObj.top
      let FatherObjWidth = FatherObj.right - FatherObj.left
      console.log('TapGestureAllowedTypesTest_0010 FatherObj',FatherObj.left,FatherObj.top,FatherObj.right,FatherObj.bottom)
      await CommonFunc.sleep(1000);
      let areaObj = CommonFunc.getComponentRectOnScreen('TapGestureAllowedTypes_Text');
      let areaHeight = areaObj.bottom - areaObj.top
      let areaWidth = areaObj.right - areaObj.left
      console.log('TapGestureAllowedTypesTest_0010 areaObj',areaObj.left,areaObj.top,areaObj.right,areaObj.bottom)
      console.log('TapGestureAllowedTypesTest_0010 areaObj clicked',Math.round(areaObj.left + areaWidth/2),Math.round(areaObj.top + areaHeight/2))

      // trigger tap gesture with finger
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      await driver.click(Math.round(areaObj.left + areaWidth/2),Math.round(areaObj.top + areaHeight/2));
      await CommonFunc.sleep(3000);
      let text1 = getInspectorByKey('TapGestureAllowedTypes_result');
      let obj1: ESObject = JSON.parse(text1);
      console.log('TapGestureAllowedTypesTest_0010 obj1 $attrs content',obj1.$attrs.content,obj1)
      expect(obj1.$attrs.content).assertEqual('allowed types success');

      // trigger tap gesture with mouse
      await CommonFunc.sleep(1000);
      await driver.mouseClick({x: Math.round(areaObj.left + areaWidth/2), y: Math.round(areaObj.top + areaHeight/2)}, MouseButton.MOUSE_BUTTON_LEFT);
      await CommonFunc.sleep(3000);
      let text2 = getInspectorByKey('TapGestureAllowedTypes_result');
      let obj2: ESObject = JSON.parse(text2);
      console.log('TapGestureAllowedTypesTest_0010 obj2 $attrs content',obj2.$attrs.content,obj2)
      expect(obj2.$attrs.content).assertEqual('allowed types success');

      // click button to change types to [SourceTool.MOUSE]
      let button1 = await driver.findComponent(ON.id('Mouse_Type'));
      await button1.click();
      await CommonFunc.sleep(3000);
      let text3 = getInspectorByKey('TapGestureAllowedTypes_result');
      let obj3: ESObject = JSON.parse(text3);
      console.log('TapGestureAllowedTypesTest_0010 obj3 $attrs content',obj3.$attrs.content,obj3)
      expect(obj3.$attrs.content).assertEqual('allowed types default');

      // trigger tap gesture again with finger
      await CommonFunc.sleep(1000);
      await driver.click(Math.round(areaObj.left + areaWidth/2),Math.round(areaObj.top + areaHeight/2));
      await CommonFunc.sleep(3000);
      let text4 = getInspectorByKey('TapGestureAllowedTypes_result');
      let obj4: ESObject = JSON.parse(text4);
      console.log('TapGestureAllowedTypesTest_0010 obj4 $attrs content',obj4.$attrs.content,obj4)
      expect(obj4.$attrs.content).assertEqual('allowed types default');

      // trigger tap gesture again with mouse
      await CommonFunc.sleep(1000);
      await driver.mouseClick({x: Math.round(areaObj.left + areaWidth/2), y: Math.round(areaObj.top + areaHeight/2)}, MouseButton.MOUSE_BUTTON_LEFT);
      await CommonFunc.sleep(3000);
      let text5 = getInspectorByKey('TapGestureAllowedTypes_result');
      let obj5: ESObject = JSON.parse(text5);
      console.log('TapGestureAllowedTypesTest_0010 obj5 $attrs content',obj5.$attrs.content,obj5)
      expect(obj5.$attrs.content).assertEqual('allowed types success');

      // click button to change types to [SourceTool.Finger]
      let button2 = await driver.findComponent(ON.id('Finger_Type'));
      await button2.click();
      await CommonFunc.sleep(3000);
      let text6 = getInspectorByKey('TapGestureAllowedTypes_result');
      let obj6: ESObject = JSON.parse(text6);
      console.log('TapGestureAllowedTypesTest_0010 obj6 $attrs content',obj6.$attrs.content,obj6)
      expect(obj6.$attrs.content).assertEqual('allowed types default');

      // trigger tap gesture again with mouse
      await CommonFunc.sleep(1000);
      await driver.mouseClick({x: Math.round(areaObj.left + areaWidth/2), y: Math.round(areaObj.top + areaHeight/2)}, MouseButton.MOUSE_BUTTON_LEFT);
      await CommonFunc.sleep(3000);
      let text7 = getInspectorByKey('TapGestureAllowedTypes_result');
      let obj7: ESObject = JSON.parse(text7);
      console.log('TapGestureAllowedTypesTest_0010 obj7 $attrs content',obj7.$attrs.content,obj7)
      expect(obj7.$attrs.content).assertEqual('allowed types default');

      // trigger tap gesture again with finger
      await CommonFunc.sleep(1000);
      await driver.click(Math.round(areaObj.left + areaWidth/2),Math.round(areaObj.top + areaHeight/2));
      await CommonFunc.sleep(3000);
      let text8 = getInspectorByKey('TapGestureAllowedTypes_result');
      let obj8: ESObject = JSON.parse(text8);
      console.log('TapGestureAllowedTypesTest_0010 obj8 $attrs content',obj8.$attrs.content,obj8)
      expect(obj8.$attrs.content).assertEqual('allowed types success');
 
       // change types to invalid types
      await CommonFunc.sleep(1000);
      let button3 = await driver.findComponent(ON.id('Invalid_type'));
      await button3.click();
      await CommonFunc.sleep(3000);
      let text9 = getInspectorByKey('TapGestureAllowedTypes_result');
      let obj9: ESObject = JSON.parse(text9);
      console.log('TapGestureAllowedTypesTest_0010 obj9 $attrs content',obj9.$attrs.content,obj9)
      expect(obj9.$attrs.content).assertEqual('allowed types default');

      // trigger gesture again with finger
      await CommonFunc.sleep(1000);
      await driver.click(Math.round(areaObj.left + areaWidth/2),Math.round(areaObj.top + areaHeight/2));
      await CommonFunc.sleep(3000);
      let text10 = getInspectorByKey('TapGestureAllowedTypes_result');
      let obj10: ESObject = JSON.parse(text10);
      console.log('TapGestureAllowedTypesTest_0010 obj10 $attrs content',obj10.$attrs.content,obj10)
      expect(obj10.$attrs.content).assertEqual('allowed types success');
      console.info('TapGestureAllowedTypesTest_0010 END');
      done();
    });
  })
}


