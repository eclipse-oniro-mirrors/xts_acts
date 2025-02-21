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

export default function radioGroupJsunit() {
  describe('radioGroupTest', function () {
    beforeEach(async function (done) {
      console.info("flex beforeEach start");
      let options = {
        uri: 'pages/radio',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get radio state success " + JSON.stringify(pages));
        if (!("radio" == pages.name)) {
          console.info("get radio state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push radio page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push radio page error: " + err);
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("radioGroup after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_001
     * @tc.name         testradioGroup001
     * @tc.desic         aceradioGroupEtsTest001
     */
    it('testradioGroup001', 0, async function (done) {
      console.info('radioGroup testradioGroup001 START');
      await Utils.sleep(2000);
      try {
        console.info("testradioGroup_0011 click result is: " + JSON.stringify(sendEventByKey('RadioTwo', 10, "")));
        let strJson = getInspectorByKey('RadioOne');
        console.info("[testradioGroup001] component checked strJson:" + strJson);
        let obj = JSON.parse(strJson);
        expect(obj.$type).assertEqual('Radio');
        expect(obj.$attrs.checked).assertEqual("true");
        console.info("[testradioGroup001] checked value :" + obj.$attrs.checked);
      } catch (err) {
        console.info("testradioGroup_0011 on click err : " + JSON.stringify(err));
      }
      console.info('testradioGroup001 END');
      done();
    });
  })
}
