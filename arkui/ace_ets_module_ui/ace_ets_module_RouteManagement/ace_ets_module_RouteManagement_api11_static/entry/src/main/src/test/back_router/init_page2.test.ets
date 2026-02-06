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

export default function aboutToAppearRouterTest2() {
  describe('aboutToAppearRouterTest2', () => {
    beforeAll(() => {

      await UtilsTest.startAbility("com.arkui.ace.RouteManagement.api11.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("aboutToAppearRouterTest2 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/back_router/init_page',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get aboutToAppearRouterTest2 state pages:" + JSON.stringify(pages));
        if (!("aboutToAppearRouterTest2" == pages.name)) {
          console.info("get WaterFlow_WaterFlow pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push aboutToAppearRouterTest2 page error:" + err);
      }
      console.info("aboutToAppearRouterTest2 beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("aboutToAppearRouterTest2 after each called");
    });
    
    
/**
     * @tc.number   aboutToAppearRouterTest2_static_0100
     * @tc.name     aboutToAppearRouterTest2_static_0100
     * @tc.desc     aboutToAppearRouterTest2_static_0100
     * @tc.level    Level.LEVEL2
     */
it('aboutToAppearRouterTest2_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[aboutToAppearRouterTest2_static_0100] START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('Router1_A'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('text_amount');
      let strJson = inspector.getInspectorByKey('text_page');
      expect(JSON.parseJsonElement(strJson1)!.getElement('$attrs').getString('content')).assertEqual("3");
      expect(JSON.parseJsonElement(strJson)!.getElement('$attrs').getString('content')).assertEqual("3");

      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button2 = await (scrollBar?.scrollSearch(ON.id('RouterA1')) as Promise<Component | null>);
      await (button2?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      //B页面
      let strJson2 = inspector.getInspectorByKey('amount1');
      let strJson3 = inspector.getInspectorByKey('page1');
      expect(JSON.parseJsonElement(strJson2)!.getElement('$attrs').getString('content')).assertEqual("4");
      expect(JSON.parseJsonElement(strJson3)!.getElement('$attrs').getString('content')).assertEqual("4");
      //清空所有页
      await CommonFunc.sleep(1000);

      let scrollBar2 = await driver.findComponent(ON.type('Scroll'));
      let button4 = await (scrollBar2?.scrollSearch(ON.id('clear')) as Promise<Component | null>)
      await (button4?.click() as Promise<void>);
      await CommonFunc.sleep(3000);
      expect(JSON.parseJsonElement(inspector.getInspectorByKey('index'))!.getElement('$attrs').getString('content')).assertEqual("1");
      expect(JSON.parseJsonElement(inspector.getInspectorByKey('length'))!.getElement('$attrs').getString('content')).assertEqual("1");
      await CommonFunc.sleep(1000);
      //返回上一页
      let scrollBar3 = await driver.findComponent(ON.type('Scroll'));
      let button5 = await (scrollBar3?.scrollSearch(ON.id('ReturnBack')) as Promise<Component | null>)
      await (button5?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(inspector.getInspectorByKey('index'))!.getElement('$attrs').getString('content')).assertEqual("1");
      expect(JSON.parseJsonElement(inspector.getInspectorByKey('length'))!.getElement('$attrs').getString('content')).assertEqual("1");
      await CommonFunc.sleep(1000);
      done();
    });

  })
}
