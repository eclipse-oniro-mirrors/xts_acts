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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import router from '@system.router';

export default function hoverTest() {
  describe('hoverTest', function () {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(function () {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async function (done) {
      console.info("flex beforeEach start");
      let options = {
        uri: 'TestAbility/pages/hover',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get hover state success " + JSON.stringify(pages));
        if (!("hover" == pages.name)) {
          console.info("get hover state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push hover page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push hover page error: " + err);
      }
      done()
    });
    afterEach(function () {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(function () {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
    it('ArkUX_Hover_stoppropagation_0100', 0, async function (done) {
      console.info('ArkUX_Hover_stoppropagation_0100 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Hover_stoppropagation_0100');
          console.info('ArkUX_Hover_stoppropagation_0100 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          expect(obj.$type).assertEqual('Button');
          console.info('ArkUX_Hover_stoppropagation_0100 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Hover_stoppropagation_0100 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });
  })
}