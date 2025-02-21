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

export default function stateManagementDARKJsunit() {
  describe('stateManagementDARKTest', function () {
    beforeEach(async function (done) {
      console.info("flex beforeEach start");
      let options = {
        uri: 'MainAbility/pages/stateManagement',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get stateManagement state success " + JSON.stringify(pages));
        if (!("stateManagement" == pages.name)) {
          console.info("get stateManagement state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push stateManagement page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push stateManagement page error: " + err);
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("stateManagementDARK after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_001
     * @tc.name         teststateManagementDARK001
     * @tc.desic         acestateManagementDARKEtsTest001
     */
    it('teststateManagementDARK001', 0, async function (done) {
      console.info('stateManagementDARK teststateManagementDARK001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('DARKText');
      console.info("[teststateManagementDARK001] component textAlign strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.backgroundColor).assertEqual('#FF000001');
      console.info("[teststateManagementDARK001] backgroundColor value :" + obj.$attrs.backgroundColor);
      done();
    });

  })
}
