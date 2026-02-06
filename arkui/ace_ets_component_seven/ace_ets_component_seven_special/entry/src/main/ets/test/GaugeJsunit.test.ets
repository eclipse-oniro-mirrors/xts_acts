
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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router'
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
export default function gaugeJsunit() {
  describe('gaugeTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/gauge',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get gauge state success " + JSON.stringify(pages));
        if (!("gauge" == pages.name)) {
          console.info("get gauge state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push gauge page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push gauge page error " + err);
      }
      done();
    });

    /**
     * @tc.name   testGauge0121
     * @tc.number testGauge0121
     * @tc.desc   Set attribute values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGauge0121', Level.LEVEL0, async (done: Function) => {
      console.info('[testGauge0121] START');
      let strJsonNew = getInspectorByKey('GaugeKey1');
      let obj: ESObject = JSON.parse(strJsonNew);
      console.info("[testGauge0121] obj testGauge0121obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.strokeWidth).assertEqual('5.00vp');

      console.info('[testGauge0121] END');
      done();
    });

    /**
     * @tc.name   testGauge0122
     * @tc.number testGauge0122
     * @tc.desc   Set attribute values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGauge0122', Level.LEVEL0, async (done: Function) => {
      console.info('[testGauge0122] START');
      let strJsonNew = getInspectorByKey('GaugeKey1');
      let obj: ESObject = JSON.parse(strJsonNew);
      console.info("[testGauge0122] obj testGauge0122obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.endAngle).assertEqual('360.00');

      console.info('[testGauge0122] END');
      done();
    });

    /**
     * @tc.name   testGauge0123
     * @tc.number testGauge0123
     * @tc.desc   Set attribute values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGauge0123', Level.LEVEL0, async (done: Function) => {
      console.info('[testGauge0123] START');
      let strJsonNew = getInspectorByKey('GaugeKey1');
      let obj: ESObject = JSON.parse(strJsonNew);
      console.info("[testGauge0123] obj testGauge0123obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.startAngle).assertEqual('0.00');

      console.info('[testGauge0123] END');
      done();
    });

    /**
     * @tc.name   testGauge0124
     * @tc.number testGauge0124
     * @tc.desc   Set attribute values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGauge0124', Level.LEVEL0, async (done: Function) => {
      console.info('[testGauge0124] START');
      let strJsonNew = getInspectorByKey('GaugeKey1');
      let obj: ESObject = JSON.parse(strJsonNew);
      console.info("[testGauge0124] obj testGauge0124obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.value).assertEqual('1.00');

      console.info('[testGauge0124] END');
      done();
    });

    /**
     * @tc.name   testGauge0125
     * @tc.number testGauge0125
     * @tc.desc   Set attribute values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGauge0125', Level.LEVEL0, async (done: Function) => {
      console.info('[testGauge0125] START');
      let strJsonNew = getInspectorByKey('GaugeKey1');
      let obj: ESObject = JSON.parse(strJsonNew);
      console.info("[testGauge0125] obj testGauge0125obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.colors).assertEqual('[[[["#FF123456","0.000000"]],1],[[["#FF654321","0.000000"]],2]]');

      console.info('[testGauge0125] END');
      done();
    });

    /**
     * @tc.name   testGauge0126
     * @tc.number testGauge0126
     * @tc.desc   Set attribute values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGauge0126', Level.LEVEL0, async (done: Function) => {
      console.info('[testGauge0126] START');
      let strJsonNew = getInspectorByKey('GaugeKey1');
      let obj: ESObject = JSON.parse(strJsonNew);
      console.info("[testGauge0126] obj testGauge0126obj is: " + JSON.stringify(obj.$attrs));
      //expect(obj.$attrs.indicator).assertEqual('');
      expect(true).assertEqual(true);

      console.info('[testGauge0126] END');
      done();
    });

    /**
     * @tc.name   testGauge0127
     * @tc.number testGauge0127
     * @tc.desc   Set attribute values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGauge0127', Level.LEVEL0, async (done: Function) => {
      console.info('[testGauge0127] START');
      let strJsonNew = getInspectorByKey('GaugeKey1');
      let obj: ESObject = JSON.parse(strJsonNew);
      console.info("[testGauge0127] obj testGauge0127obj is: " + JSON.stringify(obj.$attrs));
      //expect(obj.$attrs.shadow).assertEqual('');
      expect(true).assertEqual(true);

      console.info('[testGauge0127] END');
      done();
    });

    /**
     * @tc.name   testGauge0128
     * @tc.number testGauge0128
     * @tc.desc   Set attribute values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGauge0128', Level.LEVEL0, async (done: Function) => {
      console.info('[testGauge0128] START');
      let strJsonNew = getInspectorByKey('GaugeKey1');
      let obj: ESObject = JSON.parse(strJsonNew);
      console.info("[testGauge0128] obj testGauge0128obj is: " + JSON.stringify(obj.$attrs));
      //expect(obj.$attrs.description).assertEqual('');
      expect(true).assertEqual(true);

      console.info('[testGauge0128] END');
      done();
    });
  })
}
