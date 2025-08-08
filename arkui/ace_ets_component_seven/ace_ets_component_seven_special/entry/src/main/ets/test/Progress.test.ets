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

import router from '@ohos.router'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "@ohos/hypium"
import Utils from './Utils'

export default function progressStyleJsunit() {
  describe('progressStyleTest', () => {
    beforeAll(async (done: Function) => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/progress',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get progress state success " + JSON.stringify(pages));
        if (!("progress" == pages.name)) {
          console.info("get progress state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push progress page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push progress page error: " + err);
      }
      done();
    });

    /**
     * @tc.number testProgressStyle0001
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testProgressStyle0001', 0, async (done: Function) => {
      console.info('testProgressStyle0001 START');
      let strJson = getInspectorByKey('ProgressKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[testProgressStyle0001] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.color).assertEqual("#FF123456");

      console.info('testProgressStyle0001 END');
      done();
    });

    /**
     * @tc.number testProgressStyle0002
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testProgressStyle0002', 0, async (done: Function) => {
      console.info('testProgressStyle0002 START');
      let strJson = getInspectorByKey('ProgressKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[testProgressStyle0002] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.value).assertEqual("12.000000");

      console.info('testProgressStyle0002 END');
      done();
    });

    /**
     * @tc.number testProgressStyle0003
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testProgressStyle0003', 0, async (done: Function) => {
      console.info('testProgressStyle0003 START');
      let strJson = getInspectorByKey('ProgressKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[testProgressStyle0003] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.style).assertEqual('{"strokeWidth":"20.00vp","scaleCount":"30","scaleWidth":"20.00vp"}');
      console.info('testProgressStyle0003 END');
      done();
    });
  })
}
