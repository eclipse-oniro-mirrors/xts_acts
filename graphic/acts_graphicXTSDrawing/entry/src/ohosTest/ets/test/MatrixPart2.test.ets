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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, TestType, Size, Level } from '@ohos/hypium';
import drawing from '@ohos.graphics.drawing';
import { getEnumCount } from './utils';
import common2D from '@ohos.graphics.common2D';
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
     * @tc.name   testMatrixPostTranslateNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_1200
     * @tc.desc   testMatrixPostTranslateNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixPostTranslateNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testMatrixPostTranslateNormal';
      try {
        let matrix = new drawing.Matrix();
        matrix.postTranslate(100, 100);
        let widths : number[] = matrix.getAll();
        expect(widths.length == 9).assertTrue();
        expect(matrix != null).assertTrue();
        console.info(msg + ' postTranslate successed,width:'+ widths.length + JSON.stringify(matrix));
      } catch (e) {
        console.info(msg + ` postTranslate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.postTranslate(100.1, 100.1);
        let widths : number[] = matrix.getAll();
        expect(widths.length == 9).assertTrue();
        expect(matrix != null).assertTrue();
        console.info(msg + ' postTranslate successed,width:'+ widths.length + JSON.stringify(matrix));
      } catch (e) {
        console.info(msg + ` postTranslate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.postTranslate(-100, 100);
        let widths : number[] = matrix.getAll();
        expect(widths.length == 9).assertTrue();
        expect(matrix != null).assertTrue();
        console.info(msg + ' postTranslate successed,width:'+ widths.length + JSON.stringify(matrix));
      } catch (e) {
        console.info(msg + ` postTranslate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.postTranslate(100, -150);
        let widths : number[] = matrix.getAll();
        expect(widths.length == 9).assertTrue();
        expect(matrix != null).assertTrue();
        console.info(msg + ' postTranslate successed,width:'+ widths.length + JSON.stringify(matrix));
      } catch (e) {
        console.info(msg + ` postTranslate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.postTranslate(Number.MAX_VALUE, Number.MAX_VALUE);
        let widths : number[] = matrix.getAll();
        expect(widths.length == 9).assertTrue();
        expect(matrix != null).assertTrue();
        console.info(msg + ' postTranslate successed,width:'+ widths.length + JSON.stringify(matrix));
      } catch (e) {
        console.info(msg + ` postTranslate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.name   testMatrixPostTranslateNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_1201
     * @tc.desc   testMatrixPostTranslateNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixPostTranslateNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testMatrixPostTranslateNull';
      try {
        let matrix = new drawing.Matrix();
        matrix.postTranslate(null, 100,);
        console.info(msg + ' postTranslate successed');
      } catch (e) {
        console.info(msg + ` postTranslate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.postTranslate(100, null);
        console.info(msg + ' postTranslate successed');
      } catch (e) {
        console.info(msg + ` postTranslate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.postTranslate(undefined, 100,);
        console.info(msg + ' postTranslate successed');
      } catch (e) {
        console.info(msg + ` postTranslate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.postTranslate(100, undefined);
        console.info(msg + ' postTranslate successed');
      } catch (e) {
        console.info(msg + ` postTranslate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testMatrixPostTranslateMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_1203
     * @tc.desc   testMatrixPostTranslateMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixPostTranslateMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testMatrixPostTranslateMultipleCalls';
      try {
        let matrix = new drawing.Matrix();
        for (let i = 0; i < loop_times; i++) {
          matrix.postTranslate(Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE);
        }
        console.info(msg + ' postTranslate successed');
      } catch (e) {
        console.info(msg + ` postTranslate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.name   testMatrixPreRotateNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_1300
     * @tc.desc   testMatrixPreRotateNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixPreRotateNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testMatrixPreRotateNormal';
      try {
        let matrix = new drawing.Matrix();
        matrix.preRotate(90, 100, 100);
        let widths : number[] = matrix.getAll();
        expect(widths.length == 9).assertTrue();
        expect(matrix != null).assertTrue();
        console.info(msg + ' preRotate successed,width:'+ widths.length + JSON.stringify(matrix));
      } catch (e) {
        console.info(msg + ` preRotate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.preRotate(90.1, 100.1, 100.1);
        let widths : number[] = matrix.getAll();
        expect(widths.length == 9).assertTrue();
        expect(matrix != null).assertTrue();
        console.info(msg + ' preRotate successed,width:'+ widths.length + JSON.stringify(matrix));
      } catch (e) {
        console.info(msg + ` preRotate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.preRotate(-90, 100, 100);
        let widths : number[] = matrix.getAll();
        expect(widths.length == 9).assertTrue();
        expect(matrix != null).assertTrue();
        console.info(msg + ' preRotate successed,width:'+ widths.length + JSON.stringify(matrix));
      } catch (e) {
        console.info(msg + ` preRotate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.preRotate(90, -100, 100);
        let widths : number[] = matrix.getAll();
        expect(widths.length == 9).assertTrue();
        expect(matrix != null).assertTrue();
        console.info(msg + ' preRotate successed,width:'+ widths.length + JSON.stringify(matrix));
      } catch (e) {
        console.info(msg + ` preRotate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.preRotate(90, 100, -100);
        let widths : number[] = matrix.getAll();
        expect(widths.length == 9).assertTrue();
        expect(matrix != null).assertTrue();
        console.info(msg + ' preRotate successed,width:'+ widths.length + JSON.stringify(matrix));
      } catch (e) {
        console.info(msg + ` preRotate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.preRotate(361, Number.MAX_VALUE, Number.MAX_VALUE);
        let widths : number[] = matrix.getAll();
        expect(widths.length == 9).assertTrue();
        expect(matrix != null).assertTrue();
        console.info(msg + ' preRotate successed,width:'+ widths.length + JSON.stringify(matrix));
      } catch (e) {
        console.info(msg + ` preRotate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.name   testMatrixPreRotateNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_1301
     * @tc.desc   testMatrixPreRotateNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixPreRotateNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testMatrixPreRotateNull';
      try {
        let matrix = new drawing.Matrix();
        matrix.preRotate(null, 100, 100);
        console.info(msg + ' preRotate successed');
      } catch (e) {
        console.info(msg + ` preRotate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.preRotate(90, null, 100);
        console.info(msg + ' preRotate successed');
      } catch (e) {
        console.info(msg + ` preRotate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.preRotate(90, 100, null);
        console.info(msg + ' preRotate successed');
      } catch (e) {
        console.info(msg + ` preRotate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.preRotate(undefined, 100, 100);
        console.info(msg + ' preRotate successed');
      } catch (e) {
        console.info(msg + ` preRotate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.preRotate(90, undefined, 100);
        console.info(msg + ' preRotate successed');
      } catch (e) {
        console.info(msg + ` preRotate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.preRotate(90, 100, undefined);
        console.info(msg + ' preRotate successed');
      } catch (e) {
        console.info(msg + ` preRotate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testMatrixPreRotateMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_1303
     * @tc.desc   testMatrixPreRotateMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixPreRotateMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testMatrixPreRotateMultipleCalls';
      try {
        let matrix = new drawing.Matrix();
        for (let i = 0; i < loop_times; i++) {
          matrix.preRotate(Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE);
        }
        console.info(msg + ' preRotate successed');
      } catch (e) {
        console.info(msg + ` preRotate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.name   testMatrixPreScaleNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_1400
     * @tc.desc   testMatrixPreScaleNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixPreScaleNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testMatrixPreScaleNormal';
      try {
        let matrix = new drawing.Matrix();
        matrix.preScale(100, 100, 150, 150);
        let widths : number[] = matrix.getAll();
        expect(widths.length == 9).assertTrue();
        expect(matrix != null).assertTrue();
        console.info(msg + ' preScale successed,width:'+ widths.length + JSON.stringify(matrix));
      } catch (e) {
        console.info(msg + ` preScale errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.preScale(0.2, 0.2, 0.5, 0.5);
        let widths : number[] = matrix.getAll();
        expect(widths.length == 9).assertTrue();
        expect(matrix != null).assertTrue();
        console.info(msg + ' preScale successed,width:'+ widths.length + JSON.stringify(matrix));
      } catch (e) {
        console.info(msg + ` preScale errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.preScale(-100, -100, 150, 150);
        let widths : number[] = matrix.getAll();
        expect(widths.length == 9).assertTrue();
        expect(matrix != null).assertTrue();
        console.info(msg + ' preScale successed,width:'+ widths.length + JSON.stringify(matrix));
      } catch (e) {
        console.info(msg + ` preScale errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.preScale(100, 100, -150, -150);
        let widths : number[] = matrix.getAll();
        expect(widths.length == 9).assertTrue();
        expect(matrix != null).assertTrue();
        console.info(msg + ' preScale successed,width:'+ widths.length + JSON.stringify(matrix));
      } catch (e) {
        console.info(msg + ` preScale errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.preScale(Number.MAX_VALUE, Number.MAX_VALUE, Number.MAX_VALUE, Number.MAX_VALUE);
        let widths : number[] = matrix.getAll();
        expect(widths.length == 9).assertTrue();
        expect(matrix != null).assertTrue();
        console.info(msg + ' preScale successed,width:'+ widths.length + JSON.stringify(matrix));
      } catch (e) {
        console.info(msg + ` preScale errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.name   testMatrixPreScaleNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_1401
     * @tc.desc   testMatrixPreScaleNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixPreScaleNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testMatrixPreScaleNull';
      try {
        let matrix = new drawing.Matrix();
        matrix.preScale(null, 100, 150, 150);
        console.info(msg + ' preScale successed');
      } catch (e) {
        console.info(msg + ` preScale errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.preScale(100, null, 150, 150);
        console.info(msg + ' preScale successed');
      } catch (e) {
        console.info(msg + ` preScale errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.preScale(100, 100, null, 150);
        console.info(msg + ' preScale successed');
      } catch (e) {
        console.info(msg + ` preScale errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.preScale(100, 100, 150, null);
        console.info(msg + ' preScale successed');
      } catch (e) {
        console.info(msg + ` preScale errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.preScale(undefined, 100, 150, 150);
        console.info(msg + ' preScale successed');
      } catch (e) {
        console.info(msg + ` preScale errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.preScale(100, undefined, 150, 150);
        console.info(msg + ' preScale successed');
      } catch (e) {
        console.info(msg + ` preScale errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.preScale(100, undefined, 150, 150);
        console.info(msg + ' preScale successed');
      } catch (e) {
        console.info(msg + ` preScale errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.preScale(100, 100, undefined, 150);
        console.info(msg + ' preScale successed');
      } catch (e) {
        console.info(msg + ` preScale errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.preScale(100, 100, 150, undefined);
        console.info(msg + ' preScale successed');
      } catch (e) {
        console.info(msg + ` preScale errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testMatrixPreScaleMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_1403
     * @tc.desc   testMatrixPreScaleMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixPreScaleMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testMatrixPreScaleMultipleCalls';
      try {
        let matrix = new drawing.Matrix();
        for (let i = 0; i < loop_times; i++) {
          matrix.preScale(Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE,
            Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE);
        }
        console.info(msg + ' preScale successed');
      } catch (e) {
        console.info(msg + ` preScale errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.name   testMatrixPreTranslateNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_1500
     * @tc.desc   testMatrixPreTranslateNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixPreTranslateNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testMatrixPreTranslateNormal';
      try {
        let matrix = new drawing.Matrix();
        matrix.preTranslate(100, 100);
        let widths : number[] = matrix.getAll();
        expect(widths.length == 9).assertTrue();
        expect(matrix != null).assertTrue();
        console.info(msg + ' preTranslate successed,width:'+ widths.length + JSON.stringify(matrix));
      } catch (e) {
        console.info(msg + ` preTranslate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.preTranslate(100.1, 100.1);
        let widths : number[] = matrix.getAll();
        expect(widths.length == 9).assertTrue();
        expect(matrix != null).assertTrue();
        console.info(msg + ' preTranslate successed,width:'+ widths.length + JSON.stringify(matrix));
      } catch (e) {
        console.info(msg + ` preTranslate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.preTranslate(-100, 100);
        let widths : number[] = matrix.getAll();
        expect(widths.length == 9).assertTrue();
        expect(matrix != null).assertTrue();
        console.info(msg + ' preTranslate successed,width:'+ widths.length + JSON.stringify(matrix));
      } catch (e) {
        console.info(msg + ` preTranslate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.preTranslate(100, -150);
        let widths : number[] = matrix.getAll();
        expect(widths.length == 9).assertTrue();
        expect(matrix != null).assertTrue();
        console.info(msg + ' preTranslate successed,width:'+ widths.length + JSON.stringify(matrix));
      } catch (e) {
        console.info(msg + ` preTranslate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.preTranslate(Number.MAX_VALUE, Number.MAX_VALUE);
        let widths : number[] = matrix.getAll();
        expect(widths.length == 9).assertTrue();
        expect(matrix != null).assertTrue();
        console.info(msg + ' preTranslate successed,width:'+ widths.length + JSON.stringify(matrix));
      } catch (e) {
        console.info(msg + ` preTranslate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.name   testMatrixPreTranslateNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_1501
     * @tc.desc   testMatrixPreTranslateNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixPreTranslateNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testMatrixPreTranslateNull';
      try {
        let matrix = new drawing.Matrix();
        matrix.preTranslate(null, 100);
        console.info(msg + ' preTranslate successed');
      } catch (e) {
        console.info(msg + ` preTranslate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.preTranslate(100, null);
        console.info(msg + ' preTranslate successed');
      } catch (e) {
        console.info(msg + ` preTranslate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.preTranslate(undefined, 100);
        console.info(msg + ' preTranslate successed');
      } catch (e) {
        console.info(msg + ` preTranslate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.preTranslate(100, undefined);
        console.info(msg + ' preTranslate successed');
      } catch (e) {
        console.info(msg + ` preTranslate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testMatrixPreTranslateMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_1503
     * @tc.desc   testMatrixPreTranslateMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixPreTranslateMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testMatrixPreTranslateMultipleCalls';
      try {
        let matrix = new drawing.Matrix();
        for (let i = 0; i < loop_times; i++) {
          matrix.preTranslate(Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE);
        }
        console.info(msg + ' preTranslate successed');
      } catch (e) {
        console.info(msg + ` preTranslate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.name   testMatrixResetNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_1600
     * @tc.desc   testMatrixResetNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixResetNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testMatrixResetNormal';
      try {
        let matrix = new drawing.Matrix();
        matrix.reset();
        let widths : number[] = matrix.getAll();
        expect(widths.length == 9).assertTrue();
        matrix.preTranslate(100.1, 100.1);
        widths = matrix.getAll();
        expect(widths.length == 9).assertTrue();
        matrix.reset();
        widths = matrix.getAll();
        expect(widths.length == 9).assertTrue();
        expect(matrix != null).assertTrue();
        console.info(msg + ' reset successed,width:'+ widths.length + JSON.stringify(matrix));
      } catch (e) {
        console.info(msg + ` reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.name   testMatrixResetMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_1602
     * @tc.desc   testMatrixResetMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixResetMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testMatrixResetMultipleCalls';
      try {
        let matrix = new drawing.Matrix();
        matrix.preTranslate(100,100);
        matrix.getAll();
        for (let i = 0; i < loop_times; i++) {
          matrix.reset();
          matrix.getAll();
        }
        console.info(msg + ' reset successed');
      } catch (e) {
        console.info(msg + ` reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.name   testMatrixMapPointsNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_1700
     * @tc.desc   testMatrixMapPointsNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixMapPointsNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testMatrixMapPointsNormal';
      let matrix = new drawing.Matrix();

      try {
        let src: Array<common2D.Point> = [{x:10,y:10},{x:20.1,y:20.1},{x:30,y:30}];
        let dst: Array<common2D.Point> =matrix.mapPoints(src);
        console.info(msg + ' mapPoints successed dst.length is: ' + dst.length);
        expect(dst.length == 3).assertEqual(true);
        let dst2: Array<common2D.Point> = matrix.mapPoints(src);
        console.info(msg + ' mapPoints successed dst2.length is: ' + dst2.length);
        expect(dst2.length == 3).assertEqual(true);
        console.info(msg + ' mapPoints successed');
      } catch (e) {
        console.info(msg + ` mapPoints1 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let dst = matrix.mapPoints([]);
        console.info(msg + ' mapPoints successed');
      } catch (e) {
        console.info(msg + ` mapPoints2 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        let dst3 = matrix.mapPoints( [{x:-10,y:-10},{x:20.1,y:20.1},{x:30,y:30.1}]);
        console.info(msg + ' mapPoints successed dst3.length is: ' + dst3.length);
        expect(dst3.length == 3).assertEqual(true);
        console.info(msg + ' mapPoints successed');
      } catch (e) {
        console.info(msg + ` mapPoints3 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let dst4: Array<common2D.Point> = matrix.mapPoints([{x:10,y:10}]);
        console.info(msg + ' mapPoints successed dst4.length is: ' + dst4.length);
        expect(dst4.length == 1).assertEqual(true);
        console.info(msg + ' mapPoints successed');
      } catch (e) {
        console.info(msg + ` mapPoints4 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.name   testMatrixMapPointsNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_1701
     * @tc.desc   testMatrixMapPointsNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixMapPointsNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testMatrixMapPointsNull';
      try {
        let matrix = new drawing.Matrix();
        matrix.mapPoints(null);
        console.info(msg + ' mapPoints successed');
      } catch (e) {
        console.info(msg + ` mapPoints errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.mapPoints(undefined);
        console.info(msg + ' mapPoints successed');
      } catch (e) {
        console.info(msg + ` mapPoints errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testMatrixMapPointsMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_1703
     * @tc.desc   testMatrixMapPointsMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixMapPointsMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testMatrixMapPointsMultipleCalls';
      try {
        let matrix = new drawing.Matrix();
        let src: Array<common2D.Point> = [{x:10,y:10}];
        for (let i = 0; i < loop_times; i++) {
          matrix.mapPoints(src);
        }
        console.info(msg + ' mapPoints successed');
      } catch (e) {
        console.info(msg + ` mapPoints errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.name   testMatrixMapRectNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_1800
     * @tc.desc   testMatrixMapRectNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixMapRectNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testMatrixMapRectNormal';
      try {
        let matrix = new drawing.Matrix();
        let dst: common2D.Rect = { left: 100, top: 20, right: 130, bottom: 60 };
        let src: common2D.Rect = { left: 100, top: 80, right: 130, bottom: 120 };
        let result: boolean = matrix.mapRect(dst, src);
        console.info(msg + " mapRect -----result:  "+ result);
        expect(result).assertEqual(true);
        let result2: boolean = matrix.mapRect(dst,  { left: 0, top: 0, right: 0, bottom: 0})
        console.info(msg + " mapRect -----result2:  "+ result2);
        expect(result2).assertEqual(true);
        let result3: boolean =  matrix.mapRect(dst,  { left: 100, top: 100, right: 100, bottom: 200})
        console.info(msg + " mapRect -----result3:  "+ result3);
        expect(result3).assertEqual(true);
        let result4: boolean =  matrix.mapRect(dst,  { left: 100, top: 100, right: 100, bottom: 100})
        console.info(msg + " mapRect -----result4:  "+ result4);
        expect(result4).assertEqual(true);
        let result5: boolean =  matrix.mapRect( { left: 200.1, top: 200.1, right: 300.1, bottom: 400.1},
          { left: 100.1, top: 100.1, right: 200.1, bottom: 200.1})
        console.info(msg + " mapRect -----result5:  "+ result5);
        expect(result5).assertEqual(true);
        let result6: boolean =  matrix.mapRect( { left: 200.1, top: 200.1, right: 300.1, bottom: 400.1},
          { left: -100.1, top: -100.1, right: 200.1, bottom: 200.1})
        console.info(msg + " mapRect -----result6:  "+ result6);
        expect(result6).assertEqual(true);
        let result7: boolean =  matrix.mapRect( { left: 200.1, top: 200.1, right: 300.1, bottom: 400.1},
          { left: 100.1, top: 100.1, right: -200.1, bottom: -200.1})
        console.info(msg + " mapRect -----result7:  "+ result7);
        expect(result7).assertEqual(true);
        console.info(msg + ' mapRect successed');
      } catch (e) {
        console.info(msg + ` mapRect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      try {
        let matrix2 = new drawing.Matrix();
        let dst2: common2D.Rect = { left: 100, top: 20, right: 130, bottom: 60 };
        let src2: common2D.Rect = { left: 100, top: 80, right: 130, bottom: 120 };
        matrix2.setRotation(45, 100, 100);
        let result8: boolean = matrix2.mapRect(dst2, src2);
        console.info(msg + " mapRect -----result8:  "+ result8);
        expect(result8).assertEqual(false);
      } catch (e) {
        console.info(msg + ` mapRect result8 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      try {
        let matrix3 = new drawing.Matrix();
        let dst3: common2D.Rect = { left: 100, top: 20, right: 130, bottom: 60 };
        let src3: common2D.Rect = { left: 100, top: 80, right: 130, bottom: 120 };
        let value : Array<number> = [2, 2, 2, 2, 2, 2, 2, 2, 2];
        matrix3.setMatrix(value);
        let result9: boolean = matrix3.mapRect(dst3, src3);
        console.info(msg + " mapRect -----result9:  "+ result9);
        expect(result9).assertEqual(false);
      } catch (e) {
        console.info(msg + ` mapRect result9 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.name   testMatrixMapRectNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_1801
     * @tc.desc   testMatrixMapRectNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixMapRectNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testMatrixMapRectNull';
      try {
        let matrix = new drawing.Matrix();
        matrix.mapRect( null,  { left: 100, top: 100, right: 200, bottom: 200});
        console.info(msg + ' mapRect successed');
      } catch (e) {
        console.info(msg + ` mapRect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.mapRect( { left: 200, top: 200, right: 300, bottom: 400},  null);
        console.info(msg + ' mapRect successed');
      } catch (e) {
        console.info(msg + ` mapRect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.mapRect( undefined,  { left: 100, top: 100, right: 200, bottom: 200});
        console.info(msg + ' mapRect successed');
      } catch (e) {
        console.info(msg + ` mapRect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.mapRect( { left: 200, top: 200, right: 300, bottom: 400},  undefined);
        console.info(msg + ' mapRect successed');
      } catch (e) {
        console.info(msg + ` mapRect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testMatrixMapRectMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_1803
     * @tc.desc   testMatrixMapRectMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixMapRectMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testMatrixMapRectMultipleCalls';
      try {
        let matrix = new drawing.Matrix();
        for (let i = 0; i < loop_times; i++) {
          matrix.mapRect( { left: Math.random() * Number.MAX_VALUE, top: Math.random() * Number.MAX_VALUE,
            right: Math.random() * Number.MAX_VALUE, bottom: Math.random() * Number.MAX_VALUE},
            { left: Math.random() * Number.MAX_VALUE, top: Math.random() * Number.MAX_VALUE,
              right: Math.random() * Number.MAX_VALUE, bottom: Math.random() * Number.MAX_VALUE});
        }
        console.info(msg + ' mapRect successed');
      } catch (e) {
        console.info(msg + ` mapRect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.name   testMatrixSetRectToRectNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_1900
     * @tc.desc   testMatrixSetRectToRectNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixSetRectToRectNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testMatrixSetRectToRectNormal';
      try {
        let matrix = new drawing.Matrix();
        let dst: common2D.Rect = { left: 100, top: 20, right: 130, bottom: 60 };
        let src: common2D.Rect = { left: 100, top: 80, right: 130, bottom: 120 };
        let stf: drawing.ScaleToFit = drawing.ScaleToFit.FILL_SCALE_TO_FIT;
        let result: boolean = matrix.setRectToRect(dst, src,stf);
        console.info(msg + " setRectToRect -----result:  "+ result);
        expect(result).assertEqual(true);
        let result2: boolean = matrix.setRectToRect(dst,  { left: 0, top: 0, right: 0, bottom: 0},stf);
        console.info(msg + " setRectToRect -----result2:  "+ result2);
        expect(result2).assertEqual(true);
        let result3: boolean = matrix.setRectToRect(dst,  { left: 100, top: 100, right: 100, bottom: 200},stf)
        console.info(msg + " setRectToRect -----result3:  "+ result3);
        expect(result3).assertEqual(true);
        let result4: boolean = matrix.setRectToRect(dst,  { left: 100, top: 100, right: 100, bottom: 100},stf)
        console.info(msg + " setRectToRect -----result4:  "+ result4);
        expect(result4).assertEqual(true);
        let result5: boolean = matrix.setRectToRect( { left: 200.1, top: 200.1, right: 300.1, bottom: 400.1},
          { left: 100.1, top: 100.1, right: 200.1, bottom: 200.1},stf)
        console.info(msg + " setRectToRect -----result5:  "+ result5);
        expect(result5).assertEqual(true);
        let result6: boolean = matrix.setRectToRect( { left: 200.1, top: 200.1, right: 300.1, bottom: 400.1},
          { left: -100.1, top: -100.1, right: 200.1, bottom: 200.1},stf)
        console.info(msg + " setRectToRect -----result6:  "+ result6);
        expect(result6).assertEqual(true);
        let result7: boolean = matrix.setRectToRect( { left: 200.1, top: 200.1, right: 300.1, bottom: 400.1},
          { left: 100.1, top: 100.1, right: -200.1, bottom: -200.1},stf)
        console.info(msg + " setRectToRect -----result7:  "+ result7);
        expect(result7).assertEqual(true);
        let result8: boolean = matrix.setRectToRect(dst, src,drawing.ScaleToFit.START_SCALE_TO_FIT );
        console.info(msg + " setRectToRect -----result8:  "+ result8);
        expect(result8).assertEqual(true);
        let result9: boolean = matrix.setRectToRect(dst, src,drawing.ScaleToFit.CENTER_SCALE_TO_FIT );
        console.info(msg + " setRectToRect -----result9:  "+ result9);
        expect(result9).assertEqual(true);
        let result10: boolean = matrix.setRectToRect(dst, src,drawing.ScaleToFit.END_SCALE_TO_FIT );
        console.info(msg + " setRectToRect -----result10:  "+ result10);
        expect(result10).assertEqual(true);
        console.info(msg + ' setRectToRect successed');
      } catch (e) {
        console.info(msg + ` setRectToRect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      try {
        let matrix = new drawing.Matrix();
        let dst2: common2D.Rect = { left: 0, top: 0, right: 0, bottom: 0 };
        let src: common2D.Rect = { left: 100, top: 100, right: 100, bottom: 200 };
        let stf: drawing.ScaleToFit = drawing.ScaleToFit.FILL_SCALE_TO_FIT;
        let result: boolean = matrix.setRectToRect(dst2, src,stf);
        console.info(msg + " setRectToRect 2-----result:  "+ result);
        expect(result).assertEqual(false);
        console.info(msg + ' setRectToRect 2 successed');
      } catch (e) {
        console.info(msg + ` setRectToRect 2 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.name   testMatrixSetRectToRectNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_1901
     * @tc.desc   testMatrixSetRectToRectNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixSetRectToRectNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testMatrixSetRectToRectNull';
      try {
        let matrix = new drawing.Matrix();
        let stf: drawing.ScaleToFit = drawing.ScaleToFit.FILL_SCALE_TO_FIT ;
        matrix.setRectToRect( null,  { left: 100, top: 100, right: 200, bottom: 200}, stf)
        console.info(msg + ' setRectToRect successed');
      } catch (e) {
        console.info(msg + ` setRectToRect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        let matrix = new drawing.Matrix();
        let stf: drawing.ScaleToFit = drawing.ScaleToFit.FILL_SCALE_TO_FIT ;
        matrix.setRectToRect( { left: 200, top: 200, right: 300, bottom: 400},  null,stf)
        console.info(msg + ' setRectToRect successed');
      } catch (e) {
        console.info(msg + ` setRectToRect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        let matrix = new drawing.Matrix();
        let stf: drawing.ScaleToFit = drawing.ScaleToFit.FILL_SCALE_TO_FIT ;
        matrix.setRectToRect( { left: 200, top: 200, right: 300, bottom: 400},  { left: 200, top: 200, right: 300, bottom: 400},null)
        console.info(msg + ' setRectToRect successed');
      } catch (e) {
        console.info(msg + ` setRectToRect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        let matrix = new drawing.Matrix();
        let stf: drawing.ScaleToFit = drawing.ScaleToFit.FILL_SCALE_TO_FIT ;
        matrix.setRectToRect( undefined,  { left: 100, top: 100, right: 200, bottom: 200},stf)
        console.info(msg + ' setRectToRect successed');
      } catch (e) {
        console.info(msg + ` setRectToRect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        let matrix = new drawing.Matrix();
        let stf: drawing.ScaleToFit = drawing.ScaleToFit.FILL_SCALE_TO_FIT ;
        matrix.setRectToRect( { left: 200, top: 200, right: 300, bottom: 400},  undefined,stf)
        console.info(msg + ' setRectToRect successed');
      } catch (e) {
        console.info(msg + ` setRectToRect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        let matrix = new drawing.Matrix();
        let stf: drawing.ScaleToFit = drawing.ScaleToFit.FILL_SCALE_TO_FIT ;
        matrix.setRectToRect( { left: 200, top: 200, right: 300, bottom: 400},  { left: 200, top: 200, right: 300, bottom: 400},stf)
        console.info(msg + ' setRectToRect successed');
      } catch (e) {
        console.info(msg + ` setRectToRect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testMatrixSetRectToRectMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_1903
     * @tc.desc   testMatrixSetRectToRectMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixSetRectToRectMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testMatrixSetRectToRectMultipleCalls';
      try {
        let matrix = new drawing.Matrix();
        const randomEnum = Math.floor(Math.random() * (getEnumCount(drawing.ScaleToFit)));
        for (let i = 0; i < loop_times; i++) {
          matrix.setRectToRect( { left: Math.random() * Number.MAX_VALUE, top: Math.random() * Number.MAX_VALUE,
            right: Math.random() * Number.MAX_VALUE, bottom: Math.random() * Number.MAX_VALUE},
            { left: Math.random() * Number.MAX_VALUE, top: Math.random() * Number.MAX_VALUE,
              right: Math.random() * Number.MAX_VALUE, bottom: Math.random() * Number.MAX_VALUE},randomEnum );
        }
        console.info(msg + ' setRectToRect successed');
      } catch (e) {
        console.info(msg + ` setRectToRect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.name   testMatrixSetRectToRectAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_1904
     * @tc.desc   testMatrixSetRectToRectAbnormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixSetRectToRectAbnormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testMatrixSetRectToRectAbnormal';
      try {
        let matrix = new drawing.Matrix();
        let dst: common2D.Rect = { left: 100, top: 20, right: 130, bottom: 60 };
        let src: common2D.Rect = { left: 100, top: 80, right: 130, bottom: 120 };
        matrix.setRectToRect(dst, src, 10);
        console.info(msg + ' setRectToRect successed');
      } catch (e) {
        console.info(msg + ` setRectToRect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testMatrixSetPolyToPolyNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_2000
     * @tc.desc   testMatrixSetPolyToPolyNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixSetPolyToPolyNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testMatrixSetPolyToPolyNormal';
      let matrix = new drawing.Matrix();

      try {
        let srcPoints: Array<common2D.Point> = [{x: 200, y: 20}, {x: 200, y: 60}];
        let dstPoints: Array<common2D.Point> = [{x: 200, y: 90}, {x: 100, y: 60}];
        let result1: boolean = matrix.setPolyToPoly(srcPoints, dstPoints, 2)
        console.info(msg + " setPolyToPoly -----result1:  "+ result1);
        expect(result1).assertEqual(true);
        console.info(msg + ' setPolyToPoly successed');
      } catch (e) {
        console.info(msg + ` setPolyToPoly errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let srcPoints: Array<common2D.Point> = []
        let dstPoints: Array<common2D.Point> = []
        let result2: boolean = matrix.setPolyToPoly(srcPoints, dstPoints, 0)
        console.info(msg + " setPolyToPoly -----result2:  "+ result2);
        expect(result2).assertEqual(true);
        console.info(msg + ' setPolyToPoly successed');
      } catch (e) {
        console.info(msg + ` setPolyToPoly errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let srcPoints: Array<common2D.Point> = [{x: 200, y: 20}, {x: 200, y: 60},{x: 200.1, y: 40.1}, {x: -300, y: -60}]
        let dstPoints: Array<common2D.Point> = [{x: -200, y: -20}, {x: 200, y: 60},{x: 200.1, y: 40.1}, {x: -300, y: -60}]
        let result3: boolean = matrix.setPolyToPoly(srcPoints, dstPoints, 4)
        console.info(msg + " setPolyToPoly -----result3:  "+ result3);
        expect(result3).assertEqual(true);
        console.info(msg + ' setPolyToPoly successed');
      } catch (e) {
        console.info(msg + ` setPolyToPoly errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let srcPoints: Array<common2D.Point> = [{x: 200, y: 20}]
        let dstPoints: Array<common2D.Point> = [{x: 200, y: 20}]
        let result4: boolean = matrix.setPolyToPoly(srcPoints, dstPoints, 1)
        console.info(msg + " setPolyToPoly -----result4:  "+ result4);
        expect(result4).assertEqual(true);
        console.info(msg + ' setPolyToPoly successed');
      } catch (e) {
        console.info(msg + ` setPolyToPoly errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      try {
        let srcPoints: Array<common2D.Point> = [{x: 200, y: 20}, {x: 200, y: 20}];
        let dstPoints: Array<common2D.Point> = [{x: 200, y: 90}, {x: 100, y: 60}];
        let result5: boolean = matrix.setPolyToPoly(srcPoints, dstPoints, 2)
        console.info(msg + " setPolyToPoly -----result5:  "+ result5);
        expect(result5).assertEqual(false);
        console.info(msg + ' setPolyToPoly successed');
      } catch (e) {
        console.info(msg + ` setPolyToPoly errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.name   testMatrixSetPolyToPolyNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_2001
     * @tc.desc   testMatrixSetPolyToPolyNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixSetPolyToPolyNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testMatrixSetPolyToPolyNull';
      try {
        let matrix = new drawing.Matrix();
        let dstPoints: Array<common2D.Point> = [ {x: 200, y: 20}, {x: 200, y: 60} ];
        matrix.setPolyToPoly(null, dstPoints, 2)
        console.info(msg + ' setPolyToPoly successed');
      } catch (e) {
        console.info(msg + ` setPolyToPoly errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        let matrix = new drawing.Matrix();
        let srcPoints: Array<common2D.Point> = [ {x: 200, y: 20}, {x: 200, y: 60} ];
        matrix.setPolyToPoly(srcPoints, null, 2)
        console.info(msg + ' setPolyToPoly successed');
      } catch (e) {
        console.info(msg + ` setPolyToPoly errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        let matrix = new drawing.Matrix();
        let srcPoints: Array<common2D.Point> = [ {x: 200, y: 20}, {x: 200, y: 60} ];
        let dstPoints: Array<common2D.Point> = [{x: 20, y: 200}, {x: 20, y: 200}];
        matrix.setPolyToPoly(srcPoints, dstPoints, null)
        console.info(msg + ' setPolyToPoly successed');
      } catch (e) {
        console.info(msg + ` setPolyToPoly errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        let matrix = new drawing.Matrix();
        let srcPoints: Array<common2D.Point> = [ {x: 200, y: 20}, {x: 200, y: 60} ];
        let dstPoints: Array<common2D.Point> = [{x: 20, y: 200}, {x: 20, y: 200}];
        matrix.setPolyToPoly(undefined, dstPoints, 2)
        console.info(msg + ' setPolyToPoly successed');
      } catch (e) {
        console.info(msg + ` setPolyToPoly errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        let matrix = new drawing.Matrix();
        let srcPoints: Array<common2D.Point> = [ {x: 200, y: 20}, {x: 200, y: 60} ];
        let dstPoints: Array<common2D.Point> = [{x: 20, y: 200}, {x: 60, y: 200}];
        matrix.setPolyToPoly(srcPoints, undefined, 2)
        console.info(msg + ' setPolyToPoly successed');
      } catch (e) {
        console.info(msg + ` setPolyToPoly errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        let matrix = new drawing.Matrix();
        let srcPoints: Array<common2D.Point> = [ {x: 200, y: 20}, {x: 200, y: 60} ];
        let dstPoints: Array<common2D.Point> = [{x: 20, y: 200}, {x: 60, y: 200}];
        matrix.setPolyToPoly(srcPoints, dstPoints, undefined)
        console.info(msg + ' setPolyToPoly successed');
      } catch (e) {
        console.info(msg + ` setPolyToPoly errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testMatrixSetPolyToPolyMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_2003
     * @tc.desc   testMatrixSetPolyToPolyMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixSetPolyToPolyMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testMatrixSetPolyToPolyMultipleCalls';
      try {
        let matrix = new drawing.Matrix();
        let srcPoints: Array<common2D.Point> = [ {x: 200, y: 20}, {x: 200, y: 60} ];
        let dstPoints: Array<common2D.Point> = [ {x: 200, y: 20}, {x: 200, y: 60} ];
        for (let i = 0; i < loop_times; i++) {
          matrix.setPolyToPoly(srcPoints, dstPoints, 2);
        }
        console.info(msg + ' setPolyToPoly successed');
      } catch (e) {
        console.info(msg + ` setPolyToPoly errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.name   testMatrixSetPolyToPolyAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_2004
     * @tc.desc   testMatrixSetPolyToPolyAbnormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixSetPolyToPolyAbnormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testMatrixSetPolyToPolyAbnormal';
      try {
        let matrix = new drawing.Matrix();
        let srcPoints: Array<common2D.Point> = [ {x: 200, y: 20}, {x: 200, y: 60} ];
        let dstPoints: Array<common2D.Point> = [{x: 20, y: 20}, {x: 20, y: 600}];
        matrix.setPolyToPoly(srcPoints, dstPoints, -1);
        console.info(msg + ' setPolyToPoly successed');
      } catch (e) {
        console.info(msg + ` setPolyToPoly errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        let matrix = new drawing.Matrix();
        let srcPoints: Array<common2D.Point> = [ {x: 200, y: 20}, {x: 200, y: 60}, {x: 210, y: 70}, {x: 220, y: 80} ];
        let dstPoints: Array<common2D.Point> = [{x: 200, y: 20}, {x: 200, y: 60}, {x: 210, y: 70}, {x: 220, y: 80}];
        matrix.setPolyToPoly(srcPoints, dstPoints, 5);
        console.info(msg + ' setPolyToPoly successed');
      } catch (e) {
        console.info(msg + ` setPolyToPoly errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })
    /**
     * @tc.name   testMatrixConstructor2Normal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_2100
     * @tc.desc   testMatrixConstructor2Normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixConstructor2Normal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testMatrixConstructor2Normal';
      let matrix = new drawing.Matrix();
      try {
        let matrix1 = new drawing.Matrix(matrix);
        console.info(msg + ' drawing matrix1 successed');
        expect(matrix1 != null || matrix1 != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` drawing matrix1 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      matrix.setMatrix([-1,-2,-3,-4,-5,-6,-7,-8,-9]);
      try {
        let matrix2 = new drawing.Matrix(matrix);
        console.info(msg + ' drawing matrix2 successed');
        expect(matrix2 != null || matrix2 != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` drawing matrix2 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      matrix.setMatrix([0,0,0,0,0,0,0,0,0]);
      try {
        let matrix3 = new drawing.Matrix(matrix);
        console.info(msg + ' drawing matrix3 successed');
        expect(matrix3 != null || matrix3 != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` drawing matrix3 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      matrix.setMatrix([1.25,302.2,100.2,20,-1.5,-1,0,300,10]);
      try {
        let matrix4 = new drawing.Matrix(matrix);
        console.info(msg + ' drawing matrix4 successed');
        expect(matrix4 != null || matrix4 != undefined).assertTrue();
      } catch (e) {
        console.info(msg + ` drawing matrix4 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testMatrixConstructor2MultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_2101
     * @tc.desc   testMatrixConstructor2MultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixConstructor2MultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testMatrixConstructor2MultipleCalls';
      let matrix1 = new drawing.Matrix();
      for (let i = 0; i < 20; i += 1) {
        try {
          matrix1.setMatrix([Math.random() *10,Math.random() *10,Math.random() *20,Math.random() *10,Math.random() *20,Math.random() *30,Math.random() *10,Math.random() *20,Math.random() *30]);
          let matrix = new drawing.Matrix(matrix1);
          console.info(msg + `setMatrix success step: ` + i);
          expect(matrix != null || matrix != undefined).assertTrue();
        } catch (e) {
          console.info(msg + `drawing setMatrix error. errorCode is: ${e.code} + errormsg is: ${e.message}} step: ${i}`);
          expect().assertFail()
        }
      }
    });
    /**
     * @tc.name   testMatrixConstructor2Null
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_2102
     * @tc.desc   testMatrixConstructor2Null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixConstructor2Null', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testMatrixConstructor2Null';
      try {
        let matrix = new drawing.Matrix(null);
        console.info(msg + `drawing Matrix null successed`);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `drawing Matrix null failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        let matrix2 = new drawing.Matrix(undefined);
        console.info(msg + `drawing matrix2 undefined successed`);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `drawing matrix2 undefined failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   testMatrixIsAffineNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_2200
     * @tc.desc   testMatrixIsAffineNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixIsAffineNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testMatrixIsAffineNormal';
      let matrix = new drawing.Matrix();
      try {
        let isAff1 = matrix.isAffine();
        console.info(msg + ' matrix isAffine isAff1 successed');
        expect(isAff1).assertEqual(true);
      } catch (e) {
        console.info(msg + ` matrix isAffine isAff1 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      matrix.setMatrix([-1,-2,-3,-4,-5,-6,-7,-8,-9]);
      try {
        let isAff2 = matrix.isAffine();
        console.info(msg + ' matrix isAffine isAff2 successed');
        expect(isAff2).assertEqual(false);
      } catch (e) {
        console.info(msg + ` matrix isAffine isAff2 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      matrix.setMatrix([0,0,0,0,0,0,0,0,0]);
      try {
        let isAff3 = matrix.isAffine();
        console.info(msg + ' matrix isAffine isAff3 successed');
        expect(isAff3).assertEqual(false);
      } catch (e) {
        console.info(msg + ` matrix isAffine isAff3 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      matrix.setMatrix([1.25,302.2,100.2,20,-1.5,-1,0,300,10]);
      try {
        let isAff4 = matrix.isAffine();
        console.info(msg + ' matrix isAffine isAff4 successed');
        expect(isAff4).assertEqual(false);
      } catch (e) {
        console.info(msg + ` matrix isAffine isAff4 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      matrix.reset();
      try {
        let isAff5 = matrix.isAffine();
        console.info(msg + ' matrix isAffine isAff5 successed');
        expect(isAff5).assertEqual(true);
      } catch (e) {
        console.info(msg + ` matrix isAffine isAff5 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      matrix.setRotation(45,100,100);
      try {
        let isAff6 = matrix.isAffine();
        console.info(msg + ' matrix isAffine isAff6 successed');
        expect(isAff6).assertEqual(true);
      } catch (e) {
        console.info(msg + ` matrix isAffine isAff6 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      matrix.postTranslate(100,100);
      try {
        let isAff7 = matrix.isAffine();
        console.info(msg + ' matrix isAffine isAff7 successed');
        expect(isAff7).assertEqual(true);
      } catch (e) {
        console.info(msg + ` matrix isAffine isAff7 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      matrix.reset()
      try {
        let isAff8 = matrix.isAffine();
        console.info(msg + ' matrix isAffine isAff8 successed');
        expect(isAff8).assertEqual(true);
      } catch (e) {
        console.info(msg + ` matrix isAffine isAff8 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testMatrixIsAffineMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_2201
     * @tc.desc   testMatrixIsAffineMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixIsAffineMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testMatrixIsAffineMultipleCalls';
      let matrix = new drawing.Matrix();
      for (let i = 0; i < 20; i += 1) {
        try {
          let isAff = matrix.isAffine();
          console.info(msg + `matrix.isAffine success step: ` + i);
          expect(isAff).assertEqual(true);
        } catch (e) {
          console.info(msg + `matrix.isAffine error. errorCode is: ${e.code} + errormsg is: ${e.message}} step: ${i}`);
          expect().assertFail()
        }
      }
    });
    /**
     * @tc.name   testMatrixSetSkewNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_2300
     * @tc.desc   testMatrixSetSkewNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixSetSkewNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testMatrixSetSkewNormal';
      let matrix = new drawing.Matrix();
      matrix.setSkew(2, 2, 2, 2);
      try {
        let actualValues = matrix.getAll();
        console.info(msg + ' matrix getAll actualValues successed');
        console.info(msg + "matrix actualValues: " + matrix.getAll().toString());
        expect(actualValues[0] ==1 && actualValues[1] ==2 && actualValues[2] ==-4 && actualValues[3] ==2 &&
          actualValues[4] ==1 && actualValues[5] ==-4 && actualValues[6] ==0 && actualValues[7] ==0 &&
          actualValues[8] ==1).assertEqual(true);
      } catch (e) {
        console.info(msg + ` matrix getAll actualValues errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      matrix.setSkew(0.5, 0.9, 0.5, 2.2);
      try {
        let actualValues2 = matrix.getAll();
        console.info(msg + ' matrix getAll actualValues2 successed');
        console.info(msg + "matrix actualValues2: " + matrix.getAll().toString());
        expect(actualValues2[0] ==1 && actualValues2[1] ==0.5 && actualValues2[2] ==-1.100000023841858 && actualValues2[3] ==0.8999999761581421 &&
          actualValues2[4] ==1 && actualValues2[5] ==-0.44999998807907104 && actualValues2[6] ==0 && actualValues2[7] ==0 &&
          actualValues2[8] ==1).assertEqual(true);
      } catch (e) {
        console.info(msg + ` matrix getAll actualValues2 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      matrix.setSkew(0, 0, 0, 0);
      try {
        let actualValues3 = matrix.getAll();
        console.info(msg + ' matrix getAll actualValues3 successed');
        console.info(msg + "matrix actualValues3: " + matrix.getAll().toString());
        expect(actualValues3[0] ==1 && actualValues3[1] ==0 && actualValues3[2] ==0 && actualValues3[3] ==0 &&
          actualValues3[4] ==1 && actualValues3[5] ==0 && actualValues3[6] ==0 && actualValues3[7] ==0 &&
          actualValues3[8] ==1).assertEqual(true);
      } catch (e) {
        console.info(msg + ` matrix getAll actualValues3 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      matrix.setSkew(-1.5, -2, -2.75, -1);
      try {
        let actualValues4 = matrix.getAll();
        console.info(msg + ' matrix getAll actualValues4 successed');
        console.info(msg + "matrix actualValues4: " + matrix.getAll().toString());
        expect(actualValues4[0] ==1 && actualValues4[1] ==-1.5 && actualValues4[2] ==-1.5 && actualValues4[3] ==-2 &&
          actualValues4[4] ==1 && actualValues4[5] ==-5.5 && actualValues4[6] ==0 && actualValues4[7] ==0 &&
          actualValues4[8] ==1).assertEqual(true);
      } catch (e) {
        console.info(msg + ` matrix getAll actualValues4 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      matrix.setSkew(1.5, -2, 1, 1);
      try {
        let actualValues5 = matrix.getAll();
        console.info(msg + ' matrix getAll actualValues5 successed');
        console.info(msg + "matrix actualValues5: " + matrix.getAll().toString());
        expect(actualValues5[0] ==1 && actualValues5[1] ==1.5 && actualValues5[2] ==-1.5 && actualValues5[3] ==-2 &&
          actualValues5[4] ==1 && actualValues5[5] ==2 && actualValues5[6] ==0 && actualValues5[7] ==0 &&
          actualValues5[8] ==1).assertEqual(true);
      } catch (e) {
        console.info(msg + ` matrix getAll actualValues5 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testMatrixSetSkewMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_2301
     * @tc.desc   testMatrixSetSkewMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixSetSkewMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testMatrixSetSkewMultipleCalls';
      let matrix = new drawing.Matrix();
      for (let i = 0; i < 20; i += 1) {
        try {
          matrix.setSkew(Math.random() *10, Math.random() *10, Math.random() *10, Math.random() *10);
          console.info(msg + `matrix.setSkew success step: ` + i);
        } catch (e) {
          console.info(msg + `matrix.setSkew error. errorCode is: ${e.code} + errormsg is: ${e.message}} step: ${i}`);
          expect().assertFail()
        }
      }
    });
    /**
     * @tc.name   testMatrixSetSkewNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_2302
     * @tc.desc   testMatrixSetSkewNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixSetSkewNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testMatrixSetSkewNull';
      let matrix = new drawing.Matrix();
      try {
        matrix.setSkew(null, 2, 2, 2);
        console.info(msg + `drawing Matrix setSkew 1 successed`);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `drawing Matrix setSkew 1 failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        matrix.setSkew(undefined, 2, 2, 2);
        console.info(msg + `drawing Matrix setSkew 2 successed`);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `drawing Matrix setSkew 2 failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        matrix.setSkew(2, null, 2, 2);
        console.info(msg + `drawing Matrix setSkew 3 successed`);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `drawing Matrix setSkew 3 failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        matrix.setSkew(2, undefined, 2, 2);
        console.info(msg + `drawing Matrix setSkew 4 successed`);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `drawing Matrix setSkew 4 failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        matrix.setSkew(2, 2, null, 2);
        console.info(msg + `drawing Matrix setSkew 5 successed`);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `drawing Matrix setSkew 5 failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        matrix.setSkew(2, 2, undefined, 2);
        console.info(msg + `drawing Matrix setSkew 6 successed`);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `drawing Matrix setSkew 6 failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        matrix.setSkew(2, 2, 2, null);
        console.info(msg + `drawing Matrix setSkew 7 successed`);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `drawing Matrix setSkew 7 failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        matrix.setSkew(2, 2, 2, undefined);
        console.info(msg + `drawing Matrix setSkew 8 successed`);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `drawing Matrix setSkew 8 failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   testMatrixSetMatrixNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_2400
     * @tc.desc   testMatrixSetMatrixNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixSetMatrixNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testMatrixSetMatrixNormal';
      let matrix = new drawing.Matrix();
      let matrixnew = new drawing.Matrix();
      matrixnew.setScale(0.5,0.5,0.5,0.5);
      matrixnew.setMatrix(matrix);
      try {
        let actualValues = matrixnew.getAll();
        console.info(msg + ' matrix getAll actualValues successed');
        console.info(msg + "matrix actualValues: " + matrixnew.getAll().toString());
        expect(actualValues[0] ==1 && actualValues[1] ==0 && actualValues[2] ==0 && actualValues[3] ==0 &&
          actualValues[4] ==1 && actualValues[5] ==0 && actualValues[6] ==0 && actualValues[7] ==0 &&
          actualValues[8] ==1).assertEqual(true);
      } catch (e) {
        console.info(msg + ` matrix getAll actualValues errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      let value1 : Array<number> = [1.1, 2.2, 3.3, 4.4, 5.5, 6.6, 7.7, 8.8, 9.9];
      matrix.setMatrix(value1);
      matrixnew.setMatrix(matrix);
      try {
        let actualValues2 = matrixnew.getAll();
        console.info(msg + ' matrix getAll actualValues2 successed');
        console.info(msg + "matrix actualValues2: " + matrixnew.getAll().toString());
        expect(actualValues2[0] ==1.100000023841858 && actualValues2[1] ==2.200000047683716 && actualValues2[2] ==3.299999952316284 &&
          actualValues2[3] ==4.400000095367432 &&actualValues2[4] ==5.5 && actualValues2[5] ==6.599999904632568 &&
          actualValues2[6] ==7.699999809265137 && actualValues2[7] ==8.800000190734863 && actualValues2[8] ==9.899999618530273).assertEqual(true);
      } catch (e) {
        console.info(msg + ` matrix getAll actualValues2 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      let value2 : Array<number> = [2, 2, 2, 2, 2, 2, 2, 2, 2];
      matrix.setMatrix(value2);
      matrixnew.setMatrix(matrix);
      try {
        let actualValues3 = matrixnew.getAll();
        console.info(msg + ' matrix getAll actualValues3 successed');
        console.info(msg + "matrix actualValues3: " + matrixnew.getAll().toString());
        expect(actualValues3[0] ==2 && actualValues3[1] ==2 && actualValues3[2] ==2 &&
          actualValues3[3] ==2 &&actualValues3[4] ==2 && actualValues3[5] ==2 &&
          actualValues3[6] ==2 && actualValues3[7] ==2 && actualValues3[8] ==2).assertEqual(true);
      } catch (e) {
        console.info(msg + ` matrix getAll actualValues3 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      let value3 : Array<number> = [-1, -2, -3, -4, -5, -6, -7, -8, -9];
      matrix.setMatrix(value3);
      matrixnew.setMatrix(matrix);
      try {
        let actualValues4 = matrixnew.getAll();
        console.info(msg + ' matrix getAll actualValues4 successed');
        console.info(msg + "matrix actualValues4: " + matrixnew.getAll().toString());
        expect(actualValues4[0] ==-1 && actualValues4[1] ==-2 && actualValues4[2] ==-3 &&
          actualValues4[3] ==-4 &&actualValues4[4] ==-5 && actualValues4[5] ==-6 &&
          actualValues4[6] ==-7 && actualValues4[7] ==-8 && actualValues4[8] ==-9).assertEqual(true);
      } catch (e) {
        console.info(msg + ` matrix getAll actualValues4 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      let matrix1 = new drawing.Matrix();
      matrix1.setRotation(60, 20, 50);
      matrixnew.setMatrix(matrix1);
      try {
        let actualValues5 = matrixnew.getAll();
        console.info(msg + ' matrix getAll actualValues5 successed');
        console.info(msg + "matrix actualValues5: " + matrixnew.getAll().toString());
        expect(actualValues5[0] ==0.4999999701976776 && actualValues5[1] ==-0.866025447845459 && actualValues5[2] ==53.301273345947266 &&
          actualValues5[3] ==0.866025447845459 &&actualValues5[4] ==0.4999999701976776 && actualValues5[5] ==7.67949104309082 &&
          actualValues5[6] ==0 && actualValues5[7] ==0 && actualValues5[8] ==1).assertEqual(true);
      } catch (e) {
        console.info(msg + ` matrix getAll actualValues5 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      let matrix2 = new drawing.Matrix();
      matrix2.setTranslation(50, -25);
      matrixnew.setMatrix(matrix2);
      try {
        let actualValues6 = matrixnew.getAll();
        console.info(msg + ' matrix getAll actualValues6 successed');
        console.info(msg + "matrix actualValues6: " + matrixnew.getAll().toString());
        expect(actualValues6[0] ==1 && actualValues6[1] ==0 && actualValues6[2] ==50 &&
          actualValues6[3] ==0 &&actualValues6[4] ==1 && actualValues6[5] ==-25 &&
          actualValues6[6] ==0 && actualValues6[7] ==0 && actualValues6[8] ==1).assertEqual(true);
      } catch (e) {
        console.info(msg + ` matrix getAll actualValues6 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testMatrixSetMatrixMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_2401
     * @tc.desc   testMatrixSetMatrixMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixSetMatrixMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testMatrixSetMatrixMultipleCalls';
      let matrix = new drawing.Matrix();
      let matrixnew = new drawing.Matrix();
      for (let i = 0; i < 20; i += 1) {
        try {
          let value3 : Array<number> = [Math.random() *10,Math.random() *10, Math.random() *10, Math.random() *10, Math.random() *10, Math.random() *10, Math.random() *10, Math.random() *10,Math.random() *10];
          matrix.setMatrix(value3);
          matrixnew.setMatrix(matrix)
          console.info(msg + `matrix.setMatrix success step: ` + i);
        } catch (e) {
          console.info(msg + `matrix.setMatrix error. errorCode is: ${e.code} + errormsg is: ${e.message}} step: ${i}`);
          expect().assertFail()
        }
      }
    });
    /**
     * @tc.name   testMatrixSetMatrixNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_2402
     * @tc.desc   testMatrixSetMatrixNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixSetMatrixNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testMatrixSetMatrixNull';
      let matrix = new drawing.Matrix();
      try {
        matrix.setMatrix(null);
        console.info(msg + `Matrix setMatrix null successed`);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `setMatrix setMatrix null failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        matrix.setMatrix(undefined);
        console.info(msg + `Matrix setMatrix undefined successed`);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `setMatrix setMatrix undefined failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   testMatrixSetConcatNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_2500
     * @tc.desc   testMatrixSetConcatNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixSetConcatNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testMatrixSetConcatNormal';
      let matrixA = new drawing.Matrix();
      let matrixB = new drawing.Matrix();
      matrixA.setConcat(matrixA, matrixB);
      try {
        let actualValues = matrixA.getAll();
        console.info(msg + ' matrix getAll actualValues successed');
        console.info(msg + "matrix actualValues: " + matrixA.getAll().toString());
        expect(actualValues[0] ==1 && actualValues[1] ==0 && actualValues[2] ==0 && actualValues[3] ==0 &&
          actualValues[4] ==1 && actualValues[5] ==0 && actualValues[6] ==0 && actualValues[7] ==0 &&
          actualValues[8] ==1).assertEqual(true);
      } catch (e) {
        console.info(msg + ` matrix getAll actualValues errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      let value2 : Array<number> = [2, 2, 2, 2, 2, 2, 2, 2, 2];
      matrixA.setMatrix(value2);
      matrixB.setTranslation(50, -25);
      matrixA.setConcat(matrixA, matrixB);
      try {
        let actualValues2 = matrixA.getAll();
        console.info(msg + ' matrix getAll actualValues2 successed');
        console.info(msg + "matrix actualValues2: " + matrixA.getAll().toString());
        expect(actualValues2[0] ==2 && actualValues2[1] ==2 && actualValues2[2] ==52 && actualValues2[3] ==2 &&
          actualValues2[4] ==2 && actualValues2[5] ==52 && actualValues2[6] ==2 && actualValues2[7] ==2 &&
          actualValues2[8] ==52).assertEqual(true);
      } catch (e) {
        console.info(msg + ` matrix getAll actualValues2 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      matrixA.reset();
      matrixB.reset();
      matrixB.setRotation(45,100,200);
      matrixA.setConcat(matrixA, matrixB);
      try {
        let actualValues3 = matrixA.getAll();
        console.info(msg + ' matrix getAll actualValues3 successed');
        console.info(msg + "matrix actualValues3: " + matrixA.getAll().toString());
        expect(actualValues3[0] ==0.7071067690849304 && actualValues3[1] ==-0.7071067690849304 && actualValues3[2] ==170.71067810058594 && actualValues3[3] ==0.7071067690849304 &&
          actualValues3[4] ==0.7071067690849304 && actualValues3[5] ==-12.132030487060547 && actualValues3[6] ==0 && actualValues3[7] ==0 && actualValues3[8] ==1).assertEqual(true);
      } catch (e) {
        console.info(msg + ` matrix getAll actualValues3 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      matrixA.reset();
      matrixB.reset();
      matrixA.setScale(2,-5,50,40);
      matrixA.setConcat(matrixA, matrixB);
      try {
        let actualValues4 = matrixA.getAll();
        console.info(msg + ' matrix getAll actualValues4 successed');
        console.info(msg + "matrix actualValues4: " + matrixA.getAll().toString());
        expect(actualValues4[0] ==2 && actualValues4[1] ==0 && actualValues4[2] ==-50 && actualValues4[3] ==0 &&
          actualValues4[4] ==-5 && actualValues4[5] ==240 && actualValues4[6] ==0 && actualValues4[7] ==0 &&
          actualValues4[8] ==1).assertEqual(true);
      } catch (e) {
        console.info(msg + ` matrix getAll actualValues4 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testMatrixSetConcatMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_2501
     * @tc.desc   testMatrixSetConcatMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixSetConcatMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testMatrixSetConcatMultipleCalls';
      let matrixA = new drawing.Matrix();
      let matrixB = new drawing.Matrix();
      for (let i = 0; i < 20; i += 1) {
        try {
          matrixA.setConcat(matrixA, matrixB);
          let actualValues = matrixA.getAll();
          console.info(msg + `matrixA.getAll success step: ` + i);
          console.info(msg + "matrixA.getAll: " + matrixA.getAll().toString());
          expect(actualValues[0] ==1 && actualValues[1] ==0 && actualValues[2] ==0 && actualValues[3] ==0 &&
            actualValues[4] ==1 && actualValues[5] ==0 && actualValues[6] ==0 && actualValues[7] ==0 &&
            actualValues[8] ==1).assertEqual(true);
        } catch (e) {
          console.info(msg + `matrixA.getAll error. errorCode is: ${e.code} + errormsg is: ${e.message}} step: ${i}`);
          expect().assertFail()
        }
      }
    });
    /**
     * @tc.name   testMatrixSetConcatNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_2502
     * @tc.desc   testMatrixSetConcatNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixSetConcatNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testMatrixSetConcatNull';
      let matrixA = new drawing.Matrix();
      let matrixB = new drawing.Matrix();
      try {
        matrixA.setConcat(null, matrixB);
        console.info(msg + `Matrix setConcat 1 successed`);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `Matrix setConcat 1 failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        matrixA.setConcat(undefined, matrixB);
        console.info(msg + `Matrix setConcat 2 successed`);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `Matrix setConcat 2 failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        matrixA.setConcat(matrixA, null);
        console.info(msg + `Matrix setConcat 3 successed`);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `Matrix setConcat 3 failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        matrixA.setConcat(matrixA, undefined);
        console.info(msg + `Matrix setConcat 4 successed`);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `Matrix setConcat 4 failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   testMatrixPostConcatNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_2600
     * @tc.desc   testMatrixPostConcatNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixPostConcatNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testMatrixPostConcatNormal';
      let matrixA = new drawing.Matrix();
      let matrixB = new drawing.Matrix();
      matrixA.postConcat(matrixB);
      try {
        let actualValues = matrixA.getAll();
        console.info(msg + ' matrix getAll actualValues successed');
        console.info(msg + "matrix actualValues: " + matrixA.getAll().toString());
        expect(actualValues[0] ==1 && actualValues[1] ==0 && actualValues[2] ==0 && actualValues[3] ==0 &&
          actualValues[4] ==1 && actualValues[5] ==0 && actualValues[6] ==0 && actualValues[7] ==0 &&
          actualValues[8] ==1).assertEqual(true);
      } catch (e) {
        console.info(msg + ` matrix getAll actualValues errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      let value2 : Array<number> = [2, 2, 2, 2, 2, 2, 2, 2, 2];
      matrixA.setMatrix(value2);
      matrixB.setTranslation(50, -25);
      matrixA.postConcat(matrixB);
      try {
        let actualValues2 = matrixA.getAll();
        console.info(msg + ' matrix getAll actualValues2 successed');
        console.info(msg + "matrix actualValues2: " + matrixA.getAll().toString());
        expect(actualValues2[0] ==102 && actualValues2[1] ==102 && actualValues2[2] ==102 && actualValues2[3] ==-48 &&
          actualValues2[4] ==-48 && actualValues2[5] ==-48 && actualValues2[6] ==2 && actualValues2[7] ==2 &&
          actualValues2[8] ==2).assertEqual(true);
      } catch (e) {
        console.info(msg + ` matrix getAll actualValues2 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      matrixA.reset();
      matrixB.reset();
      matrixB.setRotation(45,100,200);
      matrixA.postConcat(matrixB);
      try {
        let actualValues3 = matrixA.getAll();
        console.info(msg + ' matrix getAll actualValues3 successed');
        console.info(msg + "matrix actualValues3: " + matrixA.getAll().toString());
        expect(actualValues3[0] ==0.7071067690849304 && actualValues3[1] ==-0.7071067690849304 && actualValues3[2] ==170.71067810058594 && actualValues3[3] ==0.7071067690849304 &&
          actualValues3[4] ==0.7071067690849304 && actualValues3[5] ==-12.132030487060547 && actualValues3[6] ==0 && actualValues3[7] ==0 && actualValues3[8] ==1).assertEqual(true);
      } catch (e) {
        console.info(msg + ` matrix getAll actualValues3 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      matrixA.reset();
      matrixB.reset();
      matrixA.setScale(2,-5,50,40);
      matrixA.postConcat(matrixB);
      try {
        let actualValues4 = matrixA.getAll();
        console.info(msg + ' matrix getAll actualValues4 successed');
        console.info(msg + "matrix actualValues4: " + matrixA.getAll().toString());
        expect(actualValues4[0] ==2 && actualValues4[1] ==0 && actualValues4[2] ==-50 && actualValues4[3] ==0 &&
          actualValues4[4] ==-5 && actualValues4[5] ==240 && actualValues4[6] ==0 && actualValues4[7] ==0 &&
          actualValues4[8] ==1).assertEqual(true);
      } catch (e) {
        console.info(msg + ` matrix getAll actualValues4 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testMatrixPostConcatMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_2601
     * @tc.desc   testMatrixPostConcatMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixPostConcatMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testMatrixPostConcatMultipleCalls';
      let matrixA = new drawing.Matrix();
      let matrixB = new drawing.Matrix();
      for (let i = 0; i < 20; i += 1) {
        try {
          matrixA.postConcat(matrixB);
          let actualValues = matrixA.getAll();
          console.info(msg + `matrixA.getAll success step: ` + i);
          console.info(msg + "matrixA.getAll: " + matrixA.getAll().toString());
          expect(actualValues[0] ==1 && actualValues[1] ==0 && actualValues[2] ==0 && actualValues[3] ==0 &&
            actualValues[4] ==1 && actualValues[5] ==0 && actualValues[6] ==0 && actualValues[7] ==0 &&
            actualValues[8] ==1).assertEqual(true);
        } catch (e) {
          console.info(msg + `matrixA.getAll error. errorCode is: ${e.code} + errormsg is: ${e.message}} step: ${i}`);
          expect().assertFail()
        }
      }
    });
    /**
     * @tc.name   testMatrixPostConcatNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_2602
     * @tc.desc   testMatrixPostConcatNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixPostConcatNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testMatrixPostConcatNull';
      let matrixA = new drawing.Matrix();
      let matrixB = new drawing.Matrix();
      try {
        matrixA.postConcat(null);
        console.info(msg + `Matrix postConcat 1 successed`);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `Matrix postConcat 1 failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        matrixA.postConcat(undefined);
        console.info(msg + `Matrix postConcat 2 successed`);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `Matrix postConcat 2 failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   testMatrixPostSkewNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_2700
     * @tc.desc   testMatrixPostSkewNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixPostSkewNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testMatrixPostSkewNormal';
      let matrix = new drawing.Matrix();
      matrix.postSkew(2, 2, 2, 2);
      try {
        let actualValues = matrix.getAll();
        console.info(msg + ' matrix getAll actualValues successed');
        console.info(msg + "matrix actualValues: " + matrix.getAll().toString());
        expect(actualValues[0] ==1 && actualValues[1] ==2 && actualValues[2] ==-4 && actualValues[3] ==2 &&
          actualValues[4] ==1 && actualValues[5] ==-4 && actualValues[6] ==0 && actualValues[7] ==0 &&
          actualValues[8] ==1).assertEqual(true);
      } catch (e) {
        console.info(msg + ` matrix getAll actualValues errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      matrix.reset();
      matrix.postSkew(0.5, 0.9, 0.5, 2.2);
      try {
        let actualValues2 = matrix.getAll();
        console.info(msg + ' matrix getAll actualValues2 successed');
        console.info(msg + "matrix actualValues2: " + matrix.getAll().toString());
        expect(actualValues2[0] ==1 && actualValues2[1] ==0.5 && actualValues2[2] ==-1.100000023841858 && actualValues2[3] ==0.8999999761581421 &&
          actualValues2[4] ==1 && actualValues2[5] ==-0.44999998807907104 && actualValues2[6] ==0 && actualValues2[7] ==0 &&
          actualValues2[8] ==1).assertEqual(true);
      } catch (e) {
        console.info(msg + ` matrix getAll actualValues2 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      matrix.reset();
      matrix.postSkew(0, 0, 0, 0);
      try {
        let actualValues3 = matrix.getAll();
        console.info(msg + ' matrix getAll actualValues3 successed');
        console.info(msg + "matrix actualValues3: " + matrix.getAll().toString());
        expect(actualValues3[0] ==1 && actualValues3[1] ==0 && actualValues3[2] ==0 && actualValues3[3] ==0 &&
          actualValues3[4] ==1 && actualValues3[5] ==0 && actualValues3[6] ==0 && actualValues3[7] ==0 &&
          actualValues3[8] ==1).assertEqual(true);
      } catch (e) {
        console.info(msg + ` matrix getAll actualValues3 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      matrix.reset();
      matrix.postSkew(-1.5, -2, -2.75, -1);
      try {
        let actualValues4 = matrix.getAll();
        console.info(msg + ' matrix getAll actualValues4 successed');
        console.info(msg + "matrix actualValues4: " + matrix.getAll().toString());
        expect(actualValues4[0] ==1 && actualValues4[1] ==-1.5 && actualValues4[2] ==-1.5 && actualValues4[3] ==-2 &&
          actualValues4[4] ==1 && actualValues4[5] ==-5.5 && actualValues4[6] ==0 && actualValues4[7] ==0 &&
          actualValues4[8] ==1).assertEqual(true);
      } catch (e) {
        console.info(msg + ` matrix getAll actualValues4 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      matrix.reset();
      matrix.postSkew(2.5, -2, 0.5, 2);
      try {
        let actualValues5 = matrix.getAll();
        console.info(msg + ' matrix getAll actualValues5 successed');
        console.info(msg + "matrix actualValues5: " + matrix.getAll().toString());
        expect(actualValues5[0] ==1 && actualValues5[1] ==2.5 && actualValues5[2] ==-5 && actualValues5[3] ==-2 &&
          actualValues5[4] ==1 && actualValues5[5] ==1 && actualValues5[6] ==0 && actualValues5[7] ==0 &&
          actualValues5[8] ==1).assertEqual(true);
      } catch (e) {
        console.info(msg + ` matrix getAll actualValues5 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      matrix.postSkew(1, -1, 1, 1);
      try {
        let actualValues6 = matrix.getAll();
        console.info(msg + ' matrix getAll actualValues6 successed');
        console.info(msg + "matrix actualValues6: " + matrix.getAll().toString());
        expect(actualValues6[0] ==-1 && actualValues6[1] ==3.5 && actualValues6[2] ==-5 && actualValues6[3] ==-3 &&
          actualValues6[4] ==-1.5 && actualValues6[5] ==7 && actualValues6[6] ==0 && actualValues6[7] ==0 &&
          actualValues6[8] ==1).assertEqual(true);
      } catch (e) {
        console.info(msg + ` matrix getAll actualValues6 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testMatrixPostSkewMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_2701
     * @tc.desc   testMatrixPostSkewMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixPostSkewMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testMatrixPostSkewMultipleCalls';
      let matrix = new drawing.Matrix();
      for (let i = 0; i < 20; i += 1) {
        try {
          matrix.postSkew(Math.random() *5, Math.random() *5, Math.random() *5, Math.random() *5);
          console.info(msg + `matrixA.postSkew success step: ` + i);
        } catch (e) {
          console.info(msg + `matrixA.postSkew error. errorCode is: ${e.code} + errormsg is: ${e.message}} step: ${i}`);
          expect().assertFail()
        }
      }
    });
    /**
     * @tc.name   testMatrixPostSkewNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_2702
     * @tc.desc   testMatrixPostSkewNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixPostSkewNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testMatrixPostSkewNull';
      let matrix = new drawing.Matrix();
      try {
        matrix.postSkew(null, 2, 2, 2);
        console.info(msg + `Matrix postSkew 1 successed`);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `Matrix postSkew 1 failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        matrix.postSkew(undefined, 2, 2, 2);
        console.info(msg + `Matrix postSkew 2 successed`);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `Matrix postSkew 2 failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        matrix.postSkew(2, null, 2, 2);
        console.info(msg + `Matrix postSkew 3 successed`);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `Matrix postSkew 3 failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        matrix.postSkew(2, undefined, 2, 2);
        console.info(msg + `Matrix postSkew 4 successed`);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `Matrix postSkew 4 failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        matrix.postSkew(2, 2, null, 2);
        console.info(msg + `Matrix postSkew 5 successed`);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `Matrix postSkew 5 failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        matrix.postSkew(2, 2, undefined, 2);
        console.info(msg + `Matrix postSkew 6 successed`);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `Matrix postSkew 6 failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        matrix.postSkew(2, 2, 2, null);
        console.info(msg + `Matrix postSkew 7 successed`);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `Matrix postSkew 7 failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        matrix.postSkew(2, 2, 2, undefined);
        console.info(msg + `Matrix postSkew 8 successed`);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `Matrix postSkew 8 failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   testMatrixPreSkewNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_2800
     * @tc.desc   testMatrixPreSkewNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixPreSkewNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testMatrixPreSkewNormal';
      let matrix = new drawing.Matrix();
      matrix.preSkew(2, 2, 2, 2);
      try {
        let actualValues = matrix.getAll();
        console.info(msg + ' matrix getAll actualValues successed');
        console.info(msg + "matrix actualValues: " + matrix.getAll().toString());
        expect(actualValues[0] ==1 && actualValues[1] ==2 && actualValues[2] ==-4 && actualValues[3] ==2 &&
          actualValues[4] ==1 && actualValues[5] ==-4 && actualValues[6] ==0 && actualValues[7] ==0 &&
          actualValues[8] ==1).assertEqual(true);
      } catch (e) {
        console.info(msg + ` matrix getAll actualValues errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      matrix.reset();
      matrix.preSkew(0.5, 0.9, 0.5, 2.2);
      try {
        let actualValues2 = matrix.getAll();
        console.info(msg + ' matrix getAll actualValues2 successed');
        console.info(msg + "matrix actualValues2: " + matrix.getAll().toString());
        expect(actualValues2[0] ==1 && actualValues2[1] ==0.5 && actualValues2[2] ==-1.100000023841858 && actualValues2[3] ==0.8999999761581421 &&
          actualValues2[4] ==1 && actualValues2[5] ==-0.44999998807907104 && actualValues2[6] ==0 && actualValues2[7] ==0 &&
          actualValues2[8] ==1).assertEqual(true);
      } catch (e) {
        console.info(msg + ` matrix getAll actualValues2 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      matrix.reset();
      matrix.preSkew(0, 0, 0, 0);
      try {
        let actualValues3 = matrix.getAll();
        console.info(msg + ' matrix getAll actualValues3 successed');
        console.info(msg + "matrix actualValues3: " + matrix.getAll().toString());
        expect(actualValues3[0] ==1 && actualValues3[1] ==0 && actualValues3[2] ==0 && actualValues3[3] ==0 &&
          actualValues3[4] ==1 && actualValues3[5] ==0 && actualValues3[6] ==0 && actualValues3[7] ==0 &&
          actualValues3[8] ==1).assertEqual(true);
      } catch (e) {
        console.info(msg + ` matrix getAll actualValues3 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      matrix.reset();
      matrix.preSkew(-1.5, -2, -2.75, -1);
      try {
        let actualValues4 = matrix.getAll();
        console.info(msg + ' matrix getAll actualValues4 successed');
        console.info(msg + "matrix actualValues4: " + matrix.getAll().toString());
        expect(actualValues4[0] ==1 && actualValues4[1] ==-1.5 && actualValues4[2] ==-1.5 && actualValues4[3] ==-2 &&
          actualValues4[4] ==1 && actualValues4[5] ==-5.5 && actualValues4[6] ==0 && actualValues4[7] ==0 &&
          actualValues4[8] ==1).assertEqual(true);
      } catch (e) {
        console.info(msg + ` matrix getAll actualValues4 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      matrix.reset();
      matrix.preSkew(2.5, -2, 0.5, 2);
      try {
        let actualValues5 = matrix.getAll();
        console.info(msg + ' matrix getAll actualValues5 successed');
        console.info(msg + "matrix actualValues5: " + matrix.getAll().toString());
        expect(actualValues5[0] ==1 && actualValues5[1] ==2.5 && actualValues5[2] ==-5 && actualValues5[3] ==-2 &&
          actualValues5[4] ==1 && actualValues5[5] ==1 && actualValues5[6] ==0 && actualValues5[7] ==0 &&
          actualValues5[8] ==1).assertEqual(true);
      } catch (e) {
        console.info(msg + ` matrix getAll actualValues5 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      matrix.preSkew(1, -1, 1, 1);
      try {
        let actualValues6 = matrix.getAll();
        console.info(msg + ' matrix getAll actualValues6 successed');
        console.info(msg + "matrix actualValues6: " + matrix.getAll().toString());
        expect(actualValues6[0] ==-1.5 && actualValues6[1] ==3.5 && actualValues6[2] ==-3.5 && actualValues6[3] ==-3 &&
          actualValues6[4] ==-1 && actualValues6[5] ==4 && actualValues6[6] ==0 && actualValues6[7] ==0 &&
          actualValues6[8] ==1).assertEqual(true);
      } catch (e) {
        console.info(msg + ` matrix getAll actualValues6 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testMatrixPreSkewMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_2801
     * @tc.desc   testMatrixPreSkewMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixPreSkewMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testMatrixPreSkewMultipleCalls';
      let matrix = new drawing.Matrix();
      for (let i = 0; i < 20; i += 1) {
        try {
          matrix.preSkew(Math.random() *5, Math.random() *5, Math.random() *5, Math.random() *5);
          console.info(msg + `matrixA.preSkew success step: ` + i);
        } catch (e) {
          console.info(msg + `matrixA.preSkew error. errorCode is: ${e.code} + errormsg is: ${e.message}} step: ${i}`);
          expect().assertFail()
        }
      }
    });
    /**
     * @tc.name   testMatrixPreSkewNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_2802
     * @tc.desc   testMatrixPreSkewNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixPreSkewNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testMatrixPreSkewNull';
      let matrix = new drawing.Matrix();
      try {
        matrix.preSkew(null, 2, 2, 2);
        console.info(msg + `Matrix preSkew 1 successed`);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `Matrix preSkew 1 failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        matrix.preSkew(undefined, 2, 2, 2);
        console.info(msg + `Matrix preSkew 2 successed`);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `Matrix preSkew 2 failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        matrix.preSkew(2, null, 2, 2);
        console.info(msg + `Matrix preSkew 3 successed`);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `Matrix preSkew 3 failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        matrix.preSkew(2, undefined, 2, 2);
        console.info(msg + `Matrix preSkew 4 successed`);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `Matrix preSkew 4 failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        matrix.preSkew(2, 2, null, 2);
        console.info(msg + `Matrix preSkew 5 successed`);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `Matrix preSkew 5 failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        matrix.preSkew(2, 2, undefined, 2);
        console.info(msg + `Matrix preSkew 6 successed`);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `Matrix preSkew 6 failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        matrix.preSkew(2, 2, 2, null);
        console.info(msg + `Matrix preSkew 7 successed`);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `Matrix preSkew 7 failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        matrix.preSkew(2, 2, 2, undefined);
        console.info(msg + `Matrix preSkew 8 successed`);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `Matrix preSkew 8 failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   testMatrixMapRadiusNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_2900
     * @tc.desc   testMatrixMapRadiusNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixMapRadiusNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testMatrixMapRadiusNormal';
      let matrix = new drawing.Matrix();
      try {
        let radius = matrix.mapRadius(10);
        console.info(msg + ' matrix mapRadius radius successed');
        console.info(msg + ' matrix mapRadius radius: ' + radius);
        let err = 10 - radius;
        console.info(msg + ' matrix mapRadius radiusError: ' + err);
        expect(err < 0.0001).assertEqual(true);
      } catch (e) {
        console.info(msg + ` matrix mapRadius radius errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let radius2 = matrix.mapRadius(20.364);
        console.info(msg + ' matrix mapRadius radius2 successed');
        console.info(msg + ' matrix mapRadius radius2: ' + radius2);
        let num = Math.floor(radius2 * 1000) / 1000;
        expect(num).assertEqual(20.364);
      } catch (e) {
        console.info(msg + ` matrix mapRadius radius2 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let radius3 = matrix.mapRadius(0);
        console.info(msg + ' matrix mapRadius radius3 successed');
        console.info(msg + ' matrix mapRadius radius3: ' + radius3);
        let err3 = 0 - radius3;
        console.info(msg + ' matrix mapRadius radius3 radiusError: ' + err3);
        expect(err3 < 0.0001).assertEqual(true);
      } catch (e) {
        console.info(msg + ` matrix mapRadius radius3 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let radius4 = matrix.mapRadius(-15);
        console.info(msg + ' matrix mapRadius radius4 successed');
        console.info(msg + ' matrix mapRadius radius4: ' + radius4);
        expect(Math.round(radius4)).assertEqual(15);
        let err4 = 15 - radius4;
        console.info(msg + ' matrix mapRadius radius4 radiusError: ' + err4);
        expect(err4 < 0.0001).assertEqual(true);
      } catch (e) {
        console.info(msg + ` matrix mapRadius radius4 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let radius5 = matrix.mapRadius(-25.5114);
        console.info(msg + ' matrix mapRadius radius5 successed');
        console.info(msg + ' matrix mapRadius radius5: ' + radius5);
        let num2 = Math.floor(radius5 * 1000) / 1000;
        expect(num2).assertEqual(25.511);
      } catch (e) {
        console.info(msg + ` matrix mapRadius radius5 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      matrix.setTranslation(150.35, 50.54);
      try {
        let radius6 = matrix.mapRadius(10);
        console.info(msg + ' matrix mapRadius radius6 successed');
        console.info(msg + ' matrix mapRadius radius6: ' + radius6);
        let err6 = 10 - radius6;
        console.info(msg + ' matrix mapRadius radius6 radiusError: ' + err6);
        expect(err6 < 0.0001).assertEqual(true);
      } catch (e) {
        console.info(msg + ` matrix mapRadius radius6 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      matrix.postRotate(45, 100, 200);
      matrix.preSkew(0.5, 2, 1.5,10);
      try {
        let radius7 = matrix.mapRadius(20.364);
        console.info(msg + ' matrix mapRadius radius7 successed');
        console.info(msg + ' matrix mapRadius radius7: ' + radius7);
        let num3 = Math.floor(radius7 * 1000) / 1000;
        expect(num3).assertEqual(32.198);
      } catch (e) {
        console.info(msg + ` matrix mapRadius radius7 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let radius8 = matrix.mapRadius(0);
        console.info(msg + ' matrix mapRadius radius8 successed');
        console.info(msg + ' matrix mapRadius radius8: ' + radius8);
        expect(radius8).assertEqual(0);
      } catch (e) {
        console.info(msg + ` matrix mapRadius radius8 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      matrix.postSkew(1.5, -2, 3,5);
      try {
        let radius9 = matrix.mapRadius(-15);
        console.info(msg + ' matrix mapRadius radius9 successed');
        console.info(msg + ' matrix mapRadius radius9: ' + radius9);
        let num4 = Math.floor(radius9 * 1000) / 1000;
        expect(num4).assertEqual(45.774);
      } catch (e) {
        console.info(msg + ` matrix mapRadius radius9 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      matrix.preRotate(200, 10.365, 200);
      try {
        let radius10 = matrix.mapRadius(-25.5114);
        console.info(msg + ' matrix mapRadius radius10 successed');
        console.info(msg + ' matrix mapRadius radius10: ' + radius10);
        let num5 = Math.floor(radius10 * 1000) / 1000;
        expect(num5).assertEqual(41.485);
      } catch (e) {
        console.info(msg + ` matrix mapRadius radius10 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testMatrixMapRadiusMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_2901
     * @tc.desc   testMatrixMapRadiusMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixMapRadiusMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testMatrixMapRadiusMultipleCalls';
      let matrix = new drawing.Matrix();
      for (let i = 0; i < 20; i += 1) {
        try {
          let radius = matrix.mapRadius(Math.random() *15)
          console.info(msg + `matrixA.mapRadius success step: ` + i);
        } catch (e) {
          console.info(msg + `matrixA.mapRadius error. errorCode is: ${e.code} + errormsg is: ${e.message}} step: ${i}`);
          expect().assertFail()
        }
      }
    });
    /**
     * @tc.name   testMatrixMapRadiusNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_2902
     * @tc.desc   testMatrixMapRadiusNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixMapRadiusNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testMatrixMapRadiusNull';
      let matrix = new drawing.Matrix();
      try {
        matrix.mapRadius(undefined);
        console.info(msg + `Matrix mapRadius 1 successed`);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `Matrix mapRadius 1 failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        matrix.mapRadius(null);
        console.info(msg + `Matrix mapRadius 2 successed`);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `Matrix mapRadius 2 failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   testMatrixRectStaysRectNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_3000
     * @tc.desc   testMatrixRectStaysRectNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixRectStaysRectNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testMatrixRectStaysRectNormal';
      let matrix = new drawing.Matrix();
      try {
        let rectStaysRect = matrix.rectStaysRect();
        console.info(msg + ' matrix rectStaysRect rectStaysRect successed');
        expect(rectStaysRect).assertEqual(true);
      } catch (e) {
        console.info(msg + ` matrix rectStaysRect rectStaysRect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      matrix.setMatrix([0, 0, 0.5, 0, 0, 2, 0, 0, 1]);
      try {
        let rectStaysRect2 = matrix.rectStaysRect();
        console.info(msg + ' matrix rectStaysRect rectStaysRect2 successed');
        expect(rectStaysRect2).assertEqual(false);
      } catch (e) {
        console.info(msg + ` matrix rectStaysRect rectStaysRect2 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      matrix.setMatrix([1, 0.5, 1, 0.5, 1, 1, 0, 0, 1]);
      try {
        let rectStaysRect3 = matrix.rectStaysRect();
        console.info(msg + ' matrix rectStaysRect rectStaysRect3 successed');
        expect(rectStaysRect3).assertEqual(false);
      } catch (e) {
        console.info(msg + ` matrix rectStaysRect rectStaysRect3 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      matrix.setMatrix([3, 0, 2, 0, 2, 2, 0, 0, 1]);
      try {
        let rectStaysRect4 = matrix.rectStaysRect();
        console.info(msg + ' matrix rectStaysRect rectStaysRect4 successed');
        expect(rectStaysRect4).assertEqual(true);
      } catch (e) {
        console.info(msg + ` matrix rectStaysRect rectStaysRect4 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      matrix.reset();
      matrix.preRotate(90, 100, 100);
      try {
        let rectStaysRect5 = matrix.rectStaysRect();
        console.info(msg + ' matrix rectStaysRect rectStaysRect5 successed');
        expect(rectStaysRect5).assertEqual(true);
      } catch (e) {
        console.info(msg + ` matrix rectStaysRect rectStaysRect5 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      matrix.reset();
      matrix.preRotate(45, 100, 100);
      try {
        let rectStaysRect6 = matrix.rectStaysRect();
        console.info(msg + ' matrix rectStaysRect rectStaysRect6 successed');
        expect(rectStaysRect6).assertEqual(false);
      } catch (e) {
        console.info(msg + ` matrix rectStaysRect rectStaysRect6 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      matrix.reset();
      matrix.preRotate(270, 100, 100);
      try {
        let rectStaysRect7 = matrix.rectStaysRect();
        console.info(msg + ' matrix rectStaysRect rectStaysRect7 successed');
        expect(rectStaysRect7).assertEqual(true);
      } catch (e) {
        console.info(msg + ` matrix rectStaysRect rectStaysRect7 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testMatrixRectStaysRectMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_3001
     * @tc.desc   testMatrixRectStaysRectMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixRectStaysRectMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testMatrixRectStaysRectMultipleCalls';
      let matrix = new drawing.Matrix();
      for (let i = 0; i < 20; i += 1) {
        try {
          let rectStaysRect = matrix.rectStaysRect();
          console.info(msg + `matrixA.rectStaysRect success step: ` + i);
          console.info(msg + `matrixA.rectStaysRect success rectStaysRect: ` + rectStaysRect);
          expect(rectStaysRect).assertEqual(true);
        } catch (e) {
          console.info(msg + `matrixA.mapRadius error. errorCode is: ${e.code} + errormsg is: ${e.message}} step: ${i}`);
          expect().assertFail()
        }
      }
    });
    /**
     * @tc.name   testMatrixSetSinCosNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_3100
     * @tc.desc   testMatrixSetSinCosNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixSetSinCosNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testMatrixSetSinCosNormal';
      let matrix = new drawing.Matrix();
      try {
        matrix.setSinCos(0, 1, 100, 100);
        let actualValues = matrix.getAll();
        console.info(msg + ' matrix getAll actualValues successed');
        console.info(msg + "matrix actualValues: " + matrix.getAll().toString());
        expect(actualValues[0] ==1 && actualValues[1] ==0 && actualValues[2] ==0 && actualValues[3] ==0 &&
          actualValues[4] ==1 && actualValues[5] ==0 && actualValues[6] ==0 && actualValues[7] ==0 && actualValues[8] ==1).assertEqual(true);
      } catch (e) {
        console.info(msg + ` matrix getAll actualValues errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        matrix.reset()
        matrix.setSinCos(1, 0, 50.2515, 80.511);
        let actualValues2 = matrix.getAll();
        console.info(msg + ' matrix getAll actualValues2 successed');
        console.info(msg + "matrix actualValues2: " + matrix.getAll().toString());
        expect(actualValues2[0] ==0 && actualValues2[1] ==-1 && actualValues2[2] ==130.7624969482422 && actualValues2[3] ==1 &&
          actualValues2[4] ==0 && actualValues2[5] ==30.259502410888672 && actualValues2[6] ==0 && actualValues2[7] ==0 && actualValues2[8] ==1).assertEqual(true);
      } catch (e) {
        console.info(msg + ` matrix getAll actualValues2 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        matrix.reset()
        matrix.setSinCos(0.5, 0.5, -100, -80.511);
        let actualValues3 = matrix.getAll();
        console.info(msg + ' matrix getAll actualValues3 successed');
        console.info(msg + "matrix actualValues3: " + matrix.getAll().toString());
        expect(actualValues3[0] ==0.5 && actualValues3[1] ==-0.5 && actualValues3[2] ==-90.25550079345703 && actualValues3[3] ==0.5 &&
          actualValues3[4] ==0.5 && actualValues3[5] ==9.744499206542969 && actualValues3[6] ==0 && actualValues3[7] ==0 && actualValues3[8] ==1).assertEqual(true);
      } catch (e) {
        console.info(msg + ` matrix getAll actualValues3 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        matrix.reset()
        matrix.setSinCos(-1, 1.5, 0, 0);
        let actualValues4 = matrix.getAll();
        console.info(msg + ' matrix getAll actualValues4 successed');
        console.info(msg + "matrix actualValues4: " + matrix.getAll().toString());
        expect(actualValues4[0] ==1.5 && actualValues4[1] ==1 && actualValues4[2] ==0 && actualValues4[3] ==-1 &&
          actualValues4[4] ==1.5 && actualValues4[5] ==0 && actualValues4[6] ==0 && actualValues4[7] ==0 && actualValues4[8] ==1).assertEqual(true);
      } catch (e) {
        console.info(msg + ` matrix getAll actualValues4 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        matrix.reset()
        matrix.setTranslation(150.35, 50.54);
        matrix.postRotate(45, 100, 200);
        matrix.preSkew(0.5, 2, 1.5,10);
        matrix.setSinCos(10, 0.75, 20, 30.522);
        let actualValues5 = matrix.getAll();
        console.info(msg + ' matrix getAll actualValues5 successed');
        console.info(msg + "matrix actualValues5: " + matrix.getAll().toString());
        expect(actualValues5[0] ==0.75 && actualValues5[1] ==-10 && actualValues5[2] ==310.2200012207031 && actualValues5[3] ==10 &&
          actualValues5[4] ==0.75 && actualValues5[5] ==-192.3695068359375 && actualValues5[6] ==0 && actualValues5[7] ==0 && actualValues5[8] ==1).assertEqual(true);
      } catch (e) {
        console.info(msg + ` matrix getAll actualValues5 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testMatrixSetSinCosMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_3101
     * @tc.desc   testMatrixSetSinCosMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixSetSinCosMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testMatrixSetSinCosMultipleCalls';
      let matrix = new drawing.Matrix();
      for (let i = 0; i < 20; i += 1) {
        try {
          matrix.setSinCos(Math.random() *5, Math.random() *10, Math.random() *20, Math.random() *30);
          console.info(msg + `matrixA.setSinCos success step: ` + i);
        } catch (e) {
          console.info(msg + `matrixA.setSinCos error. errorCode is: ${e.code} + errormsg is: ${e.message}} step: ${i}`);
          expect().assertFail()
        }
      }
    });
    /**
     * @tc.name   testMatrixSetSinCosNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_3102
     * @tc.desc   testMatrixSetSinCosNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixSetSinCosNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testMatrixSetSinCosNull';
      let matrix = new drawing.Matrix();
      try {
        matrix.setSinCos(null, 2, 2, 2);
        console.info(msg + `Matrix setSinCos 1 successed`);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `Matrix setSinCos 1 failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        matrix.setSinCos(undefined, 2, 2, 2);
        console.info(msg + `Matrix setSinCos 2 successed`);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `Matrix setSinCos 2 failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        matrix.setSinCos(2, null, 2, 2);
        console.info(msg + `Matrix setSinCos 3 successed`);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `Matrix setSinCos 3 failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        matrix.setSinCos(2, undefined, 2, 2);
        console.info(msg + `Matrix setSinCos 4 successed`);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `Matrix setSinCos 4 failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        matrix.setSinCos(2, 2, null, 2);
        console.info(msg + `Matrix setSinCos 5 successed`);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `Matrix setSinCos 5 failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        matrix.setSinCos(2, 2, undefined, 2);
        console.info(msg + `Matrix setSinCos 6 successed`);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `Matrix setSinCos 6 failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        matrix.setSinCos(2, 2, 2, null);
        console.info(msg + `Matrix setSinCos 7 successed`);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `Matrix setSinCos 7 failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        matrix.setSinCos(2, 2, 2, undefined);
        console.info(msg + `Matrix setSinCos 8 successed`);
        expect().assertFail();
      } catch (e) {
        console.info(msg + `Matrix setSinCos 8 failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });
  })
}