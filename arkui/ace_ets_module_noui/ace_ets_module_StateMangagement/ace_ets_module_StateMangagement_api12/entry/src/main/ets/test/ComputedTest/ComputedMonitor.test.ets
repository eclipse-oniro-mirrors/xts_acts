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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import {MessageManager,Callback} from '../../MainAbility/common/MessageManager';
export default function ComputedMonitorTest() {
  describe('ComputedMonitorTest', () => {
    beforeEach(async (done: Function) => {
      console.info("ComputedMonitorTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Computed/computedMonitor',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ComputedMonitorTest state pages: " + JSON.stringify(pages));
        if (!("computedMonitor" == pages.name)) {
          console.info("get ComputedMonitorTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push ComputedMonitorTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ComputedMonitorTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number    SUB_ACE_STATUSMANAGER_COMPUTE_0350
     * @tc.name      ComputedMonitorTest_0100
     * @tc.desc      api
     * @tc.level:    Level 0
     * @tc.type :    FUNC
     * @tc.size :    MEDIUM
     */
    it('ComputedMonitorTest_0100', 0, async (done: Function) => {
      console.info('ComputedMonitorTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let button = await driver.findComponent(ON.id('CompuutedMonitorButton2'));
      await button.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('CompuutedMonitorText1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ComputedMonitorTest_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('Celsius 21.0');

      strJson = getInspectorByKey('CompuutedMonitorText2');
      obj = JSON.parse(strJson);
      console.info("[ComputedMonitorTest_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('Fahrenheit 69.80');

      strJson = getInspectorByKey('CompuutedMonitorText3');
      obj = JSON.parse(strJson);
      console.info("[ComputedMonitorTest_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('Kelvin 294.15');

      strJson = getInspectorByKey('CompuutedMonitorText4');
      obj = JSON.parse(strJson);
      console.info("[ComputedMonitorTest_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('2');

      strJson = getInspectorByKey('CompuutedMonitorText5');
      obj = JSON.parse(strJson);
      console.info("[ComputedMonitorTest_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('2');

      button = await driver.findComponent(ON.id('CompuutedMonitorButton1'));
      await button.click();
      await CommonFunc.sleep(1000);

      strJson = getInspectorByKey('CompuutedMonitorText1');
      obj = JSON.parse(strJson);
      console.info("[ComputedMonitorTest_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('Celsius 20.0');

      strJson = getInspectorByKey('CompuutedMonitorText2');
      obj = JSON.parse(strJson);
      console.info("[ComputedMonitorTest_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('Fahrenheit 68.00');

      strJson = getInspectorByKey('CompuutedMonitorText3');
      obj = JSON.parse(strJson);
      console.info("[ComputedMonitorTest_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('Kelvin 293.15');

      strJson = getInspectorByKey('CompuutedMonitorText4');
      obj = JSON.parse(strJson);
      console.info("[ComputedMonitorTest_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('3');

      strJson = getInspectorByKey('CompuutedMonitorText5');
      obj = JSON.parse(strJson);
      console.info("[ComputedMonitorTest_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('3');

      console.info('[ComputedMonitorTest_0100] END');
      done();
    });
  })
}

