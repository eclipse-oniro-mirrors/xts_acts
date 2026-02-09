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

export default function Params() {
  describe('Params', () => {
    beforeAll(() => {

      await UtilsTest.startAbility("com.arkui.ace.RouteManagement.api11.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("Params beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/back_router/A_page',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get Params state pages:" + JSON.stringify(pages));
        if (!("Params" == pages.name)) {
          console.info("get WaterFlow_WaterFlow pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push Params page error:" + err);
      }
      console.info("Params beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("Params after each called");
    });
    
    
/**
     * @tc.number   Params_static_0100
     * @tc.name     Params_static_0100
     * @tc.desc     Params_static_0100
     * @tc.level    Level.LEVEL2
     */
it('Params_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[Params_static_0100] START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('R_params'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('text_Params1');
      expect(JSON.parseJsonElement(strJson1)!.getElement('$attrs').getString('content')).assertEqual('{"data1":{"data2":["message","message1"]}}');
      await CommonFunc.sleep(1000);
      done();
    });
  })
}
