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
export default function RotationGestureAllowedTypesTest() {
  describe('RotationGestureAllowedTypesTest', () => {
    beforeAll(() => {

      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility")

    });
    beforeEach(async (): Promise<void> => {
      console.info("RotationGestureAllowedTypesTest beforeEach start");
      const searchRouter = AppStorage.get<Router>("router") as Router
      console.info("RotationGestureAllowedTypesTest beforeEach start222");
      try {
        searchRouter.pushUrl({
          url: 'MainAbility/pages/GestureAllowedTypes/RotationGestureAllowedTypes',
        });
        await CommonFunc.sleep(2000);
        console.info("push RotationGestureAllowedTypesTest success: ");
      } catch (err) {
        console.error("push RotationGestureAllowedTypesTest page error: " + err);
        expect().assertFail();
      }
    });
    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(2000);
      console.info("RotationGestureAllowedTypes after each called");
    });


    
    
/**
     * @tc.number   RotationGestureAllowedTypesTest_static_0010
     * @tc.name     RotationGestureAllowedTypesTest_static_0010
     * @tc.desc     RotationGestureAllowedTypesTest_static_0010
     * @tc.level    Level.LEVEL0
     */
it('RotationGestureAllowedTypesTest_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('RotationGestureAllowedTypesTest_static_0010 START');
      await CommonFunc.sleep(1000);
      let windowOffsetX:number = AppStorage.get<number>("winLeft") as number
      let windowOffsetY:number = AppStorage.get<number>("winTop") as number
      console.log('RotationGestureAllowedTypesTest_static_0010 windowOffsetX and windowOffsetY',windowOffsetX, windowOffsetY)
      let areaObj1 = CommonFunc.getComponentRectOnScreen('RotationGestureAllowedTypes_Text');
      let areaHeight1 = areaObj1.bottom - areaObj1.top
      let areaWidth1 = areaObj1.right - areaObj1.left
      console.log('RotationGestureAllowedTypesTest_static_0010 areaObj1 start',areaObj1.left,areaObj1.top,areaObj1.right,areaObj1.bottom)
      console.log('RotationGestureAllowedTypesTest_static_0010 areaObj1 clicked finger[0] start',Math.round(areaObj1.left),Math.round(areaObj1.top))
      console.log('RotationGestureAllowedTypesTest_static_0010 areaObj1 clicked finger[0] end',Math.round(areaObj1.right),Math.round(areaObj1.top))
      console.log('RotationGestureAllowedTypesTest_static_0010 areaObj1 clicked finger[1] start',Math.round(areaObj1.right),Math.round(areaObj1.bottom))
      console.log('RotationGestureAllowedTypesTest_static_0010 areaObj1 clicked finger[1] end',Math.round(areaObj1.left),Math.round(areaObj1.bottom))
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let pointers: PointerMatrix = PointerMatrix.create(2,2);
      pointers.setPoint(0,0,{x: Math.round(areaObj1.left) as Int,y: Math.round(areaObj1.top) as Int });
      pointers.setPoint(0,1,{x: Math.round(areaObj1.right) as Int,y: Math.round(areaObj1.top) as Int });
      pointers.setPoint(1,0,{x: Math.round(areaObj1.right) as Int,y: Math.round(areaObj1.bottom) as Int });
      pointers.setPoint(1,1,{x: Math.round(areaObj1.left) as Int,y: Math.round(areaObj1.bottom) as Int });
      await driver.injectMultiPointerAction(pointers);
      await CommonFunc.sleep(4000);

      let text1 = inspector.getInspectorByKey('RotationGestureAllowedTypes_result');
      let obj1 = JSON.parseJsonElement(text1);
      console.log('RotationGestureAllowedTypesTest_static_0010 obj1 $attrs content',obj1.getElement('$attrs').getString('content'),obj1)
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('allowed types success');

      // click button to change types to [SourceTool.MOUSE]
      let button1 = await (driver.findComponent(ON.id('Mouse_Type')) as Promise<Component>);
      await button1.click();
      await CommonFunc.sleep(3000);
      let text2 = inspector.getInspectorByKey('RotationGestureAllowedTypes_result');
      let obj2 = JSON.parseJsonElement(text2);
      console.log('RotationGestureAllowedTypesTest_static_0010 obj2 $attrs content',obj2.getElement('$attrs').getString('content'),obj2)
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('allowed types default');

      // trigger gesture again with finger
      await CommonFunc.sleep(1000);
      await driver.injectMultiPointerAction(pointers);
      await CommonFunc.sleep(4000);
      let text3 = inspector.getInspectorByKey('RotationGestureAllowedTypes_result');
      let obj3 = JSON.parseJsonElement(text3);
      console.log('RotationGestureAllowedTypesTest_static_0010 obj3 $attrs content',obj3.getElement('$attrs').getString('content'),obj3)
      expect(obj3.getElement('$attrs').getString('content')).assertEqual('allowed types default');

      // change types to invalid types
      await CommonFunc.sleep(1000);
      let button3 = await (driver.findComponent(ON.id('Invalid_type')) as Promise<Component>);
      await button3.click();
      await CommonFunc.sleep(3000);
      let text9 = inspector.getInspectorByKey('RotationGestureAllowedTypes_result');
      let obj9 = JSON.parseJsonElement(text9);
      console.log('RotationGestureAllowedTypesTest_static_0010 obj9 $attrs content',obj9.getElement('$attrs').getString('content'),obj9)
      expect(obj9.getElement('$attrs').getString('content')).assertEqual('allowed types default');

      // trigger gesture again with finger // undefined/null
      // await CommonFunc.sleep(1000);
      // await driver.injectMultiPointerAction(pointers);
      // await CommonFunc.sleep(4000);
      // let text10 = inspector.getInspectorByKey('RotationGestureAllowedTypes_result');
      // let obj10 = JSON.parseJsonElement(text10);
      // console.log('RotationGestureAllowedTypesTest_static_0010 obj10 $attrs content',obj10.getElement('$attrs').getString('content'),obj10)
      // expect(obj10.getElement('$attrs').getString('content')).assertEqual('allowed types success');

      console.info('RotationGestureAllowedTypesTest_static_0010 END');
      done();
    });
  })
}


