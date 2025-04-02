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
import CommonFunc from '../MainAbility/utils/Common';
import {MessageManager,Callback} from '../MainAbility/utils/MessageManager';
export default function LineMetricsTwoTest() {
  describe('LineMetricsTwoTest', ()=> {
    beforeEach(async (done:Function)=> {
      let beforeEachMsg = " ====beforeEach===="
      console.info( beforeEachMsg + " 1 ");
      let options :router.RouterOptions= {
        url: 'MainAbility/pages/LineMetricsTwo',
      }
      let result = await router.push(options);
      console.info( beforeEachMsg + " 2 ");
      await CommonFunc.sleep(5000);
      done();
    });
    /**
     * @tc.number    SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_002
     * @tc.name      testLineMetricsTest_2
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('testLineMetricsTest_2', 0, async (done:Function)=> {
      let msg  = "====testLineMetricsTest_2===="
      console.info('testLineMetricsTest_2 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('LineMetrics_4'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('LineMetrics_1');
      let strJson2 = getInspectorByKey('LineMetrics_2');
      let strJson3 = getInspectorByKey('LineMetrics_3');
      let strJson5 = getInspectorByKey('LineMetrics_5');
      let strJson6 = getInspectorByKey('LineMetrics_6');
      let obj1:ESObject = JSON.parse(strJson1);
      let obj2:ESObject = JSON.parse(strJson2);
      let obj3:ESObject = JSON.parse(strJson3);
      let obj5:ESObject = JSON.parse(strJson5);
      let obj6:ESObject = JSON.parse(strJson6);
      expect(obj1.$attrs.content).assertEqual('1');
      expect(obj2.$attrs.content).assertEqual('7');
      expect(obj3.$attrs.content).assertEqual('10');
      expect(obj5.$attrs.content).assertEqual('5');
      expect(obj6.$attrs.content).assertEqual('6');
      console.log(msg + " obj5.$attrs.content: " + obj5.$attrs.content)
      console.log(msg + " obj6.$attrs.content: " + obj6.$attrs.content)
      console.info('[LineMetricsTest_0200] END');
      expect(true).assertTrue()
      done();
    });
  })
}

