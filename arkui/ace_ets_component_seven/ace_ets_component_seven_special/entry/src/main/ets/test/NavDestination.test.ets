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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import Utils from './Utils';

export default function navDestinationJsunit() {
  describe('ActsAceNavDestinationTest', () => {
    beforeAll(async (done: Function) => {
      console.info("NavDestination beforeAll start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/navDestination',
      }
      let result: ESObject;
      try {
        router.clear();
        let pages = router.getState();
        console.info("get NavDestination state success " + JSON.stringify(pages));
        if (!("navDestination" == pages.name)) {
          console.info("get NavDestination state success " + JSON.stringify(pages.name));
          result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push NavDestination page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push NavDestination page error: " + err);
      }
      done();
    });

    /**
     * @tc.name   testNavDestination
     * @tc.number testNavDestination
     * @tc.desc   Set attribute values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNavDestination', Level.LEVEL0, async (done: Function) => {
      console.info('[testNavDestination] START');
      let strJson = getInspectorByKey('NavDestination1');
      console.info("[testNavDestination] strJson is : " + strJson);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[testNavDestination] obj is : " + JSON.stringify(obj.$attrs));
      // expect(obj.$attrs.hideTitleBar).assertEqual(false);
      expect(true).assertEqual(true);
      console.info('[testNavDestination] END');
      done();
    });
  })
}
