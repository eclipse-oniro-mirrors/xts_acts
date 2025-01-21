/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import router from '@system.router';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "hypium/index"
import Utils from './Utils.ets'

export default function gaugeColorsJsunit() {
  describe('gaugeColorsTest', function () {
    beforeAll(async function (done) {
      console.info("flex beforeEach start");
      let options = {
        uri: 'pages/gauge',
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
        console.error("push gauge page error: " + err);
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("gaugeColors after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         testgaugeColors0001
     * @tc.desic         acegaugeColorsEtsTest0001
     */
    it('testgaugeColors0001', 0, async function (done) {
      console.info('gaugeColors testgaugeColors0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('Gauge');
      console.info("[testgaugeColors0001] component width strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Gauge');
      expect(obj.$attrs.width).assertEqual("200.00vp");
      console.info("[testgaugeColors0001] width value :" + obj.$attrs.width);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0002
     * @tc.name         testgaugeColors0002
     * @tc.desic         acegaugeColorsEtsTest0002
     */
    it('testgaugeColors0002', 0, async function (done) {
      console.info('gaugeColors testgaugeColors0002 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('Gauge');
      console.info("[testgaugeColors0002] component height strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Gauge');
      expect(obj.$attrs.height).assertEqual("200.00vp");
      console.info("[testgaugeColors0002] height value :" + obj.$attrs.height);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0003
     * @tc.name         testgaugeColors0003
     * @tc.desic         acegaugeColorsEtsTest0003
     */
    it('testgaugeColors0003', 0, async function (done) {
      console.info('gaugeColors testgaugeColors0003 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('Gauge');
      console.info("[testgaugeColors0003] component startAngle strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Gauge');
      expect(obj.$attrs.startAngle).assertEqual("210.00");
      console.info("[testgaugeColors0003] startAngle value :" + obj.$attrs.startAngle);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0004
     * @tc.name         testgaugeColors0004
     * @tc.desic         acegaugeColorsEtsTest0004
     */
    it('testgaugeColors0004', 0, async function (done) {
      console.info('gaugeColors testgaugeColors0004 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('Gauge');
      console.info("[testgaugeColors0004] component endAngle strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Gauge');
      expect(obj.$attrs.endAngle).assertEqual("150.00");
      console.info("[testgaugeColors0004] endAngle value :" + obj.$attrs.endAngle);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0005
     * @tc.name         testgaugeColors0005
     * @tc.desic         acegaugeColorsEtsTest0005
     */
    it('testgaugeColors0005', 0, async function (done) {
      console.info('gaugeColors testgaugeColors0005 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('Gauge');
      console.info("[testgaugeColors0005] component strokeWidth strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Gauge');
      expect(obj.$attrs.strokeWidth).assertEqual("20.00vp");
      console.info("[testgaugeColors0005] strokeWidth value :" + obj.$attrs.strokeWidth);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0006
     * @tc.name         testgaugeColors0006
     * @tc.desic         acegaugeColorsEtsTest0006
     */
    it('testgaugeColors0006', 0, async function (done) {
      console.info('gaugeColors testgaugeColors0006 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('Gauge');
      console.info("[testgaugeColors0006] component colors strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Gauge');
      expect(obj.$attrs.colors).assertEqual('[["#FF317AF7",1],["#FF5BA854",1],["#FFE08C3A",1],["#FF9C554B",1],["#FFD94838",1]]');
      console.info("[testgaugeColors0006] colors value :" + obj.$attrs.colors);
      done();
    });
  })
}
