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

#include "NodeEventTest.h"
#include <cstdint>

static int32_t g_test1ret1 = 2;
static int32_t g_test1ret2 = 2;
static int32_t g_test2ret1 = 2;
static int32_t g_test2ret2 = 2;
static int32_t g_test3ret1 = 2;
static int32_t g_test3ret2 = 2;

namespace NodeEventTest {
napi_value GetNumberValueTest_001(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    napi_create_int32(env, g_test1ret1 ? 0 : 1, &retValue);
    return retValue;
}

napi_value GetNumberValueTest_002(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    napi_create_int32(env, g_test1ret2 ? 0 : 1, &retValue);
    return retValue;
}

napi_value GetNumberValueTest_003(napi_env env, napi_callback_info info)
{
    ArkUI_NodeEvent* event = nullptr;
    ArkUI_NumberValue numberValue;
    int result = OH_ArkUI_NodeEvent_GetNumberValue(event, 0, &numberValue);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NODE_EVENT_PARAM_INVALID ? 0 : 1, &retValue);
    return retValue;
}

napi_value GetStringValueTest_001(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    napi_create_int32(env, g_test2ret1 ? 0 : 1, &retValue);
    return retValue;
}

napi_value GetStringValueTest_002(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    napi_create_int32(env, g_test2ret2 ? 0 : 1, &retValue);
    return retValue;
}

napi_value GetStringValueTest_003(napi_env env, napi_callback_info info)
{
    ArkUI_NodeEvent* event = nullptr;
    char* str = nullptr;
    int32_t size = 0;
    int32_t result = OH_ArkUI_NodeEvent_GetStringValue(event, 0, &str, &size);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NODE_EVENT_PARAM_INVALID ? 0 : 1, &retValue);
    return retValue;
}

napi_value SetReturnNumberValueTest_001(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    napi_create_int32(env, g_test1ret1 ? 0 : 1, &retValue);
    return retValue;
}

napi_value SetReturnNumberValueTest_002(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    napi_create_int32(env, g_test3ret2, &retValue);
    return retValue;
}

napi_value SetReturnNumberValueTest_003(napi_env env, napi_callback_info info)
{
    ArkUI_NumberValue values[1] = {{0}};
    int32_t result = OH_ArkUI_NodeEvent_SetReturnNumberValue(nullptr, values, 1);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NODE_EVENT_PARAM_INVALID ? 0 : 1, &retValue);
    return retValue;
}

void onReceiver1(ArkUI_NodeEvent *event)
{
    ArkUI_NumberValue value[] = {{.f32 = 10.0f}};
    int32_t index = 0;
    g_test1ret1 = OH_ArkUI_NodeEvent_GetNumberValue(event, index, value) == ARKUI_ERROR_CODE_NO_ERROR;
    g_test1ret2 = OH_ArkUI_NodeEvent_GetNumberValue(event, -1, value) ==
                  ARKUI_ERROR_CODE_NODE_EVENT_PARAM_INDEX_OUT_OF_RANGE;
    char insert[PARAM_64];
    char* insertValue[PARAM_1] = { insert };
    int32_t bufSize[PARAM_1] = { PARAM_64 };
    g_test2ret1 = OH_ArkUI_NodeEvent_GetStringValue(event, 0, insertValue, bufSize) == ARKUI_ERROR_CODE_NO_ERROR;
    g_test2ret2 = OH_ArkUI_NodeEvent_GetStringValue(event, PARAM_1000, insertValue, bufSize) ==
                  ARKUI_ERROR_CODE_NODE_EVENT_PARAM_INDEX_OUT_OF_RANGE;
    int32_t size3 = 1;
    ArkUI_NumberValue value3[] = {{.i32 = 10}};
    g_test3ret1 = OH_ArkUI_NodeEvent_SetReturnNumberValue(event, value3, size3);
    g_test3ret2 = OH_ArkUI_NodeEvent_SetReturnNumberValue(event, value3, size3);
    return;
}
napi_value CreateNode(napi_env env, napi_callback_info info)
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
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    ArkUI_NodeContentHandle nodeContentHandle = nullptr;
    OH_ArkUI_GetNodeContentFromNapiValue(env, args[0], &nodeContentHandle);
    // 1. 获取ArkUI Native Node API接口
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto nodeHandle = nodeAPI->createNode(ARKUI_NODE_TEXT_INPUT);
    OH_ArkUI_NodeContent_AddNode(nodeContentHandle, nodeHandle);
    ArkUI_AttributeItem nodeHandleitem = { .string = "textinput111", .size = PARAM_1 };
    nodeAPI->setAttribute(nodeHandle, NODE_ID, &nodeHandleitem);
    ArkUI_NumberValue width_value[] = {{.f32 = SIZE_200}};
    ArkUI_AttributeItem width_item = {.value = width_value, .size = PARAM_1};
    nodeAPI->setAttribute(nodeHandle, NODE_WIDTH, &width_item);
    nodeAPI->setAttribute(nodeHandle, NODE_HEIGHT, &width_item);
    ArkUI_NumberValue margin_value[] = {{.f32 = DEFAULT_MARGIN}};
    ArkUI_AttributeItem margin_item = {.value = margin_value, .size = PARAM_1};
    nodeAPI->setAttribute(nodeHandle, NODE_MARGIN, &margin_item);
    ArkUI_NumberValue textinputvalue[] = {{ .u32 = 0xFF0000FF }};
    ArkUI_AttributeItem textinputcoloritem = {.value = textinputvalue, .size = 1};
    nodeAPI->setAttribute(nodeHandle, NODE_BACKGROUND_COLOR, &textinputcoloritem);
    nodeAPI->registerNodeEvent(nodeHandle, NODE_TEXT_INPUT_ON_DID_INSERT, 1, nullptr);
    nodeAPI->addNodeEventReceiver(nodeHandle, onReceiver1);
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}
}