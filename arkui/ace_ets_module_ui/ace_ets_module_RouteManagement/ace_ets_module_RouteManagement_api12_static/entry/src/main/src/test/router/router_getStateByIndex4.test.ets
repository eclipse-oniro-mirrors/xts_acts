'use static';
/**
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
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector'
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest, startAbility } from '../Util.test'

export default function router_getStateByIndex4() {
  describe('router_getStateByIndex4', () => {
    beforeAll(() => {
      console.info("router_getStateByIndex4 beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.RouteManagement.api12.static", "EntryAbility")
    });

    beforeEach(async () => {
      console.info("router_getStateByIndex4 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/router/router_getStateByIndex4',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get router_getStateByIndex4 state pages:" + JSON.stringify(pages));
        if (!("router_getStateByIndex4" == pages.name)) {
          console.info("get router_getStateByIndex4 pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push router_getStateByIndex4 page error:" + err);
      }
      console.info("router_getStateByIndex4 beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("router_getStateByIndex4 after each called");
    });

    
    
/**
     * @tc.number   router_getStateByIndex4_static_0100
     * @tc.name     router_getStateByIndex4_static_0100
     * @tc.desc     router_getStateByIndex4_static_0100
     * @tc.level    Level.LEVEL2
     */
it('router_getStateByIndex4_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[router_getStateByIndex4_static_0100] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let btn1 = await driver.findComponent(ON.id('router_getStateByIndex4_btn1'));
      await btn1!.click();
      await CommonFunc.sleep(2000);
      console.info('[router_getStateByIndex4_static_0100] btn1');

      let text1 = inspector.getInspectorByKey('router_getStateByIndex4_text1');
      expect(JSON.parseJsonElement(text1).getElement('$attrs').getString('content')).assertEqual('undefined');
      console.info('[router_getStateByIndex4_static_0100] text1');

      let btn2 = await driver.findComponent(ON.id('router_getStateByIndex4_btn2'));
      await btn2!.click();
      await CommonFunc.sleep(2000);
      console.info('[router_getStateByIndex4_static_0100] btn2');

      let text2 = inspector.getInspectorByKey('router_getStateByIndex4_text2');
      expect(JSON.parseJsonElement(text2).getElement('$attrs').getString('content')).assertEqual('undefined');
      console.info('[router_getStateByIndex4_static_0100] text2');

      let btn3 = await driver.findComponent(ON.id('router_getStateByIndex4_btn3'));
      await btn3!.click();
      await CommonFunc.sleep(2000);
      console.info('[router_getStateByIndex4_static_0100] btn3');

      let text3 = inspector.getInspectorByKey('router_getStateByIndex4_text3');
      expect(JSON.parseJsonElement(text3).getElement('$attrs').getString('content')).assertEqual('undefined');
      console.info('[router_getStateByIndex4_static_0100] text3');

      let btn4 = await driver.findComponent(ON.id('router_getStateByIndex4_btn4'));
      await btn4!.click();
      await CommonFunc.sleep(2000);
      console.info('[router_getStateByIndex4_static_0100] btn4');

      let text4 = inspector.getInspectorByKey('router_getStateByIndex4_text4');
      expect(JSON.parseJsonElement(text4).getElement('$attrs').getString('content')).assertEqual('undefined');
      console.info('[router_getStateByIndex4_static_0100] text4');

      console.info('[router_getStateByIndex4_static_0100] END');
      done();
    });

  })
}
