/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import libDrawingNative from 'libdrawingnative.so';
import Utils, { Log } from './Utils.test';


export default function DrawingNativePathTest() {
  describe('DrawingNativePathTest', () => {
    beforeAll(async () => {
    })

    beforeEach(async () => {
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
     * @tc.name   testPathCreateNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathBasic_0100
     * @tc.desc   Test for creating a path object with normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPathCreateNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathBasic(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathCopyNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathBasic_0200
     * @tc.desc   Test for copying a path with normal parameters and checking the copied path length.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPathCopyNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathBasic(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathCopyNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathBasic_0300
     * @tc.desc   Test for copying a path with NULL parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathCopyNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathBasic(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathCopyInputDestroyed
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathBasic_0400
     * @tc.desc   Test for copying a path and checking if the copied path is affected after the original path is destroyed.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathCopyInputDestroyed', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathBasic(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathDestroyNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathBasic_0500
     * @tc.desc   Test for creating and destroying a path object with normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPathDestroyNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathBasic(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathDestroyNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathBasic_0600
     * @tc.desc   Test for destroying a path object with NULL parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathDestroyNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathBasic(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathMoveToNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathBasic_0700
     * @tc.desc   Test for moving a path to a normal position with valid parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPathMoveToNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathBasic(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathMoveToNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathBasic_0800
     * @tc.desc   Test for moving a path with NULL or invalid parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathMoveToNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathBasic(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathMoveToAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathBasic_0900
     * @tc.desc   Test for moving a path with abnormal data types as parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathMoveToAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathBasic(8);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathMoveToMaximal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathBasic_1000
     * @tc.desc   Test for moving a path with maximal values as parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathMoveToMaximal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathBasic(9);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathLineToNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathBasic_1100
     * @tc.desc   Test for adding a line to a path with normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPathLineToNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathBasic(10);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathLineToNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathBasic_1200
     * @tc.desc   Test for adding a line to a path with NULL or invalid parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathLineToNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathBasic(11);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathLineToAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathBasic_1300
     * @tc.desc   Test for moving a path with abnormal data types as parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathLineToAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathBasic(12);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathLineToMaximal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathBasic_1400
     * @tc.desc   Test for moving a path with maximal values as parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathLineToMaximal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathBasic(13);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathArcToNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathBasic_1500
     * @tc.desc   Test for adding an arc to a path with normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPathArcToNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathBasic(14);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathArcToNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathBasic_1600
     * @tc.desc   Test for adding an arc to a path with NULL or invalid parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathArcToNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathBasic(15);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathArcToAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathBasic_1700
     * @tc.desc   Test for adding an arc to a path with abnormal data types as parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathArcToAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathBasic(16);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathArcToMaximal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathBasic_1800
     * @tc.desc   Test for adding an arc to a path with maximal values as parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathArcToMaximal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathBasic(17);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathQuadToNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathBasic_1900
     * @tc.desc   Test for adding a quadratic Bezier curve to a path with normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPathQuadToNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathBasic(18);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathQuadToNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathBasic_2000
     * @tc.desc   Test for adding a quadratic Bezier curve to a path with NULL or invalid parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathQuadToNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathBasic(19);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathQuadToAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathBasic_2100
     * @tc.desc   Test for adding a quadratic Bezier curve to a path with abnormal data types as parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathQuadToAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathBasic(20);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathQuadToMaximal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathBasic_2200
     * @tc.desc   Test for adding a quadratic Bezier curve to a path with maximal values as parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathQuadToMaximal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathBasic(21);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathConicToNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathBasic_2300
     * @tc.desc   Test for adding a conic curve to a path with normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPathConicToNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathBasic(22);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathConicToNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathBasic_2400
     * @tc.desc   Test for adding a conic curve to a path with NULL or invalid parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathConicToNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathBasic(23);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathConicToAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathBasic_2500
     * @tc.desc   Test for adding a conic curve to a path with abnormal data types as parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathConicToAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathBasic(24);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathConicToMaximal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathBasic_2600
     * @tc.desc   Test for adding a conic curve to a path with maximal values as parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathConicToMaximal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathBasic(25);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathCubicToNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathBasic_2700
     * @tc.desc   Test for adding a cubic Bezier curve to a path with normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPathCubicToNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathBasic(26);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathCubicToNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathBasic_2800
     * @tc.desc   Test for adding a cubic Bezier curve to a path with NULL or invalid parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathCubicToNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathBasic(27);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathCubicToAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathBasic_2900
     * @tc.desc   Test for adding a cubic Bezier curve to a path with abnormal data types as parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathCubicToAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathBasic(28);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathCubicToMaximal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathBasic_3000
     * @tc.desc   Test for adding a cubic Bezier curve to a path with maximal values as parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathCubicToMaximal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathBasic(29);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathRMoveToNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathRelative_0100
     * @tc.desc   Test for setting a relative move to a path with normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPathRMoveToNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathRelative(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathRMoveToNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathRelative_0200
     * @tc.desc   Test for setting a relative move to a path with NULL or invalid parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathRMoveToNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathRelative(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathRMoveToAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathRelative_0300
     * @tc.desc   Test for setting a relative move to a path with abnormal data types as parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathRMoveToAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathRelative(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathRMoveToMaximal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathRelative_0400
     * @tc.desc   Test for setting a relative move to a path with maximal values as parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathRMoveToMaximal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathRelative(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathRLineToNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathRelative_0500
     * @tc.desc   Test for adding a relative line to a path with normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPathRLineToNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathRelative(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathRLineToNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathRelative_0600
     * @tc.desc   Test for adding a relative line to a path with NULL or invalid parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathRLineToNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathRelative(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathRLineToAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathRelative_0700
     * @tc.desc   Test for adding a relative line to a path with abnormal data types as parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathRLineToAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathRelative(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathRLineToMaximal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathRelative_0800
     * @tc.desc   Test for adding a relative line to a path with maximal values as parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathRLineToMaximal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathRelative(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathRQuadToNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathRelative_0900
     * @tc.desc   Test for adding a relative quadratic Bezier curve to a path with normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPathRQuadToNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathRelative(8);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathRQuadToNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathRelative_1000
     * @tc.desc   Test for adding a relative quadratic Bezier curve to a path with NULL or invalid parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathRQuadToNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathRelative(9);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathRQuadToAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathRelative_1100
     * @tc.desc   Test for adding a relative quadratic Bezier curve to a path with abnormal data types as parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathRQuadToAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathRelative(10);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathRQuadToMaximal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathRelative_1200
     * @tc.desc   Test for adding a relative quadratic Bezier curve to a path with maximal values as parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathRQuadToMaximal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathRelative(11);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathRConicToNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathRelative_1300
     * @tc.desc   Test for adding a relative conic curve to a path with normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPathRConicToNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathRelative(12);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathRConicToNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathRelative_1400
     * @tc.desc   Test for adding a relative conic curve to a path with NULL or invalid parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathRConicToNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathRelative(13);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathRConicToAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathRelative_1500
     * @tc.desc   Test for adding a relative conic curve to a path with abnormal data types as parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathRConicToAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathRelative(14);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathRConicToMaximal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathRelative_1600
     * @tc.desc   Test for adding a relative conic curve to a path with maximal values as parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathRConicToMaximal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathRelative(15);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathRCubicToNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathRelative_1700
     * @tc.desc   Test for adding a relative cubic Bezier curve to a path with normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPathRCubicToNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathRelative(16);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathRCubicToNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathRelative_1800
     * @tc.desc   Test for adding a relative cubic Bezier curve to a path with NULL or invalid parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathRCubicToNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathRelative(17);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathRCubicToAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathRelative_1900
     * @tc.desc   Test for adding a relative cubic Bezier curve to a path with abnormal data types as parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathRCubicToAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathRelative(18);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathRCubicToMaximal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathRelative_2000
     * @tc.desc   Test for adding a relative cubic Bezier curve to a path with maximal values as parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathRCubicToMaximal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathRelative(19);
      expect(result).assertEqual(0);
    })

    // Path Add Shape related test cases (14 cases)
    /**
     * @tc.name   testPathAddRectNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathAddShape_0100
     * @tc.desc   Test for adding a rectangle to a path with normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPathAddRectNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathAddShape(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathAddRectNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathAddShape_0200
     * @tc.desc   Test for adding a rectangle to a path with NULL or invalid parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathAddRectNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathAddShape(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathAddRectAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathAddShape_0300
     * @tc.desc   Test for adding a rectangle to a path with abnormal data types as parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathAddRectAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathAddShape(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathAddRectMaximal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathAddShape_0400
     * @tc.desc   Test for adding a rectangle to a path with maximal values as parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathAddRectMaximal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathAddShape(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathAddRectWithInitialCornerNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathAddShape_0500
     * @tc.desc   Test for adding a rectangle to a path with initial corner and normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPathAddRectWithInitialCornerNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathAddShape(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathAddRectWithInitialCornerNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathAddShape_0600
     * @tc.desc   Test for adding a rectangle to a path with initial corner and NULL or invalid parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathAddRectWithInitialCornerNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathAddShape(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathAddRectWithInitialCornerAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathAddShape_0700
     * @tc.desc   Test for adding a rectangle to a path with initial corner and abnormal data types as parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathAddRectWithInitialCornerAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathAddShape(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathAddRectWithInitialCornerMaximal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathAddShape_0800
     * @tc.desc   Test for adding a rectangle to a path with initial corner and maximal values as parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathAddRectWithInitialCornerMaximal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathAddShape(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathAddRoundRectNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathAddShape_0900
     * @tc.desc   Test for adding a round rectangle to a path with normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPathAddRoundRectNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathAddShape(8);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathAddRoundRectNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathAddShape_1000
     * @tc.desc   Test for adding a round rectangle to a path with NULL or invalid parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathAddRoundRectNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathAddShape(9);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathAddOvalWithInitialPointNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathAddShape_1100
     * @tc.desc   Test for adding an oval to a path with initial point and normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPathAddOvalWithInitialPointNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathAddShape(10);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathAddOvalWithInitialPointNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathAddShape_1200
     * @tc.desc   Test for adding an oval to a path with initial point and NULL or invalid parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathAddOvalWithInitialPointNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathAddShape(11);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathAddOvalWithInitialPointAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathAddShape_1300
     * @tc.desc   Test for adding an oval to a path with initial point and abnormal data types as parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathAddOvalWithInitialPointAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathAddShape(12);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathAddOvalWithInitialPointMaximal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathAddShape_1400
     * @tc.desc   Test for adding an oval to a path with initial point and maximal values as parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathAddOvalWithInitialPointMaximal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathAddShape(13);
      expect(result).assertEqual(0);
    })

    // Path Part2 Add related test cases (25 cases)
    /**
     * @tc.name   testPathAddArcNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart2Add_0100
     * @tc.desc   Test for adding an arc to a path with normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPathAddArcNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart2Add(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathAddArcNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart2Add_0200
     * @tc.desc   Test for adding an arc to a path with NULL or invalid parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathAddArcNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2Add(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathAddArcAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart2Add_0300
     * @tc.desc   Test for adding an arc to a path with abnormal data types as parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathAddArcAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2Add(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathAddArcMaximal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart2Add_0400
     * @tc.desc   Test for adding an arc to a path with maximal values as parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathAddArcMaximal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2Add(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathAddPathNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart2Add_0500
     * @tc.desc   Test for adding a path to another path with normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPathAddPathNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart2Add(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathAddPathNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart2Add_0600
     * @tc.desc   Test for adding a path to another path with NULL or invalid parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathAddPathNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2Add(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathAddPathWithMatrixAndModeNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart2Add_0700
     * @tc.desc   Test for adding a path to another path with matrix and mode transformations using normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPathAddPathWithMatrixAndModeNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart2Add(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathAddPathWithMatrixAndModeNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart2Add_0800
     * @tc.desc   Test for adding a path to another path with matrix and mode transformations using NULL or invalid
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathAddPathWithMatrixAndModeNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2Add(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathAddPathWithModeNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart2Add_0900
     * @tc.desc   Test for adding a path to another path with mode transformations using normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPathAddPathWithModeNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart2Add(8);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathAddPathWithModeNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart2Add_1000
     * @tc.desc   Test for adding a path to another path with mode transformations using NULL or invalid parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathAddPathWithModeNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2Add(9);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathAddPathWithOffsetAndModeNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart2Add_1100
     * @tc.desc   Test for adding a path to another path with offset and mode transformations using normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPathAddPathWithOffsetAndModeNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart2Add(10);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathAddPathWithOffsetAndModeNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart2Add_1200
     * @tc.desc   Test for adding a path to another path with offset and mode transformations using NULL or invalid
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathAddPathWithOffsetAndModeNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2Add(11);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathAddPathWithOffsetAndModeAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart2Add_1300
     * @tc.desc   Test for adding a path to another path with offset and mode transformations using abnormal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathAddPathWithOffsetAndModeAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2Add(12);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathAddPathWithOffsetAndModeMaximal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart2Add_1400
     * @tc.desc   Test for adding a path to another path with offset and mode transformations using maximal values.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathAddPathWithOffsetAndModeMaximal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2Add(13);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathAddOvalNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart2Add_1500
     * @tc.desc   Test for adding an oval to a path using normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPathAddOvalNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart2Add(14);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathAddOvalNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart2Add_1600
     * @tc.desc   Test for adding an oval to a path using NULL or invalid parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathAddOvalNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2Add(15);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathAddPolygonNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart2Add_1700
     * @tc.desc   Test for adding a polygon to a path with the fourth parameter set to true.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPathAddPolygonNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart2Add(16);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathAddPolygonNormal2
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart2Add_1800
     * @tc.desc   Test for adding a polygon to a path with the fourth parameter set to false.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPathAddPolygonNormal2', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart2Add(17);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathAddPolygonNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart2Add_1900
     * @tc.desc   Test for adding a polygon to a path using NULL or invalid parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathAddPolygonNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2Add(18);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathAddPolygonAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart2Add_2000
     * @tc.desc   Test for adding a polygon to a path using abnormal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathAddPolygonAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2Add(19);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathAddPolygonMaximal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart2Add_2100
     * @tc.desc   Test for adding a polygon to a path using maximal values.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathAddPolygonMaximal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2Add(20);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathAddCircleNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart2Add_2200
     * @tc.desc   Test for adding a circle to a path using normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPathAddCircleNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart2Add(21);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathAddCircleNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart2Add_2300
     * @tc.desc   Test for adding a circle to a path using NULL or invalid parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathAddCircleNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2Add(22);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathAddCircleAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart2Add_2400
     * @tc.desc   Test for adding a circle to a path using abnormal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathAddCircleAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2Add(23);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathAddCircleMaximal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart2Add_2500
     * @tc.desc   Test for adding a circle to a path using maximal values.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathAddCircleMaximal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2Add(24);
      expect(result).assertEqual(0);
    })

    // Path Part2 Transform related test cases (11 cases)
    /**
     * @tc.name   testPathBuildFromSvgStringNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart2Transform_0100
     * @tc.desc   Test for building a path from an SVG string using normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPathBuildFromSvgStringNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart2Transform(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathBuildFromSvgStringNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart2Transform_0200
     * @tc.desc   Test for building a path from an SVG string using NULL or invalid parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathBuildFromSvgStringNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2Transform(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathContainsNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart2Transform_0300
     * @tc.desc   Test for checking if a path contains a specified point using normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPathContainsNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart2Transform(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathContainsNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart2Transform_0400
     * @tc.desc   Test for checking if a path contains a specified point using NULL or invalid parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathContainsNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2Transform(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathContainsAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart2Transform_0500
     * @tc.desc   Test for checking if a path contains a specified point using abnormal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathContainsAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2Transform(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathContainsMaximal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart2Transform_0600
     * @tc.desc   Test for checking if a path contains a specified point using maximal values.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathContainsMaximal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2Transform(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathTransformNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart2Transform_0700
     * @tc.desc   Test for transforming a path using normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPathTransformNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart2Transform(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathTransformNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart2Transform_0800
     * @tc.desc   Test for transforming a path using NULL or invalid parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathTransformNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2Transform(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathTransformWithPerspectiveClipNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart2Transform_0900
     * @tc.desc   Test for transforming a path with perspective clip using normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPathTransformWithPerspectiveClipNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart2Transform(8);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathTransformWithPerspectiveClipNormal2
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart2Transform_1000
     * @tc.desc   Test for transforming a path with perspective clip using normal parameters with false perspective clip.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPathTransformWithPerspectiveClipNormal2', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart2Transform(9);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathTransformWithPerspectiveClipNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart2Transform_1100
     * @tc.desc   Test for transforming a path with perspective clip using NULL or invalid parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathTransformWithPerspectiveClipNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2Transform(10);
      expect(result).assertEqual(0);
    })

    // Path Part2 Get/Set related test cases (17 cases)
    /**
     * @tc.name   testPathSetFillTypeNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart2GetSet_0100
     * @tc.desc   Test for setting fill type of a path using normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPathSetFillTypeNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart2GetSet(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathSetFillTypeNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart2GetSet_0200
     * @tc.desc   Test for setting fill type of a path using NULL or invalid parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathSetFillTypeNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2GetSet(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathSetFillTypeMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart2GetSet_0300
     * @tc.desc   Test for setting fill type of a path with multiple calls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathSetFillTypeMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2GetSet(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathGetLengthNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart2GetSet_0400
     * @tc.desc   Test for getting the length of a path using normal parameters with detailed length.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPathGetLengthNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart2GetSet(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathGetLengthNormal2
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart2GetSet_0500
     * @tc.desc   Test for getting the length of a path using normal parameters without detailed length.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPathGetLengthNormal2', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart2GetSet(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathGetLengthNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart2GetSet_0600
     * @tc.desc   Test for getting the length of a path using NULL or invalid parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathGetLengthNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2GetSet(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathGetBoundsNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart2GetSet_0700
     * @tc.desc   Test for getting the bounds of a path using normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPathGetBoundsNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart2GetSet(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathGetBoundsNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart2GetSet_0800
     * @tc.desc   Test for getting the bounds of a path using NULL or invalid parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathGetBoundsNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2GetSet(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathCloseNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart2GetSet_0900
     * @tc.desc   test for testPathCloseNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPathCloseNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart2GetSet(8);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathCloseNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart2GetSet_1000
     * @tc.desc   Test for closing a path using NULL or invalid parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathCloseNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2GetSet(9);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathOffsetNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart2GetSet_1100
     * @tc.desc   Test for offsetting a path using normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPathOffsetNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart2GetSet(10);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathOffsetNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart2GetSet_1200
     * @tc.desc   Test for offsetting a path using NULL or invalid parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathOffsetNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2GetSet(11);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathOffsetAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart2GetSet_1300
     * @tc.desc   Test for offsetting a path with abnormal parameters (non-float values).
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathOffsetAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2GetSet(12);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathOffsetMaximal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart2GetSet_1400
     * @tc.desc   Test for offsetting a path with maximal values.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathOffsetMaximal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2GetSet(13);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathResetNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart2GetSet_1500
     * @tc.desc   Test for resetting a path using normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPathResetNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart2GetSet(14);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathResetNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart2GetSet_1600
     * @tc.desc   Test for resetting a path using NULL or invalid parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathResetNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2GetSet(15);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathResetMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart2GetSet_1700
     * @tc.desc   Test for resetting a path with multiple calls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathResetMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2GetSet(16);
      expect(result).assertEqual(0);
    })

    // Path Part3 Query related test cases (12 cases)
    /**
     * @tc.name   testPathIsClosedNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart3Query_0100
     * @tc.desc   Test for checking if a path is closed using normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPathIsClosedNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart3Query(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathIsClosedNormal2
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart3Query_0200
     * @tc.desc   Test for checking if a path is closed without closing it.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPathIsClosedNormal2', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart3Query(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathIsClosedNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart3Query_0300
     * @tc.desc   Test for checking if a path is closed with NULL or invalid parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathIsClosedNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart3Query(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathGetPositionTangentNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart3Transform_0100
     * @tc.desc   Test for getting position and tangent of a path using normal parameters with tangent flag set to true.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPathGetPositionTangentNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart3Transform(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathGetPositionTangentNormal2
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart3Transform_0200
     * @tc.desc   Test for getting position and tangent of a path using normal parameters with tangent flag set to false.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPathGetPositionTangentNormal2', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart3Transform(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathGetPositionTangentNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart3Transform_0300
     * @tc.desc   Test for getting position and tangent of a path using NULL or invalid parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathGetPositionTangentNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart3Transform(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathGetPositionTangentAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart3Transform_0400
     * @tc.desc   Test for getting position and tangent of a path with abnormal parameters (non-float values).
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathGetPositionTangentAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart3Transform(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathGetPositionTangentMaximal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart3Transform_0500
     * @tc.desc   Test for getting position and tangent of a path with maximal values.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathGetPositionTangentMaximal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart3Transform(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathOpNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart3Transform_0600
     * @tc.desc   Test for performing path operations using normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPathOpNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart3Transform(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathOpNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart3Transform_0700
     * @tc.desc   Test for performing path operations with NULL or invalid parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathOpNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart3Transform(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathGetMatrixNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart3Transform_0800
     * @tc.desc   Test for getting transformation matrix of a path using normal parameters with matrix flag set to true.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPathGetMatrixNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart3Transform(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathGetMatrixNormal2
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart3Transform_0900
     * @tc.desc   Test for getting transformation matrix of a path using normal parameters with matrix flag set to false.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPathGetMatrixNormal2', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart3Transform(8);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathGetMatrixNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart3Transform_1000
     * @tc.desc   Test for getting transformation matrix of a path using NULL or invalid parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathGetMatrixNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart3Transform(9);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathGetMatrixAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart3Transform_1100
     * @tc.desc   Test for getting transformation matrix of a path with abnormal parameters (non-float values).
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathGetMatrixAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart3Transform(10);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathGetMatrixMaximal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart3Transform_1200
     * @tc.desc   Test for getting transformation matrix of a path with maximal values.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathGetMatrixMaximal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart3Transform(11);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathGetSegmentNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart3Transform_1300
     * @tc.desc   Testing the enumeration traversal of the interface for extracting path segments and appending them to the
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPathGetSegmentNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart3Transform(12);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathGetSegmentNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart3Transform_1400
     * @tc.desc   Tests when an interface that intercepts a path fragment and appends it to the target path passes a null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathGetSegmentNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart3Transform(13);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathGetSegmentAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart3Transform_1500
     * @tc.desc   Test cases where the function intercepts a path fragment and appends it to the destination path with an
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathGetSegmentAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart3Transform(14);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathGetSegmentMultiplies
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart3Transform_1600
     * @tc.desc   The test function intercepts the path fragment and appends it to the target path loop several times
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathGetSegmentMultiplies', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart3Transform(15);
      expect(result).assertEqual(0);
    })

    // Path Part3 Advanced related test cases (14 cases)
    /**
     * @tc.name   testPathSetPathNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart3Advanced_0100
     * @tc.desc   test for testPathSetPathNormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPathSetPathNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart3Advanced(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathSetPathNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart3Advanced_0200
     * @tc.desc   test for testPathSetPathNull
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathSetPathNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart3Advanced(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathSetPathMulptiCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart3Advanced_0300
     * @tc.desc   test for testPathSetPathMulptiCalls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathSetPathMulptiCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart3Advanced(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathIsEmptyNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart3Query_0400
     * @tc.desc   test for testPathIsEmptyNormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPathIsEmptyNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart3Query(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathIsEmptyNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart3Query_0500
     * @tc.desc   test for testPathIsEmptyNull
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathIsEmptyNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart3Query(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathIsEmptyMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart3Query_0600
     * @tc.desc   test for testPathIsEmptyMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathIsEmptyMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart3Query(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathIsRectNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart3Query_0700
     * @tc.desc   test for testPathIsRectNormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPathIsRectNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart3Query(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathIsRectNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart3Query_0800
     * @tc.desc   test for testPathIsRectNull
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathIsRectNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart3Query(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathIsRectMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart3Query_0900
     * @tc.desc   test for testPathIsRectMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathIsRectMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart3Query(8);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathGetFillTypeNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart3Query_1000
     * @tc.desc   test for testPathGetFillTypeNormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPathGetFillTypeNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart3Query(9);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathGetFillTypeNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart3Query_1100
     * @tc.desc   test for testPathGetFillTypeNull
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathGetFillTypeNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart3Query(10);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathGetFillTypeMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart3Query_1200
     * @tc.desc   test for testPathGetFillTypeMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathGetFillTypeMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart3Query(11);
      expect(result).assertEqual(0);
    })
  })
}