
/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "@ohos/hypium"
import router from '@system.router';
import Utils from './Utils';

export default function idKeyJsunit() {
  describe('idKeyJsunit', function () {
    beforeEach(async function (done) {
      console.info("idKey beforeEach start");
      let options = {
        uri: 'MainAbility/pages/idKey',
      }
      let result;
      try {
        router.clear();
        let pages = router.getState();
        console.info("get idkey state pages: " + JSON.stringify(pages));
        if (!("idKey" == pages.name)) {
          console.info("get idkey state pages.name: " + JSON.stringify(pages.name));
          result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push idkey page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push idkey page error: " + err);
      }
      done();
    });

    beforeEach(async function () {
      await Utils.sleep(100);
      console.info("idkey before each called");
    })

    /**
     * @tc.number idkey0001
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('idkey0001', 0, async function (done) {
      console.info('[idkey0001] START');
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('testid');
      let objNew = JSON.parse(strJsonNew);
      console.info("[idkey0001] component idkey0001 is: " + JSON.stringify(objNew.$attrs));
      expect(strJsonNew).assertNotNull;
      done();
    });

    /**
     * @tc.number idkey0002
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('idkey0002', 0, async function (done) {
      console.info('[idkey0002] START');
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('testkey');
      let objNew = JSON.parse(strJsonNew);
      console.info("[idkey0002] component idkey0002 is: " + JSON.stringify(objNew.$attrs));
      expect(strJsonNew).assertNotNull;
      done();
    });
  })
}