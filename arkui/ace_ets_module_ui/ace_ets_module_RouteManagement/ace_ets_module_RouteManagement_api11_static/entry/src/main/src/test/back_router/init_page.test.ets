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
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import { UtilsTest } from '../Util.test';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import {
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix,
  UiDirection,
  MouseButton,
  UIElementInfo,
  UIEventObserver
} from '@ohos.UiTest';

export default function aboutToAppearRouterTest() {
  describe('aboutToAppearRouterTest', () => {
    beforeAll(() => {

      await UtilsTest.startAbility("com.arkui.ace.RouteManagement.api11.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("aboutToAppearRouterTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/back_router/init_page',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get aboutToAppearRouterTest state pages:" + JSON.stringify(pages));
        if (!("aboutToAppearRouterTest" == pages.name)) {
          console.info("get WaterFlow_WaterFlow pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push aboutToAppearRouterTest page error:" + err);
      }
      console.info("aboutToAppearRouterTest beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("aboutToAppearRouterTest after each called");
    });

    
    /**
     * @tc.number   aboutToAppearRouterTest_static_0100
     * @tc.name     aboutToAppearRouterTest_static_0100
     * @tc.desc     aboutToAppearRouterTest_static_0100
     * @tc.level    Level.LEVEL2
     */
// it('aboutToAppearRouterTest_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
//       console.info('[aboutToAppearRouterTest_static_0100] START');
//       let driver = Driver.create();
//       let button = await driver.findComponent(ON.id('Router1_A'));
//       await (button?.click() as Promise<void>);
//       await CommonFunc.sleep(1000);
//       let strJson1 = inspector.getInspectorByKey('text_amount');
//       let obj1 = JSON.parseJsonElement(strJson1);
//       let strJson = inspector.getInspectorByKey('text_page');
//       let obj = JSON.parseJsonElement(strJson);
//       expect(obj1!.getElement('$attrs').getString('content')).assertEqual("3");
//       expect(obj!.getElement('$attrs').getString('content')).assertEqual("3");
//       let button2 = await driver.findComponent(ON.id('RouterA1'));
//       await (button2?.click() as Promise<void>);
//       await CommonFunc.sleep(1000);
//       //B页面
//       let strJson2 = inspector.getInspectorByKey('amount1');
//       let obj2 = JSON.parseJsonElement(strJson2);
//       let strJson3 = inspector.getInspectorByKey('page1');
//       let obj3 = JSON.parseJsonElement(strJson3);
//       expect(obj2!.getElement('$attrs').getString('content')).assertEqual("4");
//       expect(obj3!.getElement('$attrs').getString('content')).assertEqual("4");
//       let button3 = await driver.findComponent(ON.id('RouterB1'));
//       await (button3?.click() as Promise<void>);
//       await CommonFunc.sleep(1000);
//       //c页面
//       let strJson4 = inspector.getInspectorByKey('amountC');
//       let obj4 = JSON.parseJsonElement(strJson4);
//       let strJson5 = inspector.getInspectorByKey('pageC');
//       let obj5 = JSON.parseJsonElement(strJson5);
//       expect(obj4!.getElement('$attrs').getString('content')).assertEqual("5");
//       expect(obj5!.getElement('$attrs').getString('content')).assertEqual("5");
//       let button4 = await driver.findComponent(ON.id('RouteC2'));
//       await (button4?.click() as Promise<void>);
//       await CommonFunc.sleep(1000);
//       //返回B页
//       expect(obj2!.getElement('$attrs').getString('content')).assertEqual("4");
//       expect(obj3!.getElement('$attrs').getString('content')).assertEqual("4");
//
//       let scrollBar = await driver.findComponent(ON.type('Scroll'));
//       let button5 = await (scrollBar?.scrollSearch(ON.id('RouteB2')) as Promise<Component | null>);
//       await (button5?.click() as Promise<void>);
//       await CommonFunc.sleep(1000);
//       //返回A页
//       expect(obj1!.getElement('$attrs').getString('content')).assertEqual("3");
//       expect(obj!.getElement('$attrs').getString('content')).assertEqual("3");
//
//       let scrollBar2 = await driver.findComponent(ON.type('Scroll'));
//       let button6 = await (scrollBar2?.scrollSearch(ON.id('RouterA2')) as Promise<Component | null>);
//       await (button6?.click() as Promise<void>);
//       await CommonFunc.sleep(1000);
//       //返回初始页
//       let strJson6 = inspector.getInspectorByKey('amountIndex');
//       let obj6 = JSON.parseJsonElement(strJson6);
//       let strJson7 = inspector.getInspectorByKey('pageIndex');
//       let obj7 = JSON.parseJsonElement(strJson7);
//       expect(obj6!.getElement('$attrs').getString('content')).assertEqual("2");
//       expect(obj7!.getElement('$attrs').getString('content')).assertEqual("2");
//       await CommonFunc.sleep(1000);
//       done();
//     });


    
    /**
     * @tc.number   aboutToAppearRouterTest_static_0200
     * @tc.name     aboutToAppearRouterTest_static_0200
     * @tc.desc     aboutToAppearRouterTest_static_0200
     * @tc.level    Level.LEVEL2
     */
it('aboutToAppearRouterTest_static_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[aboutToAppearRouterTest_static_0200] START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('Router1_A'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('text_amount');
      let strJson = inspector.getInspectorByKey('text_page');
      expect(JSON.parseJsonElement(strJson1)!.getElement('$attrs').getString('content')).assertEqual("3");
      expect(JSON.parseJsonElement(strJson)!.getElement('$attrs').getString('content')).assertEqual("3");
      let button2 = await driver.findComponent(ON.id('RouterA1'));
      await (button2?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson2 = inspector.getInspectorByKey('amount1');
      let strJson3 = inspector.getInspectorByKey('page1');
      expect(JSON.parseJsonElement(strJson2)!.getElement('$attrs').getString('content')).assertEqual("4");
      expect(JSON.parseJsonElement(strJson3)!.getElement('$attrs').getString('content')).assertEqual("4");
      let button3 = await driver.findComponent(ON.id('RouterB1'));
      await (button3?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson4 = inspector.getInspectorByKey('amountC');
      let strJson5 = inspector.getInspectorByKey('pageC');
      expect(JSON.parseJsonElement(strJson4)!.getElement('$attrs').getString('content')).assertEqual("5");
      expect(JSON.parseJsonElement(strJson5)!.getElement('$attrs').getString('content')).assertEqual("5");
      let button4 = await driver.findComponent(ON.id('RouteC2_A'));
      await (button4?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(strJson4)!.getElement('$attrs').getString('content')).assertEqual("5");
      expect(JSON.parseJsonElement(strJson5)!.getElement('$attrs').getString('content')).assertEqual("5");
      await CommonFunc.sleep(1000);
      done();
    });
  })
}
