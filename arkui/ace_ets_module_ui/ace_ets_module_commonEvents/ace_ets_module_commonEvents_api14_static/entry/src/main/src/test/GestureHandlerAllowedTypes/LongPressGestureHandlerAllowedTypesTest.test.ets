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

import {describe, beforeAll, beforeEach, afterEach, it, expect, Level } from '../../../../hypium/index';
import { Driver, ON ,Component,MouseButton,PointerMatrix} from '@ohos.UiTest';
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
import {UtilsTest} from '../Util.test'
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
export default function LongPressGestureHandlerAllowedTypesTest() {
  describe('LongPressGestureHandlerAllowedTypesTest', () => {
    beforeAll(() => {

      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility")

    });
    beforeEach(async (): Promise<void> => {
      console.info("LongPressGestureHandlerAllowedTypesTest beforeEach start");
      const searchRouter = AppStorage.get<Router>("router") as Router
      console.info("LongPressGestureHandlerAllowedTypesTest beforeEach start222");
      try {
        searchRouter.pushUrl({
          url: 'MainAbility/pages/GestureHandlerAllowedTypes/LongPressGestureHandlerAllowedTypes',
        });
        await CommonFunc.sleep(2000);
        console.info("push LongPressGestureHandlerAllowedTypesTest success: ");
      } catch (err) {
        console.error("push LongPressGestureHandlerAllowedTypesTest page error: " + err);
        expect().assertFail();
      }
    });
    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(2000);
      console.info("LongPressGestureHandlerAllowedTypes after each called");
    });

    
    
/**
     * @tc.number   LongPressGestureHandlerAllowedTypesTest_static_0010
     * @tc.name     LongPressGestureHandlerAllowedTypesTest_static_0010
     * @tc.desc     LongPressGestureHandlerAllowedTypesTest_static_0010
     * @tc.level    Level.LEVEL0
     */
it('LongPressGestureHandlerAllowedTypesTest_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('LongPressGestureHandlerAllowedTypesTest_static_0010 START');
      await CommonFunc.sleep(1000);
      let windowOffsetX:number = AppStorage.get<number>("winLeft") as number
      let windowOffsetY:number = AppStorage.get<number>("winTop") as number
      console.log('LongPressGestureHandlerAllowedTypesTest_static_0010 windowOffsetX and windowOffsetY',windowOffsetX, windowOffsetY)
      let FatherObj = CommonFunc.getComponentRectOnScreen('LongPressGestureHandlerAllowedTypes_Father');
      let FatherObjHeight = FatherObj.bottom - FatherObj.top
      let FatherObjWidth = FatherObj.right - FatherObj.left
      console.log('LongPressGestureHandlerAllowedTypesTest_static_0010 FatherObj',FatherObj.left,FatherObj.top,FatherObj.right,FatherObj.bottom)
      await CommonFunc.sleep(1000);
      let areaObj = CommonFunc.getComponentRectOnScreen('LongPressGestureHandlerAllowedTypes_Text');
      let areaHeight = areaObj.bottom - areaObj.top
      let areaWidth = areaObj.right - areaObj.left
      console.log('LongPressGestureHandlerAllowedTypesTest_static_0010 areaObj',areaObj.left,areaObj.top,areaObj.right,areaObj.bottom)
      console.log('LongPressGestureHandlerAllowedTypesTest_static_0010 areaObj clicked',Math.round(areaObj.left + areaWidth/2),Math.round(areaObj.top + areaHeight/2))

      // trigger gesture with finger
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      await driver.longClick(Math.round(areaObj.left + areaWidth/2) as Int,Math.round(areaObj.top + areaHeight/2) as Int);
      await CommonFunc.sleep(3000);
      let text1 = inspector.getInspectorByKey('LongPressGestureHandlerAllowedTypes_result');
      let obj1 = JSON.parseJsonElement(text1);
      console.log('LongPressGestureHandlerAllowedTypesTest_static_0010 obj1 $attrs content',obj1.getElement('$attrs').getString('content'),obj1)
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('allowed types success');

      // trigger gesture with mouse
      await CommonFunc.sleep(1000);
      await driver.mouseClick({x: Math.round(areaObj.left + areaWidth/2) as Int, y: Math.round(areaObj.top + areaHeight/2) as Int}, MouseButton.MOUSE_BUTTON_LEFT);
      await CommonFunc.sleep(3000);
      let text2 = inspector.getInspectorByKey('LongPressGestureHandlerAllowedTypes_result');
      let obj2 = JSON.parseJsonElement(text2);
      console.log('LongPressGestureHandlerAllowedTypesTest_static_0010 obj2 $attrs content',obj2.getElement('$attrs').getString('content'),obj2)
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('allowed types success');

      // click button to change types to [SourceTool.MOUSE]
      let button1 = await (driver.findComponent(ON.id('Mouse_Type')) as Promise<Component>);
      await button1.click();
      await CommonFunc.sleep(3000);
      let text3 = inspector.getInspectorByKey('LongPressGestureHandlerAllowedTypes_result');
      let obj3 = JSON.parseJsonElement(text3);
      console.log('LongPressGestureHandlerAllowedTypesTest_static_0010 obj3 $attrs content',obj3.getElement('$attrs').getString('content'),obj3)
      expect(obj3.getElement('$attrs').getString('content')).assertEqual('allowed types default');

      // trigger gesture again with finger
      await CommonFunc.sleep(1000);
      await driver.longClick(Math.round(areaObj.left + areaWidth/2) as Int,Math.round(areaObj.top + areaHeight/2) as Int);
      await CommonFunc.sleep(3000);
      let text4 = inspector.getInspectorByKey('LongPressGestureHandlerAllowedTypes_result');
      let obj4 = JSON.parseJsonElement(text4);
      console.log('LongPressGestureHandlerAllowedTypesTest_static_0010 obj4 $attrs content',obj4.getElement('$attrs').getString('content'),obj4)
      expect(obj4.getElement('$attrs').getString('content')).assertEqual('allowed types default');

      // trigger gesture again with mouse
      await CommonFunc.sleep(1000);
      await driver.mouseLongClick({x: Math.round(areaObj.left + areaWidth/2) as Int, y: Math.round(areaObj.top + areaHeight/2) as Int}, MouseButton.MOUSE_BUTTON_LEFT);
      await CommonFunc.sleep(3000);
      let text5 = inspector.getInspectorByKey('LongPressGestureHandlerAllowedTypes_result');
      let obj5 = JSON.parseJsonElement(text5);
      console.log('LongPressGestureHandlerAllowedTypesTest_static_0010 obj5 $attrs content',obj5.getElement('$attrs').getString('content'),obj5)
      expect(obj5.getElement('$attrs').getString('content')).assertEqual('allowed types success');

      // click button to change types to [SourceTool.Finger]
      let button2 = await (driver.findComponent(ON.id('Finger_Type')) as Promise<Component>);
      await button2.click();
      await CommonFunc.sleep(3000);
      let text6 = inspector.getInspectorByKey('LongPressGestureHandlerAllowedTypes_result');
      let obj6 = JSON.parseJsonElement(text6);
      console.log('LongPressGestureHandlerAllowedTypesTest_static_0010 obj6 $attrs content',obj6.getElement('$attrs').getString('content'),obj6)
      expect(obj6.getElement('$attrs').getString('content')).assertEqual('allowed types default');

      // trigger gesture again with mouse
      await CommonFunc.sleep(1000);
      await driver.mouseLongClick({x: Math.round(areaObj.left + areaWidth/2) as Int, y: Math.round(areaObj.top + areaHeight/2) as Int}, MouseButton.MOUSE_BUTTON_LEFT);
      await CommonFunc.sleep(3000);
      let text7 = inspector.getInspectorByKey('LongPressGestureHandlerAllowedTypes_result');
      let obj7 = JSON.parseJsonElement(text7);
      console.log('LongPressGestureHandlerAllowedTypesTest_static_0010 obj7 $attrs content',obj7.getElement('$attrs').getString('content'),obj7)
      expect(obj7.getElement('$attrs').getString('content')).assertEqual('allowed types default');

      // trigger gesture again with finger
      await CommonFunc.sleep(1000);
      await driver.longClick(Math.round(areaObj.left + areaWidth/2) as Int,Math.round(areaObj.top + areaHeight/2) as Int);
      await CommonFunc.sleep(3000);
      let text8 = inspector.getInspectorByKey('LongPressGestureHandlerAllowedTypes_result');
      let obj8 = JSON.parseJsonElement(text8);
      console.log('LongPressGestureHandlerAllowedTypesTest_static_0010 obj8 $attrs content',obj8.getElement('$attrs').getString('content'),obj8)
      expect(obj8.getElement('$attrs').getString('content')).assertEqual('allowed types success');

       // change types to invalid types
      await CommonFunc.sleep(1000);
      let button3 = await (driver.findComponent(ON.id('Invalid_type')) as Promise<Component>);
      await button3.click();
      await CommonFunc.sleep(3000);
      let text9 = inspector.getInspectorByKey('LongPressGestureHandlerAllowedTypes_result');
      let obj9 = JSON.parseJsonElement(text9);
      console.log('LongPressGestureHandlerAllowedTypesTest_static_0010 obj9 $attrs content',obj9.getElement('$attrs').getString('content'),obj9)
      expect(obj9.getElement('$attrs').getString('content')).assertEqual('allowed types default');

      // trigger gesture again with finger // undefined/null
      // await CommonFunc.sleep(1000);
      // await driver.longClick(Math.round(areaObj.left + areaWidth/2) as Int,Math.round(areaObj.top + areaHeight/2) as Int);
      // await CommonFunc.sleep(3000);
      // let text10 = inspector.getInspectorByKey('LongPressGestureHandlerAllowedTypes_result');
      // let obj10 = JSON.parseJsonElement(text10);
      // console.log('LongPressGestureHandlerAllowedTypesTest_static_0010 obj10 $attrs content',obj10.getElement('$attrs').getString('content'),obj10)
      // expect(obj10.getElement('$attrs').getString('content')).assertEqual('allowed types success');

      console.info('LongPressGestureHandlerAllowedTypesTest_static_0010 END');
      done();
    });
  })
}