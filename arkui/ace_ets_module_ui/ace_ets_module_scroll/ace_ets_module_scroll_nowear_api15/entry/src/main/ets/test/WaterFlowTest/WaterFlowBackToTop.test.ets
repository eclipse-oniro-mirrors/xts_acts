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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import { router } from '@kit.ArkUI';
import { Component, Driver, On, ON, MouseButton } from '@kit.TestKit';

export default function WaterFlowBackToTopTest() {
  describe('WaterFlowBackToTopTest', () => {
    beforeEach(async (done: Function) => {
      const SUITE: string = 'WaterFlowBackToTop'
      let options: router.RouterOptions = {
        url: "MainAbility/pages/WaterFlow/WaterFlowBackToTop",
      }
      try {
        router.clear();
        let pages: router.RouterState = router.getState();
        if (pages == null || !("WaterFlowSwipe" == pages.name)) {
          await router.pushUrl(options).then(() => {
            console.info(`${SUITE} router.pushUrl success`);
          })
        }
      } catch (err) {
        console.error(`${SUITE} beforeEach error:` + JSON.stringify(err));
      }
      done()
    });
    /*
     * @tc.number :ArkUI_WaterFlow_BackToTop_0100
     * @tc.name   :test waterFlow back to top
     * @tc.desc   :test whether backToTop events are effective
     */
    it('WaterFlowScrollTest1_0100', 0, async () => {
      console.info('WaterFlowScrollTest_0100 START');
      await sleep(1000)
      let driverWaterFlow: Driver = Driver.create();
      let waterFlow: Component = await driverWaterFlow.findComponent(ON.id('WaterFlowScroll_4'));
      let rect = await waterFlow.getBounds();
      let top = rect.top;
      let left = rect.left;
      let right = rect.right;
      let bottom = rect.bottom;
      console.info("WaterFlowScrollTest_0100 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom - top;
      let width = right - left;
      // driver create
      let driverTop = await Driver.create();
      let topButton: Component = await driverTop.findComponent(ON.id('Top'));
      let driverSwitch = await Driver.create();
      let switchButton: Component = await driverSwitch.findComponent(ON.id('Switch'))
      await sleep(1000);
      // apply the swipe action to the WaterFlow component
      await driverWaterFlow.swipe(
        Math.round(left + width * 0.2),
        Math.round(bottom - height / 4),
        Math.round(left + width * 0.2),
        Math.round(bottom - height / 2)
      );
      await sleep(2000);  // wait for the scroll to complete
      await topButton.click();
      await sleep(1500)
      let stopJson = getInspectorByKey('waterFlowBackToTop');
      expect(JSON.parse(stopJson).$attrs.content !== 'onDidWaterFlowBackToTop').assertTrue();
      
      await switchButton.click();
      await sleep(500)
      await topButton.click();
      await sleep(1500)

      await driverWaterFlow.swipe(
        Math.round(left + width * 0.2),
        Math.round(bottom - height / 4),
        Math.round(left + width * 0.2),
        Math.round(bottom - height / 2)
      );
      await sleep(2000);
      await switchButton.click();
      await sleep(500)
      await topButton.click();
      await sleep(1500)
      
      await driverWaterFlow.swipe(
        Math.round(left + width * 0.2),
        Math.round(bottom - height / 4),
        Math.round(left + width * 0.2),
        Math.round(bottom - height / 2)
      );
      await sleep(2000);
      await switchButton.click();
      await sleep(500)
      await topButton.click();
      await sleep(1000); // wait for backToTop complete

      let strJson = getInspectorByKey('waterFlowScroll_1');
      let strJson1 = getInspectorByKey('waterFlowScroll_2');
      let strJson3 = getInspectorByKey('waterFlowBackToTop');
      let strJson4 = getInspectorByKey('waterFlowAbnormal');

      console.info("getInspectorByKey result for waterFlowScroll_1: " + strJson);
      let obj: ESObject = JSON.parse(strJson);
      console.info("getInspectorByKey result for waterFlowScroll_2: " + strJson1);
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("getInspectorByKey result for waterFlowBackToTop: " + strJson3);
      let obj3: ESObject = JSON.parse(strJson3);
      let obj4: ESObject = JSON.parse(strJson4);
      // output console info
      console.info("[WaterFlowScrollTest_0100] component obj is: " + JSON.stringify(obj));
      console.info("[WaterFlowScrollTest_0100] component obj1 is: " + JSON.stringify(obj1));
      console.info("[WaterFlowScrollTest_0100] component obj3 is: " + JSON.stringify(obj3));
      console.info("[WaterFlowScrollTest_0100] component obj4 is: " + JSON.stringify(obj4));
      // assertEqual the value of the event
      expect(obj.$attrs.content).assertEqual('onWillScroll');
      expect(obj3.$attrs.content).assertEqual('onDidWaterFlowBackToTop');
      expect(obj4.$attrs.content).assertEqual('DidAbnormal');
      console.info('[WaterFlowScrollTest_0100] END');
    })
  })
}

async function sleep(time: number) {
  return new Promise((resolve: (value: string) => void, reject) => {
    setTimeout(() => {
      resolve("sleep")
    }, time)
  }).then(() => {
    console.info(`sleep ${time} over...`)
  })
}
