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


export default function ActsNewDrawingNativeTestPart5() {
  describe('ActsNewDrawingNativeTestPart5', () => {
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

    // Font SetTextSize related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_2000
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_2000
     * @tc.desc   test for TestFontSetTextSizeNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_2000', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontSetTextSize(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_2100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_2100
     * @tc.desc   test for TestFontSetTextSizeNULL.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_2100', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetTextSize(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_2200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_2200
     * @tc.desc   test for TestFontSetTextSizeMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_2200', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetTextSize(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_2300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_2300
     * @tc.desc   test for TestFontGetTextSizeWhenNoSet.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_2300', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetTextSize(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_2400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_2400
     * @tc.desc   test for TestFontSetTextSizeAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_2400', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetTextSize(4);
      expect(result).assertEqual(0);
    })

    // Font CountText related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_2500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_2500
     * @tc.desc   test for TestFontCountTextNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_2500', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontCountText(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_2600
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_2600
     * @tc.desc   test for TestFontCountTextNULL.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_2600', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontCountText(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_2700
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_2700
     * @tc.desc   test for TestFontCountTextMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_2700', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontCountText(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_2800
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_2800
     * @tc.desc   test for TestFontCountTextAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_2800', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontCountText(3);
      expect(result).assertEqual(0);
    })

    // Font TextToGlyphs related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_2900
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_2900
     * @tc.desc   test for TestFontTextToGlyphsNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_2900', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontTextToGlyphs(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_3000
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_3000
     * @tc.desc   test for TestFontTextToGlyphsNULL.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_3000', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontTextToGlyphs(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_3100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_3100
     * @tc.desc   test for TestFontTextToGlyphsMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_3100', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontTextToGlyphs(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_3200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_3200
     * @tc.desc   test for TestFontTextToGlyphsAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_3200', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontTextToGlyphs(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_3300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_3300
     * @tc.desc   test for TestFontTextToGlyphsMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_3300', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontTextToGlyphs(4);
      expect(result).assertEqual(0);
    })

    // Font GetWidths related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_3400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_3400
     * @tc.desc   test for TestFontGetWidthsNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_3400', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontGetWidths(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_3500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_3500
     * @tc.desc   test for TestFontGetWidthsNULL.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_3500', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontGetWidths(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_3600
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_3600
     * @tc.desc   test for TestFontGetWidthsMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_3600', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontGetWidths(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_7900
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_7900
     * @tc.desc   test for TestFontGetWidthsAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_7900', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontGetWidths(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_8000
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_8000
     * @tc.desc   test for TestFontGetWidthsMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_8000', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontGetWidths(4);
      expect(result).assertEqual(0);
    })

    // Font SetLinearText related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_8100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_8100
     * @tc.desc   test for TestFontSetLinearTextNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_8100', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontSetLinearText(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_8200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_8200
     * @tc.desc   test for TestFontSetLinearTextNULL.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_8200', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetLinearText(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_8300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_8300
     * @tc.desc   test for TestFontSetLinearTextMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_8300', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetLinearText(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_8400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_8400
     * @tc.desc   test for TestFontIsLinearTextWhenNoSet.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_8400', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetLinearText(3);
      expect(result).assertEqual(0);
    })

    // Font SetTextSkewX related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_8500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_8500
     * @tc.desc   test for TestFontSetTextSkewXNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_8500', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontSetTextSkewX(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_8600
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_8600
     * @tc.desc   test for TestFontSetTextSkewXNULL.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_8600', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetTextSkewX(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_8700
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_8700
     * @tc.desc   test for TestFontSetTextSkewXMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_8700', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetTextSkewX(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_8800
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_8800
     * @tc.desc   test for TestFontGetTextSkewXWhenNoSet.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_8800', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetTextSkewX(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_8900
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_8900
     * @tc.desc   test for TestFontSetTextSkewXAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_8900', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetTextSkewX(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_9000
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_9000
     * @tc.desc   test for TestFontSetTextSkewXMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_9000', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetTextSkewX(5);
      expect(result).assertEqual(0);
    })

    // Font SetFakeBoldText related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_9100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_9100
     * @tc.desc   test for TestFontSetFakeBoldTextNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_9100', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontSetFakeBoldText(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_9200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_9200
     * @tc.desc   test for TestFontSetFakeBoldTextNULL.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_9200', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetFakeBoldText(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_9300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_9300
     * @tc.desc   test for TestFontSetFakeBoldTextMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_9300', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetFakeBoldText(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_9400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_9400
     * @tc.desc   test for TestFontIsFakeBoldTextWhenNoSet.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_9400', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetFakeBoldText(3);
      expect(result).assertEqual(0);
    })

    // Font SetScaleX related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_9500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_9500
     * @tc.desc   test for TestFontSetScaleXNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_9500', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontSetScaleX(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_9600
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_9600
     * @tc.desc   test for TestFontSetScaleXNULL.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_9600', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetScaleX(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_9700
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_9700
     * @tc.desc   test for TestFontSetScaleXMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_9700', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetScaleX(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_9800
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_9800
     * @tc.desc   test for TestFontGetScaleXWhenNoSet.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_9800', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetScaleX(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_9900
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_9900
     * @tc.desc   test for TestFontSetScaleXAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_9900', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetScaleX(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_10000
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_10000
     * @tc.desc   test for TestFontSetScaleXMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_10000', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetScaleX(5);
      expect(result).assertEqual(0);
    })

    // Font SetHinting related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_10100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_10100
     * @tc.desc   test for TestFontSetHintingNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_10100', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontSetHinting(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_10200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_10200
     * @tc.desc   test for TestFontSetHintingNULL.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_10200', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetHinting(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_10300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_10300
     * @tc.desc   test for TestFontSetHintingMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_10300', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetHinting(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_10400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_10400
     * @tc.desc   test for TestFontGetHintingWhenNoSet.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_10400', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetHinting(3);
      expect(result).assertEqual(0);
    })

    // Font SetEmbeddedBitmaps related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_10500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_10500
     * @tc.desc   test for TestFontSetEmbeddedBitmapsNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_10500', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontSetEmbeddedBitmaps(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_10600
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_10600
     * @tc.desc   test for TestFontSetEmbeddedBitmapsNULL.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_10600', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetEmbeddedBitmaps(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_10700
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_10700
     * @tc.desc   test for TestFontSetEmbeddedBitmapsMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_10700', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetEmbeddedBitmaps(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_10800
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_10800
     * @tc.desc   test for TestFontIsEmbeddedBitmapsWhenNoSet.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_10800', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetEmbeddedBitmaps(3);
      expect(result).assertEqual(0);
    })

    // Font SetEdging related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_10900
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_10900
     * @tc.desc   test for TestFontSetEdgingNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_10900', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontSetEdging(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_11000
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_11000
     * @tc.desc   test for TestFontSetEdgingNULL.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_11000', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetEdging(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_11100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_11100
     * @tc.desc   test for TestFontSetEdgingMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_11100', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetEdging(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_11200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_11200
     * @tc.desc   test for TestFontGetEdgingWhenNoSet.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_11200', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetEdging(3);
      expect(result).assertEqual(0);
    })

    // Font MeasureSingleCharacter related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_11300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_11300
     * @tc.desc   test for TestFontMeasureSingleCharacterNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_11300', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontMeasureSingleCharacter(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_11400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_11400
     * @tc.desc   test for TestFontMeasureSingleCharacterNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_11400', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontMeasureSingleCharacter(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_11500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_11500
     * @tc.desc   test for TestFontMeasureSingleCharacterMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_11500', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontMeasureSingleCharacter(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_11900
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_11900
     * @tc.desc   test for TestFontMeasureSingleCharacter.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_11900', Level.LEVEL1, () => {
      const result = libDrawingNative.DrawingFontMeasureSingleCharacter(3);
      expect(result).assertEqual(0);
    })

    // Font Measuretext related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_11600
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_11600
     * @tc.desc   test for TestFontMeasuretextNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_11600', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontMeasuretext(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_11700
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_11700
     * @tc.desc   test for TestFontMeasuretextNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_11700', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontMeasuretext(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_11800
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_11800
     * @tc.desc   test for TestFontMeasuretextMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_FONT_11800', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontMeasuretext(2);
      expect(result).assertEqual(0);
    })

    // FontArguments Create related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_3700
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_3700
     * @tc.desc   test for TestFontArgumentsCreateNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_3700', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontArgumentsCreate(0);
      expect(result).assertEqual(0);
    })

    // FontArguments AddVariation related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_3800
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_3800
     * @tc.desc   test for TestFontArgumentsAddVariationNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_3800', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontArgumentsAddVariation(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_3900
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_3900
     * @tc.desc   test for TestFontArgumentsAddVariationNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_3900', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontArgumentsAddVariation(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_4000
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_4000
     * @tc.desc   test for TestFontArgumentsAddVariationAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_4000', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontArgumentsAddVariation(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_4100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_4100
     * @tc.desc   test for TestFontArgumentsAddVariationMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_4100', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontArgumentsAddVariation(3);
      expect(result).assertEqual(0);
    })

    // FontArguments Destroy related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_4200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_4200
     * @tc.desc   test for TestFontArgumentsDestoryNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_4200', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontArgumentsDestroy(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_4300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_4300
     * @tc.desc   test for TestFontArgumentsDestoryNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_4300', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontArgumentsDestroy(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_4400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_4400
     * @tc.desc   test for TestFontArgumentsDestoryMultiplieCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_4400', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontArgumentsDestroy(2);
      expect(result).assertEqual(0);
    })

    // Font SetThemeFontFollowed related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_4500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_4500
     * @tc.desc   test for TestFontSetThemeFontFollowedNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_4500', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontSetThemeFontFollowed(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_4600
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_4600
     * @tc.desc   test for TestFontSetThemeFontFollowedMuitipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_4600', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontSetThemeFontFollowed(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_4700
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_4700
     * @tc.desc   test for TestFontSetThemeFontFollowedNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_4700', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontSetThemeFontFollowed(2);
      expect(result).assertEqual(0);
    })

    // Font IsThemeFontFollowed related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_4800
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_4800
     * @tc.desc   test for TestFontIsThemeFontFollowedNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_4800', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontIsThemeFontFollowed(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_4900
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_4900
     * @tc.desc   test for TestFontIsThemeFontFollowedMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_4900', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontIsThemeFontFollowed(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_5000
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_5000
     * @tc.desc   test for TestFontIsThemeFontFollowedNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_5000', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontIsThemeFontFollowed(2);
      expect(result).assertEqual(0);
    })

    // Font GetMetrics Part2 related test cases

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_5200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_5200
     * @tc.desc   test for TestFontGetMetricsNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_5200', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontGetMetricsPart2(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_5300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_5300
     * @tc.desc   test for TestFontGetMetricsMultiplies.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_5300', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontGetMetricsPart2(2);
      expect(result).assertEqual(0);
    })

    // Font MeasureTextWithBrushOrPen related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_5400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_5400
     * @tc.desc   test for TestFontMeasureTextWithBrushOrPenNormal1.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_5400', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontMeasureTextWithBrushOrPen(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_5500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_5500
     * @tc.desc   test for TestFontMeasureTextWithBrushOrPenNormal2.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_5500', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontMeasureTextWithBrushOrPen(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_5600
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_5600
     * @tc.desc   test for TestFontMeasureTextWithBrushOrPenNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_5600', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontMeasureTextWithBrushOrPen(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_5700
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_5700
     * @tc.desc   test for TestFontMeasureTextWithBrushOrPenAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_5700', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontMeasureTextWithBrushOrPen(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_5800
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_5800
     * @tc.desc   test for TestFontMeasureTextWithBrushOrPenMultiCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_5800', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontMeasureTextWithBrushOrPen(4);
      expect(result).assertEqual(0);
    })

    // Font GetWidthsBounds related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_5900
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_5900
     * @tc.desc   test for TestFontGetWidthsBoundsNormal1.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_5900', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontGetWidthsBounds(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_6000
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_6000
     * @tc.desc   test for TestFontGetWidthsBoundsNormal2.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_6000', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontGetWidthsBounds(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_6100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_6100
     * @tc.desc   test for TestFontGetWidthsBoundsNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_6100', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontGetWidthsBounds(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_6200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_6200
     * @tc.desc   test for TestFontGetWidthsBoundsAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_6200', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontGetWidthsBounds(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_6300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_6300
     * @tc.desc   test for TestFontGetWidthsBoundsMultiCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_6300', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontGetWidthsBounds(4);
      expect(result).assertEqual(0);
    })

    // Font GetPos related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_6400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_6400
     * @tc.desc   test for TestFontGePosNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_6400', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontGetPos(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_6500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_6500
     * @tc.desc   test for TestFontGetPosNormal1.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_6500', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontGetPos(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_6600
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_6600
     * @tc.desc   test for TestFontGePosNormal2.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_6600', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontGetPos(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_6700
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_6700
     * @tc.desc   test for TestFontGePosNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_6700', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontGetPos(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_6800
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_6800
     * @tc.desc   test for TestFontGePosMultiplieCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_6800', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontGetPos(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_6900
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_6900
     * @tc.desc   test for TestFontGePosAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_6900', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontGetPos(5);
      expect(result).assertEqual(0);
    })

    // Font GetSpacing related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_7000
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_7000
     * @tc.desc   test for TestFontGeSpacingNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_7000', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontGetSpacing(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_7100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_7100
     * @tc.desc   test for TestFontGeSpacingMultiplieCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_7100', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontGetSpacing(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_7200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_7200
     * @tc.desc   test for TestFontGeSpacingNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_7200', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontGetSpacing(2);
      expect(result).assertEqual(0);
    })

    // Font MeasureSingleChaWithFeatures related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_7300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_7300
     * @tc.desc   test for TestFontMeasureSingleChaWithFeaturesNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_7300', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontMeasureSingleChaWithFeatures(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_7400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_7400
     * @tc.desc   test for TestFontMeasureSingleChaWithFeaturesAbNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_7400', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontMeasureSingleChaWithFeatures(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_7500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_7500
     * @tc.desc   test for TestFontMeasureSingleChaWithFeaturesCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_7500', Level.LEVEL2, () => {
      const result = libDrawingNative.DrawingFontMeasureSingleChaWithFeatures(2);
      expect(result).assertEqual(0);
    })

    // Font Features related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_7600
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_7600
     * @tc.desc   test for TestFontFeaturesAddFeatureNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_7600', Level.LEVEL2, () => {
      const result = libDrawingNative.DrawingFontFeatures(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_7700
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_7700
     * @tc.desc   test for TestFontFeaturesAddFeatureAbNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_7700', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontFeatures(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_7800
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_7800
     * @tc.desc   test for TestFontFeaturesandFeatureDestroyNULL.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_7800', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontFeatures(2);
      expect(result).assertEqual(0);
    })

    // GpuContext related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_GPU_CONTEXT_0100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_GPU_CONTEXT_0100
     * @tc.desc   test for TestGpuContextCreateFromGLDestroyNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_GPU_CONTEXT_0100', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingGpuContext(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_GPU_CONTEXT_0200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_GPU_CONTEXT_0200
     * @tc.desc   test for TestGpuContextDestroyNULL.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_GPU_CONTEXT_0200', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingGpuContext(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_GPU_CONTEXT_0300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_GPU_CONTEXT_0300
     * @tc.desc   test for TestGpuContextCreateFromGLDestroyMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_GPU_CONTEXT_0300', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingGpuContext(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_GPU_CONTEXT_0400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_GPU_CONTEXT_0400
     * @tc.desc   test for TestGpuContextCreateNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_GPU_CONTEXT_0400', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingGpuContext(3);
      expect(result).assertEqual(0);
    })

    // ImageFilter related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_FILTER_0100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_FILTER_0100
     * @tc.desc   test for TestImageFilterCreateBlurNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_FILTER_0100', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingImageFilter(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_FILTER_0200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_FILTER_0200
     * @tc.desc   test for TestImageFilterCreateBlurNULL.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_FILTER_0200', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingImageFilter(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_FILTER_0300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_FILTER_0300
     * @tc.desc   test for TestImageFilterCreateBlurMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_FILTER_0300', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingImageFilter(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_FILTER_0400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_FILTER_0400
     * @tc.desc   test for TestImageFilterCreateBlurAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_FILTER_0400', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingImageFilter(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_FILTER_0500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_FILTER_0500
     * @tc.desc   test for TestImageFilterCreateBlurMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_FILTER_0500', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingImageFilter(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_FILTER_0600
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_FILTER_0600
     * @tc.desc   test for TestImageFilterCreateFromColorFilterNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_FILTER_0600', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingImageFilter(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_FILTER_0700
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_FILTER_0700
     * @tc.desc   test for TestImageFilterCreateFromColorFilterNULL.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_FILTER_0700', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingImageFilter(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_FILTER_0800
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_FILTER_0800
     * @tc.desc   test for TestImageFilterCreateFromColorFilterMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_FILTER_0800', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingImageFilter(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_FILTER_0900
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_FILTER_0900
     * @tc.desc   test for TestImageFilterDestroyNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_FILTER_0900', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingImageFilter(8);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_FILTER_1000
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_FILTER_1000
     * @tc.desc   test for TestImageFilterDestroyNULL.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_FILTER_1000', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingImageFilter(9);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_FILTER_1100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_FILTER_1100
     * @tc.desc   test for TestImageFilterDestroyMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_FILTER_1100', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingImageFilter(10);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_FILTER_1200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_FILTER_1200
     * @tc.desc   test for TestImageFilterCreateOffsetNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_FILTER_1200', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingImageFilter(11);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_FILTER_1300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_FILTER_1300
     * @tc.desc   test for TestImageFilterCreateOffsetNULL.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_FILTER_1300', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingImageFilter(12);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_FILTER_1400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_FILTER_1400
     * @tc.desc   test for TestImageFilterCreateOffsetAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_FILTER_1400', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingImageFilter(13);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_FILTER_1500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_FILTER_1500
     * @tc.desc   test for TestImageFilterCreateOffsetMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_FILTER_1500', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingImageFilter(14);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_FILTER_1600
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_FILTER_1600
     * @tc.desc   test for TestImageFilterCreateFromShderEffectNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_FILTER_1600', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingImageFilter(15);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_FILTER_1700
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_FILTER_1700
     * @tc.desc   test for TestImageFilterCreateFromShderEffectNULL.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_FILTER_1700', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingImageFilter(16);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_FILTER_1800
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_FILTER_1800
     * @tc.desc   test for TestImageFilterCreateFromShderEffectMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_FILTER_1800', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingImageFilter(17);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_FILTER_1900
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_FILTER_1900
     * @tc.desc   test for TestImageFilterCreateBlurWithCropNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_FILTER_1900', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingImageFilter(18);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_FILTER_2000
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_FILTER_2000
     * @tc.desc   test for TestImageFilterCreateBlurWithCropNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_FILTER_2000', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingImageFilter(19);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_FILTER_2100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_FILTER_2100
     * @tc.desc   test for TestImageFilterCreateBlurWithCropMultiCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_IMAGE_FILTER_2100', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingImageFilter(20);
      expect(result).assertEqual(0);
    })
  })
}
