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

export default function router_getStateByUrl1() {
  describe('router_getStateByUrl1', () => {
    beforeAll(() => {
      console.info("router_getStateByUrl1 beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.RouteManagement.api12.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("router_getStateByUrl1 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/router/router_getStateByUrl1',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get router_getStateByUrl1 state pages:" + JSON.stringify(pages));
        if (!("router_getStateByUrl1" == pages.name)) {
          console.info("get router_getStateByUrl1 pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push router_getStateByUrl1 page error:" + err);
      }
      console.info("router_getStateByUrl1 beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("router_getStateByUrl1 after each called");
    });

    
    
/**
     * @tc.number   router_getStateByUrl1_static_0100
     * @tc.name     router_getStateByUrl1_static_0100
     * @tc.desc     router_getStateByUrl1_static_0100
     * @tc.level    Level.LEVEL3
     */
it('router_getStateByUrl1_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[router_getStateByUrl1_static_0100] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let btn1 = await driver.findComponent(ON.id('router_getStateByUrl1_btn'));
      await btn1!.click()
      await CommonFunc.sleep(2000);

      let text1 = inspector.getInspectorByKey('router_getStateByUrl1_text');
      expect(JSON.parseJsonElement(text1).getElement('$attrs').getString('content'))
        .assertEqual('index=2;name=router_getStateByUrl1;path=MainAbility/pages/router/;params={};');

      console.info('[router_getStateByUrl1_static_0100] END');
      done();
    });

  })
}
