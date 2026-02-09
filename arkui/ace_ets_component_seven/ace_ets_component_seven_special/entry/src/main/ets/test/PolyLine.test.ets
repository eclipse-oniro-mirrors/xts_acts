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

export default function polyLineJsunit() {
  describe('ActsAcepolyLineTest', () => {
    beforeAll(async (done: Function) => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/polyLine',
      }
      let result: ESObject;
      try {
        router.clear();
        let pages = router.getState();
        console.info("get polyLine state success " + JSON.stringify(pages));
        if (!("polyLine" == pages.name)) {
          console.info("get polyLine state success " + JSON.stringify(pages.name));
          result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push polyLine page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push polyLine page error: " + err);
      }
      done();
    });

    /**
     * @tc.name   testpolyLine
     * @tc.number testpolyLine
     * @tc.desc   Set attribute values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testpolyLine', Level.LEVEL0, async (done: Function) => {
      console.info('[testpolyLine] START');
      let strJson = getInspectorByKey('polyLine');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[testpolyLine] obj is : " + JSON.stringify(obj.$attrs));

      //原生数据
      let strJson1 = getInspectorByKey('polyLine1');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[testpolyLine] obj is : " + JSON.stringify(obj1.$attrs));

      //与原生做对比
      expect(obj.$attrs.points).assertEqual(obj1.$attrs.points);

      console.info('[testpolyLine] END');
      done();
    });
  })
}
