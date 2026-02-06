/*
 * Copyright (C) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, TestType, Size, Level } from "../../../hypium/index";
import drawing from '@ohos.graphics.drawing';
import { BusinessError } from '@ohos.base';

export default function maskFilterTest() {
  describe('DrawingTsMaskFilterTest', () => {
    const DEFAULT = 0;
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async () => {

    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
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
     * @tc.name   testCreateBlurMaskFilterNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MASKFILTER_STATIC_0100
     * @tc.desc   Test for testCreateBlurMaskFilterNormalStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateBlurMaskFilterNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCreateBlurMaskFilterNormalStatic';

      try {
        let maskFilter = drawing.MaskFilter.createBlurMaskFilter(drawing.BlurType.OUTER, 10);
        console.info(msg + ' createBlurMaskFilter successed');
        if(maskFilter == undefined){
          console.info(msg + ' 1 test failed');
          expect().assertFail();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` createBlurMaskFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        let maskFilter1 = drawing.MaskFilter.createBlurMaskFilter(drawing.BlurType.NORMAL, 10.5);
        if(maskFilter1 == undefined){
          console.info(msg + ' 2 test failed');
          expect().assertFail();
        }
        let maskFilter2 = drawing.MaskFilter.createBlurMaskFilter(drawing.BlurType.SOLID, 10.5);
        if(maskFilter2 == undefined){
          console.info(msg + ' 3 test failed');
          expect().assertFail();
        }
        let maskFilter3 = drawing.MaskFilter.createBlurMaskFilter(drawing.BlurType.OUTER, 10.5);
        if(maskFilter3 == undefined){
          console.info(msg + ' 4 test failed');
          expect().assertFail();
        }
        let maskFilter4 = drawing.MaskFilter.createBlurMaskFilter(drawing.BlurType.INNER, 10.5);
        if(maskFilter4 == undefined){
          console.info(msg + ' 5 test failed');
          expect().assertFail();
        }
        console.info(msg + ' createBlurMaskFilter successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` createBlurMaskFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testCreateBlurMaskFilterMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MASKFILTER_STATIC_0103
     * @tc.desc   Test for testCreateBlurMaskFilterMultipleCallsStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateBlurMaskFilterMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCreateBlurMaskFilterMultipleCallsStatic';
      let itemList: drawing.BlurType[]= [
        drawing.BlurType.NORMAL,
        drawing.BlurType.SOLID,
        drawing.BlurType.OUTER,
        drawing.BlurType.INNER
      ];
      for (let i = 0; i < 20; i++) {
        const randomEnum = Math.floor(4 * Math.random()).toInt();
        const randomValue = Math.random() * 10 + 1;

        try {
          drawing.MaskFilter.createBlurMaskFilter(itemList[randomEnum], randomValue);
          console.info(`${msg} createBlurMaskFilter with ${randomEnum}, ${randomValue} succeeded`);
        } catch (e) {
          e = e as BusinessError;
          console.info(`${msg} createBlurMaskFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    });

  })
}