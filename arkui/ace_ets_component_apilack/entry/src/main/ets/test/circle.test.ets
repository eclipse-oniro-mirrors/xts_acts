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

export default function circleNewJsunit() {
  describe('circleNewTest', function () {
    beforeAll(async function (done) {
      console.info("circle beforeEach start");
      let options = {
        uri: 'pages/circle',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get circle state success " + JSON.stringify(pages));
        if (!("circle" == pages.name)) {
          console.info("get circle state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push circle page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push circle page error: " + err);
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("circleNew after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_001
     * @tc.name         testcircleNew001
     * @tc.desic         acecircleNewEtsTest001
     */
    it('testcircleNew001', 0, async function (done) {
      console.info('circleNew testcircleNew0011 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('circle');
      console.info("[testcircleNew001] component textAlign strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Shape');
      expect(obj.$attrs.width).assertEqual("100.00px");
      console.info("[testcircleNew001] width value :" + obj.$attrs.width);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_002
     * @tc.name         testcircleNew002
     * @tc.desic         acecircleNewEtsTest002
     */
    it('testcircleNew002', 0, async function (done) {
      console.info('circleNew testcircleNew002 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('circle');
      console.info("[testcircleNew002] component textAlign strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Shape');
      expect(obj.$attrs.height).assertEqual("100.00px");
      console.info("[testcircleNew002] width value :" + obj.$attrs.width);
      done();
    });
  })
}
