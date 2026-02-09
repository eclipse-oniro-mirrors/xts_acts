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

export default function drawingTsPath4Test() {
  describe('DrawingTsPath4Test', () => {
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
     * @tc.name   testPathGetMatrixNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_2300
     * @tc.desc   testPathGetMatrixNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathGetMatrixNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathGetMatrixNormal';

      try {
        const path = new drawing.Path();
        let matrix: drawing.Matrix;
        let flag: boolean;
        for (let i = 0; i < getEnumCount(drawing.PathMeasureMatrixFlags); i += 1) {
          matrix = new drawing.Matrix();
          let flag = path.getMatrix(false, 10, matrix, i);
          expect(flag).assertFalse();
        }

        for (let i = 0; i < getEnumCount(drawing.PathMeasureMatrixFlags); i += 1) {
          matrix = new drawing.Matrix();
          let flag = path.getMatrix(true, 10.1, matrix, i);
          expect(flag).assertFalse();
        }

        matrix = new drawing.Matrix();
        matrix.setMatrix([5, 0, 0, 0, 1, 2, 0, 0, 1]);
        flag = path.getMatrix(false, 10, matrix, drawing.PathMeasureMatrixFlags.GET_POSITION_MATRIX);
        expect(flag).assertTrue();
        let flag2: boolean;
        flag2 = path.getMatrix(false, 10, matrix, drawing.PathMeasureMatrixFlags.GET_TANGENT_MATRIX);
        expect(flag2).assertTrue();
        let flag3: boolean;
        flag3 = path.getMatrix(false, 10, matrix, drawing.PathMeasureMatrixFlags.GET_POSITION_AND_TANGENT_MATRIX);
        expect(flag3).assertTrue();

        matrix = new drawing.Matrix();
        matrix.setMatrix([5, 0, 0, 0, 1, 2, 0, 0, 1]);
        flag = path.getMatrix(true, 0, matrix, drawing.PathMeasureMatrixFlags.GET_POSITION_MATRIX);
        expect(flag).assertTrue();
        let flag2: boolean;
        flag2 = path.getMatrix(true, 0, matrix, drawing.PathMeasureMatrixFlags.GET_TANGENT_MATRIX);
        expect(flag2).assertTrue();
        let flag3: boolean;
        flag3 = path.getMatrix(true, 0, matrix, drawing.PathMeasureMatrixFlags.GET_POSITION_AND_TANGENT_MATRIX);
        expect(flag3).assertTrue();

        matrix = new drawing.Matrix();
        matrix.setMatrix([5, 0, 0, 0, 1, 2, 0, 0, 1]);
        flag = path.getMatrix(true, -1, matrix, drawing.PathMeasureMatrixFlags.GET_POSITION_MATRIX);
        expect(flag).assertTrue();
        let flag2: boolean;
        flag2 = path.getMatrix(true, -1, matrix, drawing.PathMeasureMatrixFlags.GET_TANGENT_MATRIX);
        expect(flag2).assertTrue();
        let flag3: boolean;
        flag3 = path.getMatrix(true, -1, matrix, drawing.PathMeasureMatrixFlags.GET_POSITION_AND_TANGENT_MATRIX);
        expect(flag3).assertTrue();

        console.info(msg + 'reset successes');
      } catch (e) {
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.name   testPathGetMatrixMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_2301
     * @tc.desc   testPathGetMatrixMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathGetMatrixMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathGetMatrixMultipleCalls';
      const path = new drawing.Path();

      try {
        for (let i = 0; i < 20; i += 1) {
          const e = Math.floor(Math.random() * getEnumCount(drawing.PathMeasureMatrixFlags))
          const matrix = new drawing.Matrix()
          path.getMatrix(false, Math.random(), matrix, e)
        }
        console.info(msg + 'reset successes');
      } catch (e) {
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.name   testPathGetMatrixToNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_2302
     * @tc.desc   testPathGetMatrixToNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathGetMatrixToNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathGetMatrixToNull';
      const path = new drawing.Path();
      const matrix = new drawing.Matrix();

      try {
        path.getMatrix(null, 10, matrix, drawing.PathMeasureMatrixFlags.GET_POSITION_MATRIX);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.getMatrix(false, null, matrix, drawing.PathMeasureMatrixFlags.GET_POSITION_MATRIX);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.getMatrix(false, 10, null, drawing.PathMeasureMatrixFlags.GET_POSITION_MATRIX);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.getMatrix(false, 10, matrix, null);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.getMatrix(undefined, 10, matrix, drawing.PathMeasureMatrixFlags.GET_POSITION_MATRIX);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.getMatrix(false, undefined, matrix, drawing.PathMeasureMatrixFlags.GET_POSITION_MATRIX);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.getMatrix(false, 10, undefined, drawing.PathMeasureMatrixFlags.GET_POSITION_MATRIX);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.getMatrix(false, 10, matrix, undefined);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

    })


    /**
     * @tc.name   testPathGetMatrixAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_2304
     * @tc.desc   testPathGetMatrixAbnormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathGetMatrixAbnormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathGetMatrixAbnormal';
      const path = new drawing.Path();
      const matrix = new drawing.Matrix();

      try {
        path.getMatrix(false, 10, matrix, 10);
        console.info(msg + 'reset successes');
      } catch (e) {
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.name   testPathConicToNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_2400
     * @tc.desc   testPathConicToNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathConicToNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathConicToNormal';
      const path = new drawing.Path();
      const maxVal = Number.MAX_VALUE;

      try {
        path.conicTo(600, 400, 200, 600, 1);
        path.conicTo(200, 400, 100, 200, 0);
        path.conicTo(300.4, 400.1, 200.1, 200.1, 0.5);
        path.conicTo(-600, -400, 200, 600, 1);
        path.conicTo(600, 400, -200, -600, 0);
        path.conicTo(maxVal, maxVal, maxVal, maxVal, 1);
        console.info(msg + 'reset successes');
      } catch (e) {
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.name   testPathConicToMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_2401
     * @tc.desc   testPathConicToMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathConicToMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathConicToMultipleCalls';
      const path = new drawing.Path();

      try {
        for (let i = 0; i < 20; i += 1) {
          path.conicTo(Math.random(), Math.random(), Math.random(), Math.random(), Math.random())
        }
        console.info(msg + 'reset successes');
      } catch (e) {
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.name   testPathConicToToNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_2402
     * @tc.desc   testPathConicToToNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathConicToToNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathConicToToNull';
      const path = new drawing.Path();

      try {
        path.conicTo(null, 400, 200, 600, 1);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.conicTo(600, null, 200, 600, 1);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.conicTo(600, 400, null, 600, 1);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.conicTo(600, 400, 200, null, 1);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.conicTo(600, 400, 200, 600, null);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.conicTo(undefined, 400, 200, 600, 1);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.conicTo(600, undefined, 200, 600, 1);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.conicTo(600, 400, undefined, 600, 1);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.conicTo(600, 400, 200, undefined, 1);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.conicTo(600, 400, 200, 600, undefined);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

    })


    /**
     * @tc.name   testPathConicToAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_2404
     * @tc.desc   testPathConicToAbnormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathConicToAbnormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathConicToAbnormal';
      const path = new drawing.Path();

      try {
        path.conicTo(600, 400, 200, 600, -1);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.conicTo(600, 400, 200, 600, 2);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

    })


    /**
     * @tc.name   testPathrConicToNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_2500
     * @tc.desc   testPathrConicToNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathrConicToNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathrConicToNormal';
      const path = new drawing.Path();
      const maxVal = Number.MAX_VALUE;

      try {
        path.rConicTo(600, 400, 200, 600, 1);
        path.rConicTo(200, 400, 100, 200, 0);
        path.rConicTo(300.4, 400.1, 200.1, 200.1, 0.5);
        path.rConicTo(-600, -400, 200, 600, 1);
        path.rConicTo(600, 400, -200, -600, 0);
        path.rConicTo(maxVal, maxVal, maxVal, maxVal, 1);
        console.info(msg + 'reset successes');
      } catch (e) {
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.name   testPathrConicToMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_2501
     * @tc.desc   testPathrConicToMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathrConicToMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathrConicToMultipleCalls';
      const path = new drawing.Path();

      try {
        for (let i = 0; i < 20; i += 1) {
          path.rConicTo(Math.random(), Math.random(), Math.random(), Math.random(), Math.random());
        }
        console.info(msg + 'reset successes');
      } catch (e) {
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.name   testPathrConicToToNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_2502
     * @tc.desc   testPathrConicToToNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathrConicToToNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathrConicToToNull';
      const path = new drawing.Path();


      try {
        path.rConicTo(null, 400, 200, 600, 1);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.rConicTo(600, null, 200, 600, 1);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.rConicTo(600, 400, null, 600, 1);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.rConicTo(600, 400, 200, null, 1);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.rConicTo(600, 400, 200, 600, null);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.rConicTo(undefined, 400, 200, 600, 1);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.rConicTo(600, undefined, 200, 600, 1);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.rConicTo(600, 400, undefined, 600, 1);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.rConicTo(600, 400, 200, undefined, 1);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.rConicTo(600, 400, 200, 600, undefined);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

    })


    /**
     * @tc.name   testPathrConicToAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_2504
     * @tc.desc   testPathrConicToAbnormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathrConicToAbnormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathrConicToAbnormal';
      const path = new drawing.Path();

      try {
        path.rConicTo(600, 400, 200, 600, -1);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.rConicTo(600, 400, 200, 600, 2);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }
    })


    /**
     * @tc.name   testPathrMoveToNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_2600
     * @tc.desc   testPathrMoveToNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathrMoveToNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathrMoveToNormal';
      const path = new drawing.Path();

      try {
        path.rMoveTo(10, 10);
        path.rMoveTo(10.1, 10.1);
        path.rMoveTo(-1, -1);
        console.info(msg + 'reset successes');
      } catch (e) {
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.name   testPathrMoveToNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_2601
     * @tc.desc   testPathrMoveToNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathrMoveToNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathrMoveToNull';
      const path = new drawing.Path();


      try {
        path.rMoveTo(undefined, 10);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.rMoveTo(10, undefined);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.rMoveTo(null, 10);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.rMoveTo(10, null);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

    })


    /**
     * @tc.name   testPathrMoveToMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_2603
     * @tc.desc   testPathrMoveToMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathrMoveToMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathrMoveToMultipleCalls';
      const path = new drawing.Path();

      try {
        for (let i = 0; i < 20; i += 1) {
          path.rMoveTo(Math.random(), Math.random());
        }
        console.info(msg + 'reset successes');
      } catch (e) {
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.name   testPathrLinetoNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_2700
     * @tc.desc   testPathrLinetoNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathrLinetoNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathrLinetoNormal';
      const path = new drawing.Path();

      try {
        path.rLineTo(10, 10);
        path.rLineTo(10.1, 10.1);
        path.rLineTo(-1, -1);
        console.info(msg + 'reset successes');
      } catch (e) {
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.name   testPathrLinetoNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_2701
     * @tc.desc   testPathrLinetoNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathrLinetoNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathrLinetoNull';
      const path = new drawing.Path();

      try {
        path.rLineTo(undefined, 10);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.rLineTo(10, undefined);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.rLineTo(null, 10);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.rLineTo(10, null);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }
    })


    /**
     * @tc.name   testPathrLinetoMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_2703
     * @tc.desc   testPathrLinetoMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathrLinetoMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathrLinetoMultipleCalls';
      const path = new drawing.Path();

      try {
        for (let i = 0; i < 20; i += 1) {
          path.rLineTo(Math.random(), Math.random());
        }
        console.info(msg + 'reset successes');
      } catch (e) {
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.name   testPathrQuadToNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_2800
     * @tc.desc   testPathrQuadToNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathrQuadToNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathrQuadToNormal';
      const path = new drawing.Path();

      try {
        path.rQuadTo(10, 15, 10, 10);
        path.rQuadTo(10.2, 15.3, 10.4, 10.5);
        path.rQuadTo(-10, -15, 10, 10);
        path.rQuadTo(10, 15, -10, -10)
        console.info(msg + 'reset successes');
      } catch (e) {
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.name   testPathrQuadToNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_2801
     * @tc.desc   testPathrQuadToNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathrQuadToNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathrQuadToNull';
      const path = new drawing.Path();

      try {
        path.rQuadTo(undefined, 15, 10, 10);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.rQuadTo(10, undefined, 10, 10);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.rQuadTo(10, 15, undefined, 10);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.rQuadTo(10, 15, 10, undefined);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.rQuadTo(null, 15, 10, 10);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.rQuadTo(10, null, 10, 10);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.rQuadTo(10, 15, null, 10);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.rQuadTo(10, 15, 10, null);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

    })


    /**
     * @tc.name   testPathrQuadToMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_2803
     * @tc.desc   testPathrQuadToMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathrQuadToMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathrQuadToMultipleCalls';
      const path = new drawing.Path();

      try {
        for (let i = 0; i < 20; i += 1) {
          path.rQuadTo(Math.random(), Math.random(), Math.random(), Math.random());
        }
        console.info(msg + 'reset successes');
      } catch (e) {
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.name   testPathrCubicToNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_2900
     * @tc.desc   testPathrCubicToNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathrCubicToNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathrCubicToNormal';
      const path = new drawing.Path();

      try {
        path.rCubicTo(10, 15, 10, 10, 10, 10);
        path.rCubicTo(10.2, 15.3, 10.4, 10.5, 10.3, 60.3);
        path.rCubicTo(-10, -15, 10, 10, 90, 180);
        path.rCubicTo(10, 15, -10, -10, 90, 180);
        path.rCubicTo(10, 15, 10, 10, -10, -10);
        console.info(msg + 'reset successes');
      } catch (e) {
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.name   testPathrCubicToNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_2901
     * @tc.desc   testPathrCubicToNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathrCubicToNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathrCubicToNull';
      const path = new drawing.Path();

      try {
        path.rCubicTo(undefined, 15, 10, 10, 10, 60);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.rCubicTo(10, undefined, 10, 10, 10, 60);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.rCubicTo(10, 15, undefined, 10, 10, 60);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.rCubicTo(10, 15, 10, undefined, 10, 60);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.rCubicTo(10, 15, 10, 10, undefined, 60);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.rCubicTo(10, 15, 10, 10, 10, undefined);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.rCubicTo(null, 15, 10, 10, 10, 60);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.rCubicTo(10, null, 10, 10, 10, 60);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.rCubicTo(10, 15, null, 10, 10, 60);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.rCubicTo(10, 15, 10, null, 10, 60);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.rCubicTo(10, 15, 10, 10, null, 60);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.rCubicTo(10, 15, 10, 10, 10, null);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

    })


    /**
     * @tc.name   testPathrCubicToMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_2903
     * @tc.desc   testPathrCubicToMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathrCubicToMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathrCubicToMultipleCalls';
      const path = new drawing.Path();

      try {
        for (let i = 0; i < 20; i += 1) {
          path.rCubicTo(Math.random(), Math.random(), Math.random(), Math.random(), Math.random(), Math.random(), Math.random());
        }
        console.info(msg + 'reset successes');
      } catch (e) {
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.name   testPathOffsetNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_3000
     * @tc.desc   testPathOffsetNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathOffsetNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathOffsetNormal';
      const maxVal = Number.MAX_VALUE;

      try {
        const path = new drawing.Path();
        const dst = new drawing.Path();
        let dst1 = path.offset(dst, 200, 200);
        expect(dst1 !== null  || dst1 !== undefined).assertTrue();

        path.moveTo(200, 200);
        path.lineTo(300, 300);
        let dst2 = path.offset(dst, 200, 200);
        expect(dst2 !== null  || dst2 !== undefined).assertTrue();

        let dst3 = path.offset(dst, 100.1, 100.1);
        expect(dst3 !== null  || dst3 !== undefined).assertTrue();

        let dst4 = path.offset(dst, -200, 200);
        expect(dst4 !== null  || dst4 !== undefined).assertTrue();

        let dst5 = path.offset(dst, 200, -200);
        expect(dst5 !== null  || dst5 !== undefined).assertTrue();

        let dst6 = path.offset(dst, maxVal, maxVal);
        expect(dst6 !== null  || dst6 !== undefined).assertTrue();
        console.info(msg + 'reset successes');
      } catch (e) {
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.name   testPathOffsetToNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_3001
     * @tc.desc   testPathOffsetToNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathOffsetToNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathOffsetToNull';
      const path = new drawing.Path();
      const dst = new drawing.Path();

      try {
        path.offset(null, 200, 200);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.offset(dst, null, 200);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.offset(dst, 200, null);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.offset(undefined, 200, 200);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.offset(dst, undefined, 200);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.offset(dst, 200, undefined);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

    })


    /**
     * @tc.name   testPathOffsetMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_3003
     * @tc.desc   testPathOffsetMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathOffsetMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathOffsetMultipleCalls';

      try {
        for (let i = 0; i < 20; i += 1) {
          const path = new drawing.Path();
          let dst = path.offset(path, Math.random(), Math.random());
          expect(dst !== null  || dst !== undefined).assertTrue();
        }
        console.info(msg + 'reset successes');
      } catch (e) {
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.name   testPathAddPolygonNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_3100
     * @tc.desc   testPathAddPolygonNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathAddPolygonNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathAddPolygonNormal';
      const path1 = new drawing.Path();

      try {
        path1.addPolygon([{
          x: 200, y: 200
        }, {
          x: 400, y: 200
        }, {
          x: 100, y: 400
        }], false);
        path1.addPolygon([{
          x: 200.1, y: 200.1
        }, {
          x: 400, y: 200
        }, {
          x: 100, y: 400
        }], true);
        path1.addPolygon([{
          x: 200, y: 200
        }, {
          x: 400, y: 200
        }, {
          x: 100, y: 400
        }], false);
        path1.addPolygon([{
          x: 200, y: 200
        }, {
          x: 400, y: 200
        }, {
          x: 100, y: 400
        }], false);
        path1.addPolygon([], 0, false);
        path1.addPolygon([], -1, false);
        path1.addPolygon([{
          x: -200, y: 200
        }, {
          x: -400, y: -200
        }, {
          x: 100, y: -400
        }], false);
        console.info(msg + 'reset successes');
      } catch (e) {
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.name   testPathAddPolygonToNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_3101
     * @tc.desc   testPathAddPolygonToNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathAddPolygonToNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathAddPolygonToNull';
      const path1 = new drawing.Path();


      try {
        path1.addPolygon(null, false);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path1.addPolygon([{
          x: 200, y: 200
        }, {
          x: 400, y: 200
        }, {
          x: 100, y: 400
        }], null);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path1.addPolygon([{
          x: 200, y: 200
        }, {
          x: 400, y: 200
        }, {
          x: 100, y: 400
        }], null);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path1.addPolygon(undefined, false);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path1.addPolygon([{
          x: 200, y: 200
        }, {
          x: 400, y: 200
        }, {
          x: 100, y: 400
        }], undefined);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path1.addPolygon([{
          x: 200, y: 200
        }, {
          x: 400, y: 200
        }, {
          x: 100, y: 400
        }], undefined);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

    })


    /**
     * @tc.name   testPathAddPolygonMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_3103
     * @tc.desc   testPathAddPolygonMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathAddPolygonMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathAddPolygonMultipleCalls';
      const path1 = new drawing.Path();

      try {
        for (let i = 0; i < 20; i += 1) {
          const len = Math.floor(10 * Math.random())
          const points: common2D.Point[] = []
          for (let j = 0; j < len; j += 1) {
            points.push({
              x: Math.random(),
              y: Math.random(),
            })
          }
          path1.addPolygon(points, false)
        }
        console.info(msg + 'reset successes');
      } catch (e) {
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.name   testPathOpNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_3200
     * @tc.desc   testPathOpNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathOpNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathOpNormal';
      const path = new drawing.Path();

      try {
        for (let i = 0; i < getEnumCount(drawing.PathOp); i += 1) {
          let result = path.op(path, i);
          console.info(msg + " path.op-----result:  " + result + " step is: " + i);
          expect(result).assertEqual(true);
        }
        console.info(msg + 'reset successes');
      } catch (e) {
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.name   testPathOpToNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_3201
     * @tc.desc   testPathOpToNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathOpToNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathOpToNull';
      const path = new drawing.Path();
      try {
        path.op(null, drawing.PathOp.DIFFERENCE);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }
      try {
        path.op(null, drawing.PathOp.INTERSECT);
        console.info(msg + `test INTERSECT error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test INTERSECT successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }
      try {
        path.op(null, drawing.PathOp.UNION);
        console.info(msg + `test UNION error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test UNION successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }
      try {
        path.op(null, drawing.PathOp.XOR);
        console.info(msg + `test XOR error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test XOR successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }
      try {
        path.op(null, drawing.PathOp.REVERSE_DIFFERENCE);
        console.info(msg + `test REVERSE_DIFFERENCE error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test REVERSE_DIFFERENCE successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.op(path, null);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.op(undefined, drawing.PathOp.DIFFERENCE);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }
      try {
        path.op(undefined, drawing.PathOp.INTERSECT);
        console.info(msg + `test INTERSECT error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test INTERSECT successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }
      try {
        path.op(undefined, drawing.PathOp.UNION);
        console.info(msg + `test UNION	error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test UNION successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }
      try {
        path.op(undefined, drawing.PathOp.XOR);
        console.info(msg + `test XOR	error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test XOR successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }
      try {
        path.op(undefined, drawing.PathOp.REVERSE_DIFFERENCE);
        console.info(msg + `test REVERSE_DIFFERENCE	error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test REVERSE_DIFFERENCE successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.op(path, undefined);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

    })


    /**
     * @tc.name   testPathOpMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_3203
     * @tc.desc   testPathOpMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathOpMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathOpMultipleCalls';
      const path = new drawing.Path();

      try {
        for (let i = 0; i < 20; i += 1) {
          const dst = new drawing.Path();
          const e = Math.floor(Math.random() * getEnumCount(drawing.PathOp))
          let result =  path.op(dst, e);
          console.info(msg + " path.op-----result:  " + result + " step is: " + i);
          expect(result).assertEqual(true);
        }
        console.info(msg + 'reset successes');
      } catch (e) {
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.name   testPathOpAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_3204
     * @tc.desc   testPathOpAbnormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathOpAbnormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathOpAbnormal';
      const path = new drawing.Path();

      try {
        path.op(path, 10);
        console.info(msg + `test error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }
    })
    /**
     * @tc.name   testPathSetNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_3300
     * @tc.desc   testPathSetNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathSetNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathSetNormal';
      let path = new drawing.Path();
      let path1 = new drawing.Path();
      try {
        path1.set(path);
        console.info(msg + `path1 1 set success`);
        expect(path).assertEqual(path1);
      } catch (e) {
        console.info(msg + `path1 1 set error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      path.moveTo(100, 100)
      path.lineTo(100, 300);
      path.lineTo(300, 300);
      try {
        path1.set(path);
        console.info(msg + `path1 2 set success`);
        expect(path).assertEqual(path1);
      } catch (e) {
        console.info(msg + `path1 2 set error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      path.rQuadTo(10.5, 0.5, 100.5, 100.5);
      path.rMoveTo(10, 10);
      path.rQuadTo(100, 100, 200, 100);
      path.rMoveTo(10, 10);
      path.rQuadTo(-60, -60, -100, -60);
      path.rMoveTo(10, 10);
      path.rQuadTo(5000, 5000, 10000, 5000);
      try {
        path1.set(path);
        console.info(msg + `path1 3 set success`);
        expect(path).assertEqual(path1);
      } catch (e) {
        console.info(msg + `path1 3 set error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.name   testPathSetMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_3301
     * @tc.desc   testPathSetMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathSetMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathSetMultipleCalls';
      let path = new drawing.Path();
      let path1 = new drawing.Path();
      path.moveTo(100, 100)
      path.lineTo(100, 300);
      path.lineTo(300, 300);
      for (let i = 0; i < 20; i += 1) {
        try {
          path1.set(path);
          console.info(msg + `path1 set success step: ` + i);
          expect(path).assertEqual(path1);
        } catch (e) {
          console.info(msg + `path1 set error. errorCode is: ${e.code} + errormsg is: ${e.message}} step: ${i}`);
          expect().assertFail()
        }
      }
    })
    /**
     * @tc.name   testPathSetToNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_3302
     * @tc.desc   testPathSetToNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathSetToNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathSetToNull';
      let path = new drawing.Path();
      try {
        path.set(null);
        console.info(msg + `path set null success `);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `path set null error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }
      try {
        path.set(undefined);
        console.info(msg + `path set undefined success `);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `path set undefined error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }
    })
    /**
     * @tc.name   testPathSetLastPointNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_3400
     * @tc.desc   testPathSetLastPointNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathSetLastPointNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathSetLastPointNormal';
      let path = new drawing.Path();
      path.moveTo(100, 100)
      path.lineTo(100, 300);
      path.lineTo(300, 300);
      path.rQuadTo(5000, 5000, 10000, 5000);
      try {
        path.setLastPoint(50, 50);
        console.info(msg + `path 1 setLastPoint  success`);
      } catch (e) {
        console.info(msg + `path 1 setLastPoint error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      path.arcTo(300, 850, 400, 900, 0, 90);
      try {
        path.setLastPoint(600.25, 450.258);
        console.info(msg + `path 2 setLastPoint success`);
      } catch (e) {
        console.info(msg + `path 2 setLastPoint error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      try {
        path.setLastPoint(0, 0);
        console.info(msg + `path 3 setLastPoint success`);
      } catch (e) {
        console.info(msg + `path 3 setLastPoint error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      try {
        path.setLastPoint(-100, -50.23522);
        console.info(msg + `path 4 setLastPoint success`);
      } catch (e) {
        console.info(msg + `path 4 setLastPoint error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      try {
        path.setLastPoint(700, 500);
        console.info(msg + `path 5 setLastPoint success`);
      } catch (e) {
        console.info(msg + `path 5 setLastPoint error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      try {
        path.setLastPoint(Number.MAX_VALUE, Number.MAX_VALUE);
        console.info(msg + `path 6 setLastPoint success`);
      } catch (e) {
        console.info(msg + `path 6 setLastPoint error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.name   testPathSetLastPointMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_3401
     * @tc.desc   testPathSetLastPointMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathSetLastPointMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathSetLastPointMultipleCalls';
      let path = new drawing.Path();
      path.moveTo(100, 100)
      path.lineTo(100, 300);
      path.lineTo(300, 300);
      for (let i = 0; i < 20; i += 1) {
        try {
          path.setLastPoint(Math.random() *100, Math.random() *300)
          console.info(msg + `path setLastPoint success step: ` + i);
        } catch (e) {
          console.info(msg + `path setLastPoint error. errorCode is: ${e.code} + errormsg is: ${e.message}} step: ${i}`);
          expect().assertFail()
        }
      }
    })
    /**
     * @tc.name   testPathSetLastPointToNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_3402
     * @tc.desc   testPathSetLastPointToNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathSetLastPointToNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathSetLastPointToNull';
      let path = new drawing.Path();
      try {
        path.setLastPoint(null,100);
        console.info(msg + `path setLastPoint null success `);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `path setLastPoint null error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }
      try {
        path.setLastPoint(undefined,100);
        console.info(msg + `path setLastPoint undefined success `);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `path setLastPoint undefined error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }
      try {
        path.setLastPoint(300, null)
        console.info(msg + `path setLastPoint null 2 success `);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `path setLastPoint null 2 error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }
      try {
        path.setLastPoint(300, undefined);
        console.info(msg + `path setLastPoint undefined 2 success `);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `path setLastPoint undefined 2 error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }
    })
    /**
     * @tc.name   testPathGetFillTypeNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_3500
     * @tc.desc   testPathGetFillTypeNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathGetFillTypeNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathGetFillTypeNormal';
      let path = new drawing.Path();
      try {
        let getFillType = path.getFillType();
        console.info(msg + `path 1 getFillType  success`);
        expect(getFillType).assertEqual(drawing.PathFillType.WINDING);
      } catch (e) {
        console.info(msg + `path 1 getFillType error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      try {
        path.setFillType(drawing.PathFillType.EVEN_ODD);
        console.info(msg + `path setFillType  EVEN_ODD success`);
      } catch (e) {
        console.info(msg + `path setFillType EVEN_ODD error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      try {
        let getFillType2 = path.getFillType();
        console.info(msg + `path 1 getFillType2  success`);
        expect(getFillType2).assertEqual(drawing.PathFillType.EVEN_ODD);
      } catch (e) {
        console.info(msg + `path 1 getFillType2 error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      try {
        path.setFillType(drawing.PathFillType.WINDING);
        console.info(msg + `path setFillType  WINDING success`);
      } catch (e) {
        console.info(msg + `path setFillType WINDING error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      try {
        let getFillType3 = path.getFillType();
        console.info(msg + `path 1 getFillType3  success`);
        expect(getFillType3).assertEqual(drawing.PathFillType.WINDING);
      } catch (e) {
        console.info(msg + `path 1 getFillType3 error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      try {
        path.setFillType(drawing.PathFillType.INVERSE_WINDING);
        console.info(msg + `path setFillType  INVERSE_WINDING success`);
      } catch (e) {
        console.info(msg + `path setFillType INVERSE_WINDING error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      try {
        let getFillType4 = path.getFillType();
        console.info(msg + `path 1 getFillType4  success`);
        expect(getFillType4).assertEqual(drawing.PathFillType.INVERSE_WINDING);
      } catch (e) {
        console.info(msg + `path 1 getFillType4 error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      try {
        path.setFillType(drawing.PathFillType.INVERSE_EVEN_ODD);
        console.info(msg + `path setFillType  INVERSE_EVEN_ODD success`);
      } catch (e) {
        console.info(msg + `path setFillType INVERSE_EVEN_ODD error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      try {
        let getFillType5 = path.getFillType();
        console.info(msg + `path 1 getFillType5  success`);
        expect(getFillType5).assertEqual(drawing.PathFillType.INVERSE_EVEN_ODD);
      } catch (e) {
        console.info(msg + `path 1 getFillType5 error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.name   testPathGetFillTypeMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_3501
     * @tc.desc   testPathGetFillTypeMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathGetFillTypeMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathGetFillTypeMultipleCalls';
      let path = new drawing.Path();
      for (let i = 0; i < 20; i += 1) {
        try {
          path.setFillType(drawing.PathFillType.INVERSE_EVEN_ODD);
          console.info(msg + `path setFillType  INVERSE_EVEN_ODD success step: ` + i);
        } catch (e) {
          console.info(msg + `path setFillType INVERSE_EVEN_ODD error. errorCode is: ${e.code} + errormsg is: ${e.message}} step: ${i}`);
          expect().assertFail()
        }
        try {
          let getFillType5 = path.getFillType();
          console.info(msg + `path 1 getFillType5  success step: ` + i);
          expect(getFillType5).assertEqual(drawing.PathFillType.INVERSE_EVEN_ODD);
        } catch (e) {
          console.info(msg + `path 1 getFillType5 error. errorCode is: ${e.code} + errormsg is: ${e.message}} step: ${i}`);
          expect().assertFail()
        }
      }
    })
    /**
     * @tc.name   testPathRewindNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_3600
     * @tc.desc   testPathRewindNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathRewindNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathRewindNormal';
      let path = new drawing.Path();
      try {
        path.rewind();
        console.info(msg + `path rewind  success`);
        let empty = path.isEmpty();
        console.info(msg + 'empty : ', empty);
        expect(empty).assertEqual(true);
      } catch (e) {
        console.info(msg + `path rewind 1 error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      path.moveTo(100, 100)
      path.lineTo(100, 300);
      path.lineTo(300, 300);
      try {
        path.rewind();
        console.info(msg + `path 2 rewind  success`);
        let empty2 = path.isEmpty();
        console.info(msg + 'empty2 : ', empty2);
        expect(empty2).assertEqual(true);
      } catch (e) {
        console.info(msg + `path rewind 2 error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.name   testPathRewindMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_3601
     * @tc.desc   testPathRewindMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathRewindMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathRewindMultipleCalls';
      let path = new drawing.Path();
      for (let i = 0; i < 20; i += 1) {
        try {
          path.rewind()
          console.info(msg + `path rewind success step: ` + i);
          let empty = path.isEmpty();
          console.info(msg + 'empty : ', empty + 'step: ' + i);
          expect(empty).assertEqual(true);
        } catch (e) {
          console.info(msg + `path rewind error. errorCode is: ${e.code} + errormsg is: ${e.message}} step: ${i}`);
          expect().assertFail()
        }
      }
    })
    /**
     * @tc.name   testPathIsEmptyNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_3700
     * @tc.desc   testPathIsEmptyNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathIsEmptyNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathIsEmptyNormal';
      let path = new drawing.Path();
      try {
        let empty = path.isEmpty();
        console.info(msg + `path isEmpty success`);
        console.info(msg + 'empty : ', empty);
        expect(empty).assertEqual(true);
      } catch (e) {
        console.info(msg + `path isEmpty error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      path.moveTo(100, 100)
      path.lineTo(100, 300);
      path.lineTo(300, 300);
      try {
        let empty2 = path.isEmpty();
        console.info(msg + `path empty2 success`);
        console.info(msg + 'empty2 : ', empty2);
        expect(empty2).assertEqual(false);
      } catch (e) {
        console.info(msg + `path empty2 error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      try {
        path.rewind()
        let empty3 = path.isEmpty();
        console.info(msg + `path empty3 success`);
        console.info(msg + 'empty3 : ', empty3);
        expect(empty3).assertEqual(true);
      } catch (e) {
        console.info(msg + `path empty3 error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      path.moveTo(100, 100)
      path.lineTo(100, 300);
      path.lineTo(300, 300);
      path.close()
      try {
        let empty4 = path.isEmpty();
        console.info(msg + `path empty4 success`);
        console.info(msg + 'empty4 : ', empty4);
        expect(empty4).assertEqual(false);
      } catch (e) {
        console.info(msg + `path empty4 error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.name   testPathIsEmptyMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_3701
     * @tc.desc   testPathIsEmptyMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathIsEmptyMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathIsEmptyMultipleCalls';
      let path = new drawing.Path();
      for (let i = 0; i < 20; i += 1) {
        try {
          let empty = path.isEmpty();
          console.info(msg + `path isEmpty success step: ` + i);
          console.info(msg + 'empty : ', empty + 'step: ' + i);
          expect(empty).assertEqual(true);
        } catch (e) {
          console.info(msg + `path isEmpty error. errorCode is: ${e.code} + errormsg is: ${e.message}} step: ${i}`);
          expect().assertFail()
        }
      }
    })
    /**
     * @tc.name   testPathIsRectNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_3800
     * @tc.desc   testPathIsRectNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathIsRectNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathIsRectNormal';
      let path = new drawing.Path();
      try {
        let isRect = path.isRect(null);
        console.info(msg + `path isRect success`);
        expect(isRect).assertEqual(false);
      } catch (e) {
        console.info(msg + `path isRect error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      let rect: common2D.Rect = { left : 0, top : 0, right : 100, bottom : 100 };
      canvas.save()
      path.moveTo(100, 100)
      path.lineTo(100, 300);
      path.lineTo(300, 300);
      try {
        let isRect2 = path.isRect(rect);
        console.info(msg + `path isRect2 success`);
        expect(isRect2).assertEqual(false);
      } catch (e) {
        console.info(msg + `path isRect2 error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      path.lineTo(300, 100);
      path.close();
      try {
        let isRect3 = path.isRect(rect);
        console.info(msg + `path isRect3 success`);
        expect(isRect3).assertEqual(true);
      } catch (e) {
        console.info(msg + `path isRect3 error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      rect = { left : 0, top : 125, right : 100, bottom : 225 };
      path.reset()
      let rect11: common2D.Rect = {
        left: 200,
        top: 500,
        right: 400,
        bottom: 700
      };
      let roundRec11: drawing.RoundRect = new drawing.RoundRect(rect11, 20, 20);
      path.addRoundRect(roundRec11);
      try {
        let isRect4 = path.isRect(rect);
        console.info(msg + `path isRect4 success`);
        expect(isRect4).assertEqual(false);
      } catch (e) {
        console.info(msg + `path isRect4 error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      rect = { left : 200, top : 125, right : 500, bottom : 425 };
      path.reset()
      roundRec11 = new drawing.RoundRect(rect11, 0, 0);
      path.addRoundRect(roundRec11);
      try {
        let isRect5 = path.isRect(rect);
        console.info(msg + `path isRect5 success`);
        expect(isRect5).assertEqual(true);
      } catch (e) {
        console.info(msg + `path isRect5 error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.name   testPathIsRectMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_3801
     * @tc.desc   testPathIsRectMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathIsRectMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathIsRectMultipleCalls';
      let path = new drawing.Path();
      let rect: common2D.Rect = { left : 0, top : 125, right : 100, bottom : 225 };
      path.addRect(rect);
      for (let i = 0; i < 20; i += 1) {
        try {
          let isRect = path.isRect(rect);
          console.info(msg + `path isRect success step: ` + i);
          console.info(msg + 'isRect : ', isRect + 'step: ' + i);
          expect(isRect).assertEqual(true);
        } catch (e) {
          console.info(msg + `path isRect error. errorCode is: ${e.code} + errormsg is: ${e.message}} step: ${i}`);
          expect().assertFail()
        }
      }
    })
    /**
     * @tc.name   testPathIsRectToNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_3802
     * @tc.desc   testPathIsRectToNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathIsRectToNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathIsRectToNull';
      let path = new drawing.Path();
      try {
        path.isRect(undefined);
        console.info(msg + `path isRect success `);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `path isRect error. errorCode is: ${e.code} + errormsg is: ${e.message}} step: ${i}`);
        expect(e.code).assertEqual(401);
      }
    })
  })
}