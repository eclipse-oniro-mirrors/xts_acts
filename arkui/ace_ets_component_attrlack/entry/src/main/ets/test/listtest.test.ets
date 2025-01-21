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
import events_emitter from '@ohos.events.emitter';

export default function listtestIdleJsunit() {
  describe('listtestIdleTest', function () {
    beforeEach(async function (done) {
      console.info("flex beforeEach start");
      let options = {
        uri: 'pages/listtest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get listtest state success " + JSON.stringify(pages));
        if (!("listtest" == pages.name)) {
          console.info("get listtestI state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push listtest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push listtest page error: " + err);
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("listtestIdle after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         testlisttestIdle0001
     * @tc.desic         acelisttestIdleEtsTest0001
     */
    it('testlisttestIdle0001', 0, async function (done) {
      console.info('listtestIdle testlisttestIdle0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('ScrollList');
      console.info("[testlisttestIdle0001] component controlButton strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('List');
      expect(obj.$attrs.editMode).assertEqual("true");
      console.info("[testlisttestIdle0001] editMode value :" + obj.$attrs.editMode);
      done();
    });
  })
}
