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

import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';

export default function ButtonHoverTest() {
  describe('ButtonHoverTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async (done: Function) => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/button/ButtonHover',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get hover state success " + JSON.stringify(pages));
        if (!("hover" == pages.name)) {
          console.info("get hover state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push hover page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push hover page error: " + err);
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
     * @tc.name   ArkUX_Hover_stoppropagation_0100
     * @tc.number ArkUX_Hover_stoppropagation_0100
     * @tc.desc   ArkUX_Hover_stoppropagation_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUX_Hover_stoppropagation_0100', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUX_Hover_stoppropagation_0100 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Hover_stoppropagation_0100');
          console.info('ArkUX_Hover_stoppropagation_0100 START  :' + JSON.stringify(strJson));
          expect(JSON.parse(strJson).$type).assertEqual('Button');
          console.info('ArkUX_Hover_stoppropagation_0100 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Hover_stoppropagation_0100 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
  })
}