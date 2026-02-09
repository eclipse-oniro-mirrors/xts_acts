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
#include "NodeAdapterTest.h"

static ArkUI_NativeNodeAPI_1 *nativenodeAPI = nullptr;
namespace NodeAdapterTest {
ArkUI_NodeAdapterHandle g_adapter = nullptr;
ArkUI_NodeHandle text;
int g_totalNodeCnt = 1000;
uint32_t g_from = 1;
uint32_t g_to = 2;
uint32_t g_startPosition = 0;
uint32_t g_itemCount = 10;
int32_t g_ret1 = 2;
int32_t g_ret2 = 2;
void receiver(ArkUI_NodeAdapterEvent *event)
{
    g_ret1 = OH_ArkUI_NodeAdapterEvent_SetItem(event, text) == ARKUI_ERROR_CODE_NO_ERROR;
    int32_t nodeId = 'text1';
    g_ret2 = OH_ArkUI_NodeAdapterEvent_SetNodeId(event, nodeId) == ARKUI_ERROR_CODE_NO_ERROR;
}
napi_value CreateAdapterNode(napi_env env, napi_callback_info info)
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
    g_adapter = OH_ArkUI_NodeAdapter_Create();
    auto list = nodeAPI->createNode(ARKUI_NODE_LIST);
    text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    OH_ArkUI_NodeContent_AddNode(nodeContentHandle, list);
    // 把adapter挂载到list上
    ArkUI_AttributeItem item = { .object = g_adapter };
    auto ret1 = nodeAPI->setAttribute(list, NODE_LIST_NODE_ADAPTER, &item);
    ArkUI_NumberValue width[] = {{ .f32 = 1.0 }};
    ArkUI_AttributeItem item1 = {.value = width, .size = PARAM_1};
    nodeAPI->setAttribute(list, NODE_WIDTH_PERCENT, &item1);
    nodeAPI->setAttribute(list, NODE_HEIGHT_PERCENT, &item1);
    OH_ArkUI_NodeAdapter_RegisterEventReceiver(g_adapter, nullptr, receiver);
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}
napi_value SetTotalNodeCountTest_001(napi_env env, napi_callback_info info)
{
    ArkUI_NodeAdapterHandle adapter = OH_ArkUI_NodeAdapter_Create();
    int result = OH_ArkUI_NodeAdapter_SetTotalNodeCount(adapter, g_totalNodeCnt);
    OH_ArkUI_NodeAdapter_Dispose(adapter);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : 1, &retValue);
    return retValue;
}

napi_value SetTotalNodeCountTest_002(napi_env env, napi_callback_info info)
{
    int result = OH_ArkUI_NodeAdapter_SetTotalNodeCount(nullptr, g_totalNodeCnt);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? 0 : 1, &retValue);
    return retValue;
}

napi_value RegisterEventReceiverTest_001(napi_env env, napi_callback_info info)
{
    int result = OH_ArkUI_NodeAdapter_RegisterEventReceiver(nullptr, 0, nullptr);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? 0 : 1, &retValue);
    return retValue;
}

napi_value ReloadAllItemsTest_001(napi_env env, napi_callback_info info)
{
    int result = OH_ArkUI_NodeAdapter_ReloadAllItems(g_adapter);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : 1, &retValue);
    return retValue;
}

napi_value ReloadAllItemsTest_002(napi_env env, napi_callback_info info)
{
    int result = OH_ArkUI_NodeAdapter_ReloadAllItems(nullptr);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? 0 : 1, &retValue);
    return retValue;
}

napi_value ReloadItemTest_001(napi_env env, napi_callback_info info)
{
    int result = OH_ArkUI_NodeAdapter_ReloadItem(g_adapter, g_startPosition, g_itemCount);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : 1, &retValue);
    return retValue;
}

napi_value ReloadItemTest_002(napi_env env, napi_callback_info info)
{
    int result = OH_ArkUI_NodeAdapter_ReloadItem(nullptr, g_startPosition, g_itemCount);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? 0 : 1, &retValue);
    return retValue;
}

napi_value RemoveItemTest_001(napi_env env, napi_callback_info info)
{
    int result = OH_ArkUI_NodeAdapter_RemoveItem(g_adapter, g_startPosition, g_itemCount);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : 1, &retValue);
    return retValue;
}

napi_value RemoveItemTest_002(napi_env env, napi_callback_info info)
{
    int result = OH_ArkUI_NodeAdapter_RemoveItem(nullptr, g_startPosition, g_itemCount);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? 0 : 1, &retValue);
    return retValue;
}

napi_value InsertItemTest_001(napi_env env, napi_callback_info info)
{
    int result = OH_ArkUI_NodeAdapter_InsertItem(g_adapter, g_startPosition, g_itemCount);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : 1, &retValue);
    return retValue;
}

napi_value InsertItemTest_002(napi_env env, napi_callback_info info)
{
    int result = OH_ArkUI_NodeAdapter_InsertItem(nullptr, g_startPosition, g_itemCount);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? 0 : 1, &retValue);
    return retValue;
}

napi_value MoveItemTest_001(napi_env env, napi_callback_info info)
{
    int result = OH_ArkUI_NodeAdapter_MoveItem(g_adapter, g_from, g_to);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : 1, &retValue);
    return retValue;
}

napi_value MoveItemTest_002(napi_env env, napi_callback_info info)
{
    int result = OH_ArkUI_NodeAdapter_MoveItem(nullptr, g_from, g_to);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? 0 : 1, &retValue);
    return retValue;
}

napi_value GetAllItemsTest_001(napi_env env, napi_callback_info info)
{
    ArkUI_NodeAdapterHandle adapter = OH_ArkUI_NodeAdapter_Create();
    uint32_t size = 2;
    int result = OH_ArkUI_NodeAdapter_GetAllItems(adapter, nullptr, &size);
    OH_ArkUI_NodeAdapter_Dispose(adapter);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : 1, &retValue);
    return retValue;
}

napi_value GetAllItemsTest_002(napi_env env, napi_callback_info info)
{
    int result = OH_ArkUI_NodeAdapter_GetAllItems(nullptr, nullptr, 0);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? 0 : 1, &retValue);
    return retValue;
}

napi_value SetItemTest_001(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    napi_create_int32(env, g_ret1 ? 0 : 1, &retValue);
    return retValue;
}

napi_value SetItemTest_002(napi_env env, napi_callback_info info)
{
    int result = OH_ArkUI_NodeAdapterEvent_SetItem(nullptr, nullptr);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? 0 : 1, &retValue);
    return retValue;
}

napi_value SetNodeIdTest_001(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    napi_create_int32(env, g_ret2 ? 0 : 1, &retValue);
    return retValue;
}

napi_value SetNodeIdTest_002(napi_env env, napi_callback_info info)
{
    int result = OH_ArkUI_NodeAdapterEvent_SetNodeId(nullptr, 1);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? 0 : 1, &retValue);
    return retValue;
}
}