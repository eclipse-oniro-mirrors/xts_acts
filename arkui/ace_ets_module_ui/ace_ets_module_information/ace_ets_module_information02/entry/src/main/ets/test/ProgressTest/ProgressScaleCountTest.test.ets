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

export default function ProgressScaleCountTest() {
  describe('ProgressScaleCountTest', () => {
    beforeEach(async (done: Function) => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Progress/ProgressScaleCountTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ProgressScaleCountTest state success " + JSON.stringify(pages));
        if (!("ProgressScaleCountTest" == pages.name)) {
          console.info("get ProgressScaleCountTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ProgressScaleCountTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ProgressScaleCountTest page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ProgressScaleCountTest after each called");
    });

    /**
     * @tc.name   testprogressScaleCount0001
     * @tc.number SUB_ACE_BASIC_ETS_API_testprogressScaleCount0001
     * @tc.desc   aceprogressScaleCountEtsTest0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testprogressScaleCount0001', Level.LEVEL0, async (done: Function) => {
      console.info('progressScaleCount testprogressScaleCount0001 START');
      await CommonFunc.sleep(2000);
      let strJson: string = getInspectorByKey('progressStyleOptions');
      console.info("[testprogressScaleCount0001] component width strJson:" + strJson);
      expect(JSON.parse(strJson).$type).assertEqual('Progress');
      console.info("[testprogressScaleCount0001] style.scaleCount value :" + JSON.parse(strJson).$attrs.style);
      expect(JSON.parse(JSON.parse(strJson).$attrs.style).scaleCount).assertEqual("15");
      done();
    });

    /**
     * @tc.name   testprogressScaleCount0002
     * @tc.number SUB_ACE_BASIC_ETS_API_testprogressScaleCount0002
     * @tc.desc   aceprogressScaleCountEtsTest0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testprogressScaleCount0002', Level.LEVEL0, async (done: Function) => {
      console.info('progressScaleCount testprogressScaleCount0002 START');
      await CommonFunc.sleep(2000);
      let strJson: string = getInspectorByKey('progressStyleOptions');
      console.info("[testprogressScaleCount0002] component height strJson:" + strJson);
      expect(JSON.parse(strJson).$type).assertEqual('Progress');
      console.info("[testprogressScaleCount0002] style.scaleWidth value :" + JSON.parse(strJson).$attrs.style);
      expect(JSON.parse(JSON.parse(strJson).$attrs.style).scaleWidth).assertEqual('5.00vp');
      done();
    });
  })
}
