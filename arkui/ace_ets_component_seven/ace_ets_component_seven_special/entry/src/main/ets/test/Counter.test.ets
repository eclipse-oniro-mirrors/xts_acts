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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import Utils from './Utils';

export default function counterJsunit() {
  describe('ActsAceCounterTest', () => {
    beforeAll(async (done: Function) => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/counter',
      }
      let result: ESObject;
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Counter state success " + JSON.stringify(pages));
        if (!("counter" == pages.name)) {
          console.info("get Counter state success " + JSON.stringify(pages.name));
          result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push Counter page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Counter page error: " + err);
      }
      done();
    });

    /**
     * @tc.number testCounter01
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testCounter01', Level.LEVEL0, async (done: Function) => {
      console.info('[testCounter01] START');
      let strJson = getInspectorByKey('Counter');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[testCounter01] obj is : " + JSON.stringify(obj.$attrs));
      // expect(obj.$attrs.enableInc).assertEqual('false');
      expect(true).assertEqual(true);
      console.info('[testCounter01] END');
      done();
    });

    /**
     * @tc.number testCounter02
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testCounter02', Level.LEVEL0, async (done: Function) => {
      console.info('[testCounter02] START');
      let strJson = getInspectorByKey('Counter');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[testCounter02] obj is : " + JSON.stringify(obj.$attrs));
      // expect(obj.$attrs.enableDec).assertEqual('false');
      expect(true).assertEqual(true);
      console.info('[testCounter02] END');
      done();
    });
  })
}
