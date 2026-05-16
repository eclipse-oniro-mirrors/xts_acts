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


export default function DrawingNativeImageFilterTest() {
  describe('DrawingNativeImageFilterTest', () => {
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
     * @tc.name   testImageFilterCreateBlurNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingImageFilter_0100
     * @tc.desc   Test for creating a blur image filter with normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testImageFilterCreateBlurNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingImageFilter(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testImageFilterCreateBlurNULL
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingImageFilter_0200
     * @tc.desc   Test for creating a blur image filter with NULL parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testImageFilterCreateBlurNULL', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingImageFilter(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testImageFilterCreateBlurMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingImageFilter_0300
     * @tc.desc   Test for multiple calls of creating a blur image filter.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testImageFilterCreateBlurMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingImageFilter(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testImageFilterCreateBlurAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingImageFilter_0400
     * @tc.desc   Test for creating a blur image filter with abnormal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testImageFilterCreateBlurAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingImageFilter(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testImageFilterCreateBlurMaximum
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingImageFilter_0500
     * @tc.desc   Test for creating a blur image filter with maximum values.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testImageFilterCreateBlurMaximum', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingImageFilter(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testImageFilterCreateFromColorFilterNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingImageFilter_0600
     * @tc.desc   Test for creating an image filter from a color filter with normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testImageFilterCreateFromColorFilterNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingImageFilter(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testImageFilterCreateFromColorFilterNULL
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingImageFilter_0700
     * @tc.desc   Test for creating an image filter from a color filter with NULL parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testImageFilterCreateFromColorFilterNULL', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingImageFilter(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testImageFilterCreateFromColorFilterMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingImageFilter_0800
     * @tc.desc   Test for multiple calls of creating an image filter from a color filter.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testImageFilterCreateFromColorFilterMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingImageFilter(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testImageFilterDestroyNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingImageFilter_0900
     * @tc.desc   Test for destroying an image filter with normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testImageFilterDestroyNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingImageFilter(8);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testImageFilterDestroyNULL
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingImageFilter_1000
     * @tc.desc   Test for destroying an image filter with NULL parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testImageFilterDestroyNULL', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingImageFilter(9);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testImageFilterDestroyMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingImageFilter_1100
     * @tc.desc   Test for multiple calls of destroying an image filter.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testImageFilterDestroyMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingImageFilter(10);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testImageFilterCreateOffsetNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingImageFilter_1200
     * @tc.desc   test for testImageFilterCreateOffsetNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testImageFilterCreateOffsetNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingImageFilter(11);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testImageFilterCreateOffsetNULL
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingImageFilter_1300
     * @tc.desc   test for testImageFilterCreateOffsetNULL.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testImageFilterCreateOffsetNULL', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingImageFilter(12);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testImageFilterCreateOffsetAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingImageFilter_1400
     * @tc.desc   test for testImageFilterCreateOffsetAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testImageFilterCreateOffsetAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingImageFilter(13);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testImageFilterCreateOffsetMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingImageFilter_1500
     * @tc.desc   test for testImageFilterCreateOffsetMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testImageFilterCreateOffsetMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingImageFilter(14);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testImageFilterCreateFromShderEffectNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingImageFilter_1600
     * @tc.desc   test for testImageFilterCreateFromShderEffectNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testImageFilterCreateFromShderEffectNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingImageFilter(15);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testImageFilterCreateFromShderEffectNULL
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingImageFilter_1700
     * @tc.desc   test for testImageFilterCreateFromShderEffectNULL.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testImageFilterCreateFromShderEffectNULL', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingImageFilter(16);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testImageFilterCreateFromShderEffectMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingImageFilter_1800
     * @tc.desc   test for testImageFilterCreateFromShderEffectMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testImageFilterCreateFromShderEffectMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingImageFilter(17);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testImageFilterCreateBlurWithCropNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingImageFilter_1900
     * @tc.desc   test for testImageFilterCreateBlurWithCropNormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testImageFilterCreateBlurWithCropNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingImageFilter(18);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testImageFilterCreateBlurWithCropNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingImageFilter_2000
     * @tc.desc   test for testImageFilterCreateBlurWithCropNull
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testImageFilterCreateBlurWithCropNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingImageFilter(19);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testImageFilterCreateBlurWithCropMultiCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingImageFilter_2100
     * @tc.desc   test for testImageFilterCreateBlurWithCropMultiCalls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testImageFilterCreateBlurWithCropMultiCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingImageFilter(20);
      expect(result).assertEqual(0);
    })
  })
}