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
#include "include/NapiInitCommonTest.h"

// Font SetLinearText related functions
napi_value DrawingFontSetLinearText(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, FONT_SET_LINEAR_TEXT_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestFontSetLinearTextNormal,
            OHOS::Rosen::Drawing::TestFontSetLinearTextNULL,
            OHOS::Rosen::Drawing::TestFontSetLinearTextMultipleCalls,
            OHOS::Rosen::Drawing::TestFontIsLinearTextWhenNoSet,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Font SetTextSkewX related functions
napi_value DrawingFontSetTextSkewX(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, FONT_SET_TEXT_SKEW_X_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestFontSetTextSkewXNormal,
            OHOS::Rosen::Drawing::TestFontSetTextSkewXNULL,
            OHOS::Rosen::Drawing::TestFontSetTextSkewXMultipleCalls,
            OHOS::Rosen::Drawing::TestFontGetTextSkewXWhenNoSet,
            OHOS::Rosen::Drawing::TestFontSetTextSkewXAbnormal,
            OHOS::Rosen::Drawing::TestFontSetTextSkewXMaximum,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Font SetFakeBoldText related functions
napi_value DrawingFontSetFakeBoldText(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, FONT_SET_FAKE_BOLD_TEXT_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestFontSetFakeBoldTextNormal,
            OHOS::Rosen::Drawing::TestFontSetFakeBoldTextNULL,
            OHOS::Rosen::Drawing::TestFontSetFakeBoldTextMultipleCalls,
            OHOS::Rosen::Drawing::TestFontIsFakeBoldTextWhenNoSet,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Font SetScaleX related functions
napi_value DrawingFontSetScaleX(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, FONT_SET_SCALE_X_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestFontSetScaleXNormal,
            OHOS::Rosen::Drawing::TestFontSetScaleXNULL,
            OHOS::Rosen::Drawing::TestFontSetScaleXMultipleCalls,
            OHOS::Rosen::Drawing::TestFontGetScaleXWhenNoSet,
            OHOS::Rosen::Drawing::TestFontSetScaleXAbnormal,
            OHOS::Rosen::Drawing::TestFontSetScaleXMaximum,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Font SetHinting related functions
napi_value DrawingFontSetHinting(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, FONT_SET_HINTING_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestFontSetHintingNormal,
            OHOS::Rosen::Drawing::TestFontSetHintingNULL,
            OHOS::Rosen::Drawing::TestFontSetHintingMultipleCalls,
            OHOS::Rosen::Drawing::TestFontGetHintingWhenNoSet,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Font SetEmbeddedBitmaps related functions
napi_value DrawingFontSetEmbeddedBitmaps(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, FONT_SET_EMBEDDED_BITMAPS_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestFontSetEmbeddedBitmapsNormal,
            OHOS::Rosen::Drawing::TestFontSetEmbeddedBitmapsNULL,
            OHOS::Rosen::Drawing::TestFontSetEmbeddedBitmapsMultipleCalls,
            OHOS::Rosen::Drawing::TestFontIsEmbeddedBitmapsWhenNoSet,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Font SetEdging related functions
napi_value DrawingFontSetEdging(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, FONT_SET_EDGING_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestFontSetEdgingNormal,
            OHOS::Rosen::Drawing::TestFontSetEdgingNULL,
            OHOS::Rosen::Drawing::TestFontSetEdgingMultipleCalls,
            OHOS::Rosen::Drawing::TestFontGetEdgingWhenNoSet,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Font MeasureSingleCharacter related functions
napi_value DrawingFontMeasureSingleCharacter(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, FONT_MEASURE_SINGLE_CHARACTER_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestFontMeasureSingleCharacterNormal,
            OHOS::Rosen::Drawing::TestFontMeasureSingleCharacterNull,
            OHOS::Rosen::Drawing::TestFontMeasureSingleCharacterMultipleCalls,
            OHOS::Rosen::Drawing::TestFontMeasureSingleCharacter,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Font Measuretext related functions
napi_value DrawingFontMeasuretext(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, FONT_MEASURETEXT_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestFontMeasuretextNormal,
            OHOS::Rosen::Drawing::TestFontMeasuretextNull,
            OHOS::Rosen::Drawing::TestFontMeasuretextMultipleCalls,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// FontArguments Create related functions
napi_value DrawingFontArgumentsCreate(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, FONT_ARGUMENTS_CREATE_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestFontArgumentsCreateNormal,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// FontArguments AddVariation related functions
napi_value DrawingFontArgumentsAddVariation(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, FONT_ARGUMENTS_ADD_VARIATION_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestFontArgumentsAddVariationNormal,
            OHOS::Rosen::Drawing::TestFontArgumentsAddVariationNull,
            OHOS::Rosen::Drawing::TestFontArgumentsAddVariationAbnormal,
            OHOS::Rosen::Drawing::TestFontArgumentsAddVariationMultipleCalls,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// FontArguments Destroy related functions
napi_value DrawingFontArgumentsDestroy(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, FONT_ARGUMENTS_DESTROY_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestFontArgumentsDestoryNormal,
            OHOS::Rosen::Drawing::TestFontArgumentsDestoryNull,
            OHOS::Rosen::Drawing::TestFontArgumentsDestoryMultiplieCalls,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Font SetThemeFontFollowed related functions
napi_value DrawingFontSetThemeFontFollowed(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, FONT_SET_THEME_FONT_FOLLOWED_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestFontSetThemeFontFollowedNormal,
            OHOS::Rosen::Drawing::TestFontSetThemeFontFollowedMuitipleCalls,
            OHOS::Rosen::Drawing::TestFontSetThemeFontFollowedNull,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Font IsThemeFontFollowed related functions
napi_value DrawingFontIsThemeFontFollowed(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, FONT_IS_THEME_FONT_FOLLOWED_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestFontIsThemeFontFollowedNormal,
            OHOS::Rosen::Drawing::TestFontIsThemeFontFollowedMultipleCalls,
            OHOS::Rosen::Drawing::TestFontIsThemeFontFollowedNull,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Font GetMetrics Part2 related functions
napi_value DrawingFontGetMetricsPart2(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, FONT_GET_METRICS_PART2_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestFontGetMetricsNormal,
            OHOS::Rosen::Drawing::TestFontGetMetricsNull,
            OHOS::Rosen::Drawing::TestFontGetMetricsMultiplies,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Font MeasureTextWithBrushOrPen related functions
napi_value DrawingFontMeasureTextWithBrushOrPen(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, FONT_MEASURE_TEXT_WITH_BRUSH_OR_PEN_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestFontMeasureTextWithBrushOrPenNormal1,
            OHOS::Rosen::Drawing::TestFontMeasureTextWithBrushOrPenNormal2,
            OHOS::Rosen::Drawing::TestFontMeasureTextWithBrushOrPenNull,
            OHOS::Rosen::Drawing::TestFontMeasureTextWithBrushOrPenAbnormal,
            OHOS::Rosen::Drawing::TestFontMeasureTextWithBrushOrPenMultiCalls,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Font GetWidthsBounds related functions
napi_value DrawingFontGetWidthsBounds(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, FONT_GET_WIDTHS_BOUNDS_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestFontGetWidthsBoundsNormal1,
            OHOS::Rosen::Drawing::TestFontGetWidthsBoundsNormal2,
            OHOS::Rosen::Drawing::TestFontGetWidthsBoundsNull,
            OHOS::Rosen::Drawing::TestFontGetWidthsBoundsAbnormal,
            OHOS::Rosen::Drawing::TestFontGetWidthsBoundsMultiCalls,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Font GetPos related functions
napi_value DrawingFontGetPos(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, FONT_GET_POS_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestFontGePosNormal,
            OHOS::Rosen::Drawing::TestFontGetPosNormal1,
            OHOS::Rosen::Drawing::TestFontGePosNormal2,
            OHOS::Rosen::Drawing::TestFontGePosNull,
            OHOS::Rosen::Drawing::TestFontGePosMultiplieCalls,
            OHOS::Rosen::Drawing::TestFontGePosAbnormal,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Font GetSpacing related functions
napi_value DrawingFontGetSpacing(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, FONT_GET_SPACING_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestFontGeSpacingNormal,
            OHOS::Rosen::Drawing::TestFontGeSpacingMultiplieCalls,
            OHOS::Rosen::Drawing::TestFontGeSpacingNull,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Font MeasureSingleChaWithFeatures related functions
napi_value DrawingFontMeasureSingleChaWithFeatures(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, FONT_MEASURE_SINGLE_CHA_WITH_FEATURES_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestFontMeasureSingleChaWithFeaturesNormal,
            OHOS::Rosen::Drawing::TestFontMeasureSingleChaWithFeaturesAbNormal,
            OHOS::Rosen::Drawing::TestFontMeasureSingleChaWithFeaturesCalls,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Font Features related functions
napi_value DrawingFontFeatures(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, FONT_FEATURES_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestFontFeaturesAddFeatureNormal,
            OHOS::Rosen::Drawing::TestFontFeaturesAddFeatureAbNormal,
            OHOS::Rosen::Drawing::TestFontFeaturesandFeatureDestroyNULL,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// GpuContext related functions
napi_value DrawingGpuContext(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, GPU_CONTEXT_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestGpuContextCreateFromGLDestroyNormal,
            OHOS::Rosen::Drawing::TestGpuContextDestroyNULL,
            OHOS::Rosen::Drawing::TestGpuContextCreateFromGLDestroyMultipleCalls,
            OHOS::Rosen::Drawing::TestGpuContextCreateNormal,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// ImageFilter related functions
napi_value DrawingImageFilter(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, IMAGE_FILTER_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestImageFilterCreateBlurNormal,
            OHOS::Rosen::Drawing::TestImageFilterCreateBlurNULL,
            OHOS::Rosen::Drawing::TestImageFilterCreateBlurMultipleCalls,
            OHOS::Rosen::Drawing::TestImageFilterCreateBlurAbnormal,
            OHOS::Rosen::Drawing::TestImageFilterCreateBlurMaximum,
            OHOS::Rosen::Drawing::TestImageFilterCreateFromColorFilterNormal,
            OHOS::Rosen::Drawing::TestImageFilterCreateFromColorFilterNULL,
            OHOS::Rosen::Drawing::TestImageFilterCreateFromColorFilterMultipleCalls,
            OHOS::Rosen::Drawing::TestImageFilterDestroyNormal,
            OHOS::Rosen::Drawing::TestImageFilterDestroyNULL,
            OHOS::Rosen::Drawing::TestImageFilterDestroyMultipleCalls,
            OHOS::Rosen::Drawing::TestImageFilterCreateOffsetNormal,
            OHOS::Rosen::Drawing::TestImageFilterCreateOffsetNULL,
            OHOS::Rosen::Drawing::TestImageFilterCreateOffsetAbnormal,
            OHOS::Rosen::Drawing::TestImageFilterCreateOffsetMultipleCalls,
            OHOS::Rosen::Drawing::TestImageFilterCreateFromShderEffectNormal,
            OHOS::Rosen::Drawing::TestImageFilterCreateFromShderEffectNULL,
            OHOS::Rosen::Drawing::TestImageFilterCreateFromShderEffectMultipleCalls,
            OHOS::Rosen::Drawing::TestImageFilterCreateBlurWithCropNormal,
            OHOS::Rosen::Drawing::TestImageFilterCreateBlurWithCropNull,
            OHOS::Rosen::Drawing::TestImageFilterCreateBlurWithCropMultiCalls,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Image related functions
napi_value DrawingImage(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, IMAGE_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestImageCreateDestroyNormal,
            OHOS::Rosen::Drawing::TestImageCreateDestroyNULL,
            OHOS::Rosen::Drawing::TestImageCreateDestroyMultipleCalls,
            OHOS::Rosen::Drawing::TestImageBuildFromBitmapNormal,
            OHOS::Rosen::Drawing::TestImageBuildFromBitmapNULL,
            OHOS::Rosen::Drawing::TestImageBuildFromBitmapMultipleCalls,
            OHOS::Rosen::Drawing::TestImageBuildFromBitmapMultipleCallsBoundary,
            OHOS::Rosen::Drawing::TestImageGetWidthHeightNormal,
            OHOS::Rosen::Drawing::TestImageGetWidthHeightNULL,
            OHOS::Rosen::Drawing::TestImageGetWidthHeightMultipleCalls,
            OHOS::Rosen::Drawing::TestImageGetWidthHeightMultipleCallsBoundary,
            OHOS::Rosen::Drawing::TestImageGetImageInfoNormal,
            OHOS::Rosen::Drawing::TestImageGetImageInfoNULL,
            OHOS::Rosen::Drawing::TestImageGetImageInfoMultipleCalls,
            OHOS::Rosen::Drawing::TestImageGetImageInfoAbnormal,
            OHOS::Rosen::Drawing::TestImageGetImageInfoMaximum,
            OHOS::Rosen::Drawing::TestImageGetImageInfoBoundary,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// MaskFilter related functions
napi_value DrawingMaskFilter(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, MASK_FILTER_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestMaskFilterCreateBlurDestroyNormal,
            OHOS::Rosen::Drawing::TestMaskFilterCreateBlurDestroyNULL,
            OHOS::Rosen::Drawing::TestMaskFilterCreateBlurDestroyMultipleCalls,
            OHOS::Rosen::Drawing::TestMaskFilterCreateBlurDestroyAbnormal,
            OHOS::Rosen::Drawing::TestMaskFilterCreateBlurDestroyMaximum,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Matrix Create related functions
napi_value DrawingMatrixCreate(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, MATRIX_CREATE_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestMatrixCreateDestroyNormal,
            OHOS::Rosen::Drawing::TestMatrixCreateDestroyNULL,
            OHOS::Rosen::Drawing::TestMatrixCreateDestroyMultipleCalls,
            OHOS::Rosen::Drawing::TestMatrixCreateRotationNormal,
            OHOS::Rosen::Drawing::TestMatrixCreateRotationNull,
            OHOS::Rosen::Drawing::TestMatrixCreateRotationAbnormal,
            OHOS::Rosen::Drawing::TestMatrixCreateRotationMaximum,
            OHOS::Rosen::Drawing::TestMatrixCreateRotationMultipleCalls,
            OHOS::Rosen::Drawing::TestMatrixCreateTranslationNormal,
            OHOS::Rosen::Drawing::TestMatrixCreateTranslationNull,
            OHOS::Rosen::Drawing::TestMatrixCreateTranslationAbnormal,
            OHOS::Rosen::Drawing::TestMatrixCreateTranslationMaximum,
            OHOS::Rosen::Drawing::TestMatrixCreateTranslationMultipleCalls,
            OHOS::Rosen::Drawing::TestMatrixCreateScaleNormal,
            OHOS::Rosen::Drawing::TestMatrixCreateScaleNull,
            OHOS::Rosen::Drawing::TestMatrixCreateScaleAbnormal,
            OHOS::Rosen::Drawing::TestMatrixCreateScaleMaximum,
            OHOS::Rosen::Drawing::TestMatrixCreateScaleMultipleCalls,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Matrix Transform related functions
napi_value DrawingMatrixTransform(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, MATRIX_TRANSFORM_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestMatrixMatrixSetGetMatrixNormal,
            OHOS::Rosen::Drawing::TestMatrixMatrixSetGetMatrixNull,
            OHOS::Rosen::Drawing::TestMatrixMatrixSetGetMatrixAbnormal,
            OHOS::Rosen::Drawing::TestMatrixMatrixSetGetMatrixMaximum,
            OHOS::Rosen::Drawing::TestMatrixMatrixSetGetMatrixMultipleCalls,
            OHOS::Rosen::Drawing::TestMatrixTranslateNormal,
            OHOS::Rosen::Drawing::TestMatrixTranslateNull,
            OHOS::Rosen::Drawing::TestMatrixTranslateAbnormal,
            OHOS::Rosen::Drawing::TestMatrixTranslateMaximum,
            OHOS::Rosen::Drawing::TestMatrixTranslateMultipleCalls,
            OHOS::Rosen::Drawing::TestMatrixRotateNormal,
            OHOS::Rosen::Drawing::TestMatrixRotateNull,
            OHOS::Rosen::Drawing::TestMatrixRotateAbnormal,
            OHOS::Rosen::Drawing::TestMatrixRotateMaximum,
            OHOS::Rosen::Drawing::TestMatrixRotateMultipleCalls,
            OHOS::Rosen::Drawing::TestMatrixScaleNormal,
            OHOS::Rosen::Drawing::TestMatrixScaleNull,
            OHOS::Rosen::Drawing::TestMatrixScaleAbnormal,
            OHOS::Rosen::Drawing::TestMatrixScaleMaximum,
            OHOS::Rosen::Drawing::TestMatrixScaleMultipleCalls,
            OHOS::Rosen::Drawing::TestMatrixSetRectToRectNormal,
            OHOS::Rosen::Drawing::TestMatrixSetRectToRectNull,
            OHOS::Rosen::Drawing::TestMatrixSetRectToRectMultipleCalls,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Matrix Operation related functions
napi_value DrawingMatrixOperation(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, MATRIX_OPERATION_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestMatrixPreRotateNormal,
            OHOS::Rosen::Drawing::TestMatrixPreRotateNull,
            OHOS::Rosen::Drawing::TestMatrixPreRotateAbnormal,
            OHOS::Rosen::Drawing::TestMatrixPreRotateMaximum,
            OHOS::Rosen::Drawing::TestMatrixPreRotateMultipleCalls,
            OHOS::Rosen::Drawing::TestMatrixPreScaleNormal,
            OHOS::Rosen::Drawing::TestMatrixPreScaleNull,
            OHOS::Rosen::Drawing::TestMatrixPreScaleAbnormal,
            OHOS::Rosen::Drawing::TestMatrixPreScaleMaximum,
            OHOS::Rosen::Drawing::TestMatrixPreScaleMultipleCalls,
            OHOS::Rosen::Drawing::TestMatrixPreTranslateNormal,
            OHOS::Rosen::Drawing::TestMatrixPreTranslateNull,
            OHOS::Rosen::Drawing::TestMatrixPreTranslateAbnormal,
            OHOS::Rosen::Drawing::TestMatrixPreTranslateMaximum,
            OHOS::Rosen::Drawing::TestMatrixPreTranslateMultipleCalls,
            OHOS::Rosen::Drawing::TestMatrixPostRotateNormal,
            OHOS::Rosen::Drawing::TestMatrixPostRotateNull,
            OHOS::Rosen::Drawing::TestMatrixPostRotateAbnormal,
            OHOS::Rosen::Drawing::TestMatrixPostRotateMaximum,
            OHOS::Rosen::Drawing::TestMatrixPostRotateMultipleCalls,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Matrix Part2 Transform related functions
napi_value DrawingMatrixPart2Transform(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, MATRIX_PART2_TRANSFORM_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestMatrixPostScaleNormal,
            OHOS::Rosen::Drawing::TestMatrixPostScaleNull,
            OHOS::Rosen::Drawing::TestMatrixPostScaleAbnormal,
            OHOS::Rosen::Drawing::TestMatrixPostScaleMaximum,
            OHOS::Rosen::Drawing::TestMatrixPostScaleMultipleCalls,
            OHOS::Rosen::Drawing::TestMatrixPostTranslateNormal,
            OHOS::Rosen::Drawing::TestMatrixPostTranslateNull,
            OHOS::Rosen::Drawing::TestMatrixPostTranslateAbnormal,
            OHOS::Rosen::Drawing::TestMatrixPostTranslateMaximum,
            OHOS::Rosen::Drawing::TestMatrixPostTranslateMultipleCalls,
            OHOS::Rosen::Drawing::TestMatrixResetNormal,
            OHOS::Rosen::Drawing::TestMatrixResetNull,
            OHOS::Rosen::Drawing::TestMatrixResetMultipleCalls,
            OHOS::Rosen::Drawing::TestMatrixConcatNormal,
            OHOS::Rosen::Drawing::TestMatrixConcatNull,
            OHOS::Rosen::Drawing::TestMatrixConcatMultipleCalls,
            OHOS::Rosen::Drawing::TestMatrixInvertNormal,
            OHOS::Rosen::Drawing::TestMatrixInvertNull,
            OHOS::Rosen::Drawing::TestMatrixInvertMultipleCalls,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Matrix Part2 Map/Query related functions
napi_value DrawingMatrixPart2MapQuery(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, MATRIX_PART2_MAP_QUERY_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestMatrixSetPolyToPolyNormal,
            OHOS::Rosen::Drawing::TestMatrixSetPolyToPolyNull,
            OHOS::Rosen::Drawing::TestMatrixSetPolyToPolyAbnormal,
            OHOS::Rosen::Drawing::TestMatrixSetPolyToPolyMultipleCalls,
            OHOS::Rosen::Drawing::TestMatrixMapPointsNormal,
            OHOS::Rosen::Drawing::TestMatrixMapPointsNull,
            OHOS::Rosen::Drawing::TestMatrixMapPointsAbnormal,
            OHOS::Rosen::Drawing::TestMatrixMapPointsMultipleCalls,
            OHOS::Rosen::Drawing::TestMatrixMapRectNormal,
            OHOS::Rosen::Drawing::TestMatrixMapRectNull,
            OHOS::Rosen::Drawing::TestMatrixMapRectMultipleCalls,
            OHOS::Rosen::Drawing::TestMatrixIsEqualNormal,
            OHOS::Rosen::Drawing::TestMatrixIsEqualNull,
            OHOS::Rosen::Drawing::TestMatrixIsEqualMultipleCalls,
            OHOS::Rosen::Drawing::TestMatrixIsIdentityNormal,
            OHOS::Rosen::Drawing::TestMatrixIsIdentityNull,
            OHOS::Rosen::Drawing::TestMatrixIsIdentityMultipleCalls,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Matrix Part2 Set related functions
napi_value DrawingMatrixPart2Set(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, MATRIX_PART2_SET_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestMatrixCopyNormal,
            OHOS::Rosen::Drawing::TestMatrixCopyNull,
            OHOS::Rosen::Drawing::TestMatrixCopyMultipleCalls,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Brush Create/Destroy related functions
napi_value DrawingBrushCreateDestroy(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, BRUSH_CREATE_DESTROY_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestBrushCreateNormal,
            OHOS::Rosen::Drawing::TestBrushCopyNormal,
            OHOS::Rosen::Drawing::TestBrushCopyNull,
            OHOS::Rosen::Drawing::TestBrushCopyInputDestroyed,
            OHOS::Rosen::Drawing::TestBrushCopyMultipleCalls,
            OHOS::Rosen::Drawing::TestBrushDestroyNormal,
            OHOS::Rosen::Drawing::TestBrushDestroyNull,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Brush AntiAlias related functions
napi_value DrawingBrushAntiAlias(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, BRUSH_ANTI_ALIAS_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestBrushIsAntiAliasNormal,
            OHOS::Rosen::Drawing::TestBrushIsAntiAliasNull,
            OHOS::Rosen::Drawing::TestBrushSetAntiAliasNormal,
            OHOS::Rosen::Drawing::TestBrushSetAntiAliasNull,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Brush Color related functions
napi_value DrawingBrushColor(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, BRUSH_COLOR_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestBrushGetColorNormal,
            OHOS::Rosen::Drawing::TestBrushGetColorNull,
            OHOS::Rosen::Drawing::TestBrushSetColorNormal,
            OHOS::Rosen::Drawing::TestBrushSetColorNull,
            OHOS::Rosen::Drawing::TestBrushSetColorAbnormal,
            OHOS::Rosen::Drawing::TestBrushSetColorMaximum,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Brush Alpha related functions
napi_value DrawingBrushAlpha(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, BRUSH_ALPHA_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestBrushGetAlphaNormal,
            OHOS::Rosen::Drawing::TestBrushGetAlphaNull,
            OHOS::Rosen::Drawing::TestBrushSetAlphaNormal,
            OHOS::Rosen::Drawing::TestBrushSetAlphaNull,
            OHOS::Rosen::Drawing::TestBrushSetAlphaAbnormal,
            OHOS::Rosen::Drawing::TestBrushSetAlphaMaximum,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Brush ShaderEffect related functions
napi_value DrawingBrushShaderEffect(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, BRUSH_SHADER_EFFECT_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestBrushSetShaderEffectNormal,
            OHOS::Rosen::Drawing::TestBrushSetShaderEffectNull,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Brush ShadowLayer related functions
napi_value DrawingBrushShadowLayer(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, BRUSH_SHADOW_LAYER_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestBrushSetShadowLayerNormal,
            OHOS::Rosen::Drawing::TestBrushSetShadowLayerNull,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Brush Filter related functions
napi_value DrawingBrushFilter(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, BRUSH_FILTER_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestBrushSetFilterNormal,
            OHOS::Rosen::Drawing::TestBrushSetFilterNull,
            OHOS::Rosen::Drawing::TestBrushGetFilterNormal,
            OHOS::Rosen::Drawing::TestBrushGetFilterNull,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Brush BlendMode related functions
napi_value DrawingBrushBlendMode(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, BRUSH_BLEND_MODE_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestBrushSetBlendModeNormal,
            OHOS::Rosen::Drawing::TestBrushSetBlendModeNull,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Brush Reset related functions
napi_value DrawingBrushReset(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, BRUSH_RESET_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestBrushResetNormal,
            OHOS::Rosen::Drawing::TestBrushResetNull,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Brush GetFloat related functions
napi_value DrawingBrushGetFloat(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, BRUSH_GET_FLOAT_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestBrushGetAlphaFloatNormal,
            OHOS::Rosen::Drawing::TestBrushGetAlphaFloatAbnormal,
            OHOS::Rosen::Drawing::TestBrushGetRedFloatNormal,
            OHOS::Rosen::Drawing::TestBrushGetRedFloatAbnormal,
            OHOS::Rosen::Drawing::TestBrushGetGreenFloatNormal,
            OHOS::Rosen::Drawing::TestBrushGetGreenFloatAbnormal,
            OHOS::Rosen::Drawing::TestBrushGetBlueFloatNormal,
            OHOS::Rosen::Drawing::TestBrushGetBlueFloatAbnormal,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Brush SetColor4f related functions
napi_value DrawingBrushSetColor4f(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, BRUSH_SET_COLOR4F_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestBrushSetColor4fNormal,
            OHOS::Rosen::Drawing::TestBrushSetColor4fNull,
            OHOS::Rosen::Drawing::TestBrushSetColor4fAbnormal,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Pen CreateDestroy related functions
napi_value DrawingPenCreateDestroy(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, PEN_CREATE_DESTROY_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestPenCreateNormal,
            OHOS::Rosen::Drawing::TestPenCopyNormal,
            OHOS::Rosen::Drawing::TestPenCopyNull,
            OHOS::Rosen::Drawing::TestPenCopyInputDestroyed,
            OHOS::Rosen::Drawing::TestPenDestroyNormal,
            OHOS::Rosen::Drawing::TestPenDestroyNull,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Pen AntiAlias related functions
napi_value DrawingPenAntiAlias(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, PEN_ANTI_ALIAS_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestPenIsAntiAliasNormal,
            OHOS::Rosen::Drawing::TestPenIsAntiAliasNull,
            OHOS::Rosen::Drawing::TestPenSetAntiAliasNormal,
            OHOS::Rosen::Drawing::TestPenSetAntiAliasNull,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Pen Color related functions
napi_value DrawingPenColor(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, PEN_COLOR_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestPenGetColorNormal,
            OHOS::Rosen::Drawing::TestPenGetColorNull,
            OHOS::Rosen::Drawing::TestPenSetColorNormal,
            OHOS::Rosen::Drawing::TestPenSetColorNull,
            OHOS::Rosen::Drawing::TestPenSetColorAbnormal,
            OHOS::Rosen::Drawing::TestPenSetColorMaximum,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Pen Alpha related functions
napi_value DrawingPenAlpha(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, PEN_ALPHA_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestPenGetAlphaNormal,
            OHOS::Rosen::Drawing::TestPenGetAlphaNull,
            OHOS::Rosen::Drawing::TestPenSetAlphaNormal,
            OHOS::Rosen::Drawing::TestPenSetAlphaNull,
            OHOS::Rosen::Drawing::TestPenSetAlphaAbnormal,
            OHOS::Rosen::Drawing::TestPenSetAlphaMaximum,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Pen Width related functions
napi_value DrawingPenWidth(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, PEN_WIDTH_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestPenGetWidthNormal,
            OHOS::Rosen::Drawing::TestPenGetWidthNull,
            OHOS::Rosen::Drawing::TestPenGetWidthBoundary,
            OHOS::Rosen::Drawing::TestPenSetWidthNormal,
            OHOS::Rosen::Drawing::TestPenSetWidthNull,
            OHOS::Rosen::Drawing::TestPenSetWidthAbnormal,
            OHOS::Rosen::Drawing::TestPenSetWidthMultipleCalls,
            OHOS::Rosen::Drawing::TestPenSetWidthMultipleCallsBoundary,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Pen MiterLimit related functions
napi_value DrawingPenMiterLimit(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, PEN_MITER_LIMIT_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestPenGetMiterLimitNormal,
            OHOS::Rosen::Drawing::TestPenGetMiterLimitNull,
            OHOS::Rosen::Drawing::TestPenSetMiterLimitNormal,
            OHOS::Rosen::Drawing::TestPenSetMiterLimitNull,
            OHOS::Rosen::Drawing::TestPenSetMiterLimitAbnormal,
            OHOS::Rosen::Drawing::TestPenSetMiterLimitMultipleCalls,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Pen Cap related functions
napi_value DrawingPenCap(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, PEN_CAP_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestPenGetCapNormal,
            OHOS::Rosen::Drawing::TestPenGetCapNull,
            OHOS::Rosen::Drawing::TestPenSetCapNormal,
            OHOS::Rosen::Drawing::TestPenSetCapNull,
            OHOS::Rosen::Drawing::TestPenSetCapMultipleCalls,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Pen Join related functions
napi_value DrawingPenJoin(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, PEN_JOIN_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestPenGetJoinNormal,
            OHOS::Rosen::Drawing::TestPenGetJoinNull,
            OHOS::Rosen::Drawing::TestPenSetJoinNormal,
            OHOS::Rosen::Drawing::TestPenSetJoinNull,
            OHOS::Rosen::Drawing::TestPenSetJoinMultipleCalls,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Pen Effects related functions (ShaderEffect/ShadowLayer/PathEffect)
napi_value DrawingPenEffects(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, PEN_EFFECTS_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestPenSetShaderEffectNormal,
            OHOS::Rosen::Drawing::TestPenSetShaderEffectNull,
            OHOS::Rosen::Drawing::TestPenSetShadowLayerNormal,
            OHOS::Rosen::Drawing::TestPenSetShadowLayerNull,
            OHOS::Rosen::Drawing::TestPenSetPathEffectNormal,
            OHOS::Rosen::Drawing::TestPenSetPathEffectNull,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Pen Filter related functions
napi_value DrawingPenFilter(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, PEN_FILTER_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestPenSetFilterNormal,
            OHOS::Rosen::Drawing::TestPenSetFilterNull,
            OHOS::Rosen::Drawing::TestPenGetFilterNormal,
            OHOS::Rosen::Drawing::TestPenGetFilterNull,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Pen BlendMode related functions
napi_value DrawingPenBlendMode(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, PEN_BLEND_MODE_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestPenSetBlendModeNormal,
            OHOS::Rosen::Drawing::TestPenSetBlendModeNull,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Pen GetFillPath related functions
napi_value DrawingPenGetFillPath(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, PEN_GET_FILL_PATH_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestPenGetFillPathNormal,
            OHOS::Rosen::Drawing::TestPenGetFillPathNull,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Pen Reset related functions
napi_value DrawingPenReset(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, PEN_RESET_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestPenResetNormal,
            OHOS::Rosen::Drawing::TestPenResetNull,
            OHOS::Rosen::Drawing::TestPenResetMultipleCalls,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Pen GetFloat related functions
napi_value DrawingPenGetFloat(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, PEN_GET_FLOAT_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestPenGetAlphaFloatNormal,
            OHOS::Rosen::Drawing::TestPenGetAlphaFloatAbnormal,
            OHOS::Rosen::Drawing::TestPenGetRedFloatNormal,
            OHOS::Rosen::Drawing::TestPenGetRedFloatAbnormal,
            OHOS::Rosen::Drawing::TestPenGetGreenFloatNormal,
            OHOS::Rosen::Drawing::TestPenGetGreenFloatAbnormal,
            OHOS::Rosen::Drawing::TestPenGetBlueFloatNormal,
            OHOS::Rosen::Drawing::TestPenGetBlueFloatAbnormal,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Pen SetColor4f related functions
napi_value DrawingPenSetColor4f(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, PEN_SET_COLOR4F_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestPenSetColorFNormal,
            OHOS::Rosen::Drawing::TestPenSetColorFAbnormal,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// PixelMap related functions
napi_value DrawingPixelMap(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, PIXEL_MAP_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestPixelMapGetFromNativePixelMapNormal,
            OHOS::Rosen::Drawing::TestPixelMapGetFromNativePixelMapNull,
            OHOS::Rosen::Drawing::TestPixelMapGetFromNativePixelMapMultipleCalls,
            OHOS::Rosen::Drawing::TestPixelMapGetFromNativePixelMapBoundary,
            OHOS::Rosen::Drawing::TestPixelMapGetFromOhPixelMapNativeNormal,
            OHOS::Rosen::Drawing::TestPixelMapGetFromOhPixelMapNativeNull,
            OHOS::Rosen::Drawing::TestPixelMapGetFromOhPixelMapNativeMultipleCalls,
            OHOS::Rosen::Drawing::TestPixelMapGetFromOhPixelMapNativeBoundary,
            OHOS::Rosen::Drawing::TestPixelMapDissolveNormal,
            OHOS::Rosen::Drawing::TestPixelMapDissolveNull,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

