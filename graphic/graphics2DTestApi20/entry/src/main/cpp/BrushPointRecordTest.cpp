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

#include "BrushPointRecordTest.h"
#include <native_drawing/drawing_brush.h>
#include <native_drawing/drawing_error_code.h>
#include <native_drawing/drawing_filter.h>
#include <native_drawing/drawing_shadow_layer.h>
#include <native_drawing/drawing_shader_effect.h>
#include <native_drawing/drawing_canvas.h>
#include <native_drawing/drawing_pixel_map.h>
#include <native_drawing/drawing_point.h>
#include <native_drawing/drawing_record_cmd.h>
#include <native_drawing/drawing_rect.h>
#include <native_drawing/drawing_region.h>
#include <native_drawing/drawing_register_font.h>

void addBrushPointRecordTest(std::vector<napi_property_descriptor>& descData)
{
    descData.push_back({"drawingBrushGetAlphaFloatSuccess", nullptr, OH_Drawing_BrushGetAlphaFloatSuccess,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"drawingBrushGetAlphaFloatFail", nullptr, OH_Drawing_BrushGetAlphaFloatFail,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"brushGetRedFloatSuccess", nullptr, OH_Drawing_BrushGetRedFloatSuccess,
             nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"brushGetRedFloatFail", nullptr, OH_Drawing_BrushGetRedFloatFail,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"brushGetGreenFloatSuccess", nullptr, OH_Drawing_BrushGetGreenFloatSuccess,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"brushGetGreenFloatFail", nullptr, OH_Drawing_BrushGetGreenFloatFail,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"brushGetBlueFloatSuccess", nullptr, OH_Drawing_BrushGetBlueFloatSuccess,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"brushGetBlueFloatFail", nullptr, OH_Drawing_BrushGetBlueFloatFail,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"pointGetXSuccess", nullptr, OH_Drawing_PointGetXSuccess,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"pointGetXFail", nullptr, OH_Drawing_PointGetXFail,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"pointGetYSuccess", nullptr, OH_Drawing_PointGetYSuccess,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"pointGetYFail", nullptr, OH_Drawing_PointGetYFail,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"pointSetSuccess", nullptr, OH_Drawing_PointSetSuccess,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"pointSetFail", nullptr, OH_Drawing_PointSetFail,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"recordCmdUtilsDestroySuccess", nullptr, OH_Drawing_RecordCmdUtilsDestroySuccess,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"recordCmdUtilsDestroyFail", nullptr, OH_Drawing_RecordCmdUtilsDestroyFail,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"recordCmdUtilsBeginRecordingSuccess", nullptr, OH_Drawing_RecordCmdUtilsBeginRecordingSuccess,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"recordCmdUtilsBeginRecordingFail", nullptr, OH_Drawing_RecordCmdUtilsBeginRecordingFail,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"recordCmdUtilsFinishRecordingSuccess", nullptr,
            OH_Drawing_RecordCmdUtilsFinishRecordingSuccess, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"recordCmdUtilsFinishRecordingFail", nullptr, OH_Drawing_RecordCmdUtilsFinishRecordingFail,
            nullptr, nullptr, nullptr, napi_default, nullptr});
}

napi_value OH_Drawing_BrushGetAlphaFloatSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    auto brush = OH_Drawing_BrushCreate();
    float a = 0.1;
    OH_Drawing_ErrorCode ret = OH_Drawing_BrushGetAlphaFloat(brush, &a);
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value OH_Drawing_BrushGetAlphaFloatFail(napi_env env, napi_callback_info info)
{
    napi_value result;
    auto brush = nullptr;
    float a = 0.1;
    int ret = OH_Drawing_BrushGetAlphaFloat(brush, &a);
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value OH_Drawing_BrushGetRedFloatSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    auto brush = OH_Drawing_BrushCreate();
    float a = 0.1;
    int ret = OH_Drawing_BrushGetRedFloat(brush, &a);
    napi_create_int32(env, ret == OH_DRAWING_SUCCESS, &result);
    return result;
}

napi_value OH_Drawing_BrushGetRedFloatFail(napi_env env, napi_callback_info info)
{
    napi_value result;
    auto brush = nullptr;
    float a = 0.1;
    int ret = OH_Drawing_BrushGetRedFloat(brush, &a);
    napi_create_int32(env, ret == OH_DRAWING_ERROR_INVALID_PARAMETER, &result);
    return result;
}

napi_value OH_Drawing_BrushGetGreenFloatSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    auto brush = OH_Drawing_BrushCreate();
    float a = 0.1;
    int ret = OH_Drawing_BrushGetGreenFloat(brush, &a);
    napi_create_int32(env, ret == OH_DRAWING_SUCCESS, &result);
    return result;
}

napi_value OH_Drawing_BrushGetGreenFloatFail(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Drawing_Brush* brush = nullptr;
    float a = 0.1;
    int ret = OH_Drawing_BrushGetGreenFloat(brush, &a);
    napi_create_int32(env, ret == OH_DRAWING_ERROR_INVALID_PARAMETER, &result);
    return result;
}

napi_value OH_Drawing_BrushGetBlueFloatSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    auto brush = OH_Drawing_BrushCreate();
    float a = 0.1;
    int ret = OH_Drawing_BrushGetBlueFloat(brush, &a);
    napi_create_int32(env, ret == OH_DRAWING_SUCCESS, &result);
    return result;
}

napi_value OH_Drawing_BrushGetBlueFloatFail(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Drawing_Brush* brush = nullptr;
    float a = 0.1;
    int ret = OH_Drawing_BrushGetBlueFloat(brush, &a);
    napi_create_int32(env, ret == OH_DRAWING_ERROR_INVALID_PARAMETER, &result);
    return result;
}

napi_value OH_Drawing_PointGetXSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    float x = 10;
    float y = 10;
    const OH_Drawing_Point* point = OH_Drawing_PointCreate(x, y);
    float resx = 0;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_PointGetX(point, &resx);
    napi_create_int32(env, x ==  resx && errorCode == OH_DRAWING_SUCCESS, &result);
    return result;
}

napi_value OH_Drawing_PointGetXFail(napi_env env, napi_callback_info info)
{
    napi_value result;
    float x = 0;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_PointGetX(nullptr, &x);
    napi_create_int32(env, errorCode ==  OH_DRAWING_ERROR_INVALID_PARAMETER, &result);
    return result;
}

napi_value OH_Drawing_PointGetYSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    float x = 10;
    float y = 10;
    const OH_Drawing_Point* point = OH_Drawing_PointCreate(x, y);
    float resy = 0;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_PointGetY(point, &resy);
    napi_create_int32(env, errorCode ==  OH_DRAWING_SUCCESS && y == resy, &result);
    return result;
}

napi_value OH_Drawing_PointGetYFail(napi_env env, napi_callback_info info)
{
    napi_value result;
    float y = 0;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_PointGetX(nullptr, &y);
    napi_create_int32(env, errorCode ==  OH_DRAWING_ERROR_INVALID_PARAMETER, &result);
    return result;
}

napi_value OH_Drawing_PointSetSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    float x = 10;
    float y = 10;
    OH_Drawing_Point* point = OH_Drawing_PointCreate(x, y);
    float x2 = 100;
    float y2 = 100;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_PointSet(point, x2, y2);
    napi_create_int32(env, errorCode ==  OH_DRAWING_SUCCESS, &result);
    return result;
}

napi_value OH_Drawing_PointSetFail(napi_env env, napi_callback_info info)
{
    napi_value result;
    float x = 100;
    float y = 100;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_PointSet(nullptr, x, y);
    napi_create_int32(env, errorCode ==  OH_DRAWING_ERROR_INVALID_PARAMETER, &result);
    return result;
}

napi_value OH_Drawing_RecordCmdUtilsDestroySuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Drawing_RecordCmdUtils* precCut = OH_Drawing_RecordCmdUtilsCreate();
    OH_Drawing_ErrorCode errCode = OH_Drawing_RecordCmdUtilsDestroy(precCut);
    napi_create_int32(env, errCode == OH_DRAWING_SUCCESS, &result);
    return result;
}

napi_value OH_Drawing_RecordCmdUtilsDestroyFail(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Drawing_ErrorCode errCode = OH_Drawing_RecordCmdUtilsDestroy(nullptr);
    napi_create_int32(env, errCode == OH_DRAWING_ERROR_INVALID_PARAMETER, &result);
    return result;
}

napi_value OH_Drawing_RecordCmdUtilsBeginRecordingSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Drawing_RecordCmdUtils* precCut = OH_Drawing_RecordCmdUtilsCreate();
    int32_t width = 10;
    int32_t height = 10;
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_ErrorCode errCode = OH_Drawing_RecordCmdUtilsBeginRecording(precCut, width, height, &canvas);
    napi_create_int32(env, errCode == OH_DRAWING_SUCCESS, &result);
    return result;
}

napi_value OH_Drawing_RecordCmdUtilsBeginRecordingFail(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t width = 10;
    int32_t height = 10;
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_ErrorCode errCode = OH_Drawing_RecordCmdUtilsBeginRecording(nullptr, width, height, &canvas);
    napi_create_int32(env, errCode == OH_DRAWING_ERROR_INVALID_PARAMETER, &result);
    return result;
}

napi_value OH_Drawing_RecordCmdUtilsFinishRecordingSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Drawing_RecordCmdUtils* recordCmdUtils = OH_Drawing_RecordCmdUtilsCreate();
    OH_Drawing_RecordCmd* recordCmd;
    OH_Drawing_ErrorCode errCode = OH_Drawing_RecordCmdUtilsFinishRecording(recordCmdUtils, &recordCmd);
    napi_create_int32(env, errCode == OH_DRAWING_ERROR_ALLOCATION_FAILED, &result);
    return result;
}

napi_value OH_Drawing_RecordCmdUtilsFinishRecordingFail(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Drawing_RecordCmd* recordCmd;
    OH_Drawing_ErrorCode errCode = OH_Drawing_RecordCmdUtilsFinishRecording(nullptr, &recordCmd);
    napi_create_int32(env, errCode == OH_DRAWING_ERROR_INVALID_PARAMETER, &result);
    return result;
}