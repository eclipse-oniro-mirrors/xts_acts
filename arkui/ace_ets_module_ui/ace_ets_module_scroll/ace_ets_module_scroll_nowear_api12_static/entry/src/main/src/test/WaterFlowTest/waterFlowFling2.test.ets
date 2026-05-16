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
import { Driver, Component, ON } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';

export default function waterFlowFling2() {
  describe('waterFlowFling2', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.scroll.nowear.api12.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("waterFlowFling2 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/WaterFlow/waterFlowFling2",
      }
      try {
       const routerScroll = AppStorage.get<Router>("router") as Router
        routerScroll.clear();
        let pages = routerScroll.getState();
        console.info("get waterFlowFling2 state pages:" + JSON.stringify(pages));
        if (!("waterFlowFling2" == pages.name)) {
          console.info("get waterFlowFling2 pages.name:" + JSON.stringify(pages.name));
          routerScroll.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push waterFlowFling2 page error:" + err);
      }
      console.info("waterFlowFling2 beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("waterFlowFling2 after each called");
    });

    
    
/**
     * @tc.number   waterFlowFling2_static_0100
     * @tc.name     waterFlowFling2_static_0100
     * @tc.desc     waterFlowFling2_static_0100
     * @tc.level    Level.LEVEL1
     */
it('waterFlowFling2_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[waterFlowFling2_static_0100] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('fling_scroll_2'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('water_fling_2');
      console.info("[waterFlowFling2_static_0100] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[waterFlowFling2_static_0100] content: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')));
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content'))
        .assertEqual('fling: onScrollIndex-onReachStart-onScrollStart-onScrollFrameBegin-onScrollStop');
      console.info('[waterFlowFling2_static_0100] END');
      done();
    });
  })
}
