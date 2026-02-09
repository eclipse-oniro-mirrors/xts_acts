/*
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

export default function drawingTsPath5Test() {
  describe('DrawingTsPath5Test', () => {
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
     * @tc.name   testPathApproximateNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_3900
     * @tc.desc   testPathApproximateNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathApproximateNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathApproximateNormal';
      let path: drawing.Path = new drawing.Path();
      try {
        path.moveTo(100, 100);
        path.lineTo(500, 500);
        let points: number[] = path.approximate(0.5);
        console.info(msg + 'approximate successes');
        expect(points != null || points != undefined).assertTrue()
        expect(points.length > 0).assertEqual(true);
      } catch (e) {
        console.info(msg + `approximate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      try {
        let points2: number[] = path.approximate(0);
        console.info(msg + 'approximate points2 successes');
        expect(points2 != null || points2 != undefined).assertTrue();
        expect(points2.length > 0).assertEqual(true);
      } catch (e) {
        console.info(msg + `approximate points2 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      try {
        let points3: number[] = path.approximate(1);
        console.info(msg + 'approximate points3 successes');
        expect(points3 != null || points3 != undefined).assertTrue()
        expect(points3.length > 0).assertEqual(true);
      } catch (e) {
        console.info(msg + `approximate points3 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      path.reset();
      path.addCircle(100, 200, 50, drawing.PathDirection.CLOCKWISE);
      try {
        let points4: number[] = path.approximate(0.5);
        console.info(msg + 'approximate points4 successes');
        expect(points4 != null || points4 != undefined).assertTrue()
        expect(points4.length > 0).assertEqual(true);
      } catch (e) {
        console.info(msg + `approximate points4 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      path.lineTo(500, 500);
      path.cubicTo(100, 100, 80, 150, 300, 150);
      path.conicTo(200, 400, 100, 200, 0);
      try {
        let points5: number[] = path.approximate(0.88);
        console.info(msg + 'approximate points5 successes');
        expect(points5 != null || points5 != undefined).assertTrue()
        expect(points5.length > 0).assertEqual(true);
      } catch (e) {
        console.info(msg + `approximate points5 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.name   testPathApproximateToNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_3901
     * @tc.desc   testPathApproximateToNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathApproximateToNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathApproximateToNull';
      let path: drawing.Path = new drawing.Path();
      path.moveTo(100, 100);
      path.lineTo(500, 500);
      try {
        path.approximate(null);
        console.info(msg + `approximate null successes`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `approximate null errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }
      try {
        path.approximate(undefined);
        console.info(msg + `approximate undefined successes`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `approximate undefined  errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }
    })
    /**
     * @tc.name   testPathApproximateMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_3902
     * @tc.desc   testPathApproximateMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPathApproximateMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testPathApproximateMultipleCalls';
      let path: drawing.Path = new drawing.Path();
      path.moveTo(100, 100);
      path.lineTo(500, 500);
      try {
        for (let i = 0; i < 20; i += 1) {
          path.approximate(Math.random() * 1);
          console.info(msg + 'reset successes step is ' + i);
        }
      } catch (e) {
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message} `);
        expect().assertFail()
      }

    })
    /**
     * @tc.name   testPathApproximateAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_3903
     * @tc.desc   testPathApproximateAbnormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathApproximateAbnormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathApproximateAbnormal';
      let path: drawing.Path = new drawing.Path();
      try {
        path.approximate(-0.99999);
        console.info(msg + `approximate -0.99999 successes`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `approximate -0.99999 errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(25900001);
      }
      try {
        path.approximate(-1.1);
        console.info(msg + `approximate -1.1 successes`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `approximate -1.1 errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(25900001);
      }
    })
    /**
     * @tc.name   testPathInterpolateNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_4000
     * @tc.desc   testPathInterpolateNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathInterpolateNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathInterpolateNormal';
      let path: drawing.Path = new drawing.Path();
      path.moveTo(50, 50);
      path.lineTo(100, 100);
      path.lineTo(200, 200);
      let other: drawing.Path = new drawing.Path();
      other.moveTo(80, 80);
      other.lineTo(300, 300);
      let interpolatedPath: drawing.Path = new drawing.Path();
      console.info(msg + 'interpolatedPath successes');
      expect(interpolatedPath != null || interpolatedPath != undefined).assertTrue()
      try {
        interpolatedPath.moveTo(80, 80);
        interpolatedPath.lineTo(300, 300);
        let result = path.interpolate(other, 0.0, interpolatedPath);
        console.info(msg + 'interpolate successes');
        expect(result).assertEqual(false)
        // expect(interpolatedPath != null || interpolatedPath != undefined).assertTrue()
      } catch (e) {
        console.info(msg + `interpolate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      try {
        other.lineTo(400, 400);
        let result2 = path.interpolate(other, 0.0, interpolatedPath);
        console.info(msg + 'interpolate 2 successes');
        expect(result2).assertEqual(true)
        // expect(interpolatedPath != null || interpolatedPath != undefined).assertTrue()
      } catch (e) {
        console.info(msg + `interpolate 2 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      try {
        let result3 = path.interpolate(other,1, interpolatedPath);
        console.info(msg + 'interpolate 3 successes');
        expect(result3).assertEqual(true)
        // expect(interpolatedPath != null || interpolatedPath != undefined).assertTrue()
      } catch (e) {
        console.info(msg + `interpolate 3 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      try {
        let result4 = path.interpolate(other, 0.8, interpolatedPath);
        console.info(msg + 'interpolate 4 successes');
        expect(result4).assertEqual(true)
        // expect(interpolatedPath != null || interpolatedPath != undefined).assertTrue()
      } catch (e) {
        console.info(msg + `interpolate 4 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      try {
        let result5 = path.interpolate(path, 0.8, interpolatedPath);
        console.info(msg + 'interpolate 5 successes');
        expect(result5).assertEqual(true)
        // expect(interpolatedPath != null || interpolatedPath != undefined).assertTrue()
      } catch (e) {
        console.info(msg + `interpolate 5 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.name   testPathInterpolateToNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_4001
     * @tc.desc   testPathInterpolateToNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathInterpolateToNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathInterpolateToNull';
      let path: drawing.Path = new drawing.Path();
      let other: drawing.Path = new drawing.Path();
      let interpolatedPath: drawing.Path = new drawing.Path();
      path.moveTo(100, 100);
      path.lineTo(500, 500);
      try {
        path.interpolate(null, 0.0, interpolatedPath);
        console.info(msg + `interpolate 1 successes`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `interpolate 1 errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }
      try {
        path.interpolate(undefined, 0.0, interpolatedPath);
        console.info(msg + `interpolate 2 successes`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `interpolate 2 errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }
      try {
        path.interpolate(other, null, interpolatedPath);
        console.info(msg + `interpolate 3 successes`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `interpolate 3 errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }
      try {
        path.interpolate(other, undefined, interpolatedPath);
        console.info(msg + `interpolate 4 successes`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `interpolate 4 errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }
      try {
        path.interpolate(other, 0.0, null);
        console.info(msg + `interpolate 5 successes`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `interpolate 5 errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }
      try {
        path.interpolate(other, 0.0, undefined);
        console.info(msg + `interpolate 6 successes`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `interpolate 6 errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }
    })
    /**
     * @tc.name   testPathInterpolateMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_4002
     * @tc.desc   testPathInterpolateMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathInterpolateMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathInterpolateMultipleCalls';
      try {
        for (let i = 0; i < 20; i += 1) {
          let path: drawing.Path = new drawing.Path();
          path.moveTo(Math.random() *60, Math.random() *60);
          path.lineTo(Math.random() *50, Math.random() *50);
          let other: drawing.Path = new drawing.Path();
          other.moveTo(Math.random() *100, Math.random() *50);
          other.lineTo(Math.random() *50, Math.random() *20);
          let interpolatedPath: drawing.Path = new drawing.Path();
          let result = path.interpolate(other,Math.random() *1, interpolatedPath);
          console.info(msg + 'interpolate success step is ' + i);
          console.info(msg + 'interpolate success result is ' + result);
          expect(result).assertEqual(true);
        }
      } catch (e) {
        console.info(msg + `interpolate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.name   testPathInterpolateAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_4003
     * @tc.desc   testPathInterpolateAbnormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathInterpolateAbnormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathInterpolateAbnormal';
      let path: drawing.Path = new drawing.Path();
      let other: drawing.Path = new drawing.Path();
      let interpolatedPath: drawing.Path = new drawing.Path();
      try {
        path.interpolate(other,-0.99999, interpolatedPath);
        console.info(msg + `interpolate -0.99999 successes`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `interpolate -0.99999 errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(25900001);
      }
      try {
        path.interpolate(other,1.1, interpolatedPath);
        console.info(msg + `interpolate 1.1 successes`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `interpolate 1.1 errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(25900001);
      }
    })
    /**
     * @tc.name   testPathIsInterpolateNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_4100
     * @tc.desc   testPathIsInterpolateNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathIsInterpolateNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathIsInterpolateNormal';
      let path: drawing.Path = new drawing.Path();
      path.moveTo(0, 0);
      path.lineTo(100, 100);
      let other: drawing.Path = new drawing.Path();
      other.moveTo(0, 1);
      other.lineTo(200, 200);
      try {
        let result =path.isInterpolate(other);
        console.info(msg + 'isInterpolate successes');
        expect(result).assertEqual(true)
      } catch (e) {
        console.info(msg + `isInterpolate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      try {
        other.lineTo(400, 400);
        let result2 =path.isInterpolate(other);
        console.info(msg + 'isInterpolate 2 successes');
        expect(result2).assertEqual(false)
      } catch (e) {
        console.info(msg + `isInterpolate 2 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      try {
        path.lineTo(100, 100);
        let result3 =path.isInterpolate(other);
        console.info(msg + 'isInterpolate 3 successes');
        expect(result3).assertEqual(true)
      } catch (e) {
        console.info(msg + `isInterpolate 3 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      try {
        other.lineTo(600, 600);
        other.quadTo(10, 15, 10, 10);
        path.cubicTo(100, 100, 80, 150, 300, 150);
        let result4 =path.isInterpolate(other);
        console.info(msg + 'isInterpolate 4 successes');
        expect(result4).assertEqual(false)
      } catch (e) {
        console.info(msg + `isInterpolate 4 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.name   testPathIsInterpolateToNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_4101
     * @tc.desc   testPathIsInterpolateToNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathIsInterpolateToNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathIsInterpolateToNull';
      let path: drawing.Path = new drawing.Path();
      try {
        path.isInterpolate(null)
        console.info(msg + `isInterpolate 1 successes`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `isInterpolate 1 errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }
      try {
        path.isInterpolate(undefined);
        console.info(msg + `isInterpolate 2 successes`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `isInterpolate 2 errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }
    })
    /**
     * @tc.name   testPathIsInterpolateMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_4102
     * @tc.desc   testPathIsInterpolateMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathIsInterpolateMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathIsInterpolateMultipleCalls';
      try {
        for (let i = 0; i < 20; i += 1) {
          let path: drawing.Path = new drawing.Path();
          path.moveTo(Math.random() *60, Math.random() *60);
          path.lineTo(Math.random() *50, Math.random() *50);
          let other: drawing.Path = new drawing.Path();
          other.moveTo(Math.random() *100, Math.random() *50);
          other.lineTo(Math.random() *50, Math.random() *20);
          let result = path.isInterpolate(other);
          console.info(msg + 'isInterpolate success step is ' + i);
          console.info(msg + 'isInterpolate success result is ' + result);
          expect(result).assertEqual(true);
        }
      } catch (e) {
        console.info(msg + `isInterpolate errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
  })
}