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
import { BusinessError } from '@ohos.base';

const loop_times = 20;

export default function drawingTsMatrixTest() {
  describe('drawingTsMatrixTest', () => {
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
     * @tc.name   testMatrixConstructorNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_STATIC_0100
     * @tc.desc   testMatrixConstructorNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixConstructorNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testMatrixConstructorNormalStatic';
      try {
        let matrix = new drawing.Matrix();
        console.info(msg + ' Matrix successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` Matrix errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.name   testMatrixConstructorMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_STATIC_0103
     * @tc.desc   testMatrixConstructorMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixConstructorMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testMatrixConstructorMultipleCallsStatic';
      try {
        for (let i = 0; i < loop_times; i++) {
          let matrix = new drawing.Matrix();
        }
        console.info(msg + ' Matrix successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` Matrix errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.name   testMatrixSetRotationNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_STATIC_0200
     * @tc.desc   testMatrixSetRotationNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixSetRotationNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testMatrixSetRotationNormalStatic';
      try {
        let matrix = new drawing.Matrix();
        matrix.setRotation(90, 100, 100);
        let widths: number[] | undefined = matrix.getAll();
        if (widths) {
          expect(widths.length == 9).assertTrue();
          expect(matrix != null).assertTrue();
          console.info(msg + ' getAll successed,width:' + widths.length + JSON.stringify(matrix));
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getAll errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.setRotation(90.1, 100.1, 100.1);
        let widths: number[] | undefined = matrix.getAll();
        if (widths) {
          expect(widths.length == 9).assertTrue();
          expect(matrix != null).assertTrue();
          console.info(msg + ' getAll successed,width:' + widths.length + JSON.stringify(matrix));
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getAll errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.setRotation(-90, 100, 100);
        let widths: number[] | undefined = matrix.getAll();
        if (widths) {
          expect(widths.length == 9).assertTrue();
          expect(matrix != null).assertTrue();
          console.info(msg + ' getAll successed,width:' + widths.length + JSON.stringify(matrix));
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getAll errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.setRotation(90, -100, 100);
        let widths: number[] | undefined = matrix.getAll();
        if (widths) {
          expect(widths.length == 9).assertTrue();
          expect(matrix != null).assertTrue();
          console.info(msg + ' getAll successed,width:' + widths.length + JSON.stringify(matrix));
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getAll errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.setRotation(90, 100, -100);
        let widths: number[] | undefined = matrix.getAll();
        matrix.setRotation(90.1, 100.1, 100.1);
        if (widths) {
          expect(widths.length == 9).assertTrue();
          expect(matrix != null).assertTrue();
          console.info(msg + ' getAll successed,width:' + widths.length + JSON.stringify(matrix));
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getAll errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.setRotation(361, Number.MAX_VALUE, Number.MAX_VALUE);
        let widths: number[] | undefined = matrix.getAll();
        if (widths) {
          expect(widths.length == 9).assertTrue();
          expect(matrix != null).assertTrue();
          console.info(msg + ' getAll successed,width:' + widths.length + JSON.stringify(matrix));
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getAll errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.name   testMatrixSetRotationMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_STATIC_0203
     * @tc.desc   testMatrixSetRotationMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixSetRotationMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testMatrixSetRotationMultipleCallsStatic';
      try {
        let matrix = new drawing.Matrix();
        for (let i = 0; i < loop_times; i++) {
          matrix.setRotation(Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE,
            Math.random() * Number.MAX_VALUE);
        }
        console.info(msg + ' setRotation successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setRotation errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.name   testMatrixSetScaleNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_STATIC_0300
     * @tc.desc   testMatrixSetScaleNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixSetScaleNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testMatrixSetScaleNormalStatic';
      try {
        let matrix = new drawing.Matrix();
        matrix.setScale(100, 100, 150, 150);
        let widths: number[] | undefined = matrix.getAll();
        if (widths) {
          expect(widths.length == 9).assertTrue();
          expect(matrix != null).assertTrue();
          console.info(msg + ' setScale successed,width:' + widths.length + JSON.stringify(matrix));
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setScale errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.setScale(0.2, 0.2, 0.5, 0.5);
        let widths: number[] | undefined = matrix.getAll();
        if (widths) {
          expect(widths.length == 9).assertTrue();
          expect(matrix != null).assertTrue();
          console.info(msg + ' setScale successed,width:' + widths.length + JSON.stringify(matrix));
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setScale errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.setScale(-100, -100, 150, 150);
        let widths: number[] | undefined = matrix.getAll();
        if (widths) {
          expect(widths.length == 9).assertTrue();
          expect(matrix != null).assertTrue();
          console.info(msg + ' setScale successed,width:' + widths.length + JSON.stringify(matrix));
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setScale errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.setScale(100, 100, -150, -150);
        let widths: number[] | undefined = matrix.getAll();
        if (widths) {
          expect(widths.length == 9).assertTrue();
          expect(matrix != null).assertTrue();
          console.info(msg + ' setScale successed,width:' + widths.length + JSON.stringify(matrix));
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setScale errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.setScale(Number.MAX_VALUE, Number.MAX_VALUE, Number.MAX_VALUE, Number.MAX_VALUE);
        let widths: number[] | undefined = matrix.getAll();
        if (widths) {
          expect(widths.length == 9).assertTrue();
          expect(matrix != null).assertTrue();
          console.info(msg + ' setScale successed,width:' + widths.length + JSON.stringify(matrix));
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setScale errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.name   testMatrixSetScaleMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_STATIC_0303
     * @tc.desc   testMatrixSetScaleMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixSetScaleMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testMatrixSetScaleMultipleCallsStatic';
      try {
        let matrix = new drawing.Matrix();
        for (let i = 0; i < loop_times; i++) {
          matrix.setScale(Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE,
            Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE);
        }
        console.info(msg + ' setScale successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setScale errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.name   testMatrixSetTranslationNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_STATIC_0400
     * @tc.desc   testMatrixSetTranslationNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixSetTranslationNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testMatrixSetTranslationNormalStatic';
      try {
        let matrix = new drawing.Matrix();
        matrix.setTranslation(100, 100);
        let widths: number[] | undefined = matrix.getAll();
        if (widths) {
          expect(widths.length == 9).assertTrue();
          expect(matrix != null).assertTrue();
          console.info(msg + ' setTranslation successed,width:' + widths.length + JSON.stringify(matrix));
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setTranslation errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.setTranslation(100.1, 100.1);
        let widths: number[] | undefined = matrix.getAll();
        if (widths) {
          expect(widths.length == 9).assertTrue();
          expect(matrix != null).assertTrue();
          console.info(msg + ' setTranslation successed,width:' + widths.length + JSON.stringify(matrix));
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setTranslation errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.setTranslation(-100, 100);
        let widths: number[] | undefined = matrix.getAll();
        if (widths) {
          expect(widths.length == 9).assertTrue();
          expect(matrix != null).assertTrue();
          console.info(msg + ' setTranslation successed,width:' + widths.length + JSON.stringify(matrix));
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setTranslation errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.setTranslation(100, -150);
        let widths: number[] | undefined = matrix.getAll();
        if (widths) {
          expect(widths.length == 9).assertTrue();
          expect(matrix != null).assertTrue();
          console.info(msg + ' setTranslation successed,width:' + widths.length + JSON.stringify(matrix));
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setTranslation errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.setTranslation(Number.MAX_VALUE, Number.MAX_VALUE);
        let widths: number[] | undefined = matrix.getAll();
        if (widths) {
          expect(widths.length == 9).assertTrue();
          expect(matrix != null).assertTrue();
          console.info(msg + ' setTranslation successed,width:' + widths.length + JSON.stringify(matrix));
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setTranslation errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.name   testMatrixSetTranslationMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_STATIC_0403
     * @tc.desc   testMatrixSetTranslationMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixSetTranslationMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testMatrixSetTranslationMultipleCallsStatic';
      try {
        let matrix = new drawing.Matrix();
        for (let i = 0; i < loop_times; i++) {
          matrix.setTranslation(Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE);
        }
        console.info(msg + ' setTranslation successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setTranslation errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.name   testMatrixSetAndGetMatrixNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_STATIC_0500
     * @tc.desc   testMatrixSetAndGetMatrixNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixSetAndGetMatrixNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testMatrixSetAndGetMatrixNormalStatic';
      try {
        let matrix = new drawing.Matrix();
        let widths: number[] | undefined = matrix.getAll();
        if (widths) {
          expect(widths.length == 9).assertTrue();
          expect(matrix != null).assertTrue();
          console.info(msg + ' SetAndGetMatrix successed,width:' + widths.length + JSON.stringify(matrix));
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` SetAndGetMatrix errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.setMatrix([1, 2, 3, 4, 5, 6, 7, 8, 9]);
        matrix.getValue(0);
        let widths: number[] | undefined = matrix.getAll();
        if (widths) {
          expect(widths.length == 9).assertTrue();
          expect(matrix != null).assertTrue();
          console.info(msg + ' SetAndGetMatrix successed,width:' + widths.length + JSON.stringify(matrix));
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` SetAndGetMatrix errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.setMatrix([1.1, 2.1, 3.1, 4.1, 5.1, 6.1, 7.1, 8.1, 9.1]);
        matrix.getValue(0);
        let widths: number[] | undefined = matrix.getAll();
        if (widths) {
          expect(widths.length == 9).assertTrue();
          expect(matrix != null).assertTrue();
          console.info(msg + ' SetAndGetMatrix successed,width:' + widths.length + JSON.stringify(matrix));
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` SetAndGetMatrix errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.setMatrix([0, -1, 2.1, 2.1, 42.1, 2.1, 2., 1 - 2.1, 10]);
        matrix.getValue(0);
        let widths: number[] | undefined = matrix.getAll();
        if (widths) {
          expect(widths.length == 9).assertTrue();
          expect(matrix != null).assertTrue();
          console.info(msg + ' SetAndGetMatrix successed,width:' + widths.length + JSON.stringify(matrix));
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` SetAndGetMatrix errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.setMatrix([Number.MAX_VALUE, Number.MAX_VALUE, Number.MAX_VALUE, Number.MAX_VALUE, Number.MAX_VALUE,
          Number.MAX_VALUE, Number.MAX_VALUE, Number.MAX_VALUE, Number.MAX_VALUE]);
        matrix.getValue(0);
        let widths: number[] | undefined = matrix.getAll();
        if (widths) {
          expect(widths.length == 9).assertTrue();
          expect(matrix != null).assertTrue();
          console.info(msg + ' SetAndGetMatrix successed,width:' + widths.length + JSON.stringify(matrix));
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` SetAndGetMatrix errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.name   testMatrixSetAndGetMatrixNullStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_STATIC_0501
     * @tc.desc   testMatrixSetAndGetMatrixNullStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixSetAndGetMatrixNullStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testMatrixSetAndGetMatrixNullStatic';
      try {
        let matrix = new drawing.Matrix();
        matrix.setMatrix([]);
        console.info(msg + ' SetAndGetMatrix successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` SetAndGetMatrix errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testMatrixSetAndGetMatrixMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_STATIC_0503
     * @tc.desc   testMatrixSetAndGetMatrixMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixSetAndGetMatrixMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testMatrixSetAndGetMatrixMultipleCallsStatic';
      try {
        let matrix = new drawing.Matrix();
        matrix.setMatrix([Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE,
          Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE,
          Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE,
          Math.random() * Number.MAX_VALUE]);
        for (let i = 0; i < loop_times; i++) {
          matrix.getValue(0);
          matrix.getAll();
        }
        console.info(msg + ' SetAndGetMatrix successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` SetAndGetMatrix errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        for (let i = 0; i < loop_times; i++) {
          matrix.setMatrix([1, 2, 3, 4, 5, 6, 7, 8, 9]);
        }
        console.info(msg + ' SetAndGetMatrix successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` SetAndGetMatrix errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.setMatrix([1, 2, 3, 4, 5, 6, 7, 8, 9]);
        for (let i = 0; i < loop_times; i++) {
          matrix.getValue(0);
        }
        for (let i = 0; i < loop_times; i++) {
          matrix.getAll();
        }
        console.info(msg + ' SetAndGetMatrix successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` SetAndGetMatrix errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.name   testMatrixSetAndGetMatrixAbNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_STATIC_0504
     * @tc.desc   testMatrixSetAndGetMatrixAbNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixSetAndGetMatrixAbNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testMatrixSetAndGetMatrixAbNormalStatic';
      try {
        let matrix = new drawing.Matrix();
        matrix.setMatrix([1, 2, 3, 4, 5, 6, 7, 8]);
        matrix.getValue(9);
        console.info(msg + ' SetAndGetMatrix 1 successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` SetAndGetMatrix 1 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.setMatrix([1, 2, 3, 4, 5, 6, 7, 8, 8, 8])
        matrix.getValue(-1);
        console.info(msg + ' SetAndGetMatrix 2 successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` SetAndGetMatrix 2 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.getValue(-1);
        console.info(msg + ' SetAndGetMatrix 3 successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` SetAndGetMatrix 3 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        let matrix = new drawing.Matrix();
        matrix.getValue(9);
        console.info(msg + ' SetAndGetMatrix 4 successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` SetAndGetMatrix 4 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })
    /**
     * @tc.name   testMatrixPreConcatNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_STATIC_0600
     * @tc.desc   testMatrixPreConcatNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixPreConcatNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testMatrixPreConcatNormalStatic';
      try {
        let matrix1 = new drawing.Matrix();
        matrix1.setMatrix([2, 1, 3, 1, 2, 1, 3, 1, 2]);
        let matrix2 = new drawing.Matrix();
        matrix2.setMatrix([-2, 1, 3, 1, 0, -1, 3, -1, 2]);
        matrix1.preConcat(matrix2);
        matrix1.getAll();
        console.info(msg + ' preConcat successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` preConcat errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.name   testMatrixPreConcatMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_STATIC_0603
     * @tc.desc   testMatrixPreConcatMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixPreConcatMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testMatrixPreConcatMultipleCallsStatic';
      try {
        let matrix = new drawing.Matrix();
        for (let i = 0; i < loop_times; i++) {
          matrix.preConcat(matrix);
        }
        console.info(msg + ' preConcat successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` preConcat errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.name   testMatrixIsEqualNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_STATIC_0700
     * @tc.desc   testMatrixIsEqualNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixIsEqualNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testMatrixIsEqualNormalStatic';
      try {
        let matrix1 = new drawing.Matrix();
        matrix1.setMatrix([2, 1, 3, 1, 2, 1, 3, 1, 2]);
        let matrix2 = new drawing.Matrix();
        matrix2.setMatrix([-2, 1, 3, 1, 0, -1, 3, -1, 2]);
        let result = matrix1.isEqual(matrix2);
        expect(result).assertEqual(false);
        console.info(msg + ' 1 isEqual successed result: ' + result);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` 1 isEqual errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix1 = new drawing.Matrix();
        matrix1.setMatrix([1, 2, 3, 4, 5, 6, 7, 8, 9]);
        let matrix2 = new drawing.Matrix();
        matrix2.setMatrix([1, 2, 3, 4, 5, 6, 7, 8, 9]);
        let result = matrix1.isEqual(matrix2)
        expect(result).assertEqual(true);
        console.info(msg + ' 2 isEqual successed result: ' + result);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` 2 isEqual errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.name   testMatrixIsEqualMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_STATIC_0703
     * @tc.desc   testMatrixIsEqualMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixIsEqualMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testMatrixIsEqualMultipleCallsStatic';
      try {
        let matrix1 = new drawing.Matrix();
        matrix1.setMatrix([2, 1, 3, 1, 2, 1, 3, 1, 2]);
        let matrix2 = new drawing.Matrix();
        matrix2.setMatrix([-2, 1, 3, 1, 0, -1, 3, -1, 2]);
        console.info(msg + ' isEqual successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` isEqual errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix1 = new drawing.Matrix();
        matrix1.setMatrix([2, 1, 3, 1, 2, 1, 3, 1, 2]);
        let matrix2 = new drawing.Matrix();
        matrix2.setMatrix([-2, 1, 3, 1, 0, -1, 3, -1, 2]);
        for (let i = 0; i < loop_times; i++) {
          let result =  matrix1.isEqual(matrix2);
          expect(result).assertEqual(false);
          console.info(msg + ' isEqual successed result: ' + result + " step: " + i);
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` isEqual errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.name   testMatrixInvertNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_STATIC_0800
     * @tc.desc   testMatrixInvertNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixInvertNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testMatrixInvertNormalStatic';
      try {
        let matrix1 = new drawing.Matrix();
        let matrix2 = new drawing.Matrix();
        matrix2.setScale(0, 0, 0.5, 0.5);
        let result = matrix1.invert(matrix2);
        expect(result).assertEqual(true);
        console.info(msg + ' 1 invert successed result: ' + result);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` invert errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix1 = new drawing.Matrix();
        let matrix2 = new drawing.Matrix();
        matrix1.setScale(0, 0, 0.5, 0.5);
        let result = matrix1.invert(matrix2);
        expect(result).assertEqual(false);
        console.info(msg + ' 2 invert successed result: ' + result);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` invert errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.name   testMatrixInvertMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_STATIC_0803
     * @tc.desc   testMatrixInvertMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixInvertMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testMatrixInvertMultipleCallsStatic';
      try {
        let matrix1 = new drawing.Matrix();
        matrix1.setMatrix([2, 1, 3, 1, 2, 1, 3, 1, 2]);
        let matrix2 = new drawing.Matrix();
        matrix2.setMatrix([-2, 1, 3, 1, 0, -1, 3, -1, 2]);
        console.info(msg + ' invert successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` invert errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix1 = new drawing.Matrix();
        matrix1.setMatrix([2, 1, 3, 1, 2, 1, 3, 1, 2]);
        let matrix2 = new drawing.Matrix();
        matrix2.setMatrix([-2, 1, 3, 1, 0, -1, 3, -1, 2]);
        for (let i = 0; i < loop_times; i++) {
          let result = matrix1.invert(matrix2);
          expect(result).assertEqual(true);
          console.info(msg + ' invert successed result: ' + result + " step: " + i);
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` invert errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.name   testMatrixIsIdentityNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_STATIC_0900
     * @tc.desc   testMatrixIsIdentityNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixIsIdentityNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testMatrixIsIdentityNormalStatic';
      try {
        let matrix1 = new drawing.Matrix();
        matrix1.isIdentity();
        console.info(msg + ' isIdentity successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` isIdentity errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix1 = new drawing.Matrix();
        matrix1.setMatrix([2, 1, 3, 1, 2, 1, 3, 1, 2]);
        matrix1.isIdentity();
        console.info(msg + ' isIdentity successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` isIdentity errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.name   testMatrixIsIdentityMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_STATIC_0902
     * @tc.desc   testMatrixIsIdentityMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixIsIdentityMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testMatrixIsIdentityMultipleCallsStatic';
      try {
        let matrix1 = new drawing.Matrix();
        for (let i = 0; i < loop_times; i++) {
          matrix1.isIdentity();
        }
        console.info(msg + ' isIdentity successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` isIdentity errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.name   testMatrixPostRotateNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_STATIC_1000
     * @tc.desc   testMatrixPostRotateNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixPostRotateNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testMatrixPostRotateNormalStatic';
      try {
        let matrix = new drawing.Matrix();
        matrix.postRotate(90, 100, 100);
        let widths: number[] | undefined = matrix.getAll();
        if (widths) {
          expect(widths.length == 9).assertTrue();
          expect(matrix != null).assertTrue();
          console.info(msg + ' postRotate successed,width:' + widths.length + JSON.stringify(matrix));
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` postRotate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.postRotate(90.1, 100.1, 100.1);
        let widths: number[] | undefined = matrix.getAll();
        if (widths) {
          expect(widths.length == 9).assertTrue();
          expect(matrix != null).assertTrue();
          console.info(msg + ' postRotate successed,width:' + widths.length + JSON.stringify(matrix));
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` postRotate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.postRotate(-90, 100, 100);
        let widths: number[] | undefined = matrix.getAll();
        if (widths) {
          expect(widths.length == 9).assertTrue();
          expect(matrix != null).assertTrue();
          console.info(msg + ' postRotate successed,width:' + widths.length + JSON.stringify(matrix));
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` postRotate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.postRotate(90, -100, 100);
        let widths: number[] | undefined = matrix.getAll();
        if (widths) {
          expect(widths.length == 9).assertTrue();
          expect(matrix != null).assertTrue();
          console.info(msg + ' postRotate successed,width:' + widths.length + JSON.stringify(matrix));
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` postRotate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.postRotate(90, 100, -100);
        let widths: number[] | undefined = matrix.getAll();
        if (widths) {
          expect(widths.length == 9).assertTrue();
          expect(matrix != null).assertTrue();
          console.info(msg + ' postRotate successed,width:' + widths.length + JSON.stringify(matrix));
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` postRotate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.postRotate(361, Number.MAX_VALUE, Number.MAX_VALUE);
        let widths: number[] | undefined = matrix.getAll();
        if (widths) {
          expect(widths.length == 9).assertTrue();
          expect(matrix != null).assertTrue();
          console.info(msg + ' postRotate successed,width:' + widths.length + JSON.stringify(matrix));
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` postRotate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.name   testMatrixPostRotateMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_STATIC_1003
     * @tc.desc   testMatrixPostRotateMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixPostRotateMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testMatrixPostRotateMultipleCallsStatic';
      try {
        let matrix = new drawing.Matrix();
        for (let i = 0; i < loop_times; i++) {
          matrix.postRotate(Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE,
            Math.random() * Number.MAX_VALUE);
        }
        console.info(msg + ' postRotate successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` postRotate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.name   testMatrixPostScaleNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_STATIC_1100
     * @tc.desc   testMatrixPostScaleNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixPostScaleNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testMatrixPostScaleNormalStatic';
      try {
        let matrix = new drawing.Matrix();
        matrix.postScale(100, 100, 150, 150);
        let widths: number[] | undefined = matrix.getAll();
        if (widths) {
          expect(widths.length == 9).assertTrue();
          expect(matrix != null).assertTrue();
          console.info(msg + ' postScale successed,width:' + widths.length + JSON.stringify(matrix));
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` postScale errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.postScale(0.2, 0.2, 0.5, 0.5);
        let widths: number[] | undefined = matrix.getAll();
        if (widths) {
          expect(widths.length == 9).assertTrue();
          expect(matrix != null).assertTrue();
          console.info(msg + ' postScale successed,width:' + widths.length + JSON.stringify(matrix));
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` postScale errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.postScale(-100, -100, 150, 150);
        let widths: number[] | undefined = matrix.getAll();
        if (widths) {
          expect(widths.length == 9).assertTrue();
          expect(matrix != null).assertTrue();
          console.info(msg + ' postScale successed,width:' + widths.length + JSON.stringify(matrix));
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` postScale errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.postScale(100, 100, -150, -150);
        let widths: number[] | undefined = matrix.getAll();
        if (widths) {
          expect(widths.length == 9).assertTrue();
          expect(matrix != null).assertTrue();
          console.info(msg + ' postScale successed,width:' + widths.length + JSON.stringify(matrix));
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` postScale errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.postScale(Number.MAX_VALUE, Number.MAX_VALUE, Number.MAX_VALUE, Number.MAX_VALUE);
        let widths: number[] | undefined = matrix.getAll();
        if (widths) {
          expect(widths.length == 9).assertTrue();
          expect(matrix != null).assertTrue();
          console.info(msg + ' postScale successed,width:' + widths.length + JSON.stringify(matrix));
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` postScale errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.name   testMatrixPostScaleMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_STATIC_1103
     * @tc.desc   testMatrixPostScaleMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixPostScaleMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testMatrixPostScaleMultipleCallsStatic';
      try {
        let matrix = new drawing.Matrix();
        for (let i = 0; i < loop_times; i++) {
          matrix.postScale(Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE,
            Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE);
        }
        console.info(msg + ' postScale successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` postScale errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
  })
}