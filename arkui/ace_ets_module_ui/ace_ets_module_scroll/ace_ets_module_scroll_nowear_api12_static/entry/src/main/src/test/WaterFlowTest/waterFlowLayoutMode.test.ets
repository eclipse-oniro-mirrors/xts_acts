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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {MessageManager,Callback} from '../../../ets/MainAbility/common/MessageManager';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';

export default function waterFlowLayoutMode() {
  describe('waterFlowLayoutMode', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.scroll.nowear.api12.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("waterFlowLayoutMode beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/WaterFlow/waterFlowLayoutMode",
      }
      try {
       const routerScroll = AppStorage.get<Router>("router") as Router
        routerScroll.clear();
        let pages = routerScroll.getState();
        console.info("get waterFlowLayoutMode state pages:" + JSON.stringify(pages));
        if (!("waterFlowLayoutMode" == pages.name)) {
          console.info("get waterFlowLayoutMode pages.name:" + JSON.stringify(pages.name));
          routerScroll.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push waterFlowLayoutMode page error:" + err);
      }
      console.info("waterFlowLayoutMode beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("waterFlowLayoutMode after each called");
    });

    
    
/**
     * @tc.number   waterFlowLayoutMode_static_001
     * @tc.name     waterFlowLayoutMode_static_001
     * @tc.desc     waterFlowLayoutMode_static_001
     * @tc.level    Level.LEVEL1
     */
it('waterFlowLayoutMode_static_001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[waterFlowLayoutMode_static_001] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn = await driver.findComponent(ON.id('layout_scroll'));
      console.info("[waterFlowLayoutMode_static_001] component btn is: " + btn);
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('layoutMode_yOffset');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[waterFlowLayoutMode_static_001] component strJson is: " + strJson);
      expect(obj.getElement('$attrs').getString('content')).assertEqual('yOffset: 100');
      console.info('[waterFlowLayoutMode_static_001] END');
      done();
    });


    
    
/**
     * @tc.number   waterFlowLayoutMode_static_002
     * @tc.name     waterFlowLayoutMode_static_002
     * @tc.desc     waterFlowLayoutMode_static_002
     * @tc.level    Level.LEVEL1
     */
it('waterFlowLayoutMode_static_002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[waterFlowLayoutMode_static_002] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn = await driver.findComponent(ON.id('layoutMode_2'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let btnScroll = await driver.findComponent(ON.id('layout_scroll'));
      await (btnScroll?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('layoutMode_yOffset');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[waterFlowLayoutMode_static_002] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('yOffset: 0');
      console.info('[waterFlowLayoutMode_static_002] END');
      done();
    });
  })
}
