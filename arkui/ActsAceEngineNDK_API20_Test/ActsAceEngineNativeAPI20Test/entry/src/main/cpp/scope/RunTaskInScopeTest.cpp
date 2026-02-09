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
#include "RunTaskInScopeTest.h"
#include <arkui/native_node.h>
#include <string>
#include <arkui/native_node_napi.h>
static ArkUI_NativeNodeAPI_1 *g_nodeAPI_ = nullptr;
static int NUMBER_3 = 3;
static int NUMBER_4 = 4;
static int NUMBER_5 = 5;
static int NUMBER_6 = 6;
static int g_snapresult1 = 2;
static int g_snapresult2 = 2;
static int g_snapresult3 = 2;
static int g_snapresult4 = 2;
ArkUI_NodeHandle pageOneButton1 = nullptr;
ArkUI_NodeHandle button5 = nullptr;
ArkUI_NodeHandle column = nullptr;
namespace RunTaskInScopeTest {

napi_value testRunTaskInScope(napi_env env, napi_callback_info info)
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
    column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NodeHandle button2 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    nodeAPI->registerNodeEvent(button2, NODE_ON_CLICK, NUMBER_3, nullptr);
    ArkUI_AttributeItem LABEL_Item2 = {.string = "uiContext"};
    nodeAPI->setAttribute(button2, NODE_BUTTON_LABEL, &LABEL_Item2);
    ArkUI_AttributeItem id2 = {.string = "btn2_id"};
    nodeAPI->setAttribute(button2, NODE_ID, &id2);
    ArkUI_NodeHandle button3 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    nodeAPI->registerNodeEvent(button3, NODE_ON_CLICK, NUMBER_4, nullptr);
    ArkUI_AttributeItem LABEL_Item3 = {.string = "uiContext 为空"};
    nodeAPI->setAttribute(button3, NODE_BUTTON_LABEL, &LABEL_Item3);
    ArkUI_AttributeItem id3 = {.string = "btn3_id"};
    nodeAPI->setAttribute(button3, NODE_ID, &id3);
    button5 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    nodeAPI->registerNodeEvent(button5, NODE_ON_CLICK, NUMBER_6, nullptr);
    ArkUI_AttributeItem LABEL_Item5 = {.string = "change uiContext2"};
    nodeAPI->setAttribute(button5, NODE_BUTTON_LABEL, &LABEL_Item5);
    ArkUI_AttributeItem id0 = {.string = "uiContext2"};
    nodeAPI->setAttribute(button5, NODE_ID, &id0);
    nodeAPI->addChild(column, button3);
    nodeAPI->addChild(column, button5);
    OH_ArkUI_NodeContent_AddNode(nodeContentHandle, column);
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

napi_value RunTaskInScopeTest_001(napi_env env, napi_callback_info info)
{
    auto uiContext = OH_ArkUI_GetContextByNode(button5);
    g_snapresult1 = OH_ArkUI_RunTaskInScope(uiContext, button5, [](void *userData) {});
    napi_value retValue;
    napi_create_int32(env, g_snapresult1 == ARKUI_ERROR_CODE_NO_ERROR ? 0 : 1, &retValue);
    return retValue;
}

napi_value RunTaskInScopeTest_002(napi_env env, napi_callback_info info)
{
    auto uiContext = OH_ArkUI_GetContextByNode(button5);
    g_snapresult2 = OH_ArkUI_RunTaskInScope(uiContext, nullptr, nullptr);
    napi_value retValue;
    napi_create_int32(env, g_snapresult2 == ARKUI_ERROR_CODE_CALLBACK_INVALID ? 0 : 1, &retValue);
    return retValue;
}

napi_value RunTaskInScopeTest_003(napi_env env, napi_callback_info info)
{
    auto uiContext = OH_ArkUI_GetContextByNode(button5);
    g_snapresult3 = OH_ArkUI_RunTaskInScope(uiContext, button5, nullptr);
    napi_value retValue;
    napi_create_int32(env, g_snapresult3, &retValue);
    return retValue;
}

napi_value RunTaskInScopeTest_004(napi_env env, napi_callback_info info)
{
     // 获取ArkUI Native Node API接口
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, g_nodeAPI_);
    // 创建指定类型的节点
    auto uiContext = nullptr;
    g_snapresult4 = OH_ArkUI_RunTaskInScope(uiContext, nullptr, nullptr);
    napi_value retValue;
    napi_create_int32(env, g_snapresult4 == ARKUI_ERROR_CODE_UI_CONTEXT_INVALID ? 0 : 1, &retValue);
    return retValue;
}

}