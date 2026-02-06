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

export default function RectCommonShapeMethodTest() {
  describe('RectCommonShapeMethodTest', () => {
    beforeAll(async () => {
      console.info("RectCommonShapeMethodPage beforeEach start");
     let options:router.RouterOptions = {
        url:'MainAbility/pages/Rect/RectCommonShapeMethodPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RectCommonShapeMethodPage state success " + JSON.stringify(pages));
        if (!("RectCommonShapeMethodPage" == pages.name)) {
          console.info("get RectCommonShapeMethodPage state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push RectCommonShapeMethodPage page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RectCommonShapeMethodPage page error: " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("RectCommonShapeMethodTest after each called");
    });

    /**
     * @tc.name   RectCommonShapeMethodTest_0010
     * @tc.number SUB_ACE_BASIC_ETS_API_0001
     * @tc.desc   RectCommonShapeMethodTest_0010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('RectCommonShapeMethodTest_0010', Level.LEVEL0, async (done: Function) => {
      console.info('[RectCommonShapeMethodTest_0010] START');
      await Utils.sleep(1000);

      let strJson = getInspectorByKey('RectCommonShapeMethodRect_1');
      let obj : ESObject = JSON.parse(strJson);
      console.info('[RectCommonShapeMethodTest_0010] Rect obj.$attrs.strokeMiterLimit is: ' + obj.$attrs.strokeMiterLimit);
      expect(obj.$attrs.strokeMiterLimit).assertEqual('10.000000');

      let strJson2 = getInspectorByKey('RectCommonShapeMethodRect_2');
      let obj2 : ESObject = JSON.parse(strJson2);
      console.info('[RectCommonShapeMethodTest_0020] Rect obj2.$attrs.strokeOpacity is: ' + obj2.$attrs.strokeOpacity);
      expect(obj2.$attrs.strokeOpacity).assertEqual('0.500000');

      console.info('[RectCommonShapeMethodTest_0010] END');
      done();
    });
  })
}
