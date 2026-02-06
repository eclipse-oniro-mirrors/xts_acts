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

#include "touch/TouchPoint.h"

namespace TouchPoint {

napi_value GetTouchPointWindowX(napi_env env, napi_callback_info info)
{
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "CreateNativeNode env or info is null");
        return nullptr;
    }
    size_t argCnt = 1;
    napi_value args[1] = { nullptr };
    if (napi_get_cb_info(env, info, &argCnt, args, nullptr, nullptr) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "CreateNativeNode napi_get_cb_info failed");
    }
    if (argCnt != PARAM_1) {
        napi_throw_type_error(env, NULL, "Wrong number of arguments");
        return nullptr;
    }
    bool isNullptr;
    napi_get_value_bool(env, args[0], &isNullptr);
    float point = 0;
    int32_t result;
    if (isNullptr) {
        result = OH_NativeXComponent_GetTouchPointWindowX(nullptr, 0, &point) ==
                 OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER ? OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER :
                 OH_NATIVEXCOMPONENT_RESULT_SUCCESS;
        result = OH_NativeXComponent_GetTouchPointWindowX(XComponent.GetXComponent(), 0, nullptr) ==
                 OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER && result == OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER ?
                 OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER : OH_NATIVEXCOMPONENT_RESULT_SUCCESS;
    }
    if (!isNullptr) {
        result = OH_NativeXComponent_GetTouchPointWindowX(XComponent.GetXComponent(), 0, &point) ==
                 OH_NATIVEXCOMPONENT_RESULT_SUCCESS ? OH_NATIVEXCOMPONENT_RESULT_SUCCESS :
                 OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER;
    }
    napi_create_int32(env, result, &args[0]);
    return args[0];
}

napi_value GetTouchPointWindowY(napi_env env, napi_callback_info info)
{
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "CreateNativeNode env or info is null");
        return nullptr;
    }
    size_t argCnt = 1;
    napi_value args[1] = { nullptr };
    if (napi_get_cb_info(env, info, &argCnt, args, nullptr, nullptr) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "CreateNativeNode napi_get_cb_info failed");
    }
    if (argCnt != PARAM_1) {
        napi_throw_type_error(env, NULL, "Wrong number of arguments");
        return nullptr;
    }
    bool isNullptr;
    napi_get_value_bool(env, args[0], &isNullptr);
    float point = 0;
    int32_t result;
    if (isNullptr) {
        result = OH_NativeXComponent_GetTouchPointWindowY(nullptr, 0, &point) ==
                 OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER ? OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER :
                 OH_NATIVEXCOMPONENT_RESULT_SUCCESS;
        result = OH_NativeXComponent_GetTouchPointWindowY(XComponent.GetXComponent(), 0, nullptr) ==
                 OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER && result == OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER ?
                 OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER : OH_NATIVEXCOMPONENT_RESULT_SUCCESS;
    }
    if (!isNullptr) {
        result = OH_NativeXComponent_GetTouchPointWindowY(XComponent.GetXComponent(), 0, &point) ==
                 OH_NATIVEXCOMPONENT_RESULT_SUCCESS ? OH_NATIVEXCOMPONENT_RESULT_SUCCESS :
                 OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER;
    }
    napi_create_int32(env, result, &args[0]);
    return args[0];
}

napi_value GetTouchPointDisplayX(napi_env env, napi_callback_info info)
{
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "CreateNativeNode env or info is null");
        return nullptr;
    }
    size_t argCnt = 1;
    napi_value args[1] = { nullptr };
    if (napi_get_cb_info(env, info, &argCnt, args, nullptr, nullptr) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "CreateNativeNode napi_get_cb_info failed");
    }
    if (argCnt != PARAM_1) {
        napi_throw_type_error(env, NULL, "Wrong number of arguments");
        return nullptr;
    }
    bool isNullptr;
    napi_get_value_bool(env, args[0], &isNullptr);
    float point = 0;
    int32_t result;
    if (isNullptr) {
        result = OH_NativeXComponent_GetTouchPointDisplayX(nullptr, 0, &point) ==
                 OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER ? OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER :
                 OH_NATIVEXCOMPONENT_RESULT_SUCCESS;
        result = OH_NativeXComponent_GetTouchPointDisplayX(XComponent.GetXComponent(), 0, nullptr) ==
                 OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER && result == OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER ?
                 OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER : OH_NATIVEXCOMPONENT_RESULT_SUCCESS;
    }
    if (!isNullptr) {
        result = OH_NativeXComponent_GetTouchPointDisplayX(XComponent.GetXComponent(), 0, &point) ==
                 OH_NATIVEXCOMPONENT_RESULT_SUCCESS ? OH_NATIVEXCOMPONENT_RESULT_SUCCESS :
                 OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER;
    }
    napi_create_int32(env, result, &args[0]);
    return args[0];
}

napi_value GetTouchPointDisplayY(napi_env env, napi_callback_info info)
{
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "CreateNativeNode env or info is null");
        return nullptr;
    }
    size_t argCnt = 1;
    napi_value args[1] = { nullptr };
    if (napi_get_cb_info(env, info, &argCnt, args, nullptr, nullptr) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "CreateNativeNode napi_get_cb_info failed");
    }
    if (argCnt != PARAM_1) {
        napi_throw_type_error(env, NULL, "Wrong number of arguments");
        return nullptr;
    }
    bool isNullptr;
    napi_get_value_bool(env, args[0], &isNullptr);
    float point = 0;
    int32_t result;
    if (isNullptr) {
        result = OH_NativeXComponent_GetTouchPointDisplayY(nullptr, 0, &point) ==
                 OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER ? OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER :
                 OH_NATIVEXCOMPONENT_RESULT_SUCCESS;
        result = OH_NativeXComponent_GetTouchPointDisplayY(XComponent.GetXComponent(), 0, nullptr) ==
                 OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER && result == OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER ?
                 OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER : OH_NATIVEXCOMPONENT_RESULT_SUCCESS;
    } else {
        result = OH_NativeXComponent_GetTouchPointDisplayY(XComponent.GetXComponent(), 0, &point) ==
                 OH_NATIVEXCOMPONENT_RESULT_SUCCESS ? OH_NATIVEXCOMPONENT_RESULT_SUCCESS :
                 OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER;
    }
    napi_create_int32(env, result, &args[0]);
    return args[0];
}

napi_value GetHistoricalPoints(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    napi_create_int32(env, g_getHistoricalPointsResult, &retValue);
    return retValue;
}

napi_value HistoricalPointId(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = g_historicalPoint.id != -1;
    g_historicalPoint = {
        .id = -1,
        .screenX = -1,
        .screenY = -1,
        .x = -1,
        .y = -1,
        .type = OH_NativeXComponent_TouchEventType(),
        .size = -1,
        .force = -1,
        .timeStamp = -1,
        .titlX = -1,
        .titlY = -1,
        .sourceTool = OH_NativeXComponent_TouchEvent_SourceTool(),
    };
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value HistoricalPointScreenX(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = g_historicalPoint.screenX != -1;
    g_historicalPoint = {
        .id = -1,
        .screenX = -1,
        .screenY = -1,
        .x = -1,
        .y = -1,
        .type = OH_NativeXComponent_TouchEventType(),
        .size = -1,
        .force = -1,
        .timeStamp = -1,
        .titlX = -1,
        .titlY = -1,
        .sourceTool = OH_NativeXComponent_TouchEvent_SourceTool(),
    };
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value HistoricalPointScreenY(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = g_historicalPoint.screenY != -1;
    g_historicalPoint = {
        .id = -1,
        .screenX = -1,
        .screenY = -1,
        .x = -1,
        .y = -1,
        .type = OH_NativeXComponent_TouchEventType(),
        .size = -1,
        .force = -1,
        .timeStamp = -1,
        .titlX = -1,
        .titlY = -1,
        .sourceTool = OH_NativeXComponent_TouchEvent_SourceTool(),
    };
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value HistoricalPointX(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = g_historicalPoint.x != -1;
    g_historicalPoint = {
        .id = -1,
        .screenX = -1,
        .screenY = -1,
        .x = -1,
        .y = -1,
        .type = OH_NativeXComponent_TouchEventType(),
        .size = -1,
        .force = -1,
        .timeStamp = -1,
        .titlX = -1,
        .titlY = -1,
        .sourceTool = OH_NativeXComponent_TouchEvent_SourceTool(),
    };
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value HistoricalPointY(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = g_historicalPoint.y != -1;
    g_historicalPoint = {
        .id = -1,
        .screenX = -1,
        .screenY = -1,
        .x = -1,
        .y = -1,
        .type = OH_NativeXComponent_TouchEventType(),
        .size = -1,
        .force = -1,
        .timeStamp = -1,
        .titlX = -1,
        .titlY = -1,
        .sourceTool = OH_NativeXComponent_TouchEvent_SourceTool(),
    };
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value HistoricalPointType(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = g_historicalPoint.type != OH_NativeXComponent_TouchEventType();
    g_historicalPoint = {
        .id = -1,
        .screenX = -1,
        .screenY = -1,
        .x = -1,
        .y = -1,
        .type = OH_NativeXComponent_TouchEventType(),
        .size = -1,
        .force = -1,
        .timeStamp = -1,
        .titlX = -1,
        .titlY = -1,
        .sourceTool = OH_NativeXComponent_TouchEvent_SourceTool(),
    };
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value HistoricalPointSize(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = g_historicalPoint.size != -1;
    g_historicalPoint = {
        .id = -1,
        .screenX = -1,
        .screenY = -1,
        .x = -1,
        .y = -1,
        .type = OH_NativeXComponent_TouchEventType(),
        .size = -1,
        .force = -1,
        .timeStamp = -1,
        .titlX = -1,
        .titlY = -1,
        .sourceTool = OH_NativeXComponent_TouchEvent_SourceTool(),
    };
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value HistoricalPointForce(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = g_historicalPoint.force != -1;
    g_historicalPoint = {
        .id = -1,
        .screenX = -1,
        .screenY = -1,
        .x = -1,
        .y = -1,
        .type = OH_NativeXComponent_TouchEventType(),
        .size = -1,
        .force = -1,
        .timeStamp = -1,
        .titlX = -1,
        .titlY = -1,
        .sourceTool = OH_NativeXComponent_TouchEvent_SourceTool(),
    };
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value HistoricalPointTimeStamp(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = g_historicalPoint.timeStamp != -1;
    g_historicalPoint = {
        .id = -1,
        .screenX = -1,
        .screenY = -1,
        .x = -1,
        .y = -1,
        .type = OH_NativeXComponent_TouchEventType(),
        .size = -1,
        .force = -1,
        .timeStamp = -1,
        .titlX = -1,
        .titlY = -1,
        .sourceTool = OH_NativeXComponent_TouchEvent_SourceTool(),
    };
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value HistoricalPointTitlX(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = g_historicalPoint.titlX != -1;
    g_historicalPoint = {
        .id = -1,
        .screenX = -1,
        .screenY = -1,
        .x = -1,
        .y = -1,
        .type = OH_NativeXComponent_TouchEventType(),
        .size = -1,
        .force = -1,
        .timeStamp = -1,
        .titlX = -1,
        .titlY = -1,
        .sourceTool = OH_NativeXComponent_TouchEvent_SourceTool(),
    };
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value HistoricalPointTitlY(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = g_historicalPoint.titlY != -1;
    g_historicalPoint = {
        .id = -1,
        .screenX = -1,
        .screenY = -1,
        .x = -1,
        .y = -1,
        .type = OH_NativeXComponent_TouchEventType(),
        .size = -1,
        .force = -1,
        .timeStamp = -1,
        .titlX = -1,
        .titlY = -1,
        .sourceTool = OH_NativeXComponent_TouchEvent_SourceTool(),
    };
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value HistoricalPointSourceTool(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = g_historicalPoint.sourceTool != OH_NativeXComponent_TouchEvent_SourceTool();
    g_historicalPoint = {
        .id = -1,
        .screenX = -1,
        .screenY = -1,
        .x = -1,
        .y = -1,
        .type = OH_NativeXComponent_TouchEventType(),
        .size = -1,
        .force = -1,
        .timeStamp = -1,
        .titlX = -1,
        .titlY = -1,
        .sourceTool = OH_NativeXComponent_TouchEvent_SourceTool(),
    };
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value GetTouchEventSourceTool(napi_env env, napi_callback_info info)
{
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "CreateNativeNode env or info is null");
        return nullptr;
    }
    size_t argCnt = 1;
    napi_value args[1] = { nullptr };
    if (napi_get_cb_info(env, info, &argCnt, args, nullptr, nullptr) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "CreateNativeNode napi_get_cb_info failed");
    }
    if (argCnt != PARAM_1) {
        napi_throw_type_error(env, NULL, "Wrong number of arguments");
        return nullptr;
    }
    int32_t Index;
    napi_get_value_int32(env, args[0], &Index);
    napi_value retValue = 0;
    int32_t result = g_historicalPointMap.count(OH_NativeXComponent_TouchEvent_SourceTool(Index)) != 0 ? Index : 0;
    if (result) {
        result = OH_NATIVEXCOMPONENT_SOURCETOOL_UNKNOWN == OH_NativeXComponent_TouchEvent_SourceTool(Index) ||
                 OH_NATIVEXCOMPONENT_SOURCETOOL_FINGER == OH_NativeXComponent_TouchEvent_SourceTool(Index) ||
                 OH_NATIVEXCOMPONENT_SOURCETOOL_PEN == OH_NativeXComponent_TouchEvent_SourceTool(Index) ||
                 OH_NATIVEXCOMPONENT_SOURCETOOL_RUBBER == OH_NativeXComponent_TouchEvent_SourceTool(Index) ||
                 OH_NATIVEXCOMPONENT_SOURCETOOL_BRUSH == OH_NativeXComponent_TouchEvent_SourceTool(Index) ||
                 OH_NATIVEXCOMPONENT_SOURCETOOL_PENCIL == OH_NativeXComponent_TouchEvent_SourceTool(Index) ||
                 OH_NATIVEXCOMPONENT_SOURCETOOL_AIRBRUSH == OH_NativeXComponent_TouchEvent_SourceTool(Index) ||
                 OH_NATIVEXCOMPONENT_SOURCETOOL_MOUSE == OH_NativeXComponent_TouchEvent_SourceTool(Index) ||
                 OH_NATIVEXCOMPONENT_SOURCETOOL_LENS == OH_NativeXComponent_TouchEvent_SourceTool(Index) ||
                 OH_NATIVEXCOMPONENT_SOURCETOOL_TOUCHPAD == OH_NativeXComponent_TouchEvent_SourceTool(Index);
    }
    g_historicalPoint = {
        .id = -1,
        .screenX = -1,
        .screenY = -1,
        .x = -1,
        .y = -1,
        .type = OH_NativeXComponent_TouchEventType(),
        .size = -1,
        .force = -1,
        .timeStamp = -1,
        .titlX = -1,
        .titlY = -1,
        .sourceTool = OH_NativeXComponent_TouchEvent_SourceTool(),
    };
    g_historicalPointMap.clear();
    napi_create_int32(env, result ? Index : result, &retValue);
    return retValue;
}

napi_value GetTouchPointToolTypeResult(napi_env env, napi_callback_info info)
{
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "CreateNativeNode env or info is null");
        return nullptr;
    }
    size_t argCnt = 1;
    napi_value args[1] = { nullptr };
    if (napi_get_cb_info(env, info, &argCnt, args, nullptr, nullptr) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "CreateNativeNode napi_get_cb_info failed");
    }
    if (argCnt != PARAM_1) {
        napi_throw_type_error(env, NULL, "Wrong number of arguments");
        return nullptr;
    }
    int32_t Index;
    napi_get_value_int32(env, args[0], &Index);
    napi_value retValue = 0;
    int32_t result = g_touchPointToolMap.count(OH_NativeXComponent_TouchPointToolType(Index)) != 0 ? Index : 0;
    if (result) {
        result = OH_NATIVEXCOMPONENT_TOOL_TYPE_UNKNOWN == OH_NativeXComponent_TouchPointToolType(Index) ||
                 OH_NATIVEXCOMPONENT_TOOL_TYPE_FINGER == OH_NativeXComponent_TouchPointToolType(Index) ||
                 OH_NATIVEXCOMPONENT_TOOL_TYPE_PEN == OH_NativeXComponent_TouchPointToolType(Index) ||
                 OH_NATIVEXCOMPONENT_TOOL_TYPE_RUBBER == OH_NativeXComponent_TouchPointToolType(Index) ||
                 OH_NATIVEXCOMPONENT_TOOL_TYPE_BRUSH == OH_NativeXComponent_TouchPointToolType(Index) ||
                 OH_NATIVEXCOMPONENT_TOOL_TYPE_PENCIL == OH_NativeXComponent_TouchPointToolType(Index) ||
                 OH_NATIVEXCOMPONENT_TOOL_TYPE_AIRBRUSH == OH_NativeXComponent_TouchPointToolType(Index) ||
                 OH_NATIVEXCOMPONENT_TOOL_TYPE_MOUSE == OH_NativeXComponent_TouchPointToolType(Index) ||
                 OH_NATIVEXCOMPONENT_TOOL_TYPE_LENS == OH_NativeXComponent_TouchPointToolType(Index);
    }
    napi_create_int32(env, result ? Index : result, &retValue);
    return retValue;
}

napi_value GetTouchEventSourceType(napi_env env, napi_callback_info info)
{
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "CreateNativeNode env or info is null");
        return nullptr;
    }
    size_t argCnt = 1;
    napi_value args[1] = { nullptr };
    if (napi_get_cb_info(env, info, &argCnt, args, nullptr, nullptr) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "CreateNativeNode napi_get_cb_info failed");
    }
    if (argCnt != PARAM_1) {
        napi_throw_type_error(env, NULL, "Wrong number of arguments");
        return nullptr;
    }
    int32_t Index;
    napi_get_value_int32(env, args[0], &Index);
    napi_value retValue = 0;
    int32_t result = g_touchEventSourceMap.count(OH_NativeXComponent_EventSourceType(Index)) != 0 ? Index : 0;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value TouchPointType(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = 1;
    OH_NativeXComponent_TouchPoint tempTouchPoint = g_touchPointMap[true];
    result = tempTouchPoint.type >= OH_NATIVEXCOMPONENT_DOWN &&
             tempTouchPoint.type <= OH_NATIVEXCOMPONENT_UNKNOWN;
    if (result) {
        result = OH_NATIVEXCOMPONENT_DOWN == tempTouchPoint.type ||
                 OH_NATIVEXCOMPONENT_UP == tempTouchPoint.type ||
                 OH_NATIVEXCOMPONENT_MOVE == tempTouchPoint.type ||
                 OH_NATIVEXCOMPONENT_CANCEL == tempTouchPoint.type ||
                 OH_NATIVEXCOMPONENT_UNKNOWN == tempTouchPoint.type;
    }
    tempTouchPoint = g_touchPointMap[false];
    result = tempTouchPoint.type >= OH_NATIVEXCOMPONENT_DOWN &&
             tempTouchPoint.type <= OH_NATIVEXCOMPONENT_UNKNOWN && result;
    if (result) {
        result = OH_NATIVEXCOMPONENT_DOWN == tempTouchPoint.type ||
                 OH_NATIVEXCOMPONENT_UP == tempTouchPoint.type ||
                 OH_NATIVEXCOMPONENT_MOVE == tempTouchPoint.type ||
                 OH_NATIVEXCOMPONENT_CANCEL == tempTouchPoint.type ||
                 OH_NATIVEXCOMPONENT_UNKNOWN == tempTouchPoint.type;
    }
    g_touchPointMap.clear();
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value TouchPointSize(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = 0;
    OH_NativeXComponent_TouchPoint tempTouchPoint = g_touchPointMap[true];
    result = tempTouchPoint.size != -1;
    tempTouchPoint = g_touchPointMap[false];
    result = tempTouchPoint.size != -1 && result;
    g_touchPointMap.clear();
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value TouchPointForce(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = 0;
    OH_NativeXComponent_TouchPoint tempTouchPoint = g_touchPointMap[true];
    result = tempTouchPoint.force != -1;
    tempTouchPoint = g_touchPointMap[false];
    result = tempTouchPoint.force != -1 && result;
    g_touchPointMap.clear();
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value TouchPointTimeStamp(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = 0;
    OH_NativeXComponent_TouchPoint tempTouchPoint = g_touchPointMap[true];
    result = tempTouchPoint.timeStamp != -1;
    tempTouchPoint = g_touchPointMap[false];
    result = tempTouchPoint.timeStamp != -1 && result;
    g_touchPointMap.clear();
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value TouchPointIsPressed(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = 0;
    result = g_touchPointMap.size() == PARAM_2;
    g_touchPointMap.clear();
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value TouchEventId(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = g_touchEvent.id != -1;
    g_touchEvent =
    {
        .id = -1,
        .screenX = -1,
        .screenY = -1,
        .x = -1,
        .y = -1,
        .type = OH_NativeXComponent_TouchEventType(),
        .size = -1,
        .force = -1,
        .timeStamp = -1,
        .touchPoints = {},
        .numPoints = 0,
    };
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value TouchEventSize(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = g_touchEvent.size != -1;
    g_touchEvent =
    {
        .id = -1,
        .screenX = -1,
        .screenY = -1,
        .x = -1,
        .y = -1,
        .type = OH_NativeXComponent_TouchEventType(),
        .size = -1,
        .force = -1,
        .timeStamp = -1,
        .touchPoints = {},
        .numPoints = 0,
    };
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value TouchEventForce(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = g_touchEvent.force != -1;
    g_touchEvent =
    {
        .id = -1,
        .screenX = -1,
        .screenY = -1,
        .x = -1,
        .y = -1,
        .type = OH_NativeXComponent_TouchEventType(),
        .size = -1,
        .force = -1,
        .timeStamp = -1,
        .touchPoints = {},
        .numPoints = 0,
    };
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value TouchEventDeviceId(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = g_touchEvent.deviceId != -1;
    g_touchEvent =
    {
        .id = -1,
        .screenX = -1,
        .screenY = -1,
        .x = -1,
        .y = -1,
        .type = OH_NativeXComponent_TouchEventType(),
        .size = -1,
        .force = -1,
        .timeStamp = -1,
        .touchPoints = {},
        .numPoints = 0,
    };
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value TouchEventTimeStamp(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = g_touchEvent.timeStamp != -1;
    g_touchEvent =
    {
        .id = -1,
        .screenX = -1,
        .screenY = -1,
        .x = -1,
        .y = -1,
        .type = OH_NativeXComponent_TouchEventType(),
        .size = -1,
        .force = -1,
        .timeStamp = -1,
        .touchPoints = {},
        .numPoints = 0,
    };
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value TouchPointTypeEnum(napi_env env, napi_callback_info info)
{
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "CreateNativeNode env or info is null");
        return nullptr;
    }
    size_t argCnt = 1;
    napi_value args[1] = { nullptr };
    if (napi_get_cb_info(env, info, &argCnt, args, nullptr, nullptr) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "CreateNativeNode napi_get_cb_info failed");
    }
    if (argCnt != PARAM_1) {
        napi_throw_type_error(env, NULL, "Wrong number of arguments");
        return nullptr;
    }
    int32_t pointTypeEnum;
    napi_get_value_int32(env, args[0], &pointTypeEnum);
    napi_value retValue = 0;
    OH_NativeXComponent_TouchEventType pointType = OH_NativeXComponent_TouchEventType(pointTypeEnum);
    if (g_touchPointTypeMap.count(pointType) != 0) {
        napi_create_int32(env, pointType, &retValue);
    } else {
        napi_create_int32(env, -1, &retValue);
    }
    g_touchPointTypeMap.clear();
    return retValue;
}

napi_value CreateTouchNativeNode(napi_env env, napi_callback_info info)
{
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "CreateNativeNode env or info is null");
        return nullptr;
    }
    size_t argCnt = 1;
    napi_value args[1] = { nullptr };
    if (napi_get_cb_info(env, info, &argCnt, args, nullptr, nullptr) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "CreateNativeNode napi_get_cb_info failed");
    }
    if (argCnt != PARAM_1) {
        napi_throw_type_error(env, NULL, "Wrong number of arguments");
        return nullptr;
    }
    ArkUI_NodeContentHandle nodeContentHandle = nullptr;
    OH_ArkUI_GetNodeContentFromNapiValue(env, args[0], &nodeContentHandle);
    XComponentCallback.DispatchTouchEvent = TouchEventCallback;
    auto nodeContentEvent = [](ArkUI_NodeContentEvent *event) {
        ArkUI_NodeContentHandle handle = OH_ArkUI_NodeContentEvent_GetNodeContentHandle(event);
        if (OH_ArkUI_NodeContentEvent_GetEventType(event) == NODE_CONTENT_EVENT_ON_ATTACH_TO_WINDOW) {
            InitNode();
            OH_ArkUI_NodeContent_AddNode(handle, ColumnComponent.GetComponent());
        }
    };
    OH_ArkUI_NodeContent_RegisterCallback(nodeContentHandle, nodeContentEvent);
    return nullptr;
}

void InitNode()
{
    int width = 480;
    ColumnComponent.SetWidth(width);
    XComponent.SetXComponentType(ARKUI_XCOMPONENT_TYPE_SURFACE);
    XComponent.SetXComponentId("TestXComponent");
    XComponent.SetXComponentSurfaceSize(PARAM_15, PARAM_15);
    XComponent.SetFocusable(true);
    XComponent.SetFocusDefault(true);
    XComponent.SetPercentWidth(PARAM_1_POINT_0);
    XComponent.SetPercentHeight(PARAM_1_POINT_0);
    XComponent.SetId("ndkxcomponent");
    
    auto *nativeXComponent = XComponent.GetXComponent();
    if (!nativeXComponent) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "GetNativeXComponent error");
    }
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "GetNativeXComponent success");
    OH_NativeXComponent_RegisterCallback(nativeXComponent, &XComponentCallback);
    auto typeRet = XComponent.getAttribute(NODE_XCOMPONENT_TYPE);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "xcomponent type: %{public}d",
                 typeRet->value[0].i32);
    auto idRet = XComponent.getAttribute(NODE_XCOMPONENT_ID);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "xcomponent id: %{public}s",
                 idRet->string);
    std::shared_ptr<ArkUICapiTest::Component> child = std::make_shared<ArkUICapiTest::XComponent>(XComponent);
    ColumnComponent.AddChild(child);
}

void TouchEventCallback(OH_NativeXComponent* component, void* window)
{
    OH_NativeXComponent_HistoricalPoint* historicalPoints = nullptr;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TouchEvent", "TouchEventCallback");
    OH_NativeXComponent_GetTouchEvent(component, window, &g_touchEvent);
    int32_t size;
    g_getHistoricalPointsResult = OH_NativeXComponent_GetHistoricalPoints(component, window, &size, &historicalPoints);
    for (size_t index = 0; index < size; index++) {
        if (g_historicalPointMap.count(historicalPoints[index].sourceTool) == 0) {
            g_historicalPointMap.insert({ historicalPoints[index].sourceTool, historicalPoints[index] });
        }
    }
    OH_NativeXComponent_TouchPointToolType toolType;
    for (size_t index = 0; index < g_touchEvent.numPoints; index++) {
        OH_NativeXComponent_GetTouchPointToolType(XComponent.GetXComponent(), index, &toolType);
        if (g_touchPointToolMap.count(toolType) == 0) {
            g_touchPointToolMap.insert({ toolType, toolType });
        }
    }
    OH_NativeXComponent_EventSourceType sourceType;
    for (size_t index = 0; index < g_touchEvent.numPoints; index++) {
        OH_NativeXComponent_GetTouchEventSourceType(XComponent.GetXComponent(), index, &sourceType);
        if (g_touchEventSourceMap.count(sourceType) == 0) {
            g_touchEventSourceMap.insert({ sourceType, sourceType });
        }
    }
    bool condition = size > 0 && g_historicalPoint.type == OH_NativeXComponent_TouchEventType() &&
                g_historicalPoint.sourceTool == OH_NativeXComponent_TouchEvent_SourceTool();
    if (condition) {
        g_historicalPoint = historicalPoints[0];
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN,
                     "TouchEvent", "g_historicalPoint.sourceTool: %{public}d", g_historicalPoint.sourceTool);
    }
    if (g_touchEvent.numPoints > 0 && g_touchPointMap.count(g_touchEvent.touchPoints[0].isPressed) == 0) {
        g_touchPointMap.insert({g_touchEvent.touchPoints[0].isPressed, g_touchEvent.touchPoints[0]});
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN,
                         "TouchPoint", "g_touchEvent.touchPoints[0].type: %{public}d", g_touchEvent.touchPoints[0].type);
        if (g_touchPointTypeMap.count(g_touchEvent.touchPoints[0].type) == 0) {
            g_touchPointTypeMap.insert({g_touchEvent.touchPoints[0].type, g_touchEvent.touchPoints[0]});
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN,
                         "TouchPoint", "g_touchEvent.touchPoints[0].type: %{public}d", g_historicalPoint.sourceTool);
        }
    }
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN,
                         "TouchPoint", "g_touchEvent.touchPoints[0].type: %{public}d", g_touchEvent.touchPoints[0].type);
    return;
}

}
