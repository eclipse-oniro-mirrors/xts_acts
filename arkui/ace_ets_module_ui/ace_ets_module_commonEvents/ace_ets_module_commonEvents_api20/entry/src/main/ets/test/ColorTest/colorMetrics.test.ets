/*
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
 import {describe, beforeAll, beforeEach, afterEach, it, expect, Level} from '@ohos/hypium'
import {UiComponent, UiDriver, Component, Driver, ON, BY, } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
export default function colorMetricsTest() {
  describe('colorMetricsTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Color/colorMetrics',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get colorMetricsTest state pages: ' + JSON.stringify(pages));
        if (!('colorMetrics' == pages.name)) {
          console.info('get colorMetricsTest state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info('push colorMetricsTest success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push colorMetrics page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('colorMetrics after each called');
    });
    /**
     * @tc.name   colorMetricsTest_0010
     * @tc.number colorMetricsTest_0010
     * @tc.desc   backgroundColor test succ
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('colorMetricsTest_0010', Level.LEVEL1, async (done: Function) => {
      console.info('colorMetricsTest_0010 START');
      let driver = await Driver.create();

      let text = await driver.findComponent(ON.id('P3backgroundColor'));
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('P3backgroundColor');
      let obj: ESObject = JSON.parse(strJson);

      console.info('[colorMetricsTest_0010] backgroundColor: ' + JSON.stringify(obj.$attrs.backgroundColor));
      expect(obj.$attrs.backgroundColor).assertEqual('#FF00FF00');
      console.info('[colorMetricsTest_0010] END');
      done();
    });

    /**
     * @tc.name   colorMetricsTest_0020
     * @tc.number colorMetricsTest_0020
     * @tc.desc   SweepGradient test succ
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('colorMetricsTest_0020', Level.LEVEL1, async (done: Function) => {
      console.info('colorMetricsTest_0020 START');
      let driver = await Driver.create();

      let text1 = await driver.findComponent(ON.id('P3SweepGradient'));
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('P3SweepGradient');
      let obj: ESObject = JSON.parse(strJson);

      console.info('[colorMetricsTest_0020] SweepGradient: ' + JSON.stringify(obj.$attrs.sweepGradient.colors));
      expect(JSON.stringify(obj.$attrs.sweepGradient.colors)).assertEqual('[["#FF00FF00","0.000000"],["#FF00FF00","0.500000"],["#FF00FF00","1.000000"]]');
      console.info('[colorMetricsTest_0020] END');
      done();
    });
  })
}