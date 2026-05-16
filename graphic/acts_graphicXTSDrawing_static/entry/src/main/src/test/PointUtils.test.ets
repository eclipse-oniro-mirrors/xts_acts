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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, TestType, Size, Level } from "../../../hypium/index";
import drawing from '@ohos.graphics.drawing';
import common2D from '@ohos.graphics.common2D';
import { BusinessError } from '@ohos.base';

export default function drawingTsPointUtilsTest(): void {
  describe('DrawingTsPointUtilsTest', () => {
    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_POINTUTILS_STATIC_0100
     * @tc.name      testPointUtilsNegateNormalPositiveStatic
     * @tc.desc      Test negate with normal positive point values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testPointUtilsNegateNormalPositiveStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPointUtilsNegateNormalPositiveStatic';
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
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_POINTUTILS_STATIC_0200
     * @tc.name      testPointUtilsNegateNormalNegativeStatic
     * @tc.desc      Test negate with normal negative point values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testPointUtilsNegateNormalNegativeStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPointUtilsNegateNormalNegativeStatic';
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
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_POINTUTILS_STATIC_0300
     * @tc.name      testPointUtilsNegateZeroStatic
     * @tc.desc      Test negate with zero point values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testPointUtilsNegateZeroStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPointUtilsNegateZeroStatic';
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
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_POINTUTILS_STATIC_0400
     * @tc.name      testPointUtilsNegateMixedSignStatic
     * @tc.desc      Test negate with mixed sign point values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPointUtilsNegateMixedSignStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testPointUtilsNegateMixedSignStatic';
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
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_POINTUTILS_STATIC_0500
     * @tc.name      testPointUtilsNegateFloatStatic
     * @tc.desc      Test negate with float point values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPointUtilsNegateFloatStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testPointUtilsNegateFloatStatic';
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
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_POINTUTILS_STATIC_0600
     * @tc.name      testPointUtilsNegateLargeValueStatic
     * @tc.desc      Test negate with large point values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPointUtilsNegateLargeValueStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testPointUtilsNegateLargeValueStatic';
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
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_POINTUTILS_STATIC_0700
     * @tc.name      testPointUtilsNegateSmallValueStatic
     * @tc.desc      Test negate with small point values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPointUtilsNegateSmallValueStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testPointUtilsNegateSmallValueStatic';
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
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_POINTUTILS_STATIC_0800
     * @tc.name      testPointUtilsOffsetNormalPositiveStatic
     * @tc.desc      Test offset with normal positive values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testPointUtilsOffsetNormalPositiveStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPointUtilsOffsetNormalPositiveStatic';
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
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_POINTUTILS_STATIC_0900
     * @tc.name      testPointUtilsOffsetNormalNegativeStatic
     * @tc.desc      Test offset with normal negative values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testPointUtilsOffsetNormalNegativeStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPointUtilsOffsetNormalNegativeStatic';
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
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_POINTUTILS_STATIC_1000
     * @tc.name      testPointUtilsOffsetZeroStatic
     * @tc.desc      Test offset with zero offset values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testPointUtilsOffsetZeroStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPointUtilsOffsetZeroStatic';
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
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_POINTUTILS_STATIC_1100
     * @tc.name      testPointUtilsOffsetMixedDirectionStatic
     * @tc.desc      Test offset with mixed direction values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPointUtilsOffsetMixedDirectionStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testPointUtilsOffsetMixedDirectionStatic';
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
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_POINTUTILS_STATIC_1200
     * @tc.name      testPointUtilsOffsetFloatStatic
     * @tc.desc      Test offset with float offset values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPointUtilsOffsetFloatStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testPointUtilsOffsetFloatStatic';
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
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_POINTUTILS_STATIC_1300
     * @tc.name      testPointUtilsOffsetLargeValueStatic
     * @tc.desc      Test offset with large offset values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPointUtilsOffsetLargeValueStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testPointUtilsOffsetLargeValueStatic';
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
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_POINTUTILS_STATIC_1400
     * @tc.name      testPointUtilsOffsetSmallValueStatic
     * @tc.desc      Test offset with small offset values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPointUtilsOffsetSmallValueStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testPointUtilsOffsetSmallValueStatic';
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
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_POINTUTILS_STATIC_1500
     * @tc.name      testPointUtilsOffsetBoundaryMaxStatic
     * @tc.desc      Test offset with maximum boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPointUtilsOffsetBoundaryMaxStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testPointUtilsOffsetBoundaryMaxStatic';
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
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_POINTUTILS_STATIC_1600
     * @tc.name      testPointUtilsOffsetBoundaryMinStatic
     * @tc.desc      Test offset with minimum boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPointUtilsOffsetBoundaryMinStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testPointUtilsOffsetBoundaryMinStatic';
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
  })
}
