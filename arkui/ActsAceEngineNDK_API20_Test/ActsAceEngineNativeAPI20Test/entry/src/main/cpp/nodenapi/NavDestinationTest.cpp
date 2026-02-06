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
#include "manager/PluginManagerTest.h"
static ArkUI_NodeEvent* event_ = nullptr;
static ArkUI_NodeHandle rowHandle = nullptr;
static ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
static int g_nodenapiresult1 = 2;
static int g_nodenapiresult2 = 2;
static int g_nodenapiresult3 = 2;
static int g_nodenapiresult4 = 2;
static int g_nodenapiresult5 = 2;
static int g_nodenapiresult6 = 2;
static int g_nodenapiresult7 = 2;
namespace NodeNapiTest {

napi_value CreateNavDestination(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(
        LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "HybirdGetNodeHandleTest", "HybirdGetNodeHandleTest CreateNativeNode");

    size_t argc = 3;
    napi_value args[3] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = 64;
    size_t strLength = 0;
    char xComponentID[64] = { 0 };
    napi_get_value_string_utf8(env, args[0], xComponentID, length, &strLength);
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "HybirdGetNodeHandleTest", "GetContext env or info is null");
        return nullptr;
    }
    napi_ref refer;
    // 创建引用之后保存，防止释放。
    napi_create_reference(env, args[0], 1, &refer);

    napi_value result = nullptr;
    napi_value createRow = nullptr;
    // 调用ArkTS的Create函数创建ArkTS的ComponentContent。
    napi_get_reference_value(env, refer, &createRow);
    napi_call_function(env, nullptr, createRow, 1, &args[PARAM_2], &result);
   //获取context
    static ArkUI_ContextHandle context = nullptr;
    OH_ArkUI_GetContextFromNapiValue(env, args[0], &context);
    
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    // set parent node
    auto parentColumn = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto g_handle = nodeAPI->createNode(ARKUI_NODE_CUSTOM);
    nodeAPI->addChild(parentColumn, g_handle);
    
    char buffer[50];
    constexpr int32_t SMALL_BUFFER_LEN = 1;
    constexpr int32_t INIT_VAL = -10;
    int32_t resLen = INIT_VAL;
    g_nodenapiresult7 = OH_ArkUI_GetNavDestinationName(g_handle, buffer, SMALL_BUFFER_LEN, &resLen);
    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(ArkUICapiTest::PluginManager::GetInstance()->
                                                 GetNativeXComponent(id), parentColumn) ==INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "HybirdGetNodeHandleTest",
            "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}

napi_value GetNavDestinationNameTest_001(napi_env env, napi_callback_info info)
{
     // 获取ArkUI Native Node API接口
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    // 创建指定类型的节点
    auto g_handle = nodeAPI->createNode(ARKUI_NODE_CUSTOM);
    char buffer[50];
    constexpr int32_t SMALL_BUFFER_LEN = 1;
    constexpr int32_t INIT_VAL = -10;
    int32_t resLen = INIT_VAL;
    auto result = OH_ArkUI_GetNavDestinationName(rowHandle, buffer, SMALL_BUFFER_LEN, &resLen);
    napi_value retValue;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value GetNavDestinationNameTest_002(napi_env env, napi_callback_info info)
{
    char buffer[50];
    constexpr int32_t SMALL_BUFFER_LEN = 1;
    constexpr int32_t INIT_VAL = -10;
    int32_t resLen = INIT_VAL;
    auto result = OH_ArkUI_GetNavDestinationName(nullptr, buffer, SMALL_BUFFER_LEN, &resLen);
    napi_value retValue;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value GetNavDestinationNameTest_003(napi_env env, napi_callback_info info)
{
     // 获取ArkUI Native Node API接口
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    // 创建指定类型的节点
    auto g_handle = nodeAPI->createNode(ARKUI_NODE_CUSTOM);
    char buffer[50];
    constexpr int32_t SMALL_BUFFER_LEN = 1;
    constexpr int32_t INIT_VAL = -10;
    int32_t resLen = INIT_VAL;
    auto result = OH_ArkUI_GetNavDestinationName(g_handle, buffer, SMALL_BUFFER_LEN, &resLen);
    napi_value retValue;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value GetNavDestinationNameTest_004(napi_env env, napi_callback_info info)
{
    // 获取ArkUI Native Node API接口
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    // 创建指定类型的节点
    auto g_handle = nodeAPI->createNode(ARKUI_NODE_CUSTOM);
    char buffer[50];
    constexpr int32_t SMALL_BUFFER_LEN = 1;
    constexpr int32_t INIT_VAL = 0;
    int32_t resLen = INIT_VAL;
    auto result = OH_ArkUI_GetNavDestinationName(g_handle, buffer, SMALL_BUFFER_LEN, &resLen);
    napi_value retValue;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value GetNavDestinationNameTest_005(napi_env env, napi_callback_info info)
{
    // 获取ArkUI Native Node API接口
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    // 创建指定类型的节点
    auto g_handle = nodeAPI->createNode(ARKUI_NODE_CUSTOM);
    constexpr int32_t SMALL_BUFFER_LEN = 1;
    constexpr int32_t INIT_VAL = 0;
    int32_t resLen = INIT_VAL;
    auto result = OH_ArkUI_GetNavDestinationName(g_handle, nullptr, SMALL_BUFFER_LEN, &resLen);
    napi_value retValue;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value GetNavDestinationNameTest_006(napi_env env, napi_callback_info info)
{
    // 获取ArkUI Native Node API接口
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    // 创建指定类型的节点
    auto g_handle = nodeAPI->createNode(ARKUI_NODE_CUSTOM);
    char buffer[50];
    constexpr int32_t SMALL_BUFFER_LEN = 1;
    auto result = OH_ArkUI_GetNavDestinationName(g_handle, buffer, SMALL_BUFFER_LEN, nullptr);
    napi_value retValue;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value GetNavStackLengthTest_001(napi_env env, napi_callback_info info)
{
     // 获取ArkUI Native Node API接口
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    // 创建指定类型的节点
    auto g_handle = nodeAPI->createNode(ARKUI_NODE_CUSTOM);
    int32_t length = 0;
    auto result = OH_ArkUI_GetNavStackLength(g_handle, &length);
    napi_value retValue;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value GetNavStackLengthTest_002(napi_env env, napi_callback_info info)
{
    ArkUI_NodeHandle g_handle = nullptr;
    int32_t length = 0;
    auto result = OH_ArkUI_GetNavStackLength(g_handle, &length);
    napi_value retValue;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value GetNavStackLengthTest_003(napi_env env, napi_callback_info info)
{
     // 获取ArkUI Native Node API接口
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    // 创建指定类型的节点
    auto g_handle = nodeAPI->createNode(ARKUI_NODE_CUSTOM);
    int32_t length = 0;
    auto result = OH_ArkUI_GetNavStackLength(g_handle, &length);
    napi_value retValue;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value GetNavDestinationNameByIndexTest_001(napi_env env, napi_callback_info info)
{
     // 获取ArkUI Native Node API接口
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    // 创建指定类型的节点
    auto g_handle = nodeAPI->createNode(ARKUI_NODE_CUSTOM);
    char buffer[50];
    constexpr int32_t SMALL_BUFFER_LEN = 1;
    constexpr int32_t INIT_VAL = -10;
    int32_t resLen = INIT_VAL;
    auto result = OH_ArkUI_GetNavDestinationNameByIndex(g_handle, 0, buffer, SMALL_BUFFER_LEN, &resLen);
    napi_value retValue;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value GetNavDestinationNameByIndexTest_002(napi_env env, napi_callback_info info)
{
    // 获取ArkUI Native Node API接口
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    // 创建指定类型的节点
    auto g_handle = nodeAPI->createNode(ARKUI_NODE_CUSTOM);
    char buffer[50];
    constexpr int32_t SMALL_BUFFER_LEN = 1;
    constexpr int32_t INIT_VAL = -10;
    int32_t resLen = INIT_VAL;
    auto result = OH_ArkUI_GetNavDestinationNameByIndex(g_handle, NULL, buffer, SMALL_BUFFER_LEN, &resLen);
    napi_value retValue;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value GetNavDestinationNameByIndexTest_003(napi_env env, napi_callback_info info)
{
     // 获取ArkUI Native Node API接口
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    // 创建指定类型的节点
    auto g_handle = nodeAPI->createNode(ARKUI_NODE_CUSTOM);
    char buffer[50];
    constexpr int32_t SMALL_BUFFER_LEN = 1;
    constexpr int32_t INIT_VAL = -10;
    int32_t resLen = INIT_VAL;
    auto result = OH_ArkUI_GetNavDestinationNameByIndex(g_handle, 0, buffer, SMALL_BUFFER_LEN, &resLen);
    napi_value retValue;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value GetNavDestinationNameByIndexTest_004(napi_env env, napi_callback_info info)
{
    // 获取ArkUI Native Node API接口
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    // 创建指定类型的节点
    auto g_handle = nodeAPI->createNode(ARKUI_NODE_CUSTOM);
    char buffer[50];
    constexpr int32_t SMALL_BUFFER_LEN = 1;
    constexpr int32_t INIT_VAL = -10;
    int32_t resLen = INIT_VAL;
    auto result = OH_ArkUI_GetNavDestinationNameByIndex(g_handle, 0, buffer, SMALL_BUFFER_LEN, &resLen);
    napi_value retValue;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value GetNavDestinationNameByIndexTest_005(napi_env env, napi_callback_info info)
{
    ArkUI_NodeHandle g_handle = nullptr;
    char buffer[50];
    constexpr int32_t SMALL_BUFFER_LEN = 1;
    constexpr int32_t INIT_VAL = -10;
    int32_t resLen = INIT_VAL;
    auto result = OH_ArkUI_GetNavDestinationNameByIndex(g_handle, 0, buffer, SMALL_BUFFER_LEN, &resLen);
    napi_value retValue;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value GetNavDestinationNameByIndexTest_006(napi_env env, napi_callback_info info)
{
    // 获取ArkUI Native Node API接口
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    // 创建指定类型的节点
    auto g_handle = nodeAPI->createNode(ARKUI_NODE_CUSTOM);
    char buffer[50];
    constexpr int32_t SMALL_BUFFER_LEN = 1;
    constexpr int32_t INIT_VAL = -10;
    int32_t resLen = INIT_VAL;
    auto result = OH_ArkUI_GetNavDestinationNameByIndex(g_handle, 0, NULL, SMALL_BUFFER_LEN, &resLen);
    napi_value retValue;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value GetNavDestinationNameByIndexTest_007(napi_env env, napi_callback_info info)
{
    // 获取ArkUI Native Node API接口
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    // 创建指定类型的节点
    auto g_handle = nodeAPI->createNode(ARKUI_NODE_CUSTOM);
    char buffer[50];
    constexpr int32_t SMALL_BUFFER_LEN = 1;
    auto result = OH_ArkUI_GetNavDestinationNameByIndex(g_handle, 0, buffer, SMALL_BUFFER_LEN, nullptr);
    napi_value retValue;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value GetNavDestinationIdTest_001(napi_env env, napi_callback_info info)
{
     // 获取ArkUI Native Node API接口
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    // 创建指定类型的节点
    auto g_handle = nodeAPI->createNode(ARKUI_NODE_CUSTOM);
    char buffer[50];
    constexpr int32_t SMALL_BUFFER_LEN = 1;
    constexpr int32_t INIT_VAL = -10;
    int32_t resLen = INIT_VAL;
    auto result = OH_ArkUI_GetNavDestinationId(g_handle, buffer, SMALL_BUFFER_LEN, &resLen);
    napi_value retValue;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value GetNavDestinationIdTest_002(napi_env env, napi_callback_info info)
{
    // 获取ArkUI Native Node API接口
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    // 创建指定类型的节点
    auto g_handle = nodeAPI->createNode(ARKUI_NODE_CUSTOM);
    char buffer[50];
    constexpr int32_t SMALL_BUFFER_LEN = 1;
    constexpr int32_t INIT_VAL = -10;
    int32_t resLen = INIT_VAL;
    auto result = OH_ArkUI_GetNavDestinationId(g_handle, buffer, SMALL_BUFFER_LEN, &resLen);
    napi_value retValue;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value GetNavDestinationIdTest_003(napi_env env, napi_callback_info info)
{
     // 获取ArkUI Native Node API接口
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    // 创建指定类型的节点
    auto g_handle = nodeAPI->createNode(ARKUI_NODE_CUSTOM);
    char buffer[50];
    constexpr int32_t SMALL_BUFFER_LEN = 1;
    constexpr int32_t INIT_VAL = -10;
    int32_t resLen = INIT_VAL;
    auto result = OH_ArkUI_GetNavDestinationId(g_handle, buffer, SMALL_BUFFER_LEN, &resLen);
    napi_value retValue;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value GetNavDestinationIdTest_004(napi_env env, napi_callback_info info)
{
    // 获取ArkUI Native Node API接口
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    // 创建指定类型的节点
    ArkUI_NodeHandle g_handle = nullptr;
    char buffer[50];
    constexpr int32_t SMALL_BUFFER_LEN = 1;
    constexpr int32_t INIT_VAL = 0;
    int32_t resLen = INIT_VAL;
    auto result = OH_ArkUI_GetNavDestinationId(g_handle, buffer, SMALL_BUFFER_LEN, &resLen);
    napi_value retValue;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value GetNavDestinationIdTest_005(napi_env env, napi_callback_info info)
{
     // 获取ArkUI Native Node API接口
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    // 创建指定类型的节点
    auto g_handle = nodeAPI->createNode(ARKUI_NODE_CUSTOM);
    char buffer[50];
    constexpr int32_t SMALL_BUFFER_LEN = 1;
    constexpr int32_t INIT_VAL = 0;
    int32_t resLen = INIT_VAL;
    auto result = OH_ArkUI_GetNavDestinationId(g_handle, NULL, SMALL_BUFFER_LEN, &resLen);
    napi_value retValue;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value GetNavDestinationIdTest_006(napi_env env, napi_callback_info info)
{
     // 获取ArkUI Native Node API接口
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    // 创建指定类型的节点
    auto g_handle = nodeAPI->createNode(ARKUI_NODE_CUSTOM);
    char buffer[50];
    constexpr int32_t SMALL_BUFFER_LEN = 1;
    auto result = OH_ArkUI_GetNavDestinationId(g_handle, buffer, SMALL_BUFFER_LEN, nullptr);
    napi_value retValue;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value GetNavDestinationStateTest_001(napi_env env, napi_callback_info info)
{
     // 获取ArkUI Native Node API接口
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    // 创建指定类型的节点
    auto g_handle = nodeAPI->createNode(ARKUI_NODE_CUSTOM);
    ArkUI_NavDestinationState state;
    auto result = OH_ArkUI_GetNavDestinationState(g_handle, &state);
    napi_value retValue;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value GetNavDestinationStateTest_002(napi_env env, napi_callback_info info)
{
     // 获取ArkUI Native Node API接口
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    // 创建指定类型的节点
    auto g_handle = nodeAPI->createNode(ARKUI_NODE_CUSTOM);
    auto result = OH_ArkUI_GetNavDestinationState(g_handle, nullptr);
    napi_value retValue;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value GetNavDestinationStateTest_003(napi_env env, napi_callback_info info)
{
     // 获取ArkUI Native Node API接口
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    // 创建指定类型的节点
    ArkUI_NodeHandle g_handle = nullptr;
    ArkUI_NavDestinationState state;
    auto result = OH_ArkUI_GetNavDestinationState(g_handle, &state);
    napi_value retValue;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value GetNavDestinationStateTest_004(napi_env env, napi_callback_info info)
{
     // 获取ArkUI Native Node API接口
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    // 创建指定类型的节点
    auto g_handle = nodeAPI->createNode(ARKUI_NODE_CUSTOM);
    ArkUI_NavDestinationState state;
    auto result = OH_ArkUI_GetNavDestinationState(g_handle, &state);
    napi_value retValue;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value GetNavDestinationIndexTest_001(napi_env env, napi_callback_info info)
{
     // 获取ArkUI Native Node API接口
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    // 创建指定类型的节点
    auto g_handle = nodeAPI->createNode(ARKUI_NODE_CUSTOM);
    int32_t index = 1;
    auto result = OH_ArkUI_GetNavDestinationIndex(g_handle, &index);
    napi_value retValue;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value GetNavDestinationIndexTest_002(napi_env env, napi_callback_info info)
{
     // 获取ArkUI Native Node API接口
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    // 创建指定类型的节点
    auto g_handle = nodeAPI->createNode(ARKUI_NODE_CUSTOM);
    auto result = OH_ArkUI_GetNavDestinationIndex(g_handle, nullptr);
    napi_value retValue;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value GetNavDestinationIndexTest_003(napi_env env, napi_callback_info info)
{
     // 获取ArkUI Native Node API接口
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    // 创建指定类型的节点
    ArkUI_NodeHandle g_handle = nullptr;
    int32_t index = 1;
    auto result = OH_ArkUI_GetNavDestinationIndex(g_handle, &index);
    napi_value retValue;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value GetNavDestinationIndexTest_004(napi_env env, napi_callback_info info)
{
     // 获取ArkUI Native Node API接口
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    // 创建指定类型的节点
    auto g_handle = nodeAPI->createNode(ARKUI_NODE_CUSTOM);
    int32_t index = 1;
    auto result = OH_ArkUI_GetNavDestinationIndex(g_handle, &index);
    napi_value retValue;
    napi_create_int32(env, result, &retValue);
    return retValue;
}

}
