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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import CommonFunc from '../../MainAbility/common/Common';

export default function gaugeColorsJsunit() {
  describe('gaugeColorsTest', () => {
    beforeAll(async () => {
      console.info("gaugeColors beforeAll start");
      let options: router.RouterOptions  = {
        url: 'MainAbility/pages/Gauge/gauge',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get gauge state success " + JSON.stringify(pages));
        if (!("gauge" == pages.name)) {
          console.info("get gauge state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push gauge page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push gauge page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("gaugeColors after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         testgaugeColors0001
     * @tc.desic         acegaugeColorsEtsTest0001
     */
    it('testgaugeColors0001', 0, async () => {
      console.info('gaugeColors testgaugeColors0001 START');
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('Gauge');
      console.info("[testgaugeColors0001] component width strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Gauge');
      expect(JSON.parse(strJson).$attrs.width).assertEqual("200.00vp");
      console.info("[testgaugeColors0001] width value :" + JSON.parse(strJson).$attrs.width);

    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0002
     * @tc.name         testgaugeColors0002
     * @tc.desic         acegaugeColorsEtsTest0002
     */
    it('testgaugeColors0002', 0, async () => {
      console.info('gaugeColors testgaugeColors0002 START');
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('Gauge');
      console.info("[testgaugeColors0002] component height strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Gauge');
      expect(JSON.parse(strJson).$attrs.height).assertEqual("200.00vp");
      console.info("[testgaugeColors0002] height value :" + JSON.parse(strJson).$attrs.height);

    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0003
     * @tc.name         testgaugeColors0003
     * @tc.desic         acegaugeColorsEtsTest0003
     */
    it('testgaugeColors0003', 0, async () => {
      console.info('gaugeColors testgaugeColors0003 START');
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('Gauge');
      console.info("[testgaugeColors0003] component startAngle strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Gauge');
      expect(JSON.parse(strJson).$attrs.startAngle).assertEqual("210.00");
      console.info("[testgaugeColors0003] startAngle value :" + JSON.parse(strJson).$attrs.startAngle);

    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0004
     * @tc.name         testgaugeColors0004
     * @tc.desic         acegaugeColorsEtsTest0004
     */
    it('testgaugeColors0004', 0, async () => {
      console.info('gaugeColors testgaugeColors0004 START');
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('Gauge');
      console.info("[testgaugeColors0004] component endAngle strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Gauge');
      expect(JSON.parse(strJson).$attrs.endAngle).assertEqual("150.00");
      console.info("[testgaugeColors0004] endAngle value :" + JSON.parse(strJson).$attrs.endAngle);

    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0005
     * @tc.name         testgaugeColors0005
     * @tc.desic         acegaugeColorsEtsTest0005
     */
    it('testgaugeColors0005', 0, async () => {
      console.info('gaugeColors testgaugeColors0005 START');
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('Gauge');
      console.info("[testgaugeColors0005] component strokeWidth strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Gauge');
      expect(JSON.parse(strJson).$attrs.strokeWidth).assertEqual("20.00vp");
      console.info("[testgaugeColors0005] strokeWidth value :" + JSON.parse(strJson).$attrs.strokeWidth);

    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0006
     * @tc.name         testgaugeColors0006
     * @tc.desic         acegaugeColorsEtsTest0006
     */
    it('testgaugeColors0006', 0, async () => {
      console.info('gaugeColors testgaugeColors0006 START');
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('Gauge');
      console.info("[testgaugeColors0006] component colors strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Gauge');
      expect(JSON.parse(strJson).$attrs.colors)
        .assertEqual('[[[["#FF317AF7","0.000000"]],1],[[["#FF5BA854","0.000000"]],1],[[["#FFE08C3A","0.000000"]],1],[[["#FF9C554B","0.000000"]],1],[[["#FFD94838","0.000000"]],1]]');
      console.info("[testgaugeColors0006] colors value :" + JSON.parse(strJson).$attrs.colors);

    });
  })
}
