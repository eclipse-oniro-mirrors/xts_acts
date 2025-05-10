/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';

export default function repeatWaterFlow() {
  describe('repeatWaterFlow', () => {
    beforeEach(async (done: Function) => {
      console.info("repeatWaterFlow beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/WaterFlow/repeatWaterFlow",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get repeatWaterFlow state pages:" + JSON.stringify(pages));
        if (!("repeatWaterFlow" == pages.name)) {
          console.info("get repeatWaterFlow pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push repeatWaterFlow page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push repeatWaterFlow page error:" + err);
      }
      console.info("repeatWaterFlow beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("repeatWaterFlow after each called");
    });

    /**
     * @tc.number    repeatWaterFlow_0100
     * @tc.name      repeatWaterFlow_0100
     * @tc.desc      WaterFlow component set enableScrollInteraction properties
     * @tc.level     Level 2
     * @tc.type
     * @tc.size
     */
    it('repeatWaterFlow_0100', 0, async (done: Function) => {
      console.info('[repeatWaterFlow_0100] START');
      let strJson = getInspectorByKey('flowRepeat_event');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[repeatWaterFlow_0100] component obj is: " + JSON.stringify(obj));
      console.info("[repeatWaterFlow_0100] enableScrollInteraction: " + JSON.stringify(obj.$attrs.enableScrollInteraction));
      expect(obj.$attrs.enableScrollInteraction).assertEqual(true);

      let strJson1 = getInspectorByKey('flowRepeat_onReachStart');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[repeatWaterFlow_0100] component obj1 is: " + JSON.stringify(obj1));
      console.info("[repeatWaterFlow_0100] onReachStart: " + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('onReachStart1');

      let strJson2 = getInspectorByKey('flowRepeat_onScrollIndex');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[repeatWaterFlow_0200] component obj2 is: " + JSON.stringify(obj2));
      console.info("[repeatWaterFlow_0200] onScrollIndex: " + JSON.stringify(obj2.$attrs.content));
      expect(obj2.$attrs.content).assertEqual('onScrollIndex: success');

      await CommonFunc.sleep(1000);
      console.info('[repeatWaterFlow_0100] END');
      done();
    });

    /**
     * @tc.number    repeatWaterFlow_0200
     * @tc.name      repeatWaterFlow_0200
     * @tc.desc      WaterFlow is used in conjunction with the repeat component to trigger events
     * @tc.level     Level 2
     * @tc.type
     * @tc.size
     */
    it('repeatWaterFlow_0200', 0, async (done: Function) => {
      console.info('[repeatWaterFlow_0200] START');
      let waterFlowRect = CommonFunc.getComponentRectOnScreen('flowRepeat_event')
      let driver = Driver.create()
      await driver.fling({
        x: Number.parseInt(`${(waterFlowRect.right - waterFlowRect.left) * 0.5 + waterFlowRect.left}`),
        y: Number.parseInt(`${(waterFlowRect.bottom - waterFlowRect.top) * 0.6 + waterFlowRect.top}`)
      },
        {
          x: Number.parseInt(`${(waterFlowRect.right - waterFlowRect.left) * 0.5 + waterFlowRect.left}`),
          y: Number.parseInt(`${(waterFlowRect.bottom - waterFlowRect.top) * 0.2 + waterFlowRect.top}`)
        }, 5, 1000);
      await CommonFunc.sleep(2000);

      let strJson1 = getInspectorByKey('flowRepeat_onFrameBegin');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[repeatWaterFlow_0200] component obj1 is: " + JSON.stringify(obj1));
      console.info("[repeatWaterFlow_0200] onScrollFrameBegin: " + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('onScrollFrameBegin: success');

      let strJson2 = getInspectorByKey('flowRepeat_onText_1');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[repeatWaterFlow_0200] component obj2 is: " + JSON.stringify(obj2));
      console.info("[repeatWaterFlow_0200] onWillScroll: " + JSON.stringify(obj2.$attrs.content));
      expect(obj2.$attrs.content).assertEqual('onWillScroll: success');

      let strJson3 = getInspectorByKey('flowRepeat_onText_2');
      let obj3: ESObject = JSON.parse(strJson3);
      console.info("[repeatWaterFlow_0200] component obj5 is: " + JSON.stringify(obj3));
      console.info("[repeatWaterFlow_0200] onDidScroll: " + JSON.stringify(obj3.$attrs.content));
      expect(obj3.$attrs.content).assertEqual('onDidScroll: success');

      let btm: Component = await driver.findComponent(ON.id('flowRepeat_scroll'));
      await btm.click();
      await CommonFunc.sleep(5000);

      let strJson4 = getInspectorByKey('flowRepeat_onReachText');
      let obj4: ESObject = JSON.parse(strJson4);
      console.info("[repeatWaterFlow_0200] component obj2 is: " + JSON.stringify(obj4));
      console.info("[repeatWaterFlow_0200] onReachEnd: " + JSON.stringify(obj4.$attrs.content));
      expect(obj4.$attrs.content).assertEqual('onReachEnd: success');

      await CommonFunc.sleep(1000);
      console.info('[repeatWaterFlow_0200] END');
      done();
    });
  })
}
