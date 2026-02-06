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

export default function LongPressGestureAllowedTypesTest() {
  describe('LongPressGestureAllowedTypesTest', () => {
    beforeEach(async (done: Function) => {
      console.info("LongPressGestureAllowedTypes beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/GestureAllowedTypes/LongPressGestureAllowedTypes',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get LongPressGestureAllowedTypes state pages:" + JSON.stringify(pages));
        if (!("LongPressGestureAllowedTypes" == pages.name)) {
          console.info("get LongPressGestureAllowedTypes pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push LongPressGestureAllowedTypes page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push LongPressGestureAllowedTypes page error:" + err);
      }
      console.info("LongPressGestureAllowedTypes beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("LongPressGestureAllowedTypes after each called");
    });

    /**
     * @tc.name   LongPressGestureAllowedTypesTest_0010
     * @tc.number LongPressGestureAllowedTypesTest_0010
     * @tc.desc   allowedTypes api test for LongPressGesture, will do the following test scenarios:
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('LongPressGestureAllowedTypesTest_0010', Level.LEVEL0, async (done: Function) => {
      console.info('LongPressGestureAllowedTypesTest_0010 START');
      await CommonFunc.sleep(1000);
      let areaObj = CommonFunc.getComponentRectOnScreen('LongPressGestureAllowedTypes_Text');
      let areaHeight = areaObj.bottom - areaObj.top
      let areaWidth = areaObj.right - areaObj.left
      console.log('LongPressGestureLongClickTest_0010 areaObj',areaObj.left,areaObj.top,areaObj.right,areaObj.bottom)
      console.log('LongPressGestureLongClickTest_0010 areaObj clicked',Math.round(areaObj.left + areaWidth/2),Math.round(areaObj.top + areaHeight/2))

      // trigger gesture with finger
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      await driver.longClick(Math.round(areaObj.left + areaWidth/2),Math.round(areaObj.top + areaHeight/2));
      await CommonFunc.sleep(3000);
      let text1 = getInspectorByKey('LongPressGestureAllowedTypes_result');
      let obj1: ESObject = JSON.parse(text1);
      console.log('LongPressGestureLongClickTest_0010 obj1 $attrs content',obj1.$attrs.content,obj1)
      expect(obj1.$attrs.content).assertEqual('allowed types success');

      // trigger gesture with mouse
      await CommonFunc.sleep(1000);
      await driver.mouseLongClick({x: Math.round(areaObj.left + areaWidth/2), y: Math.round(areaObj.top + areaHeight/2)}, MouseButton.MOUSE_BUTTON_LEFT);
      await CommonFunc.sleep(3000);
      let text2 = getInspectorByKey('LongPressGestureAllowedTypes_result');
      let obj2: ESObject = JSON.parse(text2);
      console.log('LongPressGestureLongClickTest_0010 obj2 $attrs content',obj2.$attrs.content,obj2)
      expect(obj2.$attrs.content).assertEqual('allowed types success');

      // click button to change types to [SourceTool.MOUSE]
      let button1 = await driver.findComponent(ON.id('Mouse_Type'));
      await button1.click();
      await CommonFunc.sleep(3000);
      let text3 = getInspectorByKey('LongPressGestureAllowedTypes_result');
      let obj3: ESObject = JSON.parse(text3);
      console.log('LongPressGestureLongClickTest_0010 obj3 $attrs content',obj3.$attrs.content,obj3)
      expect(obj3.$attrs.content).assertEqual('allowed types default');

      // trigger gesture again with finger
      await CommonFunc.sleep(1000);
      await driver.longClick(Math.round(areaObj.left + areaWidth/2),Math.round(areaObj.top + areaHeight/2));
      await CommonFunc.sleep(3000);
      let text4 = getInspectorByKey('LongPressGestureAllowedTypes_result');
      let obj4: ESObject = JSON.parse(text4);
      console.log('LongPressGestureLongClickTest_0010 obj4 $attrs content',obj4.$attrs.content,obj4)
      expect(obj4.$attrs.content).assertEqual('allowed types default');

      // trigger gesture again with mouse
      await CommonFunc.sleep(1000);
      await driver.mouseLongClick({x: Math.round(areaObj.left + areaWidth/2), y: Math.round(areaObj.top + areaHeight/2)}, MouseButton.MOUSE_BUTTON_LEFT);
      await CommonFunc.sleep(3000);
      let text5 = getInspectorByKey('LongPressGestureAllowedTypes_result');
      let obj5: ESObject = JSON.parse(text5);
      console.log('LongPressGestureLongClickTest_0010 obj5 $attrs content',obj5.$attrs.content,obj5)
      expect(obj5.$attrs.content).assertEqual('allowed types success');

      // click button to change types to [SourceTool.Finger]
      let button2 = await driver.findComponent(ON.id('Finger_Type'));
      await button2.click();
      await CommonFunc.sleep(3000);
      let text6 = getInspectorByKey('LongPressGestureAllowedTypes_result');
      let obj6: ESObject = JSON.parse(text6);
      console.log('LongPressGestureLongClickTest_0010 obj6 $attrs content',obj6.$attrs.content,obj6)
      expect(obj6.$attrs.content).assertEqual('allowed types default');

      // trigger gesture again with mouse
      await CommonFunc.sleep(1000);
      await driver.mouseLongClick({x: Math.round(areaObj.left + areaWidth/2), y: Math.round(areaObj.top + areaHeight/2)}, MouseButton.MOUSE_BUTTON_LEFT);
      await CommonFunc.sleep(3000);
      let text7 = getInspectorByKey('LongPressGestureAllowedTypes_result');
      let obj7: ESObject = JSON.parse(text7);
      console.log('LongPressGestureLongClickTest_0010 obj7 $attrs content',obj7.$attrs.content,obj7)
      expect(obj7.$attrs.content).assertEqual('allowed types default');

      // trigger gesture again with finger
      await CommonFunc.sleep(1000);
      await driver.longClick(Math.round(areaObj.left + areaWidth/2),Math.round(areaObj.top + areaHeight/2));
      await CommonFunc.sleep(3000);
      let text8 = getInspectorByKey('LongPressGestureAllowedTypes_result');
      let obj8: ESObject = JSON.parse(text8);
      console.log('LongPressGestureLongClickTest_0010 obj8 $attrs content',obj8.$attrs.content,obj8)
      expect(obj8.$attrs.content).assertEqual('allowed types success');
      
      // change types to invalid types
      await CommonFunc.sleep(1000);
      let button3 = await driver.findComponent(ON.id('Invalid_type'));
      await button3.click();
      await CommonFunc.sleep(3000);
      let text9 = getInspectorByKey('LongPressGestureAllowedTypes_result');
      let obj9: ESObject = JSON.parse(text9);
      console.log('LongPressGestureAllowedTypesTest_0010 obj9 $attrs content',obj9.$attrs.content,obj9)
      expect(obj9.$attrs.content).assertEqual('allowed types default');

      // trigger gesture again with finger
      await CommonFunc.sleep(1000);
      await driver.longClick(Math.round(areaObj.left + areaWidth/2),Math.round(areaObj.top + areaHeight/2));
      await CommonFunc.sleep(3000);
      let text10 = getInspectorByKey('LongPressGestureAllowedTypes_result');
      let obj10: ESObject = JSON.parse(text10);
      console.log('LongPressGestureAllowedTypesTest_0010 obj10 $attrs content',obj10.$attrs.content,obj10)
      expect(obj10.$attrs.content).assertEqual('allowed types success');
      
      console.info('LongPressGestureAllowedTypesTest_0010 END');
      done();
    });
  })
}

