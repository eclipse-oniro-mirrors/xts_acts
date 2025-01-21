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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "@ohos/hypium"
import Utils from './Utils.ets'

export default function rectNeJsunit() {
  describe('rectNeTest', function () {
    beforeAll(async function (done) {
      console.info("flex beforeEach start");
      let options = {
        uri: 'MainAbility/pages/rect',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get rect state success " + JSON.stringify(pages));
        if (!("rect" == pages.name)) {
          console.info("get rect state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push rect page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push rect page error: " + err);
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("rectNe after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         testrectNe0001
     * @tc.desic         acerectNeEtsTest0001
     */
    it('testrectNe0001', 0, async function (done) {
      console.info('rectNe testrectNe0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('Rect');
      console.info("[testrectNe0001] component width strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Rect');
      expect(obj.$attrs.width).assertEqual("90.00%");
      console.info("[testrectNe0001] width value :" + obj.$attrs.width);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0002
     * @tc.name         testrectNe0002
     * @tc.desic         acerectNeEtsTest0002
     */
    it('testrectNe0002', 0, async function (done) {
      console.info('rectNe testrectNe0002 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('Rect');
      console.info("[testrectNe0002] component height strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Rect');
      expect(obj.$attrs.height).assertEqual("50.00px");
      console.info("[testrectNe0002] height value :" + obj.$attrs.height);
      done();
    });
  })
}
