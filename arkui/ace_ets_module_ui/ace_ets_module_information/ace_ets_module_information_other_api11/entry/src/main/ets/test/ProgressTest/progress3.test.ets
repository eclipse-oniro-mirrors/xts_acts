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
const BUNDLE_NAME = 'com.arkui.ace.information.other/MainAbility';

export default function progressScaleCountJsunit() {
  describe('progressScaleCountTest', () => {
    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Progress/progress3',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get progress state success " + JSON.stringify(pages));
        if (!("progress" == pages.name)) {
          console.info("get progress state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push progress page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push progress page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("progressScaleCount after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         testprogressScaleCount0001
     * @tc.desic         aceprogressScaleCountEtsTest0001
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

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0002
     * @tc.name         testprogressScaleCount0002
     * @tc.desic         aceprogressScaleCountEtsTest0002
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
