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

#include "DisplayManagerTest.h"
#include <ace/xcomponent/native_interface_xcomponent.h>
#include <window_manager/oh_display_info.h>
#include <window_manager/oh_display_manager.h>
#include <js_native_api_types.h>
#include "common/Common.h"
#include "napi/native_api.h"
#include <arkui/native_node.h>
#include <hilog/log.h>
namespace DisplayManager {

ArkUI_NativeNodeAPI_1* InitArkUI(napi_env env, napi_callback_info info)
{
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "NAPI_CHECK_PARAMS", "GetContext env or info is");
        return nullptr;
    }
    return reinterpret_cast<ArkUI_NativeNodeAPI_1*>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
}

void AiAnalysisFinish(ArkUI_NodeHandle node,
                      ArkUI_XComponent_ImageAnalyzerState statusCode,
                      void *userData = nullptr)
{
    if (statusCode == ARKUI_XCOMPONENT_AI_ANALYSIS_FINISHED) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "AiAnalysisFinish", "ARKUI_XCOMPONENT_AI_ANALYSIS_FINISHED");
    }
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "StartImageAnalyzer_func", "StartImageAnalyzer_func");
    return;
}

napi_value ArkuiAiAnalysisFinish(napi_env env, napi_callback_info info)
{
    napi_value result;
    char data[12] = "user data";
    auto nodeAPI = InitArkUI(env, info);
    if (!nodeAPI) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    auto customSpan = nodeAPI->createNode(ARKUI_NODE_CUSTOM_SPAN);
    auto nodeHandle = nodeAPI->createNode(ARKUI_NODE_XCOMPONENT);
    auto ret = OH_ArkUI_XComponent_StartImageAnalyzer(nodeHandle, data, AiAnalysisFinish);
    napi_create_int32(env, ret == ARKUI_ERROR_CODE_NO_ERROR ? 0 : -1, &result);
    return result;
}

void AiAnalysisDisabled(ArkUI_NodeHandle node, ArkUI_XComponent_ImageAnalyzerState statusCode, void* userData)
{
    statusCode = ARKUI_XCOMPONENT_AI_ANALYSIS_DISABLED;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "StartImageAnalyzer_func", "StartImageAnalyzer_func");
    return;
}

napi_value ArkuiAiAnalysisDisabled(napi_env env, napi_callback_info info)
{
    napi_value result;
    char data[12] = "user data";
    auto nodeAPI = InitArkUI(env, info);
    if (!nodeAPI) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    auto customSpan = nodeAPI->createNode(ARKUI_NODE_CUSTOM_SPAN);
    auto nodeHandle = nodeAPI->createNode(ARKUI_NODE_XCOMPONENT);
    auto ret = OH_ArkUI_XComponent_StartImageAnalyzer(nodeHandle, data, AiAnalysisDisabled);
    napi_create_int32(env, ret == ARKUI_ERROR_CODE_NO_ERROR ? 0 : -1, &result);
    return result;
}

void AiAnalysisUnsupported(ArkUI_NodeHandle node, ArkUI_XComponent_ImageAnalyzerState statusCode, void* userData)
{
    statusCode = ARKUI_XCOMPONENT_AI_ANALYSIS_UNSUPPORTED;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "StartImageAnalyzer_func", "StartImageAnalyzer_func");
    return;
}

napi_value ArkuiAiAnalysisUnsupported(napi_env env, napi_callback_info info)
{
    napi_value result;
    char data[12] = "user data";
    auto nodeAPI = InitArkUI(env, info);
    if (!nodeAPI) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    auto customSpan = nodeAPI->createNode(ARKUI_NODE_CUSTOM_SPAN);
    auto nodeHandle = nodeAPI->createNode(ARKUI_NODE_XCOMPONENT);
    auto ret = OH_ArkUI_XComponent_StartImageAnalyzer(nodeHandle, data, AiAnalysisUnsupported);
    napi_create_int32(env, ret == ARKUI_ERROR_CODE_NO_ERROR ? 0 : -1, &result);
    return result;
}

void AiAnalysisOngoing(ArkUI_NodeHandle node, ArkUI_XComponent_ImageAnalyzerState statusCode, void* userData)
{
    statusCode = ARKUI_XCOMPONENT_AI_ANALYSIS_ONGOING;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "StartImageAnalyzer_func", "StartImageAnalyzer_func");
    return;
}

napi_value ArkuiAiAnalysisOngoing(napi_env env, napi_callback_info info)
{
    napi_value result;
    char data[12] = "user data";
    auto nodeAPI = InitArkUI(env, info);
    if (!nodeAPI) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    auto customSpan = nodeAPI->createNode(ARKUI_NODE_CUSTOM_SPAN);
    auto nodeHandle = nodeAPI->createNode(ARKUI_NODE_XCOMPONENT);
    auto ret = OH_ArkUI_XComponent_StartImageAnalyzer(nodeHandle, data, AiAnalysisOngoing);
    napi_create_int32(env, ret == ARKUI_ERROR_CODE_NO_ERROR ? 0 : -1, &result);
    return result;
}

void AiAnalysisStopped(ArkUI_NodeHandle node, ArkUI_XComponent_ImageAnalyzerState statusCode, void* userData)
{
    statusCode = ARKUI_XCOMPONENT_AI_ANALYSIS_STOPPED;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "StartImageAnalyzer_func", "StartImageAnalyzer_func");
    return;
}

napi_value ArkuiAiAnalysisStopped(napi_env env, napi_callback_info info)
{
    napi_value result;
    char data[12] = "user data";
    auto nodeAPI = InitArkUI(env, info);
    if (!nodeAPI) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    auto customSpan = nodeAPI->createNode(ARKUI_NODE_CUSTOM_SPAN);
    auto nodeHandle = nodeAPI->createNode(ARKUI_NODE_XCOMPONENT);
    auto ret = OH_ArkUI_XComponent_StartImageAnalyzer(nodeHandle, data, AiAnalysisStopped);
    napi_create_int32(env, ret == ARKUI_ERROR_CODE_NO_ERROR ? 0 : -1, &result);
    return result;
}

using ArkUI_ContextHandle = ArkUI_Context*;
napi_value ArkuiNodeUndefined(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t ret =
        OH_ArkUI_SetForceDarkConfig(nullptr, true, ARKUI_NODE_UNDEFINED, [](uint32_t color) { return color; });
    napi_create_int32(env, ret == ARKUI_ERROR_CODE_NO_ERROR ? 0 : -1, &result);
    return result;
}
}
