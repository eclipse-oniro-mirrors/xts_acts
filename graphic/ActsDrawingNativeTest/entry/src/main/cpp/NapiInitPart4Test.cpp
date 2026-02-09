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

// Region Part2 Empty/GetBoundary/GetBounds/IsComplex/IsEmpty/IsRect related functions
napi_value DrawingRegionPart2QueryOperations(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, REGION_PART2_QUERY_OPERATIONS_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestRegionEmptyNormal,
            OHOS::Rosen::Drawing::TestRegionEmptyNull,
            OHOS::Rosen::Drawing::TestRegionEmptyCalls,
            OHOS::Rosen::Drawing::TestRegionGetBoundaryNormal,
            OHOS::Rosen::Drawing::TestRegionGetBoundaryNull,
            OHOS::Rosen::Drawing::TestRegionGetBoundaryMultipleCalls,
            OHOS::Rosen::Drawing::TestRegionGetBoundsNormal,
            OHOS::Rosen::Drawing::TestRegionGetBoundsNull,
            OHOS::Rosen::Drawing::TestRegionGetBoundsMultipleCalls,
            OHOS::Rosen::Drawing::TestRegionIsComplexNormal,
            OHOS::Rosen::Drawing::TestRegionIsComplexNull,
            OHOS::Rosen::Drawing::TestRegionIsComplexMultipleCalls,
            OHOS::Rosen::Drawing::TestRegionIsEmptyNormal,
            OHOS::Rosen::Drawing::TestRegionIsEmptyNull,
            OHOS::Rosen::Drawing::TestRegionIsEmptyMultipleCalls,
            OHOS::Rosen::Drawing::TestRegionIsRectNormal,
            OHOS::Rosen::Drawing::TestRegionIsRectNull,
            OHOS::Rosen::Drawing::TestRegionIsRectMultipleCalls,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Region Advanced Operations related functions
napi_value DrawingRegionAdvancedOperations(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, REGION_ADVANCED_OPERATIONS_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestRegionQuickContainsNormal,
            OHOS::Rosen::Drawing::TestRegionQuickContainsNull,
            OHOS::Rosen::Drawing::TestRegionQuickContainsAbnormal,
            OHOS::Rosen::Drawing::TestRegionQuickContainsMultipleCalls,
            OHOS::Rosen::Drawing::TestRegionQuickRejectNormal,
            OHOS::Rosen::Drawing::TestRegionQuickRejectNull,
            OHOS::Rosen::Drawing::TestRegionQuickRejectAbnormal,
            OHOS::Rosen::Drawing::TestRegionQuickRejectMultipleCalls,
            OHOS::Rosen::Drawing::TestRegionTranslateNormal,
            OHOS::Rosen::Drawing::TestRegionTranslateNull,
            OHOS::Rosen::Drawing::TestRegionTranslateMultipleCalls,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}
// Path Iterator related functions
napi_value DrawingPathIterator(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, PATH_ITERATOR_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestPathIteratorCreateNormal,
            OHOS::Rosen::Drawing::TestPathIteratorCreateNull,
            OHOS::Rosen::Drawing::TestPathIteratorCreateMultipleCalls,
            OHOS::Rosen::Drawing::TestPathIteratorDestroyNormal,
            OHOS::Rosen::Drawing::TestPathIteratorDestroyNull,
            OHOS::Rosen::Drawing::TestPathIteratorHasNextNormal,
            OHOS::Rosen::Drawing::TestPathIteratorHasNextNull,
            OHOS::Rosen::Drawing::TestPathIteratorNextNormal,
            OHOS::Rosen::Drawing::TestPathIteratorNextNull,
            OHOS::Rosen::Drawing::TestPathIteratorPeekNormal,
            OHOS::Rosen::Drawing::TestPathIteratorPeekNull,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Path Part4 InverseFillType related functions
napi_value DrawingPathPart4InverseFillType(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, PATH_PART4_INVERSE_FILL_TYPE_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestPathIsInverseFillTypeNormalOne,
            OHOS::Rosen::Drawing::TestPathIsInverseFillTypeNormalTwo,
            OHOS::Rosen::Drawing::TestPathIsInverseFillTypeNormalThree,
            OHOS::Rosen::Drawing::TestPathIsInverseFillTypeNormalFour,
            OHOS::Rosen::Drawing::TestPathIsInverseFillTypeNull,
            OHOS::Rosen::Drawing::TestPathToggleInverseFillTypeNull,
            OHOS::Rosen::Drawing::TestPathIsInverseFillTypeCalls,
            OHOS::Rosen::Drawing::TestPathToggleInverseFillTypeCalls,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Canvas Part7 DrawPixelMapMesh related functions
napi_value DrawingCanvasDrawPixelMapMesh(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, CANVAS_PART5_DRAW_PIXEL_MAP_MESH_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestCanvasDrawPixelMapMeshNormal,
            OHOS::Rosen::Drawing::TestCanvasDrawPixelMapMeshNull01,
            OHOS::Rosen::Drawing::TestCanvasDrawPixelMapMeshNull02,
            OHOS::Rosen::Drawing::TestCanvasDrawPixelMapMeshNull03,
            OHOS::Rosen::Drawing::TestCanvasDrawPixelMapMeshNull04,
            OHOS::Rosen::Drawing::TestCanvasDrawPixelMapMeshBindAndUnbind,
            OHOS::Rosen::Drawing::TestCanvasDrawPixelMapMeshAbnormal01,
            OHOS::Rosen::Drawing::TestCanvasDrawPixelMapMeshAbnormal02,
            OHOS::Rosen::Drawing::TestCanvasDrawPixelMapMeshAbnormal03,
            OHOS::Rosen::Drawing::TestCanvasDrawPixelMapMeshAbnormal04,
            OHOS::Rosen::Drawing::TestCanvasDrawPixelMapMeshMultipleCalls,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Lattice related functions
napi_value DrawingLattice(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, LATTICE_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestLatticeCreateNormal,
            OHOS::Rosen::Drawing::TestLatticeCreateNull,
            OHOS::Rosen::Drawing::TestLatticeCreateAbnormal,
            OHOS::Rosen::Drawing::TestLatticeCreateEnumTraversal,
            OHOS::Rosen::Drawing::TestLatticeCreateMultipleCalls,
            OHOS::Rosen::Drawing::TestLatticeDestroyNormal,
            OHOS::Rosen::Drawing::TestLatticeDestroyNull,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Rect Part2 Inset/Contains/SetEmpty/IsEmpty/Offset/OffsetTo/Sort/Union related functions
napi_value DrawingRectPart2OtherOperations(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, RECT_PART2_OTHER_OPERATIONS_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestRectInsetNormal,
            OHOS::Rosen::Drawing::TestRectInsetAbNormal,
            OHOS::Rosen::Drawing::TestRectInsetNull,
            OHOS::Rosen::Drawing::TestRectInsetCalls,
            OHOS::Rosen::Drawing::TestRectContainsNormal,
            OHOS::Rosen::Drawing::TestRectContainsNull,
            OHOS::Rosen::Drawing::TestRectContainsCalls,
            OHOS::Rosen::Drawing::TestRectSetEmptyNormal,
            OHOS::Rosen::Drawing::TestRectSetEmptyNull,
            OHOS::Rosen::Drawing::TestRectSetEmptyMultipleCalls,
            OHOS::Rosen::Drawing::TestRectIsEmptyNormal,
            OHOS::Rosen::Drawing::TestRectIsEmptyNull,
            OHOS::Rosen::Drawing::TestRectIsEmptyMultipleCalls,
            OHOS::Rosen::Drawing::TestRectOffsetNormal,
            OHOS::Rosen::Drawing::TestRectOffsetNull,
            OHOS::Rosen::Drawing::TestRectOffsetAbnormal,
            OHOS::Rosen::Drawing::TestRectOffsetMultipleCalls,
            OHOS::Rosen::Drawing::TestRectOffsetToNormal,
            OHOS::Rosen::Drawing::TestRectOffsetToNull,
            OHOS::Rosen::Drawing::TestRectOffsetToAbnormal,
            OHOS::Rosen::Drawing::TestRectOffsetToMultipleCalls,
            OHOS::Rosen::Drawing::TestRectSortNormal,
            OHOS::Rosen::Drawing::TestRectSortNull,
            OHOS::Rosen::Drawing::TestRectSortMultipleCalls,
            OHOS::Rosen::Drawing::TestRectUnionNormal,
            OHOS::Rosen::Drawing::TestRectUnionNull,
            OHOS::Rosen::Drawing::TestRectUnionMultipleCalls,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Typeface IsBold/IsItalic related functions
napi_value DrawingTypefaceIsBoldItalic(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, TYPEFACE_IS_BOLD_ITALIC_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestTypefaceIsBoldNormal,
            OHOS::Rosen::Drawing::TestTypefaceIsBoldNull,
            OHOS::Rosen::Drawing::TestTypefaceIsBoldMultipleCalls,
            OHOS::Rosen::Drawing::TestTypefaceIsItalicNormal,
            OHOS::Rosen::Drawing::TestTypefaceIsItalicNull,
            OHOS::Rosen::Drawing::TestTypefaceIsItalicMultipleCalls,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Matrix Part3 related functions
napi_value DrawingMatrixPart3(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, MATRIX_PART3_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestMatrixPerConcatNormal,
            OHOS::Rosen::Drawing::TestMatrixPerConcatNull1,
            OHOS::Rosen::Drawing::TestMatrixPerConcatNull2,
            OHOS::Rosen::Drawing::TestMatrixPerConcatCalls,
            OHOS::Rosen::Drawing::TestMatrixIsAffineNormal,
            OHOS::Rosen::Drawing::TestMatrixIsAffineNull,
            OHOS::Rosen::Drawing::TestMatrixIsAffineMultipleCalls,
            OHOS::Rosen::Drawing::TestMatrixPreSkewNormal,
            OHOS::Rosen::Drawing::TestMatrixPreSkewNull,
            OHOS::Rosen::Drawing::TestMatrixPreSkewMultipleCalls,
            OHOS::Rosen::Drawing::TestMatrixRectStaysRectNormal,
            OHOS::Rosen::Drawing::TestMatrixRectStaysRectNull,
            OHOS::Rosen::Drawing::TestMatrixRectStaysRectMultipleCalls,
            OHOS::Rosen::Drawing::TestMatrixSetSinCosNormal,
            OHOS::Rosen::Drawing::TestMatrixSetSinCosNull,
            OHOS::Rosen::Drawing::TestMatrixSetSinCosMultipleCalls,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}
