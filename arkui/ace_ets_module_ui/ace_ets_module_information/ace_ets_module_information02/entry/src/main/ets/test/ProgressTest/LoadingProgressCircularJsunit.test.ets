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

export default function LoadingProgressCircularJsunit() {
  describe('LoadingProgressCircularJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Progress/LoadingProgressCircularJsunit',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get LoadingProgressCircularJsunit state success " + JSON.stringify(pages));
        if (!("LoadingProgressCircularJsunit" == pages.name)) {
          console.info("get LoadingProgressCircularJsunit state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push LoadingProgressCircularJsunit page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push LoadingProgressCircularJsunit page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("LoadingProgressCircularJsunit after each called");
    });

    /**
     * @tc.name   testloadingProgressCircular0011
     * @tc.number SUB_ACE_BASIC_ETS_API_0011
     * @tc.desc   aceloadingProgressCircularEtsTest0011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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

    /**
     * @tc.name   testloadingProgressOrbital0001
     * @tc.number SUB_ACE_BASIC_ETS_API_0001
     * @tc.desc   aceloadingProgressCircularEtsTest0011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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

    /**
     * @tc.name   testLoadingProgressStyle001
     * @tc.number SUB_ACE_BASIC_ETS_API_LOADING_PROGRESS_STYLE_001
     * @tc.desc   testLoadingProgressStyle enum default
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testLoadingProgressStyle001', Level.LEVEL3, async (done: Function) => {
      expect(LoadingProgressStyle.Default).assertEqual(1)
      done();
    });

    /**
     * @tc.name   testLoadingProgressStyle002
     * @tc.number SUB_ACE_BASIC_ETS_API_LOADING_PROGRESS_STYLE_002
     * @tc.desc   testLoadingProgressStyle enum Circular
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testLoadingProgressStyle002', Level.LEVEL3, async (done: Function) => {
      expect(LoadingProgressStyle.Circular).assertEqual(2)
      done();
    });

    /**
     * @tc.name   testLoadingProgressStyle003
     * @tc.number SUB_ACE_BASIC_ETS_API_LOADING_PROGRESS_STYLE_003
     * @tc.desc   testLoadingProgressStyle enum Orbital
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testLoadingProgressStyle003', Level.LEVEL3, async (done: Function) => {
      expect(LoadingProgressStyle.Orbital).assertEqual(3)
      done();
    });
  })
}
