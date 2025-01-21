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
import Utils from './Utils.ets'

export default function fillModeForwardJsunit() {
  describe('fillModeForwardTest', () => {
    beforeEach(async (done: Function) => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/fill_mode',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get fill_mode state success " + JSON.stringify(pages));
        if (!("fill_mode" == pages.name)) {
          console.info("get fill_mode state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push fill_mode page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push fill_mode page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("fillModeForward after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         testfillModeForward0001
     * @tc.desic         acefillModeForwardEtsTest0001
     */
    it('testfillModeForward0001', 0, async (done: Function) => {
      console.info('fillModeForward testfillModeForward0001 START');
      await Utils.sleep(2000);
      let strJson: string = getInspectorByKey('ImageAnimator');
      console.info("[testfillModeForward0001] component fillMode strJson:" + strJson);
      expect(JSON.parse(strJson).$type).assertEqual('ImageAnimator');
      expect(JSON.parse(strJson).$attrs.fillMode).assertEqual("FillMode.Forwards");
      console.info("[testfillModeForward0001] fillMode value :" + JSON.parse(strJson).$attrs.fillMode);
      done();
    });
  })
}
