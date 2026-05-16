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


export default function DrawingNativeRegionTest() {
  describe('DrawingNativeRegionTest', () => {
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
     * @tc.name   testRegionCreateNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRegionBasicOperations_0100
     * @tc.desc   test for testRegionCreateNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testRegionCreateNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRegionBasicOperations(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRegionCreateMoreTimes
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRegionBasicOperations_0200
     * @tc.desc   test for testRegionCreateMoreTimes.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testRegionCreateMoreTimes', Level.LEVEL1, () => {
      const result = libDrawingNative.DrawingRegionBasicOperations(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRegionDestroyNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRegionBasicOperations_0300
     * @tc.desc   test for testRegionDestroyNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testRegionDestroyNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRegionBasicOperations(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRegionDestroyNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRegionBasicOperations_0400
     * @tc.desc   test for testRegionDestroyNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testRegionDestroyNull', Level.LEVEL1, () => {
      const result = libDrawingNative.DrawingRegionBasicOperations(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRegionContainsInRange
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRegionQueryOperations_0100
     * @tc.desc   test for testRegionContainsInRange.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testRegionContainsInRange', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRegionQueryOperations(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRegionContainsXvalueNotInRange
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRegionQueryOperations_0200
     * @tc.desc   test for testRegionContainsXvalueNotInRange.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testRegionContainsXvalueNotInRange', Level.LEVEL1, () => {
      const result = libDrawingNative.DrawingRegionQueryOperations(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRegionContainsYvalueNotInRange
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRegionQueryOperations_0300
     * @tc.desc   test for testRegionContainsYvalueNotInRange.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testRegionContainsYvalueNotInRange', Level.LEVEL1, () => {
      const result = libDrawingNative.DrawingRegionQueryOperations(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRegionContainsAllNotInRange
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRegionQueryOperations_0400
     * @tc.desc   test for testRegionContainsAllNotInRange.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testRegionContainsAllNotInRange', Level.LEVEL1, () => {
      const result = libDrawingNative.DrawingRegionQueryOperations(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRegionContainsRegionNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRegionQueryOperations_0500
     * @tc.desc   test for testRegionContainsRegionNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testRegionContainsRegionNull', Level.LEVEL1, () => {
      const result = libDrawingNative.DrawingRegionQueryOperations(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRegionOpNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRegionBasicOperations_0500
     * @tc.desc   test for testRegionOpNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testRegionOpNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRegionBasicOperations(15);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRegionOpRegionNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRegionBasicOperations_0600
     * @tc.desc   test for testRegionOpRegionNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testRegionOpRegionNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRegionBasicOperations(16);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRegionOpMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRegionBasicOperations_0700
     * @tc.desc   test for testRegionOpMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testRegionOpMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRegionBasicOperations(17);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRegionSetRectResultTrue
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRegionBasicOperations_0800
     * @tc.desc   test for testRegionSetRectResultTrue.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testRegionSetRectResultTrue', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRegionBasicOperations(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRegionSetRectRegionNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRegionBasicOperations_0900
     * @tc.desc   test for testRegionSetRectRegionNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testRegionSetRectRegionNull', Level.LEVEL1, () => {
      const result = libDrawingNative.DrawingRegionBasicOperations(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRegionSetRectRectNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRegionBasicOperations_1000
     * @tc.desc   test for testRegionSetRectRectNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testRegionSetRectRectNull', Level.LEVEL1, () => {
      const result = libDrawingNative.DrawingRegionBasicOperations(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRegionSetRectResultFalse
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRegionBasicOperations_1100
     * @tc.desc   test for testRegionSetRectResultFalse.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testRegionSetRectResultFalse', Level.LEVEL1, () => {
      const result = libDrawingNative.DrawingRegionBasicOperations(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRegionSetPathResultTrue
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRegionBasicOperations_1200
     * @tc.desc   test for testRegionSetPathResultTrue.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testRegionSetPathResultTrue', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRegionBasicOperations(8);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRegionSetPathRegionNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRegionBasicOperations_1300
     * @tc.desc   test for testRegionSetPathRegionNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testRegionSetPathRegionNull', Level.LEVEL1, () => {
      const result = libDrawingNative.DrawingRegionBasicOperations(9);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRegionSetPathResultFalse
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRegionBasicOperations_1400
     * @tc.desc   test for testRegionSetPathResultFalse.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testRegionSetPathResultFalse', Level.LEVEL1, () => {
      const result = libDrawingNative.DrawingRegionBasicOperations(10);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRegionCopyNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRegionBasicOperations_1500
     * @tc.desc   test for testRegionCopyNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testRegionCopyNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRegionBasicOperations(11);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRegionCopyNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRegionBasicOperations_1600
     * @tc.desc   test for testRegionCopyNull
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testRegionCopyNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRegionBasicOperations(12);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRegionCopyAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRegionBasicOperations_1700
     * @tc.desc   test for testRegionCopyAbnormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testRegionCopyAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRegionBasicOperations(13);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRegionCopyMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRegionBasicOperations_1800
     * @tc.desc   test for testRegionCopyMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testRegionCopyMultipleCalls', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRegionBasicOperations(14);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRegionEmptyNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRegionPart2QueryOperations_0100
     * @tc.desc   test for testRegionEmptyNormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testRegionEmptyNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRegionPart2QueryOperations(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRegionEmptyNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRegionPart2QueryOperations_0200
     * @tc.desc   test for testRegionEmptyNull
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testRegionEmptyNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRegionPart2QueryOperations(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRegionEmptyCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRegionPart2QueryOperations_0300
     * @tc.desc   test for testRegionEmptyCalls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testRegionEmptyCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRegionPart2QueryOperations(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRegionGetBoundaryNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRegionPart2QueryOperations_0400
     * @tc.desc   test for testRegionGetBoundaryNormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testRegionGetBoundaryNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRegionPart2QueryOperations(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRegionGetBoundaryNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRegionPart2QueryOperations_0500
     * @tc.desc   test for testRegionGetBoundaryNull
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testRegionGetBoundaryNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRegionPart2QueryOperations(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRegionGetBoundaryMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRegionPart2QueryOperations_0600
     * @tc.desc   test for testRegionGetBoundaryMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testRegionGetBoundaryMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRegionPart2QueryOperations(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRegionGetBoundsNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRegionPart2QueryOperations_0700
     * @tc.desc   test for testRegionGetBoundsNormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testRegionGetBoundsNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRegionPart2QueryOperations(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRegionGetBoundsNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRegionPart2QueryOperations_0800
     * @tc.desc   test for testRegionGetBoundsNull
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testRegionGetBoundsNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRegionPart2QueryOperations(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRegionGetBoundsMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRegionPart2QueryOperations_0900
     * @tc.desc   test for testRegionGetBoundsMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testRegionGetBoundsMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRegionPart2QueryOperations(8);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRegionIsComplexNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRegionPart2QueryOperations_1000
     * @tc.desc   test for testRegionIsComplexNormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testRegionIsComplexNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRegionPart2QueryOperations(9);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRegionIsComplexNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRegionPart2QueryOperations_1100
     * @tc.desc   test for testRegionIsComplexNull
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testRegionIsComplexNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRegionPart2QueryOperations(10);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRegionIsComplexMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRegionPart2QueryOperations_1200
     * @tc.desc   test for testRegionIsComplexMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testRegionIsComplexMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRegionPart2QueryOperations(11);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRegionIsEmptyNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRegionPart2QueryOperations_1300
     * @tc.desc   test for testRegionIsEmptyNormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testRegionIsEmptyNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRegionPart2QueryOperations(12);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRegionIsEmptyNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRegionPart2QueryOperations_1400
     * @tc.desc   test for testRegionIsEmptyNull
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testRegionIsEmptyNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRegionPart2QueryOperations(13);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRegionIsEmptyMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRegionPart2QueryOperations_1500
     * @tc.desc   test for testRegionIsEmptyMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testRegionIsEmptyMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRegionPart2QueryOperations(14);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRegionIsRectNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRegionPart2QueryOperations_1600
     * @tc.desc   test for testRegionIsRectNormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testRegionIsRectNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRegionPart2QueryOperations(15);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRegionIsRectNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRegionPart2QueryOperations_1700
     * @tc.desc   test for testRegionIsRectNull
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testRegionIsRectNull', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRegionPart2QueryOperations(16);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRegionIsRectMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRegionPart2QueryOperations_1800
     * @tc.desc   test for testRegionIsRectMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testRegionIsRectMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRegionPart2QueryOperations(17);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRegionQuickContainsNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRegionAdvancedOperations_0100
     * @tc.desc   test for testRegionQuickContainsNormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testRegionQuickContainsNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRegionAdvancedOperations(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRegionQuickContainsNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRegionAdvancedOperations_0200
     * @tc.desc   test for testRegionQuickContainsNull
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testRegionQuickContainsNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRegionAdvancedOperations(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRegionQuickContainsAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRegionAdvancedOperations_0300
     * @tc.desc   test for testRegionQuickContainsAbnormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testRegionQuickContainsAbnormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRegionAdvancedOperations(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRegionQuickContainsMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRegionAdvancedOperations_0400
     * @tc.desc   test for testRegionQuickContainsMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testRegionQuickContainsMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRegionAdvancedOperations(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRegionQuickRejectNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRegionAdvancedOperations_0500
     * @tc.desc   test for testRegionQuickRejectNormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testRegionQuickRejectNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRegionAdvancedOperations(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRegionQuickRejectNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRegionAdvancedOperations_0600
     * @tc.desc   test for testRegionQuickRejectNull
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testRegionQuickRejectNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRegionAdvancedOperations(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRegionQuickRejectAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRegionAdvancedOperations_0700
     * @tc.desc   test for testRegionQuickRejectAbnormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testRegionQuickRejectAbnormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRegionAdvancedOperations(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRegionQuickRejectMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRegionAdvancedOperations_0800
     * @tc.desc   test for testRegionQuickRejectMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testRegionQuickRejectMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRegionAdvancedOperations(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testRegionTranslateNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRegionAdvancedOperations_0900
     * @tc.desc   test for testRegionTranslateNormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testRegionTranslateNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRegionAdvancedOperations(8);
      expect(result).assertEqual(0);
    })
    /**
     * @tc.name   testRegionTranslateNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRegionAdvancedOperations_1000
     * @tc.desc   test for testRegionTranslateNull
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testRegionTranslateNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRegionAdvancedOperations(9);
      expect(result).assertEqual(0);
    })
    /**
     * @tc.name   testRegionTranslateMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingRegionAdvancedOperations_1100
     * @tc.desc   test for testRegionTranslateMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testRegionTranslateMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRegionAdvancedOperations(10);
      expect(result).assertEqual(0);
    })
  })
}