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
import inspector from '@ohos.arkui.inspector';

export default function onScrollIndexFlow1() {
  describe('onScrollIndexFlow1', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.scroll.nowear.api12.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("onScrollIndexFlow1 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/WaterFlow/onScrollIndexFlow1",
      }
      try {
       const routerScroll = AppStorage.get<Router>("router") as Router
        routerScroll.clear();
        let pages = routerScroll.getState();
        console.info("get onScrollIndexFlow1 state pages:" + JSON.stringify(pages));
        if (!("onScrollIndexFlow1" == pages.name)) {
          console.info("get onScrollIndexFlow1 pages.name:" + JSON.stringify(pages.name));
          routerScroll.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push onScrollIndexFlow1 page error:" + err);
      }
      console.info("onScrollIndexFlow1 beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("onScrollIndexFlow1 after each called");
    });

    
    
/**
     * @tc.number   onScrollIndexFlow1_static_0100
     * @tc.name     onScrollIndexFlow1_static_0100
     * @tc.desc     onScrollIndexFlow1_static_0100
     * @tc.level    Level.LEVEL1
     */
it('onScrollIndexFlow1_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[onScrollIndexFlow1_static_0100] START');
      let driver = Driver.create();
      let swiperScroll = CommonFunc.getComponentRectOnScreen('onScrollIndexFlow1');
      let top = swiperScroll.top;
      let right = swiperScroll.right;
      let left = swiperScroll.left;
      let bottom = swiperScroll.bottom;
      console.info("onScrollIndexFlow1_static_0100 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom -top;
      let width = right - left;
      await CommonFunc.sleep(1000);
      await driver.mouseScroll({x:Math.round(left + width/2) as int, y: Math.round(top + height*0.3) as int}, true ,20)
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('onScrollIndex_flow');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[onScrollIndexFlow1_static_0100] component obj is: " + JSON.stringify(obj));
      console.info("[onScrollIndexFlow1_static_0100] content obj is: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('onScrollIndex:succ5');
      console.info('[onScrollIndexFlow1_static_0100] END');
      done();
    });
  })
}
