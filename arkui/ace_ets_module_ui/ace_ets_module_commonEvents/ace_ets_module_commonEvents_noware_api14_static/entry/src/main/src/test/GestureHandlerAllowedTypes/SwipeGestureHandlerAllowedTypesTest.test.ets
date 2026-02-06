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
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Driver, ON } from '@ohos.UiTest';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { BusinessError } from '@ohos.base';
import {UtilsTest} from '../Util.test'

export default function SwipeGestureHandlerAllowedTypesTest() {
  describe('SwipeGestureHandlerAllowedTypesTest', () => {
    beforeAll(() => {
      console.info("assemblyCallbackTest beforeAll start");

      await UtilsTest.startAbility("com.open.harmony.nowearevent.static", "EntryAbility")

    });
    beforeEach(async (): Promise<void> => {
        let options: router.RouterOptions = {
        url: 'MainAbility/pages/GestureHandlerAllowedTypes/SwipeGestureHandlerAllowedTypes',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        // routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get SwipeGestureHandlerAllowedTypesTest state pages:" + JSON.stringify(pages));
        if (!("SwipeGestureHandlerAllowedTypes" == pages.name)) {
          console.info("get SwipeGestureHandlerAllowedTypesTest pages.name:" + JSON.stringify(pages.name));
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push SwipeGestureHandlerAllowedTypesTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SwipeGestureHandlerAllowedTypesTest page error:" + err);
      }
      console.info("SwipeGestureHandlerAllowedTypesTest beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(2000);
      console.info("SwipeGestureHandlerAllowedTypesTest after each called");
    });

    

/**
     * @tc.number   SwipeGestureHandlerAllowedTypesTest_static_0010
     * @tc.name     SwipeGestureHandlerAllowedTypesTest_static_0010
     * @tc.desc     SwipeGestureHandlerAllowedTypesTest_static_0010
     * @tc.level    Level.LEVEL0
     */
it('SwipeGestureHandlerAllowedTypesTest_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SwipeGestureHandlerAllowedTypesTest_static_0010 START');
      await CommonFunc.sleep(200);
      let windowOffsetX:number = AppStorage.get<number>("winLeft") as number;
      let windowOffsetY:number = AppStorage.get<number>("winTop") as number;
      console.log('SwipeGestureHandlerAllowedTypesTest_static_0010 windowOffsetX and windowOffsetY',windowOffsetX, windowOffsetY)
      let areaObj1 = CommonFunc.getComponentRectOnScreen('SwipeGestureHandlerAllowedTypes_Text');
      let areaHeight1 = areaObj1.bottom - areaObj1.top
      let areaWidth1 = areaObj1.right - areaObj1.left
      console.log('SwipeGestureHandlerAllowedTypesTest_static_0010 areaObj1',areaObj1.left,areaObj1.top,areaObj1.right,areaObj1.bottom)
      console.log('SwipeGestureHandlerAllowedTypesTest_static_0010 areaObj1 clicked start',Math.round(areaObj1.left + areaWidth1 * 0.2),Math.round(areaObj1.top + areaHeight1/2))
      console.log('SwipeGestureHandlerAllowedTypesTest_static_0010 areaObj1 clicked end',Math.round(areaObj1.left + areaWidth1 * 0.8),Math.round(areaObj1.top + areaHeight1/2))

      // trigger gesture with finger
      let driver = Driver.create();
      let speed = (Math.floor(areaWidth1 * 0.6 / 0.016 / 1000) * 1000) as Int
      await CommonFunc.sleep(200);
      await driver.swipe(Math.round(areaObj1.left + areaWidth1 * 0.2) as Int,Math.round(areaObj1.top + areaHeight1/2) as Int,Math.round(areaObj1.left + areaWidth1 * 0.8) as Int,Math.round(areaObj1.top + areaHeight1/2) as Int, speed)
      await CommonFunc.sleep(200);
      let text1 = inspector.getInspectorByKey('SwipeGestureHandlerAllowedTypes_result');
      let obj1 = JSON.parseJsonElement(text1);
      console.log('SwipeGestureHandlerAllowedTypesTest_static_0010 obj1 $attrs content',obj1.getElement('$attrs').getString('content'),obj1)
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('allowed types success');

      // click button to change types to [SourceTool.MOUSE]
      let button1 = await driver.findComponent(ON.id('Mouse_Type'));
      await (button1?.click() as Promise<void>);
      await CommonFunc.sleep(200);
      let text2 = inspector.getInspectorByKey('SwipeGestureHandlerAllowedTypes_result');
      let obj2 = JSON.parseJsonElement(text2);
      console.log('SwipeGestureHandlerAllowedTypesTest_static_0010 obj2 $attrs content',obj2.getElement('$attrs').getString('content'),obj2)
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('allowed types default');

      // trigger gesture again with finger
      await CommonFunc.sleep(200);
      await driver.swipe(Math.round(areaObj1.left + areaWidth1 * 0.2) as Int,Math.round(areaObj1.top + areaHeight1/2) as Int,Math.round(areaObj1.left + areaWidth1 * 0.8) as Int,Math.round(areaObj1.top + areaHeight1/2) as Int, speed)
      await CommonFunc.sleep(200);
      let text3 = inspector.getInspectorByKey('SwipeGestureHandlerAllowedTypes_result');
      let obj3 = JSON.parseJsonElement(text3);
      console.log('SwipeGestureHandlerAllowedTypesTest_static_0010 obj3 $attrs content',obj3.getElement('$attrs').getString('content'),obj3)
      expect(obj3.getElement('$attrs').getString('content')).assertEqual('allowed types default');

      // click button to change types to [SourceTool.Finger]
      let button2 = await driver.findComponent(ON.id('Finger_Type'));
      await (button2?.click() as Promise<void>);
      await CommonFunc.sleep(200);
      let text4 = inspector.getInspectorByKey('SwipeGestureHandlerAllowedTypes_result');
      let obj4 = JSON.parseJsonElement(text4);
      console.log('SwipeGestureHandlerAllowedTypesTest_static_0010 obj4 $attrs content',obj4.getElement('$attrs').getString('content'),obj4)
      expect(obj4.getElement('$attrs').getString('content')).assertEqual('allowed types default');

      // trigger gesture again with finger
      await CommonFunc.sleep(200);
      await driver.swipe(Math.round(areaObj1.left + areaWidth1 * 0.2) as Int,Math.round(areaObj1.top + areaHeight1/2) as Int,Math.round(areaObj1.left + areaWidth1 * 0.8) as Int,Math.round(areaObj1.top + areaHeight1/2) as Int, speed)
      await CommonFunc.sleep(200);
      let text5 = inspector.getInspectorByKey('SwipeGestureHandlerAllowedTypes_result');
      let obj5 = JSON.parseJsonElement(text5);
      console.log('SwipeGestureHandlerAllowedTypesTest_static_0010 obj5 $attrs content',obj5.getElement('$attrs').getString('content'),obj5)
      expect(obj5.getElement('$attrs').getString('content')).assertEqual('allowed types success');

      // change types to invalid types
      await CommonFunc.sleep(200);
      let button3 = await driver.findComponent(ON.id('Invalid_type'));
      await (button3?.click() as Promise<void>);
      await CommonFunc.sleep(200);
      let text9 = inspector.getInspectorByKey('SwipeGestureHandlerAllowedTypes_result');
      let obj9 = JSON.parseJsonElement(text9);
      console.log('SwipeGestureHandlerAllowedTypesTest_static_0010 obj9 $attrs content',obj9.getElement('$attrs').getString('content'),obj9)
      expect(obj9.getElement('$attrs').getString('content')).assertEqual('allowed types default');

      // trigger gesture again with finger
      // await CommonFunc.sleep(200);
      // await driver.swipe(Math.round(areaObj1.left + areaWidth1 * 0.2) as Int,Math.round(areaObj1.top + areaHeight1/2) as Int,Math.round(areaObj1.left + areaWidth1 * 0.8) as Int,Math.round(areaObj1.top + areaHeight1/2) as Int,speed)
      // await CommonFunc.sleep(200);
      // let text10 = inspector.getInspectorByKey('SwipeGestureHandlerAllowedTypes_result');
      // let obj10 = JSON.parseJsonElement(text10);
      // console.log('SwipeGestureHandlerAllowedTypesTest_static_0010 obj10 $attrs content',obj10.getElement('$attrs').getString('content'),obj10)
      // expect(obj10.getElement('$attrs').getString('content')).assertEqual('allowed types success')

      console.info('SwipeGestureHandlerAllowedTypesTest_static_0010 END');
      done();
    });
  })
}

