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
import events_emitter from '@ohos.events.emitter';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "hypium/index"
import Utils from './Utils.ets'


export default function waterFlowDemoJsunit() {
  describe('waterFlowDemoTest', function () {
    beforeAll(async function (done) {
      console.info("waterFlow beforeEach start");
      let options = {
        uri: 'MainAbility/pages/WaterflowDemo',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get waterflowDemo state success " + JSON.stringify(pages));
        if (!("waterflowDemo" == pages.name)) {
          console.info("get waterflowDemo state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push waterflowDemo page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push waterflowDemo page error: " + err);
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("waterflowDemo after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         waterflowTest0001
     * @tc.desic        'waterflowTest0001
     */
    it('waterflowTest0001', 0, async function (done) {
      console.info('waterflowDemo testalphabetIndexerWidth0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('waterFlow');
      console.info("[waterflowTest0001] component width strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('WaterFlow');
      done();
    });

  })
}
