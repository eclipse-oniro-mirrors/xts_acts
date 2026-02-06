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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index'
import router from '@ohos.router';
import { Component, Driver, On, ON, MouseButton, Rect } from '@ohos.UiTest';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { UtilsTest, startAbility } from '../Util.test';

export default function WaterFlowBackToTopTest() {
  describe('WaterFlowBackToTopTest', () => {
    beforeAll(() => {
      console.info("WaterFlowBackToTopTest beforeEach start");
      await UtilsTest.msSleep(4000);
      await startAbility("com.arkui.ace.scroll.nowear.api15.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      const SUITE: string = 'WaterFlowBackToTop'
      let options: router.RouterOptions = {
        url: "MainAbility/pages/WaterFlow/WaterFlowBackToTop",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages: router.RouterState = routerInstance.getState();
        if (pages == null || !("WaterFlowSwipe" == pages.name)) {
          routerInstance.pushUrl(options).then(() => {
            console.info(`${SUITE} router.pushUrl success`);
          })
        }
      } catch (err) {
        console.error(`${SUITE} beforeEach error:` + JSON.stringify(err));
      }
    });
    
    
/**
     * @tc.number   WaterFlowScrollTest1_static_0100
     * @tc.name     WaterFlowScrollTest1_static_0100
     * @tc.desc     WaterFlowScrollTest1_static_0100
     * @tc.level    Level.LEVEL0
     */
it('WaterFlowScrollTest1_static_0100', Level.LEVEL0, async () => {
      console.info('WaterFlowScrollTest_static_0100 START');
      await sleep(1000)
      let driverWaterFlow: Driver = Driver.create();
      let waterFlow = await driverWaterFlow.findComponent(ON.id('WaterFlowScroll_4'));
      let rect = await (waterFlow?.getBounds() as Promise<Rect>);
      let top = rect.top;
      let left = rect.left;
      let right = rect.right;
      let bottom = rect.bottom;
      console.info("WaterFlowScrollTest_static_0100 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom - top;
      let width = right - left;
      // driver create
      let driverTop = Driver.create();
      let topButton = await driverTop.findComponent(ON.id('Top'));
      let driverSwitch = Driver.create();
      let switchButton = await driverSwitch.findComponent(ON.id('Switch'))
      await sleep(1000);
      // apply the swipe action to the WaterFlow component
      await driverWaterFlow.swipe(
        Math.round(left + width * 0.2) as int,
        Math.round(bottom - height / 4) as int,
        Math.round(left + width * 0.2) as int,
        Math.round(bottom - height / 2) as int
      );
      await sleep(2000);  // wait for the scroll to complete
      await (topButton?.click() as Promise<void>);
      await sleep(1500)
      let stopJson = inspector.getInspectorByKey('waterFlowBackToTop');
      expect(JSON.parseJsonElement(stopJson).getElement('$attrs').getString('content') !== 'onDidWaterFlowBackToTop').assertTrue();
      
      await (switchButton?.click() as Promise<void>);
      await sleep(500)
      await (topButton?.click() as Promise<void>);
      await sleep(1500)

      await driverWaterFlow.swipe(
        Math.round(left + width * 0.2) as int,
        Math.round(bottom - height / 4) as int,
        Math.round(left + width * 0.2) as int,
        Math.round(bottom - height / 2) as int
      );
      await sleep(2000);
      await (switchButton?.click() as Promise<void>);
      await sleep(500)
      await (topButton?.click() as Promise<void>);
      await sleep(1500)
      
      await driverWaterFlow.swipe(
        Math.round(left + width * 0.2) as int,
        Math.round(bottom - height / 4) as int,
        Math.round(left + width * 0.2) as int,
        Math.round(bottom - height / 2) as int
      );
      await sleep(2000);
      await (switchButton?.click() as Promise<void>);
      await sleep(500)
      await (topButton?.click() as Promise<void>);
      await sleep(1000); // wait for backToTop complete

      let strJson = inspector.getInspectorByKey('waterFlowScroll_1');
      let strJson1 = inspector.getInspectorByKey('waterFlowScroll_2');
      let strJson3 = inspector.getInspectorByKey('waterFlowBackToTop');
      let strJson4 = inspector.getInspectorByKey('waterFlowAbnormal');

      console.info("getInspectorByKey result for waterFlowScroll_1: " + strJson);
      let obj = JSON.parseJsonElement(strJson);
      console.info("getInspectorByKey result for waterFlowScroll_2: " + strJson1);
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("getInspectorByKey result for waterFlowBackToTop: " + strJson3);
      let obj3 = JSON.parseJsonElement(strJson3);
      let obj4 = JSON.parseJsonElement(strJson4);
      // output console info
      console.info("[WaterFlowScrollTest_static_0100] component obj is: " + JSON.stringify(obj));
      console.info("[WaterFlowScrollTest_static_0100] component obj1 is: " + JSON.stringify(obj1));
      console.info("[WaterFlowScrollTest_static_0100] component obj3 is: " + JSON.stringify(obj3));
      console.info("[WaterFlowScrollTest_static_0100] component obj4 is: " + JSON.stringify(obj4));
      // assertEqual the value of the event
      expect(obj.getElement('$attrs').getString('content')).assertEqual('onWillScroll');
      expect(obj3.getElement('$attrs').getString('content')).assertEqual('onDidWaterFlowBackToTop');
      expect(obj4.getElement('$attrs').getString('content')).assertEqual('DidAbnormal');
      console.info('[WaterFlowScrollTest_static_0100] END');
    })
  })
}

async function sleep(count:int) : Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0)
    }, count)
  })
}
