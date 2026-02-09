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

import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  TestType,
  Size,
  Level
} from "../../../hypium/index";
import drawing from '@ohos.graphics.drawing';
import common2D from '@ohos.graphics.common2D';
import { BusinessError } from '@ohos.base';

const loop_times = 20;

export default function drawingTsMatrixPart2Test() {
  describe('drawingTsMatrixPart2Test', () => {
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
     * @tc.name   testMatrixPostTranslateNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_STATIC_1200
     * @tc.desc   testMatrixPostTranslateNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixPostTranslateNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testMatrixPostTranslateNormalStatic';
      try {
        let matrix = new drawing.Matrix();
        matrix.postTranslate(100, 100);
        let widths: number[] | undefined = matrix.getAll();
        if (widths) {
          expect(widths.length == 9).assertTrue();
          expect(matrix != null).assertTrue();
          console.info(msg + ' postTranslate successed,width:' + widths.length + JSON.stringify(matrix));
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` postTranslate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.postTranslate(100.1, 100.1);
        let widths: number[] | undefined = matrix.getAll();
        if (widths) {
          expect(widths.length == 9).assertTrue();
          expect(matrix != null).assertTrue();
          console.info(msg + ' postTranslate successed,width:' + widths.length + JSON.stringify(matrix));
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` postTranslate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.postTranslate(-100, 100);
        let widths: number[] | undefined = matrix.getAll();
        if (widths) {
          expect(widths.length == 9).assertTrue();
          expect(matrix != null).assertTrue();
          console.info(msg + ' postTranslate successed,width:' + widths.length + JSON.stringify(matrix));
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` postTranslate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.postTranslate(100, -150);
        let widths: number[] | undefined = matrix.getAll();
        if (widths) {
          expect(widths.length == 9).assertTrue();
          expect(matrix != null).assertTrue();
          console.info(msg + ' postTranslate successed,width:' + widths.length + JSON.stringify(matrix));
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` postTranslate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.postTranslate(Number.MAX_VALUE, Number.MAX_VALUE);
        let widths: number[] | undefined = matrix.getAll();
        if (widths) {
          expect(widths.length == 9).assertTrue();
          expect(matrix != null).assertTrue();
          console.info(msg + ' postTranslate successed,width:' + widths.length + JSON.stringify(matrix));
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` postTranslate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.name   testMatrixPostTranslateMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_STATIC_1203
     * @tc.desc   testMatrixPostTranslateMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixPostTranslateMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testMatrixPostTranslateMultipleCallsStatic';
      try {
        let matrix = new drawing.Matrix();
        for (let i = 0; i < loop_times; i++) {
          matrix.postTranslate(Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE);
        }
        console.info(msg + ' postTranslate successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` postTranslate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.name   testMatrixPreRotateNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_STATIC_1300
     * @tc.desc   testMatrixPreRotateNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixPreRotateNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testMatrixPreRotateNormalStatic';
      try {
        let matrix = new drawing.Matrix();
        matrix.preRotate(90, 100, 100);
        let widths: number[] | undefined = matrix.getAll();
        if (widths) {
          expect(widths.length == 9).assertTrue();
          expect(matrix != null).assertTrue();
          console.info(msg + ' preRotate successed,width:' + widths.length + JSON.stringify(matrix));
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` preRotate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.preRotate(90.1, 100.1, 100.1);
        let widths: number[] | undefined = matrix.getAll();
        if (widths) {
          expect(widths.length == 9).assertTrue();
          expect(matrix != null).assertTrue();
          console.info(msg + ' preRotate successed,width:' + widths.length + JSON.stringify(matrix));
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` preRotate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.preRotate(-90, 100, 100);
        let widths: number[] | undefined = matrix.getAll();
        if (widths) {
          expect(widths.length == 9).assertTrue();
          expect(matrix != null).assertTrue();
          console.info(msg + ' preRotate successed,width:' + widths.length + JSON.stringify(matrix));
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` preRotate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.preRotate(90, -100, 100);
        let widths: number[] | undefined = matrix.getAll();
        if (widths) {
          expect(widths.length == 9).assertTrue();
          expect(matrix != null).assertTrue();
          console.info(msg + ' preRotate successed,width:' + widths.length + JSON.stringify(matrix));
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` preRotate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.preRotate(90, 100, -100);
        let widths: number[] | undefined = matrix.getAll();
        if (widths) {
          expect(widths.length == 9).assertTrue();
          expect(matrix != null).assertTrue();
          console.info(msg + ' preRotate successed,width:' + widths.length + JSON.stringify(matrix));
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` preRotate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.preRotate(361, Number.MAX_VALUE, Number.MAX_VALUE);
        let widths: number[] | undefined = matrix.getAll();
        if (widths) {
          expect(widths.length == 9).assertTrue();
          expect(matrix != null).assertTrue();
          console.info(msg + ' preRotate successed,width:' + widths.length + JSON.stringify(matrix));
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` preRotate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.name   testMatrixPreRotateMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_STATIC_1303
     * @tc.desc   testMatrixPreRotateMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixPreRotateMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testMatrixPreRotateMultipleCallsStatic';
      try {
        let matrix = new drawing.Matrix();
        for (let i = 0; i < loop_times; i++) {
          matrix.preRotate(Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE,
            Math.random() * Number.MAX_VALUE);
        }
        console.info(msg + ' preRotate successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` preRotate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.name   testMatrixPreScaleNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_STATIC_1400
     * @tc.desc   testMatrixPreScaleNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixPreScaleNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testMatrixPreScaleNormalStatic';
      try {
        let matrix = new drawing.Matrix();
        matrix.preScale(100, 100, 150, 150);
        let widths: number[] | undefined = matrix.getAll();
        if (widths) {
          expect(widths.length == 9).assertTrue();
          expect(matrix != null).assertTrue();
          console.info(msg + ' preScale successed,width:' + widths.length + JSON.stringify(matrix));
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` preScale errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.preScale(0.2, 0.2, 0.5, 0.5);
        let widths: number[] | undefined = matrix.getAll();
        if (widths) {
          expect(widths.length == 9).assertTrue();
          expect(matrix != null).assertTrue();
          console.info(msg + ' preScale successed,width:' + widths.length + JSON.stringify(matrix));
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` preScale errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.preScale(-100, -100, 150, 150);
        let widths: number[] | undefined = matrix.getAll();
        if (widths) {
          expect(widths.length == 9).assertTrue();
          expect(matrix != null).assertTrue();
          console.info(msg + ' preScale successed,width:' + widths.length + JSON.stringify(matrix));
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` preScale errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.preScale(100, 100, -150, -150);
        let widths: number[] | undefined = matrix.getAll();
        if (widths) {
          expect(widths.length == 9).assertTrue();
          expect(matrix != null).assertTrue();
          console.info(msg + ' preScale successed,width:' + widths.length + JSON.stringify(matrix));
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` preScale errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.preScale(Number.MAX_VALUE, Number.MAX_VALUE, Number.MAX_VALUE, Number.MAX_VALUE);
        let widths: number[] | undefined = matrix.getAll();
        if (widths) {
          expect(widths.length == 9).assertTrue();
          expect(matrix != null).assertTrue();
          console.info(msg + ' preScale successed,width:' + widths.length + JSON.stringify(matrix));
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` preScale errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.name   testMatrixPreScaleMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_STATIC_1403
     * @tc.desc   testMatrixPreScaleMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixPreScaleMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testMatrixPreScaleMultipleCallsStatic';
      try {
        let matrix = new drawing.Matrix();
        for (let i = 0; i < loop_times; i++) {
          matrix.preScale(Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE,
            Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE);
        }
        console.info(msg + ' preScale successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` preScale errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.name   testMatrixPreTranslateNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_STATIC_1500
     * @tc.desc   testMatrixPreTranslateNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixPreTranslateNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testMatrixPreTranslateNormalStatic';
      try {
        let matrix = new drawing.Matrix();
        matrix.preTranslate(100, 100);
        let widths: number[] | undefined = matrix.getAll();
        if (widths) {
          expect(widths.length == 9).assertTrue();
          expect(matrix != null).assertTrue();
          console.info(msg + ' preTranslate successed,width:' + widths.length + JSON.stringify(matrix));
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` preTranslate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.preTranslate(100.1, 100.1);
        let widths: number[] | undefined = matrix.getAll();
        if (widths) {
          expect(widths.length == 9).assertTrue();
          expect(matrix != null).assertTrue();
          console.info(msg + ' preTranslate successed,width:' + widths.length + JSON.stringify(matrix));
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` preTranslate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.preTranslate(-100, 100);
        let widths: number[] | undefined = matrix.getAll();
        if (widths) {
          expect(widths.length == 9).assertTrue();
          expect(matrix != null).assertTrue();
          console.info(msg + ' preTranslate successed,width:' + widths.length + JSON.stringify(matrix));
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` preTranslate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.preTranslate(100, -150);
        let widths: number[] | undefined = matrix.getAll();
        if (widths) {
          expect(widths.length == 9).assertTrue();
          expect(matrix != null).assertTrue();
          console.info(msg + ' preTranslate successed,width:' + widths.length + JSON.stringify(matrix));
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` preTranslate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.preTranslate(Number.MAX_VALUE, Number.MAX_VALUE);
        let widths: number[] | undefined = matrix.getAll();
        if (widths) {
          expect(widths.length == 9).assertTrue();
          expect(matrix != null).assertTrue();
          console.info(msg + ' preTranslate successed,width:' + widths.length + JSON.stringify(matrix));
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` preTranslate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.name   testMatrixPreTranslateMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_STATIC_1503
     * @tc.desc   testMatrixPreTranslateMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixPreTranslateMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testMatrixPreTranslateMultipleCallsStatic';
      try {
        let matrix = new drawing.Matrix();
        for (let i = 0; i < loop_times; i++) {
          matrix.preTranslate(Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE);
        }
        console.info(msg + ' preTranslate successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` preTranslate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.name   testMatrixResetNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_STATIC_1600
     * @tc.desc   testMatrixResetNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixResetNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testMatrixResetNormalStatic';
      try {
        let matrix = new drawing.Matrix();
        matrix.reset();
        let widths: number[] | undefined = matrix.getAll();
        if (widths) {
          expect(widths.length == 9).assertTrue();
        }
        matrix.preTranslate(100.1, 100.1);
        widths = matrix.getAll();
        if (widths) {
          expect(widths.length == 9).assertTrue();
        }
        matrix.reset();
        widths = matrix.getAll();
        if (widths) {
          expect(widths.length == 9).assertTrue();
          expect(matrix != null).assertTrue();
          console.info(msg + ' reset successed,width:' + widths.length + JSON.stringify(matrix));
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.name   testMatrixResetMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_STATIC_1602
     * @tc.desc   testMatrixResetMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixResetMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testMatrixResetMultipleCallsStatic';
      try {
        let matrix = new drawing.Matrix();
        matrix.preTranslate(100, 100);
        matrix.getAll();
        for (let i = 0; i < loop_times; i++) {
          matrix.reset();
          matrix.getAll();
        }
        console.info(msg + ' reset successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.name   testMatrixMapPointsNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_STATIC_1700
     * @tc.desc   testMatrixMapPointsNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixMapPointsNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testMatrixMapPointsNormalStatic';
      let matrix = new drawing.Matrix();

      try {
        let src: Array<common2D.Point> = [{ x: 10, y: 10 }, { x: 20.1, y: 20.1 }, { x: 30, y: 30 }];
        let dst: Array<common2D.Point> | undefined = matrix.mapPoints(src);
        if (dst) {
          console.info(msg + ' mapPoints successed dst.length is: ' + dst.length);
          expect(dst.length == 3).assertEqual(true);
        }
        if(dst == undefined){
          console.info(msg + ' 1 test failed');
          expect().assertFail();
        }
        let dst2: Array<common2D.Point> | undefined = matrix.mapPoints(src);
        if (dst2) {
          console.info(msg + ' mapPoints successed dst2.length is: ' + dst2.length);
          expect(dst2.length == 3).assertEqual(true);
        }
        if(dst2 == undefined){
          console.info(msg + ' 2 test failed');
          expect().assertFail();
        }
        console.info(msg + ' mapPoints successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` mapPoints1 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let dst = matrix.mapPoints([]);
        console.info(msg + ' mapPoints successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` mapPoints2 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        let dst3 = matrix.mapPoints([{ x: -10, y: -10 }, { x: 20.1, y: 20.1 }, { x: 30, y: 30.1 }]);
        if (dst3) {
          console.info(msg + ' mapPoints successed dst3.length is: ' + dst3.length);
          expect(dst3.length == 3).assertEqual(true);
        }
        if(dst3 == undefined){
          console.info(msg + ' 3 test failed');
          expect().assertFail();
        }
        console.info(msg + ' mapPoints successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` mapPoints3 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let dst4: Array<common2D.Point> | undefined = matrix.mapPoints([{ x: 10, y: 10 }]);
        if (dst4) {
          console.info(msg + ' mapPoints successed dst4.length is: ' + dst4.length);
          expect(dst4.length == 1).assertEqual(true);
        }
        if(dst4 == undefined){
          console.info(msg + ' 4 test failed');
          expect().assertFail();
        }
        console.info(msg + ' mapPoints successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` mapPoints4 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.name   testMatrixMapPointsMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_STATIC_1703
     * @tc.desc   testMatrixMapPointsMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixMapPointsMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testMatrixMapPointsMultipleCallsStatic';
      try {
        let matrix = new drawing.Matrix();
        let src: Array<common2D.Point> = [{ x: 10, y: 10 }];
        for (let i = 0; i < loop_times; i++) {
          matrix.mapPoints(src);
        }
        console.info(msg + ' mapPoints successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` mapPoints errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.name   testMatrixMapRectNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_STATIC_1800
     * @tc.desc   testMatrixMapRectNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixMapRectNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testMatrixMapRectNormalStatic';
      try {
        let matrix = new drawing.Matrix();
        let dst: common2D.Rect = {
          left: 100,
          top: 20,
          right: 130,
          bottom: 60
        };
        let src: common2D.Rect = {
          left: 100,
          top: 80,
          right: 130,
          bottom: 120
        };
        let result: boolean = matrix.mapRect(dst, src);
        console.info(msg + " mapRect -----result:  " + result);
        expect(result).assertEqual(true);
        let result2: boolean = matrix.mapRect(dst, {
          left: 0,
          top: 0,
          right: 0,
          bottom: 0
        })
        console.info(msg + " mapRect -----result2:  " + result2);
        expect(result2).assertEqual(true);
        let result3: boolean = matrix.mapRect(dst, {
          left: 100,
          top: 100,
          right: 100,
          bottom: 200
        })
        console.info(msg + " mapRect -----result3:  " + result3);
        expect(result3).assertEqual(true);
        let result4: boolean = matrix.mapRect(dst, {
          left: 100,
          top: 100,
          right: 100,
          bottom: 100
        })
        console.info(msg + " mapRect -----result4:  " + result4);
        expect(result4).assertEqual(true);
        let result5: boolean = matrix.mapRect({
          left: 200.1,
          top: 200.1,
          right: 300.1,
          bottom: 400.1
        },
          {
            left: 100.1,
            top: 100.1,
            right: 200.1,
            bottom: 200.1
          })
        console.info(msg + " mapRect -----result5:  " + result5);
        expect(result5).assertEqual(true);
        let result6: boolean = matrix.mapRect({
          left: 200.1,
          top: 200.1,
          right: 300.1,
          bottom: 400.1
        },
          {
            left: -100.1,
            top: -100.1,
            right: 200.1,
            bottom: 200.1
          })
        console.info(msg + " mapRect -----result6:  " + result6);
        expect(result6).assertEqual(true);
        let result7: boolean = matrix.mapRect({
          left: 200.1,
          top: 200.1,
          right: 300.1,
          bottom: 400.1
        },
          {
            left: 100.1,
            top: 100.1,
            right: -200.1,
            bottom: -200.1
          })
        console.info(msg + " mapRect -----result7:  " + result7);
        expect(result7).assertEqual(true);
        console.info(msg + ' mapRect successed');
      } catch (e) {
        e = e as BusinessError;
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
        e = e as BusinessError;
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
        e = e as BusinessError;
        console.info(msg + ` mapRect result9 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.name   testMatrixMapRectMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_STATIC_1803
     * @tc.desc   testMatrixMapRectMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixMapRectMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testMatrixMapRectMultipleCallsStatic';
      try {
        let matrix = new drawing.Matrix();
        for (let i = 0; i < loop_times; i++) {
          matrix.mapRect({
            left: Math.random() * Number.MAX_VALUE,
            top: Math.random() * Number.MAX_VALUE,
            right: Math.random() * Number.MAX_VALUE,
            bottom: Math.random() * Number.MAX_VALUE
          },
            {
              left: Math.random() * Number.MAX_VALUE,
              top: Math.random() * Number.MAX_VALUE,
              right: Math.random() * Number.MAX_VALUE,
              bottom: Math.random() * Number.MAX_VALUE
            });
        }
        console.info(msg + ' mapRect successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` mapRect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.name   testMatrixSetRectToRectNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_STATIC_1900
     * @tc.desc   testMatrixSetRectToRectNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixSetRectToRectNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testMatrixSetRectToRectNormalStatic';
      try {
        let matrix = new drawing.Matrix();
        let dst: common2D.Rect = {
          left: 100,
          top: 20,
          right: 130,
          bottom: 60
        };
        let src: common2D.Rect = {
          left: 100,
          top: 80,
          right: 130,
          bottom: 120
        };
        let stf: drawing.ScaleToFit = drawing.ScaleToFit.FILL_SCALE_TO_FIT;
        let result: boolean = matrix.setRectToRect(dst, src, stf);
        console.info(msg + " setRectToRect -----result:  " + result);
        expect(result).assertEqual(true);
        let result2: boolean = matrix.setRectToRect(dst, {
          left: 0,
          top: 0,
          right: 0,
          bottom: 0
        }, stf);
        console.info(msg + " setRectToRect -----result2:  " + result2);
        expect(result2).assertEqual(true);
        let result3: boolean = matrix.setRectToRect(dst, {
          left: 100,
          top: 100,
          right: 100,
          bottom: 200
        }, stf)
        console.info(msg + " setRectToRect -----result3:  " + result3);
        expect(result3).assertEqual(true);
        let result4: boolean = matrix.setRectToRect(dst, {
          left: 100,
          top: 100,
          right: 100,
          bottom: 100
        }, stf)
        console.info(msg + " setRectToRect -----result4:  " + result4);
        expect(result4).assertEqual(true);
        let result5: boolean = matrix.setRectToRect({
          left: 200.1,
          top: 200.1,
          right: 300.1,
          bottom: 400.1
        },
          {
            left: 100.1,
            top: 100.1,
            right: 200.1,
            bottom: 200.1
          }, stf)
        console.info(msg + " setRectToRect -----result5:  " + result5);
        expect(result5).assertEqual(true);
        let result6: boolean = matrix.setRectToRect({
          left: 200.1,
          top: 200.1,
          right: 300.1,
          bottom: 400.1
        },
          {
            left: -100.1,
            top: -100.1,
            right: 200.1,
            bottom: 200.1
          }, stf)
        console.info(msg + " setRectToRect -----result6:  " + result6);
        expect(result6).assertEqual(true);
        let result7: boolean = matrix.setRectToRect({
          left: 200.1,
          top: 200.1,
          right: 300.1,
          bottom: 400.1
        },
          {
            left: 100.1,
            top: 100.1,
            right: -200.1,
            bottom: -200.1
          }, stf)
        console.info(msg + " setRectToRect -----result7:  " + result7);
        expect(result7).assertEqual(true);
        let result8: boolean = matrix.setRectToRect(dst, src, drawing.ScaleToFit.START_SCALE_TO_FIT);
        console.info(msg + " setRectToRect -----result8:  " + result8);
        expect(result8).assertEqual(true);
        let result9: boolean = matrix.setRectToRect(dst, src, drawing.ScaleToFit.CENTER_SCALE_TO_FIT);
        console.info(msg + " setRectToRect -----result9:  " + result9);
        expect(result9).assertEqual(true);
        let result10: boolean = matrix.setRectToRect(dst, src, drawing.ScaleToFit.END_SCALE_TO_FIT);
        console.info(msg + " setRectToRect -----result10:  " + result10);
        expect(result10).assertEqual(true);
        console.info(msg + ' setRectToRect successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setRectToRect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      try {
        let matrix = new drawing.Matrix();
        let dst2: common2D.Rect = {
          left: 0,
          top: 0,
          right: 0,
          bottom: 0
        };
        let src: common2D.Rect = {
          left: 100,
          top: 100,
          right: 100,
          bottom: 200
        };
        let stf: drawing.ScaleToFit = drawing.ScaleToFit.FILL_SCALE_TO_FIT;
        let result: boolean = matrix.setRectToRect(dst2, src, stf);
        console.info(msg + " setRectToRect 2-----result:  " + result);
        expect(result).assertEqual(false);
        console.info(msg + ' setRectToRect 2 successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setRectToRect 2 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.name   testMatrixSetRectToRectNullStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_STATIC_1901
     * @tc.desc   testMatrixSetRectToRectNullStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixSetRectToRectNullStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testMatrixSetRectToRectNullStatic';
      try {
        let matrix = new drawing.Matrix();
        let stf: drawing.ScaleToFit = drawing.ScaleToFit.FILL_SCALE_TO_FIT;
        matrix.setRectToRect({
          left: 200,
          top: 200,
          right: 300,
          bottom: 400
        }, {
          left: 200,
          top: 200,
          right: 300,
          bottom: 400
        }, stf)
        console.info(msg + ' setRectToRect successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setRectToRect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testMatrixSetRectToRectMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_STATIC_1903
     * @tc.desc   testMatrixSetRectToRectMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixSetRectToRectMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testMatrixSetRectToRectMultipleCallsStatic';
      let itemList: drawing.ScaleToFit[] = [
        drawing.ScaleToFit.FILL_SCALE_TO_FIT,
        drawing.ScaleToFit.START_SCALE_TO_FIT,
        drawing.ScaleToFit.CENTER_SCALE_TO_FIT,
        drawing.ScaleToFit.END_SCALE_TO_FIT
      ];
      try {
        let matrix = new drawing.Matrix();
        const randomEnum = Math.floor(4 * Math.random()).toInt();
        for (let i = 0; i < loop_times; i++) {
          matrix.setRectToRect({
            left: Math.random() * Number.MAX_VALUE,
            top: Math.random() * Number.MAX_VALUE,
            right: Math.random() * Number.MAX_VALUE,
            bottom: Math.random() * Number.MAX_VALUE
          },
            {
              left: Math.random() * Number.MAX_VALUE,
              top: Math.random() * Number.MAX_VALUE,
              right: Math.random() * Number.MAX_VALUE,
              bottom: Math.random() * Number.MAX_VALUE
            }, itemList[randomEnum]);
        }
        console.info(msg + ' setRectToRect successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setRectToRect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.name   testMatrixSetPolyToPolyNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_STATIC_2000
     * @tc.desc   testMatrixSetPolyToPolyNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixSetPolyToPolyNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testMatrixSetPolyToPolyNormalStatic';
      let matrix = new drawing.Matrix();

      try {
        let srcPoints: Array<common2D.Point> = [{ x: 200, y: 20 }, { x: 200, y: 60 }];
        let dstPoints: Array<common2D.Point> = [{ x: 200, y: 90 }, { x: 100, y: 60 }];
        let result1: boolean = matrix.setPolyToPoly(srcPoints, dstPoints, 2)
        console.info(msg + " setPolyToPoly -----result1:  " + result1);
        expect(result1).assertEqual(true);
        console.info(msg + ' setPolyToPoly successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setPolyToPoly errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let srcPoints: Array<common2D.Point> = []
        let dstPoints: Array<common2D.Point> = []
        let result2: boolean = matrix.setPolyToPoly(srcPoints, dstPoints, 0)
        console.info(msg + " setPolyToPoly -----result2:  " + result2);
        expect(result2).assertEqual(true);
        console.info(msg + ' setPolyToPoly successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setPolyToPoly errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let srcPoints: Array<common2D.Point> =
          [{ x: 200, y: 20 }, { x: 200, y: 60 }, { x: 200.1, y: 40.1 }, { x: -300, y: -60 }]
        let dstPoints: Array<common2D.Point> =
          [{ x: -200, y: -20 }, { x: 200, y: 60 }, { x: 200.1, y: 40.1 }, { x: -300, y: -60 }]
        let result3: boolean = matrix.setPolyToPoly(srcPoints, dstPoints, 4)
        console.info(msg + " setPolyToPoly -----result3:  " + result3);
        expect(result3).assertEqual(true);
        console.info(msg + ' setPolyToPoly successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setPolyToPoly errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let srcPoints: Array<common2D.Point> = [{ x: 200, y: 20 }]
        let dstPoints: Array<common2D.Point> = [{ x: 200, y: 20 }]
        let result4: boolean = matrix.setPolyToPoly(srcPoints, dstPoints, 1)
        console.info(msg + " setPolyToPoly -----result4:  " + result4);
        expect(result4).assertEqual(true);
        console.info(msg + ' setPolyToPoly successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setPolyToPoly errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      try {
        let srcPoints: Array<common2D.Point> = [{ x: 200, y: 20 }, { x: 200, y: 20 }];
        let dstPoints: Array<common2D.Point> = [{ x: 200, y: 90 }, { x: 100, y: 60 }];
        let result5: boolean = matrix.setPolyToPoly(srcPoints, dstPoints, 2)
        console.info(msg + " setPolyToPoly -----result5:  " + result5);
        expect(result5).assertEqual(false);
        console.info(msg + ' setPolyToPoly successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setPolyToPoly errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.name   testMatrixSetPolyToPolyMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_STATIC_2003
     * @tc.desc   testMatrixSetPolyToPolyMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixSetPolyToPolyMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testMatrixSetPolyToPolyMultipleCallsStatic';
      try {
        let matrix = new drawing.Matrix();
        let srcPoints: Array<common2D.Point> = [{ x: 200, y: 20 }, { x: 200, y: 60 }];
        let dstPoints: Array<common2D.Point> = [{ x: 200, y: 20 }, { x: 200, y: 60 }];
        for (let i = 0; i < loop_times; i++) {
          matrix.setPolyToPoly(srcPoints, dstPoints, 2);
        }
        console.info(msg + ' setPolyToPoly successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setPolyToPoly errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.name   testMatrixSetPolyToPolyAbNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_STATIC_2004
     * @tc.desc   testMatrixSetPolyToPolyAbNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixSetPolyToPolyAbNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testMatrixSetPolyToPolyAbNormalStatic';
      try {
        let matrix = new drawing.Matrix();
        let srcPoints: Array<common2D.Point> = [{ x: 200, y: 20 }, { x: 200, y: 60 }];
        let dstPoints: Array<common2D.Point> = [{ x: 20, y: 20 }, { x: 20, y: 600 }];
        matrix.setPolyToPoly(srcPoints, dstPoints, -1);
        console.info(msg + ' setPolyToPoly successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setPolyToPoly errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        let matrix = new drawing.Matrix();
        let srcPoints: Array<common2D.Point> =
          [{ x: 200, y: 20 }, { x: 200, y: 60 }, { x: 210, y: 70 }, { x: 220, y: 80 }];
        let dstPoints: Array<common2D.Point> =
          [{ x: 200, y: 20 }, { x: 200, y: 60 }, { x: 210, y: 70 }, { x: 220, y: 80 }];
        matrix.setPolyToPoly(srcPoints, dstPoints, 5);
        console.info(msg + ' setPolyToPoly successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setPolyToPoly errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })
    /**
     * @tc.name   testMatrixConstructor2NormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_STATIC_2100
     * @tc.desc   testMatrixConstructor2NormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixConstructor2NormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testMatrixConstructor2NormalStatic';
      let matrix = new drawing.Matrix();
      try {
        let matrix1 = new drawing.Matrix(matrix);
        console.info(msg + ' drawing matrix1 successed');
        expect(matrix1 != null || matrix1 != undefined).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` drawing matrix1 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      matrix.setMatrix([-1, -2, -3, -4, -5, -6, -7, -8, -9]);
      try {
        let matrix2 = new drawing.Matrix(matrix);
        console.info(msg + ' drawing matrix2 successed');
        expect(matrix2 != null || matrix2 != undefined).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` drawing matrix2 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      matrix.setMatrix([0, 0, 0, 0, 0, 0, 0, 0, 0]);
      try {
        let matrix3 = new drawing.Matrix(matrix);
        console.info(msg + ' drawing matrix3 successed');
        expect(matrix3 != null || matrix3 != undefined).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` drawing matrix3 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      matrix.setMatrix([1.25, 302.2, 100.2, 20, -1.5, -1, 0, 300, 10]);
      try {
        let matrix4 = new drawing.Matrix(matrix);
        console.info(msg + ' drawing matrix4 successed');
        expect(matrix4 != null || matrix4 != undefined).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` drawing matrix4 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testMatrixConstructor2MultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_STATIC_2101
     * @tc.desc   testMatrixConstructor2MultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixConstructor2MultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testMatrixConstructor2MultipleCallsStatic';
      let matrix1 = new drawing.Matrix();
      for (let i = 0; i < 20; i += 1) {
        try {
          matrix1.setMatrix([Math.random() * 10, Math.random() * 10, Math.random() * 20, Math.random() * 10,
            Math.random() * 20, Math.random() * 30, Math.random() * 10, Math.random() * 20, Math.random() * 30]);
          let matrix = new drawing.Matrix(matrix1);
          console.info(msg + `setMatrix success step: ` + i);
          expect(matrix != null || matrix != undefined).assertTrue();
        } catch (e) {
          e = e as BusinessError;
          console.info(msg +
            `drawing setMatrix error. errorCode is: ${e.code} + errormsg is: ${e.message}} step: ${i}`);
          expect().assertFail()
        }
      }
    });
    /**
     * @tc.name   testMatrixSetMatrixNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_STATIC_2400
     * @tc.desc   testMatrixSetMatrixNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixSetMatrixNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testMatrixSetMatrixNormalStatic';
      let matrix = new drawing.Matrix();
      let matrixnew = new drawing.Matrix();
      matrixnew.setScale(0.5, 0.5, 0.5, 0.5);
      // matrixnew.setMatrix(matrix);
      try {
        let actualValues = matrix.getAll();
        console.info(msg + ' matrix getAll actualValues successed');
        if (actualValues) {
          console.info(msg + "matrix actualValues: " + actualValues.toString());
          expect(actualValues[0] == 1 && actualValues[1] == 0 && actualValues[2] == 0 && actualValues[3] == 0 &&
            actualValues[4] == 1 && actualValues[5] == 0 && actualValues[6] == 0 && actualValues[7] == 0 &&
            actualValues[8] == 1).assertEqual(true);
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` matrix getAll actualValues errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      let value1: Array<number> = [1.1, 2.2, 3.3, 4.4, 5.5, 6.6, 7.7, 8.8, 9.9];
      matrix.setMatrix(value1);
      // matrixnew.setMatrix(matrix);
      // try {
      //   let actualValues2 = matrixnew.getAll();
      //   console.info(msg + ' matrix getAll actualValues2 successed');
      //   if (actualValues2) {
      //     console.info(msg + "matrix actualValues2: " + actualValues2.toString());
      //     expect(actualValues2[0] == 1.100000023841858 && actualValues2[1] == 2.200000047683716 &&
      //       actualValues2[2] == 3.299999952316284 &&
      //       actualValues2[3] == 4.400000095367432 && actualValues2[4] == 5.5 && actualValues2[5] == 6.599999904632568 &&
      //       actualValues2[6] == 7.699999809265137 && actualValues2[7] == 8.800000190734863 &&
      //       actualValues2[8] == 9.899999618530273).assertEqual(true);
      //   }
      // } catch (e: BusinessError) {
      //   console.info(msg + ` matrix getAll actualValues2 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
      //   expect().assertFail();
      // }
      // let value2: Array<number> = [2, 2, 2, 2, 2, 2, 2, 2, 2];
      // matrix.setMatrix(value2);
      // // matrixnew.setMatrix(matrix);
      // try {
      //   let actualValues3 = matrixnew.getAll();
      //   console.info(msg + ' matrix getAll actualValues3 successed');
      //   if (actualValues3) {
      //     console.info(msg + "matrix actualValues3: " + actualValues3.toString());
      //     expect(actualValues3[0] == 2 && actualValues3[1] == 2 && actualValues3[2] == 2 &&
      //       actualValues3[3] == 2 && actualValues3[4] == 2 && actualValues3[5] == 2 &&
      //       actualValues3[6] == 2 && actualValues3[7] == 2 && actualValues3[8] == 2).assertEqual(true);
      //   }
      // } catch (e: BusinessError) {
      //   console.info(msg + ` matrix getAll actualValues3 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
      //   expect().assertFail();
      // }
      // let value3: Array<number> = [-1, -2, -3, -4, -5, -6, -7, -8, -9];
      // matrix.setMatrix(value3);
      // matrixnew.setMatrix(matrix);
      // try {
      //   let actualValues4 = matrixnew.getAll();
      //   console.info(msg + ' matrix getAll actualValues4 successed');
      //   if (actualValues4) {
      //     console.info(msg + "matrix actualValues4: " + actualValues4.toString());
      //     expect(actualValues4[0] == -1 && actualValues4[1] == -2 && actualValues4[2] == -3 &&
      //       actualValues4[3] == -4 && actualValues4[4] == -5 && actualValues4[5] == -6 &&
      //       actualValues4[6] == -7 && actualValues4[7] == -8 && actualValues4[8] == -9).assertEqual(true);
      //   }
      // } catch (e: BusinessError) {
      //   console.info(msg + ` matrix getAll actualValues4 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
      //   expect().assertFail();
      // }
      // let matrix1 = new drawing.Matrix();
      // matrix1.setRotation(60, 20, 50);
      // matrixnew.setMatrix(matrix1);
      // try {
      //   let actualValues5 = matrixnew.getAll();
      //   console.info(msg + ' matrix getAll actualValues5 successed');
      //   if (actualValues5) {
      //     console.info(msg + "matrix actualValues5: " + actualValues5.toString());
      //     expect(actualValues5[0] == 0.4999999701976776 && actualValues5[1] == -0.866025447845459 &&
      //       actualValues5[2] == 53.301273345947266 &&
      //       actualValues5[3] == 0.866025447845459 && actualValues5[4] == 0.4999999701976776 &&
      //       actualValues5[5] == 7.67949104309082 &&
      //       actualValues5[6] == 0 && actualValues5[7] == 0 && actualValues5[8] == 1).assertEqual(true);
      //   }
      // } catch (e: BusinessError) {
      //   console.info(msg + ` matrix getAll actualValues5 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
      //   expect().assertFail();
      // }
      // let matrix2 = new drawing.Matrix();
      // matrix2.setTranslation(50, -25);
      // matrixnew.setMatrix(matrix2);
      // try {
      //   let actualValues6 = matrixnew.getAll();
      //   console.info(msg + ' matrix getAll actualValues6 successed');
      //   if (actualValues6) {
      //     console.info(msg + "matrix actualValues6: " + actualValues6.toString());
      //     expect(actualValues6[0] == 1 && actualValues6[1] == 0 && actualValues6[2] == 50 &&
      //       actualValues6[3] == 0 && actualValues6[4] == 1 && actualValues6[5] == -25 &&
      //       actualValues6[6] == 0 && actualValues6[7] == 0 && actualValues6[8] == 1).assertEqual(true);
      //   }
      // } catch (e: BusinessError) {
      //   console.info(msg + ` matrix getAll actualValues6 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
      //   expect().assertFail();
      // }
    })
    /**
     * @tc.name   testMatrixSetMatrixMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_STATIC_2401
     * @tc.desc   testMatrixSetMatrixMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixSetMatrixMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testMatrixSetMatrixMultipleCallsStatic';
      let matrix = new drawing.Matrix();
      let matrixnew = new drawing.Matrix();
      for (let i = 0; i < 20; i += 1) {
        try {
          let value3: Array<number> =
            [Math.random() * 10, Math.random() * 10, Math.random() * 10, Math.random() * 10, Math.random() * 10,
              Math.random() * 10, Math.random() * 10, Math.random() * 10, Math.random() * 10];
          matrix.setMatrix(value3);
          // matrixnew.setMatrix(matrix)
          console.info(msg + `matrix.setMatrix success step: ` + i);
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + `matrix.setMatrix error. errorCode is: ${e.code} + errormsg is: ${e.message}} step: ${i}`);
          expect().assertFail()
        }
      }
    });
  })
}