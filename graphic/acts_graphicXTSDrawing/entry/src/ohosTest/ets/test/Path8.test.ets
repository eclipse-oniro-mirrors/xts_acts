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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, TestType, Size, Level } from '@ohos/hypium';
import drawing from '@ohos.graphics.drawing';
import common2D from '@ohos.graphics.common2D';
import { BusinessError } from '@ohos.base';

export default function drawingTsPath8Test(): void {
  describe('DrawingTsPath8Test', () => {
    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_GETLASTPOINT_0100
     * @tc.name      testPathGetLastPointEmpty
     * @tc.desc      testPathGetLastPointEmpty
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testPathGetLastPointEmpty', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathGetLastPointEmpty';
      let path = new drawing.Path();
      try {
        let result: common2D.Point = path.getLastPoint();
        expect(result).assertEqual(undefined);
        console.info(msg + ' getLastPoint successes, result: ' + result);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getLastPoint errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    
    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_GETLASTPOINT_0200
     * @tc.name      testPathGetLastPointWithMoveTo
     * @tc.desc      testPathGetLastPointWithMoveTo
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testPathGetLastPointWithMoveTo', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathGetLastPointWithMoveTo';
      let path = new drawing.Path();
      try {
        path.moveTo(10, 10);
        let result: common2D.Point = path.getLastPoint();
        expect(result.x).assertEqual(10);
        expect(result.y).assertEqual(10);
        console.info(msg + ' getLastPoint successes, result.x: ' + result.x + ', result.y: ' + result.y);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getLastPoint errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    
    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_GETLASTPOINT_0300
     * @tc.name      testPathGetLastPointWithLineTo
     * @tc.desc      testPathGetLastPointWithLineTo
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPathGetLastPointWithLineTo', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testPathGetLastPointWithLineTo';
      let path = new drawing.Path();
      try {
        path.moveTo(10, 10);
        path.lineTo(100, 100);
        let result: common2D.Point = path.getLastPoint();
        expect(result.x).assertEqual(100);
        expect(result.y).assertEqual(100);
        console.info(msg + ' getLastPoint successes, result.x: ' + result.x + ', result.y: ' + result.y);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getLastPoint errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    
    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_GETLASTPOINT_0400
     * @tc.name      testPathGetLastPointWithQuadTo
     * @tc.desc      testPathGetLastPointWithQuadTo
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPathGetLastPointWithQuadTo', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testPathGetLastPointWithQuadTo';
      let path = new drawing.Path();
      try {
        path.moveTo(10, 10);
        path.quadTo(50, 50, 100, 100);
        let result: common2D.Point = path.getLastPoint();
        expect(result.x).assertEqual(100);
        expect(result.y).assertEqual(100);
        console.info(msg + ' getLastPoint successes, result.x: ' + result.x + ', result.y: ' + result.y);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getLastPoint errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    
    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_GETLASTPOINT_0500
     * @tc.name      testPathGetLastPointWithCubicTo
     * @tc.desc      testPathGetLastPointWithCubicTo
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPathGetLastPointWithCubicTo', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testPathGetLastPointWithCubicTo';
      let path = new drawing.Path();
      try {
        path.moveTo(10, 10);
        path.cubicTo(50, 50, 80, 80, 150, 150);
        let result: common2D.Point = path.getLastPoint();
        expect(result.x).assertEqual(150);
        expect(result.y).assertEqual(150);
        console.info(msg + ' getLastPoint successes, result.x: ' + result.x + ', result.y: ' + result.y);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getLastPoint errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    
    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_GETLASTPOINT_0600
     * @tc.name      testPathGetLastPointWithConicTo
     * @tc.desc      testPathGetLastPointWithConicTo
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPathGetLastPointWithConicTo', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testPathGetLastPointWithConicTo';
      let path = new drawing.Path();
      try {
        path.moveTo(10, 10);
        path.conicTo(100, 100, 200, 200, 0.5);
        let result: common2D.Point = path.getLastPoint();
        expect(result.x).assertEqual(200);
        expect(result.y).assertEqual(200);
        console.info(msg + ' getLastPoint successes, result.x: ' + result.x + ', result.y: ' + result.y);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getLastPoint errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    
    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_GETLASTPOINT_0700
     * @tc.name      testPathGetLastPointWithClose
     * @tc.desc      testPathGetLastPointWithClose
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPathGetLastPointWithClose', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testPathGetLastPointWithClose';
      let path = new drawing.Path();
      try {
        path.moveTo(10, 10);
        path.lineTo(100, 100);
        path.close();
        let result: common2D.Point = path.getLastPoint();
        expect(result.x).assertEqual(100);
        expect(result.y).assertEqual(100);
        console.info(msg + ' getLastPoint successes, result.x: ' + result.x + ', result.y: ' + result.y);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getLastPoint errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    
    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_GETLASTPOINT_0800
     * @tc.name      testPathGetLastPointMultipleOperations
     * @tc.desc      testPathGetLastPointMultipleOperations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL2
     */
    it('testPathGetLastPointMultipleOperations', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testPathGetLastPointMultipleOperations';
      let path = new drawing.Path();
      try {
        path.moveTo(10, 10);
        path.lineTo(50, 50);
        path.lineTo(100, 100);
        path.quadTo(150, 150, 200, 200);
        let result: common2D.Point = path.getLastPoint();
        expect(result.x).assertEqual(200);
        expect(result.y).assertEqual(200);
        console.info(msg + ' getLastPoint successes, result.x: ' + result.x + ', result.y: ' + result.y);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getLastPoint errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    
    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_GETLASTPOINT_0900
     * @tc.name      testPathGetLastPointWithZeroCoordinates
     * @tc.desc      testPathGetLastPointWithZeroCoordinates
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL2
     */
    it('testPathGetLastPointWithZeroCoordinates', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testPathGetLastPointWithZeroCoordinates';
      let path = new drawing.Path();
      try {
        path.moveTo(0, 0);
        path.lineTo(0, 100);
        let result: common2D.Point = path.getLastPoint();
        expect(result.x).assertEqual(0);
        expect(result.y).assertEqual(100);
        console.info(msg + ' getLastPoint successes, result.x: ' + result.x + ', result.y: ' + result.y);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getLastPoint errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    
    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_GETLASTPOINT_1000
     * @tc.name      testPathGetLastPointWithNegativeCoordinates
     * @tc.desc      testPathGetLastPointWithNegativeCoordinates
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL2
     */
    it('testPathGetLastPointWithNegativeCoordinates', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testPathGetLastPointWithNegativeCoordinates';
      let path = new drawing.Path();
      try {
        path.moveTo(10, 10);
        path.lineTo(-100, -200);
        let result: common2D.Point = path.getLastPoint();
        expect(result.x).assertEqual(-100);
        expect(result.y).assertEqual(-200);
        console.info(msg + ' getLastPoint successes, result.x: ' + result.x + ', result.y: ' + result.y);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getLastPoint errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    
    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_GETLASTPOINT_1100
     * @tc.name      testPathGetLastPointWithLargeCoordinates
     * @tc.desc      testPathGetLastPointWithLargeCoordinates
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL2
     */
    it('testPathGetLastPointWithLargeCoordinates', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testPathGetLastPointWithLargeCoordinates';
      let path = new drawing.Path();
      try {
        let largeValue = 1000000;
        path.moveTo(0, 0);
        path.lineTo(largeValue, largeValue);
        let result: common2D.Point = path.getLastPoint();
        expect(result.x).assertEqual(largeValue);
        expect(result.y).assertEqual(largeValue);
        console.info(msg + ' getLastPoint successes, result.x: ' + result.x + ', result.y: ' + result.y);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getLastPoint errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    
    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_GETLASTPOINT_1200
     * @tc.name      testPathGetLastPointWithFloatCoordinates
     * @tc.desc      testPathGetLastPointWithFloatCoordinates
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL2
     */
    it('testPathGetLastPointWithFloatCoordinates', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testPathGetLastPointWithFloatCoordinates';
      let path = new drawing.Path();
      try {
        path.moveTo(10.5, 10.5);
        path.lineTo(100.25, 100.75);
        let result: common2D.Point = path.getLastPoint();
        expect(result.x).assertClose(100.25, 0.01);
        expect(result.y).assertClose(100.75, 0.01);
        console.info(msg + ' getLastPoint successes, result.x: ' + result.x + ', result.y: ' + result.y);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getLastPoint errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    
    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_GETLASTPOINT_1300
     * @tc.name      testPathGetLastPointAfterReset
     * @tc.desc      testPathGetLastPointAfterReset
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL2
     */
    it('testPathGetLastPointAfterReset', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testPathGetLastPointAfterReset';
      let path = new drawing.Path();
      path.moveTo(10, 10);
      path.lineTo(100, 100);
      try {
        path.reset();
        let result: common2D.Point = path.getLastPoint();
        expect(result).assertEqual(undefined);
        console.info(msg + ' getLastPoint successes, result: ' + result);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getLastPoint errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    
    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_GETLASTPOINT_1400
     * @tc.name      testPathGetLastPointMultipleCalls
     * @tc.desc      testPathGetLastPointMultipleCalls
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL2
     */
    it('testPathGetLastPointMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testPathGetLastPointMultipleCalls';
      let path = new drawing.Path();
      path.moveTo(10, 10);
      path.lineTo(100, 100);
      try {
        let result1: common2D.Point = path.getLastPoint();
        let result2: common2D.Point = path.getLastPoint();
        let result3: common2D.Point = path.getLastPoint();
        expect(result1.x).assertEqual(result2.x);
        expect(result2.x).assertEqual(result3.x);
        expect(result1.y).assertEqual(result2.y);
        expect(result2.y).assertEqual(result3.y);
        console.info(msg + ' getLastPoint 1 successes, result.x: ' + result1.x + ', result.y: ' + result1.y);
        console.info(msg + ' getLastPoint 2 successes, result.x: ' + result2.x + ', result.y: ' + result2.y);
        console.info(msg + ' getLastPoint 3 successes, result.x: ' + result3.x + ', result.y: ' + result3.y);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getLastPoint errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    
    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_GETLASTPOINT_1500
     * @tc.name      testPathGetLastPointComplexPath
     * @tc.desc      testPathGetLastPointComplexPath
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL3
     */
    it('testPathGetLastPointComplexPath', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathGetLastPointComplexPath';
      let path = new drawing.Path();
      try {
        path.moveTo(10, 10);
        path.lineTo(50, 50);
        path.quadTo(80, 80, 100, 100);
        path.cubicTo(120, 120, 140, 140, 160, 160);
        path.conicTo(180, 180, 200, 200, 1.5);
        let result: common2D.Point = path.getLastPoint();
        expect(result.x).assertEqual(200);
        expect(result.y).assertEqual(200);
        console.info(msg + ' getLastPoint successes, result.x: ' + result.x + ', result.y: ' + result.y);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getLastPoint errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    
    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_GETLASTPOINT_1600
     * @tc.name      testPathGetLastPointAfterTransform
     * @tc.desc      testPathGetLastPointAfterTransform
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL3
     */
    it('testPathGetLastPointAfterTransform', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathGetLastPointAfterTransform';
      let path = new drawing.Path();
      let matrix = new drawing.Matrix();
      try {
        path.moveTo(10, 10);
        path.lineTo(100, 100);
        matrix.setScale(2, 2, 0, 0);
        path.transform(matrix);
        let result: common2D.Point = path.getLastPoint();
        expect(result.x).assertEqual(200);
        expect(result.y).assertEqual(200);
        console.info(msg + ' getLastPoint successes, result.x: ' + result.x + ', result.y: ' + result.y);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getLastPoint errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    
    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_ISEQUAL_0100
     * @tc.name      testPathIsEqualTrue
     * @tc.desc      testPathIsEqualTrue
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testPathIsEqualTrue', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathIsEqualTrue';
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
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_ISEQUAL_0200
     * @tc.name      testPathIsEqualFalse
     * @tc.desc      testPathIsEqualFalse
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testPathIsEqualFalse', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathIsEqualFalse';
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
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_ISEQUAL_0300
     * @tc.name      testPathIsEqualEmptyPaths
     * @tc.desc      testPathIsEqualEmptyPaths
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testPathIsEqualEmptyPaths', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathIsEqualEmptyPaths';
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
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_ISEQUAL_0400
     * @tc.name      testPathIsEqualAfterMoveTo
     * @tc.desc      testPathIsEqualAfterMoveTo
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPathIsEqualAfterMoveTo', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testPathIsEqualAfterMoveTo';
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
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_ISEQUAL_0500
     * @tc.name      testPathIsEqualAfterLineTo
     * @tc.desc      testPathIsEqualAfterLineTo
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPathIsEqualAfterLineTo', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testPathIsEqualAfterLineTo';
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
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_ISEQUAL_0600
     * @tc.name      testPathIsEqualAfterCurve
     * @tc.desc      testPathIsEqualAfterCurve
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPathIsEqualAfterCurve', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testPathIsEqualAfterCurve';
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
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_ISEQUAL_0700
     * @tc.name      testPathIsEqualCopyPath
     * @tc.desc      testPathIsEqualCopyPath
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPathIsEqualCopyPath', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testPathIsEqualCopyPath';
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
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_ISEQUAL_0800
     * @tc.name      testPathIsEqualDifferentCoordinates
     * @tc.desc      testPathIsEqualDifferentCoordinates
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL2
     */
    it('testPathIsEqualDifferentCoordinates', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testPathIsEqualDifferentCoordinates';
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
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_ISEQUAL_0900
     * @tc.name      testPathIsEqualDifferentOperations
     * @tc.desc      testPathIsEqualDifferentOperations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL2
     */
    it('testPathIsEqualDifferentOperations', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testPathIsEqualDifferentOperations';
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
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_ISEQUAL_1000
     * @tc.name      testPathIsEqualDifferentFillType
     * @tc.desc      testPathIsEqualDifferentFillType
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL2
     */
    it('testPathIsEqualDifferentFillType', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testPathIsEqualDifferentFillType';
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
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_ISEQUAL_1100
     * @tc.name      testPathIsEqualOneEmpty
     * @tc.desc      testPathIsEqualOneEmpty
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL2
     */
    it('testPathIsEqualOneEmpty', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testPathIsEqualOneEmpty';
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
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_ISEQUAL_1200
     * @tc.name      testPathIsEqualWithNull
     * @tc.desc      testPathIsEqualWithNull
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL2
     */
    it('testPathIsEqualWithNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testPathIsEqualWithNull';
      let path = new drawing.Path();
      path.moveTo(10, 10);
      path.lineTo(100, 100);
      try {
        let result = path.isEqual(null);
        console.info(msg + ' isEqual with null, result: ' + result);
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` isEqual errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })
    
    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_ISEQUAL_1300
     * @tc.name      testPathIsEqualWithUndefined
     * @tc.desc      testPathIsEqualWithUndefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL2
     */
    it('testPathIsEqualWithUndefined', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testPathIsEqualWithUndefined';
      let path = new drawing.Path();
      path.moveTo(10, 10);
      path.lineTo(100, 100);
      try {
        let result = path.isEqual(undefined);
        console.info(msg + ' isEqual with undefined, result: ' + result);
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` isEqual errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })
    
    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_ISEQUAL_1400
     * @tc.name      testPathIsEqualMultipleCalls
     * @tc.desc      testPathIsEqualMultipleCalls
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL2
     */
    it('testPathIsEqualMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testPathIsEqualMultipleCalls';
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
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_ISEQUAL_1500
     * @tc.name      testPathIsEqualComplexPaths
     * @tc.desc      testPathIsEqualComplexPaths
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL3
     */
    it('testPathIsEqualComplexPaths', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathIsEqualComplexPaths';
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
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_ISEQUAL_1600
     * @tc.name      testPathIsEqualAfterSet
     * @tc.desc      testPathIsEqualAfterSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL3
     */
    it('testPathIsEqualAfterSet', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathIsEqualAfterSet';
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
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_ISEQUAL_1700
     * @tc.name      testPathIsEqualWithConicWeights
     * @tc.desc      testPathIsEqualWithConicWeights
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL3
     */
    it('testPathIsEqualWithConicWeights', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathIsEqualWithConicWeights';
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
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_ISEQUAL_1800
     * @tc.name      testPathIsEqualSelfComparison
     * @tc.desc      testPathIsEqualSelfComparison
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL2
     */
    it('testPathIsEqualSelfComparison', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testPathIsEqualSelfComparison';
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
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_GETLASTPOINT_1700
     * @tc.name      testPathGetLastPointAfterAddCircle
     * @tc.desc      testPathGetLastPointAfterAddCircle
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL2
     */
    it('testPathGetLastPointAfterAddCircle', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testPathGetLastPointAfterAddCircle';
      let path = new drawing.Path();
      try {
        path.addCircle(100, 100, 50, drawing.PathDirection.CLOCKWISE);
        let result: common2D.Point = path.getLastPoint();
        expect(result.x).assertEqual(150);
        expect(result.y).assertEqual(100);
        console.info(msg + ' getLastPoint successes, result.x: ' + result.x + ', result.y: ' + result.y);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getLastPoint errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    
    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_GETLASTPOINT_1800
     * @tc.name      testPathGetLastPointAfterAddRect
     * @tc.desc      testPathGetLastPointAfterAddRect
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL2
     */
    it('testPathGetLastPointAfterAddRect', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testPathGetLastPointAfterAddRect';
      let path = new drawing.Path();
      let rect: common2D.Rect = { left: 100, top: 100, right: 500, bottom: 500 };
      try {
        path.addRect(rect, drawing.PathDirection.CLOCKWISE);
        let result: common2D.Point = path.getLastPoint();
        expect(result.x).assertEqual(100);
        expect(result.y).assertEqual(500);
        console.info(msg + ' getLastPoint successes, result.x: ' + result.x + ', result.y: ' + result.y);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getLastPoint errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    
    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_ISEQUAL_1900
     * @tc.name      testPathIsEqualAfterAddCircle
     * @tc.desc      testPathIsEqualAfterAddCircle
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL2
     */
    it('testPathIsEqualAfterAddCircle', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testPathIsEqualAfterAddCircle';
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
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_ISEQUAL_2000
     * @tc.name      testPathIsEqualDifferentDirection
     * @tc.desc      testPathIsEqualDifferentDirection
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL2
     */
    it('testPathIsEqualDifferentDirection', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testPathIsEqualDifferentDirection';
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
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_GETLASTPOINT_1900
     * @tc.name      testPathGetLastPointAfterSetLastPoint
     * @tc.desc      testPathGetLastPointAfterSetLastPoint
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL2
     */
    it('testPathGetLastPointAfterSetLastPoint', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testPathGetLastPointAfterSetLastPoint';
      let path = new drawing.Path();
      try {
        path.moveTo(10, 10);
        path.lineTo(100, 100);
        path.setLastPoint(50, 50);
        let result: common2D.Point = path.getLastPoint();
        expect(result.x).assertEqual(50);
        expect(result.y).assertEqual(50);
        console.info(msg + ' getLastPoint successes, result.x: ' + result.x + ', result.y: ' + result.y);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getLastPoint errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    
    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_GETLASTPOINT_2000
     * @tc.name      testPathGetLastPointAfterRewind
     * @tc.desc      testPathGetLastPointAfterRewind
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL2
     */
    it('testPathGetLastPointAfterRewind', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testPathGetLastPointAfterRewind';
      let path = new drawing.Path();
      try {
        path.moveTo(10, 10);
        path.lineTo(20, 20);
        path.rewind();
        let result: common2D.Point = path.getLastPoint();
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