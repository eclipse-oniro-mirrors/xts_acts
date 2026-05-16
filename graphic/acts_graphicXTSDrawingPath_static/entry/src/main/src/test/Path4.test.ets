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
import image from '@ohos.multimedia.image';
import common2D from '@ohos.graphics.common2D';
import { BusinessError } from '@ohos.base';

export default function drawingTsPath4Test() {
  describe('DrawingTsPath4Test', () => {
    let pixel: image.PixelMap;
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async () => {
      const color: ArrayBuffer = new ArrayBuffer(40000); // 96为需要创建的像素buffer大小，取值为：height * width *4
      let opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: {
          height: 100,
          width: 100
        }
      }
      pixel = await image.createPixelMap(color, opts);
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
     * @tc.name   testPathGetMatrixNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_2300
     * @tc.desc   testPathGetMatrixNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathGetMatrixNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathGetMatrixNormalStatic';
      let itemList: drawing.PathMeasureMatrixFlags[] = [
        drawing.PathMeasureMatrixFlags.GET_POSITION_MATRIX,
        drawing.PathMeasureMatrixFlags.GET_POSITION_AND_TANGENT_MATRIX,
        drawing.PathMeasureMatrixFlags.GET_TANGENT_MATRIX
      ];
      try {
        const path = new drawing.Path();
        let matrix: drawing.Matrix;
        let flag: boolean;
        for (let i = 0; i < itemList.length; i += 1) {
          matrix = new drawing.Matrix();
          let flag = path.getMatrix(false, 10, matrix, itemList[i]);
          console.info(msg + 'getMatrix 1 successes flag is: ' + flag + ' step is: ' + i);
          expect(flag).assertFalse();
        }

        for (let i = 0; i < itemList.length; i += 1) {
          matrix = new drawing.Matrix();
          let flag = path.getMatrix(true, 10.1, matrix, itemList[i]);
          console.info(msg + 'getMatrix 2 successes flag is: ' + flag + ' step is: ' + i);
          expect(flag).assertFalse();
        }

        matrix = new drawing.Matrix();
        matrix.setMatrix([5, 0, 0, 0, 1, 2, 0, 0, 1]);
        flag = path.getMatrix(false, 10, matrix, drawing.PathMeasureMatrixFlags.GET_POSITION_MATRIX);
        console.info(msg + 'getMatrix 3 successes flag is: ' + flag );
        expect(flag).assertFalse();
        let flag2: boolean;
        flag2 = path.getMatrix(false, 10, matrix, drawing.PathMeasureMatrixFlags.GET_TANGENT_MATRIX);
        console.info(msg + 'getMatrix 4 successes flag2 is: ' + flag2 );
        expect(flag2).assertFalse();
        let flag3: boolean;
        flag3 = path.getMatrix(false, 10, matrix, drawing.PathMeasureMatrixFlags.GET_POSITION_AND_TANGENT_MATRIX);
        console.info(msg + 'getMatrix 5 successes flag3 is: ' + flag3 );
        expect(flag3).assertFalse();

        matrix = new drawing.Matrix();
        matrix.setMatrix([5, 0, 0, 0, 1, 2, 0, 0, 1]);
        flag = path.getMatrix(true, 0, matrix, drawing.PathMeasureMatrixFlags.GET_POSITION_MATRIX);
        console.info(msg + 'getMatrix 6 successes flag is: ' + flag );
        expect(flag).assertFalse();
        let flag4: boolean;
        flag4 = path.getMatrix(true, 0, matrix, drawing.PathMeasureMatrixFlags.GET_TANGENT_MATRIX);
        console.info(msg + 'getMatrix 7 successes flag4 is: ' + flag4 );
        expect(flag4).assertFalse();
        let flag5: boolean;
        flag5 = path.getMatrix(true, 0, matrix, drawing.PathMeasureMatrixFlags.GET_POSITION_AND_TANGENT_MATRIX);
        console.info(msg + 'getMatrix 8 successes flag5 is: ' + flag5 );
        expect(flag5).assertFalse();

        matrix = new drawing.Matrix();
        matrix.setMatrix([5, 0, 0, 0, 1, 2, 0, 0, 1]);
        flag = path.getMatrix(true, -1, matrix, drawing.PathMeasureMatrixFlags.GET_POSITION_MATRIX);
        console.info(msg + 'getMatrix 9 successes flag is: ' + flag );
        expect(flag).assertFalse();
        let flag6: boolean;
        flag6 = path.getMatrix(true, -1, matrix, drawing.PathMeasureMatrixFlags.GET_TANGENT_MATRIX);
        console.info(msg + 'getMatrix 10 successes flag6 is: ' + flag6 );
        expect(flag6).assertFalse();
        let flag7: boolean;
        flag7 = path.getMatrix(true, -1, matrix, drawing.PathMeasureMatrixFlags.GET_POSITION_AND_TANGENT_MATRIX);
        console.info(msg + 'getMatrix 11 successes flag7 is: ' + flag7 );
        expect(flag7).assertFalse();
        console.info(msg + 'reset successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.name   testPathGetMatrixMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_2301
     * @tc.desc   testPathGetMatrixMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathGetMatrixMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathGetMatrixMultipleCallsStatic';
      const path = new drawing.Path();
      let itemList: drawing.PathMeasureMatrixFlags[] = [
        drawing.PathMeasureMatrixFlags.GET_POSITION_MATRIX,
        drawing.PathMeasureMatrixFlags.GET_POSITION_AND_TANGENT_MATRIX,
        drawing.PathMeasureMatrixFlags.GET_TANGENT_MATRIX
      ];
      try {
        for (let i = 0; i < 20; i += 1) {
          const randomEnum = Math.floor(3 * Math.random()).toInt();
          const matrix = new drawing.Matrix()
          path.getMatrix(false, Math.random(), matrix, itemList[randomEnum])
        }
        console.info(msg + 'reset successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.name   testPathConicToNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_2400
     * @tc.desc   testPathConicToNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathConicToNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathConicToNormalStatic';
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
        e = e as BusinessError;
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.name   testPathConicToMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_2401
     * @tc.desc   testPathConicToMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathConicToMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathConicToMultipleCallsStatic';
      const path = new drawing.Path();

      try {
        for (let i = 0; i < 20; i += 1) {
          path.conicTo(Math.random(), Math.random(), Math.random(), Math.random(), Math.random())
        }
        console.info(msg + 'reset successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.name   testPathConicToAbNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_2404
     * @tc.desc   testPathConicToAbNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathConicToAbNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathConicToAbNormalStatic';
      const path = new drawing.Path();

      try {
        path.conicTo(600, 400, 200, 600, -1);
        console.info(msg + `test error`);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail();
      }

      try {
        path.conicTo(600, 400, 200, 600, 2);
        console.info(msg + `test error`);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail();
      }

    })
    /**
     * @tc.name   testPathrConicToNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_2500
     * @tc.desc   testPathrConicToNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathrConicToNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathrConicToNormalStatic';
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
        e = e as BusinessError;
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.name   testPathrConicToMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_2501
     * @tc.desc   testPathrConicToMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathrConicToMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathrConicToMultipleCallsStatic';
      const path = new drawing.Path();

      try {
        for (let i = 0; i < 20; i += 1) {
          path.rConicTo(Math.random(), Math.random(), Math.random(), Math.random(), Math.random());
        }
        console.info(msg + 'reset successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.name   testPathrConicToAbNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_2504
     * @tc.desc   testPathrConicToAbNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathrConicToAbNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathrConicToAbNormalStatic';
      const path = new drawing.Path();

      try {
        path.rConicTo(600, 400, 200, 600, -1);
        console.info(msg + `test error`);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail();
      }

      try {
        path.rConicTo(600, 400, 200, 600, 2);
        console.info(msg + `test error`);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `test successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPathrMoveToNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_2600
     * @tc.desc   testPathrMoveToNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathrMoveToNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathrMoveToNormalStatic';
      const path = new drawing.Path();
      try {
        path.rMoveTo(10, 10);
        path.rMoveTo(10.1, 10.1);
        path.rMoveTo(-1, -1);
        console.info(msg + 'reset successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.name   testPathrMoveToMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_2603
     * @tc.desc   testPathrMoveToMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathrMoveToMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathrMoveToMultipleCallsStatic';
      const path = new drawing.Path();

      try {
        for (let i = 0; i < 20; i += 1) {
          path.rMoveTo(Math.random(), Math.random());
        }
        console.info(msg + 'reset successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.name   testPathrLinetoNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_2700
     * @tc.desc   testPathrLinetoNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathrLinetoNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathrLinetoNormalStatic';
      const path = new drawing.Path();

      try {
        path.rLineTo(10, 10);
        path.rLineTo(10.1, 10.1);
        path.rLineTo(-1, -1);
        console.info(msg + 'reset successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.name   testPathrLinetoMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_2703
     * @tc.desc   testPathrLinetoMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathrLinetoMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathrLinetoMultipleCallsStatic';
      const path = new drawing.Path();

      try {
        for (let i = 0; i < 20; i += 1) {
          path.rLineTo(Math.random(), Math.random());
        }
        console.info(msg + 'reset successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.name   testPathrQuadToNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_2800
     * @tc.desc   testPathrQuadToNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathrQuadToNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathrQuadToNormalStatic';
      const path = new drawing.Path();

      try {
        path.rQuadTo(10, 15, 10, 10);
        path.rQuadTo(10.2, 15.3, 10.4, 10.5);
        path.rQuadTo(-10, -15, 10, 10);
        path.rQuadTo(10, 15, -10, -10)
        console.info(msg + 'reset successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.name   testPathrQuadToMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_2803
     * @tc.desc   testPathrQuadToMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathrQuadToMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathrQuadToMultipleCallsStatic';
      const path = new drawing.Path();

      try {
        for (let i = 0; i < 20; i += 1) {
          path.rQuadTo(Math.random(), Math.random(), Math.random(), Math.random());
        }
        console.info(msg + 'reset successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.name   testPathrCubicToNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_2900
     * @tc.desc   testPathrCubicToNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathrCubicToNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathrCubicToNormalStatic';
      const path = new drawing.Path();

      try {
        path.rCubicTo(10, 15, 10, 10, 10, 10);
        path.rCubicTo(10.2, 15.3, 10.4, 10.5, 10.3, 60.3);
        path.rCubicTo(-10, -15, 10, 10, 90, 180);
        path.rCubicTo(10, 15, -10, -10, 90, 180);
        path.rCubicTo(10, 15, 10, 10, -10, -10);
        console.info(msg + 'reset successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.name   testPathrCubicToMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_2903
     * @tc.desc   testPathrCubicToMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathrCubicToMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathrCubicToMultipleCallsStatic';
      const path = new drawing.Path();

      try {
        for (let i = 0; i < 20; i += 1) {
          path.rCubicTo(Math.random(), Math.random(), Math.random(), Math.random(), Math.random(), Math.random());
        }
        console.info(msg + 'reset successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.name   testPathOffsetNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_3000
     * @tc.desc   testPathOffsetNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathOffsetNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathOffsetNormalStatic';
      const maxVal = Number.MAX_VALUE;
      try {
        const path = new drawing.Path();
        const dst = new drawing.Path();
        let dst0 = path.offset(200, 200);
        if(dst0 == undefined){
          console.info(msg + ' dst0 offset failed');
          expect().assertFail();
        }
        path.moveTo(200, 200);
        path.lineTo(300, 300);
        let dst1 = path.offset(200, 200);
        if(dst1 == undefined){
          console.info(msg + ' dst1 offset failed');
          expect().assertFail();
        }
        let dst2 = path.offset(100.1, 100.1);
        if(dst2 == undefined){
          console.info(msg + ' dst2 offset failed');
          expect().assertFail();
        }
        let dst3 = path.offset(-200, 200);
        if(dst3 == undefined){
          console.info(msg + ' dst3 offset failed');
          expect().assertFail();
        }
        let dst4 = path.offset(200, -200);
        if(dst4 == undefined){
          console.info(msg + ' dst4 offset failed');
          expect().assertFail();
        }
        let dst5 = path.offset(maxVal, maxVal);
        if(dst5 == undefined){
          console.info(msg + ' dst5 offset failed');
          expect().assertFail();
        }
        console.info(msg + 'offset successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.name   testPathOffsetMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_3003
     * @tc.desc   testPathOffsetMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathOffsetMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathOffsetMultipleCallsStatic';

      try {
        for (let i = 0; i < 20; i += 1) {
          const path = new drawing.Path();
          path.moveTo(200, 200);
          path.lineTo(300, 300);
          path.offset(Math.random(), Math.random());
        }
        console.info(msg + 'reset successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.name   testPathAddPolygonNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_3100
     * @tc.desc   testPathAddPolygonNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathAddPolygonNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathAddPolygonNormalStatic';
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
        path1.addPolygon([{
          x: -200, y: 200
        }, {
          x: -400, y: -200
        }, {
          x: 100, y: -400
        }], false);
        console.info(msg + 'reset successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.name   testPathAddPolygonMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_3103
     * @tc.desc   testPathAddPolygonMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathAddPolygonMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathAddPolygonMultipleCallsStatic';
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
        e = e as BusinessError;
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.name   testPathOpNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_3200
     * @tc.desc   testPathOpNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathOpNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, (): void => {
      const msg = 'testPathOpNormalStatic';
      try {
        expect(drawing.PathOp.DIFFERENCE + '').assertEqual('0');
        expect(drawing.PathOp.INTERSECT + '').assertEqual('1');
        expect(drawing.PathOp.UNION + '').assertEqual('2');
        expect(drawing.PathOp.XOR + '').assertEqual('3');
        expect(drawing.PathOp.REVERSE_DIFFERENCE + '').assertEqual('4');
        console.info(msg + 'PathOp successes');
      } catch (e: BusinessError) {
        console.info(msg + `PathOp errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.name   testPathOpMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_3203
     * @tc.desc   testPathOpMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathOpMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathOpMultipleCallsStatic';
      const path = new drawing.Path();
      let itemList: drawing.PathOp[] = [
        drawing.PathOp.DIFFERENCE,
        drawing.PathOp.UNION,
        drawing.PathOp.XOR,
        drawing.PathOp.REVERSE_DIFFERENCE,
        drawing.PathOp.INTERSECT
      ];
      try {
        for (let i = 0; i < 20; i += 1) {
          const dst = new drawing.Path();
          const randomEnum = Math.floor(5 * Math.random()).toInt();
          let result =  path.op(dst, itemList[randomEnum]);
          console.info(msg + " path.op-----result:  " + result + " step is: " + i);
          expect(result).assertEqual(true);
        }
        console.info(msg + 'reset successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.name   testPathIsRectNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_3800
     * @tc.desc   testPathIsRectNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathIsRectNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathIsRectNormalStatic';
      let path = new drawing.Path();
      let canvas = new drawing.Canvas(pixel);
      try {
        let isRect = path.isRect(null);
        console.info(msg + `path isRect success`);
        expect(isRect).assertEqual(false);
      } catch (e: BusinessError) {
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
        console.info(msg + `path isRect2 success  isRect2: ${isRect2}`);
        expect(isRect2).assertEqual(false);
      } catch (e: BusinessError) {
        console.info(msg + `path isRect2 error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
      path.lineTo(300, 100);
      path.close();
      try {
        let isRect3 = path.isRect(rect);
        console.info(msg + `path isRect3 success`);
        expect(isRect3).assertEqual(true);
      } catch (e: BusinessError) {
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
      } catch (e: BusinessError) {
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
      } catch (e: BusinessError) {
        console.info(msg + `path isRect5 error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.name   testPenSetAndGetColor4fNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_STATIC_2500
     * @tc.desc   Test for testPenSetAndGetColor4fNormalStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPenSetAndGetColor4fNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPenSetAndGetColor4fNormalStatic';
      try {
        let color4f: common2D.Color4f = {
          alpha: 0.8,
          red: 0.5,
          green: 0.4,
          blue: 0.7
        };
      } catch (e: BusinessError) {
        console.info(msg + `color4f error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
    })
  })
}