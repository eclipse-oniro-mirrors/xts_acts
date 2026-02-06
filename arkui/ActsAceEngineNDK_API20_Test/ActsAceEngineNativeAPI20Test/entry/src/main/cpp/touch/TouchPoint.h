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

#ifndef NDKXCOMPONENT_TOUCHPOINT_H
#define NDKXCOMPONENT_TOUCHPOINT_H

#include "component/XComponent.h"

#define XC ArkUICapiTest::XComponent

namespace TouchPoint {

static OH_NativeXComponent_Callback XComponentCallback;
static XC ColumnComponent = XC(ARKUI_NODE_COLUMN);
static XC XComponent = XC(ARKUI_NODE_XCOMPONENT);
static int32_t g_getHistoricalPointsResult = 1;
static OH_NativeXComponent_HistoricalPoint g_historicalPoint = {
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
static std::unordered_map<OH_NativeXComponent_TouchEvent_SourceTool,
                          OH_NativeXComponent_HistoricalPoint> g_historicalPointMap;
static std::unordered_map<bool, OH_NativeXComponent_TouchPoint> g_touchPointMap;
static std::unordered_map<OH_NativeXComponent_TouchEventType, OH_NativeXComponent_TouchPoint> g_touchPointTypeMap;
static std::unordered_map<OH_NativeXComponent_TouchPointToolType, int32_t> g_touchPointToolMap;
static std::unordered_map<OH_NativeXComponent_EventSourceType, int32_t> g_touchEventSourceMap;
static OH_NativeXComponent_TouchEvent g_touchEvent = {
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
void TouchEventCallback(OH_NativeXComponent* component, void* window);
void InitNode();

napi_value CreateTouchNativeNode(napi_env env, napi_callback_info info);
napi_value GetTouchPointWindowX(napi_env env, napi_callback_info info);
napi_value GetTouchPointWindowY(napi_env env, napi_callback_info info);
napi_value GetTouchPointDisplayX(napi_env env, napi_callback_info info);
napi_value GetTouchPointDisplayY(napi_env env, napi_callback_info info);
napi_value GetHistoricalPoints(napi_env env, napi_callback_info info);
napi_value HistoricalPointId(napi_env env, napi_callback_info info);
napi_value HistoricalPointScreenX(napi_env env, napi_callback_info info);
napi_value HistoricalPointScreenY(napi_env env, napi_callback_info info);
napi_value HistoricalPointX(napi_env env, napi_callback_info info);
napi_value HistoricalPointY(napi_env env, napi_callback_info info);
napi_value HistoricalPointType(napi_env env, napi_callback_info info);
napi_value HistoricalPointSize(napi_env env, napi_callback_info info);
napi_value HistoricalPointForce(napi_env env, napi_callback_info info);
napi_value HistoricalPointTimeStamp(napi_env env, napi_callback_info info);
napi_value HistoricalPointTitlX(napi_env env, napi_callback_info info);
napi_value HistoricalPointTitlY(napi_env env, napi_callback_info info);
napi_value HistoricalPointSourceTool(napi_env env, napi_callback_info info);
napi_value GetTouchEventSourceTool(napi_env env, napi_callback_info info);
napi_value GetTouchPointToolTypeResult(napi_env env, napi_callback_info info);
napi_value GetTouchEventSourceType(napi_env env, napi_callback_info info);
napi_value TouchPointType(napi_env env, napi_callback_info info);
napi_value TouchPointSize(napi_env env, napi_callback_info info);
napi_value TouchPointForce(napi_env env, napi_callback_info info);
napi_value TouchPointTimeStamp(napi_env env, napi_callback_info info);
napi_value TouchPointIsPressed(napi_env env, napi_callback_info info);
napi_value TouchEventId(napi_env env, napi_callback_info info);
napi_value TouchEventSize(napi_env env, napi_callback_info info);
napi_value TouchEventForce(napi_env env, napi_callback_info info);
napi_value TouchEventDeviceId(napi_env env, napi_callback_info info);
napi_value TouchEventTimeStamp(napi_env env, napi_callback_info info);
napi_value TouchPointTypeEnum(napi_env env, napi_callback_info info);
}

#endif //NDKXCOMPONENT_TOUCHPOINT_H
