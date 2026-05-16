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
#include "arkui/native_node_napi.h"
#include <cstdint>

namespace NodeNapiTest {
napi_value GetNapiEnv(napi_env env, napi_callback_info info)
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
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    OH_ArkUI_NodeContent_AddNode(nodeContentHandle, column);
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

napi_value InitModuleForArkTSEnvTest_001(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    int result = OH_ArkUI_InitModuleForArkTSEnv(env);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value InitModuleForArkTSEnvTest_002(napi_env env, napi_callback_info info)
{
    napi_env newEnv2 = nullptr;
    napi_value retValue;
    auto result = OH_ArkUI_InitModuleForArkTSEnv(newEnv2);
    napi_create_int32(env, result == ARKUI_ERROR_CODE_PARAM_INVALID ? 0 : 1, &retValue);
    return retValue;
}

napi_value NotifyArkTSEnvDestroyTest_001(napi_env env, napi_callback_info info)
{
    napi_env newEnv2 = nullptr;
    napi_value retValue;
    OH_ArkUI_InitModuleForArkTSEnv(newEnv2);
    OH_ArkUI_NotifyArkTSEnvDestroy(newEnv2);
    int32_t result = 0;
    napi_create_int32(env, result == ARKUI_ERROR_CODE_NO_ERROR ? 0 : 1, &retValue);
    return retValue;
}

}