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


export default function DrawingNativeRectTest() {
  describe('DrawingNativeRectTest', () => {
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
     * @tc.name   testRectCreateNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRectCreateDestroyIntersectJoin_0100
     * @tc.desc   Test for creating and destroying a rectangle object with normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testRectCreateNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRectCreateDestroyIntersectJoin(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRectIntersectNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRectCreateDestroyIntersectJoin_0200
     * @tc.desc   Test for intersecting two rectangles with normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testRectIntersectNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRectCreateDestroyIntersectJoin(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRectIntersectNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRectCreateDestroyIntersectJoin_0300
     * @tc.desc   Test for intersecting rectangles with NULL parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testRectIntersectNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectCreateDestroyIntersectJoin(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRectJoinNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRectCreateDestroyIntersectJoin_0400
     * @tc.desc   Test for joining two rectangles with normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testRectJoinNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRectCreateDestroyIntersectJoin(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRectJoinNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRectCreateDestroyIntersectJoin_0500
     * @tc.desc   Test for joining rectangles with NULL parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testRectJoinNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectCreateDestroyIntersectJoin(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRectSetLeftNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRectSetGetLeftTopRightBottom_0100
     * @tc.desc   Test for setting and getting the left coordinate of a rectangle with normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testRectSetLeftNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRectSetGetLeftTopRightBottom(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRectSetLeftNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRectSetGetLeftTopRightBottom_0200
     * @tc.desc   Test for setting the left coordinate of a rectangle with NULL parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testRectSetLeftNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectSetGetLeftTopRightBottom(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRectSetLeftAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRectSetGetLeftTopRightBottom_0300
     * @tc.desc   Test for setting the left coordinate of a rectangle with abnormal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testRectSetLeftAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectSetGetLeftTopRightBottom(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRectSetLeftMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRectSetGetLeftTopRightBottom_0400
     * @tc.desc   Test for repeatedly setting and getting the left coordinate of a rectangle.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testRectSetLeftMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectSetGetLeftTopRightBottom(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRectSetTopNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRectSetGetLeftTopRightBottom_0500
     * @tc.desc   Test for setting and getting the top coordinate of a rectangle with normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testRectSetTopNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRectSetGetLeftTopRightBottom(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRectSetTopNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRectSetGetLeftTopRightBottom_0600
     * @tc.desc   Test for setting the top coordinate of a rectangle with NULL parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testRectSetTopNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectSetGetLeftTopRightBottom(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRectSetTopAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRectSetGetLeftTopRightBottom_0700
     * @tc.desc   Test for setting the top coordinate of a rectangle with abnormal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testRectSetTopAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectSetGetLeftTopRightBottom(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRectSetTopMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRectSetGetLeftTopRightBottom_0800
     * @tc.desc   Test for repeatedly setting and getting the top coordinate of a rectangle.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testRectSetTopMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectSetGetLeftTopRightBottom(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRectSetRightNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRectSetGetLeftTopRightBottom_0900
     * @tc.desc   Test for setting and getting the right coordinate of a rectangle with normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testRectSetRightNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRectSetGetLeftTopRightBottom(8);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRectSetRightNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRectSetGetLeftTopRightBottom_1000
     * @tc.desc   Test for setting the right coordinate of a rectangle with NULL parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testRectSetRightNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectSetGetLeftTopRightBottom(9);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRectSetRightAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRectSetGetLeftTopRightBottom_1100
     * @tc.desc   Test for setting the right coordinate of a rectangle with abnormal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testRectSetRightAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectSetGetLeftTopRightBottom(10);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRectSetRightMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRectSetGetLeftTopRightBottom_1200
     * @tc.desc   Test for repeatedly setting and getting the right coordinate of a rectangle.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testRectSetRightMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectSetGetLeftTopRightBottom(11);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRectSetBottomNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRectSetGetLeftTopRightBottom_1300
     * @tc.desc   Test for setting and getting the bottom coordinate of a rectangle with normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testRectSetBottomNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRectSetGetLeftTopRightBottom(12);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRectSetBottomNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRectSetGetLeftTopRightBottom_1400
     * @tc.desc   Test for setting the bottom coordinate of a rectangle with NULL parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testRectSetBottomNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectSetGetLeftTopRightBottom(13);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRectSetBottomAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRectSetGetLeftTopRightBottom_1500
     * @tc.desc   Test for setting the bottom coordinate of a rectangle with abnormal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testRectSetBottomAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectSetGetLeftTopRightBottom(14);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRectSetBottomMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRectSetGetLeftTopRightBottom_1600
     * @tc.desc   Test for repeatedly setting and getting the bottom coordinate of a rectangle.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testRectSetBottomMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectSetGetLeftTopRightBottom(15);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRectGetLeftNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRectSetGetLeftTopRightBottom_1700
     * @tc.desc   Test for setting and getting the left coordinate of a rectangle with normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testRectGetLeftNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRectSetGetLeftTopRightBottom(16);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRectGetLeftNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRectSetGetLeftTopRightBottom_1800
     * @tc.desc   Test for getting the left coordinate of a rectangle with NULL parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testRectGetLeftNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectSetGetLeftTopRightBottom(17);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRectGetTopNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRectSetGetLeftTopRightBottom_1900
     * @tc.desc   Test for setting and getting the top coordinate of a rectangle with normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testRectGetTopNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRectSetGetLeftTopRightBottom(18);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRectGetTopNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRectSetGetLeftTopRightBottom_2000
     * @tc.desc   Test for getting the top coordinate of a rectangle with NULL parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testRectGetTopNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectSetGetLeftTopRightBottom(19);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRectGetRightNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRectSetGetLeftTopRightBottom_2100
     * @tc.desc   Test for setting and getting the right coordinate of a rectangle with normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testRectGetRightNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRectSetGetLeftTopRightBottom(20);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRectGetRightNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRectSetGetLeftTopRightBottom_2200
     * @tc.desc   Test for getting the right coordinate of a rectangle with NULL parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testRectGetRightNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectSetGetLeftTopRightBottom(21);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRectGetBottomNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRectSetGetLeftTopRightBottom_2300
     * @tc.desc   Test for setting and getting the bottom coordinate of a rectangle with normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testRectGetBottomNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRectSetGetLeftTopRightBottom(22);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRectGetBottomNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRectSetGetLeftTopRightBottom_2400
     * @tc.desc   Test for getting the bottom coordinate of a rectangle with NULL parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testRectGetBottomNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectSetGetLeftTopRightBottom(23);
      expect(result).assertEqual(0);
    })

    // Rect GetWidth/GetHeight related test cases (5 cases)
    /**
     * @tc.name   testRectGetHeightNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRectOtherOperations_0100
     * @tc.desc   Test for setting coordinates and getting the height of a rectangle with normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testRectGetHeightNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRectOtherOperations(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRectGetHeightNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRectOtherOperations_0200
     * @tc.desc   Test for getting the height of a rectangle with NULL parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testRectGetHeightNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectOtherOperations(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRectGetWidthNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRectOtherOperations_0300
     * @tc.desc   Test for setting coordinates and getting the width of a rectangle with normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testRectGetWidthNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRectOtherOperations(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRectGetWidthNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRectOtherOperations_0400
     * @tc.desc   Test for getting the width of a rectangle with NULL parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testRectGetWidthNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectOtherOperations(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRectGetWidthBoundary
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRectOtherOperations_0500
     * @tc.desc   Test for setting coordinates and getting the width of a rectangle with normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testRectGetWidthBoundary', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRectOtherOperations(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRectCopyNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRectCreateDestroyIntersectJoin_0600
     * @tc.desc   Test for copying a rectangle with normal parameters and checking the copied values.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testRectCopyNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRectCreateDestroyIntersectJoin(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRectCopyNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRectCreateDestroyIntersectJoin_0700
     * @tc.desc   Test for copying a rectangle with NULL parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testRectCopyNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectCreateDestroyIntersectJoin(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRectDestroyNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRectCreateDestroyIntersectJoin_0800
     * @tc.desc   Test for creating and destroying a rectangle object with normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testRectDestroyNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRectCreateDestroyIntersectJoin(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRectDestroyNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRectCreateDestroyIntersectJoin_0900
     * @tc.desc   Test for destroying a rectangle object with NULL parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testRectDestroyNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectCreateDestroyIntersectJoin(8);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRectInsetNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRectPart2OtherOperations_0100
     * @tc.desc   Test for testRectInsetNormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testRectInsetNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRectPart2OtherOperations(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRectInsetAbNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRectPart2OtherOperations_0200
     * @tc.desc   Test for testRectInsetAbNormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testRectInsetAbNormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectPart2OtherOperations(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRectInsetNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRectPart2OtherOperations_0300
     * @tc.desc   Test for testRectInsetNull
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testRectInsetNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectPart2OtherOperations(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRectInsetCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRectPart2OtherOperations_0400
     * @tc.desc   Test for testRectInsetCalls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testRectInsetCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectPart2OtherOperations(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRectContainsNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRectPart2OtherOperations_0500
     * @tc.desc   Test for testRectContainsNormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testRectContainsNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRectPart2OtherOperations(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRectContainsNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRectPart2OtherOperations_0600
     * @tc.desc   Test for testRectContainsNull
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testRectContainsNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectPart2OtherOperations(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRectContainsCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRectPart2OtherOperations_0700
     * @tc.desc   Test for testRectContainsCalls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testRectContainsCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectPart2OtherOperations(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRectSetEmptyNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRectPart2OtherOperations_0800
     * @tc.desc   Test for testRectSetEmptyNormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testRectSetEmptyNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRectPart2OtherOperations(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRectSetEmptyNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRectPart2OtherOperations_0900
     * @tc.desc   Test for testRectSetEmptyNull
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testRectSetEmptyNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectPart2OtherOperations(8);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRectSetEmptyMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRectPart2OtherOperations_1000
     * @tc.desc   Test for testRectSetEmptyMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testRectSetEmptyMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectPart2OtherOperations(9);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRectIsEmptyNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRectPart2OtherOperations_1100
     * @tc.desc   Test for testRectIsEmptyNormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testRectIsEmptyNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRectPart2OtherOperations(10);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRectIsEmptyNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRectPart2OtherOperations_1200
     * @tc.desc   Test for testRectIsEmptyNull
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testRectIsEmptyNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectPart2OtherOperations(11);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRectIsEmptyMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRectPart2OtherOperations_1300
     * @tc.desc   Test for testRectIsEmptyMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testRectIsEmptyMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectPart2OtherOperations(12);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRectOffsetNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRectPart2OtherOperations_1400
     * @tc.desc   Test for testRectOffsetNormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testRectOffsetNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRectPart2OtherOperations(13);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRectOffsetNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRectPart2OtherOperations_1500
     * @tc.desc   Test for testRectOffsetNull
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testRectOffsetNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectPart2OtherOperations(14);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRectOffsetAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRectPart2OtherOperations_1600
     * @tc.desc   Test for testRectOffsetAbnormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testRectOffsetAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectPart2OtherOperations(15);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRectOffsetMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRectPart2OtherOperations_1700
     * @tc.desc   Test for testRectOffsetMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testRectOffsetMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectPart2OtherOperations(16);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRectOffsetToNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRectPart2OtherOperations_1800
     * @tc.desc   Test for testRectOffsetToNormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testRectOffsetToNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRectPart2OtherOperations(17);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRectOffsetToNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRectPart2OtherOperations_1900
     * @tc.desc   Test for testRectOffsetToNull
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testRectOffsetToNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectPart2OtherOperations(18);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRectOffsetToAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRectPart2OtherOperations_2000
     * @tc.desc   Test for testRectOffsetToAbnormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testRectOffsetToAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectPart2OtherOperations(19);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRectOffsetToMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRectPart2OtherOperations_2100
     * @tc.desc   Test for testRectOffsetToMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testRectOffsetToMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectPart2OtherOperations(20);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRectSortNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRectPart2OtherOperations_2200
     * @tc.desc   Test for testRectSortNormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testRectSortNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRectPart2OtherOperations(21);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRectSortNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRectPart2OtherOperations_2300
     * @tc.desc   Test for testRectSortNull
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testRectSortNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectPart2OtherOperations(22);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRectSortMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRectPart2OtherOperations_2400
     * @tc.desc   Test for testRectSortMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testRectSortMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectPart2OtherOperations(23);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRectUnionNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRectPart2OtherOperations_2500
     * @tc.desc   Test for testRectUnionNormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testRectUnionNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRectPart2OtherOperations(24);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRectUnionNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRectPart2OtherOperations_2600
     * @tc.desc   Test for testRectUnionNull
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testRectUnionNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectPart2OtherOperations(25);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRectUnionMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRectPart2OtherOperations_2700
     * @tc.desc   Test for testRectUnionMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testRectUnionMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectPart2OtherOperations(26);
      expect(result).assertEqual(0);
    })
  })
}