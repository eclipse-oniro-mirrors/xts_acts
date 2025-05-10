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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it } from '@ohos/hypium';
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_1200
     * @tc.name      : testMatrixPostTranslateNormal
     * @tc.desc      : testMatrixPostTranslateNormal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testMatrixPostTranslateNormal', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_1201
     * @tc.name      : testMatrixPostTranslateNull
     * @tc.desc      : testMatrixPostTranslateNull
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testMatrixPostTranslateNull', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_1203
     * @tc.name      : testMatrixPostTranslateMultipleCalls
     * @tc.desc      : testMatrixPostTranslateMultipleCalls
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testMatrixPostTranslateMultipleCalls', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_1300
     * @tc.name      : testMatrixPreRotateNormal
     * @tc.desc      : testMatrixPreRotateNormal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testMatrixPreRotateNormal', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_1301
     * @tc.name      : testMatrixPreRotateNull
     * @tc.desc      : testMatrixPreRotateNull
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testMatrixPreRotateNull', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_1303
     * @tc.name      : testMatrixPreRotateMultipleCalls
     * @tc.desc      : testMatrixPreRotateMultipleCalls
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testMatrixPreRotateMultipleCalls', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_1400
     * @tc.name      : testMatrixPreScaleNormal
     * @tc.desc      : testMatrixPreScaleNormal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testMatrixPreScaleNormal', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_1401
     * @tc.name      : testMatrixPreScaleNull
     * @tc.desc      : testMatrixPreScaleNull
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testMatrixPreScaleNull', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_1403
     * @tc.name      : testMatrixPreScaleMultipleCalls
     * @tc.desc      : testMatrixPreScaleMultipleCalls
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testMatrixPreScaleMultipleCalls', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_1500
     * @tc.name      : testMatrixPreTranslateNormal
     * @tc.desc      : testMatrixPreTranslateNormal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testMatrixPreTranslateNormal', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_1501
     * @tc.name      : testMatrixPreTranslateNull
     * @tc.desc      : testMatrixPreTranslateNull
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testMatrixPreTranslateNull', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_1503
     * @tc.name      : testMatrixPreTranslateMultipleCalls
     * @tc.desc      : testMatrixPreTranslateMultipleCalls
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testMatrixPreTranslateMultipleCalls', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_1600
     * @tc.name      : testMatrixResetNormal
     * @tc.desc      : testMatrixResetNormal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testMatrixResetNormal', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_1602
     * @tc.name      : testMatrixResetMultipleCalls
     * @tc.desc      : testMatrixResetMultipleCalls
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testMatrixResetMultipleCalls', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_1700
     * @tc.name      : testMatrixMapPointsNormal
     * @tc.desc      : testMatrixMapPointsNormal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testMatrixMapPointsNormal', DEFAULT, () => {
      const msg = 'testMatrixMapPointsNormal';
      let matrix = new drawing.Matrix();

      try {
        let src: Array<common2D.Point> = [{x:10,y:10},{x:20.1,y:20.1},{x:30,y:30}];
        let dst: Array<common2D.Point> =matrix.mapPoints(src);
        matrix.mapPoints(src);
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
        let dst = matrix.mapPoints( [{x:-10,y:-10},{x:20.1,y:20.1},{x:30,y:30.1}]);
        console.info(msg + ' mapPoints successed');
      } catch (e) {
        console.info(msg + ` mapPoints3 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        matrix.mapPoints([{x:10,y:10}]);
        console.info(msg + ' mapPoints successed');
      } catch (e) {
        console.info(msg + ` mapPoints4 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_1701
     * @tc.name      : testMatrixMapPointsNull
     * @tc.desc      : testMatrixMapPointsNull
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testMatrixMapPointsNull', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_1703
     * @tc.name      : testMatrixMapPointsMultipleCalls
     * @tc.desc      : testMatrixMapPointsMultipleCalls
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testMatrixMapPointsMultipleCalls', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_1800
     * @tc.name      : testMatrixMapRectNormal
     * @tc.desc      : testMatrixMapRectNormal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testMatrixMapRectNormal', DEFAULT, () => {
      const msg = 'testMatrixMapRectNormal';
      try {
        let matrix = new drawing.Matrix();
        let dst: common2D.Rect = { left: 100, top: 20, right: 130, bottom: 60 };
        let src: common2D.Rect = { left: 100, top: 80, right: 130, bottom: 120 };
        matrix.mapRect(dst, src);
        matrix.mapRect(dst,  { left: 0, top: 0, right: 0, bottom: 0})
        matrix.mapRect(dst,  { left: 100, top: 100, right: 100, bottom: 200})
        matrix.mapRect(dst,  { left: 100, top: 100, right: 100, bottom: 100})
        matrix.mapRect( { left: 200.1, top: 200.1, right: 300.1, bottom: 400.1},
          { left: 100.1, top: 100.1, right: 200.1, bottom: 200.1})
        matrix.mapRect( { left: 200.1, top: 200.1, right: 300.1, bottom: 400.1},
          { left: -100.1, top: -100.1, right: 200.1, bottom: 200.1})
        matrix.mapRect( { left: 200.1, top: 200.1, right: 300.1, bottom: 400.1},
          { left: 100.1, top: 100.1, right: -200.1, bottom: -200.1})
        console.info(msg + ' mapRect successed');
      } catch (e) {
        console.info(msg + ` mapRect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_1801
     * @tc.name      : testMatrixMapRectNull
     * @tc.desc      : testMatrixMapRectNull
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testMatrixMapRectNull', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_1803
     * @tc.name      : testMatrixMapRectMultipleCalls
     * @tc.desc      : testMatrixMapRectMultipleCalls
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testMatrixMapRectMultipleCalls', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_1900
     * @tc.name      : testMatrixSetRectToRectNormal
     * @tc.desc      : testMatrixSetRectToRectNormal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testMatrixSetRectToRectNormal', DEFAULT, () => {
      const msg = 'testMatrixSetRectToRectNormal';
      try {
        let matrix = new drawing.Matrix();
        let dst: common2D.Rect = { left: 100, top: 20, right: 130, bottom: 60 };
        let src: common2D.Rect = { left: 100, top: 80, right: 130, bottom: 120 };
        let stf: drawing.ScaleToFit = drawing.ScaleToFit.FILL_SCALE_TO_FIT;
        matrix.setRectToRect(dst, src,stf);
        matrix.setRectToRect(dst,  { left: 0, top: 0, right: 0, bottom: 0},stf);
        matrix.setRectToRect(dst,  { left: 100, top: 100, right: 100, bottom: 200},stf)
        matrix.setRectToRect(dst,  { left: 100, top: 100, right: 100, bottom: 100},stf)
        matrix.setRectToRect( { left: 200.1, top: 200.1, right: 300.1, bottom: 400.1},
          { left: 100.1, top: 100.1, right: 200.1, bottom: 200.1},stf)
        matrix.setRectToRect( { left: 200.1, top: 200.1, right: 300.1, bottom: 400.1},
          { left: -100.1, top: -100.1, right: 200.1, bottom: 200.1},stf)
        matrix.setRectToRect( { left: 200.1, top: 200.1, right: 300.1, bottom: 400.1},
          { left: 100.1, top: 100.1, right: -200.1, bottom: -200.1},stf)
        matrix.setRectToRect(dst, src,drawing.ScaleToFit.START_SCALE_TO_FIT );
        matrix.setRectToRect(dst, src,drawing.ScaleToFit.CENTER_SCALE_TO_FIT );
        matrix.setRectToRect(dst, src,drawing.ScaleToFit.END_SCALE_TO_FIT );
        console.info(msg + ' setRectToRect successed');
      } catch (e) {
        console.info(msg + ` setRectToRect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_1901
     * @tc.name      : testMatrixSetRectToRectNull
     * @tc.desc      : testMatrixSetRectToRectNull
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testMatrixSetRectToRectNull', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_1903
     * @tc.name      : testMatrixSetRectToRectMultipleCalls
     * @tc.desc      : testMatrixSetRectToRectMultipleCalls
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testMatrixSetRectToRectMultipleCalls', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_1904
     * @tc.name      : testMatrixSetRectToRectAbnormal
     * @tc.desc      : testMatrixSetRectToRectAbnormal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testMatrixSetRectToRectAbnormal', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_2000
     * @tc.name      : testMatrixSetPolyToPolyNormal
     * @tc.desc      : testMatrixSetPolyToPolyNormal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testMatrixSetPolyToPolyNormal', DEFAULT, () => {
      const msg = 'testMatrixSetPolyToPolyNormal';
      let matrix = new drawing.Matrix();

      try {
        let srcPoints: Array<common2D.Point> = [{x: 200, y: 20}, {x: 200, y: 60}];
        let dstPoints: Array<common2D.Point> = [{x: 200, y: 90}, {x: 100, y: 60}];
        matrix.setPolyToPoly(srcPoints, dstPoints, 2)
        console.info(msg + ' setPolyToPoly successed');
      } catch (e) {
        console.info(msg + ` setPolyToPoly errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let srcPoints: Array<common2D.Point> = []
        let dstPoints: Array<common2D.Point> = []
        matrix.setPolyToPoly(srcPoints, dstPoints, 0)
        console.info(msg + ' setPolyToPoly successed');
      } catch (e) {
        console.info(msg + ` setPolyToPoly errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let srcPoints: Array<common2D.Point> = [{x: 200, y: 20}, {x: 200, y: 60},{x: 200.1, y: 40.1}, {x: -300, y: -60}]
        let dstPoints: Array<common2D.Point> = [{x: -200, y: -20}, {x: 200, y: 60},{x: 200.1, y: 40.1}, {x: -300, y: -60}]
        matrix.setPolyToPoly(srcPoints, dstPoints, 4)
        console.info(msg + ' setPolyToPoly successed');
      } catch (e) {
        console.info(msg + ` setPolyToPoly errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let srcPoints: Array<common2D.Point> = [{x: 200, y: 20}]
        let dstPoints: Array<common2D.Point> = [{x: 200, y: 20}]
        matrix.setPolyToPoly(srcPoints, dstPoints, 1)
        console.info(msg + ' setPolyToPoly successed');
      } catch (e) {
        console.info(msg + ` setPolyToPoly errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_2001
     * @tc.name      : testMatrixSetPolyToPolyNull
     * @tc.desc      : testMatrixSetPolyToPolyNull
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testMatrixSetPolyToPolyNull', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_2003
     * @tc.name      : testMatrixSetPolyToPolyMultipleCalls
     * @tc.desc      : testMatrixSetPolyToPolyMultipleCalls
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testMatrixSetPolyToPolyMultipleCalls', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_2004
     * @tc.name      : testMatrixSetPolyToPolyAbnormal
     * @tc.desc      : testMatrixSetPolyToPolyAbnormal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testMatrixSetPolyToPolyAbnormal', DEFAULT, () => {
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
  })
}