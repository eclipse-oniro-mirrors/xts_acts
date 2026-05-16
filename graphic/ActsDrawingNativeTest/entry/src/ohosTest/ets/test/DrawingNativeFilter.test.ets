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


export default function DrawingNativeFilterTest() {
  describe('DrawingNativeFilterTest', () => {
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
     * @tc.name   testFilterCreateDestroyNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFilterCreateDestroy_0100
     * @tc.desc   Test for creating and destroying a filter with normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testFilterCreateDestroyNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFilterCreateDestroy(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFilterCreateDestroyNULL
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFilterCreateDestroy_0200
     * @tc.desc   Test for destroying a filter with NULL parameter.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFilterCreateDestroyNULL', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFilterCreateDestroy(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFilterCreateDestroyMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFilterCreateDestroy_0300
     * @tc.desc   Test for creating and destroying a filter multiple times and in loops.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFilterCreateDestroyMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFilterCreateDestroy(2);
      expect(result).assertEqual(0);
    })

    // Filter SetImageFilter related test cases
    /**
     * @tc.name   testFilterSetImageFilterNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFilterSetImageFilter_0100
     * @tc.desc   Test for setting an image filter with normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testFilterSetImageFilterNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFilterSetImageFilter(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFilterSetImageFilterNULL
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFilterSetImageFilter_0200
     * @tc.desc   Test for setting an image filter with NULL parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFilterSetImageFilterNULL', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFilterSetImageFilter(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFilterSetImageFilterMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFilterSetImageFilter_0300
     * @tc.desc   Test for setting an image filter multiple times with different objects.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFilterSetImageFilterMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFilterSetImageFilter(2);
      expect(result).assertEqual(0);
    })

    // Filter SetMaskFilter related test cases
    /**
     * @tc.name   testFilterSetMaskFilterNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFilterSetMaskFilter_0100
     * @tc.desc   Test for setting a mask filter with normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testFilterSetMaskFilterNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFilterSetMaskFilter(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFilterSetMaskFilterNULL
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFilterSetMaskFilter_0200
     * @tc.desc   Test for setting a mask filter with NULL parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFilterSetMaskFilterNULL', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFilterSetMaskFilter(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFilterSetMaskFilterMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFilterSetMaskFilter_0300
     * @tc.desc   Test for setting a mask filter multiple times with different objects.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFilterSetMaskFilterMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFilterSetMaskFilter(2);
      expect(result).assertEqual(0);
    })

    // Filter SetColorFilter related test cases
    /**
     * @tc.name   testFilterSetColorFilterNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFilterSetColorFilter_0100
     * @tc.desc   Test for setting a color filter with normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testFilterSetColorFilterNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFilterSetColorFilter(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFilterSetColorFilterNULL
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFilterSetColorFilter_0200
     * @tc.desc   Test for setting a color filter with NULL parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFilterSetColorFilterNULL', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFilterSetColorFilter(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFilterSetColorFilterMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFilterSetColorFilter_0300
     * @tc.desc   Test for setting a color filter multiple times with different objects.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFilterSetColorFilterMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFilterSetColorFilter(2);
      expect(result).assertEqual(0);
    })
  })
}