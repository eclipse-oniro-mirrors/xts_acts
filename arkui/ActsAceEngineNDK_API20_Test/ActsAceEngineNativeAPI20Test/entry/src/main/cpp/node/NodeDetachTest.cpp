 /*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#include "NodeDetachTest.h"
#include <arkui/native_node.h>


namespace NodeDetachTest {
static ArkUI_NodeContentHandle g_nodeContentHandle_ = nullptr;
static ArkUI_NativeNodeAPI_1 *g_NodeAPI = nullptr;


napi_value createNodeComponent(napi_env env, napi_callback_info info)
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
        if (OH_ArkUI_NodeContentEvent_GetEventType(event) == NODE_CONTENT_EVENT_ON_DETACH_FROM_WINDOW) {
            OH_ArkUI_NodeContent_RemoveNode(handle, node);
        }
    };
    OH_ArkUI_NodeContent_RegisterCallback(g_nodeContentHandle_, nodeContentEvent);
    return nullptr;
}

napi_value NodeDetachTest(napi_env env, napi_callback_info info)
{
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, g_NodeAPI);
    auto g_handle = g_NodeAPI->createNode(ARKUI_NODE_CUSTOM);
    int result = OH_ArkUI_NodeContent_RemoveNode(g_nodeContentHandle_, g_handle);
    napi_value retValue;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

};