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


export default function DrawingNativeColorFilterTest() {
  describe('DrawingNativeColorFilterTest', () => {
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
     * @tc.name   testColorFilterCreateBlendModeNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingColorFilterCreateBlendMode_0100
     * @tc.desc   test for testColorFilterCreateBlendModeNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testColorFilterCreateBlendModeNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingColorFilterCreateBlendMode(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testColorFilterCreateBlendModeNULL
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingColorFilterCreateBlendMode_0200
     * @tc.desc   test for testColorFilterCreateBlendModeNULL.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testColorFilterCreateBlendModeNULL', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingColorFilterCreateBlendMode(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testColorFilterCreateBlendModeMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingColorFilterCreateBlendMode_0300
     * @tc.desc   test for testColorFilterCreateBlendModeMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testColorFilterCreateBlendModeMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingColorFilterCreateBlendMode(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testColorFilterCreateBlendModeAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingColorFilterCreateBlendMode_0400
     * @tc.desc   test for testColorFilterCreateBlendModeAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testColorFilterCreateBlendModeAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingColorFilterCreateBlendMode(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testColorFilterCreateBlendModeMaximum
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingColorFilterCreateBlendMode_0500
     * @tc.desc   test for testColorFilterCreateBlendModeMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testColorFilterCreateBlendModeMaximum', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingColorFilterCreateBlendMode(4);
      expect(result).assertEqual(0);
    })

    // ColorFilter CreateCompose related test cases
    /**
     * @tc.name   testColorFilterCreateComposeNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingColorFilterCreateCompose_0100
     * @tc.desc   test for testColorFilterCreateComposeNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testColorFilterCreateComposeNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingColorFilterCreateCompose(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testColorFilterCreateComposeNULL
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingColorFilterCreateCompose_0200
     * @tc.desc   test for testColorFilterCreateComposeNULL.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testColorFilterCreateComposeNULL', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingColorFilterCreateCompose(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testColorFilterCreateComposeMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingColorFilterCreateCompose_0300
     * @tc.desc   test for testColorFilterCreateComposeMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testColorFilterCreateComposeMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingColorFilterCreateCompose(2);
      expect(result).assertEqual(0);
    })

    // ColorFilter CreateMatrix related test cases
    /**
     * @tc.name   testColorFilterCreateMatrixNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingColorFilterCreateMatrix_0100
     * @tc.desc   test for testColorFilterCreateMatrixNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testColorFilterCreateMatrixNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingColorFilterCreateMatrix(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testColorFilterCreateMatrixNULL
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingColorFilterCreateMatrix_0200
     * @tc.desc   test for testColorFilterCreateMatrixNULL.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testColorFilterCreateMatrixNULL', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingColorFilterCreateMatrix(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testColorFilterCreateMatrixAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingColorFilterCreateMatrix_0300
     * @tc.desc   test for testColorFilterCreateMatrixAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testColorFilterCreateMatrixAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingColorFilterCreateMatrix(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testColorFilterCreateMatrixMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingColorFilterCreateMatrix_0400
     * @tc.desc   test for testColorFilterCreateMatrixMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testColorFilterCreateMatrixMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingColorFilterCreateMatrix(3);
      expect(result).assertEqual(0);
    })

    // ColorFilter CreateLinearToSrgbGamma related test cases
    /**
     * @tc.name   testColorFilterCreateLinearToSrgbGammaNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingColorFilterCreateLinearToSrgbGamma_0100
     * @tc.desc   test for testColorFilterCreateLinearToSrgbGammaNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testColorFilterCreateLinearToSrgbGammaNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingColorFilterCreateLinearToSrgbGamma(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testColorFilterCreateLinearToSrgbGammaMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingColorFilterCreateLinearToSrgbGamma_0200
     * @tc.desc   test for testColorFilterCreateLinearToSrgbGammaMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testColorFilterCreateLinearToSrgbGammaMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingColorFilterCreateLinearToSrgbGamma(1);
      expect(result).assertEqual(0);
    })

    // ColorFilter CreateSrgbGammaToLinear related test cases
    /**
     * @tc.name   testColorFilterCreateSrgbGammaToLinearNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingColorFilterCreateSrgbGammaToLinear_0100
     * @tc.desc   test for testColorFilterCreateSrgbGammaToLinearNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testColorFilterCreateSrgbGammaToLinearNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingColorFilterCreateSrgbGammaToLinear(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testColorFilterCreateSrgbGammaToLinearMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingColorFilterCreateSrgbGammaToLinear_0200
     * @tc.desc   test for testColorFilterCreateSrgbGammaToLinearMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testColorFilterCreateSrgbGammaToLinearMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingColorFilterCreateSrgbGammaToLinear(1);
      expect(result).assertEqual(0);
    })

    // ColorFilter CreateLuma related test cases
    /**
     * @tc.name   testColorFilterCreateLumaNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingColorFilterCreateLuma_0100
     * @tc.desc   test for testColorFilterCreateLumaNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testColorFilterCreateLumaNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingColorFilterCreateLuma(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testColorFilterCreateLumaMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingColorFilterCreateLuma_0200
     * @tc.desc   test for testColorFilterCreateLumaMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testColorFilterCreateLumaMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingColorFilterCreateLuma(1);
      expect(result).assertEqual(0);
    })

    // ColorFilter Destroy related test cases
    /**
     * @tc.name   testColorFilterDestroyNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingColorFilterDestroy_0100
     * @tc.desc   test for testColorFilterDestroyNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testColorFilterDestroyNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingColorFilterDestroy(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testColorFilterDestroyNULL
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingColorFilterDestroy_0200
     * @tc.desc   test for testColorFilterDestroyNULL.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testColorFilterDestroyNULL', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingColorFilterDestroy(1);
      expect(result).assertEqual(0);
    })

    // ColorFilter CreateLighting related test cases
    /**
     * @tc.name   testColorFilterCreateLightingNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingColorFilterCreateLighting_0100
     * @tc.desc   test for testColorFilterCreateLightingNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testColorFilterCreateLightingNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingColorFilterCreateLighting(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testColorFilterCreateLightingNULL
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingColorFilterCreateLighting_0200
     * @tc.desc   test for testColorFilterCreateLightingNULL.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testColorFilterCreateLightingNULL', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingColorFilterCreateLighting(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testColorFilterCreateLightingAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingColorFilterCreateLighting_0300
     * @tc.desc   test for testColorFilterCreateLightingAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testColorFilterCreateLightingAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingColorFilterCreateLighting(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testColorFilterCreateLightingMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingColorFilterCreateLighting_0400
     * @tc.desc   test for testColorFilterCreateLightingMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testColorFilterCreateLightingMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingColorFilterCreateLighting(3);
      expect(result).assertEqual(0);
    })
  })
}