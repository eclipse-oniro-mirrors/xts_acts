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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium";
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import { UiDriver, UiComponent, BY, Driver, Component, ON } from '@ohos.UiTest'

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
          await router.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push gauge page error " + err);
      }
      done();
    });

    /**
     * @tc.number testGauge0121
     * @tc.name Test the properties of components
     * @tc.desc Set strokeWidth values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testGauge0121', 0, async (done: Function) => {
      console.info('[testGauge0121] START');
      let strJsonNew = getInspectorByKey('GaugeKey1');

      console.info("[testGauge0121] JSON.parse(strJsonNew) testGauge0121JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)
        .$attrs));
      expect(JSON.parse(strJsonNew).$attrs.strokeWidth).assertEqual('5.00vp');

      console.info('[testGauge0121] END');
      done();
    });

    /**
     * @tc.number testGauge0122
     * @tc.name Test the properties of components
     * @tc.desc Set endAngle values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testGauge0122', 0, async (done: Function) => {
      console.info('[testGauge0122] START');
      let strJsonNew = getInspectorByKey('GaugeKey1');

      console.info("[testGauge0122] JSON.parse(strJsonNew) testGauge0122JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)
        .$attrs));
      expect(JSON.parse(strJsonNew).$attrs.endAngle).assertEqual('360.00');

      console.info('[testGauge0122] END');
      done();
    });

    /**
     * @tc.number testGauge0123
     * @tc.name Test the properties of components
     * @tc.desc Set startAngle values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testGauge0123', 0, async (done: Function) => {
      console.info('[testGauge0123] START');
      let strJsonNew = getInspectorByKey('GaugeKey1');

      console.info("[testGauge0123] JSON.parse(strJsonNew) testGauge0123JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)
        .$attrs));
      expect(JSON.parse(strJsonNew).$attrs.startAngle).assertEqual('0.00');

      console.info('[testGauge0123] END');
      done();
    });

    /**
     * @tc.number testGauge0124
     * @tc.name Test the properties of components
     * @tc.desc Set value values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testGauge0124', 0, async (done: Function) => {
      console.info('[testGauge0124] START');
      let strJsonNew = getInspectorByKey('GaugeKey1');

      console.info("[testGauge0124] JSON.parse(strJsonNew) testGauge0124JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)
        .$attrs));
      expect(JSON.parse(strJsonNew).$attrs.value).assertEqual('1.00');

      console.info('[testGauge0124] END');
      done();
    });

    /**
     * @tc.number testGauge0125
     * @tc.name Test the properties of components
     * @tc.desc Set colors values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testGauge0125', 0, async (done: Function) => {
      console.info('[testGauge0125] START');
      let strJsonNew = getInspectorByKey('GaugeKey1');

      console.info("[testGauge0125] JSON.parse(strJsonNew) testGauge0125JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)
        .$attrs));
      expect(JSON.parse(strJsonNew).$attrs.colors).assertEqual('[[[["#FF123456","0.000000"]],1],[[["#FF654321","0.000000"]],2]]');

      console.info('[testGauge0125] END');
      done();
    });

    /**
     * @tc.number testGauge0126
     * @tc.name Test the properties of components
     * @tc.desc Set indicator values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testGauge0126', 0, async (done: Function) => {
      console.info('[testGauge0126] START');
      let strJsonNew = getInspectorByKey('GaugeKey1');

      console.info("[testGauge0126] JSON.parse(strJsonNew) testGauge0126JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)
        .$attrs));
      let indicator: ESObject = JSON.parse(strJsonNew).$attrs.indicator;
      expect(indicator?.icon).assertEqual("abc");
      expect(indicator?.space).assertEqual("15.00px");
      console.info('[testGauge0126] END');
      done();
    });

    /**
     * @tc.number testGauge0127
     * @tc.name Test the properties of components
     * @tc.desc Set shadow values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testGauge0127', 0, async (done: Function) => {
      console.info('[testGauge0127] START');
      let strJsonNew = getInspectorByKey('GaugeKey1');

      console.info("[testGauge0127] JSON.parse(strJsonNew) testGauge0127JSON.parse(strJsonNew) is: " + JSON.stringify(JSON.parse(strJsonNew)
        .$attrs));
      let trackShadow: ESObject = JSON.parse(strJsonNew).$attrs.trackShadow;
      expect(Number(trackShadow?.radius)).assertEqual(5);
      expect(Number(trackShadow?.offsetX)).assertEqual(15);
      expect(Number(trackShadow?.offsetY)).assertEqual(15);
      console.info('[testGauge0127] END');
      done();
    });

    /**
     * @tc.number testGauge0128
     * @tc.name Test the properties of components
     * @tc.desc Set shadow values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testGauge0128', 0, async (done: Function) => {
      console.info('[testGauge0128] START');
      let strJsonNew = getInspectorByKey('GaugeKey1');

      console.info("[testGauge0128] JSON.parse(strJsonNew) testGauge0128 is: " + JSON.stringify(JSON.parse(strJsonNew)
        .$attrs));

      expect(JSON.parse(strJsonNew).$attrs.description).assertEqual(undefined);
      console.info('[testGauge0128] END');
      done();
    });

    /**
     * @tc.number testGauge0129
     * @tc.name Test the properties of components
     * @tc.desc Change strokeWidth values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testGauge0129', 0, async (done: Function) => {
      console.info('testGauge0129 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('changeButton'));
      await button.click();
      await Utils.sleep(2000)

      let strJsonNew = getInspectorByKey('GaugeKey1');
      console.info("testGauge0129 component  is: " + JSON.stringify(JSON.parse(strJsonNew).$attrs));
      expect(JSON.parse(strJsonNew).$attrs.strokeWidth).assertEqual('5.00vp');
      console.info('testGauge0129 END');
      done();
    });
  })
}
