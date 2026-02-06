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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../MainAbility/utils/Common';
import {MessageManager,Callback} from '../MainAbility/utils/MessageManager';
export default function RunMetricsTest() {
  describe('RunMetricsTest', ()=> {
    beforeEach(async (done:Function)=> {
      console.info("RunMetricsTest beforeEach start");
      let options :router.RouterOptions = {
        url: 'MainAbility/pages/RunMetrics',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RunMetricsTest state pages: " + JSON.stringify(pages));
        if (!("RunMetrics" == pages.name)) {
          console.info("get RunMetricsTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(5000);
          console.info("push RunMetricsTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RunMetricsTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number    RunMetrics
     * @tc.name      RunMetricsTest_0100
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('RunMetricsTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      console.info('RunMetricsTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('runMetrics_11'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('runMetrics_1');
      let strJson2 = getInspectorByKey('runMetrics_2');
      let strJson3 = getInspectorByKey('runMetrics_3');
      let strJson4 = getInspectorByKey('runMetrics_4');
      let strJson5 = getInspectorByKey('runMetrics_5');
      let strJson6 = getInspectorByKey('runMetrics_6');
      let strJson7 = getInspectorByKey('runMetrics_7');
      let strJson8 = getInspectorByKey('runMetrics_8');
      let strJson9 = getInspectorByKey('runMetrics_9');
      let strJson10 = getInspectorByKey('runMetrics_10');
      let obj1:ESObject = JSON.parse(strJson1);
      let obj2:ESObject = JSON.parse(strJson2);
      let obj3:ESObject = JSON.parse(strJson3);
      let obj4:ESObject = JSON.parse(strJson4);
      let obj5:ESObject = JSON.parse(strJson5);
      let obj6:ESObject = JSON.parse(strJson6);
      let obj7:ESObject = JSON.parse(strJson7);
      let obj8:ESObject = JSON.parse(strJson8);
      let obj9:ESObject = JSON.parse(strJson9);
      let obj10:ESObject = JSON.parse(strJson10);
      expect(obj1.$attrs.content).assertEqual('10');
      expect(obj2.$attrs.content).assertEqual('59');
      expect(obj3.$attrs.content).assertEqual('-10');
      expect(obj4.$attrs.content).assertEqual('50');
      expect(obj5.$attrs.content).assertEqual('10');
      expect(obj6.$attrs.content).assertEqual('15');
      expect(obj7.$attrs.content).assertEqual('1');
      expect(obj8.$attrs.content).assertEqual('5');
      expect(obj9.$attrs.content).assertEqual('1');
      expect(obj10.$attrs.content).assertEqual('-5');
      console.info('[RunMetricsTest_0100] END');
      done();
    });
  })
}