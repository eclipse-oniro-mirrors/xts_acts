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


export default function DrawingNativeColorSpaceTest() {
  describe('DrawingNativeColorSpaceTest', () => {
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
     * @tc.name   testColorSpaceCreateSrgbNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingColorSpaceCreateSrgb_0100
     * @tc.desc   Test for creating an sRGB color space with normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testColorSpaceCreateSrgbNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingColorSpaceCreateSrgb(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testColorSpaceDestroyNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingColorSpaceDestroy_0100
     * @tc.desc   Test for destroying a color space with a NULL parameter.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testColorSpaceDestroyNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingColorSpaceDestroy(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testColorSpaceCreateSrgbMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingColorSpaceCreateSrgb_0200
     * @tc.desc   Test for creating an sRGB color space with multiple calls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testColorSpaceCreateSrgbMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingColorSpaceCreateSrgb(1);
      expect(result).assertEqual(0);
    })

    // ColorSpace CreateSrgbLinear related test cases
    /**
     * @tc.name   testColorSpaceCreateSrgbLinearNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingColorSpaceCreateSrgbLinear_0100
     * @tc.desc   Test for creating an sRGB linear color space with normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testColorSpaceCreateSrgbLinearNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingColorSpaceCreateSrgbLinear(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testColorSpaceCreateSrgbLinearMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingColorSpaceCreateSrgbLinear_0200
     * @tc.desc   Test for creating an sRGB linear color space with multiple calls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testColorSpaceCreateSrgbLinearMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingColorSpaceCreateSrgbLinear(1);
      expect(result).assertEqual(0);
    })
  })
}