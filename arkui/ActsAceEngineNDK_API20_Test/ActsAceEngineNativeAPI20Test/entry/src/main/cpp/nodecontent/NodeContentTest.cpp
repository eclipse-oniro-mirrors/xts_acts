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
#include "NodeContentTest.h"
static ArkUI_NodeContentHandle g_nodeContentHandle_ = nullptr;
static ArkUI_NativeNodeAPI_1 *g_NodeAPI = nullptr;
namespace NodeContentTest {

napi_value createNode1(napi_env env, napi_callback_info info)
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
    OH_ArkUI_GetNodeContentFromNapiValue(env, args[0], &g_nodeContentHandle_);
    auto nodeContentEvent = [](ArkUI_NodeContentEvent *event) {
        ArkUI_NodeContentHandle handle = OH_ArkUI_NodeContentEvent_GetNodeContentHandle(event);
        OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, g_NodeAPI);
        auto node = g_NodeAPI->createNode(ARKUI_NODE_LIST);
        if (OH_ArkUI_NodeContentEvent_GetEventType(event) == NODE_CONTENT_EVENT_ON_ATTACH_TO_WINDOW) {
            OH_ArkUI_NodeContent_AddNode(handle, node);
        }
    };
    OH_ArkUI_NodeContent_RegisterCallback(g_nodeContentHandle_, nodeContentEvent);
    return nullptr;
}

void ContentEventCallback(ArkUI_NodeContentEvent* event)
{
    return;
}

napi_value RegisterCallbackTest_001(napi_env env, napi_callback_info info)
{
    int result = OH_ArkUI_NodeContent_RegisterCallback(g_nodeContentHandle_, ContentEventCallback);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : 1, &retValue);
    return retValue;
}

napi_value RegisterCallbackTest_002(napi_env env, napi_callback_info info)
{
    ArkUI_NodeContentHandle content = OH_ArkUI_NodeContentEvent_GetNodeContentHandle(nullptr);
    int result = OH_ArkUI_NodeContent_RegisterCallback(content, ArkUI_NodeContentCallback());
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? 0 : 1, &retValue);
    return retValue;
}

napi_value SetUserDataTest_001(napi_env env, napi_callback_info info)
{
    int result = OH_ArkUI_NodeContent_SetUserData(g_nodeContentHandle_, new std::string("test"));
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : 1, &retValue);
    return retValue;
}

napi_value SetUserDataTest_002(napi_env env, napi_callback_info info)
{
    ArkUI_NodeContentHandle content = OH_ArkUI_NodeContentEvent_GetNodeContentHandle(nullptr);
    int result = OH_ArkUI_NodeContent_SetUserData(content, new std::string("test"));
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? 0 : 1, &retValue);
    return retValue;
}

napi_value AddNodeTest_001(napi_env env, napi_callback_info info)
{
     // 获取ArkUI Native Node API接口
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, g_NodeAPI);
    // 创建指定类型的节点
    auto g_handle = g_NodeAPI->createNode(ARKUI_NODE_CUSTOM);
    int result = OH_ArkUI_NodeContent_AddNode(g_nodeContentHandle_, g_handle);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : 1, &retValue);
    return retValue;
}

napi_value AddNodeTest_002(napi_env env, napi_callback_info info)
{
    int result = OH_ArkUI_NodeContent_AddNode(g_nodeContentHandle_, nullptr);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? 0 : 1, &retValue);
    return retValue;
}

napi_value RemoveNodeTest_001(napi_env env, napi_callback_info info)
{
     // 获取ArkUI Native Node API接口
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, g_NodeAPI);
    // 创建指定类型的节点
    auto g_handle = g_NodeAPI->createNode(ARKUI_NODE_CUSTOM);
    int result = OH_ArkUI_NodeContent_RemoveNode(g_nodeContentHandle_, g_handle);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : 1, &retValue);
    return retValue;
}
napi_value RemoveNodeTest_002(napi_env env, napi_callback_info info)
{
    int result = OH_ArkUI_NodeContent_RemoveNode(g_nodeContentHandle_, nullptr);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? 0 : 1, &retValue);
    return retValue;
}
napi_value InsertNodeTest_001(napi_env env, napi_callback_info info)
{
     // 获取ArkUI Native Node API接口
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, g_NodeAPI);
    // 创建指定类型的节点
    auto g_handle = g_NodeAPI->createNode(ARKUI_NODE_CUSTOM);
    int result = OH_ArkUI_NodeContent_InsertNode(g_nodeContentHandle_, g_handle, 1);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : 1, &retValue);
    return retValue;
}
napi_value InsertNodeTest_002(napi_env env, napi_callback_info info)
{
    int result = OH_ArkUI_NodeContent_InsertNode(g_nodeContentHandle_, nullptr, 1);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? 0 : 1, &retValue);
    return retValue;
}
}