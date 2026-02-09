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

// Rect Create/Destroy/Copy/Intersect/Join related functions
napi_value DrawingRectCreateDestroyIntersectJoin(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, RECT_CREATE_DESTROY_INTERSECT_JOIN_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestRectCreateNormal,
            OHOS::Rosen::Drawing::TestRectIntersectNormal,
            OHOS::Rosen::Drawing::TestRectIntersectNull,
            OHOS::Rosen::Drawing::TestRectJoinNormal,
            OHOS::Rosen::Drawing::TestRectJoinNull,
            OHOS::Rosen::Drawing::TestRectCopyNormal,
            OHOS::Rosen::Drawing::TestRectCopyNull,
            OHOS::Rosen::Drawing::TestRectDestroyNormal,
            OHOS::Rosen::Drawing::TestRectDestroyNull,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Rect Set/Get Left/Top/Right/Bottom related functions
napi_value DrawingRectSetGetLeftTopRightBottom(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, RECT_SET_GET_LEFT_TOP_RIGHT_BOTTOM_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestRectSetLeftNormal,
            OHOS::Rosen::Drawing::TestRectSetLeftNull,
            OHOS::Rosen::Drawing::TestRectSetLeftAbnormal,
            OHOS::Rosen::Drawing::TestRectSetLeftMultipleCalls,
            OHOS::Rosen::Drawing::TestRectSetTopNormal,
            OHOS::Rosen::Drawing::TestRectSetTopNull,
            OHOS::Rosen::Drawing::TestRectSetTopAbnormal,
            OHOS::Rosen::Drawing::TestRectSetTopMultipleCalls,
            OHOS::Rosen::Drawing::TestRectSetRightNormal,
            OHOS::Rosen::Drawing::TestRectSetRightNull,
            OHOS::Rosen::Drawing::TestRectSetRightAbnormal,
            OHOS::Rosen::Drawing::TestRectSetRightMultipleCalls,
            OHOS::Rosen::Drawing::TestRectSetBottomNormal,
            OHOS::Rosen::Drawing::TestRectSetBottomNull,
            OHOS::Rosen::Drawing::TestRectSetBottomAbnormal,
            OHOS::Rosen::Drawing::TestRectSetBottomMultipleCalls,
            OHOS::Rosen::Drawing::TestRectGetLeftNormal,
            OHOS::Rosen::Drawing::TestRectGetLeftNull,
            OHOS::Rosen::Drawing::TestRectGetTopNormal,
            OHOS::Rosen::Drawing::TestRectGetTopNull,
            OHOS::Rosen::Drawing::TestRectGetRightNormal,
            OHOS::Rosen::Drawing::TestRectGetRightNull,
            OHOS::Rosen::Drawing::TestRectGetBottomNormal,
            OHOS::Rosen::Drawing::TestRectGetBottomNull,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Rect GetWidth/GetHeight related functions
napi_value DrawingRectOtherOperations(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, RECT_OTHER_OPERATIONS_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestRectGetHeightNormal,
            OHOS::Rosen::Drawing::TestRectGetHeightNull,
            OHOS::Rosen::Drawing::TestRectGetWidthNormal,
            OHOS::Rosen::Drawing::TestRectGetWidthNull,
            OHOS::Rosen::Drawing::TestRectGetWidthBoundary,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// RoundRect related functions
napi_value DrawingRoundRect(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, ROUND_RECT_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestRoundRectCreateNormal,
            OHOS::Rosen::Drawing::TestRoundRectCreateNull,
            OHOS::Rosen::Drawing::TestRoundRectCreateAbnormal,
            OHOS::Rosen::Drawing::TestRoundRectCreateMaximum,
            OHOS::Rosen::Drawing::TestRoundRectCreateMultipleCalls,
            OHOS::Rosen::Drawing::TestRoundRectSetGetCornerNormal,
            OHOS::Rosen::Drawing::TestRoundRectSetGetCornerNull,
            OHOS::Rosen::Drawing::TestRoundRectSetGetCornerAbnormal,
            OHOS::Rosen::Drawing::TestRoundRectSetGetCornerMaximum,
            OHOS::Rosen::Drawing::TestRoundRectSetGetCornerMultipleCalls,
            OHOS::Rosen::Drawing::TestRoundRectGetCornerWhenNoSet,
            OHOS::Rosen::Drawing::TestRoundRectDestroyNormal,
            OHOS::Rosen::Drawing::TestRoundRectDestroyNull,
            OHOS::Rosen::Drawing::TestRoundRectOffsetNormal,
            OHOS::Rosen::Drawing::TestRoundRectOffsetNull,
            OHOS::Rosen::Drawing::TestRoundRectOffsetMultipleCalls,
            OHOS::Rosen::Drawing::TestRoundRectCopyNormal,
            OHOS::Rosen::Drawing::TestRoundRectCopyNull,
            OHOS::Rosen::Drawing::TestRoundRectCopyMultipleCalls,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// SamplingOptions related functions
napi_value DrawingSamplingOptions(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, SAMPLING_OPTIONS_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestSamplingOptionsCreateDestroyDestroyNormal,
            OHOS::Rosen::Drawing::TestSamplingOptionsCreateDestroyDestroyNull,
            OHOS::Rosen::Drawing::TestSamplingOptionsCreateDestroyDestroyMultipleCalls,
            OHOS::Rosen::Drawing::TestSamplingOptionsCopyNormal,
            OHOS::Rosen::Drawing::TestSamplingOptionsCopyNull,
            OHOS::Rosen::Drawing::TestSamplingOptionsCopyMultiCalls,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// ShadowLayer related functions
napi_value DrawingShadowLayer(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, SHADOW_LAYER_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestShadowLayerCreateNormal,
            OHOS::Rosen::Drawing::TestShadowLayerCreateNull,
            OHOS::Rosen::Drawing::TestShadowLayerCreateAbnormal,
            OHOS::Rosen::Drawing::TestShadowLayerCreateMaximum,
            OHOS::Rosen::Drawing::TestShadowLayerCreateMultipleCalls,
            OHOS::Rosen::Drawing::TestShadowLayerDestroyNormal,
            OHOS::Rosen::Drawing::TestShadowLayerDestroyNull,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// ShaderEffect Create Gradient related functions
napi_value DrawingShaderEffectCreateGradient(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, SHADER_EFFECT_CREATE_GRADIENT_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestShaderEffectCreateColorShaderNormal,
            OHOS::Rosen::Drawing::TestShaderEffectCreateColorShaderNull,
            OHOS::Rosen::Drawing::TestShaderEffectCreateColorShaderAbnormal,
            OHOS::Rosen::Drawing::TestShaderEffectCreateColorShaderMaximum,
            OHOS::Rosen::Drawing::TestShaderEffectCreateColorShaderMultipleCalls,
            OHOS::Rosen::Drawing::TestShaderEffectCreateLinearGradientWithLocalMatrixNormal,
            OHOS::Rosen::Drawing::TestShaderEffectCreateLinearGradientWithLocalMatrixNull,
            OHOS::Rosen::Drawing::TestShaderEffectCreateLinearGradientWithLocalMatrixAbnormal,
            OHOS::Rosen::Drawing::TestShaderEffectCreateLinearGradientWithLocalMatrixMaximum,
            OHOS::Rosen::Drawing::TestShaderEffectCreateLinearGradientWithLocalMatrixMultipleCalls,
            OHOS::Rosen::Drawing::TestShaderEffectCreateLinearGradienNormal,
            OHOS::Rosen::Drawing::TestShaderEffectCreateLinearGradienNull,
            OHOS::Rosen::Drawing::TestShaderEffectCreateLinearGradienAbnormal,
            OHOS::Rosen::Drawing::TestShaderEffectCreateLinearGradienMaximum,
            OHOS::Rosen::Drawing::TestShaderEffectCreateLinearGradienMultipleCalls,
            OHOS::Rosen::Drawing::TestShaderEffectCreateRadialGradientNormal,
            OHOS::Rosen::Drawing::TestShaderEffectCreateRadialGradientNull,
            OHOS::Rosen::Drawing::TestShaderEffectCreateRadialGradientAbnormal,
            OHOS::Rosen::Drawing::TestShaderEffectCreateRadialGradientMaximum,
            OHOS::Rosen::Drawing::TestShaderEffectCreateRadialGradientMultipleCalls,
            OHOS::Rosen::Drawing::TestShaderEffectCreateRadialGradientWithLocalMatrixNormal,
            OHOS::Rosen::Drawing::TestShaderEffectCreateRadialGradientWithLocalMatrixNull,
            OHOS::Rosen::Drawing::TestShaderEffectCreateRadialGradientWithLocalMatrixAbnormal,
            OHOS::Rosen::Drawing::TestShaderEffectCreateRadialGradientWithLocalMatrixMaximum,
            OHOS::Rosen::Drawing::TestShaderEffectCreateRadialGradientWithLocalMatrixMultipleCalls,
            OHOS::Rosen::Drawing::TestShaderEffectCreateSweepGradientNormal,
            OHOS::Rosen::Drawing::TestShaderEffectCreateSweepGradientNull,
            OHOS::Rosen::Drawing::TestShaderEffectCreateSweepGradientAbnormal,
            OHOS::Rosen::Drawing::TestShaderEffectCreateSweepGradientMaximum,
            OHOS::Rosen::Drawing::TestShaderEffectCreateSweepGradientMultipleCalls,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// ShaderEffect Create Special related functions
napi_value DrawingShaderEffectCreateSpecial(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, SHADER_EFFECT_CREATE_SPECIAL_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestShaderEffectCreateImageShaderNormal,
            OHOS::Rosen::Drawing::TestShaderEffectCreateImageShaderNull,
            OHOS::Rosen::Drawing::TestShaderEffectCreateImageShaderMultipleCalls,
            OHOS::Rosen::Drawing::TestShaderEffectCreateTwoPointConicalGradientNormal,
            OHOS::Rosen::Drawing::TestShaderEffectCreateTwoPointConicalGradientNull,
            OHOS::Rosen::Drawing::TestShaderEffectCreateTwoPointConicalGradientAbnormal,
            OHOS::Rosen::Drawing::TestShaderEffectCreateTwoPointConicalGradientMaximum,
            OHOS::Rosen::Drawing::TestShaderEffectCreateTwoPointConicalGradientMultipleCalls,
            OHOS::Rosen::Drawing::TestShaderEffectCreateSweepGradientWithLocalMatrixNormal,
            OHOS::Rosen::Drawing::TestShaderEffectCreateSweepGradientWithLocalMatrixNull,
            OHOS::Rosen::Drawing::TestShaderEffectCreateSweepGradientWithLocalMatrixAbnormal,
            OHOS::Rosen::Drawing::TestShaderEffectCreateSweepGradientWithLocalMatrixMultipleCalls,
            OHOS::Rosen::Drawing::TestShaderEffectCreateComposeEnumTraversal,
            OHOS::Rosen::Drawing::TestShaderEffectCreateComposeNull,
            OHOS::Rosen::Drawing::TestShaderEffectCreateComposeMultipleCalls,
            OHOS::Rosen::Drawing::TestShaderEffectCreatePixelMapShaderNormal,
            OHOS::Rosen::Drawing::TestShaderEffectCreatePixelMapShaderNull,
            OHOS::Rosen::Drawing::TestShaderEffectCreatePixelMapShaderMultiCalls,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// ShaderEffect Destroy related functions
napi_value DrawingShaderEffectDestroy(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, SHADER_EFFECT_DESTROY_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestShaderEffectDestroyNormal,
            OHOS::Rosen::Drawing::TestShaderEffectDestroyNull,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Surface related functions
napi_value DrawingSurface(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, SURFACE_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestSurfaceCreateFromGpuContextNormal,
            OHOS::Rosen::Drawing::TestSurfaceCreateFromGpuContextNull,
            OHOS::Rosen::Drawing::TestSurfaceCreateFromGpuContextBoundary,
            OHOS::Rosen::Drawing::TestSurfaceDestroyNormal,
            OHOS::Rosen::Drawing::TestSurfaceDestroyNull,
            OHOS::Rosen::Drawing::TestSurfaceGetCanvasNormal,
            OHOS::Rosen::Drawing::TestSurfaceGetCanvasNull,
            OHOS::Rosen::Drawing::TestSurfaceGetCanvasBoundary,
            OHOS::Rosen::Drawing::TestSurfaceCreateOnScreenNormal,
            OHOS::Rosen::Drawing::TestSurfaceCreateOnScreenNull,
            OHOS::Rosen::Drawing::TestSurfaceCreateOnScreenMultipleCalls,
            OHOS::Rosen::Drawing::TestSurfaceFlushNormal,
            OHOS::Rosen::Drawing::TestSurfaceFlushNull,
            OHOS::Rosen::Drawing::TestSurfaceFlushAbnormal,
            OHOS::Rosen::Drawing::TestSurfaceFlushMultipleCalls,
            OHOS::Rosen::Drawing::TestSurfaceFlushTiming,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// TextBlobBuilder related functions
napi_value DrawingTextBlobBuilder(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, TEXT_BLOB_BUILDER_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestTextBlobBuilderCreateDestroyNormal,
            OHOS::Rosen::Drawing::TestTextBlobBuilderCreateDestroyNull,
            OHOS::Rosen::Drawing::TestTextBlobBuilderCreateDestroyMultipleCalls,
            OHOS::Rosen::Drawing::TestTextBlobBuilderAllocRunPosNormal,
            OHOS::Rosen::Drawing::TestTextBlobBuilderAllocRunPosNull,
            OHOS::Rosen::Drawing::TestTextBlobBuilderAllocRunPosMultipleCalls,
            OHOS::Rosen::Drawing::TestTextBlobBuilderMakeNormal,
            OHOS::Rosen::Drawing::TestTextBlobBuilderMakeNull,
            OHOS::Rosen::Drawing::TestTextBlobBuilderMakeMultipleCalls,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// TextBlob Create related functions
napi_value DrawingTextBlobCreate(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, TEXT_BLOB_CREATE_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestTextBlobCreateFromTextNormal,
            OHOS::Rosen::Drawing::TestTextBlobCreateFromTextNull,
            OHOS::Rosen::Drawing::TestTextBlobCreateFromTextMultipleCalls,
            OHOS::Rosen::Drawing::TestTextBlobCreateFromTextAbnormal,
            OHOS::Rosen::Drawing::TestTextBlobCreateFromPosTextNormal,
            OHOS::Rosen::Drawing::TestTextBlobCreateFromPosTextNull,
            OHOS::Rosen::Drawing::TestTextBlobCreateFromPosTextMultipleCalls,
            OHOS::Rosen::Drawing::TestTextBlobCreateFromPosTextAbnormal,
            OHOS::Rosen::Drawing::TestTextBlobCreateFromStringNormal,
            OHOS::Rosen::Drawing::TestTextBlobCreateFromStringNull,
            OHOS::Rosen::Drawing::TestTextBlobCreateFromStringMultipleCalls,
            OHOS::Rosen::Drawing::TestTextBlobCreateFromStringAbnormal,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// TextBlob Other operations related functions
napi_value DrawingTextBlobOther(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, TEXT_BLOB_OTHER_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestTextBlobGetBoundsNormal,
            OHOS::Rosen::Drawing::TestTextBlobGetBoundsNull,
            OHOS::Rosen::Drawing::TestTextBlobGetBoundsMultipleCalls,
            OHOS::Rosen::Drawing::TestTextBlobGetBoundsAbnormal,
            OHOS::Rosen::Drawing::TestTextBlobUniqueIDNormal,
            OHOS::Rosen::Drawing::TestTextBlobUniqueIDNull,
            OHOS::Rosen::Drawing::TestTextBlobUniqueIDMultipleCalls,
            OHOS::Rosen::Drawing::TestTextBlobDestroyNormal,
            OHOS::Rosen::Drawing::TestTextBlobDestroyNull,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Typeface Create related functions
napi_value DrawingTypefaceCreate(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, TYPEFACE_CREATE_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestTypefaceCreateDefaultNormal,
            OHOS::Rosen::Drawing::TestTypefaceCreateDefaultNull,
            OHOS::Rosen::Drawing::TestTypefaceCreateFromFileNormal,
            OHOS::Rosen::Drawing::TestTypefaceCreateFromFileNull,
            OHOS::Rosen::Drawing::TestTypefaceCreateFromStreamNormal,
            OHOS::Rosen::Drawing::TestTypefaceCreateFromStreamNull,
            OHOS::Rosen::Drawing::TestTypefaceCreateDestroyNormal,
            OHOS::Rosen::Drawing::TestTypefaceCreateDestroyNull,
            OHOS::Rosen::Drawing::TestTypefaceCreateFromFileWithArugumentsNormal,
            OHOS::Rosen::Drawing::TestTypefaceCreateFromFileWithArugumentsNull,
            OHOS::Rosen::Drawing::TestTypefaceCreateFromFileWithArugumentsAbnormal,
            OHOS::Rosen::Drawing::TestTypefaceCreateFromFileWithArugumentsMultipleCalls,
            OHOS::Rosen::Drawing::TestTypefaceCreateFromCurrentNormal,
            OHOS::Rosen::Drawing::TestTypefaceCreateFromCurrentNull,
            OHOS::Rosen::Drawing::TestTypefaceCreateFromCurrentMultipleCalls,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Canvas Part2 DrawPixelMapRect related functions
napi_value DrawingCanvasDrawPixelMapRect(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, CANVAS_PART2_DRAW_PIXELMAP_RECT_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestCanvasDrawPixelMapRectNormal,
            OHOS::Rosen::Drawing::TestCanvasDrawPixelMapRectNull,
            OHOS::Rosen::Drawing::TestCanvasDrawPixelMapRectAbnormal,
            OHOS::Rosen::Drawing::TestCanvasDrawPixelMapRectMaximum,
            OHOS::Rosen::Drawing::TestCanvasDrawPixelMapRect4KBoundary,
            OHOS::Rosen::Drawing::TestCanvasDrawPixelMapRectInputDestroyed,
            OHOS::Rosen::Drawing::TestCanvasDrawPixelMapRect4ByteAlignment,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Canvas Part2 DrawBackground related functions
napi_value DrawingCanvasDrawBackground(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, CANVAS_PART2_DRAW_BACKGROUND_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestCanvasDrawBackgroundNormal,
            OHOS::Rosen::Drawing::TestCanvasDrawBackgroundNull,
            OHOS::Rosen::Drawing::TestCanvasDrawBackgroundInputDestroyed,
            OHOS::Rosen::Drawing::TestCanvasDrawBackgroundMultipleCalls,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Canvas Part2 DrawRegion related functions
napi_value DrawingCanvasDrawRegion(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, CANVAS_PART2_DRAW_REGION_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestCanvasDrawRegionNormal,
            OHOS::Rosen::Drawing::TestCanvasDrawRegionNull,
            OHOS::Rosen::Drawing::TestCanvasDrawRegionInputDestroyed,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Canvas Part2 DrawPoints related functions
napi_value DrawingCanvasDrawPoints(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, CANVAS_PART2_DRAW_POINTS_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestCanvasDrawPointsNormal,
            OHOS::Rosen::Drawing::TestCanvasDrawPointsNull,
            OHOS::Rosen::Drawing::TestCanvasDrawPointsAbnormal,
            OHOS::Rosen::Drawing::TestCanvasDrawPointsMismatch,
            OHOS::Rosen::Drawing::TestCanvasDrawPointsMaximum,
            OHOS::Rosen::Drawing::TestCanvasDrawPointsInputDestroyed,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Canvas Part2 DrawBitmap related functions
napi_value DrawingCanvasDrawBitmap(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, CANVAS_PART2_DRAW_BITMAP_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestCanvasDrawBitmapNormal,
            OHOS::Rosen::Drawing::TestCanvasDrawBitmapNull,
            OHOS::Rosen::Drawing::TestCanvasDrawBitmapAbnormal,
            OHOS::Rosen::Drawing::TestCanvasDrawBitmapMaximum,
            OHOS::Rosen::Drawing::TestCanvasDrawBitmapInputDestroyed,
            OHOS::Rosen::Drawing::TestCanvasDrawBitmapBoundary,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Canvas Part2 DrawBitmapRect related functions
napi_value DrawingCanvasDrawBitmapRect(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, CANVAS_PART2_DRAW_BITMAP_RECT_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestCanvasDrawBitmapRectNormal,
            OHOS::Rosen::Drawing::TestCanvasDrawBitmapRectNull,
            OHOS::Rosen::Drawing::TestCanvasDrawBitmapRectAbnormal,
            OHOS::Rosen::Drawing::TestCanvasDrawBitmapRectMaximum,
            OHOS::Rosen::Drawing::TestCanvasDrawBitmapRectInputDestroyed,
            OHOS::Rosen::Drawing::TestCanvasDrawBitmapRectBoundary,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Canvas Part2 DrawRect related functions
napi_value DrawingCanvasDrawRect(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, CANVAS_PART2_DRAW_RECT_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestCanvasDrawRectNormal,
            OHOS::Rosen::Drawing::TestCanvasDrawRectNull,
            OHOS::Rosen::Drawing::TestCanvasDrawRectAbnormal,
            OHOS::Rosen::Drawing::TestCanvasDrawRectMaximum,
            OHOS::Rosen::Drawing::TestCanvasDrawRectInputDestroyed,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Canvas Part2 DrawCircle related functions
napi_value DrawingCanvasDrawCircle(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, CANVAS_PART2_DRAW_CIRCLE_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestCanvasDrawCircleNormal,
            OHOS::Rosen::Drawing::TestCanvasDrawCircleNull,
            OHOS::Rosen::Drawing::TestCanvasDrawCircleAbnormal,
            OHOS::Rosen::Drawing::TestCanvasDrawCircleMaximum,
            OHOS::Rosen::Drawing::TestCanvasDrawCircleInputDestroyed,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Canvas Part3 DrawOval related functions
napi_value DrawingCanvasDrawOval(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, CANVAS_PART3_DRAW_OVAL_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestCanvasDrawOvalNormal,
            OHOS::Rosen::Drawing::TestCanvasDrawOvalNull,
            OHOS::Rosen::Drawing::TestCanvasDrawOvalAbnormal,
            OHOS::Rosen::Drawing::TestCanvasDrawOvalMaximum,
            OHOS::Rosen::Drawing::TestCanvasDrawOvalInputDestroyed,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Canvas Part3 DrawArc related functions
napi_value DrawingCanvasDrawArc(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, CANVAS_PART3_DRAW_ARC_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestCanvasDrawArcNormal,
            OHOS::Rosen::Drawing::TestCanvasDrawArcNull,
            OHOS::Rosen::Drawing::TestCanvasDrawArcAbnormal,
            OHOS::Rosen::Drawing::TestCanvasDrawArcMaximum,
            OHOS::Rosen::Drawing::TestCanvasDrawArcInputDestroyed,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Canvas Part3 DrawRoundRect related functions
napi_value DrawingCanvasDrawRoundRect(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, CANVAS_PART3_DRAW_ROUND_RECT_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestCanvasDrawRoundRectNormal,
            OHOS::Rosen::Drawing::TestCanvasDrawRoundRectNull,
            OHOS::Rosen::Drawing::TestCanvasDrawRoundRectAbnormal,
            OHOS::Rosen::Drawing::TestCanvasDrawRoundRectMaximum,
            OHOS::Rosen::Drawing::TestCanvasDrawRoundRectInputDestroyed,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Canvas Part3 DrawTextBlob related functions
napi_value DrawingCanvasDrawTextBlob(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, CANVAS_PART3_DRAW_TEXT_BLOB_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestCanvasDrawTextBlobNormal,
            OHOS::Rosen::Drawing::TestCanvasDrawTextBlobNull,
            OHOS::Rosen::Drawing::TestCanvasDrawTextBlobAbnormal,
            OHOS::Rosen::Drawing::TestCanvasDrawTextBlobMaximum,
            OHOS::Rosen::Drawing::TestCanvasDrawTextBlobInputDestroyed,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Canvas Part3 ClipRect related functions
napi_value DrawingCanvasClipRect(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, CANVAS_PART3_CLIP_RECT_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestCanvasClipRectNormal,
            OHOS::Rosen::Drawing::TestCanvasClipRectNull,
            OHOS::Rosen::Drawing::TestCanvasClipRectAbnormal,
            OHOS::Rosen::Drawing::TestCanvasClipRectMaximum,
            OHOS::Rosen::Drawing::TestCanvasClipRectInputDestroyed,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Canvas Part3 ClipRoundRect related functions
napi_value DrawingCanvasClipRoundRect(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, CANVAS_PART3_CLIP_ROUND_RECT_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestCanvasClipRoundRectNormal,
            OHOS::Rosen::Drawing::TestCanvasClipRoundRectNull,
            OHOS::Rosen::Drawing::TestCanvasClipRoundRectAbnormal,
            OHOS::Rosen::Drawing::TestCanvasClipRoundRectMaximum,
            OHOS::Rosen::Drawing::TestCanvasClipRoundRectInputDestroyed,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Canvas Part3 ClipPath related functions
napi_value DrawingCanvasClipPath(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, CANVAS_PART3_CLIP_PATH_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestCanvasClipPathNormal,
            OHOS::Rosen::Drawing::TestCanvasClipPathNull,
            OHOS::Rosen::Drawing::TestCanvasClipPathInputDestroyed,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Canvas Part3 Rotate related functions
napi_value DrawingCanvasRotate(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, CANVAS_PART3_ROTATE_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestCanvasRotateNormal,
            OHOS::Rosen::Drawing::TestCanvasRotateNull,
            OHOS::Rosen::Drawing::TestCanvasRotateAbnormal,
            OHOS::Rosen::Drawing::TestCanvasRotateMaximum,
            OHOS::Rosen::Drawing::TestCanvasRotateInputDestroyed,
            OHOS::Rosen::Drawing::TestCanvasRotateMultipleCalls,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Canvas Part3 Translate related functions
napi_value DrawingCanvasTranslate(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, CANVAS_PART3_TRANSLATE_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestCanvasTranslateNormal,
            OHOS::Rosen::Drawing::TestCanvasTranslateNull,
            OHOS::Rosen::Drawing::TestCanvasTranslateAbnormal,
            OHOS::Rosen::Drawing::TestCanvasTranslateMaximum,
            OHOS::Rosen::Drawing::TestCanvasTranslateInputDestroyed,
            OHOS::Rosen::Drawing::TestCanvasTranslateMultipleCalls,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Canvas Part3 Scale related functions
napi_value DrawingCanvasScale(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, CANVAS_PART3_SCALE_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestCanvasScaleNormal,
            OHOS::Rosen::Drawing::TestCanvasScaleNull,
            OHOS::Rosen::Drawing::TestCanvasScaleAbnormal,
            OHOS::Rosen::Drawing::TestCanvasScaleMaximum,
            OHOS::Rosen::Drawing::TestCanvasScaleInputDestroyed,
            OHOS::Rosen::Drawing::TestCanvasScaleMultipleCalls,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Canvas Part4 Skew related functions
napi_value DrawingCanvasSkew(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, CANVAS_PART4_SKEW_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestCanvasSkewNormal,
            OHOS::Rosen::Drawing::TestCanvasSkewNull,
            OHOS::Rosen::Drawing::TestCanvasSkewMaximum,
            OHOS::Rosen::Drawing::TestCanvasSkewInputDestroyed,
            OHOS::Rosen::Drawing::TestCanvasSkewMultipleCalls,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Canvas Part4 GetWidth/GetHeight related functions
napi_value DrawingCanvasGetWidthHeight(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, CANVAS_PART4_GET_WIDTH_HEIGHT_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestCanvasGetWidthtestCanvasGetHeightNormal,
            OHOS::Rosen::Drawing::TestCanvasGetWidthtestCanvasGetHeightNull,
            OHOS::Rosen::Drawing::TestCanvasGetWidthtestCanvasGetHeightMultipleCalls,
            OHOS::Rosen::Drawing::TestCanvasGetWidthtestCanvasGetHeightInputDestroyed,
            OHOS::Rosen::Drawing::TestCanvasGetWidthtestCanvasGetHeightMultipleCallsBoudary,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Canvas Part4 GetLocalClipBounds related functions
napi_value DrawingCanvasGetLocalClipBounds(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, CANVAS_PART4_GET_LOCAL_CLIP_BOUNDS_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestCanvasGetLocalClipBoundsNormal,
            OHOS::Rosen::Drawing::TestCanvasGetLocalClipBoundsNull,
            OHOS::Rosen::Drawing::TestCanvasGetLocalClipBoundsAbnormal,
            OHOS::Rosen::Drawing::TestCanvasGetLocalClipBoundsMultipleCalls,
            OHOS::Rosen::Drawing::TestCanvasGetLocalClipBoundsInputDestroyed,
            OHOS::Rosen::Drawing::TestCanvasGetLocalClipBoundsMultipleCallsBoundary,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Canvas Part4 ConcatMatrix/GetTotalMatrix related functions
napi_value DrawingCanvasConcatMatrix(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, CANVAS_PART4_CONCAT_MATRIX_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestCanvasConcatMatrixtestCanvasGetTotalMatrixNormal,
            OHOS::Rosen::Drawing::TestCanvasConcatMatrixNull,
            OHOS::Rosen::Drawing::TestCanvasGetTotalMatrixNull,
            OHOS::Rosen::Drawing::TestCanvasConcatMatrixtestCanvasGetTotalMatrixMultipleCalls,
            OHOS::Rosen::Drawing::TestCanvasConcatMatrixtestCanvasGetTotalMatrixInputDestroyed,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Canvas Part4 DrawShadow related functions
napi_value DrawingCanvasDrawShadow(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, CANVAS_PART4_DRAW_SHADOW_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestCanvasDrawShadowNormal,
            OHOS::Rosen::Drawing::TestCanvasDrawShadowNull,
            OHOS::Rosen::Drawing::TestCanvasDrawShadowAbnormal,
            OHOS::Rosen::Drawing::TestCanvasDrawShadowMaximum,
            OHOS::Rosen::Drawing::TestCanvasDrawShadowInputDestroyed,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Canvas Part4 Clear related functions
napi_value DrawingCanvasClear(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, CANVAS_PART4_CLEAR_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestCanvasClearNormal,
            OHOS::Rosen::Drawing::TestCanvasClearNull,
            OHOS::Rosen::Drawing::TestCanvasClearAbnormal,
            OHOS::Rosen::Drawing::TestCanvasClearMultipleCalls,
            OHOS::Rosen::Drawing::TestCanvasClearInputDestroyed,
            OHOS::Rosen::Drawing::TestCanvasClearMaximum,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Canvas Part4 SetMatrix related functions
napi_value DrawingCanvasSetMatrix(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, CANVAS_PART4_SET_MATRIX_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestCanvasSetMatrixNormal,
            OHOS::Rosen::Drawing::TestCanvasSetMatrixNull,
            OHOS::Rosen::Drawing::TestCanvasSetMatrixMultipleCalls,
            OHOS::Rosen::Drawing::TestCanvasSetMatrixInputDestroyed,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Canvas Part4 ResetMatrix related functions
napi_value DrawingCanvasResetMatrix(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, CANVAS_PART4_RESET_MATRIX_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestCanvasResetMatrixNormal,
            OHOS::Rosen::Drawing::TestCanvasResetMatrixNull,
            OHOS::Rosen::Drawing::TestCanvasResetMatrixMultipleCalls,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Canvas Part4 DrawImageRect related functions
napi_value DrawingCanvasDrawImageRect(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, CANVAS_PART4_DRAW_IMAGE_RECT_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestCanvasDrawImageRectWithSrcNormal,
            OHOS::Rosen::Drawing::TestCanvasDrawImageRectWithSrcNull,
            OHOS::Rosen::Drawing::TestCanvasDrawImageRectNormal,
            OHOS::Rosen::Drawing::TestCanvasDrawImageRectNull,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Canvas Part4 DrawVertices related functions
napi_value DrawingCanvasDrawVertices(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, CANVAS_PART4_DRAW_VERTICES_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestCanvasDrawVerticesNormal,
            OHOS::Rosen::Drawing::TestCanvasDrawVerticesNull,
            OHOS::Rosen::Drawing::TestCanvasDrawVerticesAbnormal,
            OHOS::Rosen::Drawing::TestCanvasDrawVerticesMaximum,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Canvas Part4 ReadPixels related functions
napi_value DrawingCanvasReadPixels(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, CANVAS_PART4_READ_PIXELS_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestCanvasReadPixelsNormal,
            OHOS::Rosen::Drawing::TestCanvasReadPixelsNull,
            OHOS::Rosen::Drawing::TestCanvasReadPixelsMismatch,
            OHOS::Rosen::Drawing::TestCanvasReadPixelsAbnormal,
            OHOS::Rosen::Drawing::TestCanvasReadPixelsMaximum,
            OHOS::Rosen::Drawing::TestCanvasReadPixelsBoundary,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Canvas Part4 ReadPixelsToBitmap related functions
napi_value DrawingCanvasReadPixelsToBitmap(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, CANVAS_PART4_READ_PIXELS_TO_BITMAP_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestCanvasReadPixelsToBitmapNormal,
            OHOS::Rosen::Drawing::TestCanvasReadPixelsToBitmapNull,
            OHOS::Rosen::Drawing::TestCanvasReadPixelsToBitmapAbnormal,
            OHOS::Rosen::Drawing::TestCanvasReadPixelsToBitmapMaximum,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Canvas Part4 DrawSingleCharacter related functions
napi_value DrawingCanvasDrawSingleCharacter(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, CANVAS_PART4_DRAW_SINGLE_CHARACTER_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestCanvasDrawSingleCharacter,
            OHOS::Rosen::Drawing::TestCanvasDrawSingleCharacterNormal,
            OHOS::Rosen::Drawing::TestCanvasDrawSingleCharacterNull,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Canvas Part4 DrawPoint related functions
napi_value DrawingCanvasDrawPoint(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, CANVAS_PART4_DRAW_POINT_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestCanvasDrawPointNormal,
            OHOS::Rosen::Drawing::TestCanvasDrawPointNull,
            OHOS::Rosen::Drawing::TestCanvasDrawPointMultipleCalls,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Canvas Part4 DrawColor related functions
napi_value DrawingCanvasDrawColor(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, CANVAS_PART4_DRAW_COLOR_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestCanvasDrawColorNormal,
            OHOS::Rosen::Drawing::TestCanvasDrawColorNull,
            OHOS::Rosen::Drawing::TestCanvasDrawColorMaximum,
            OHOS::Rosen::Drawing::TestCanvasDrawColorMultipleCalls,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Canvas Part4 IsClipEmpty related functions
napi_value DrawingCanvasIsClipEmpty(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, CANVAS_PART4_IS_CLIP_EMPTY_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestCanvasIsClipEmptyNormal,
            OHOS::Rosen::Drawing::TestCanvasIsClipEmptyNull,
            OHOS::Rosen::Drawing::TestCanvasIsClipEmptyMultipleCalls,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Canvas Part4 GetImageInfo related functions
napi_value DrawingCanvasGetImageInfo(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, CANVAS_PART4_GET_IMAGE_INFO_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestCanvasGetImageInfoNormal,
            OHOS::Rosen::Drawing::TestCanvasGetImageInfoNull,
            OHOS::Rosen::Drawing::TestCanvasGetImageInfoMultipleCalls,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Canvas Part4 ClipRegion related functions
napi_value DrawingCanvasClipRegion(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, CANVAS_PART4_CLIP_REGION_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestCanvasClipRegionNormal,
            OHOS::Rosen::Drawing::TestCanvasClipRegionNull,
            OHOS::Rosen::Drawing::TestCanvasClipRegionMultipleCalls,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Canvas Part5 QuickRejectPath related functions
napi_value DrawingCanvasQuickRejectPath(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, CANVAS_PART5_QUICK_REJECT_PATH_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestCanvasQuickRejectPathNull,
            OHOS::Rosen::Drawing::TestCanvasQuickRejectPathNormal,
            OHOS::Rosen::Drawing::TestCanvasQuickRejectPathCalls,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Canvas Part5 QuickRejectRect related functions
napi_value DrawingCanvasQuickRejectRect(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, CANVAS_PART5_QUICK_REJECT_RECT_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestCanvasQuickRejectRectNull,
            OHOS::Rosen::Drawing::TestCanvasQuickRejectRectNormal,
            OHOS::Rosen::Drawing::TestCanvasQuickRejectRectCalls,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Canvas Part5 DrawArcWithCenter related functions
napi_value DrawingCanvasDrawArcWithCenter(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, CANVAS_PART5_DRAW_ARC_WITH_CENTER_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestCanvasDrawArcWithCenterNull,
            OHOS::Rosen::Drawing::TestCanvasDrawArcWithCenterNormal,
            OHOS::Rosen::Drawing::TestCanvasDrawArcWithCenterCalls,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Canvas Part5 DrawNestedRoundRect related functions
napi_value DrawingCanvasDrawNestedRoundRect(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, CANVAS_PART5_DRAW_NESTED_ROUND_RECT_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestCanvasDrawNestedRoundRectNull,
            OHOS::Rosen::Drawing::TestCanvasDrawNestedRoundRectNormal,
            OHOS::Rosen::Drawing::TestCanvasDrawNestedRoundRectCalls,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Canvas Part5 DrawPixelMapNine related functions
napi_value DrawingCanvasDrawPixelMapNine(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, CANVAS_PART5_DRAW_PIXEL_MAP_NINE_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestCanvasDrawPixelMapNineNull,
            OHOS::Rosen::Drawing::TestCanvasDrawPixelMapNineNormal,
            OHOS::Rosen::Drawing::TestCanvasDrawPixelMapNineCalls,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Canvas Part5 CreateWithPixelMap related functions
napi_value DrawingCanvasCreateWithPixelMap(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, CANVAS_PART5_CREATE_WITH_PIXEL_MAP_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestCanvasCreateWithPixelMapNormal,
            OHOS::Rosen::Drawing::TestCanvasCreateWithPixelMapNull,
            OHOS::Rosen::Drawing::TestCanvasCreateWithPixelMapMultipleCalls,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Canvas Part5 DrawPixelMapRectConstraint related functions
napi_value DrawingCanvasDrawPixelMapRectConstraint(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, CANVAS_PART5_DRAW_PIXEL_MAP_RECT_CONSTRAINT_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestCanvasDrawPixelMapRectConstraintNormal,
            OHOS::Rosen::Drawing::TestCanvasDrawPixelMapRectConstraintNull,
            OHOS::Rosen::Drawing::TestCanvasDrawPixelMapRectConstraintAbnormal,
            OHOS::Rosen::Drawing::TestCanvasDrawPixelMapRectConstraintMultiCalls,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

