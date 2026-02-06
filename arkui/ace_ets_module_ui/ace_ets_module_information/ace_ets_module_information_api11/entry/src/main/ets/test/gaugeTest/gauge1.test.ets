/*
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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium";
import CommonFunc from '../../MainAbility/common/Common';
import config from '@ohos.accessibility.config';
import accessibility from '@ohos.accessibility';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.arkui.ace.information/MainAbility';

export default function gaugeColorsJsunit() {
  describe('gaugeColorsTest', () => {
    beforeAll(async () => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/gauge/gauge1',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get gauge state success " + JSON.stringify(pages));
        if (!("gauge1" == pages.name)) {
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

    /**
     * @tc.name   testgaugeColors0001
     * @tc.number SUB_ACE_BASIC_ETS_API_0001
     * @tc.desc   testgaugeColors0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testgaugeColors0001', Level.LEVEL0, async () => {
      console.info('gaugeColors testgaugeColors0001 START');
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('Gauge');
      console.info("[testgaugeColors0001] component width strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Gauge');
      expect(JSON.parse(strJson).$attrs.width).assertEqual("200.00vp");
      console.info("[testgaugeColors0001] width value :" + JSON.parse(strJson).$attrs.width);

    });

    /**
     * @tc.name   testgaugeColors0002
     * @tc.number SUB_ACE_BASIC_ETS_API_0002
     * @tc.desc   testgaugeColors0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testgaugeColors0002', Level.LEVEL0, async () => {
      console.info('gaugeColors testgaugeColors0002 START');
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('Gauge');
      console.info("[testgaugeColors0002] component height strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Gauge');
      expect(JSON.parse(strJson).$attrs.height).assertEqual("200.00vp");
      console.info("[testgaugeColors0002] height value :" + JSON.parse(strJson).$attrs.height);

    });

    /**
     * @tc.name   testgaugeColors0003
     * @tc.number SUB_ACE_BASIC_ETS_API_0003
     * @tc.desc   testgaugeColors0003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testgaugeColors0003', Level.LEVEL0, async () => {
      console.info('gaugeColors testgaugeColors0003 START');
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('Gauge');
      console.info("[testgaugeColors0003] component startAngle strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Gauge');
      expect(JSON.parse(strJson).$attrs.startAngle).assertEqual("210.00");
      console.info("[testgaugeColors0003] startAngle value :" + JSON.parse(strJson).$attrs.startAngle);

    });

    /**
     * @tc.name   testgaugeColors0004
     * @tc.number SUB_ACE_BASIC_ETS_API_0004
     * @tc.desc   testgaugeColors0004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testgaugeColors0004', Level.LEVEL0, async () => {
      console.info('gaugeColors testgaugeColors0004 START');
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('Gauge');
      console.info("[testgaugeColors0004] component endAngle strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Gauge');
      expect(JSON.parse(strJson).$attrs.endAngle).assertEqual("150.00");
      console.info("[testgaugeColors0004] endAngle value :" + JSON.parse(strJson).$attrs.endAngle);

    });

    /**
     * @tc.name   testgaugeColors0005
     * @tc.number SUB_ACE_BASIC_ETS_API_0005
     * @tc.desc   testgaugeColors0005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testgaugeColors0005', Level.LEVEL0, async () => {
      console.info('gaugeColors testgaugeColors0005 START');
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('Gauge');
      console.info("[testgaugeColors0005] component strokeWidth strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Gauge');
      expect(JSON.parse(strJson).$attrs.strokeWidth).assertEqual("20.00vp");
      console.info("[testgaugeColors0005] strokeWidth value :" + JSON.parse(strJson).$attrs.strokeWidth);

    });

    /**
     * @tc.name   testgaugeColors0006
     * @tc.number SUB_ACE_BASIC_ETS_API_0006
     * @tc.desc   testgaugeColors0006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testgaugeColors0006', Level.LEVEL0, async () => {
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
