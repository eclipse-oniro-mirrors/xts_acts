/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

#include "hilog/log.h"
#include "napi/native_api.h"
#include "rawfile_request.h"
#include "rawfile/raw_file_manager.h"
#include "web/arkweb_scheme_handler.h"
#include <bits/alltypes.h>

#undef LOG_TAG
#define LOG_TAG "ss-handler"

ArkWeb_SchemeHandler *g_schemeHandler;
ArkWeb_SchemeHandler *g_schemeHandlerForSW;
NativeResourceManager *g_resourceManager;

int32_t testResourceHandlerDidFailWithError = -1;
int32_t result_all = -1;


// 注册三方协议的配置，需要在Web内核初始化之前调用，否则会注册失败。
static napi_value RegisterCustomSchemes(napi_env env, napi_callback_info info) {
    OH_LOG_INFO(LOG_APP, "register custom schemes");
    // 接口覆盖1 OH_ArkWeb_RegisterCustomSchemes
    OH_ArkWeb_RegisterCustomSchemes("custom",  ARKWEB_SCHEME_OPTION_DISPLAY_ISOLATED
    | ARKWEB_SCHEME_OPTION_FETCH_ENABLED | ARKWEB_SCHEME_OPTION_CORS_ENABLED | ARKWEB_SCHEME_OPTION_CSP_BYPASSING);

    return nullptr;
}

// 请求开始的回调，在该函数中我们创建一个RawfileRequest来实现对Web内核请求的拦截。
void OnURLRequestStart(const ArkWeb_SchemeHandler *schemeHandler, ArkWeb_ResourceRequest *resourceRequest,
                       const ArkWeb_ResourceHandler *resourceHandler, bool *intercept) {
    result_all = -1;
    *intercept = true;
    RawfileRequest *request = new RawfileRequest(resourceRequest, resourceHandler, g_resourceManager);

    OH_ArkWebResourceRequest_SetUserData(resourceRequest, request);
    request->Start();

    testResourceHandlerDidFailWithError = request->resourceHandlerDidFailWithError();
    OH_LOG_ERROR(LOG_APP, "rawfileRequest->resourceHandlerDidFailWithError(). %{public}d",
                 testResourceHandlerDidFailWithError);

    // 接口覆盖6 OH_ArkWebSchemeHandler_GetUserData
    OH_ArkWebSchemeHandler_GetUserData(schemeHandler);
    result_all = 1;
}

// 请求结束的回调，在该函数中我们需要标记RawfileRequest已经结束了，内部不应该再使用ResourceHandler。
void OnURLRequestStop(const ArkWeb_SchemeHandler *schemeHandler, const ArkWeb_ResourceRequest *request) {
    if (!request) {
        OH_LOG_ERROR(LOG_APP, "on request stop request is nullptr.");
        return;
    }

    RawfileRequest *rawfileRequest = (RawfileRequest *)OH_ArkWebResourceRequest_GetUserData(request);
    if (rawfileRequest) {
        rawfileRequest->Stop();
    }
    
    // 接口覆盖7 OH_ArkWebSchemeHandler_SetUserData
    OH_ArkWebSchemeHandler_SetUserData(g_schemeHandler, rawfileRequest);

    // 接口覆盖4 OH_ArkWebServiceWorker_ClearSchemeHandlers
    OH_ArkWebServiceWorker_ClearSchemeHandlers();
}

void OnURLRequestStartForSW(const ArkWeb_SchemeHandler *schemeHandler, ArkWeb_ResourceRequest *resourceRequest,
                            const ArkWeb_ResourceHandler *resourceHandler, bool *intercept) {
    *intercept = true;
    RawfileRequest *request = new RawfileRequest(resourceRequest, resourceHandler, g_resourceManager);
    OH_ArkWebResourceRequest_SetUserData(resourceRequest, request);
    request->Start();
}

void OnURLRequestStopForSW(const ArkWeb_SchemeHandler *schemeHandler, const ArkWeb_ResourceRequest *request) {
    if (!request) {
        OH_LOG_ERROR(LOG_APP, "on request stop request is nullptr.");
        return;
    }

    RawfileRequest *rawfileRequest = (RawfileRequest *)OH_ArkWebResourceRequest_GetUserData(request);
    if (rawfileRequest) {
        rawfileRequest->Stop();
    }
}

// 设置SchemeHandler。
static napi_value SetSchemeHandler(napi_env env, napi_callback_info info) {
    OH_LOG_INFO(LOG_APP, "set scheme handler");

    // 接口覆盖5 OH_ArkWeb_CreateSchemeHandler
    OH_ArkWeb_CreateSchemeHandler(&g_schemeHandler);
    OH_ArkWeb_CreateSchemeHandler(&g_schemeHandlerForSW);
    // 接口覆盖8 OH_ArkWebSchemeHandler_SetOnRequestStart
    OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandler, OnURLRequestStart);

    // 接口覆盖9 OH_ArkWebSchemeHandler_SetOnRequestStop
    OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandler, OnURLRequestStop);

    OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandlerForSW, OnURLRequestStart);
    OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandlerForSW, OnURLRequestStop);
    // 接口覆盖2 OH_ArkWeb_SetSchemeHandler
    OH_ArkWeb_SetSchemeHandler("custom", "scheme-handler", g_schemeHandler);
    // 接口覆盖3 OH_ArkWebServiceWorker_SetSchemeHandler
    OH_ArkWebServiceWorker_SetSchemeHandler("custom", g_schemeHandlerForSW);
    return nullptr;
}

static napi_value InitResourceManager(napi_env env, napi_callback_info info) {
    size_t argc = 2;
    napi_value argv[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    g_resourceManager = OH_ResourceManager_InitNativeResourceManager(env, argv[0]);
    return nullptr;
}

static napi_value ResourceHandlerDidFailWithError(napi_env env, napi_callback_info info) {
    napi_value result;
    OH_LOG_ERROR(LOG_APP, "ResourceHandlerDidFailWithError %{public}d", testResourceHandlerDidFailWithError);

    if (testResourceHandlerDidFailWithError == 0) {
        napi_create_int32(env, 0, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

static napi_value GetRequestValue(napi_env env, napi_callback_info info)
{
    napi_value result;
    if (result_all == 1) {
        napi_create_int32(env, 1, &result);
        OH_LOG_INFO(LOG_APP, "yb--> result: 1");
    } else {
        napi_create_int32(env, -1, &result);
        OH_LOG_INFO(LOG_APP, "yb--> result: -1");
    }
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports) {
    napi_property_descriptor desc[] = {
        {"setSchemeHandler", nullptr, SetSchemeHandler, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"initResourceManager", nullptr, InitResourceManager, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"registerCustomSchemes", nullptr, RegisterCustomSchemes, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"resourceHandlerDidFailWithError", nullptr, ResourceHandlerDidFailWithError, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"getRequestValue", nullptr, GetRequestValue, nullptr, nullptr, nullptr, napi_default, nullptr},
    };

    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "entry",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
