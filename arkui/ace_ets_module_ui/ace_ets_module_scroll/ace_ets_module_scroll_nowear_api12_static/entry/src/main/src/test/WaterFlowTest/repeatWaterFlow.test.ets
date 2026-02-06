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
import inspector from '@ohos.arkui.inspector';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function repeatWaterFlow() {
  describe('repeatWaterFlow', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.scroll.nowear.api12.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("repeatWaterFlow beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/WaterFlow/repeatWaterFlow",
      }
      try {
       const routerScroll = AppStorage.get<Router>("router") as Router
        routerScroll.clear();
        let pages = routerScroll.getState();
        console.info("get repeatWaterFlow state pages:" + JSON.stringify(pages));
        if (!("repeatWaterFlow" == pages.name)) {
          console.info("get repeatWaterFlow pages.name:" + JSON.stringify(pages.name));
          routerScroll.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push repeatWaterFlow page error:" + err);
      }
      console.info("repeatWaterFlow beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("repeatWaterFlow after each called");
    });

    
    
/**
     * @tc.number   repeatWaterFlow_static_0100
     * @tc.name     repeatWaterFlow_static_0100
     * @tc.desc     repeatWaterFlow_static_0100
     * @tc.level    Level.LEVEL1
     */
it('repeatWaterFlow_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[repeatWaterFlow_static_0100] START');
      let strJson = inspector.getInspectorByKey('flowRepeat_event');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[repeatWaterFlow_static_0100] component obj is: " + JSON.stringify(obj));
      console.info("[repeatWaterFlow_static_0100] enableScrollInteraction: " + JSON.stringify(obj.getElement('$attrs').getBoolean('enableScrollInteraction')));
      expect(obj.getElement('$attrs').getBoolean('enableScrollInteraction')).assertEqual(true);

      let strJson1 = inspector.getInspectorByKey('flowRepeat_onReachStart');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[repeatWaterFlow_static_0100] component obj1 is: " + JSON.stringify(obj1));
      console.info("[repeatWaterFlow_static_0100] onReachStart: " + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('onReachStart1');

      let strJson2 = inspector.getInspectorByKey('flowRepeat_onScrollIndex');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[repeatWaterFlow_static_0200] component obj2 is: " + JSON.stringify(obj2));
      console.info("[repeatWaterFlow_static_0200] onScrollIndex: " + JSON.stringify(obj2.getElement('$attrs').getString('content')));
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('onScrollIndex: success');

      await CommonFunc.sleep(1000);
      console.info('[repeatWaterFlow_static_0100] END');
      done();
    });

    
    
/**
     * @tc.number   repeatWaterFlow_static_0200
     * @tc.name     repeatWaterFlow_static_0200
     * @tc.desc     repeatWaterFlow_static_0200
     * @tc.level    Level.LEVEL1
     */
it('repeatWaterFlow_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[repeatWaterFlow_static_0200] START');
      let waterFlowRect = CommonFunc.getComponentRectOnScreen('flowRepeat_event')
      let driver = Driver.create()
      await driver.fling({
        x: Number.parseInt(`${(waterFlowRect.right - waterFlowRect.left) * 0.5 + waterFlowRect.left}`) as int,
        y: Number.parseInt(`${(waterFlowRect.bottom - waterFlowRect.top) * 0.6 + waterFlowRect.top}`) as int
      },
        {
          x: Number.parseInt(`${(waterFlowRect.right - waterFlowRect.left) * 0.5 + waterFlowRect.left}`) as int,
          y: Number.parseInt(`${(waterFlowRect.bottom - waterFlowRect.top) * 0.2 + waterFlowRect.top}`) as int
        }, 5, 1000);
      await CommonFunc.sleep(2000);

      let strJson1 = inspector.getInspectorByKey('flowRepeat_onFrameBegin');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[repeatWaterFlow_static_0200] component obj1 is: " + JSON.stringify(obj1));
      console.info("[repeatWaterFlow_static_0200] onScrollFrameBegin: " + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('onScrollFrameBegin: success');

      let strJson2 = inspector.getInspectorByKey('flowRepeat_onText_1');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[repeatWaterFlow_static_0200] component obj2 is: " + JSON.stringify(obj2));
      console.info("[repeatWaterFlow_static_0200] onWillScroll: " + JSON.stringify(obj2.getElement('$attrs').getString('content')));
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('onWillScroll: success');

      let strJson3 = inspector.getInspectorByKey('flowRepeat_onText_2');
      let obj3 = JSON.parseJsonElement(strJson3);
      console.info("[repeatWaterFlow_static_0200] component obj5 is: " + JSON.stringify(obj3));
      console.info("[repeatWaterFlow_static_0200] onDidScroll: " + JSON.stringify(obj3.getElement('$attrs').getString('content')));
      expect(obj3.getElement('$attrs').getString('content')).assertEqual('onDidScroll: success');

      let btm = await driver.findComponent(ON.id('flowRepeat_scroll'));
      await (btm?.click() as Promise<void>);
      await CommonFunc.sleep(5000);

      let strJson4 = inspector.getInspectorByKey('flowRepeat_onReachText');
      let obj4 = JSON.parseJsonElement(strJson4);
      console.info("[repeatWaterFlow_static_0200] component obj2 is: " + JSON.stringify(obj4));
      console.info("[repeatWaterFlow_static_0200] onReachEnd: " + JSON.stringify(obj4.getElement('$attrs').getString('content')));
      expect(obj4.getElement('$attrs').getString('content')).assertEqual('onReachEnd: success');

      await CommonFunc.sleep(1000);
      console.info('[repeatWaterFlow_static_0200] END');
      done();
    });
  })
}
