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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium";
import CommonFunc from '../../MainAbility/common/Common';
import config from '@ohos.accessibility.config';
import accessibility from '@ohos.accessibility';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.arkui.ace.information/MainAbility';

export default function loadingProgressCircularJsunit() {
  describe('loadingProgressCircularTest', () => {
    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/LoadingProgress/loadingProgress',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get loadingProgress state success " + JSON.stringify(pages));
        if (!("loadingProgress" == pages.name)) {
          console.info("get loadingProgress state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push loadingProgress page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push loadingProgress page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("loadingProgressCircular after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0011
     * @tc.name         testloadingProgressCircular0011
     * @tc.desic         aceloadingProgressCircularEtsTest0011
     */
    it('testloadingProgressCircular0011', Level.LEVEL0, async (done: Function) => {
      console.info('loadingProgressCircular testloadingProgressCircular0010 START');
      await CommonFunc.sleep(2000);
      let strJson: string = getInspectorByKey('CircularText');
      console.info("[testloadingProgressCircular0011] component textAlign strJson:" + strJson);
      expect(JSON.parse(strJson).$type).assertEqual('Text');
      expect(JSON.parse(strJson).$attrs.color).assertEqual(undefined);
      expect(JSON.parse(strJson).$attrs.width).assertEqual('100.00vp');
      expect(JSON.parse(strJson).$attrs.margin).assertEqual('5.00vp');
      console.info("[testloadingProgressCircular0011] color value :" + JSON.parse(strJson).$attrs.color);
      console.info("[testloadingProgressCircular0011] width value :" + JSON.parse(strJson).$attrs.width);
      console.info("[testloadingProgressCircular0011] margin value :" + JSON.parse(strJson).$attrs.margin);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         testloadingProgressCircular0001
     * @tc.desic         aceloadingProgressCircularEtsTest0011
     */
    it('testloadingProgressOrbital0001', Level.LEVEL0, async (done: Function) => {
      console.info('loadingProgressOrbital testloadingProgressCircular0001 START');
      await CommonFunc.sleep(2000);
      let strJson: string = getInspectorByKey('OrbitalText');
      console.info("[testloadingProgressOrbital0001] component textAlign strJson:" + strJson);
      expect(JSON.parse(strJson).$type).assertEqual('Text');
      expect(JSON.parse(strJson).$attrs.color).assertEqual(undefined);
      expect(JSON.parse(strJson).$attrs.width).assertEqual('100.00vp');
      expect(JSON.parse(strJson).$attrs.margin).assertEqual('5.00vp');
      console.info("[testloadingProgressOrbital0001] color value :" + JSON.parse(strJson).$attrs.color);
      console.info("[testloadingProgressOrbital0001] width value :" + JSON.parse(strJson).$attrs.width);
      console.info("[testloadingProgressOrbital0001] margin value :" + JSON.parse(strJson).$attrs.margin);
      done();
    });
  })
}
