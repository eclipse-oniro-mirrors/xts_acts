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

export default function gridScrollbarUpdateTest() {
  describe('gridScrollbarUpdateTest', function () {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(function () {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async function (done) {
      console.info("flex beforeEach start");
      let options = {
        uri: 'TestAbility/pages/gridScrollBar',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get gridScrollBar state success " + JSON.stringify(pages));
        if (!("gridScrollBar" == pages.name)) {
          console.info("get gridScrollBar state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push gridScrollBar page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push gridScrollBar page error: " + err);
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

    it('Grid_scrollbarUpdate_0801', 0, async function (done) {
      console.info('Grid_scrollbarUpdate_0801 START');
      setTimeout(()=>{
        try{
          let computeda: ComputedBarAttribute = { totalOffset:10, totalLength:10 }
          console.info("Grid_scrollbarUpdate_0801 computeda is: " + JSON.stringify(computeda))
          let strJson = getInspectorByKey('Grid_scrollbarUpdate_0800');
          console.info('Grid_scrollbarUpdate_0801 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("Grid_scrollbarUpdate_0801 obj is: " + JSON.stringify(obj));
          let width = obj.$attrs.width
          let height = obj.$attrs.height
          expect(width).assertEqual("90.00%");
          expect(height).assertEqual("300.00vp");
          console.info('Grid_scrollbarUpdate_0801 END ');
        } catch(err) {
          expect().assertFail()
          console.info('Grid_scrollbarUpdate_0801 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    })

    it('Grid_scrollbarUpdate_0802', 0, async function (done) {
      console.info('Grid_scrollbarUpdate_0802 START');
      setTimeout(()=>{
        try{
          let computedb: ComputedBarAttribute = { totalOffset:0, totalLength:0 }
          console.info("Grid_scrollbarUpdate_0802 computedb is: " + JSON.stringify(computedb))
          let strJson = getInspectorByKey('Grid_scrollbarUpdate_0800');
          console.info('Grid_scrollbarUpdate_0802 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("Grid_scrollbarUpdate_0802 obj is: " + JSON.stringify(obj));
          expect(obj.$type).assertEqual("Grid");
          console.info('Grid_scrollbarUpdate_0802 END ');

        } catch(err) {
          expect().assertFail()
          console.info('Grid_scrollbarUpdate_0802 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    })


  })
}