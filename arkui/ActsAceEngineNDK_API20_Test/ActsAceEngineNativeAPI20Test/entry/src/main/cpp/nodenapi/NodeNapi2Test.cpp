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

napi_value CreateNodeContent(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(
        LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "HybirdGetNodeHandleTest", "HybirdGetNodeHandleTest CreateNativeNode");
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "HybirdGetNodeHandleTest", "GetContext env or info is null");
        return nullptr;
    }
    size_t argc = 3;
    napi_value args[3] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = 64;
    size_t strLength = 0;
    char xComponentID[64] = { 0 };
    napi_get_value_string_utf8(env, args[0], xComponentID, length, &strLength);
  
     // 获取NodeContent
    ArkUI_NodeContentHandle contentHandle;
    g_nodenapiresult3 = OH_ArkUI_GetNodeContentFromNapiValue(env, args[0], &contentHandle) == ARKUI_ERROR_CODE_NO_ERROR;
    
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}

napi_value GetNodeContentFromNapiValueTest_001(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    napi_create_int32(env, g_nodenapiresult3 ? 0 : 1, &retValue);
    return retValue;
}

napi_value GetNodeContentFromNapiValueTest_002(napi_env env, napi_callback_info info)
{
    napi_value args = nullptr;
    ArkUI_NodeContentHandle context = nullptr;
    auto ret = OH_ArkUI_GetNodeContentFromNapiValue(env, args, &context);
    napi_value retValue;
    napi_create_int32(env, ret == ARKUI_ERROR_CODE_PARAM_INVALID ? 0 : 1, &retValue);
    return retValue;
}

}
