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


export default function DrawingNativeBrushTest() {
  describe('DrawingNativeBrushTest', () => {
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
     * @tc.name   testBrushCreateNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingBrushCreateDestroy_0100
     * @tc.desc   test for testBrushCreateNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testBrushCreateNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingBrushCreateDestroy(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBrushCopyNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingBrushCreateDestroy_0200
     * @tc.desc   test for testBrushCopyNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testBrushCopyNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingBrushCreateDestroy(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBrushCopyNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingBrushCreateDestroy_0300
     * @tc.desc   test for testBrushCopyNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testBrushCopyNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingBrushCreateDestroy(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBrushCopyInputDestroyed
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingBrushCreateDestroy_0400
     * @tc.desc   test for testBrushCopyInputDestroyed.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testBrushCopyInputDestroyed', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingBrushCreateDestroy(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBrushCopyMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingBrushCreateDestroy_0500
     * @tc.desc   test for testBrushCopyMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testBrushCopyMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingBrushCreateDestroy(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBrushDestroyNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingBrushCreateDestroy_0600
     * @tc.desc   test for testBrushDestroyNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testBrushDestroyNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingBrushCreateDestroy(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBrushDestroyNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingBrushCreateDestroy_0700
     * @tc.desc   test for testBrushDestroyNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testBrushDestroyNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingBrushCreateDestroy(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBrushIsAntiAliasNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingBrushAntiAlias_0100
     * @tc.desc   test for testBrushIsAntiAliasNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testBrushIsAntiAliasNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingBrushAntiAlias(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBrushIsAntiAliasNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingBrushAntiAlias_0200
     * @tc.desc   test for testBrushIsAntiAliasNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testBrushIsAntiAliasNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingBrushAntiAlias(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBrushSetAntiAliasNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingBrushAntiAlias_0300
     * @tc.desc   test for testBrushSetAntiAliasNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testBrushSetAntiAliasNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingBrushAntiAlias(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBrushSetAntiAliasNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingBrushAntiAlias_0400
     * @tc.desc   test for testBrushSetAntiAliasNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testBrushSetAntiAliasNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingBrushAntiAlias(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBrushGetColorNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingBrushColor_0100
     * @tc.desc   Test for testBrushGetColorNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testBrushGetColorNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingBrushColor(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBrushGetColorNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingBrushColor_0200
     * @tc.desc   Test for testBrushGetColorNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testBrushGetColorNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingBrushColor(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBrushSetColorNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingBrushColor_0300
     * @tc.desc   Test for testBrushSetColorNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testBrushSetColorNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingBrushColor(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBrushSetColorNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingBrushColor_0400
     * @tc.desc   Test for testBrushSetColorNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testBrushSetColorNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingBrushColor(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBrushSetColorAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingBrushColor_0500
     * @tc.desc   Test for testBrushSetColorAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testBrushSetColorAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingBrushColor(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBrushSetColorMaximum
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingBrushColor_0600
     * @tc.desc   Test for testBrushSetColorMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testBrushSetColorMaximum', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingBrushColor(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBrushGetAlphaNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingBrushAlpha_0100
     * @tc.desc   Test for testBrushGetAlphaNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testBrushGetAlphaNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingBrushAlpha(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBrushGetAlphaNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingBrushAlpha_0200
     * @tc.desc   Test for testBrushGetAlphaNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testBrushGetAlphaNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingBrushAlpha(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBrushSetAlphaNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingBrushAlpha_0300
     * @tc.desc   Test for testBrushSetAlphaNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testBrushSetAlphaNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingBrushAlpha(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBrushSetAlphaNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingBrushAlpha_0400
     * @tc.desc   Test for testBrushSetAlphaNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testBrushSetAlphaNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingBrushAlpha(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBrushSetAlphaAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingBrushAlpha_0500
     * @tc.desc   Test for testBrushSetAlphaAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testBrushSetAlphaAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingBrushAlpha(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBrushSetAlphaMaximum
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingBrushAlpha_0600
     * @tc.desc   Test for testBrushSetAlphaMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testBrushSetAlphaMaximum', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingBrushAlpha(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBrushSetShaderEffectNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingBrushShaderEffect_0100
     * @tc.desc   Test for testBrushSetShaderEffectNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testBrushSetShaderEffectNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingBrushShaderEffect(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBrushSetShaderEffectNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingBrushShaderEffect_0200
     * @tc.desc   Test for testBrushSetShaderEffectNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testBrushSetShaderEffectNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingBrushShaderEffect(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBrushSetShadowLayerNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingBrushShadowLayer_0100
     * @tc.desc   Test for testBrushSetShadowLayerNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testBrushSetShadowLayerNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingBrushShadowLayer(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBrushSetShadowLayerNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingBrushShadowLayer_0200
     * @tc.desc   Test for testBrushSetShadowLayerNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testBrushSetShadowLayerNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingBrushShadowLayer(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBrushSetFilterNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingBrushFilter_0100
     * @tc.desc   Test for testBrushSetFilterNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testBrushSetFilterNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingBrushFilter(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBrushSetFilterNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingBrushFilter_0200
     * @tc.desc   Test for testBrushSetFilterNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testBrushSetFilterNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingBrushFilter(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBrushGetFilterNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingBrushFilter_0300
     * @tc.desc   Test for testBrushGetFilterNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testBrushGetFilterNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingBrushFilter(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBrushGetFilterNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingBrushFilter_0400
     * @tc.desc   Test for testBrushGetFilterNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testBrushGetFilterNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingBrushFilter(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBrushSetBlendModeNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingBrushBlendMode_0100
     * @tc.desc   Test for testBrushSetBlendModeNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testBrushSetBlendModeNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingBrushBlendMode(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBrushSetBlendModeNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingBrushBlendMode_0200
     * @tc.desc   Test for testBrushSetBlendModeNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testBrushSetBlendModeNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingBrushBlendMode(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBrushResetNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingBrushReset_0100
     * @tc.desc   Test for testBrushResetNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testBrushResetNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingBrushReset(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBrushResetNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingBrushReset_0200
     * @tc.desc   Test for testBrushResetNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testBrushResetNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingBrushReset(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBrushGetAlphaFloatNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingBrushGetFloat_0100
     * @tc.desc   Test for testBrushGetAlphaFloatNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBrushGetAlphaFloatNormal', Level.LEVEL2, () => {
      const result = libDrawingNative.DrawingBrushGetFloat(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBrushGetAlphaFloatAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingBrushGetFloat_0200
     * @tc.desc   Test for testBrushGetAlphaFloatAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testBrushGetAlphaFloatAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingBrushGetFloat(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBrushGetRedFloatNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingBrushGetFloat_0300
     * @tc.desc   Test for testBrushGetRedFloatNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBrushGetRedFloatNormal', Level.LEVEL2, () => {
      const result = libDrawingNative.DrawingBrushGetFloat(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBrushGetRedFloatAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingBrushGetFloat_0400
     * @tc.desc   Test for testBrushGetRedFloatAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testBrushGetRedFloatAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingBrushGetFloat(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBrushGetGreenFloatNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingBrushGetFloat_0500
     * @tc.desc   Test for testBrushGetGreenFloatNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBrushGetGreenFloatNormal', Level.LEVEL2, () => {
      const result = libDrawingNative.DrawingBrushGetFloat(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBrushGetGreenFloatAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingBrushGetFloat_0600
     * @tc.desc   Test for testBrushGetGreenFloatAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testBrushGetGreenFloatAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingBrushGetFloat(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBrushGetBlueFloatNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingBrushGetFloat_0700
     * @tc.desc   Test for testBrushGetBlueFloatNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBrushGetBlueFloatNormal', Level.LEVEL2, () => {
      const result = libDrawingNative.DrawingBrushGetFloat(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBrushGetBlueFloatAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingBrushGetFloat_0800
     * @tc.desc   Test for testBrushGetBlueFloatAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testBrushGetBlueFloatAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingBrushGetFloat(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBrushSetColor4fNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingBrushSetColor4f_0100
     * @tc.desc   Test for testBrushSetColor4fNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBrushSetColor4fNormal', Level.LEVEL2, () => {
      const result = libDrawingNative.DrawingBrushSetColor4f(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBrushSetColor4fNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingBrushSetColor4f_0200
     * @tc.desc   Test for testBrushSetColor4fNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testBrushSetColor4fNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingBrushSetColor4f(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testBrushSetColor4fAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingBrushSetColor4f_0300
     * @tc.desc   Test for testBrushSetColor4fAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testBrushSetColor4fAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingBrushSetColor4f(2);
      expect(result).assertEqual(0);
    })
  })
}