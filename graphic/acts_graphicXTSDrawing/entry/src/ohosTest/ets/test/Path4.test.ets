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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_2300
     * @tc.name      : testPathGetMatrixNormal
     * @tc.desc      : testPathGetMatrixNormal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testPathGetMatrixNormal', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_2301
     * @tc.name      : testPathGetMatrixMultipleCalls
     * @tc.desc      : testPathGetMatrixMultipleCalls
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testPathGetMatrixMultipleCalls', 3, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_2302
     * @tc.name      : testPathGetMatrixToNull
     * @tc.desc      : testPathGetMatrixToNull
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testPathGetMatrixToNull', 3, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_2304
     * @tc.name      : testPathGetMatrixAbnormal
     * @tc.desc      : testPathGetMatrixAbnormal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testPathGetMatrixAbnormal', 3, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_2400
     * @tc.name      : testPathConicToNormal
     * @tc.desc      : testPathConicToNormal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testPathConicToNormal', 3, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_2401
     * @tc.name      : testPathConicToMultipleCalls
     * @tc.desc      : testPathConicToMultipleCalls
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testPathConicToMultipleCalls', 3, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_2402
     * @tc.name      : testPathConicToToNull
     * @tc.desc      : testPathConicToToNull
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testPathConicToToNull', 3, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_2404
     * @tc.name      : testPathConicToAbnormal
     * @tc.desc      : testPathConicToAbnormal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testPathConicToAbnormal', 3, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_2500
     * @tc.name      : testPathrConicToNormal
     * @tc.desc      : testPathrConicToNormal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testPathrConicToNormal', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_2501
     * @tc.name      : testPathrConicToMultipleCalls
     * @tc.desc      : testPathrConicToMultipleCalls
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testPathrConicToMultipleCalls', 3, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_2502
     * @tc.name      : testPathrConicToToNull
     * @tc.desc      : testPathrConicToToNull
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testPathrConicToToNull', 3, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_2504
     * @tc.name      : testPathrConicToAbnormal
     * @tc.desc      : testPathrConicToAbnormal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testPathrConicToAbnormal', 3, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_2600
     * @tc.name      : testPathrMoveToNormal
     * @tc.desc      : testPathrMoveToNormal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testPathrMoveToNormal', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_2601
     * @tc.name      : testPathrMoveToNull
     * @tc.desc      : testPathrMoveToNull
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testPathrMoveToNull', 3, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_2603
     * @tc.name      : testPathrMoveToMultipleCalls
     * @tc.desc      : testPathrMoveToMultipleCalls
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testPathrMoveToMultipleCalls', 3, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_2700
     * @tc.name      : testPathrLinetoNormal
     * @tc.desc      : testPathrLinetoNormal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testPathrLinetoNormal', 3, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_2701
     * @tc.name      : testPathrLinetoNull
     * @tc.desc      : testPathrLinetoNull
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testPathrLinetoNull', 3, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_2703
     * @tc.name      : testPathrLinetoMultipleCalls
     * @tc.desc      : testPathrLinetoMultipleCalls
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testPathrLinetoMultipleCalls', 3, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_2800
     * @tc.name      : testPathrQuadToNormal
     * @tc.desc      : testPathrQuadToNormal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testPathrQuadToNormal', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_2801
     * @tc.name      : testPathrQuadToNull
     * @tc.desc      : testPathrQuadToNull
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testPathrQuadToNull', 3, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_2803
     * @tc.name      : testPathrQuadToMultipleCalls
     * @tc.desc      : testPathrQuadToMultipleCalls
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testPathrQuadToMultipleCalls', 3, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_2900
     * @tc.name      : testPathrCubicToNormal
     * @tc.desc      : testPathrCubicToNormal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testPathrCubicToNormal', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_2901
     * @tc.name      : testPathrCubicToNull
     * @tc.desc      : testPathrCubicToNull
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testPathrCubicToNull', 3, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_2903
     * @tc.name      : testPathrCubicToMultipleCalls
     * @tc.desc      : testPathrCubicToMultipleCalls
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testPathrCubicToMultipleCalls', 3, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_3000
     * @tc.name      : testPathOffsetNormal
     * @tc.desc      : testPathOffsetNormal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testPathOffsetNormal', 3, () => {
      const msg = 'testPathOffsetNormal';
      const maxVal = Number.MAX_VALUE;

      try {
        const path = new drawing.Path();
        const dst = new drawing.Path();
        path.offset(dst, 200, 200);

        path.moveTo(200, 200);
        path.lineTo(300, 300);
        path.offset(dst, 200, 200);

        path.offset(dst, 100.1, 100.1);

        path.offset(dst, -200, 200);

        path.offset(dst, 200, -200);

        path.offset(dst, maxVal, maxVal);

        console.info(msg + 'reset successes');
      } catch (e) {
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_3001
     * @tc.name      : testPathOffsetToNull
     * @tc.desc      : testPathOffsetToNull
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testPathOffsetToNull', 3, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_3003
     * @tc.name      : testPathOffsetMultipleCalls
     * @tc.desc      : testPathOffsetMultipleCalls
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testPathOffsetMultipleCalls', 3, () => {
      const msg = 'testPathOffsetMultipleCalls';

      try {
        for (let i = 0; i < 20; i += 1) {
          const path = new drawing.Path();
          path.offset(path, Math.random(), Math.random());
        }
        console.info(msg + 'reset successes');
      } catch (e) {
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_3100
     * @tc.name      : testPathAddPolygonNormal
     * @tc.desc      : testPathAddPolygonNormal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testPathAddPolygonNormal', 3, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_3101
     * @tc.name      : testPathAddPolygonToNull
     * @tc.desc      : testPathAddPolygonToNull
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testPathAddPolygonToNull', 3, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_3103
     * @tc.name      : testPathAddPolygonMultipleCalls
     * @tc.desc      : testPathAddPolygonMultipleCalls
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testPathAddPolygonMultipleCalls', 3, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_3200
     * @tc.name      : testPathOpNormal
     * @tc.desc      : testPathOpNormal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testPathOpNormal', DEFAULT, () => {
      const msg = 'testPathOpNormal';
      const path = new drawing.Path();

      try {
        for (let i = 0; i < getEnumCount(drawing.PathOp); i += 1) {
          path.op(path, i)
        }
        console.info(msg + 'reset successes');
      } catch (e) {
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_3201
     * @tc.name      : testPathOpToNull
     * @tc.desc      : testPathOpToNull
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testPathOpToNull', 3, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_3203
     * @tc.name      : testPathOpMultipleCalls
     * @tc.desc      : testPathOpMultipleCalls
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testPathOpMultipleCalls', 3, () => {
      const msg = 'testPathOpMultipleCalls';
      const path = new drawing.Path();

      try {
        for (let i = 0; i < 20; i += 1) {
          const dst = new drawing.Path();
          const e = Math.floor(Math.random() * getEnumCount(drawing.PathOp))
          path.op(dst, e);
        }
        console.info(msg + 'reset successes');
      } catch (e) {
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_3204
     * @tc.name      : testPathOpAbnormal
     * @tc.desc      : testPathOpAbnormal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testPathOpAbnormal', 3, () => {
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

  })
}