/*
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

#ifndef ACTSDRAWINGNATIVETEST_DRAWING_NATIVE_FONT_TEST_H
#define ACTSDRAWINGNATIVETEST_DRAWING_NATIVE_FONT_TEST_H

namespace OHOS {
namespace Rosen {
namespace Drawing {
// Font Create/Destroy related functions
int TestFontCreateDestroyNormal();
int TestFontCreateDestroyNULL();
int TestFontCreateDestroyMultipleCalls();

// Font SetBaselineSnap related functions
int TestFontSetBaselineSnapNormal();
int TestFontSetBaselineSnapNULL();
int TestFontSetBaselineSnapMultipleCalls();
int TestFontIsBaselineSnapWhenNoSet();

// Font SetSubpixel related functions
int TestFontSetSubpixelNormal();
int TestFontSetSubpixelNULL();
int TestFontSetSubpixelMultipleCalls();
int TestFontIsSubpixelWhenNoSet();

// Font SetForceAutoHinting related functions
int TestFontSetForceAutoHintingNormal();
int TestFontSetForceAutoHintingNULL();
int TestFontSetForceAutoHintingMultipleCalls();
int TestFontIsForceAutoHintingWhenNoSet();

// Font SetTypeface related functions
int TestFontSetTypefaceNormal();
int TestFontSetTypefaceNULL();
int TestFontSetTypefaceMultipleCalls();
int TestFontGetTypefaceWhenNoSet();

// Font SetTextSize related functions
int TestFontSetTextSizeNormal();
int TestFontSetTextSizeNULL();
int TestFontSetTextSizeMultipleCalls();
int TestFontGetTextSizeWhenNoSet();
int TestFontSetTextSizeAbnormal();

// Font CountText related functions
int TestFontCountTextNormal();
int TestFontCountTextNULL();
int TestFontCountTextMultipleCalls();
int TestFontCountTextAbnormal();

// Font TextToGlyphs related functions
int TestFontTextToGlyphsNormal();
int TestFontTextToGlyphsNULL();
int TestFontTextToGlyphsMultipleCalls();
int TestFontTextToGlyphsAbnormal();
int TestFontTextToGlyphsMaximum();

// Font GetWidths related functions
int TestFontGetWidthsNormal();
int TestFontGetWidthsNULL();
int TestFontGetWidthsMultipleCalls();
int TestFontGetWidthsAbnormal();
int TestFontGetWidthsMaximum();

// Font SetLinearText related functions
int TestFontSetLinearTextNormal();
int TestFontSetLinearTextNULL();
int TestFontSetLinearTextMultipleCalls();
int TestFontIsLinearTextWhenNoSet();

// Font SetTextSkewX related functions
int TestFontSetTextSkewXNormal();
int TestFontSetTextSkewXNULL();
int TestFontSetTextSkewXMultipleCalls();
int TestFontGetTextSkewXWhenNoSet();
int TestFontSetTextSkewXAbnormal();
int TestFontSetTextSkewXMaximum();

// Font SetFakeBoldText related functions
int TestFontSetFakeBoldTextNormal();
int TestFontSetFakeBoldTextNULL();
int TestFontSetFakeBoldTextMultipleCalls();
int TestFontIsFakeBoldTextWhenNoSet();

// Font SetScaleX related functions
int TestFontSetScaleXNormal();
int TestFontSetScaleXNULL();
int TestFontSetScaleXMultipleCalls();
int TestFontGetScaleXWhenNoSet();
int TestFontSetScaleXAbnormal();
int TestFontSetScaleXMaximum();

// Font SetHinting related functions
int TestFontSetHintingNormal();
int TestFontSetHintingNULL();
int TestFontSetHintingMultipleCalls();
int TestFontGetHintingWhenNoSet();

// Font SetEmbeddedBitmaps related functions
int TestFontSetEmbeddedBitmapsNormal();
int TestFontSetEmbeddedBitmapsNULL();
int TestFontSetEmbeddedBitmapsMultipleCalls();
int TestFontIsEmbeddedBitmapsWhenNoSet();

// Font SetEdging related functions
int TestFontSetEdgingNormal();
int TestFontSetEdgingNULL();
int TestFontSetEdgingMultipleCalls();
int TestFontGetEdgingWhenNoSet();

// Font MeasureSingleCharacter related functions
int TestFontMeasureSingleCharacterNormal();
int TestFontMeasureSingleCharacterNull();
int TestFontMeasureSingleCharacterMultipleCalls();
int TestFontMeasureSingleCharacter();

// Font Measuretext related functions
int TestFontMeasuretextNormal();
int TestFontMeasuretextNull();
int TestFontMeasuretextMultipleCalls();

// FontArguments Create/Destroy related functions
int TestFontArgumentsCreateNormal();

// FontArguments AddVariation related functions
int TestFontArgumentsAddVariationNormal();
int TestFontArgumentsAddVariationNull();
int TestFontArgumentsAddVariationAbnormal();
int TestFontArgumentsAddVariationMultipleCalls();

// FontArguments Destroy related functions
int TestFontArgumentsDestoryNormal();
int TestFontArgumentsDestoryNull();
int TestFontArgumentsDestoryMultiplieCalls();

// Font SetThemeFontFollowed related functions
int TestFontSetThemeFontFollowedNormal();
int TestFontSetThemeFontFollowedMuitipleCalls();
int TestFontSetThemeFontFollowedNull();

// Font IsThemeFontFollowed related functions
int TestFontIsThemeFontFollowedNormal();
int TestFontIsThemeFontFollowedMultipleCalls();
int TestFontIsThemeFontFollowedNull();

// Font GetMetrics related functions
int TestFontGetMetricsNormal();
int TestFontGetMetricsNull();
int TestFontGetMetricsMultiplies();

// Font MeasureTextWithBrushOrPen related functions
int TestFontMeasureTextWithBrushOrPenNormal1();
int TestFontMeasureTextWithBrushOrPenNormal2();
int TestFontMeasureTextWithBrushOrPenNull();
int TestFontMeasureTextWithBrushOrPenAbnormal();
int TestFontMeasureTextWithBrushOrPenMultiCalls();

// Font GetWidthsBounds related functions
int TestFontGetWidthsBoundsNormal1();
int TestFontGetWidthsBoundsNormal2();
int TestFontGetWidthsBoundsNull();
int TestFontGetWidthsBoundsAbnormal();
int TestFontGetWidthsBoundsMultiCalls();

// Font GetPos related functions
int TestFontGePosNormal();
int TestFontGetPosNormal1();
int TestFontGePosNormal2();
int TestFontGePosNull();
int TestFontGePosMultiplieCalls();
int TestFontGePosAbnormal();

// Font GetSpacing related functions
int TestFontGeSpacingNormal();
int TestFontGeSpacingMultiplieCalls();
int TestFontGeSpacingNull();

// Font MeasureSingleChaWithFeatures related functions
int TestFontMeasureSingleChaWithFeaturesNormal();
int TestFontMeasureSingleChaWithFeaturesAbNormal();
int TestFontMeasureSingleChaWithFeaturesCalls();

// Font Features related functions
int TestFontFeaturesAddFeatureNormal();
int TestFontFeaturesAddFeatureAbNormal();
int TestFontFeaturesandFeatureDestroyNULL();
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS

#endif // ACTSDRAWINGNATIVETEST_DRAWING_NATIVE_FONT_TEST_H
