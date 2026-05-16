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
#include "nodenapi/NodeNapiTest.h"
static ArkUI_NodeEvent* event_ = nullptr;
static ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;

namespace NodeNapiTest {
ArkUI_NodeHandle rowHandle1 = nullptr;
ArkUI_NodeHandle rowHandle2 = nullptr;
napi_value CreateNavigation(napi_env env, napi_callback_info info)
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
    rowHandle1 = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    rowHandle2 = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    nodeAPI->addChild(rowHandle1, rowHandle2);
    OH_ArkUI_NodeContent_AddNode(nodeContentHandle, rowHandle1);
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}

napi_value GetNavigationIdTest_001(napi_env env, napi_callback_info info)
{
    char buffer[PARAM_50];
    constexpr int32_t SMALL_BUFFER_LEN = PARAM_100;
    constexpr int32_t INIT_VAL = PARAM_20;
    int32_t resLen = INIT_VAL;
    int result = OH_ArkUI_GetNavigationId(rowHandle1, buffer, SMALL_BUFFER_LEN, &resLen);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : 1, &retValue);
    return retValue;
}

napi_value GetNavigationIdTest_002(napi_env env, napi_callback_info info)
{
    char buffer[PARAM_50];
    constexpr int32_t SMALL_BUFFER_LEN = PARAM_1;
    constexpr int32_t INIT_VAL = -PARAM_10;
    int32_t resLen = INIT_VAL;
    int result = OH_ArkUI_GetNavigationId(nullptr, buffer, SMALL_BUFFER_LEN, &resLen);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? 0 : 1, &retValue);
    return retValue;
}

napi_value GetNavigationIdTest_003(napi_env env, napi_callback_info info)
{
     // 获取ArkUI Native Node API接口
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    // 创建指定类型的节点
    auto g_handle = nodeAPI->createNode(ARKUI_NODE_CUSTOM);
    char buffer[PARAM_50];
    constexpr int32_t SMALL_BUFFER_LEN = PARAM_1;
    constexpr int32_t INIT_VAL = -PARAM_10;
    int32_t resLen = INIT_VAL;
    int result = OH_ArkUI_GetNavigationId(g_handle, buffer, SMALL_BUFFER_LEN, &resLen);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_GET_INFO_FAILED ? 0 : 1, &retValue);
    return retValue;
}

napi_value GetNavigationIdTest_004(napi_env env, napi_callback_info info)
{
    char buffer[PARAM_1];
    constexpr int32_t SMALL_BUFFER_LEN = PARAM_0;
    constexpr int32_t INIT_VAL = 0;
    int32_t resLen = INIT_VAL;
    int result = OH_ArkUI_GetNavigationId(rowHandle1, buffer, SMALL_BUFFER_LEN, &resLen);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_BUFFER_SIZE_ERROR ? 0 : 1, &retValue);
    return retValue;
}


napi_value GetNavigationIdTest_005(napi_env env, napi_callback_info info)
{
    // 获取ArkUI Native Node API接口
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    // 创建指定类型的节点
    auto g_handle = nodeAPI->createNode(ARKUI_NODE_CUSTOM);
    constexpr int32_t SMALL_BUFFER_LEN = PARAM_1;
    constexpr int32_t INIT_VAL = 0;
    int32_t resLen = INIT_VAL;
    int result = OH_ArkUI_GetNavigationId(g_handle, nullptr, SMALL_BUFFER_LEN, &resLen);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? 0 : 1, &retValue);
    return retValue;
}

napi_value GetNavigationIdTest_006(napi_env env, napi_callback_info info)
{
    // 获取ArkUI Native Node API接口
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    // 创建指定类型的节点
    auto g_handle = nodeAPI->createNode(ARKUI_NODE_CUSTOM);
    char buffer[PARAM_50];
    constexpr int32_t SMALL_BUFFER_LEN = PARAM_1;
    int result = OH_ArkUI_GetNavigationId(g_handle, buffer, SMALL_BUFFER_LEN, nullptr);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? 0 : 1, &retValue);
    return retValue;
}

napi_value GetNavDestinationNameTest_001(napi_env env, napi_callback_info info)
{
    char buffer[PARAM_50];
    constexpr int32_t SMALL_BUFFER_LEN = PARAM_100;
    constexpr int32_t INIT_VAL = PARAM_20;
    int32_t resLen = INIT_VAL;
    int result = OH_ArkUI_GetNavDestinationName(rowHandle1, buffer, SMALL_BUFFER_LEN, &resLen);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : 1, &retValue);
    return retValue;
}

napi_value GetNavDestinationNameTest_002(napi_env env, napi_callback_info info)
{
    char buffer[PARAM_50];
    constexpr int32_t SMALL_BUFFER_LEN = PARAM_1;
    constexpr int32_t INIT_VAL = -PARAM_10;
    int32_t resLen = INIT_VAL;
    int result = OH_ArkUI_GetNavDestinationName(nullptr, buffer, SMALL_BUFFER_LEN, &resLen);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? 0 : 1, &retValue);
    return retValue;
}

napi_value GetNavDestinationNameTest_003(napi_env env, napi_callback_info info)
{
     // 获取ArkUI Native Node API接口
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    // 创建指定类型的节点
    auto g_handle = nodeAPI->createNode(ARKUI_NODE_CUSTOM);
    char buffer[PARAM_50];
    constexpr int32_t SMALL_BUFFER_LEN = PARAM_1;
    constexpr int32_t INIT_VAL = -PARAM_10;
    int32_t resLen = INIT_VAL;
    int result = OH_ArkUI_GetNavDestinationName(g_handle, buffer, SMALL_BUFFER_LEN, &resLen);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_GET_INFO_FAILED ? 0 : 1, &retValue);
    return retValue;
}

napi_value GetNavDestinationNameTest_004(napi_env env, napi_callback_info info)
{
    char buffer[PARAM_50];
    constexpr int32_t SMALL_BUFFER_LEN = PARAM_1;
    constexpr int32_t INIT_VAL = 0;
    int32_t resLen = INIT_VAL;
    int result = OH_ArkUI_GetNavDestinationName(rowHandle1, buffer, SMALL_BUFFER_LEN, &resLen);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_BUFFER_SIZE_ERROR ? 0 : 1, &retValue);
    return retValue;
}

napi_value GetNavDestinationNameTest_005(napi_env env, napi_callback_info info)
{
    // 获取ArkUI Native Node API接口
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    // 创建指定类型的节点
    auto g_handle = nodeAPI->createNode(ARKUI_NODE_CUSTOM);
    constexpr int32_t SMALL_BUFFER_LEN = PARAM_1;
    constexpr int32_t INIT_VAL = 0;
    int32_t resLen = INIT_VAL;
    int result = OH_ArkUI_GetNavDestinationName(g_handle, nullptr, SMALL_BUFFER_LEN, &resLen);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? 0 : 1, &retValue);
    return retValue;
}

napi_value GetNavDestinationNameTest_006(napi_env env, napi_callback_info info)
{
    // 获取ArkUI Native Node API接口
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    // 创建指定类型的节点
    auto g_handle = nodeAPI->createNode(ARKUI_NODE_CUSTOM);
    char buffer[PARAM_50];
    constexpr int32_t SMALL_BUFFER_LEN = PARAM_1;
    int result = OH_ArkUI_GetNavDestinationName(g_handle, buffer, SMALL_BUFFER_LEN, nullptr);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? 0 : 1, &retValue);
    return retValue;
}

napi_value GetNavStackLengthTest_001(napi_env env, napi_callback_info info)
{
    int32_t length = 0;
    int result = OH_ArkUI_GetNavStackLength(rowHandle1, &length);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : 1, &retValue);
    return retValue;
}

napi_value GetNavStackLengthTest_002(napi_env env, napi_callback_info info)
{
    ArkUI_NodeHandle g_handle = nullptr;
    int32_t length = 0;
    int result = OH_ArkUI_GetNavStackLength(g_handle, &length);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? 0 : 1, &retValue);
    return retValue;
}

napi_value GetNavStackLengthTest_003(napi_env env, napi_callback_info info)
{
     // 获取ArkUI Native Node API接口
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    // 创建指定类型的节点
    auto g_handle = nodeAPI->createNode(ARKUI_NODE_CUSTOM);
    int32_t length = 0;
    int result = OH_ArkUI_GetNavStackLength(g_handle, &length);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_GET_INFO_FAILED ? 0 : 1, &retValue);
    return retValue;
}

napi_value GetNavDestinationNameByIndexTest_001(napi_env env, napi_callback_info info)
{
    char buffer[PARAM_50];
    constexpr int32_t SMALL_BUFFER_LEN = PARAM_100;
    constexpr int32_t INIT_VAL = 1;
    int32_t resLen = INIT_VAL;
    int result = OH_ArkUI_GetNavDestinationNameByIndex(rowHandle1, 0, buffer, SMALL_BUFFER_LEN, &resLen);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : 1, &retValue);
    return retValue;
}

napi_value GetNavDestinationNameByIndexTest_002(napi_env env, napi_callback_info info)
{
    char buffer[PARAM_50];
    constexpr int32_t SMALL_BUFFER_LEN = PARAM_100;
    constexpr int32_t INIT_VAL = PARAM_20;
    int32_t resLen = INIT_VAL;
    int result = OH_ArkUI_GetNavDestinationNameByIndex(rowHandle1, PARAM_NEGATIVE_1, buffer, SMALL_BUFFER_LEN, &resLen);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NODE_INDEX_INVALID ? 0 : 1, &retValue);
    return retValue;
}

napi_value GetNavDestinationNameByIndexTest_003(napi_env env, napi_callback_info info)
{
     // 获取ArkUI Native Node API接口
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    // 创建指定类型的节点
    auto g_handle = nodeAPI->createNode(ARKUI_NODE_CUSTOM);
    char buffer[PARAM_50];
    constexpr int32_t SMALL_BUFFER_LEN = PARAM_1;
    constexpr int32_t INIT_VAL = -PARAM_10;
    int32_t resLen = INIT_VAL;
    int result = OH_ArkUI_GetNavDestinationNameByIndex(g_handle, 0, buffer, SMALL_BUFFER_LEN, &resLen);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_GET_INFO_FAILED ? 0 : 1, &retValue);
    return retValue;
}

napi_value GetNavDestinationNameByIndexTest_004(napi_env env, napi_callback_info info)
{
    char buffer[PARAM_50];
    constexpr int32_t SMALL_BUFFER_LEN = PARAM_1;
    constexpr int32_t INIT_VAL = PARAM_20;
    int32_t resLen = INIT_VAL;
    int result = OH_ArkUI_GetNavDestinationNameByIndex(rowHandle1, 0, buffer, SMALL_BUFFER_LEN, &resLen);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_BUFFER_SIZE_ERROR ? 0 : 1, &retValue);
    return retValue;
}

napi_value GetNavDestinationNameByIndexTest_005(napi_env env, napi_callback_info info)
{
    ArkUI_NodeHandle g_handle = nullptr;
    char buffer[PARAM_50];
    constexpr int32_t SMALL_BUFFER_LEN = PARAM_1;
    constexpr int32_t INIT_VAL = -PARAM_10;
    int32_t resLen = INIT_VAL;
    int result = OH_ArkUI_GetNavDestinationNameByIndex(g_handle, 0, buffer, SMALL_BUFFER_LEN, &resLen);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? 0 : 1, &retValue);
    return retValue;
}

napi_value GetNavDestinationNameByIndexTest_006(napi_env env, napi_callback_info info)
{
    // 获取ArkUI Native Node API接口
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    // 创建指定类型的节点
    auto g_handle = nodeAPI->createNode(ARKUI_NODE_CUSTOM);
    char buffer[PARAM_50];
    constexpr int32_t SMALL_BUFFER_LEN = PARAM_1;
    constexpr int32_t INIT_VAL = -PARAM_10;
    int32_t resLen = INIT_VAL;
    int result = OH_ArkUI_GetNavDestinationNameByIndex(g_handle, 0, NULL, SMALL_BUFFER_LEN, &resLen);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? 0 : 1, &retValue);
    return retValue;
}

napi_value GetNavDestinationNameByIndexTest_007(napi_env env, napi_callback_info info)
{
    // 获取ArkUI Native Node API接口
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    // 创建指定类型的节点
    auto g_handle = nodeAPI->createNode(ARKUI_NODE_CUSTOM);
    char buffer[PARAM_50];
    constexpr int32_t SMALL_BUFFER_LEN = PARAM_1;
    int result = OH_ArkUI_GetNavDestinationNameByIndex(g_handle, 0, buffer, SMALL_BUFFER_LEN, nullptr);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? 0 : 1, &retValue);
    return retValue;
}

napi_value GetNavDestinationIdTest_001(napi_env env, napi_callback_info info)
{
    char buffer[PARAM_50];
    constexpr int32_t SMALL_BUFFER_LEN = PARAM_100;
    constexpr int32_t INIT_VAL = PARAM_10;
    int32_t resLen = INIT_VAL;
    int result = OH_ArkUI_GetNavDestinationId(rowHandle1, buffer, SMALL_BUFFER_LEN, &resLen);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : 1, &retValue);
    return retValue;
}

napi_value GetNavDestinationIdTest_002(napi_env env, napi_callback_info info)
{
    // 获取ArkUI Native Node API接口
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    // 创建指定类型的节点
    auto g_handle = nodeAPI->createNode(ARKUI_NODE_CUSTOM);
    char buffer[PARAM_50];
    constexpr int32_t SMALL_BUFFER_LEN = PARAM_1;
    constexpr int32_t INIT_VAL = -PARAM_10;
    int32_t resLen = INIT_VAL;
    int result = OH_ArkUI_GetNavDestinationId(g_handle, buffer, SMALL_BUFFER_LEN, &resLen);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_GET_INFO_FAILED ? 0 : 1, &retValue);
    return retValue;
}

napi_value GetNavDestinationIdTest_003(napi_env env, napi_callback_info info)
{
    char buffer[PARAM_50];
    constexpr int32_t SMALL_BUFFER_LEN = PARAM_1;
    constexpr int32_t INIT_VAL = -PARAM_10;
    int32_t resLen = INIT_VAL;
    int result = OH_ArkUI_GetNavDestinationId(rowHandle1, buffer, SMALL_BUFFER_LEN, &resLen);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_BUFFER_SIZE_ERROR ? 0 : 1, &retValue);
    return retValue;
}

napi_value GetNavDestinationIdTest_004(napi_env env, napi_callback_info info)
{
    // 获取ArkUI Native Node API接口
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    // 创建指定类型的节点
    ArkUI_NodeHandle g_handle = nullptr;
    char buffer[PARAM_50];
    constexpr int32_t SMALL_BUFFER_LEN = PARAM_1;
    constexpr int32_t INIT_VAL = 0;
    int32_t resLen = INIT_VAL;
    int result = OH_ArkUI_GetNavDestinationId(g_handle, buffer, SMALL_BUFFER_LEN, &resLen);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? 0 : 1, &retValue);
    return retValue;
}

napi_value GetNavDestinationIdTest_005(napi_env env, napi_callback_info info)
{
     // 获取ArkUI Native Node API接口
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    // 创建指定类型的节点
    auto g_handle = nodeAPI->createNode(ARKUI_NODE_CUSTOM);
    char buffer[PARAM_50];
    constexpr int32_t SMALL_BUFFER_LEN = PARAM_1;
    constexpr int32_t INIT_VAL = 0;
    int32_t resLen = INIT_VAL;
    int result = OH_ArkUI_GetNavDestinationId(g_handle, NULL, SMALL_BUFFER_LEN, &resLen);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? 0 : 1, &retValue);
    return retValue;
}

napi_value GetNavDestinationIdTest_006(napi_env env, napi_callback_info info)
{
     // 获取ArkUI Native Node API接口
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    // 创建指定类型的节点
    auto g_handle = nodeAPI->createNode(ARKUI_NODE_CUSTOM);
    char buffer[PARAM_50];
    constexpr int32_t SMALL_BUFFER_LEN = PARAM_1;
    int result = OH_ArkUI_GetNavDestinationId(g_handle, buffer, SMALL_BUFFER_LEN, nullptr);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? 0 : 1, &retValue);
    return retValue;
}

napi_value GetNavDestinationStateTest_001(napi_env env, napi_callback_info info)
{
    ArkUI_NavDestinationState state;
    int result = OH_ArkUI_GetNavDestinationState(rowHandle1, &state);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : 1, &retValue);
    return retValue;
}

napi_value GetNavDestinationStateTest_002(napi_env env, napi_callback_info info)
{
     // 获取ArkUI Native Node API接口
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    // 创建指定类型的节点
    auto g_handle = nodeAPI->createNode(ARKUI_NODE_CUSTOM);
    int result = OH_ArkUI_GetNavDestinationState(g_handle, nullptr);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? 0 : 1, &retValue);
    return retValue;
}

napi_value GetNavDestinationStateTest_003(napi_env env, napi_callback_info info)
{
     // 获取ArkUI Native Node API接口
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    // 创建指定类型的节点
    ArkUI_NodeHandle g_handle = nullptr;
    ArkUI_NavDestinationState state;
    int result = OH_ArkUI_GetNavDestinationState(g_handle, &state);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? 0 : 1, &retValue);
    return retValue;
}

napi_value GetNavDestinationStateTest_004(napi_env env, napi_callback_info info)
{
     // 获取ArkUI Native Node API接口
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    // 创建指定类型的节点
    auto g_handle = nodeAPI->createNode(ARKUI_NODE_CUSTOM);
    ArkUI_NavDestinationState state;
    int result = OH_ArkUI_GetNavDestinationState(g_handle, &state);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_GET_INFO_FAILED ? 0 : 1, &retValue);
    return retValue;
}

napi_value GetNavDestinationIndexTest_001(napi_env env, napi_callback_info info)
{
    int32_t index = 1;
    int result = OH_ArkUI_GetNavDestinationIndex(rowHandle1, &index);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : 1, &retValue);
    return retValue;
}

napi_value GetNavDestinationIndexTest_002(napi_env env, napi_callback_info info)
{
     // 获取ArkUI Native Node API接口
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    // 创建指定类型的节点
    auto g_handle = nodeAPI->createNode(ARKUI_NODE_CUSTOM);
    int result = OH_ArkUI_GetNavDestinationIndex(g_handle, nullptr);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? 0 : 1, &retValue);
    return retValue;
}

napi_value GetNavDestinationIndexTest_003(napi_env env, napi_callback_info info)
{
     // 获取ArkUI Native Node API接口
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    // 创建指定类型的节点
    ArkUI_NodeHandle g_handle = nullptr;
    int32_t index = 1;
    int result = OH_ArkUI_GetNavDestinationIndex(g_handle, &index);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? 0 : 1, &retValue);
    return retValue;
}

napi_value GetNavDestinationIndexTest_004(napi_env env, napi_callback_info info)
{
     // 获取ArkUI Native Node API接口
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    // 创建指定类型的节点
    auto g_handle = nodeAPI->createNode(ARKUI_NODE_CUSTOM);
    int32_t index = 1;
    int result = OH_ArkUI_GetNavDestinationIndex(g_handle, &index);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_GET_INFO_FAILED ? 0 : 1, &retValue);
    return retValue;
}

napi_value GetRouterPageIndexTest_001(napi_env env, napi_callback_info info)
{
    int32_t index;
    int result = OH_ArkUI_GetRouterPageIndex(rowHandle2, &index);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : 1, &retValue);
    return retValue;
}

napi_value GetRouterPageIndexTest_002(napi_env env, napi_callback_info info)
{
     // 获取ArkUI Native Node API接口
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    // 创建指定类型的节点
    auto g_handle = nodeAPI->createNode(ARKUI_NODE_CUSTOM);
    int32_t index;
    int result = OH_ArkUI_GetRouterPageIndex(g_handle, &index);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_GET_INFO_FAILED ? 0 : 1, &retValue);
    return retValue;
}

napi_value GetRouterPageIndexTest_003(napi_env env, napi_callback_info info)
{
     // 获取ArkUI Native Node API接口
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    // 创建指定类型的节点
    ArkUI_NodeHandle g_handle = nullptr;
    int32_t index;
    int result = OH_ArkUI_GetRouterPageIndex(g_handle, &index);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? 0 : 1, &retValue);
    return retValue;
}

napi_value GetRouterPageIndexTest_004(napi_env env, napi_callback_info info)
{
     // 获取ArkUI Native Node API接口
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    // 创建指定类型的节点
    auto g_handle = nodeAPI->createNode(ARKUI_NODE_CUSTOM);
    int result = OH_ArkUI_GetRouterPageIndex(g_handle, nullptr);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? 0 : 1, &retValue);
    return retValue;
}

napi_value GetRouterPageNameTest_001(napi_env env, napi_callback_info info)
{
    char buffer[PARAM_50];
    constexpr int32_t SMALL_BUFFER_LEN = PARAM_100;
    constexpr int32_t INIT_VAL = PARAM_20;
    int32_t resLen = INIT_VAL;
    int result = OH_ArkUI_GetRouterPageName(rowHandle2, buffer, SMALL_BUFFER_LEN, &resLen);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : 1, &retValue);
    return retValue;
}

napi_value GetRouterPageNameTest_002(napi_env env, napi_callback_info info)
{
    // 获取ArkUI Native Node API接口
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    // 创建指定类型的节点
    auto g_handle = nodeAPI->createNode(ARKUI_NODE_CUSTOM);
    char buffer[PARAM_50];
    constexpr int32_t SMALL_BUFFER_LEN = PARAM_1;
    constexpr int32_t INIT_VAL = -PARAM_10;
    int32_t resLen = INIT_VAL;
    int result = OH_ArkUI_GetRouterPageName(g_handle, buffer, SMALL_BUFFER_LEN, &resLen);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_GET_INFO_FAILED ? 0 : 1, &retValue);
    return retValue;
}

napi_value GetRouterPageNameTest_003(napi_env env, napi_callback_info info)
{
    char buffer[PARAM_50];
    constexpr int32_t SMALL_BUFFER_LEN = PARAM_1;
    constexpr int32_t INIT_VAL = -PARAM_10;
    int32_t resLen = INIT_VAL;
    int result = OH_ArkUI_GetRouterPageName(rowHandle2, buffer, SMALL_BUFFER_LEN, &resLen);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_BUFFER_SIZE_ERROR ? 0 : 1, &retValue);
    return retValue;
}

napi_value GetRouterPageNameTest_004(napi_env env, napi_callback_info info)
{
    ArkUI_NodeHandle g_handle = nullptr;
    char buffer[PARAM_50];
    constexpr int32_t SMALL_BUFFER_LEN = PARAM_1;
    constexpr int32_t INIT_VAL = -PARAM_10;
    int32_t resLen = INIT_VAL;
    int result = OH_ArkUI_GetRouterPageName(g_handle, buffer, SMALL_BUFFER_LEN, &resLen);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? 0 : 1, &retValue);
    return retValue;
}

napi_value GetRouterPageNameTest_005(napi_env env, napi_callback_info info)
{
    // 获取ArkUI Native Node API接口
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    // 创建指定类型的节点
    auto g_handle = nodeAPI->createNode(ARKUI_NODE_CUSTOM);
    constexpr int32_t SMALL_BUFFER_LEN = PARAM_1;
    constexpr int32_t INIT_VAL = -PARAM_10;
    int32_t resLen = INIT_VAL;
    int result = OH_ArkUI_GetRouterPageName(g_handle, NULL, SMALL_BUFFER_LEN, &resLen);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? 0 : 1, &retValue);
    return retValue;
}

napi_value GetRouterPageNameTest_006(napi_env env, napi_callback_info info)
{
    // 获取ArkUI Native Node API接口
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    // 创建指定类型的节点
    auto g_handle = nodeAPI->createNode(ARKUI_NODE_CUSTOM);
    char buffer[PARAM_50];
    constexpr int32_t SMALL_BUFFER_LEN = PARAM_1;
    int result = OH_ArkUI_GetRouterPageName(g_handle, buffer, SMALL_BUFFER_LEN, nullptr);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? 0 : 1, &retValue);
    return retValue;
}

napi_value GetRouterPagePathTest_001(napi_env env, napi_callback_info info)
{
    char buffer[PARAM_50];
    constexpr int32_t SMALL_BUFFER_LEN = PARAM_100;
    constexpr int32_t INIT_VAL = PARAM_20;
    int32_t resLen = INIT_VAL;
    int result = OH_ArkUI_GetRouterPagePath(rowHandle2, buffer, SMALL_BUFFER_LEN, &resLen);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : 1, &retValue);
    return retValue;
}

napi_value GetRouterPagePathTest_002(napi_env env, napi_callback_info info)
{
    // 获取ArkUI Native Node API接口
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    // 创建指定类型的节点
    auto g_handle = nodeAPI->createNode(ARKUI_NODE_CUSTOM);
    char buffer[PARAM_50];
    constexpr int32_t SMALL_BUFFER_LEN = PARAM_1;
    constexpr int32_t INIT_VAL = -PARAM_10;
    int32_t resLen = INIT_VAL;
    int result = OH_ArkUI_GetRouterPagePath(g_handle, buffer, SMALL_BUFFER_LEN, &resLen);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_GET_INFO_FAILED ? 0 : 1, &retValue);
    return retValue;
}

napi_value GetRouterPagePathTest_003(napi_env env, napi_callback_info info)
{
    char buffer[PARAM_50];
    constexpr int32_t SMALL_BUFFER_LEN = PARAM_1;
    constexpr int32_t INIT_VAL = -PARAM_10;
    int32_t resLen = INIT_VAL;
    int result = OH_ArkUI_GetRouterPagePath(rowHandle2, buffer, SMALL_BUFFER_LEN, &resLen);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_BUFFER_SIZE_ERROR ? 0 : 1, &retValue);
    return retValue;
}

napi_value GetRouterPagePathTest_004(napi_env env, napi_callback_info info)
{
    ArkUI_NodeHandle g_handle = nullptr;
    char buffer[PARAM_50];
    constexpr int32_t SMALL_BUFFER_LEN = PARAM_1;
    constexpr int32_t INIT_VAL = -PARAM_10;
    int32_t resLen = INIT_VAL;
    int result = OH_ArkUI_GetRouterPagePath(g_handle, buffer, SMALL_BUFFER_LEN, &resLen);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? 0 : 1, &retValue);
    return retValue;
}

napi_value GetRouterPagePathTest_005(napi_env env, napi_callback_info info)
{
    // 获取ArkUI Native Node API接口
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    // 创建指定类型的节点
    auto g_handle = nodeAPI->createNode(ARKUI_NODE_CUSTOM);
    constexpr int32_t SMALL_BUFFER_LEN = PARAM_1;
    constexpr int32_t INIT_VAL = -PARAM_10;
    int32_t resLen = INIT_VAL;
    int result = OH_ArkUI_GetRouterPagePath(g_handle, NULL, SMALL_BUFFER_LEN, &resLen);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? 0 : 1, &retValue);
    return retValue;
}

napi_value GetRouterPagePathTest_006(napi_env env, napi_callback_info info)
{
    // 获取ArkUI Native Node API接口
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    // 创建指定类型的节点
    auto g_handle = nodeAPI->createNode(ARKUI_NODE_CUSTOM);
    char buffer[PARAM_50];
    constexpr int32_t SMALL_BUFFER_LEN = PARAM_1;
    int result = OH_ArkUI_GetRouterPagePath(g_handle, buffer, SMALL_BUFFER_LEN, nullptr);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? 0 : 1, &retValue);
    return retValue;
}

napi_value GetRouterPageStateTest_001(napi_env env, napi_callback_info info)
{
    ArkUI_RouterPageState state;
    int result = OH_ArkUI_GetRouterPageState(rowHandle2, &state);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : 1, &retValue);
    return retValue;
}

napi_value GetRouterPageStateTest_002(napi_env env, napi_callback_info info)
{
     // 获取ArkUI Native Node API接口
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    // 创建指定类型的节点
    auto g_handle = nodeAPI->createNode(ARKUI_NODE_CUSTOM);
    ArkUI_RouterPageState state;
    int result = OH_ArkUI_GetRouterPageState(g_handle, &state);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_GET_INFO_FAILED ? 0 : 1, &retValue);
    return retValue;
}

napi_value GetRouterPageStateTest_003(napi_env env, napi_callback_info info)
{
     // 获取ArkUI Native Node API接口
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    // 创建指定类型的节点
    ArkUI_NodeHandle g_handle = nullptr;
    ArkUI_RouterPageState state;
    int result = OH_ArkUI_GetRouterPageState(g_handle, &state);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? 0 : 1, &retValue);
    return retValue;
}

napi_value GetRouterPageStateTest_004(napi_env env, napi_callback_info info)
{
     // 获取ArkUI Native Node API接口
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    // 创建指定类型的节点
    auto g_handle = nodeAPI->createNode(ARKUI_NODE_CUSTOM);
    int result = OH_ArkUI_GetRouterPageState(g_handle, nullptr);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? 0 : 1, &retValue);
    return retValue;
}

napi_value GetRouterPageIdTest_001(napi_env env, napi_callback_info info)
{
    char buffer[PARAM_50];
    constexpr int32_t SMALL_BUFFER_LEN = PARAM_100;
    constexpr int32_t INIT_VAL = PARAM_20;
    int32_t resLen = INIT_VAL;
    int result = OH_ArkUI_GetRouterPageId(rowHandle2, buffer, SMALL_BUFFER_LEN, &resLen);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : 1, &retValue);
    return retValue;
}

napi_value GetRouterPageIdTest_002(napi_env env, napi_callback_info info)
{
    // 获取ArkUI Native Node API接口
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    // 创建指定类型的节点
    auto g_handle = nodeAPI->createNode(ARKUI_NODE_CUSTOM);
    char buffer[PARAM_50];
    constexpr int32_t SMALL_BUFFER_LEN = PARAM_1;
    constexpr int32_t INIT_VAL = -PARAM_10;
    int32_t resLen = INIT_VAL;
    int result = OH_ArkUI_GetRouterPageId(g_handle, buffer, SMALL_BUFFER_LEN, &resLen);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_GET_INFO_FAILED ? 0 : 1, &retValue);
    return retValue;
}

napi_value GetRouterPageIdTest_003(napi_env env, napi_callback_info info)
{
    char buffer[PARAM_50];
    constexpr int32_t SMALL_BUFFER_LEN = PARAM_1;
    constexpr int32_t INIT_VAL = -PARAM_10;
    int32_t resLen = INIT_VAL;
    int result = OH_ArkUI_GetRouterPageId(rowHandle2, buffer, SMALL_BUFFER_LEN, &resLen);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_BUFFER_SIZE_ERROR ? 0 : 1, &retValue);
    return retValue;
}

napi_value GetRouterPageIdTest_004(napi_env env, napi_callback_info info)
{
    ArkUI_NodeHandle g_handle = nullptr;
    char buffer[PARAM_50];
    constexpr int32_t SMALL_BUFFER_LEN = PARAM_1;
    constexpr int32_t INIT_VAL = -PARAM_10;
    int32_t resLen = INIT_VAL;
    int result = OH_ArkUI_GetRouterPageId(g_handle, buffer, SMALL_BUFFER_LEN, &resLen);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? 0 : 1, &retValue);
    return retValue;
}

napi_value GetRouterPageIdTest_005(napi_env env, napi_callback_info info)
{
    // 获取ArkUI Native Node API接口
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    // 创建指定类型的节点
    auto g_handle = nodeAPI->createNode(ARKUI_NODE_CUSTOM);
    constexpr int32_t SMALL_BUFFER_LEN = PARAM_1;
    constexpr int32_t INIT_VAL = -PARAM_10;
    int32_t resLen = INIT_VAL;
    int result = OH_ArkUI_GetRouterPageId(g_handle, NULL, SMALL_BUFFER_LEN, &resLen);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? 0 : 1, &retValue);
    return retValue;
}

napi_value GetRouterPageIdTest_006(napi_env env, napi_callback_info info)
{
    // 获取ArkUI Native Node API接口
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    // 创建指定类型的节点
    auto g_handle = nodeAPI->createNode(ARKUI_NODE_CUSTOM);
    char buffer[PARAM_50];
    constexpr int32_t SMALL_BUFFER_LEN = PARAM_1;
    int result = OH_ArkUI_GetRouterPageId(g_handle, buffer, SMALL_BUFFER_LEN, nullptr);
    napi_value retValue;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? 0 : 1, &retValue);
    return retValue;
}
}
