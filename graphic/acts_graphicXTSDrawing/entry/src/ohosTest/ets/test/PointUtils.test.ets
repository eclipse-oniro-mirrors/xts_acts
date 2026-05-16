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

export default function drawingTsPointUtilsTest(): void {
  describe('DrawingTsPointUtilsTest', () => {
    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_POINTUTILS_0100
     * @tc.name      testPointUtilsNegateNormalPositive
     * @tc.desc      Test negate with normal positive point values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testPointUtilsNegateNormalPositive', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPointUtilsNegateNormalPositive';
      let point: common2D.Point = { x: 10, y: 20 };
      try {
        drawing.PointUtils.negate(point);
        expect(point.x).assertEqual(-10);
        expect(point.y).assertEqual(-20);
        console.info(msg + ' negate successes, point.x: ' + point.x + ', point.y: ' + point.y);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` negate errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    
    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_POINTUTILS_0200
     * @tc.name      testPointUtilsNegateNormalNegative
     * @tc.desc      Test negate with normal negative point values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testPointUtilsNegateNormalNegative', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPointUtilsNegateNormalNegative';
      let point: common2D.Point = { x: -10, y: -20 };
      try {
        drawing.PointUtils.negate(point);
        expect(point.x).assertEqual(10);
        expect(point.y).assertEqual(20);
        console.info(msg + ' negate successes, point.x: ' + point.x + ', point.y: ' + point.y);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` negate errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    
    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_POINTUTILS_0300
     * @tc.name      testPointUtilsNegateZero
     * @tc.desc      Test negate with zero point values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testPointUtilsNegateZero', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPointUtilsNegateZero';
      let point: common2D.Point = { x: 0, y: 0 };
      try {
        drawing.PointUtils.negate(point);
        expect(point.x).assertEqual(0);
        expect(point.y).assertEqual(0);
        console.info(msg + ' negate successes, point.x: ' + point.x + ', point.y: ' + point.y);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` negate errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    
    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_POINTUTILS_0400
     * @tc.name      testPointUtilsNegateMixedSign
     * @tc.desc      Test negate with mixed sign point values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPointUtilsNegateMixedSign', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testPointUtilsNegateMixedSign';
      let point: common2D.Point = { x: 10, y: -20 };
      try {
        drawing.PointUtils.negate(point);
        expect(point.x).assertEqual(-10);
        expect(point.y).assertEqual(20);
        console.info(msg + ' negate successes, point.x: ' + point.x + ', point.y: ' + point.y);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` negate errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    
    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_POINTUTILS_0500
     * @tc.name      testPointUtilsNegateFloat
     * @tc.desc      Test negate with float point values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPointUtilsNegateFloat', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testPointUtilsNegateFloat';
      let point: common2D.Point = { x: 10.5, y: 20.7 };
      try {
        drawing.PointUtils.negate(point);
        expect(point.x).assertClose(-10.5, 0.001);
        expect(point.y).assertClose(-20.7, 0.001);
        console.info(msg + ' negate successes, point.x: ' + point.x + ', point.y: ' + point.y);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` negate errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    
    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_POINTUTILS_0600
     * @tc.name      testPointUtilsNegateLargeValue
     * @tc.desc      Test negate with large point values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPointUtilsNegateLargeValue', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testPointUtilsNegateLargeValue';
      let point: common2D.Point = { x: 1e10, y: 1e10 };
      try {
        drawing.PointUtils.negate(point);
        expect(point.x).assertClose(-1e10, 0.001);
        expect(point.y).assertClose(-1e10, 0.001);
        console.info(msg + ' negate successes, point.x: ' + point.x + ', point.y: ' + point.y);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` negate errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    
    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_POINTUTILS_0700
     * @tc.name      testPointUtilsNegateSmallValue
     * @tc.desc      Test negate with small point values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPointUtilsNegateSmallValue', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testPointUtilsNegateSmallValue';
      let point: common2D.Point = { x: 1e-10, y: 1e-10 };
      try {
        drawing.PointUtils.negate(point);
        expect(point.x).assertClose(-1e-10, 0.001);
        expect(point.y).assertClose(-1e-10, 0.001);
        console.info(msg + ' negate successes, point.x: ' + point.x + ', point.y: ' + point.y);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` negate errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    
    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_POINTUTILS_0800
     * @tc.name      testPointUtilsNegatePointNull
     * @tc.desc      Test negate with null point parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL2
     */
    it('testPointUtilsNegatePointNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testPointUtilsNegatePointNull';
      try {
        drawing.PointUtils.negate(null);
        console.info(msg + ' negate should throw error');
        expect().assertFail()
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` negate errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401)
      }
    })
    
    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_POINTUTILS_0900
     * @tc.name      testPointUtilsNegatePointUndefined
     * @tc.desc      Test negate with undefined point parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL2
     */
    it('testPointUtilsNegatePointUndefined', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testPointUtilsNegatePointUndefined';
      try {
        drawing.PointUtils.negate(undefined);
        console.info(msg + ' negate should throw error');
        expect().assertFail()
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` negate errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401)
      }
    })
    
    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_POINTUTILS_1000
     * @tc.name      testPointUtilsNegatePointMissingX
     * @tc.desc      Test negate with point missing x property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL2
     */
    it('testPointUtilsNegatePointMissingX', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testPointUtilsNegatePointMissingX';
      let point: common2D.Point= { x: null, y: 20 };
      try {
        drawing.PointUtils.negate(point);
        console.info(msg + ' negate should throw error');
        expect().assertFail()
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` negate errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401)
      }
    })
    
    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_POINTUTILS_1100
     * @tc.name      testPointUtilsNegatePointMissingY
     * @tc.desc      Test negate with point missing y property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL2
     */
    it('testPointUtilsNegatePointMissingY', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testPointUtilsNegatePointMissingY';
      let point: common2D.Point = { x: 10, y: null};
      try {
        drawing.PointUtils.negate(point);
        console.info(msg + ' negate should throw error');
        expect().assertFail()
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` negate errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401)
      }
    })
    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_POINTUTILS_1200
     * @tc.name      testPointUtilsOffsetNormalPositive
     * @tc.desc      Test offset with normal positive values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testPointUtilsOffsetNormalPositive', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPointUtilsOffsetNormalPositive';
      let point: common2D.Point = { x: 10, y: 20 };
      try {
        drawing.PointUtils.offset(point, 5, 10);
        expect(point.x).assertEqual(15);
        expect(point.y).assertEqual(30);
        console.info(msg + ' offset successes, point.x: ' + point.x + ', point.y: ' + point.y);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` offset errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    
    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_POINTUTILS_1300
     * @tc.name      testPointUtilsOffsetNormalNegative
     * @tc.desc      Test offset with normal negative values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testPointUtilsOffsetNormalNegative', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPointUtilsOffsetNormalNegative';
      let point: common2D.Point = { x: 10, y: 20 };
      try {
        drawing.PointUtils.offset(point, -5, -10);
        expect(point.x).assertEqual(5);
        expect(point.y).assertEqual(10);
        console.info(msg + ' offset successes, point.x: ' + point.x + ', point.y: ' + point.y);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` offset errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    
    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_POINTUTILS_1400
     * @tc.name      testPointUtilsOffsetZero
     * @tc.desc      Test offset with zero offset values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testPointUtilsOffsetZero', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPointUtilsOffsetZero';
      let point: common2D.Point = { x: 10, y: 20 };
      try {
        drawing.PointUtils.offset(point, 0, 0);
        expect(point.x).assertEqual(10);
        expect(point.y).assertEqual(20);
        console.info(msg + ' offset successes, point.x: ' + point.x + ', point.y: ' + point.y);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` offset errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    
    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_POINTUTILS_1500
     * @tc.name      testPointUtilsOffsetMixedDirection
     * @tc.desc      Test offset with mixed direction values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPointUtilsOffsetMixedDirection', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testPointUtilsOffsetMixedDirection';
      let point: common2D.Point = { x: 10, y: 20 };
      try {
        drawing.PointUtils.offset(point, 5, -10);
        expect(point.x).assertEqual(15);
        expect(point.y).assertEqual(10);
        console.info(msg + ' offset successes, point.x: ' + point.x + ', point.y: ' + point.y);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` offset errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    
    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_POINTUTILS_1600
     * @tc.name      testPointUtilsOffsetFloat
     * @tc.desc      Test offset with float offset values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPointUtilsOffsetFloat', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testPointUtilsOffsetFloat';
      let point: common2D.Point = { x: 10, y: 20 };
      try {
        drawing.PointUtils.offset(point, 5.5, 10.7);
        expect(point.x).assertClose(15.5, 0.001);
        expect(point.y).assertClose(30.7, 0.001);
        console.info(msg + ' offset successes, point.x: ' + point.x + ', point.y: ' + point.y);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` offset errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    
    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_POINTUTILS_1700
     * @tc.name      testPointUtilsOffsetLargeValue
     * @tc.desc      Test offset with large offset values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPointUtilsOffsetLargeValue', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testPointUtilsOffsetLargeValue';
      let point: common2D.Point = { x: 0, y: 0 };
      try {
        drawing.PointUtils.offset(point, 1e10, 1e10);
        expect(point.x).assertClose(1e10, 0.001);
        expect(point.y).assertClose(1e10, 0.001);
        console.info(msg + ' offset successes, point.x: ' + point.x + ', point.y: ' + point.y);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` offset errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    
    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_POINTUTILS_1800
     * @tc.name      testPointUtilsOffsetSmallValue
     * @tc.desc      Test offset with small offset values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPointUtilsOffsetSmallValue', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testPointUtilsOffsetSmallValue';
      let point: common2D.Point = { x: 0, y: 0 };
      try {
        drawing.PointUtils.offset(point, 1e-10, 1e-10);
        expect(point.x).assertClose(1e-10, 0.001);
        expect(point.y).assertClose(1e-10, 0.001);
        console.info(msg + ' offset successes, point.x: ' + point.x + ', point.y: ' + point.y);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` offset errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    
    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_POINTUTILS_1900
     * @tc.name      testPointUtilsOffsetBoundaryMax
     * @tc.desc      Test offset with maximum boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPointUtilsOffsetBoundaryMax', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testPointUtilsOffsetBoundaryMax';
      let point: common2D.Point = { x: 0, y: 0 };
      try {
        drawing.PointUtils.offset(point, Number.MAX_VALUE, Number.MAX_VALUE);
        console.info(msg + ' offset successes, point.x: ' + point.x + ', point.y: ' + point.y);
        expect(point.x).assertEqual(Infinity);
        expect(point.y).assertEqual(Infinity);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` offset errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    
    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_POINTUTILS_2000
     * @tc.name      testPointUtilsOffsetBoundaryMin
     * @tc.desc      Test offset with minimum boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPointUtilsOffsetBoundaryMin', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testPointUtilsOffsetBoundaryMin';
      let point: common2D.Point = { x: 0, y: 0 };
      try {
        drawing.PointUtils.offset(point, Number.MIN_VALUE, Number.MIN_VALUE);
        console.info(msg + ' offset successes, point.x: ' + point.x + ', point.y: ' + point.y);
        expect(point.x).assertEqual(0);
        expect(point.y).assertEqual(0);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` offset errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    
    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_POINTUTILS_2100
     * @tc.name      testPointUtilsOffsetPointNull
     * @tc.desc      Test offset with null point parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL2
     */
    it('testPointUtilsOffsetPointNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testPointUtilsOffsetPointNull';
      try {
        drawing.PointUtils.offset(null, 5, 10);
        console.info(msg + ' offset should throw error');
        expect().assertFail()
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` offset errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401)
      }
    })
    
    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_POINTUTILS_2200
     * @tc.name      testPointUtilsOffsetPointUndefined
     * @tc.desc      Test offset with undefined point parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL2
     */
    it('testPointUtilsOffsetPointUndefined', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testPointUtilsOffsetPointUndefined';
      try {
        drawing.PointUtils.offset(undefined, 5, 10);
        console.info(msg + ' offset should throw error');
        expect().assertFail()
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` offset errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401)
      }
    })
    
    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_POINTUTILS_2300
     * @tc.name      testPointUtilsOffsetDxNull
     * @tc.desc      Test offset with null dx parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL2
     */
    it('testPointUtilsOffsetDxNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testPointUtilsOffsetDxNull';
      let point: common2D.Point = { x: 10, y: 20 };
      try {
        drawing.PointUtils.offset(point, null, 10);
        console.info(msg + ' offset should throw error');
        expect().assertFail()
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` offset errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401)
      }
    })
    
    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_POINTUTILS_2400
     * @tc.name      testPointUtilsOffsetDyNull
     * @tc.desc      Test offset with null dy parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL2
     */
    it('testPointUtilsOffsetDyNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testPointUtilsOffsetDyNull';
      let point: common2D.Point = { x: 10, y: 20 };
      try {
        drawing.PointUtils.offset(point, 5, null);
        console.info(msg + ' offset should throw error');
        expect().assertFail()
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` offset errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401)
      }
    })
    
    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_POINTUTILS_2500
     * @tc.name      testPointUtilsOffsetDxUndefined
     * @tc.desc      Test offset with undefined dx parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL2
     */
    it('testPointUtilsOffsetDxUndefined', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testPointUtilsOffsetDxUndefined';
      let point: common2D.Point = { x: 10, y: 20 };
      try {
        drawing.PointUtils.offset(point, undefined, 10);
        console.info(msg + ' offset should throw error');
        expect().assertFail()
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` offset errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401)
      }
    })
    
    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_POINTUTILS_2600
     * @tc.name      testPointUtilsOffsetDyUndefined
     * @tc.desc      Test offset with undefined dy parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL2
     */
    it('testPointUtilsOffsetDyUndefined', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testPointUtilsOffsetDyUndefined';
      let point: common2D.Point = { x: 10, y: 20 };
      try {
        drawing.PointUtils.offset(point, 5, undefined);
        console.info(msg + ' offset should throw error');
        expect().assertFail()
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` offset errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401)
      }
    })
    
    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_POINTUTILS_2700
     * @tc.name      testPointUtilsOffsetPointMissingX
     * @tc.desc      Test offset with point missing x property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL2
     */
    it('testPointUtilsOffsetPointMissingX', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testPointUtilsOffsetPointMissingX';
      let point: common2D.Point = { x: undefined, y: 20 };
      try {
        drawing.PointUtils.offset(point, 5, 10);
        console.info(msg + ' offset should throw error');
        expect().assertFail()
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` offset errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401)
      }
    })
    
    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_POINTUTILS_2800
     * @tc.name      testPointUtilsOffsetPointMissingY
     * @tc.desc      Test offset with point missing y property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL2
     */
    it('testPointUtilsOffsetPointMissingY', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testPointUtilsOffsetPointMissingY';
      let point = { x: 10, y: undefined };
      try {
        drawing.PointUtils.offset(point, 5, 10);
        console.info(msg + ' offset should throw error');
        expect().assertFail()
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` offset errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401)
      }
    })
  })
}
