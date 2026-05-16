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


export default function DrawingNativeFontTest() {
  describe('DrawingNativeFontTest', () => {
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
     * @tc.name   testFontCreateDestroyNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontCreateDestroy_0100
     * @tc.desc   Test for creating and destroying a font object with normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testFontCreateDestroyNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontCreateDestroy(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontCreateDestroyNULL
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontCreateDestroy_0200
     * @tc.desc   test for testFontCreateDestroyNULL.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFontCreateDestroyNULL', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontCreateDestroy(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontCreateDestroyMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontCreateDestroy_0300
     * @tc.desc   test for testFontCreateDestroyMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFontCreateDestroyMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontCreateDestroy(2);
      expect(result).assertEqual(0);
    })

    // Font SetBaselineSnap related test cases
    /**
     * @tc.name   testFontSetBaselineSnapNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontSetBaselineSnap_0100
     * @tc.desc   test for testFontSetBaselineSnapNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testFontSetBaselineSnapNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontSetBaselineSnap(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontSetBaselineSnapNULL
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontSetBaselineSnap_0200
     * @tc.desc   test for testFontSetBaselineSnapNULL.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFontSetBaselineSnapNULL', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetBaselineSnap(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontSetBaselineSnapMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontSetBaselineSnap_0300
     * @tc.desc   test for testFontSetBaselineSnapMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFontSetBaselineSnapMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetBaselineSnap(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontIsBaselineSnapWhenNoSet
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontSetBaselineSnap_0400
     * @tc.desc   test for testFontIsBaselineSnapWhenNoSet.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testFontIsBaselineSnapWhenNoSet', Level.LEVEL2, () => {
      const result = libDrawingNative.DrawingFontSetBaselineSnap(3);
      expect(result).assertEqual(0);
    })

    // Font SetSubpixel related test cases
    /**
     * @tc.name   testFontSetSubpixelNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontSetSubpixel_0100
     * @tc.desc   test for testFontSetSubpixelNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testFontSetSubpixelNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontSetSubpixel(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontSetSubpixelNULL
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontSetSubpixel_0200
     * @tc.desc   test for testFontSetSubpixelNULL.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFontSetSubpixelNULL', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetSubpixel(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontSetSubpixelMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontSetSubpixel_0300
     * @tc.desc   test for testFontSetSubpixelMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFontSetSubpixelMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetSubpixel(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontIsSubpixelWhenNoSet
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontSetSubpixel_0400
     * @tc.desc   test for testFontIsSubpixelWhenNoSet.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testFontIsSubpixelWhenNoSet', Level.LEVEL2, () => {
      const result = libDrawingNative.DrawingFontSetSubpixel(3);
      expect(result).assertEqual(0);
    })

    // Font SetForceAutoHinting related test cases
    /**
     * @tc.name   testFontSetForceAutoHintingNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontSetForceAutoHinting_0100
     * @tc.desc   test for testFontSetForceAutoHintingNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testFontSetForceAutoHintingNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontSetForceAutoHinting(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontSetForceAutoHintingNULL
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontSetForceAutoHinting_0200
     * @tc.desc   test for testFontSetForceAutoHintingNULL.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFontSetForceAutoHintingNULL', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetForceAutoHinting(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontSetForceAutoHintingMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontSetForceAutoHinting_0300
     * @tc.desc   test for testFontSetForceAutoHintingMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFontSetForceAutoHintingMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetForceAutoHinting(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontIsForceAutoHintingWhenNoSet
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontSetForceAutoHinting_0400
     * @tc.desc   test for testFontIsForceAutoHintingWhenNoSet.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFontIsForceAutoHintingWhenNoSet', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetForceAutoHinting(3);
      expect(result).assertEqual(0);
    })

    // Font SetTypeface related test cases
    /**
     * @tc.name   testFontSetTypefaceNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontSetTypeface_0100
     * @tc.desc   test for testFontSetTypefaceNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testFontSetTypefaceNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontSetTypeface(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontSetTypefaceNULL
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontSetTypeface_0200
     * @tc.desc   test for testFontSetTypefaceNULL.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFontSetTypefaceNULL', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetTypeface(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontSetTypefaceMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontSetTypeface_0300
     * @tc.desc   test for testFontSetTypefaceMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFontSetTypefaceMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetTypeface(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontGetTypefaceWhenNoSet
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontSetTypeface_0400
     * @tc.desc   test for testFontGetTypefaceWhenNoSet.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFontGetTypefaceWhenNoSet', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetTypeface(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontSetTextSizeNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontSetTextSize_0100
     * @tc.desc   test for testFontSetTextSizeNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testFontSetTextSizeNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontSetTextSize(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontSetTextSizeNULL
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontSetTextSize_0200
     * @tc.desc   test for testFontSetTextSizeNULL.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFontSetTextSizeNULL', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetTextSize(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontSetTextSizeMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontSetTextSize_0300
     * @tc.desc   test for testFontSetTextSizeMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFontSetTextSizeMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetTextSize(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontGetTextSizeWhenNoSet
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontSetTextSize_0400
     * @tc.desc   test for testFontGetTextSizeWhenNoSet.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFontGetTextSizeWhenNoSet', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetTextSize(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontSetTextSizeAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontSetTextSize_0500
     * @tc.desc   test for testFontSetTextSizeAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFontSetTextSizeAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetTextSize(4);
      expect(result).assertEqual(0);
    })

    // Font CountText related test cases
    /**
     * @tc.name   testFontCountTextNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontCountText_0100
     * @tc.desc   test for testFontCountTextNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testFontCountTextNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontCountText(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontCountTextNULL
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontCountText_0200
     * @tc.desc   test for testFontCountTextNULL.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFontCountTextNULL', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontCountText(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontCountTextMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontCountText_0300
     * @tc.desc   test for testFontCountTextMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFontCountTextMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontCountText(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontCountTextAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontCountText_0400
     * @tc.desc   test for testFontCountTextAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFontCountTextAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontCountText(3);
      expect(result).assertEqual(0);
    })

    // Font TextToGlyphs related test cases
    /**
     * @tc.name   testFontTextToGlyphsNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontTextToGlyphs_0100
     * @tc.desc   test for testFontTextToGlyphsNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testFontTextToGlyphsNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontTextToGlyphs(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontTextToGlyphsNULL
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontTextToGlyphs_0200
     * @tc.desc   test for testFontTextToGlyphsNULL.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFontTextToGlyphsNULL', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontTextToGlyphs(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontTextToGlyphsMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontTextToGlyphs_0300
     * @tc.desc   test for testFontTextToGlyphsMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFontTextToGlyphsMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontTextToGlyphs(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontTextToGlyphsAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontTextToGlyphs_0400
     * @tc.desc   test for testFontTextToGlyphsAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFontTextToGlyphsAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontTextToGlyphs(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontTextToGlyphsMaximum
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontTextToGlyphs_0500
     * @tc.desc   test for testFontTextToGlyphsMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFontTextToGlyphsMaximum', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontTextToGlyphs(4);
      expect(result).assertEqual(0);
    })

    // Font GetWidths related test cases
    /**
     * @tc.name   testFontGetWidthsNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontGetWidths_0100
     * @tc.desc   test for testFontGetWidthsNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testFontGetWidthsNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontGetWidths(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontGetWidthsNULL
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontGetWidths_0200
     * @tc.desc   test for testFontGetWidthsNULL.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFontGetWidthsNULL', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontGetWidths(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontGetWidthsMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontGetWidths_0300
     * @tc.desc   test for testFontGetWidthsMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFontGetWidthsMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontGetWidths(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontGetWidthsAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontGetWidths_0400
     * @tc.desc   test for testFontGetWidthsAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFontGetWidthsAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontGetWidths(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontGetWidthsMaximum
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontGetWidths_0500
     * @tc.desc   test for testFontGetWidthsMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFontGetWidthsMaximum', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontGetWidths(4);
      expect(result).assertEqual(0);
    })

    // Font SetLinearText related test cases
    /**
     * @tc.name   testFontSetLinearTextNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontSetLinearText_0100
     * @tc.desc   test for testFontSetLinearTextNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testFontSetLinearTextNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontSetLinearText(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontSetLinearTextNULL
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontSetLinearText_0200
     * @tc.desc   test for testFontSetLinearTextNULL.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFontSetLinearTextNULL', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetLinearText(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontSetLinearTextMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontSetLinearText_0300
     * @tc.desc   test for testFontSetLinearTextMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFontSetLinearTextMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetLinearText(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontIsLinearTextWhenNoSet
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontSetLinearText_0400
     * @tc.desc   test for testFontIsLinearTextWhenNoSet.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFontIsLinearTextWhenNoSet', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetLinearText(3);
      expect(result).assertEqual(0);
    })

    // Font SetTextSkewX related test cases
    /**
     * @tc.name   testFontSetTextSkewXNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontSetTextSkewX_0100
     * @tc.desc   test for testFontSetTextSkewXNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testFontSetTextSkewXNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontSetTextSkewX(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontSetTextSkewXNULL
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontSetTextSkewX_0200
     * @tc.desc   test for testFontSetTextSkewXNULL.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFontSetTextSkewXNULL', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetTextSkewX(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontSetTextSkewXMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontSetTextSkewX_0300
     * @tc.desc   test for testFontSetTextSkewXMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFontSetTextSkewXMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetTextSkewX(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontGetTextSkewXWhenNoSet
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontSetTextSkewX_0400
     * @tc.desc   test for testFontGetTextSkewXWhenNoSet.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFontGetTextSkewXWhenNoSet', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetTextSkewX(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontSetTextSkewXAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontSetTextSkewX_0500
     * @tc.desc   test for testFontSetTextSkewXAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFontSetTextSkewXAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetTextSkewX(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontSetTextSkewXMaximum
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontSetTextSkewX_0600
     * @tc.desc   test for testFontSetTextSkewXMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFontSetTextSkewXMaximum', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetTextSkewX(5);
      expect(result).assertEqual(0);
    })

    // Font SetFakeBoldText related test cases
    /**
     * @tc.name   testFontSetFakeBoldTextNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontSetFakeBoldText_0100
     * @tc.desc   test for testFontSetFakeBoldTextNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testFontSetFakeBoldTextNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontSetFakeBoldText(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontSetFakeBoldTextNULL
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontSetFakeBoldText_0200
     * @tc.desc   test for testFontSetFakeBoldTextNULL.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFontSetFakeBoldTextNULL', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetFakeBoldText(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontSetFakeBoldTextMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontSetFakeBoldText_0300
     * @tc.desc   test for testFontSetFakeBoldTextMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFontSetFakeBoldTextMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetFakeBoldText(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontIsFakeBoldTextWhenNoSet
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontSetFakeBoldText_0400
     * @tc.desc   test for testFontIsFakeBoldTextWhenNoSet.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFontIsFakeBoldTextWhenNoSet', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetFakeBoldText(3);
      expect(result).assertEqual(0);
    })

    // Font SetScaleX related test cases
    /**
     * @tc.name   testFontSetScaleXNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontSetScaleX_0100
     * @tc.desc   test for testFontSetScaleXNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testFontSetScaleXNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontSetScaleX(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontSetScaleXNULL
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontSetScaleX_0200
     * @tc.desc   test for testFontSetScaleXNULL.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFontSetScaleXNULL', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetScaleX(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontSetScaleXMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontSetScaleX_0300
     * @tc.desc   test for testFontSetScaleXMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFontSetScaleXMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetScaleX(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontGetScaleXWhenNoSet
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontSetScaleX_0400
     * @tc.desc   test for testFontGetScaleXWhenNoSet.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFontGetScaleXWhenNoSet', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetScaleX(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontSetScaleXAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontSetScaleX_0500
     * @tc.desc   test for testFontSetScaleXAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFontSetScaleXAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetScaleX(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontSetScaleXMaximum
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontSetScaleX_0600
     * @tc.desc   test for testFontSetScaleXMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFontSetScaleXMaximum', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetScaleX(5);
      expect(result).assertEqual(0);
    })

    // Font SetHinting related test cases
    /**
     * @tc.name   testFontSetHintingNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontSetHinting_0100
     * @tc.desc   test for testFontSetHintingNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testFontSetHintingNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontSetHinting(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontSetHintingNULL
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontSetHinting_0200
     * @tc.desc   test for testFontSetHintingNULL.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFontSetHintingNULL', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetHinting(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontSetHintingMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontSetHinting_0300
     * @tc.desc   test for testFontSetHintingMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFontSetHintingMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetHinting(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontGetHintingWhenNoSet
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontSetHinting_0400
     * @tc.desc   test for testFontGetHintingWhenNoSet.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFontGetHintingWhenNoSet', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetHinting(3);
      expect(result).assertEqual(0);
    })

    // Font SetEmbeddedBitmaps related test cases
    /**
     * @tc.name   testFontSetEmbeddedBitmapsNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontSetEmbeddedBitmaps_0100
     * @tc.desc   test for testFontSetEmbeddedBitmapsNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testFontSetEmbeddedBitmapsNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontSetEmbeddedBitmaps(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontSetEmbeddedBitmapsNULL
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontSetEmbeddedBitmaps_0200
     * @tc.desc   test for testFontSetEmbeddedBitmapsNULL.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFontSetEmbeddedBitmapsNULL', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetEmbeddedBitmaps(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontSetEmbeddedBitmapsMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontSetEmbeddedBitmaps_0300
     * @tc.desc   test for testFontSetEmbeddedBitmapsMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFontSetEmbeddedBitmapsMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetEmbeddedBitmaps(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontIsEmbeddedBitmapsWhenNoSet
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontSetEmbeddedBitmaps_0400
     * @tc.desc   test for testFontIsEmbeddedBitmapsWhenNoSet.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFontIsEmbeddedBitmapsWhenNoSet', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetEmbeddedBitmaps(3);
      expect(result).assertEqual(0);
    })

    // Font SetEdging related test cases
    /**
     * @tc.name   testFontSetEdgingNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontSetEdging_0100
     * @tc.desc   test for testFontSetEdgingNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testFontSetEdgingNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontSetEdging(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontSetEdgingNULL
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontSetEdging_0200
     * @tc.desc   test for testFontSetEdgingNULL.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFontSetEdgingNULL', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetEdging(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontSetEdgingMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontSetEdging_0300
     * @tc.desc   test for testFontSetEdgingMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFontSetEdgingMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetEdging(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontGetEdgingWhenNoSet
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontSetEdging_0400
     * @tc.desc   test for testFontGetEdgingWhenNoSet.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFontGetEdgingWhenNoSet', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetEdging(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontGetMetricsNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontGetMetrics_0100
     * @tc.desc   test for testFontGetMetricsNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testFontGetMetricsNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontGetMetrics(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontGetMetricsNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontGetMetrics_0200
     * @tc.desc   test for testFontGetMetricsNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFontGetMetricsNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontGetMetrics(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   TestFontGetMetricsMultiplies
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontGetMetrics_0300
     * @tc.desc   test for TestFontGetMetricsMultiplies.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('TestFontGetMetricsMultiplies', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontGetMetrics(2);
      expect(result).assertEqual(0);
    })

    // Font MeasureSingleCharacter related test cases
    /**
     * @tc.name   testFontMeasureSingleCharacterNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontMeasureSingleCharacter_0100
     * @tc.desc   test for testFontMeasureSingleCharacterNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testFontMeasureSingleCharacterNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontMeasureSingleCharacter(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontMeasureSingleCharacterNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontMeasureSingleCharacter_0200
     * @tc.desc   test for testFontMeasureSingleCharacterNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFontMeasureSingleCharacterNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontMeasureSingleCharacter(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontMeasureSingleCharacterMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontMeasureSingleCharacter_0300
     * @tc.desc   test for testFontMeasureSingleCharacterMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFontMeasureSingleCharacterMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontMeasureSingleCharacter(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontMeasureSingleCharacter
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontMeasureSingleCharacter_0400
     * @tc.desc   test for testFontMeasureSingleCharacter.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testFontMeasureSingleCharacter', Level.LEVEL1, () => {
      const result = libDrawingNative.DrawingFontMeasureSingleCharacter(3);
      expect(result).assertEqual(0);
    })

    // Font Measuretext related test cases
    /**
     * @tc.name   testFontMeasuretextNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontMeasuretext_0100
     * @tc.desc   test for testFontMeasuretextNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testFontMeasuretextNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontMeasuretext(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontMeasuretextNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontMeasuretext_0200
     * @tc.desc   test for testFontMeasuretextNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFontMeasuretextNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontMeasuretext(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontMeasuretextMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontMeasuretext_0300
     * @tc.desc   test for testFontMeasuretextMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFontMeasuretextMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontMeasuretext(2);
      expect(result).assertEqual(0);
    })

    // FontArguments Create related test cases
    /**
     * @tc.name   testFontArgumentsCreateNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontArgumentsCreate_0100
     * @tc.desc   Test for testFontArgumentsCreateNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testFontArgumentsCreateNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontArgumentsCreate(0);
      expect(result).assertEqual(0);
    })

    // FontArguments AddVariation related test cases
    /**
     * @tc.name   testFontArgumentsAddVariationNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontArgumentsAddVariation_0100
     * @tc.desc   test for testFontArgumentsAddVariationNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testFontArgumentsAddVariationNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontArgumentsAddVariation(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontArgumentsAddVariationNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontArgumentsAddVariation_0200
     * @tc.desc   test for testFontArgumentsAddVariationNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFontArgumentsAddVariationNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontArgumentsAddVariation(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontArgumentsAddVariationAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontArgumentsAddVariation_0300
     * @tc.desc   test for testFontArgumentsAddVariationAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFontArgumentsAddVariationAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontArgumentsAddVariation(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontArgumentsAddVariationMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontArgumentsAddVariation_0400
     * @tc.desc   test for testFontArgumentsAddVariationMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFontArgumentsAddVariationMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontArgumentsAddVariation(3);
      expect(result).assertEqual(0);
    })

    // FontArguments Destroy related test cases
    /**
     * @tc.name   testFontArgumentsDestoryNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontArgumentsDestroy_0100
     * @tc.desc   test for testFontArgumentsDestoryNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testFontArgumentsDestoryNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontArgumentsDestroy(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontArgumentsDestoryNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontArgumentsDestroy_0200
     * @tc.desc   test for testFontArgumentsDestoryNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testFontArgumentsDestoryNull', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontArgumentsDestroy(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontArgumentsDestoryMultiplieCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontArgumentsDestroy_0300
     * @tc.desc   test for testFontArgumentsDestoryMultiplieCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testFontArgumentsDestoryMultiplieCalls', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontArgumentsDestroy(2);
      expect(result).assertEqual(0);
    })

    // Font SetThemeFontFollowed related test cases
    /**
     * @tc.name   testFontSetThemeFontFollowedNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontSetThemeFontFollowed_0100
     * @tc.desc   test for testFontSetThemeFontFollowedNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testFontSetThemeFontFollowedNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontSetThemeFontFollowed(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontSetThemeFontFollowedMuitipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontSetThemeFontFollowed_0200
     * @tc.desc   test for testFontSetThemeFontFollowedMuitipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testFontSetThemeFontFollowedMuitipleCalls', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontSetThemeFontFollowed(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontSetThemeFontFollowedNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontSetThemeFontFollowed_0300
     * @tc.desc   test for testFontSetThemeFontFollowedNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testFontSetThemeFontFollowedNull', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontSetThemeFontFollowed(2);
      expect(result).assertEqual(0);
    })

    // Font IsThemeFontFollowed related test cases
    /**
     * @tc.name   testFontIsThemeFontFollowedNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontIsThemeFontFollowed_0100
     * @tc.desc   test for testFontIsThemeFontFollowedNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testFontIsThemeFontFollowedNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontIsThemeFontFollowed(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontIsThemeFontFollowedMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontIsThemeFontFollowed_0200
     * @tc.desc   test for testFontIsThemeFontFollowedMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFontIsThemeFontFollowedMultipleCalls', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontIsThemeFontFollowed(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontIsThemeFontFollowedNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontIsThemeFontFollowed_0300
     * @tc.desc   test for testFontIsThemeFontFollowedNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFontIsThemeFontFollowedNull', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontIsThemeFontFollowed(2);
      expect(result).assertEqual(0);
    })

    // Font MeasureTextWithBrushOrPen related test cases
    /**
     * @tc.name   testFontMeasureTextWithBrushOrPenNormal1
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontMeasureTextWithBrushOrPen_0100
     * @tc.desc   test for testFontMeasureTextWithBrushOrPenNormal1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testFontMeasureTextWithBrushOrPenNormal1', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontMeasureTextWithBrushOrPen(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontMeasureTextWithBrushOrPenNormal2
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontMeasureTextWithBrushOrPen_0200
     * @tc.desc   test for testFontMeasureTextWithBrushOrPenNormal2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testFontMeasureTextWithBrushOrPenNormal2', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontMeasureTextWithBrushOrPen(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontMeasureTextWithBrushOrPenNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontMeasureTextWithBrushOrPen_0300
     * @tc.desc   test for testFontMeasureTextWithBrushOrPenNull
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFontMeasureTextWithBrushOrPenNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontMeasureTextWithBrushOrPen(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontMeasureTextWithBrushOrPenAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontMeasureTextWithBrushOrPen_0400
     * @tc.desc   test for testFontMeasureTextWithBrushOrPenAbnormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFontMeasureTextWithBrushOrPenAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontMeasureTextWithBrushOrPen(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontMeasureTextWithBrushOrPenMultiCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontMeasureTextWithBrushOrPen_0500
     * @tc.desc   test for testFontMeasureTextWithBrushOrPenMultiCalls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFontMeasureTextWithBrushOrPenMultiCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontMeasureTextWithBrushOrPen(4);
      expect(result).assertEqual(0);
    })

    // Font GetWidthsBounds related test cases
    /**
     * @tc.name   testFontGetWidthsBoundsNormal1
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontGetWidthsBounds_0100
     * @tc.desc   test for testFontGetWidthsBoundsNormal1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testFontGetWidthsBoundsNormal1', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontGetWidthsBounds(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontGetWidthsBoundsNormal2
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontGetWidthsBounds_0200
     * @tc.desc   test for testFontGetWidthsBoundsNormal2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testFontGetWidthsBoundsNormal2', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontGetWidthsBounds(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontGetWidthsBoundsNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontGetWidthsBounds_0300
     * @tc.desc   test for testFontGetWidthsBoundsNull
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFontGetWidthsBoundsNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontGetWidthsBounds(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontGetWidthsBoundsAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontGetWidthsBounds_0400
     * @tc.desc   test for testFontGetWidthsBoundsAbnormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFontGetWidthsBoundsAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontGetWidthsBounds(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontGetWidthsBoundsMultiCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontGetWidthsBounds_0500
     * @tc.desc   test for testFontGetWidthsBoundsMultiCalls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFontGetWidthsBoundsMultiCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontGetWidthsBounds(4);
      expect(result).assertEqual(0);
    })

    // Font GetPos related test cases
    /**
     * @tc.name   testFontGePosNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontGetPos_0100
     * @tc.desc   test for testFontGePosNormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testFontGePosNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontGetPos(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontGetPosNormal1
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontGetPos_0200
     * @tc.desc   test for testFontGetPosNormal1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testFontGetPosNormal1', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontGetPos(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontGePosNormal2
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontGetPos_0300
     * @tc.desc   test for testFontGePosNormal2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testFontGePosNormal2', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontGetPos(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontGePosNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontGetPos_0400
     * @tc.desc   test for testFontGePosNull
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFontGePosNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontGetPos(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontGePosMultiplieCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontGetPos_0500
     * @tc.desc   test for testFontGePosMultiplieCalls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFontGePosMultiplieCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontGetPos(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontGePosAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontGetPos_0600
     * @tc.desc   test for testFontGePosAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFontGePosAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontGetPos(5);
      expect(result).assertEqual(0);
    })

    // Font GetSpacing related test cases
    /**
     * @tc.name   testFontGeSpacingNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontGetSpacing_0100
     * @tc.desc   test for testFontGeSpacingNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testFontGeSpacingNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontGetSpacing(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontGeSpacingMultiplieCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontGetSpacing_0200
     * @tc.desc   test for testFontGeSpacingMultiplieCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFontGeSpacingMultiplieCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontGetSpacing(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontGeSpacingNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontGetSpacing_0300
     * @tc.desc   test for testFontGeSpacingNull
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFontGeSpacingNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontGetSpacing(2);
      expect(result).assertEqual(0);
    })

    // Font MeasureSingleChaWithFeatures related test cases
    /**
     * @tc.name   testFontMeasureSingleChaWithFeaturesNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontMeasureSingleChaWithFeatures_0100
     * @tc.desc   test for testFontMeasureSingleChaWithFeaturesNormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testFontMeasureSingleChaWithFeaturesNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontMeasureSingleChaWithFeatures(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontMeasureSingleChaWithFeaturesAbNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontMeasureSingleChaWithFeatures_0200
     * @tc.desc   test for testFontMeasureSingleChaWithFeaturesAbNormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFontMeasureSingleChaWithFeaturesAbNormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontMeasureSingleChaWithFeatures(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontMeasureSingleChaWithFeaturesCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontMeasureSingleChaWithFeatures_0300
     * @tc.desc   test for testFontMeasureSingleChaWithFeaturesCalls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testFontMeasureSingleChaWithFeaturesCalls', Level.LEVEL2, () => {
      const result = libDrawingNative.DrawingFontMeasureSingleChaWithFeatures(2);
      expect(result).assertEqual(0);
    })

    // Font Features related test cases
    /**
     * @tc.name   testFontFeaturesAddFeatureNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontFeatures_0100
     * @tc.desc   test for testFontFeaturesAddFeatureNormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testFontFeaturesAddFeatureNormal', Level.LEVEL2, () => {
      const result = libDrawingNative.DrawingFontFeatures(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontFeaturesAddFeatureAbNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontFeatures_0200
     * @tc.desc   test for testFontFeaturesAddFeatureAbNormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFontFeaturesAddFeatureAbNormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontFeatures(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testFontFeaturesandFeatureDestroyNULL
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingFontFeatures_0300
     * @tc.desc   test for testFontFeaturesandFeatureDestroyNULL
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFontFeaturesandFeatureDestroyNULL', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontFeatures(2);
      expect(result).assertEqual(0);
    })
  })
}