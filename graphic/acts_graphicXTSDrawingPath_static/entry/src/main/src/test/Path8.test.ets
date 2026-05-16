/*
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

export default function drawingTsPath8Test(): void {
  describe('DrawingTsPath8Test', () => {
    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_GETLASTPOINT_STATIC_0100
     * @tc.name      testPathGetLastPointEmptyStatic
     * @tc.desc      testPathGetLastPointEmptyStatic
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testPathGetLastPointEmptyStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testPathGetLastPointEmptyStatic';
      let path = new drawing.Path();
      try {
        let result:common2D.Point | undefined = path.getLastPoint();
        expect(result).assertEqual(undefined);
        console.info(msg + ' getLastPoint successes, result: ' + result);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getLastPoint errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_GETLASTPOINT_STATIC_0200
     * @tc.name      testPathGetLastPointWithMoveToStatic
     * @tc.desc      testPathGetLastPointWithMoveToStatic
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testPathGetLastPointWithMoveToStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testPathGetLastPointWithMoveToStatic';
      let path = new drawing.Path();
      try {
        path.moveTo(10, 10);
        let result:common2D.Point | undefined = path.getLastPoint();
        if (result === undefined) {
          console.info(msg + ' getLastPoint result is undefined, test failed.');
          expect().assertFail();
        } else {
          expect(result.x).assertEqual(10);
          expect(result.y).assertEqual(10);
          console.info(msg + ' getLastPoint successes, result.x: ' + result.x + ', result.y: ' + result.y);
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getLastPoint errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_GETLASTPOINT_STATIC_0300
     * @tc.name      testPathGetLastPointWithLineToStatic
     * @tc.desc      testPathGetLastPointWithLineToStatic
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPathGetLastPointWithLineToStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const msg = 'testPathGetLastPointWithLineToStatic';
      let path = new drawing.Path();
      try {
        path.moveTo(10, 10);
        path.lineTo(100, 100);
        let result:common2D.Point | undefined= path.getLastPoint();
        if (result === undefined) {
          expect().assertFail();
        } else {
          expect(result.x).assertEqual(100);
          expect(result.y).assertEqual(100);
          console.info(msg + ' getLastPoint successes, result.x: ' + result.x + ', result.y: ' + result.y);
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getLastPoint errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_GETLASTPOINT_STATIC_0400
     * @tc.name      testPathGetLastPointWithQuadToStatic
     * @tc.desc      testPathGetLastPointWithQuadToStatic
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPathGetLastPointWithQuadToStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const msg = 'testPathGetLastPointWithQuadToStatic';
      let path = new drawing.Path();
      try {
        path.moveTo(10, 10);
        path.quadTo(50, 50, 100, 100);
        let result:common2D.Point | undefined = path.getLastPoint();
        if (result === undefined) {
          expect().assertFail();
        } else {
          expect(result.x).assertEqual(100);
          expect(result.y).assertEqual(100);
          console.info(msg + ' getLastPoint successes, result.x: ' + result.x + ', result.y: ' + result.y);
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getLastPoint errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_GETLASTPOINT_STATIC_0500
     * @tc.name      testPathGetLastPointWithCubicToStatic
     * @tc.desc      testPathGetLastPointWithCubicToStatic
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPathGetLastPointWithCubicToStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const msg = 'testPathGetLastPointWithCubicToStatic';
      let path = new drawing.Path();
      try {
        path.moveTo(10, 10);
        path.cubicTo(50, 50, 80, 80, 150, 150);
        let result:common2D.Point | undefined = path.getLastPoint();
        if (result === undefined) {
          console.info(msg + ' getLastPoint result is undefined, test failed.');
          expect().assertFail();
        } else {
          expect(result.x).assertEqual(150);
          expect(result.y).assertEqual(150);
          console.info(msg + ' getLastPoint successes, result.x: ' + result.x + ', result.y: ' + result.y);
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getLastPoint errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_GETLASTPOINT_STATIC_0600
     * @tc.name      testPathGetLastPointWithConicToStatic
     * @tc.desc      testPathGetLastPointWithConicToStatic
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPathGetLastPointWithConicToStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const msg = 'testPathGetLastPointWithConicToStatic';
      let path = new drawing.Path();
      try {
        path.moveTo(10, 10);
        path.conicTo(100, 100, 200, 200, 0.5);
        let result:common2D.Point | undefined = path.getLastPoint();
        if (result === undefined) {
          console.info(msg + ' getLastPoint result is undefined, test failed.');
          expect().assertFail();
        } else {
          expect(result.x).assertEqual(200);
          expect(result.y).assertEqual(200);
          console.info(msg + ' getLastPoint successes, result.x: ' + result.x + ', result.y: ' + result.y);
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getLastPoint errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_GETLASTPOINT_STATIC_0700
     * @tc.name      testPathGetLastPointWithCloseStatic
     * @tc.desc      testPathGetLastPointWithCloseStatic
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPathGetLastPointWithCloseStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const msg = 'testPathGetLastPointWithCloseStatic';
      let path = new drawing.Path();
      try {
        path.moveTo(10, 10);
        path.lineTo(100, 100);
        path.close();
        let result:common2D.Point | undefined = path.getLastPoint();
        if (result === undefined) {
          expect().assertFail();
        } else {
          expect(result.x).assertEqual(100);
          expect(result.y).assertEqual(100);
          console.info(msg + ' getLastPoint successes, result.x: ' + result.x + ', result.y: ' + result.y);
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getLastPoint errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_GETLASTPOINT_STATIC_0800
     * @tc.name      testPathGetLastPointMultipleOperationsStatic
     * @tc.desc      testPathGetLastPointMultipleOperationsStatic
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL2
     */
    it('testPathGetLastPointMultipleOperationsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const msg = 'testPathGetLastPointMultipleOperationsStatic';
      let path = new drawing.Path();
      try {
        path.moveTo(10, 10);
        path.lineTo(50, 50);
        path.lineTo(100, 100);
        path.quadTo(150, 150, 200, 200);
        let result:common2D.Point | undefined = path.getLastPoint();
        if (result === undefined) {
          expect().assertFail();
        } else {
          expect(result.x).assertEqual(200);
          expect(result.y).assertEqual(200);
          console.info(msg + ' getLastPoint successes, result.x: ' + result.x + ', result.y: ' + result.y);
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getLastPoint errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_GETLASTPOINT_STATIC_0900
     * @tc.name      testPathGetLastPointWithZeroCoordinatesStatic
     * @tc.desc      testPathGetLastPointWithZeroCoordinatesStatic
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL2
     */
    it('testPathGetLastPointWithZeroCoordinatesStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const msg = 'testPathGetLastPointWithZeroCoordinatesStatic';
      let path = new drawing.Path();
      try {
        path.moveTo(0, 0);
        path.lineTo(0, 100);
        let result:common2D.Point | undefined = path.getLastPoint();
        if (result === undefined) {
          console.info(msg + ' getLastPoint result is undefined, test failed.');
          expect().assertFail();
        } else {
          expect(result.x).assertEqual(0);
          expect(result.y).assertEqual(100);
          console.info(msg + ' getLastPoint successes, result.x: ' + result.x + ', result.y: ' + result.y);
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getLastPoint errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_GETLASTPOINT_STATIC_1000
     * @tc.name      testPathGetLastPointWithNegativeCoordinatesStatic
     * @tc.desc      testPathGetLastPointWithNegativeCoordinatesStatic
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL2
     */
    it('testPathGetLastPointWithNegativeCoordinatesStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const msg = 'testPathGetLastPointWithNegativeCoordinatesStatic';
      let path = new drawing.Path();
      try {
        path.moveTo(10, 10);
        path.lineTo(-100, -200);
        let result:common2D.Point | undefined = path.getLastPoint();
        if (result === undefined) {
          console.info(msg + ' getLastPoint result is undefined, test failed.');
          expect().assertFail();
        } else {
          expect(result.x).assertEqual(-100);
          expect(result.y).assertEqual(-200);
          console.info(msg + ' getLastPoint successes, result.x: ' + result.x + ', result.y: ' + result.y);
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getLastPoint errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_GETLASTPOINT_STATIC_1100
     * @tc.name      testPathGetLastPointWithLargeCoordinatesStatic
     * @tc.desc      testPathGetLastPointWithLargeCoordinatesStatic
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL2
     */
    it('testPathGetLastPointWithLargeCoordinatesStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const msg = 'testPathGetLastPointWithLargeCoordinatesStatic';
      let path = new drawing.Path();
      try {
        let largeValue = 1000000;
        path.moveTo(0, 0);
        path.lineTo(largeValue, largeValue);
        let result:common2D.Point | undefined = path.getLastPoint();
        if (result === undefined) {
          console.info(msg + ' getLastPoint result is undefined, test failed.');
          expect().assertFail();
        } else {
          expect(result.x).assertEqual(largeValue);
          expect(result.y).assertEqual(largeValue);
          console.info(msg + ' getLastPoint successes, result.x: ' + result.x + ', result.y: ' + result.y);
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getLastPoint errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_GETLASTPOINT_STATIC_1200
     * @tc.name      testPathGetLastPointWithFloatCoordinatesStatic
     * @tc.desc      testPathGetLastPointWithFloatCoordinatesStatic
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL2
     */
    it('testPathGetLastPointWithFloatCoordinatesStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const msg = 'testPathGetLastPointWithFloatCoordinatesStatic';
      let path = new drawing.Path();
      try {
        path.moveTo(10.5, 10.5);
        path.lineTo(100.25, 100.75);
        let result:common2D.Point | undefined = path.getLastPoint();
        if (result === undefined) {
          console.info(msg + ' getLastPoint result is undefined, test failed.');
          expect().assertFail();
        } else {
          expect(result.x).assertClose(100.25, 0.01);
          expect(result.y).assertClose(100.75, 0.01);
          console.info(msg + ' getLastPoint successes, result.x: ' + result.x + ', result.y: ' + result.y);
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getLastPoint errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_GETLASTPOINT_STATIC_1300
     * @tc.name      testPathGetLastPointAfterResetStatic
     * @tc.desc      testPathGetLastPointAfterResetStatic
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL2
     */
    it('testPathGetLastPointAfterResetStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const msg = 'testPathGetLastPointAfterResetStatic';
      let path = new drawing.Path();
      path.moveTo(10, 10);
      path.lineTo(100, 100);
      try {
        path.reset();
        let result:common2D.Point | undefined = path.getLastPoint();
        expect(result).assertEqual(undefined);
        console.info(msg + ' getLastPoint successes, result: ' + result);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getLastPoint errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_GETLASTPOINT_STATIC_1400
     * @tc.name      testPathGetLastPointMultipleCallsStatic
     * @tc.desc      testPathGetLastPointMultipleCallsStatic
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL2
     */
    it('testPathGetLastPointMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const msg = 'testPathGetLastPointMultipleCallsStatic';
      let path = new drawing.Path();
      path.moveTo(10, 10);
      path.lineTo(100, 100);
      try {
        let result1:common2D.Point | undefined = path.getLastPoint();
        let result2:common2D.Point | undefined = path.getLastPoint();
        let result3:common2D.Point | undefined = path.getLastPoint();
        if (result1 === undefined || result2 === undefined || result3 === undefined) {
          console.info(msg + ' getLastPoint result is undefined, test failed.');
          expect().assertFail();
        } else {
          expect(result1.x).assertEqual(result2.x);
          expect(result2.x).assertEqual(result3.x);
          expect(result1.y).assertEqual(result2.y);
          expect(result2.y).assertEqual(result3.y);
          console.info(msg + ' getLastPoint 1 successes, result.x: ' + result1.x + ', result.y: ' + result1.y);
          console.info(msg + ' getLastPoint 2 successes, result.x: ' + result2.x + ', result.y: ' + result2.y);
          console.info(msg + ' getLastPoint 3 successes, result.x: ' + result3.x + ', result.y: ' + result3.y);
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getLastPoint errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_GETLASTPOINT_STATIC_1500
     * @tc.name      testPathGetLastPointComplexPathStatic
     * @tc.desc      testPathGetLastPointComplexPathStatic
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL3
     */
    it('testPathGetLastPointComplexPathStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testPathGetLastPointComplexPathStatic';
      let path = new drawing.Path();
      try {
        path.moveTo(10, 10);
        path.lineTo(50, 50);
        path.quadTo(80, 80, 100, 100);
        path.cubicTo(120, 120, 140, 140, 160, 160);
        path.conicTo(180, 180, 200, 200, 1.5);
        let result:common2D.Point | undefined = path.getLastPoint();
        if (result === undefined) {
          console.info(msg + ' getLastPoint result is undefined, test failed.');
          expect().assertFail();
        } else {
          expect(result.x).assertEqual(200);
          expect(result.y).assertEqual(200);
          console.info(msg + ' getLastPoint successes, result.x: ' + result.x + ', result.y: ' + result.y);
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getLastPoint errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_GETLASTPOINT_STATIC_1600
     * @tc.name      testPathGetLastPointAfterTransformStatic
     * @tc.desc      testPathGetLastPointAfterTransformStatic
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL3
     */
    it('testPathGetLastPointAfterTransformStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testPathGetLastPointAfterTransformStatic';
      let path = new drawing.Path();
      let matrix = new drawing.Matrix();
      try {
        path.moveTo(10, 10);
        path.lineTo(100, 100);
        matrix.setScale(2, 2, 0, 0);
        path.transform(matrix);
        let result:common2D.Point | undefined = path.getLastPoint();
        if (result === undefined) {
          console.info(msg + ' getLastPoint result is undefined, test failed.');
          expect().assertFail();
        } else {
          expect(result.x).assertEqual(200);
          expect(result.y).assertEqual(200);
          console.info(msg + ' getLastPoint successes, result.x: ' + result.x + ', result.y: ' + result.y);
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getLastPoint errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_ISEQUAL_STATIC_0100
     * @tc.name      testPathIsEqualTrueStatic
     * @tc.desc      testPathIsEqualTrueStatic
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testPathIsEqualTrueStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testPathIsEqualTrueStatic';
      let path = new drawing.Path();
      let other = new drawing.Path();
      try {
        path.moveTo(0, 0);
        path.lineTo(100, 100);
        other.moveTo(0, 0);
        other.lineTo(100, 100);
        let result = path.isEqual(other);
        expect(result).assertTrue();
        console.info(msg + ' isEqual successes, result: ' + result);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` isEqual errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_ISEQUAL_STATIC_0200
     * @tc.name      testPathIsEqualFalseStatic
     * @tc.desc      testPathIsEqualFalseStatic
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testPathIsEqualFalseStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testPathIsEqualFalseStatic';
      let path = new drawing.Path();
      let other = new drawing.Path();
      try {
        path.moveTo(0, 0);
        path.lineTo(100, 100);
        other.moveTo(0, 0);
        other.lineTo(200, 200);
        let result = path.isEqual(other);
        expect(result).assertFalse();
        console.info(msg + ' isEqual successes, result: ' + result);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` isEqual errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_ISEQUAL_STATIC_0300
     * @tc.name      testPathIsEqualEmptyPathsStatic
     * @tc.desc      testPathIsEqualEmptyPathsStatic
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testPathIsEqualEmptyPathsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testPathIsEqualEmptyPathsStatic';
      let path = new drawing.Path();
      let other = new drawing.Path();
      try {
        let result = path.isEqual(other);
        expect(result).assertTrue();
        console.info(msg + ' isEqual successes, result: ' + result);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` isEqual errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_ISEQUAL_STATIC_0400
     * @tc.name      testPathIsEqualAfterMoveToStatic
     * @tc.desc      testPathIsEqualAfterMoveToStatic
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPathIsEqualAfterMoveToStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const msg = 'testPathIsEqualAfterMoveToStatic';
      let path = new drawing.Path();
      let other = new drawing.Path();
      try {
        path.moveTo(10, 10);
        other.moveTo(10, 10);
        let result = path.isEqual(other);
        expect(result).assertTrue();
        console.info(msg + ' isEqual successes, result: ' + result);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` isEqual errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_ISEQUAL_STATIC_0500
     * @tc.name      testPathIsEqualAfterLineToStatic
     * @tc.desc      testPathIsEqualAfterLineToStatic
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPathIsEqualAfterLineToStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const msg = 'testPathIsEqualAfterLineToStatic';
      let path = new drawing.Path();
      let other = new drawing.Path();
      try {
        path.moveTo(0, 0);
        path.lineTo(100, 100);
        other.moveTo(0, 0);
        other.lineTo(100, 100);
        let result = path.isEqual(other);
        expect(result).assertTrue();
        console.info(msg + ' isEqual successes, result: ' + result);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` isEqual errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_ISEQUAL_STATIC_0600
     * @tc.name      testPathIsEqualAfterCurveStatic
     * @tc.desc      testPathIsEqualAfterCurveStatic
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPathIsEqualAfterCurveStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const msg = 'testPathIsEqualAfterCurveStatic';
      let path = new drawing.Path();
      let other = new drawing.Path();
      try {
        path.moveTo(10, 10);
        path.quadTo(50, 50, 100, 100);
        path.cubicTo(120, 120, 140, 140, 160, 160);
        other.moveTo(10, 10);
        other.quadTo(50, 50, 100, 100);
        other.cubicTo(120, 120, 140, 140, 160, 160);
        let result = path.isEqual(other);
        expect(result).assertTrue();
        console.info(msg + ' isEqual successes, result: ' + result);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` isEqual errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_ISEQUAL_STATIC_0700
     * @tc.name      testPathIsEqualCopyPathStatic
     * @tc.desc      testPathIsEqualCopyPathStatic
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPathIsEqualCopyPathStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const msg = 'testPathIsEqualCopyPathStatic';
      let path = new drawing.Path();
      try {
        path.moveTo(0, 0);
        path.lineTo(0, 700);
        path.lineTo(700, 0);
        path.close();
        let pathCopy = new drawing.Path(path);
        let result = path.isEqual(pathCopy);
        expect(result).assertTrue();
        console.info(msg + ' isEqual successes, result: ' + result);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` isEqual errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_ISEQUAL_STATIC_0800
     * @tc.name      testPathIsEqualDifferentCoordinatesStatic
     * @tc.desc      testPathIsEqualDifferentCoordinatesStatic
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL2
     */
    it('testPathIsEqualDifferentCoordinatesStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const msg = 'testPathIsEqualDifferentCoordinatesStatic';
      let path = new drawing.Path();
      let other = new drawing.Path();
      try {
        path.moveTo(0, 0);
        path.lineTo(100, 100);
        other.moveTo(0, 0);
        other.lineTo(100.01, 100.01);
        let result = path.isEqual(other);
        expect(result).assertFalse();
        console.info(msg + ' isEqual successes, result: ' + result);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` isEqual errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_ISEQUAL_STATIC_0900
     * @tc.name      testPathIsEqualDifferentOperationsStatic
     * @tc.desc      testPathIsEqualDifferentOperationsStatic
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL2
     */
    it('testPathIsEqualDifferentOperationsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const msg = 'testPathIsEqualDifferentOperationsStatic';
      let path = new drawing.Path();
      let other = new drawing.Path();
      try {
        path.moveTo(10, 10);
        path.lineTo(100, 100);
        path.quadTo(150, 150, 200, 200);
        other.moveTo(10, 10);
        other.quadTo(150, 150, 200, 200);
        other.lineTo(100, 100);
        let result = path.isEqual(other);
        expect(result).assertFalse();
        console.info(msg + ' isEqual successes, result: ' + result);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` isEqual errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_ISEQUAL_STATIC_1000
     * @tc.name      testPathIsEqualDifferentFillTypeStatic
     * @tc.desc      testPathIsEqualDifferentFillTypeStatic
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL2
     */
    it('testPathIsEqualDifferentFillTypeStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const msg = 'testPathIsEqualDifferentFillTypeStatic';
      let path = new drawing.Path();
      let other = new drawing.Path();
      try {
        path.moveTo(10, 10);
        path.lineTo(100, 100);
        path.setFillType(drawing.PathFillType.WINDING);
        other.moveTo(10, 10);
        other.lineTo(100, 100);
        other.setFillType(drawing.PathFillType.EVEN_ODD);
        let result = path.isEqual(other);
        expect(result).assertFalse();
        console.info(msg + ' isEqual successes, result: ' + result);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` isEqual errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_ISEQUAL_STATIC_1100
     * @tc.name      testPathIsEqualOneEmptyStatic
     * @tc.desc      testPathIsEqualOneEmptyStatic
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL2
     */
    it('testPathIsEqualOneEmptyStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const msg = 'testPathIsEqualOneEmptyStatic';
      let path = new drawing.Path();
      let other = new drawing.Path();
      try {
        path.moveTo(10, 10);
        path.lineTo(100, 100);
        let result = path.isEqual(other);
        expect(result).assertFalse();
        console.info(msg + ' isEqual successes, result: ' + result);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` isEqual errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_ISEQUAL_STATIC_1200
     * @tc.name      testPathIsEqualMultipleCallsStatic
     * @tc.desc      testPathIsEqualMultipleCallsStatic
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL2
     */
    it('testPathIsEqualMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const msg = 'testPathIsEqualMultipleCallsStatic';
      let path = new drawing.Path();
      let other = new drawing.Path();
      path.moveTo(10, 10);
      path.lineTo(100, 100);
      other.moveTo(10, 10);
      other.lineTo(100, 100);
      try {
        let result1 = path.isEqual(other);
        let result2 = path.isEqual(other);
        let result3 = path.isEqual(other);
        expect(result1).assertTrue();
        expect(result2).assertTrue();
        expect(result3).assertTrue();
        console.info(msg + ' isEqual 1 successes, result: ' + result1);
        console.info(msg + ' isEqual 2 successes, result: ' + result2);
        console.info(msg + ' isEqual 3 successes, result: ' + result3);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` isEqual errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_ISEQUAL_STATIC_1300
     * @tc.name      testPathIsEqualComplexPathsStatic
     * @tc.desc      testPathIsEqualComplexPathsStatic
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL3
     */
    it('testPathIsEqualComplexPathsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testPathIsEqualComplexPathsStatic';
      let path = new drawing.Path();
      let other = new drawing.Path();
      try {
        path.moveTo(10, 10);
        path.lineTo(50, 50);
        path.quadTo(80, 80, 100, 100);
        path.cubicTo(120, 120, 140, 140, 160, 160);
        path.conicTo(180, 180, 200, 200, 1.5);
        path.close();
        other.moveTo(10, 10);
        other.lineTo(50, 50);
        other.quadTo(80, 80, 100, 100);
        other.cubicTo(120, 120, 140, 140, 160, 160);
        other.conicTo(180, 180, 200, 200, 1.5);
        other.close();
        let result = path.isEqual(other);
        expect(result).assertTrue();
        console.info(msg + ' isEqual successes, result: ' + result);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` isEqual errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_ISEQUAL_STATIC_1400
     * @tc.name      testPathIsEqualAfterSetStatic
     * @tc.desc      testPathIsEqualAfterSetStatic
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL3
     */
    it('testPathIsEqualAfterSetStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testPathIsEqualAfterSetStatic';
      let path = new drawing.Path();
      let other = new drawing.Path();
      try {
        path.moveTo(0, 0);
        path.lineTo(0, 700);
        path.lineTo(700, 0);
        path.close();
        other.set(path);
        let result = path.isEqual(other);
        expect(result).assertTrue();
        console.info(msg + ' isEqual successes, result: ' + result);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` isEqual errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_ISEQUAL_STATIC_1500
     * @tc.name      testPathIsEqualWithConicWeightsStatic
     * @tc.desc      testPathIsEqualWithConicWeightsStatic
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL3
     */
    it('testPathIsEqualWithConicWeightsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testPathIsEqualWithConicWeightsStatic';
      let path = new drawing.Path();
      let other = new drawing.Path();
      try {
        path.moveTo(10, 10);
        path.conicTo(100, 100, 200, 200, 0.5);
        other.moveTo(10, 10);
        other.conicTo(100, 100, 200, 200, 0.6);
        let result = path.isEqual(other);
        expect(result).assertFalse();
        console.info(msg + ' isEqual successes, result: ' + result);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` isEqual errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_ISEQUAL_STATIC_1600
     * @tc.name      testPathIsEqualSelfComparisonStatic
     * @tc.desc      testPathIsEqualSelfComparisonStatic
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL2
     */
    it('testPathIsEqualSelfComparisonStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const msg = 'testPathIsEqualSelfComparisonStatic';
      let path = new drawing.Path();
      try {
        path.moveTo(10, 10);
        path.lineTo(100, 100);
        let result = path.isEqual(path);
        expect(result).assertTrue();
        console.info(msg + ' isEqual successes, result: ' + result);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` isEqual errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_GETLASTPOINT_STATIC_1700
     * @tc.name      testPathGetLastPointAfterAddCircleStatic
     * @tc.desc      testPathGetLastPointAfterAddCircleStatic
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL2
     */
    it('testPathGetLastPointAfterAddCircleStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const msg = 'testPathGetLastPointAfterAddCircleStatic';
      let path = new drawing.Path();
      try {
        path.addCircle(100, 100, 50, drawing.PathDirection.CLOCKWISE);
        let result:common2D.Point | undefined = path.getLastPoint();
        if (result === undefined) {
          console.info(msg + ' getLastPoint result is undefined, test failed.');
          expect().assertFail();
        } else {
          expect(result.x).assertEqual(150);
          expect(result.y).assertEqual(100);
          console.info(msg + ' getLastPoint successes, result.x: ' + result.x + ', result.y: ' + result.y);
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getLastPoint errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_GETLASTPOINT_STATIC_1800
     * @tc.name      testPathGetLastPointAfterAddRectStatic
     * @tc.desc      testPathGetLastPointAfterAddRectStatic
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL2
     */
    it('testPathGetLastPointAfterAddRectStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const msg = 'testPathGetLastPointAfterAddRectStatic';
      let path = new drawing.Path();
      let rect: common2D.Rect = {
        left: 100,
        top: 100,
        right: 500,
        bottom: 500
      };
      try {
        path.addRect(rect, drawing.PathDirection.CLOCKWISE);
        let result:common2D.Point | undefined = path.getLastPoint();
        if (result === undefined) {
          console.info(msg + ' getLastPoint result is undefined, test failed.');
          expect().assertFail();
        } else {
          expect(result.x).assertEqual(100);
          expect(result.y).assertEqual(500);
          console.info(msg + ' getLastPoint successes, result.x: ' + result.x + ', result.y: ' + result.y);
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getLastPoint errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_ISEQUAL_STATIC_1700
     * @tc.name      testPathIsEqualAfterAddCircleStatic
     * @tc.desc      testPathIsEqualAfterAddCircleStatic
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL2
     */
    it('testPathIsEqualAfterAddCircleStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const msg = 'testPathIsEqualAfterAddCircleStatic';
      let path = new drawing.Path();
      let other = new drawing.Path();
      try {
        path.addCircle(100, 100, 50, drawing.PathDirection.CLOCKWISE);
        other.addCircle(100, 100, 50, drawing.PathDirection.CLOCKWISE);
        let result = path.isEqual(other);
        expect(result).assertTrue();
        console.info(msg + ' isEqual successes, result: ' + result);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` isEqual errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_ISEQUAL_STATIC_1800
     * @tc.name      testPathIsEqualDifferentDirectionStatic
     * @tc.desc      testPathIsEqualDifferentDirectionStatic
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL2
     */
    it('testPathIsEqualDifferentDirectionStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const msg = 'testPathIsEqualDifferentDirectionStatic';
      let path = new drawing.Path();
      let other = new drawing.Path();
      try {
        path.addCircle(100, 100, 50, drawing.PathDirection.CLOCKWISE);
        other.addCircle(100, 100, 50, drawing.PathDirection.COUNTER_CLOCKWISE);
        let result = path.isEqual(other);
        expect(result).assertFalse();
        console.info(msg + ' isEqual successes, result: ' + result);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` isEqual errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_GETLASTPOINT_STATIC_1900
     * @tc.name      testPathGetLastPointAfterSetLastPointStatic
     * @tc.desc      testPathGetLastPointAfterSetLastPointStatic
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL2
     */
    it('testPathGetLastPointAfterSetLastPointStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const msg = 'testPathGetLastPointAfterSetLastPointStatic';
      let path = new drawing.Path();
      try {
        path.moveTo(10, 10);
        path.lineTo(100, 100);
        path.setLastPoint(50, 50);
        let result:common2D.Point | undefined = path.getLastPoint();
        if (result === undefined) {
          console.info(msg + ' getLastPoint result is undefined, test failed.');
          expect().assertFail();
        } else {
          expect(result.x).assertEqual(50);
          expect(result.y).assertEqual(50);
          console.info(msg + ' getLastPoint successes, result.x: ' + result.x + ', result.y: ' + result.y);
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getLastPoint errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_GETLASTPOINT_STATIC_2000
     * @tc.name      testPathGetLastPointAfterRewindStatic
     * @tc.desc      testPathGetLastPointAfterRewindStatic
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL2
     */
    it('testPathGetLastPointAfterRewindStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const msg = 'testPathGetLastPointAfterRewindStatic';
      let path = new drawing.Path();
      try {
        path.moveTo(10, 10);
        path.lineTo(20, 20);
        path.rewind();
        let result:common2D.Point | undefined = path.getLastPoint();
        expect(result).assertEqual(undefined);
        console.info(msg + ' getLastPoint successes, result: ' + result);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getLastPoint errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
  })
}