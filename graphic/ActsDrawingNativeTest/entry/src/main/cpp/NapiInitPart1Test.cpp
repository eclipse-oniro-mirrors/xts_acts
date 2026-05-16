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

napi_value DrawingCanvasDrawRecordCmd(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, CANVAS_DRAW_RECORD_CMD_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestCanvasDrawRecordCmdNormal,
            OHOS::Rosen::Drawing::TestCanvasDrawRecordCmdABNormal,
            OHOS::Rosen::Drawing::TestCanvasDrawRecordCmdNestingNormal,
            OHOS::Rosen::Drawing::TestCanvasDrawRecordCmdNestingAbNormal,
            OHOS::Rosen::Drawing::TestCanvasDrawRecordCmdNestingAbNormal1,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// RecordCmd Destroy related functions
napi_value DrawingRecordCmdDestroy(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, RECORD_CMD_DESTROY_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestRecordCmdDestroyNormal,
            OHOS::Rosen::Drawing::TestRecordCmdDestroyNULL,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// RecordCmdUtils BeginRecording related functions
napi_value DrawingRecordCmdUtilsBeginRecording(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, RECORD_CMD_UTILS_BEGIN_RECORDING_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestRecordCmdUtilsBeginRecordingAbnormal,
            OHOS::Rosen::Drawing::TestRecordCmdUtilsBeginRecordingCalls,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// RecordCmdUtils FinishRecording related functions
napi_value DrawingRecordCmdUtilsFinishRecording(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, RECORD_CMD_UTILS_FINISH_RECORDING_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestRecordCmdUtilsFinishRecordingNormal,
            OHOS::Rosen::Drawing::TestRecordCmdUtilsFinishRecordingNull,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// RecordCmdUtils Destroy related functions
napi_value DrawingRecordCmdUtilsDestroy(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, RECORD_CMD_UTILS_DESTROY_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestRecordCmdUtilsDestroyNormal,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Canvas DrawSingleCharacterWithFeatures related functions
napi_value DrawingCanvasDrawSingleChaWithFeatures(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, CANVAS_DRAW_SINGLE_CHA_WITH_FEATURES_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestCanvasDrawSingleChaWithFeaturesNormal,
            OHOS::Rosen::Drawing::TestCanvasDrawSingleChaWithFeaturesAbNormal,
            OHOS::Rosen::Drawing::TestCanvasDrawSingleChaWithFeaturesCalls,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Memory Stream related functions
napi_value DrawingMemoryStream(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, MEMORY_STREAM_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestMemoryStreamCreateNormal,
            OHOS::Rosen::Drawing::TestMemoryStreamCreateNull,
            OHOS::Rosen::Drawing::TestMemoryStreamCreateAbnormal,
            OHOS::Rosen::Drawing::TestMemoryStreamCreateMultipleCalls,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Point Create related functions
napi_value DrawingPointCreate(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, POINT_CREATE_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestPointCreateNormal,
            OHOS::Rosen::Drawing::TestPointCreateNull,
            OHOS::Rosen::Drawing::TestPointCreateAbnormal,
            OHOS::Rosen::Drawing::TestPointCreateMaximum,
            OHOS::Rosen::Drawing::TestPointCreateMultipleCalls,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Point Destroy related functions
napi_value DrawingPointDestroy(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, POINT_DESTROY_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestPointDestroyNormal,
            OHOS::Rosen::Drawing::TestPointDestroyNull,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Point GetSet related functions
napi_value DrawingPointGetSet(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, POINT_GET_SET_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestPointGetXNormal,
            OHOS::Rosen::Drawing::TestPointGetXNull,
            OHOS::Rosen::Drawing::TestPointGetXMultipleCalls,
            OHOS::Rosen::Drawing::TestPointGetYNormal,
            OHOS::Rosen::Drawing::TestPointGetYNull,
            OHOS::Rosen::Drawing::TestPointGetYMultipleCalls,
            OHOS::Rosen::Drawing::TestPointSetNormal,
            OHOS::Rosen::Drawing::TestPointSetNull,
            OHOS::Rosen::Drawing::TestPointSetMultipleCalls,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Region Basic Operations related functions
napi_value DrawingRegionBasicOperations(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, REGION_BASIC_OPERATIONS_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestRegionCreateNormal,
            OHOS::Rosen::Drawing::TestRegionCreateMoreTimes,
            OHOS::Rosen::Drawing::TestRegionDestroyNormal,
            OHOS::Rosen::Drawing::TestRegionDestroyNull,
            OHOS::Rosen::Drawing::TestRegionSetRectResultTrue,
            OHOS::Rosen::Drawing::TestRegionSetRectRegionNull,
            OHOS::Rosen::Drawing::TestRegionSetRectRectNull,
            OHOS::Rosen::Drawing::TestRegionSetRectResultFalse,
            OHOS::Rosen::Drawing::TestRegionSetPathResultTrue,
            OHOS::Rosen::Drawing::TestRegionSetPathRegionNull,
            OHOS::Rosen::Drawing::TestRegionSetPathResultFalse,
            OHOS::Rosen::Drawing::TestRegionCopyNormal,
            OHOS::Rosen::Drawing::TestRegionCopyNull,
            OHOS::Rosen::Drawing::TestRegionCopyAbnormal,
            OHOS::Rosen::Drawing::TestRegionCopyMultipleCalls,
            OHOS::Rosen::Drawing::TestRegionOpNormal,
            OHOS::Rosen::Drawing::TestRegionOpRegionNull,
            OHOS::Rosen::Drawing::TestRegionOpMultipleCalls,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Region Query Operations related functions
// Region Contains related functions
napi_value DrawingRegionQueryOperations(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, REGION_QUERY_OPERATIONS_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestRegionContainsInRange,
            OHOS::Rosen::Drawing::TestRegionContainsXvalueNotInRange,
            OHOS::Rosen::Drawing::TestRegionContainsYvalueNotInRange,
            OHOS::Rosen::Drawing::TestRegionContainsAllNotInRange,
            OHOS::Rosen::Drawing::TestRegionContainsRegionNull,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Path Effect related functions
napi_value DrawingPathEffect(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, PATH_EFFECT_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestCreateDashPathEffectNormal,
            OHOS::Rosen::Drawing::TestCreateDashPathEffectNull,
            OHOS::Rosen::Drawing::TestCreateDashPathEffectAbnormal,
            OHOS::Rosen::Drawing::TestCreateDashPathEffectMultipleCalls,
            OHOS::Rosen::Drawing::TestPathEffectDestroyNormal,
            OHOS::Rosen::Drawing::TestPathEffectDestroyNull,
            OHOS::Rosen::Drawing::TestCreateCornerPathEffectNormal,
            OHOS::Rosen::Drawing::TestCreateCornerPathEffectNull,
            OHOS::Rosen::Drawing::TestCreateCornerPathEffectAbnormal,
            OHOS::Rosen::Drawing::TestCreateDiscreatePathEffectNormal,
            OHOS::Rosen::Drawing::TestCreateDiscreatePathEffectNull,
            OHOS::Rosen::Drawing::TestCreateDiscreatePathEffectAbnormal,
            OHOS::Rosen::Drawing::TestCreateComposePathEffectNormal,
            OHOS::Rosen::Drawing::TestCreateComposePathEffectNull,
            OHOS::Rosen::Drawing::TestCreatePathDashEffectNormal,
            OHOS::Rosen::Drawing::TestCreatePathDashEffectNull,
            OHOS::Rosen::Drawing::TestCreatePathDashEffectAbnormal,
            OHOS::Rosen::Drawing::TestCreateSumPathEffectNormal,
            OHOS::Rosen::Drawing::TestCreateSumPathEffectNull,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Path Basic related functions (Create/Destroy/Copy + MoveTo/LineTo + ArcTo/QuadTo/ConicTo/CubicTo)
napi_value DrawingPathBasic(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, PATH_BASIC_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestPathCreateNormal,
            OHOS::Rosen::Drawing::TestPathCopyNormal,
            OHOS::Rosen::Drawing::TestPathCopyNull,
            OHOS::Rosen::Drawing::TestPathCopyInputDestroyed,
            OHOS::Rosen::Drawing::TestPathDestroyNormal,
            OHOS::Rosen::Drawing::TestPathDestroyNull,
            OHOS::Rosen::Drawing::TestPathMoveToNormal,
            OHOS::Rosen::Drawing::TestPathMoveToNull,
            OHOS::Rosen::Drawing::TestPathMoveToAbnormal,
            OHOS::Rosen::Drawing::TestPathMoveToMaximal,
            OHOS::Rosen::Drawing::TestPathLineToNormal,
            OHOS::Rosen::Drawing::TestPathLineToNull,
            OHOS::Rosen::Drawing::TestPathLineToAbnormal,
            OHOS::Rosen::Drawing::TestPathLineToMaximal,
            OHOS::Rosen::Drawing::TestPathArcToNormal,
            OHOS::Rosen::Drawing::TestPathArcToNull,
            OHOS::Rosen::Drawing::TestPathArcToAbnormal,
            OHOS::Rosen::Drawing::TestPathArcToMaximal,
            OHOS::Rosen::Drawing::TestPathQuadToNormal,
            OHOS::Rosen::Drawing::TestPathQuadToNull,
            OHOS::Rosen::Drawing::TestPathQuadToAbnormal,
            OHOS::Rosen::Drawing::TestPathQuadToMaximal,
            OHOS::Rosen::Drawing::TestPathConicToNormal,
            OHOS::Rosen::Drawing::TestPathConicToNull,
            OHOS::Rosen::Drawing::TestPathConicToAbnormal,
            OHOS::Rosen::Drawing::TestPathConicToMaximal,
            OHOS::Rosen::Drawing::TestPathCubicToNormal,
            OHOS::Rosen::Drawing::TestPathCubicToNull,
            OHOS::Rosen::Drawing::TestPathCubicToAbnormal,
            OHOS::Rosen::Drawing::TestPathCubicToMaximal,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Path Relative related functions (RMoveTo/RLineTo/RQuadTo/RConicTo/RCubicTo)
napi_value DrawingPathRelative(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, PATH_RELATIVE_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestPathRMoveToNormal,
            OHOS::Rosen::Drawing::TestPathRMoveToNull,
            OHOS::Rosen::Drawing::TestPathRMoveToAbnormal,
            OHOS::Rosen::Drawing::TestPathRMoveToMaximal,
            OHOS::Rosen::Drawing::TestPathRLineToNormal,
            OHOS::Rosen::Drawing::TestPathRLineToNull,
            OHOS::Rosen::Drawing::TestPathRLineToAbnormal,
            OHOS::Rosen::Drawing::TestPathRLineToMaximal,
            OHOS::Rosen::Drawing::TestPathRQuadToNormal,
            OHOS::Rosen::Drawing::TestPathRQuadToNull,
            OHOS::Rosen::Drawing::TestPathRQuadToAbnormal,
            OHOS::Rosen::Drawing::TestPathRQuadToMaximal,
            OHOS::Rosen::Drawing::TestPathRConicToNormal,
            OHOS::Rosen::Drawing::TestPathRConicToNull,
            OHOS::Rosen::Drawing::TestPathRConicToAbnormal,
            OHOS::Rosen::Drawing::TestPathRConicToMaximal,
            OHOS::Rosen::Drawing::TestPathRCubicToNormal,
            OHOS::Rosen::Drawing::TestPathRCubicToNull,
            OHOS::Rosen::Drawing::TestPathRCubicToAbnormal,
            OHOS::Rosen::Drawing::TestPathRCubicToMaximal,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Path Add Shape related functions (AddRect/AddRoundRect/AddOval)
napi_value DrawingPathAddShape(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, PATH_ADD_SHAPE_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestPathAddRectNormal,
            OHOS::Rosen::Drawing::TestPathAddRectNull,
            OHOS::Rosen::Drawing::TestPathAddRectAbnormal,
            OHOS::Rosen::Drawing::TestPathAddRectMaximal,
            OHOS::Rosen::Drawing::TestPathAddRectWithInitialCornerNormal,
            OHOS::Rosen::Drawing::TestPathAddRectWithInitialCornerNull,
            OHOS::Rosen::Drawing::TestPathAddRectWithInitialCornerAbnormal,
            OHOS::Rosen::Drawing::TestPathAddRectWithInitialCornerMaximal,
            OHOS::Rosen::Drawing::TestPathAddRoundRectNormal,
            OHOS::Rosen::Drawing::TestPathAddRoundRectNull,
            OHOS::Rosen::Drawing::TestPathAddOvalWithInitialPointNormal,
            OHOS::Rosen::Drawing::TestPathAddOvalWithInitialPointNull,
            OHOS::Rosen::Drawing::TestPathAddOvalWithInitialPointAbnormal,
            OHOS::Rosen::Drawing::TestPathAddOvalWithInitialPointMaximal,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Path Part2 Add related functions (AddArc/AddPath/AddOval/AddPolygon/AddCircle)
napi_value DrawingPathPart2Add(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, PATH_PART2_ADD_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestPathAddArcNormal,
            OHOS::Rosen::Drawing::TestPathAddArcNull,
            OHOS::Rosen::Drawing::TestPathAddArcAbnormal,
            OHOS::Rosen::Drawing::TestPathAddArcMaximal,
            OHOS::Rosen::Drawing::TestPathAddPathNormal,
            OHOS::Rosen::Drawing::TestPathAddPathNull,
            OHOS::Rosen::Drawing::TestPathAddPathWithMatrixAndModeNormal,
            OHOS::Rosen::Drawing::TestPathAddPathWithMatrixAndModeNull,
            OHOS::Rosen::Drawing::TestPathAddPathWithModeNormal,
            OHOS::Rosen::Drawing::TestPathAddPathWithModeNull,
            OHOS::Rosen::Drawing::TestPathAddPathWithOffsetAndModeNormal,
            OHOS::Rosen::Drawing::TestPathAddPathWithOffsetAndModeNull,
            OHOS::Rosen::Drawing::TestPathAddPathWithOffsetAndModeAbnormal,
            OHOS::Rosen::Drawing::TestPathAddPathWithOffsetAndModeMaximal,
            OHOS::Rosen::Drawing::TestPathAddOvalNormal,
            OHOS::Rosen::Drawing::TestPathAddOvalNull,
            OHOS::Rosen::Drawing::TestPathAddPolygonNormal,
            OHOS::Rosen::Drawing::TestPathAddPolygonNormal2,
            OHOS::Rosen::Drawing::TestPathAddPolygonNull,
            OHOS::Rosen::Drawing::TestPathAddPolygonAbnormal,
            OHOS::Rosen::Drawing::TestPathAddPolygonMaximal,
            OHOS::Rosen::Drawing::TestPathAddCircleNormal,
            OHOS::Rosen::Drawing::TestPathAddCircleNull,
            OHOS::Rosen::Drawing::TestPathAddCircleAbnormal,
            OHOS::Rosen::Drawing::TestPathAddCircleMaximal,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Path Part2 Transform/Contains/Build related functions
napi_value DrawingPathPart2Transform(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, PATH_PART2_TRANSFORM_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestPathBuildFromSvgStringNormal,
            OHOS::Rosen::Drawing::TestPathBuildFromSvgStringNull,
            OHOS::Rosen::Drawing::TestPathContainsNormal,
            OHOS::Rosen::Drawing::TestPathContainsNull,
            OHOS::Rosen::Drawing::TestPathContainsAbnormal,
            OHOS::Rosen::Drawing::TestPathContainsMaximal,
            OHOS::Rosen::Drawing::TestPathTransformNormal,
            OHOS::Rosen::Drawing::TestPathTransformNull,
            OHOS::Rosen::Drawing::TestPathTransformWithPerspectiveClipNormal,
            OHOS::Rosen::Drawing::TestPathTransformWithPerspectiveClipNormal2,
            OHOS::Rosen::Drawing::TestPathTransformWithPerspectiveClipNull,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Path Part2 Get/Set/Close/Offset/Reset related functions
napi_value DrawingPathPart2GetSet(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, PATH_PART2_GET_SET_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestPathSetFillTypeNormal,
            OHOS::Rosen::Drawing::TestPathSetFillTypeNull,
            OHOS::Rosen::Drawing::TestPathSetFillTypeMultipleCalls,
            OHOS::Rosen::Drawing::TestPathGetLengthNormal,
            OHOS::Rosen::Drawing::TestPathGetLengthNormal2,
            OHOS::Rosen::Drawing::TestPathGetLengthNull,
            OHOS::Rosen::Drawing::TestPathGetBoundsNormal,
            OHOS::Rosen::Drawing::TestPathGetBoundsNull,
            OHOS::Rosen::Drawing::TestPathCloseNormal,
            OHOS::Rosen::Drawing::TestPathCloseNull,
            OHOS::Rosen::Drawing::TestPathOffsetNormal,
            OHOS::Rosen::Drawing::TestPathOffsetNull,
            OHOS::Rosen::Drawing::TestPathOffsetAbnormal,
            OHOS::Rosen::Drawing::TestPathOffsetMaximal,
            OHOS::Rosen::Drawing::TestPathResetNormal,
            OHOS::Rosen::Drawing::TestPathResetNull,
            OHOS::Rosen::Drawing::TestPathResetMultipleCalls,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Path Part3 Query related functions (IsClosed/IsEmpty/IsRect/GetFillType/IsInverseFillType)
napi_value DrawingPathPart3Query(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, PATH_PART3_QUERY_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestPathIsClosedNormal,
            OHOS::Rosen::Drawing::TestPathIsClosedNormal2,
            OHOS::Rosen::Drawing::TestPathIsClosedNull,
            OHOS::Rosen::Drawing::TestPathIsEmptyNormal,
            OHOS::Rosen::Drawing::TestPathIsEmptyNull,
            OHOS::Rosen::Drawing::TestPathIsEmptyMultipleCalls,
            OHOS::Rosen::Drawing::TestPathIsRectNormal,
            OHOS::Rosen::Drawing::TestPathIsRectNull,
            OHOS::Rosen::Drawing::TestPathIsRectMultipleCalls,
            OHOS::Rosen::Drawing::TestPathGetFillTypeNormal,
            OHOS::Rosen::Drawing::TestPathGetFillTypeNull,
            OHOS::Rosen::Drawing::TestPathGetFillTypeMultipleCalls,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Path Part3 Transform related functions (GetPositionTangent/GetMatrix/GetSegment/Op)
napi_value DrawingPathPart3Transform(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, PATH_PART3_TRANSFORM_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestPathGetPositionTangentNormal,
            OHOS::Rosen::Drawing::TestPathGetPositionTangentNormal2,
            OHOS::Rosen::Drawing::TestPathGetPositionTangentNull,
            OHOS::Rosen::Drawing::TestPathGetPositionTangentAbnormal,
            OHOS::Rosen::Drawing::TestPathGetPositionTangentMaximal,
            OHOS::Rosen::Drawing::TestPathOpNormal,
            OHOS::Rosen::Drawing::TestPathOpNull,
            OHOS::Rosen::Drawing::TestPathGetMatrixNormal,
            OHOS::Rosen::Drawing::TestPathGetMatrixNormal2,
            OHOS::Rosen::Drawing::TestPathGetMatrixNull,
            OHOS::Rosen::Drawing::TestPathGetMatrixAbnormal,
            OHOS::Rosen::Drawing::TestPathGetMatrixMaximal,
            OHOS::Rosen::Drawing::TestPathGetSegmentNormal,
            OHOS::Rosen::Drawing::TestPathGetSegmentNull,
            OHOS::Rosen::Drawing::TestPathGetSegmentAbnormal,
            OHOS::Rosen::Drawing::TestPathGetSegmentMultiplies,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Path Part3 Advanced related functions (SetPath/Approximate/Interpolate)
napi_value DrawingPathPart3Advanced(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, PATH_PART3_ADVANCED_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestPathSetPathNormal,
            OHOS::Rosen::Drawing::TestPathSetPathNull,
            OHOS::Rosen::Drawing::TestPathSetPathMulptiCalls,
            OHOS::Rosen::Drawing::TestPathApproximateNormal,
            OHOS::Rosen::Drawing::TestPathApproximateNull,
            OHOS::Rosen::Drawing::TestPathApproximateAbnormal,
            OHOS::Rosen::Drawing::TestPathApproximateMultiCalls,
            OHOS::Rosen::Drawing::TestPathInterpolateNormal,
            OHOS::Rosen::Drawing::TestPathInterpolateNull,
            OHOS::Rosen::Drawing::TestPathInterpolateAbnormal,
            OHOS::Rosen::Drawing::TestPathInterpolateMultiCalls,
            OHOS::Rosen::Drawing::TestPathIsInterpolateNormal,
            OHOS::Rosen::Drawing::TestPathIsInterpolateNull,
            OHOS::Rosen::Drawing::TestPathIsInterpolateMultiCalls,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Canvas Destroy related functions
napi_value DrawingCanvasDestroy(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, CANVAS_DESTROY_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestCanvasDestroyNormal,
            OHOS::Rosen::Drawing::TestCanvasDestroyNull,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Canvas Bind related functions
napi_value DrawingCanvasBind(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, CANVAS_BIND_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestCanvasBindNormal,
            OHOS::Rosen::Drawing::TestCanvasBindNull,
            OHOS::Rosen::Drawing::TestCanvasBindDestroyBitmap,
            OHOS::Rosen::Drawing::TestCanvasBindMultipleCalls,
            OHOS::Rosen::Drawing::TestCanvasBindBoundaryMultipleCallsBoundary,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Canvas Save related functions
napi_value DrawingCanvasSave(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, CANVAS_SAVE_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestCanvasSaveNormal,
            OHOS::Rosen::Drawing::TestCanvasSavetestCanvasGetSaveCountNull,
            OHOS::Rosen::Drawing::TestCanvasSavetestCanvasGetSaveCountMultipleCalls,
            OHOS::Rosen::Drawing::TestCanvasSavetestCanvasGetSaveCountInputDestroyed,
            OHOS::Rosen::Drawing::TestCanvasGetSaveCountWhenNoSave,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Canvas SaveLayer related functions
napi_value DrawingCanvasSaveLayer(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, CANVAS_SAVE_LAYER_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestCanvasSaveLayerNormal,
            OHOS::Rosen::Drawing::TestCanvasSaveLayerNull,
            OHOS::Rosen::Drawing::TestCanvasSaveLayerAbnormal,
            OHOS::Rosen::Drawing::TestCanvasSaveLayerRestore,
            OHOS::Rosen::Drawing::TestCanvasSaveLayerMultipleCalls,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Canvas Restore related functions
napi_value DrawingCanvasRestore(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, CANVAS_RESTORE_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestCanvasRestoreNormal,
            OHOS::Rosen::Drawing::TestCanvasRestoreNull,
            OHOS::Rosen::Drawing::TestCanvasRestoreMultipleCalls,
            OHOS::Rosen::Drawing::TestCanvasRestoreBeforeSave,
            OHOS::Rosen::Drawing::TestCanvasRestoreInputDestroyed,
            OHOS::Rosen::Drawing::TestCanvasRestoreExceededSaveSavelayerTimes,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Canvas RestoreToCount related functions
napi_value DrawingCanvasRestoreToCount(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, CANVAS_RESTORE_TO_COUNT_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestCanvasRestoreToCountNormal,
            OHOS::Rosen::Drawing::TestCanvasRestoreToCountNull,
            OHOS::Rosen::Drawing::TestCanvasRestoreToCountAbnormal,
            OHOS::Rosen::Drawing::TestCanvasRestoreToCountMaximum,
            OHOS::Rosen::Drawing::TestCanvasRestoreToCountExceeded,
            OHOS::Rosen::Drawing::TestCanvasRestoreToCountInputDestroyed,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Canvas DrawLine related functions
napi_value DrawingCanvasDrawLine(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, CANVAS_DRAW_LINE_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestCanvasDrawLineNormal,
            OHOS::Rosen::Drawing::TestCanvasDrawLineNull,
            OHOS::Rosen::Drawing::TestCanvasDrawLineAbnormal,
            OHOS::Rosen::Drawing::TestCanvasDrawLineMaximum,
            OHOS::Rosen::Drawing::TestCanvasDrawLineInputDestroyed,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Canvas DrawPath related functions
napi_value DrawingCanvasDrawPath(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, CANVAS_DRAW_PATH_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestCanvasDrawPathNormal,
            OHOS::Rosen::Drawing::TestCanvasDrawPathNull,
            OHOS::Rosen::Drawing::TestCanvasDrawPathInputDestroyed,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Canvas attach related functions
napi_value DrawingCanvasAttach(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, CANVAS_ATTACH_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestCanvasAttachPenDetachPenNormal,
            OHOS::Rosen::Drawing::TestCanvasAttachPenDetachPenNull,
            OHOS::Rosen::Drawing::TestCanvasAttachPenDetachPenMultipleCalls,
            OHOS::Rosen::Drawing::TestCanvasAttachPenOnly,
            OHOS::Rosen::Drawing::TestCanvasAttachPenDetachPenBoundary,
            OHOS::Rosen::Drawing::TestCanvasAttachBrushDetachBrushNormal,
            OHOS::Rosen::Drawing::TestCanvasAttachBrushDetachBrushNull,
            OHOS::Rosen::Drawing::TestCanvasAttachBrushDetachBrushMultipleCalls,
            OHOS::Rosen::Drawing::TestCanvasAttachBrushOnly,
            OHOS::Rosen::Drawing::TestCanvasAttachBrushDetachBrushBoudary,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Canvas related functions
napi_value DrawingCanvasDetach(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, CANVAS_DETACH_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestCanvasDetachPenOnly,
            OHOS::Rosen::Drawing::TestCanvasDetachBrushOnly,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Bitmap related functions
napi_value DrawingBitmap(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, BITMAP_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestBitmapDestroyNormal,
            OHOS::Rosen::Drawing::TestBitmapDestroyNull,
            OHOS::Rosen::Drawing::TestBitmapCreateFromPixelsNormal,
            OHOS::Rosen::Drawing::TestBitmapCreateFromPixelsNull,
            OHOS::Rosen::Drawing::TestBitmapCreateFromPixelsMismatch,
            OHOS::Rosen::Drawing::TestBitmapCreateFromPixelsAbnormal,
            OHOS::Rosen::Drawing::TestBitmapCreateFromPixelsVeryBig,
            OHOS::Rosen::Drawing::TestBitmapCreateFromPixelsBoundary,
            OHOS::Rosen::Drawing::TestBitmapBuildNormal,
            OHOS::Rosen::Drawing::TestBitmapBuildNull,
            OHOS::Rosen::Drawing::TestBitmapBuildMultipleCalls,
            OHOS::Rosen::Drawing::TestBitmapBuildBoundary,
            OHOS::Rosen::Drawing::TestBitmapGetXXNormal,
            OHOS::Rosen::Drawing::TestBitmapGetXXNull,
            OHOS::Rosen::Drawing::TestBitmapGetXXInputDestroyed,
            OHOS::Rosen::Drawing::TestBitmapGetXXBoundary,
            OHOS::Rosen::Drawing::TestBitmapReadPixelsNormal,
            OHOS::Rosen::Drawing::TestBitmapReadPixelsNull,
            OHOS::Rosen::Drawing::TestBitmapReadPixelsInputDestroyed,
            OHOS::Rosen::Drawing::TestBitmapReadPixelsMismatch,
            OHOS::Rosen::Drawing::TestBitmapReadPixelsBoundary,
            OHOS::Rosen::Drawing::TestBitmapBuildMaximum,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// ColorFilter CreateBlendMode related functions
napi_value DrawingColorFilterCreateBlendMode(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, COLOR_FILTER_CREATE_BLEND_MODE_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestColorFilterCreateBlendModeNormal,
            OHOS::Rosen::Drawing::TestColorFilterCreateBlendModeNULL,
            OHOS::Rosen::Drawing::TestColorFilterCreateBlendModeMultipleCalls,
            OHOS::Rosen::Drawing::TestColorFilterCreateBlendModeAbnormal,
            OHOS::Rosen::Drawing::TestColorFilterCreateBlendModeMaximum,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// ColorFilter CreateCompose related functions
napi_value DrawingColorFilterCreateCompose(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, COLOR_FILTER_CREATE_COMPOSE_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestColorFilterCreateComposeNormal,
            OHOS::Rosen::Drawing::TestColorFilterCreateComposeNULL,
            OHOS::Rosen::Drawing::TestColorFilterCreateComposeMultipleCalls,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// ColorFilter CreateMatrix related functions
napi_value DrawingColorFilterCreateMatrix(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, COLOR_FILTER_CREATE_MATRIX_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestColorFilterCreateMatrixNormal,
            OHOS::Rosen::Drawing::TestColorFilterCreateMatrixNULL,
            OHOS::Rosen::Drawing::TestColorFilterCreateMatrixAbnormal,
            OHOS::Rosen::Drawing::TestColorFilterCreateMatrixMultipleCalls,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// ColorFilter CreateLinearToSrgbGamma related functions
napi_value DrawingColorFilterCreateLinearToSrgbGamma(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, COLOR_FILTER_CREATE_LINEAR_TO_SRGB_GAMMA_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestColorFilterCreateLinearToSrgbGammaNormal,
            OHOS::Rosen::Drawing::TestColorFilterCreateLinearToSrgbGammaMultipleCalls,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// ColorFilter CreateSrgbGammaToLinear related functions
napi_value DrawingColorFilterCreateSrgbGammaToLinear(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, COLOR_FILTER_CREATE_SRGB_GAMMA_TO_LINEAR_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestColorFilterCreateSrgbGammaToLinearNormal,
            OHOS::Rosen::Drawing::TestColorFilterCreateSrgbGammaToLinearMultipleCalls,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// ColorFilter CreateLuma related functions
napi_value DrawingColorFilterCreateLuma(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, COLOR_FILTER_CREATE_LUMA_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestColorFilterCreateLumaNormal,
            OHOS::Rosen::Drawing::TestColorFilterCreateLumaMultipleCalls,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// ColorFilter Destroy related functions
napi_value DrawingColorFilterDestroy(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, COLOR_FILTER_DESTROY_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestColorFilterDestroyNormal,
            OHOS::Rosen::Drawing::TestColorFilterDestroyNULL,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// ColorFilter CreateLighting related functions
napi_value DrawingColorFilterCreateLighting(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, COLOR_FILTER_CREATE_LIGHTING_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestColorFilterCreateLightingNormal,
            OHOS::Rosen::Drawing::TestColorFilterCreateLightingNULL,
            OHOS::Rosen::Drawing::TestColorFilterCreateLightingAbnormal,
            OHOS::Rosen::Drawing::TestColorFilterCreateLightingMultipleCalls,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// ColorSpace CreateSrgb related functions
napi_value DrawingColorSpaceCreateSrgb(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, COLOR_SPACE_CREATE_SRGB_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestColorSpaceCreateSrgbNormal,
            OHOS::Rosen::Drawing::TestColorSpaceCreateSrgbMultipleCalls,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// ColorSpace Destroy related functions
napi_value DrawingColorSpaceDestroy(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, COLOR_SPACE_DESTROY_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestColorSpaceDestroyNull,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// ColorSpace CreateSrgbLinear related functions
napi_value DrawingColorSpaceCreateSrgbLinear(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, COLOR_SPACE_CREATE_SRGB_LINEAR_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestColorSpaceCreateSrgbLinearNormal,
            OHOS::Rosen::Drawing::TestColorSpaceCreateSrgbLinearMultipleCalls,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Color SetArgb related functions
napi_value DrawingColorSetArgb(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, COLOR_SET_ARGB_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestColorSetArgbNormal,
            OHOS::Rosen::Drawing::TestColorSetArgbNULL,
            OHOS::Rosen::Drawing::TestColorSetArgbMultipleCalls,
            OHOS::Rosen::Drawing::TestColorSetArgbAbnormal,
            OHOS::Rosen::Drawing::TestColorSetArgbMaximum,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Filter Create/Destroy related functions
napi_value DrawingFilterCreateDestroy(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, FILTER_CREATE_DESTROY_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestFilterCreateDestroyNormal,
            OHOS::Rosen::Drawing::TestFilterCreateDestroyNULL,
            OHOS::Rosen::Drawing::TestFilterCreateDestroyMultipleCalls,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Filter SetImageFilter related functions
napi_value DrawingFilterSetImageFilter(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, FILTER_SET_IMAGE_FILTER_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestFilterSetImageFilterNormal,
            OHOS::Rosen::Drawing::TestFilterSetImageFilterNULL,
            OHOS::Rosen::Drawing::TestFilterSetImageFilterMultipleCalls,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Filter SetMaskFilter related functions
napi_value DrawingFilterSetMaskFilter(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, FILTER_SET_MASK_FILTER_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestFilterSetMaskFilterNormal,
            OHOS::Rosen::Drawing::TestFilterSetMaskFilterNULL,
            OHOS::Rosen::Drawing::TestFilterSetMaskFilterMultipleCalls,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Filter SetColorFilter related functions
napi_value DrawingFilterSetColorFilter(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, FILTER_SET_COLOR_FILTER_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestFilterSetColorFilterNormal,
            OHOS::Rosen::Drawing::TestFilterSetColorFilterNULL,
            OHOS::Rosen::Drawing::TestFilterSetColorFilterMultipleCalls,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Font Create/Destroy related functions
napi_value DrawingFontCreateDestroy(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, FONT_CREATE_DESTROY_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestFontCreateDestroyNormal,
            OHOS::Rosen::Drawing::TestFontCreateDestroyNULL,
            OHOS::Rosen::Drawing::TestFontCreateDestroyMultipleCalls,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Font SetBaselineSnap related functions
napi_value DrawingFontSetBaselineSnap(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, FONT_SET_BASELINE_SNAP_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestFontSetBaselineSnapNormal,
            OHOS::Rosen::Drawing::TestFontSetBaselineSnapNULL,
            OHOS::Rosen::Drawing::TestFontSetBaselineSnapMultipleCalls,
            OHOS::Rosen::Drawing::TestFontIsBaselineSnapWhenNoSet,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Font SetSubpixel related functions
napi_value DrawingFontSetSubpixel(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, FONT_SET_SUBPIXEL_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestFontSetSubpixelNormal,
            OHOS::Rosen::Drawing::TestFontSetSubpixelNULL,
            OHOS::Rosen::Drawing::TestFontSetSubpixelMultipleCalls,
            OHOS::Rosen::Drawing::TestFontIsSubpixelWhenNoSet,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Font SetForceAutoHinting related functions
napi_value DrawingFontSetForceAutoHinting(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, FONT_SET_FORCE_AUTO_HINTING_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestFontSetForceAutoHintingNormal,
            OHOS::Rosen::Drawing::TestFontSetForceAutoHintingNULL,
            OHOS::Rosen::Drawing::TestFontSetForceAutoHintingMultipleCalls,
            OHOS::Rosen::Drawing::TestFontIsForceAutoHintingWhenNoSet,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Font SetTypeface related functions
napi_value DrawingFontSetTypeface(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, FONT_SET_TYPEFACE_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestFontSetTypefaceNormal,
            OHOS::Rosen::Drawing::TestFontSetTypefaceNULL,
            OHOS::Rosen::Drawing::TestFontSetTypefaceMultipleCalls,
            OHOS::Rosen::Drawing::TestFontGetTypefaceWhenNoSet,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Font SetTextSize related functions
napi_value DrawingFontSetTextSize(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, FONT_SET_TEXT_SIZE_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestFontSetTextSizeNormal,
            OHOS::Rosen::Drawing::TestFontSetTextSizeNULL,
            OHOS::Rosen::Drawing::TestFontSetTextSizeMultipleCalls,
            OHOS::Rosen::Drawing::TestFontGetTextSizeWhenNoSet,
            OHOS::Rosen::Drawing::TestFontSetTextSizeAbnormal,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Font CountText related functions
napi_value DrawingFontCountText(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, FONT_COUNT_TEXT_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestFontCountTextNormal,
            OHOS::Rosen::Drawing::TestFontCountTextNULL,
            OHOS::Rosen::Drawing::TestFontCountTextMultipleCalls,
            OHOS::Rosen::Drawing::TestFontCountTextAbnormal,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Font TextToGlyphs related functions
napi_value DrawingFontTextToGlyphs(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, FONT_TEXT_TO_GLYPHS_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestFontTextToGlyphsNormal,
            OHOS::Rosen::Drawing::TestFontTextToGlyphsNULL,
            OHOS::Rosen::Drawing::TestFontTextToGlyphsMultipleCalls,
            OHOS::Rosen::Drawing::TestFontTextToGlyphsAbnormal,
            OHOS::Rosen::Drawing::TestFontTextToGlyphsMaximum,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

// Font GetWidths related functions
napi_value DrawingFontGetWidths(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<DrawingNativeFn, FONT_GET_WIDTHS_HANDLER_COUNT> handlers = {
            OHOS::Rosen::Drawing::TestFontGetWidthsNormal,
            OHOS::Rosen::Drawing::TestFontGetWidthsNULL,
            OHOS::Rosen::Drawing::TestFontGetWidthsMultipleCalls,
            OHOS::Rosen::Drawing::TestFontGetWidthsAbnormal,
            OHOS::Rosen::Drawing::TestFontGetWidthsMaximum,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

