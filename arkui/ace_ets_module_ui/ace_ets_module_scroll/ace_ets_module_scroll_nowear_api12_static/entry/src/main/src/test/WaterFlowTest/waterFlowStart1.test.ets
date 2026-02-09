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
import { UtilsTest, startAbility, stopApplication } from '../Util.test';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function waterFlowStart1() {
  describe('waterFlowStart1', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.scroll.nowear.api12.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("waterFlowStart1 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/WaterFlow/waterFlowStart1",
      }
      try {
       const routerScroll = AppStorage.get<Router>("router") as Router
        routerScroll.clear();
        let pages = routerScroll.getState();
        console.info("get waterFlowStart1 state pages:" + JSON.stringify(pages));
        if (!("waterFlowStart1" == pages.name)) {
          console.info("get waterFlowStart1 pages.name:" + JSON.stringify(pages.name));
          routerScroll.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push waterFlowStart1 page error:" + err);
      }
      console.info("waterFlowStart1 beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("waterFlowStart1 after each called");
    });

    
    
/**
     * @tc.number   waterFlowStart1_static_0100
     * @tc.name     waterFlowStart1_static_0100
     * @tc.desc     waterFlowStart1_static_0100
     * @tc.level    Level.LEVEL1
     */
it('waterFlowStart1_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[waterFlowStart1_static_0100] START');
      let driver = Driver.create();
      let onReachStartText = await driver.findComponent(ON.id('onReachStart_wText_1'));
      let text1 = await (onReachStartText?.getText() as Promise<string>);
      console.info('[waterFlowStart1_static_0100] onReachStartText' + text1);
      expect(text1).assertEqual('onReachStart:succ');
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id('flow_scrollToIndex_1'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      let onScrollStartText = await driver.findComponent(ON.id('onScrollStart_wText_1'));
      let text2 = await (onScrollStartText?.getText() as Promise<string>);
      console.info('[waterFlowStart1_static_0100] onScrollStartText' + text2);
      expect(text2).assertEqual('onScrollStart:succ');
      await CommonFunc.sleep(1000);

      let onScrollStopText = await driver.findComponent(ON.id('onScrollStop_wText_1'));
      let text3 = await (onScrollStopText?.getText() as Promise<string>);
      console.info('[waterFlowStart1_static_0100] onScrollStopText' + text3);
      expect(text3).assertEqual('onScrollStop:succ');
      await CommonFunc.sleep(1000);

      let btm = await driver.findComponent(ON.id('flow_scrollEdge_2'));
      await (btm?.click() as Promise<void>);
      await CommonFunc.sleep(5000);
      let onReachEndText = await driver.findComponent(ON.id('onReachEnd_wText_1'));
      let text4 = await (onReachEndText?.getText() as Promise<string>);
      console.info('[waterFlowStart1_static_0100] onReachEndText' + text4);
      expect(text4).assertEqual('onReachEnd:succ');

      console.info('[waterFlowStart1_static_0100] END');
      done();
    });
  })
}
