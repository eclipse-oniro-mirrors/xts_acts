/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';


export default function ActsgetcomponentTest() {
  describe('ActsgetcomponentTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async (done: Function) => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/button/getcomponent',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get getcomponent state success " + JSON.stringify(pages));
        if (!("getcomponent" == pages.name)) {
          console.info("get getcomponent state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push getcomponent page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push getcomponent page error: " + err);
      }
      done()
    });
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name   ArkUX_Get_component_0010
     * @tc.number ArkUX_Get_component_0010
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Get_component_0010', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Get_component_0010 START');
      let strJson = getInspectorByKey('ArkUX_Get_component_0010');
      console.info('ArkUX_Get_component_0010 width: ' + JSON.stringify(JSON.parse(strJson).$attrs.width));
      console.info('ArkUX_Get_component_0010 height: ' + JSON.stringify(JSON.parse(strJson).$attrs.height));
      console.info('ArkUX_Get_component_0010 localOffsetX: ' + JSON.stringify(JSON.parse(strJson).$attrs.offset.x));
      console.info('ArkUX_Get_component_0010 localOffsetY: ' + JSON.stringify(JSON.parse(strJson).$attrs.offset.y));
      console.info('ArkUX_Get_component_0010 windowOffsetX: ' + JSON.stringify(JSON.parse(strJson)
        .$attrs
        .shadow
        .offsetX));
      console.info('ArkUX_Get_component_0010 windowOffsetY: ' + JSON.stringify(JSON.parse(strJson)
        .$attrs
        .shadow
        .offsetY));
      expect(JSON.parse(strJson).$attrs.width).assertEqual("90.00vp");
      expect(JSON.parse(strJson).$attrs.height).assertEqual("90.00vp");
      expect(JSON.parse(strJson).$attrs.offset.x).assertEqual("");
      expect(JSON.parse(strJson).$attrs.offset.y).assertEqual("");
      expect(JSON.parse(strJson).$attrs.shadow.offsetX).assertEqual("0.000000");
      expect(JSON.parse(strJson).$attrs.shadow.offsetY).assertEqual("0.000000");
      console.info('ArkUX_Get_component_0010 END ');
      done();
    });
  })
}