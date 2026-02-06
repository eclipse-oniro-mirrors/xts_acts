/*
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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import Utils from '../../MainAbility/common/Utils'

export default function RectRadiusTest() {
  describe('RectRadiusTest', () => {
    beforeAll(async () => {
      console.info("flex beforeEach start");
     let options:router.RouterOptions = {
        url:'MainAbility/pages/Rect/RectPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RectPage state success " + JSON.stringify(pages));
        if (!("RectPage" == pages.name)) {
          console.info("get RectPage state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push RectPage page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RectPage page error: " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("RectRadiusTest after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         testRectRadiusTest_0010
     * @tc.desic        test Rect radius
     */
    it('testRectRadiusTest_0010', Level.LEVEL0, async (done: Function) => {
      console.info('[testRectRadiusTest_0010] START');
      await Utils.sleep(1000);

      let strJson = getInspectorByKey('RectRadius_2');
      let obj : ESObject = JSON.parse(strJson);
      console.info('[testRectRadiusTest_0010] Rect obj is: ' + obj);
      console.info('[testRectRadiusTest_0010] Rect obj.$type is: ' + obj.$type);
      console.info('[testRectRadiusTest_0010] Rect obj.$attrs.radius is: ' + obj.$attrs.radius);

      expect(obj.$type).assertEqual('Rect');
      expect(obj.$attrs.radius).assertEqual(true);

      console.info('[testRectRadiusTest_0010] END');
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0002
     * @tc.name         testRectRadiusTest_0020
     * @tc.desic        test Rect radius
     */
    it('testRectRadiusTest_0020', Level.LEVEL0, async (done: Function) => {
      console.info('[testRectRadiusTest_0020] START');
      await Utils.sleep(1000);

      let strJson = getInspectorByKey('RectRadius_2');
      let obj : ESObject = JSON.parse(strJson);
      console.info('[testRectRadiusTest_0020] Rect obj is: ' + obj);
      console.info('[testRectRadiusTest_0020] Rect obj.$type is: ' + obj.$type);
      console.info('[testRectRadiusTest_0020] Rect obj.$attrs.radius is: ' + obj.$attrs.radius);

      expect(obj.$type).assertEqual('Rect');
      expect(obj.$attrs.radius).assertEqual(true);

      console.info('[testRectRadiusTest_0020] END');
      done();
    });
  })
}
