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


export default function DrawingNativeMaskFilterTest() {
  describe('DrawingNativeMaskFilterTest', () => {
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
     * @tc.name   testMaskFilterCreateBlurDestroyNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMaskFilter_0100
     * @tc.desc   Test for creating and destroying a blur mask filter with normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testMaskFilterCreateBlurDestroyNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingMaskFilter(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMaskFilterCreateBlurDestroyNULL
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMaskFilter_0200
     * @tc.desc   Test for creating and destroying a blur mask filter with NULL parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMaskFilterCreateBlurDestroyNULL', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMaskFilter(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMaskFilterCreateBlurDestroyMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMaskFilter_0300
     * @tc.desc   Test for multiple calls of creating and destroying a blur mask filter.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMaskFilterCreateBlurDestroyMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMaskFilter(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMaskFilterCreateBlurDestroyAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMaskFilter_0400
     * @tc.desc   Test for creating and destroying a blur mask filter with abnormal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMaskFilterCreateBlurDestroyAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMaskFilter(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMaskFilterCreateBlurDestroyMaximum
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMaskFilter_0500
     * @tc.desc   Test for creating and destroying a blur mask filter with maximum values.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMaskFilterCreateBlurDestroyMaximum', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMaskFilter(4);
      expect(result).assertEqual(0);
    })
  })
}