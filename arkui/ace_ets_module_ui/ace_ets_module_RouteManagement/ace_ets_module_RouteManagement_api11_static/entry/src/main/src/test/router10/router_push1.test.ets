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
  PointerMatrix
} from '@ohos.UiTest';

export default function router_push1() {
  describe('router_push1', () => {
    beforeAll(() => {

      await UtilsTest.startAbility("com.arkui.ace.RouteManagement.api11.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("router_push1 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/router10/router_push1',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get router_push1 state pages:" + JSON.stringify(pages));
        if (!("router_push1" == pages.name)) {
          console.info("get router_push1 pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push router_push1 page error:" + err);
      }
      console.info("router_push1 beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("router_push1 after each called");
    });

    
    
/**
     * @tc.number   router_push1_static_0100
     * @tc.name     router_push1_static_0100
     * @tc.desc     router_push1_static_0100
     * @tc.level    Level.LEVEL3
     */
it('router_push1_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[router_push1_static_0100] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let btn1 = await driver.findComponent(ON.id('router_push_btn1'));
      await (btn1?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      let text1 = inspector.getInspectorByKey('pageThree_text1');
      expect(JSON.parseJsonElement(text1)!.getElement('$attrs').getString('content')).assertEqual('pageThree');

      console.info('[router_push1_static_0100] END');
      done();
    });

  })
}
