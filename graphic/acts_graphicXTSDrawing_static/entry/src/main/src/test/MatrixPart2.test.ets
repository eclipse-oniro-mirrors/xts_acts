/*
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
import { getEnumCount } from './utils';
import common2D from '@ohos.graphics.common2D';
import { BusinessError } from '@ohos.base';
const loop_times = 20;

export default function drawingTsMatrixPart2Test() {
  describe('drawingTsMatrixPart2Test', () => {
    const DEFAULT = 0;
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {

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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_STATIC_1600
     * @tc.name      : testMatrixResetNormalStatic
     * @tc.desc      : testMatrixResetNormal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testMatrixResetNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, (): void => {
      const msg = 'testMatrixResetNormalStatic';
      try {
        let matrix = new drawing.Matrix();
        matrix.reset();
        // let widths : number[] = matrix.getAll();
        // expect(widths.length == 9).assertTrue();
        // matrix.preTranslate(100.1, 100.1);
        // widths = matrix.getAll();
        // expect(widths.length == 9).assertTrue();
        matrix.reset();
        // widths = matrix.getAll();
        // expect(widths.length == 9).assertTrue();
        expect(matrix != null).assertTrue();
        // console.info(msg + ' reset successed,width:'+ widths.length + JSON.stringify(matrix));
      } catch (e: BusinessError) {
        console.info(msg + ` reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_STATIC_1602
     * @tc.name      : testMatrixResetMultipleCallsStatic
     * @tc.desc      : testMatrixResetMultipleCalls
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testMatrixResetMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, (): void => {
      const msg = 'testMatrixResetMultipleCallsStatic';
      try {
        let matrix = new drawing.Matrix();
        // matrix.preTranslate(100,100);
        // matrix.getAll();
        for (let i = 0; i < loop_times; i++) {
          matrix.reset();
          // matrix.getAll();
        }
        console.info(msg + ' reset successed');
      } catch (e: BusinessError) {
        console.info(msg + ` reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
  })
}