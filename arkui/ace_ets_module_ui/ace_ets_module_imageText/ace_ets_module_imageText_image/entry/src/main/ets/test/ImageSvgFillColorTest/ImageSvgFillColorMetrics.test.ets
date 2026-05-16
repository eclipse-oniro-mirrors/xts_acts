/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import { Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function ImageSvgFillColorMetricsTest() {
  describe('ImageSvgFillColorMetricsTest', () => {
    beforeEach(async (done: Function) => {
      console.info('ImageSvgFillColorMetricsTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ImageSvgFillColor/ImageSvgFillColorMetrics',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get ImageSvgFillColorMetricsTest state success ' + JSON.stringify(pages));
        if (!('ImageSvgFillColorMetrics' == pages.name)) {
          console.info('get ImageSvgFillColorMetricsTest state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          await CommonFunc.sleep(2000);
          console.info('push ImageSvgFillColorMetricsTest page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push ImageSvgFillColorMetricsTest page error ' + JSON.stringify(err));
      }
      console.info('ImageSvgFillColorMetricsTest beforeEach start');
      done();
    })
    /**
     * @tc.name   ImageSVGFillColorMetricsTest_001
     * @tc.number ImageSVGFillColorMetricsTest_001
     * @tc.desc   set Image FillColorMetrics: sRGBBlue: ColorMetrics  #FF004AAF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageSVGFillColorMetricsTest_001', Level.LEVEL1, async (done: Function) => {
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('fillColorMetrics');
      let obj: ESObject = JSON.parse(strJson);
      console.info('ImageSVGFillColorMetricsTest_001 FillColorMetrics is: ' + obj.$attrs.fillColor);
      expect(obj.$attrs.fillColor).assertEqual('#FF004AAF');
      done();
    });
  })
}
