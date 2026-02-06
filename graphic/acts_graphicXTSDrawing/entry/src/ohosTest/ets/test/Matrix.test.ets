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
     * @tc.name   testMatrixConstructorNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_0100
     * @tc.desc   testMatrixConstructorNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixConstructorNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testMatrixConstructorNormal';
      try {
        let matrix = new drawing.Matrix();
        console.info(msg + ' Matrix successed');
      } catch (e) {
        console.info(msg + ` Matrix errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.name   testMatrixConstructorMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_0103
     * @tc.desc   testMatrixConstructorMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixConstructorMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testMatrixConstructorMultipleCalls';
      try {
        for (let i = 0; i < loop_times; i++) {
          let matrix = new drawing.Matrix();
        }
        console.info(msg + ' Matrix successed');
      } catch (e) {
        console.info(msg + ` Matrix errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.name   testMatrixSetRotationNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_0200
     * @tc.desc   testMatrixSetRotationNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixSetRotationNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testMatrixSetRotationNormal';
      try {
        let matrix = new drawing.Matrix();
        matrix.setRotation(90, 100, 100);
        let widths : number[] = matrix.getAll();
        expect(widths.length == 9).assertTrue();
        expect(matrix != null).assertTrue();
        console.info(msg + ' getAll successed,width:'+ widths.length + JSON.stringify(matrix));
      } catch (e) {
        console.info(msg + ` getAll errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.setRotation(90.1, 100.1, 100.1);
        let widths : number[] = matrix.getAll();
        expect(widths.length == 9).assertTrue();
        expect(matrix != null).assertTrue();
        console.info(msg + ' getAll successed,width:'+ widths.length + JSON.stringify(matrix));
      } catch (e) {
        console.info(msg + ` getAll errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.setRotation(-90, 100, 100);
        let widths : number[] = matrix.getAll();
        expect(widths.length == 9).assertTrue();
        expect(matrix != null).assertTrue();
        console.info(msg + ' getAll successed,width:'+ widths.length + JSON.stringify(matrix));
      } catch (e) {
        console.info(msg + ` getAll errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.setRotation(90, -100, 100);
        let widths : number[] = matrix.getAll();
        expect(widths.length == 9).assertTrue();
        expect(matrix != null).assertTrue();
        console.info(msg + ' getAll successed,width:'+ widths.length + JSON.stringify(matrix));
      } catch (e) {
        console.info(msg + ` getAll errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.setRotation(90, 100, -100);
        let widths : number[] = matrix.getAll();
        matrix.setRotation(90.1, 100.1, 100.1);
        expect(widths.length == 9).assertTrue();
        expect(matrix != null).assertTrue();
        console.info(msg + ' getAll successed,width:'+ widths.length + JSON.stringify(matrix));
      } catch (e) {
        console.info(msg + ` getAll errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.setRotation(361, Number.MAX_VALUE, Number.MAX_VALUE);
        let widths : number[] = matrix.getAll();
        expect(widths.length == 9).assertTrue();
        expect(matrix != null).assertTrue();
        console.info(msg + ' getAll successed,width:'+ widths.length + JSON.stringify(matrix));
      } catch (e) {
        console.info(msg + ` getAll errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.name   testMatrixSetRotationNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_0201
     * @tc.desc   testMatrixSetRotationNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixSetRotationNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testMatrixSetRotationNull';
      try {
        let matrix = new drawing.Matrix();
        matrix.setRotation(null, 100, 100);
        console.info(msg + ' setRotation successed');
      } catch (e) {
        console.info(msg + ` setRotation errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.setRotation(90, null, 100);
        console.info(msg + ' setRotation successed');
      } catch (e) {
        console.info(msg + ` setRotation errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.setRotation(90, 100, null);
        console.info(msg + ' setRotation successed');
      } catch (e) {
        console.info(msg + ` setRotation errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.setRotation(undefined, 100, 100);
        console.info(msg + ' setRotation successed');
      } catch (e) {
        console.info(msg + ` setRotation errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.setRotation(90, undefined, 100);
        console.info(msg + ' setRotation successed');
      } catch (e) {
        console.info(msg + ` setRotation errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.setRotation(90, 100, undefined);
        console.info(msg + ' setRotation successed');
      } catch (e) {
        console.info(msg + ` setRotation errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testMatrixSetRotationMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_0203
     * @tc.desc   testMatrixSetRotationMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixSetRotationMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testMatrixSetRotationMultipleCalls';
      try {
        let matrix = new drawing.Matrix();
        for (let i = 0; i < loop_times; i++) {
          matrix.setRotation(Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE);
        }
        console.info(msg + ' setRotation successed');
      } catch (e) {
        console.info(msg + ` setRotation errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.name   testMatrixSetScaleNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_0300
     * @tc.desc   testMatrixSetScaleNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixSetScaleNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testMatrixSetScaleNormal';
      try {
        let matrix = new drawing.Matrix();
        matrix.setScale(100, 100, 150, 150);
        let widths : number[] = matrix.getAll();
        expect(widths.length == 9).assertTrue();
        expect(matrix != null).assertTrue();
        console.info(msg + ' setScale successed,width:'+ widths.length + JSON.stringify(matrix));
      } catch (e) {
        console.info(msg + ` setScale errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.setScale(0.2, 0.2, 0.5, 0.5);
        let widths : number[] = matrix.getAll();
        expect(widths.length == 9).assertTrue();
        expect(matrix != null).assertTrue();
        console.info(msg + ' setScale successed,width:'+ widths.length + JSON.stringify(matrix));
      } catch (e) {
        console.info(msg + ` setScale errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.setScale(-100, -100, 150, 150);
        let widths : number[] = matrix.getAll();
        expect(widths.length == 9).assertTrue();
        expect(matrix != null).assertTrue();
        console.info(msg + ' setScale successed,width:'+ widths.length + JSON.stringify(matrix));
      } catch (e) {
        console.info(msg + ` setScale errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.setScale(100, 100, -150, -150);
        let widths : number[] = matrix.getAll();
        expect(widths.length == 9).assertTrue();
        expect(matrix != null).assertTrue();
        console.info(msg + ' setScale successed,width:'+ widths.length + JSON.stringify(matrix));
      } catch (e) {
        console.info(msg + ` setScale errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.setScale(Number.MAX_VALUE, Number.MAX_VALUE, Number.MAX_VALUE, Number.MAX_VALUE);
        let widths : number[] = matrix.getAll();
        expect(widths.length == 9).assertTrue();
        expect(matrix != null).assertTrue();
        console.info(msg + ' setScale successed,width:'+ widths.length + JSON.stringify(matrix));
      } catch (e) {
        console.info(msg + ` setScale errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.name   testMatrixSetScaleNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_0301
     * @tc.desc   testMatrixSetScaleNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixSetScaleNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testMatrixSetScaleNull';
      try {
        let matrix = new drawing.Matrix();
        matrix.setScale(null, 100, 150, 150);
        console.info(msg + ' setScale successed');
      } catch (e) {
        console.info(msg + ` setScale errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.setScale(100, null, 150, 150);
        console.info(msg + ' setScale successed');
      } catch (e) {
        console.info(msg + ` setScale errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.setScale(100, 100, null, 150);
        console.info(msg + ' setScale successed');
      } catch (e) {
        console.info(msg + ` setScale errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.setScale(100, 100, 150, null);
        console.info(msg + ' setScale successed');
      } catch (e) {
        console.info(msg + ` setScale errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.setScale(undefined, 100, 150, 150);
        console.info(msg + ' setScale successed');
      } catch (e) {
        console.info(msg + ` setScale errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.setScale(100, undefined, 150, 150);
        console.info(msg + ' setScale successed');
      } catch (e) {
        console.info(msg + ` setScale errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.setScale(100, 100, undefined, 150);
        console.info(msg + ' setScale successed');
      } catch (e) {
        console.info(msg + ` setScale errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.setScale(100, 100, 150, undefined);
        console.info(msg + ' setScale successed');
      } catch (e) {
        console.info(msg + ` setScale errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testMatrixSetScaleMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_0303
     * @tc.desc   testMatrixSetScaleMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixSetScaleMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testMatrixSetScaleMultipleCalls';
      try {
        let matrix = new drawing.Matrix();
        for (let i = 0; i < loop_times; i++) {
          matrix.setScale(Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE);
        }
        console.info(msg + ' setScale successed');
      } catch (e) {
        console.info(msg + ` setScale errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.name   testMatrixSetTranslationNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_0400
     * @tc.desc   testMatrixSetTranslationNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixSetTranslationNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testMatrixSetTranslationNormal';
      try {
        let matrix = new drawing.Matrix();
        matrix.setTranslation(100, 100);
        let widths : number[] = matrix.getAll();
        expect(widths.length == 9).assertTrue();
        expect(matrix != null).assertTrue();
        console.info(msg + ' setTranslation successed,width:'+ widths.length + JSON.stringify(matrix));
      } catch (e) {
        console.info(msg + ` setTranslation errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.setTranslation(100.1, 100.1);
        let widths : number[] = matrix.getAll();
        expect(widths.length == 9).assertTrue();
        expect(matrix != null).assertTrue();
        console.info(msg + ' setTranslation successed,width:'+ widths.length + JSON.stringify(matrix));
      } catch (e) {
        console.info(msg + ` setTranslation errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.setTranslation(-100, 100);
        let widths : number[] = matrix.getAll();
        expect(widths.length == 9).assertTrue();
        expect(matrix != null).assertTrue();
        console.info(msg + ' setTranslation successed,width:'+ widths.length + JSON.stringify(matrix));
      } catch (e) {
        console.info(msg + ` setTranslation errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.setTranslation(100, -150);
        let widths : number[] = matrix.getAll();
        expect(widths.length == 9).assertTrue();
        expect(matrix != null).assertTrue();
        console.info(msg + ' setTranslation successed,width:'+ widths.length + JSON.stringify(matrix));
      } catch (e) {
        console.info(msg + ` setTranslation errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.setTranslation(Number.MAX_VALUE, Number.MAX_VALUE);
        let widths : number[] = matrix.getAll();
        expect(widths.length == 9).assertTrue();
        expect(matrix != null).assertTrue();
        console.info(msg + ' setTranslation successed,width:'+ widths.length + JSON.stringify(matrix));
      } catch (e) {
        console.info(msg + ` setTranslation errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.name   testMatrixSetTranslationNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_0401
     * @tc.desc   testMatrixSetTranslationNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixSetTranslationNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testMatrixSetTranslationNull';
      try {
        let matrix = new drawing.Matrix();
        matrix.setTranslation(null, 100,);
        console.info(msg + ' setTranslation successed');
      } catch (e) {
        console.info(msg + ` setTranslation errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.setTranslation(100, null);
        console.info(msg + ' setTranslation successed');
      } catch (e) {
        console.info(msg + ` setTranslation errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.setTranslation(undefined, 100,);
        console.info(msg + ' setTranslation successed');
      } catch (e) {
        console.info(msg + ` setTranslation errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.setTranslation(100, undefined);
        console.info(msg + ' setTranslation successed');
      } catch (e) {
        console.info(msg + ` setTranslation errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testMatrixSetTranslationMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_0403
     * @tc.desc   testMatrixSetTranslationMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixSetTranslationMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testMatrixSetTranslationMultipleCalls';
      try {
        let matrix = new drawing.Matrix();
        for (let i = 0; i < loop_times; i++) {
          matrix.setTranslation(Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE);
        }
        console.info(msg + ' setTranslation successed');
      } catch (e) {
        console.info(msg + ` setTranslation errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.name   testMatrixSetAndGetMatrixNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_0500
     * @tc.desc   testMatrixSetAndGetMatrixNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixSetAndGetMatrixNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testMatrixSetAndGetMatrixNormal';
      try {
        let matrix = new drawing.Matrix();
        let widths : number[] = matrix.getAll();
        expect(widths.length == 9).assertTrue();
        expect(matrix != null).assertTrue();
        console.info(msg + ' SetAndGetMatrix successed,width:'+ widths.length + JSON.stringify(matrix));
      } catch (e) {
        console.info(msg + ` SetAndGetMatrix errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.setMatrix([1, 2, 3, 4, 5, 6, 7, 8, 9]);
        matrix.getValue(0);
        let widths : number[] = matrix.getAll();
        expect(widths.length == 9).assertTrue();
        expect(matrix != null).assertTrue();
        console.info(msg + ' SetAndGetMatrix successed,width:'+ widths.length + JSON.stringify(matrix));
      } catch (e) {
        console.info(msg + ` SetAndGetMatrix errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.setMatrix([1.1, 2.1, 3.1, 4.1, 5.1, 6.1, 7.1,8.1, 9.1]);
        matrix.getValue(0);
        let widths : number[] = matrix.getAll();
        expect(widths.length == 9).assertTrue();
        expect(matrix != null).assertTrue();
        console.info(msg + ' SetAndGetMatrix successed,width:'+ widths.length + JSON.stringify(matrix));
      } catch (e) {
        console.info(msg + ` SetAndGetMatrix errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.setMatrix([0,-1, 2.1, 2.1, 42.1, 2.1, 2.,1 -2.1, 10]);
        matrix.getValue(0);
        let widths : number[] = matrix.getAll();
        expect(widths.length == 9).assertTrue();
        expect(matrix != null).assertTrue();
        console.info(msg + ' SetAndGetMatrix successed,width:'+ widths.length + JSON.stringify(matrix));
      } catch (e) {
        console.info(msg + ` SetAndGetMatrix errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.setMatrix([Number.MAX_VALUE, Number.MAX_VALUE, Number.MAX_VALUE, Number.MAX_VALUE, Number.MAX_VALUE,
          Number.MAX_VALUE, Number.MAX_VALUE, Number.MAX_VALUE, Number.MAX_VALUE]);
        matrix.getValue(0);
        let widths : number[] = matrix.getAll();
        expect(widths.length == 9).assertTrue();
        expect(matrix != null).assertTrue();
        console.info(msg + ' SetAndGetMatrix successed,width:'+ widths.length + JSON.stringify(matrix));
      } catch (e) {
        console.info(msg + ` SetAndGetMatrix errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.name   testMatrixSetAndGetMatrixNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_0501
     * @tc.desc   testMatrixSetAndGetMatrixNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixSetAndGetMatrixNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testMatrixSetAndGetMatrixNull';
      try {
        let matrix = new drawing.Matrix();
        matrix.getValue(null);
        console.info(msg + ' SetAndGetMatrix successed');
      } catch (e) {
        console.info(msg + ` SetAndGetMatrix errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.getValue(undefined);
        console.info(msg + ' SetAndGetMatrix successed');
      } catch (e) {
        console.info(msg + ` SetAndGetMatrix errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.setMatrix(null);
        console.info(msg + ' SetAndGetMatrix successed');
      } catch (e) {
        console.info(msg + ` SetAndGetMatrix errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.setMatrix(undefined);
        console.info(msg + ' SetAndGetMatrix successed');
      } catch (e) {
        console.info(msg + ` SetAndGetMatrix errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.setMatrix([]);
        console.info(msg + ' SetAndGetMatrix successed');
      } catch (e) {
        console.info(msg + ` SetAndGetMatrix errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testMatrixSetAndGetMatrixMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_0503
     * @tc.desc   testMatrixSetAndGetMatrixMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixSetAndGetMatrixMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testMatrixSetAndGetMatrixMultipleCalls';
      try {
        let matrix = new drawing.Matrix();
        matrix.setMatrix([Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE,
          Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE,
          Math.random() * Number.MAX_VALUE,Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE,
          Math.random() * Number.MAX_VALUE]);
        for (let i = 0; i < loop_times; i++) {
          matrix.getValue(0);
          matrix.getAll();
        }
        console.info(msg + ' SetAndGetMatrix successed');
      } catch (e) {
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
        console.info(msg + ` SetAndGetMatrix errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.name   testMatrixSetAndGetMatrixAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_0504
     * @tc.desc   testMatrixSetAndGetMatrixAbnormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixSetAndGetMatrixAbnormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testMatrixSetAndGetMatrixAbnormal';
      try {
        let matrix = new drawing.Matrix();
        matrix.setMatrix([1, 2, 3, 4, 5, 6,7, 8]);
        matrix.getValue(9);
        console.info(msg + ' SetAndGetMatrix successed');
      } catch (e) {
        console.info(msg + ` SetAndGetMatrix errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.setMatrix([1, 2, 3, 4, 5, 6, 7, 8, 8, 8])
        matrix.getValue(-1);
        console.info(msg + ' SetAndGetMatrix successed');
      } catch (e) {
        console.info(msg + ` SetAndGetMatrix errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.getValue(-1);
        console.info(msg + ' SetAndGetMatrix successed');
      } catch (e) {
        console.info(msg + ` SetAndGetMatrix errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.getValue(9);
        console.info(msg + ' SetAndGetMatrix successed');
      } catch (e) {
        console.info(msg + ` SetAndGetMatrix errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })
    /**
     * @tc.name   testMatrixPreConcatNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_0600
     * @tc.desc   testMatrixPreConcatNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixPreConcatNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testMatrixPreConcatNormal';
      try {
        let matrix1 = new drawing.Matrix();
        matrix1.setMatrix([2, 1, 3, 1, 2, 1, 3, 1, 2]);
        let matrix2 = new drawing.Matrix();
        matrix2.setMatrix([-2, 1, 3, 1, 0, -1, 3, -1, 2]);
        matrix1.preConcat(matrix2);
        matrix1.getAll();
        console.info(msg + ' preConcat successed');
      } catch (e) {
        console.info(msg + ` preConcat errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.name   testMatrixPreConcatNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_0601
     * @tc.desc   testMatrixPreConcatNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixPreConcatNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testMatrixPreConcatNull';
      try {
        let matrix1 = new drawing.Matrix();
        matrix1.preConcat(null)
        matrix1.preConcat(undefined)
        console.info(msg + ' preConcat successed');
      } catch (e) {
        console.info(msg + ` preConcat errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        let matrix1 = new drawing.Matrix();
        matrix1.preConcat(undefined)
        console.info(msg + ' preConcat successed');
      } catch (e) {
        console.info(msg + ` preConcat errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testMatrixPreConcatMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_0603
     * @tc.desc   testMatrixPreConcatMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixPreConcatMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testMatrixPreConcatMultipleCalls';
      try {
        let matrix = new drawing.Matrix();
        for (let i = 0; i < loop_times; i++) {
          matrix.preConcat(matrix);
        }
        console.info(msg + ' preConcat successed');
      } catch (e) {
        console.info(msg + ` preConcat errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.name   testMatrixIsEqualNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_0700
     * @tc.desc   testMatrixIsEqualNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixIsEqualNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testMatrixIsEqualNormal';
      try {
        let matrix1 = new drawing.Matrix();
        matrix1.setMatrix([2, 1, 3, 1, 2, 1, 3, 1, 2]);
        let matrix2 = new drawing.Matrix();
        matrix2.setMatrix([-2, 1, 3, 1, 0, -1, 3, -1, 2]);
        matrix1.isEqual(matrix2);
        console.info(msg + ' isEqual successed');
      } catch (e) {
        console.info(msg + ` isEqual errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix1 = new drawing.Matrix();
        matrix1.setMatrix([1, 2, 3, 4, 5, 6, 7, 8, 9]);
        let matrix2 = new drawing.Matrix();
        matrix2.setMatrix([1, 2, 3, 4, 5, 6, 7, 8, 9]);
        matrix1.isEqual(matrix2)
        console.info(msg + ' isEqual successed');
      } catch (e) {
        console.info(msg + ` isEqual errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.name   testMatrixIsEqualNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_0701
     * @tc.desc   testMatrixIsEqualNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixIsEqualNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testMatrixIsEqualNull';
      try {
        let matrix1 = new drawing.Matrix();
        matrix1.isEqual(null);
        console.info(msg + ' isEqual successed');
      } catch (e) {
        console.info(msg + ` isEqual errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        let matrix1 = new drawing.Matrix();
        matrix1.isEqual(undefined);
        console.info(msg + ' isEqual successed');
      } catch (e) {
        console.info(msg + ` isEqual errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testMatrixIsEqualMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_0703
     * @tc.desc   testMatrixIsEqualMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixIsEqualMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testMatrixIsEqualMultipleCalls';
      try {
        let matrix1 = new drawing.Matrix();
        matrix1.setMatrix([2, 1, 3, 1, 2, 1, 3, 1, 2]);
        let matrix2 = new drawing.Matrix();
        matrix2.setMatrix([-2, 1, 3, 1, 0, -1, 3, -1, 2]);
        console.info(msg + ' isEqual successed');
      } catch (e) {
        console.info(msg + ` isEqual errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix1 = new drawing.Matrix();
        matrix1.setMatrix([2, 1, 3, 1, 2, 1, 3, 1, 2]);
        let matrix2 = new drawing.Matrix();
        matrix2.setMatrix([-2, 1, 3, 1, 0, -1, 3, -1, 2]);
        for (let i = 0; i < loop_times; i++) {
          matrix1.isEqual(matrix2);
        }
        console.info(msg + ' isEqual successed');
      } catch (e) {
        console.info(msg + ` isEqual errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.name   testMatrixInvertNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_0800
     * @tc.desc   testMatrixInvertNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixInvertNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testMatrixInvertNormal';
      try {
        let matrix1 = new drawing.Matrix();
        let matrix2 = new drawing.Matrix();
        matrix2 .setScale(0, 0, 0.5, 0.5);
        matrix1.invert(matrix2);
        console.info(msg + ' invert successed');
      } catch (e) {
        console.info(msg + ` invert errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix1 = new drawing.Matrix();
        let matrix2 = new drawing.Matrix();
        matrix1 .setScale(0, 0, 0.5, 0.5);
        matrix1.invert(matrix2);
        console.info(msg + ' invert successed');
      } catch (e) {
        console.info(msg + ` invert errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.name   testMatrixInvertNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_0801
     * @tc.desc   testMatrixInvertNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixInvertNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testMatrixInvertNull';
      try {
        let matrix1 = new drawing.Matrix();
        matrix1.invert(null);
        console.info(msg + ' invert successed');
      } catch (e) {
        console.info(msg + ` invert errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        let matrix1 = new drawing.Matrix();
        matrix1.invert(undefined);
        console.info(msg + ' invert successed');
      } catch (e) {
        console.info(msg + ` invert errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testMatrixInvertMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_0803
     * @tc.desc   testMatrixInvertMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixInvertMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testMatrixInvertMultipleCalls';
      try {
        let matrix1 = new drawing.Matrix();
        matrix1.setMatrix([2, 1, 3, 1, 2, 1, 3, 1, 2]);
        let matrix2 = new drawing.Matrix();
        matrix2.setMatrix([-2, 1, 3, 1, 0, -1, 3, -1, 2]);
        console.info(msg + ' invert successed');
      } catch (e) {
        console.info(msg + ` invert errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix1 = new drawing.Matrix();
        matrix1.setMatrix([2, 1, 3, 1, 2, 1, 3, 1, 2]);
        let matrix2 = new drawing.Matrix();
        matrix2.setMatrix([-2, 1, 3, 1, 0, -1, 3, -1, 2]);
        for (let i = 0; i < loop_times; i++) {
          matrix1.invert(matrix2);
        }
        console.info(msg + ' invert successed');
      } catch (e) {
        console.info(msg + ` invert errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.name   testMatrixIsIdentityNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_0900
     * @tc.desc   testMatrixIsIdentityNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixIsIdentityNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testMatrixIsIdentityNormal';
      try {
        let matrix1 = new drawing.Matrix();
        matrix1.isIdentity();
        console.info(msg + ' isIdentity successed');
      } catch (e) {
        console.info(msg + ` isIdentity errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix1 = new drawing.Matrix();
        matrix1.setMatrix([2, 1, 3, 1, 2, 1, 3, 1, 2]);
        matrix1.isIdentity();
        console.info(msg + ' isIdentity successed');
      } catch (e) {
        console.info(msg + ` isIdentity errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.name   testMatrixIsIdentityMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_0902
     * @tc.desc   testMatrixIsIdentityMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixIsIdentityMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testMatrixIsIdentityMultipleCalls';
      try {
        let matrix1 = new drawing.Matrix();
        for (let i = 0; i < loop_times; i++) {
          matrix1.isIdentity();
        }
        console.info(msg + ' isIdentity successed');
      } catch (e) {
        console.info(msg + ` isIdentity errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.name   testMatrixPostRotateNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_1000
     * @tc.desc   testMatrixPostRotateNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixPostRotateNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testMatrixPostRotateNormal';
      try {
        let matrix = new drawing.Matrix();
        matrix.postRotate(90, 100, 100);
        let widths : number[] = matrix.getAll();
        expect(widths.length == 9).assertTrue();
        expect(matrix != null).assertTrue();
        console.info(msg + ' postRotate successed,width:'+ widths.length + JSON.stringify(matrix));
      } catch (e) {
        console.info(msg + ` postRotate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.postRotate(90.1, 100.1, 100.1);
        let widths : number[] = matrix.getAll();
        expect(widths.length == 9).assertTrue();
        expect(matrix != null).assertTrue();
        console.info(msg + ' postRotate successed,width:'+ widths.length + JSON.stringify(matrix));
      } catch (e) {
        console.info(msg + ` postRotate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.postRotate(-90, 100, 100);
        let widths : number[] = matrix.getAll();
        expect(widths.length == 9).assertTrue();
        expect(matrix != null).assertTrue();
        console.info(msg + ' postRotate successed,width:'+ widths.length + JSON.stringify(matrix));
      } catch (e) {
        console.info(msg + ` postRotate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.postRotate(90, -100, 100);
        let widths : number[] = matrix.getAll();
        expect(widths.length == 9).assertTrue();
        expect(matrix != null).assertTrue();
        console.info(msg + ' postRotate successed,width:'+ widths.length + JSON.stringify(matrix));
      } catch (e) {
        console.info(msg + ` postRotate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.postRotate(90, 100, -100);
        let widths : number[] = matrix.getAll();
        expect(widths.length == 9).assertTrue();
        expect(matrix != null).assertTrue();
        console.info(msg + ' postRotate successed,width:'+ widths.length + JSON.stringify(matrix));
      } catch (e) {
        console.info(msg + ` postRotate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.postRotate(361, Number.MAX_VALUE, Number.MAX_VALUE);
        let widths : number[] = matrix.getAll();
        expect(widths.length == 9).assertTrue();
        expect(matrix != null).assertTrue();
        console.info(msg + ' postRotate successed,width:'+ widths.length + JSON.stringify(matrix));
      } catch (e) {
        console.info(msg + ` postRotate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.name   testMatrixPostRotateNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_1001
     * @tc.desc   testMatrixPostRotateNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixPostRotateNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testMatrixPostRotateNull';
      try {
        let matrix = new drawing.Matrix();
        matrix.postRotate(null, 100, 100);
        console.info(msg + ' postRotate successed');
      } catch (e) {
        console.info(msg + ` postRotate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.postRotate(90, null, 100);
        console.info(msg + ' postRotate successed');
      } catch (e) {
        console.info(msg + ` postRotate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.postRotate(90, 100, null);
        console.info(msg + ' postRotate successed');
      } catch (e) {
        console.info(msg + ` postRotate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.postRotate(undefined, 100, 100);
        console.info(msg + ' postRotate successed');
      } catch (e) {
        console.info(msg + ` postRotate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.postRotate(90, undefined, 100);
        console.info(msg + ' postRotate successed');
      } catch (e) {
        console.info(msg + ` postRotate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.postRotate(90, 100, undefined);
        console.info(msg + ' postRotate successed');
      } catch (e) {
        console.info(msg + ` postRotate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testMatrixPostRotateMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_1003
     * @tc.desc   testMatrixPostRotateMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixPostRotateMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testMatrixPostRotateMultipleCalls';
      try {
        let matrix = new drawing.Matrix();
        for (let i = 0; i < loop_times; i++) {
          matrix.postRotate(Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE,
            Math.random() * Number.MAX_VALUE);
        }
        console.info(msg + ' postRotate successed');
      } catch (e) {
        console.info(msg + ` postRotate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.name   testMatrixPostScaleNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_1100
     * @tc.desc   testMatrixPostScaleNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixPostScaleNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testMatrixPostScaleNormal';
      try {
        let matrix = new drawing.Matrix();
        matrix.postScale(100, 100, 150, 150);
        let widths : number[] = matrix.getAll();
        expect(widths.length == 9).assertTrue();
        expect(matrix != null).assertTrue();
        console.info(msg + ' postScale successed,width:'+ widths.length + JSON.stringify(matrix));
      } catch (e) {
        console.info(msg + ` postScale errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.postScale(0.2, 0.2, 0.5, 0.5);
        let widths : number[] = matrix.getAll();
        expect(widths.length == 9).assertTrue();
        expect(matrix != null).assertTrue();
        console.info(msg + ' postScale successed,width:'+ widths.length + JSON.stringify(matrix));
      } catch (e) {
        console.info(msg + ` postScale errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.postScale(-100, -100, 150, 150);
        let widths : number[] = matrix.getAll();
        expect(widths.length == 9).assertTrue();
        expect(matrix != null).assertTrue();
        console.info(msg + ' postScale successed,width:'+ widths.length + JSON.stringify(matrix));
      } catch (e) {
        console.info(msg + ` postScale errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.postScale(100, 100, -150, -150);
        let widths : number[] = matrix.getAll();
        expect(widths.length == 9).assertTrue();
        expect(matrix != null).assertTrue();
        console.info(msg + ' postScale successed,width:'+ widths.length + JSON.stringify(matrix));
      } catch (e) {
        console.info(msg + ` postScale errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.postScale(Number.MAX_VALUE, Number.MAX_VALUE, Number.MAX_VALUE, Number.MAX_VALUE);
        let widths : number[] = matrix.getAll();
        expect(widths.length == 9).assertTrue();
        expect(matrix != null).assertTrue();
        console.info(msg + ' postScale successed,width:'+ widths.length + JSON.stringify(matrix));
      } catch (e) {
        console.info(msg + ` postScale errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.name   testMatrixPostScaleNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_1101
     * @tc.desc   testMatrixPostScaleNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixPostScaleNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testMatrixPostScaleNull';
      try {
        let matrix = new drawing.Matrix();
        matrix.postScale(null, 100, 150, 150);
        console.info(msg + ' postScale successed');
      } catch (e) {
        console.info(msg + ` postScale errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.postScale(100, null, 150, 150);
        console.info(msg + ' postScale successed');
      } catch (e) {
        console.info(msg + ` postScale errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.postScale(100, 100, null, 150);
        console.info(msg + ' postScale successed');
      } catch (e) {
        console.info(msg + ` postScale errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.postScale(100, 100, 150, null);
        console.info(msg + ' postScale successed');
      } catch (e) {
        console.info(msg + ` postScale errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.postScale(undefined, 100, 150, 150);
        console.info(msg + ' postScale successed');
      } catch (e) {
        console.info(msg + ` postScale errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.postScale(100, undefined, 150, 150);
        console.info(msg + ' postScale successed');
      } catch (e) {
        console.info(msg + ` postScale errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.postScale(100, 100, undefined, 150);
        console.info(msg + ' postScale successed');
      } catch (e) {
        console.info(msg + ` postScale errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        let matrix = new drawing.Matrix();
        matrix.postScale(100, 100, 150, undefined);
        console.info(msg + ' postScale successed');
      } catch (e) {
        console.info(msg + ` postScale errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testMatrixPostScaleMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MATRIX_1103
     * @tc.desc   testMatrixPostScaleMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixPostScaleMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testMatrixPostScaleMultipleCalls';
      try {
        let matrix = new drawing.Matrix();
        for (let i = 0; i < loop_times; i++) {
          matrix.postScale(Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE);
        }
        console.info(msg + ' postScale successed');
      } catch (e) {
        console.info(msg + ` postScale errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
  })
}