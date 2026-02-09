/**
 * * Copyright (c) 2024 Huawei Device Co., Ltd.
 * * Licensed under the Apache License, Version 2.0 (the "License");
 * * you may not use this file except in compliance with the License.
 * * You may obtain a copy of the License at
 * *
 * *
 * http://www.apache.org/licenses/LICENSE-2.0
 * *
 * * Unless required by applicable law or agreed to in writing, software
 * * distributed under the License is distributed on an "AS IS" BASIS,
 * * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * * See the License for the specific language governing permissions and
 * * limitations under the License.
 * */

#include "hilog/log.h"
#include "napi/native_api.h"
#include "rawfile_request.h"
#include "rawfile/raw_file_manager.h"
#include "web/arkweb_scheme_handler.h"
#include "web/arkweb_net_error_list.h"
#include "web/arkweb_interface.h"
#include <bits/alltypes.h>

#undef LOG_TAG
#define LOG_TAG "ss-handler"

ArkWeb_SchemeHandler *g_schemeHandler;
ArkWeb_SchemeHandler *g_schemeHandlerForSW;
NativeResourceManager *g_resourceManager;

bool testIsEof;
bool testIsInMemory;
bool testIsChunked;
bool g_testIsMainFrame;
bool g_testIsInMemoryTrue;
uint64_t testHttpBodyStreamGetPosition = 0;
uint64_t testHttpBodyStreamGetSize = -1;
int32_t testHttpBodyStreamSetReadCallBack = -1;
int32_t testHttpBodyStreamSetUserData = -1;
int32_t testHttpBodyStreamInit = -1;
int32_t testResourceHandlerDestroy = -1;
int32_t testResourceHandlerDidReceiveResponse = -1;
int32_t testResourceHandlerDidReceiveData = -1;
int32_t testResourceHandlerDidFinish = -1;
int32_t testResourceHandlerDidFailWithError = -1;

// 注册三方协议的配置，需要在Web内核初始化之前调用，否则会注册失败。
static napi_value RegisterCustomSchemes(napi_env env, napi_callback_info info) {
    OH_LOG_INFO(LOG_APP, "register custom schemes");
    // 接口覆盖1 OH_ArkWeb_RegisterCustomSchemes
    OH_ArkWeb_RegisterCustomSchemes("custom", ARKWEB_SCHEME_OPTION_DISPLAY_ISOLATED | ARKWEB_SCHEME_OPTION_FETCH_ENABLED | ARKWEB_SCHEME_OPTION_CORS_ENABLED | ARKWEB_SCHEME_OPTION_CSP_BYPASSING);

    return nullptr;
}
// 请求开始的回调，在该函数中我们创建一个RawfileRequest来实现对Web内核请求的拦截。
void OnURLRequestStart(const ArkWeb_SchemeHandler *schemeHandler, ArkWeb_ResourceRequest *resourceRequest,
                       const ArkWeb_ResourceHandler *resourceHandler, bool *intercept) {
    *intercept = true;
    char *url;
    OH_ArkWebResourceRequest_GetUrl(resourceRequest, &url);
    OH_LOG_INFO(LOG_APP, "OnURLRequestStart schemeHandler url %{public}s", url);
    OH_LOG_INFO(LOG_APP, "OnURLRequestStart OH_ArkWebResourceRequest_IsMainFrame %{public}d",
        OH_ArkWebResourceRequest_IsMainFrame(resourceRequest));
    if (OH_ArkWebResourceRequest_IsMainFrame(resourceRequest)) {
        g_testIsMainFrame = OH_ArkWebResourceRequest_IsMainFrame(resourceRequest);
    }

    RawfileRequest *request = new RawfileRequest(resourceRequest, resourceHandler, g_resourceManager);

    OH_ArkWebResourceRequest_SetUserData(resourceRequest, request);
    request->Start();

    testResourceHandlerDidFailWithError = request->resourceHandlerDidFailWithError();
    OH_LOG_ERROR(LOG_APP, "rawfileRequest->resourceHandlerDidFailWithError(). %{public}d",
                 testResourceHandlerDidFailWithError);

    // 接口覆盖6 OH_ArkWebSchemeHandler_GetUserData
    OH_ArkWebSchemeHandler_GetUserData(schemeHandler);
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
    OH_LOG_ERROR(LOG_APP, "rawfileRequest->httpBodyStreamIsEof(). %{public}d", testIsEof);
    OH_LOG_ERROR(LOG_APP, "rawfileRequest->httpBodyStreamIsChunked(). %{public}d", testIsChunked);
    OH_LOG_ERROR(LOG_APP, "rawfileRequest->httpBodyStreamIsInMemory(). %{public}d", testIsInMemory);

    testIsEof = rawfileRequest->httpBodyStreamIsEof();
    testIsChunked = rawfileRequest->httpBodyStreamIsChunked();
    testIsInMemory = rawfileRequest->httpBodyStreamIsInMemory();
    g_testIsInMemoryTrue = rawfileRequest->HttpBodyStreamIsInMemoryTrue();
    testHttpBodyStreamGetPosition = rawfileRequest->httpBodyStreamGetPosition();
    testHttpBodyStreamGetSize = rawfileRequest->httpBodyStreamGetSize();
    testHttpBodyStreamSetReadCallBack = rawfileRequest->httpBodyStreamSetReadCallback();
    testHttpBodyStreamSetUserData = rawfileRequest->httpBodyStreamSetUserData();
    testHttpBodyStreamInit = rawfileRequest->httpBodyStreamInit();
    testResourceHandlerDestroy = rawfileRequest->resourceHandlerDestroy();
    testResourceHandlerDidReceiveResponse = rawfileRequest->resourceHandlerDidReceiveResponse();
    testResourceHandlerDidReceiveData = rawfileRequest->resourceHandlerDidReceiveData();
    testResourceHandlerDidFinish = rawfileRequest->resourceHandlerDidFinish();
    OH_LOG_ERROR(LOG_APP, "rawfileRequest->httpBodyStreamIsEof(). %{public}d", testIsEof);
    OH_LOG_ERROR(LOG_APP, "rawfileRequest->httpBodyStreamIsChunked(). %{public}d", testIsChunked);
    OH_LOG_ERROR(LOG_APP, "rawfileRequest->httpBodyStreamIsInMemory(). %{public}d", testIsInMemory);
    OH_LOG_ERROR(LOG_APP, "rawfileRequest->httpBodyStreamGetPosition(). %{public}lu", testHttpBodyStreamGetPosition);
    OH_LOG_ERROR(LOG_APP, "rawfileRequest->httpBodyStreamGetSize(). %{public}lu", testHttpBodyStreamGetSize);
    OH_LOG_ERROR(LOG_APP, "rawfileRequest->httpBodyStreamSetReadCallback(). %{public}d", testHttpBodyStreamSetReadCallBack);
    OH_LOG_ERROR(LOG_APP, "rawfileRequest->httpBodyStreamSetUserData(). %{public}d", testHttpBodyStreamSetUserData);
    OH_LOG_ERROR(LOG_APP, "rawfileRequest->httpBodyStreamInit(). %{public}d", testHttpBodyStreamInit);
    OH_LOG_ERROR(LOG_APP, "rawfileRequest->resourceHandlerDestroy(). %{public}d", testResourceHandlerDestroy);
    OH_LOG_ERROR(LOG_APP, "rawfileRequest->resourceHandlerDidReceiveResponse(). %{public}d", testResourceHandlerDidReceiveResponse);
    OH_LOG_ERROR(LOG_APP, "rawfileRequest->resourceHandlerDidReceiveData(). %{public}d", testResourceHandlerDidReceiveData);
    OH_LOG_ERROR(LOG_APP, "rawfileRequest->resourceHandlerDidFinish(). %{public}d", testResourceHandlerDidFinish);
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
    OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandlerForSW, OnURLRequestStartForSW);
    OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandlerForSW, OnURLRequestStopForSW);
    // 接口覆盖2 OH_ArkWeb_SetSchemeHandler
    OH_ArkWeb_SetSchemeHandler("custom", "scheme-handler", g_schemeHandler);
    OH_ArkWeb_SetSchemeHandler("https", "scheme-handler", g_schemeHandler);
    // 接口覆盖3 OH_ArkWebServiceWorker_SetSchemeHandler
    OH_ArkWebServiceWorker_SetSchemeHandler("custom", g_schemeHandlerForSW);
    OH_ArkWebServiceWorker_SetSchemeHandler("https", g_schemeHandlerForSW);
    return nullptr;
}
static napi_value InitResourceManager(napi_env env, napi_callback_info info) {
    size_t argc = 2;
    napi_value argv[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    g_resourceManager = OH_ResourceManager_InitNativeResourceManager(env, argv[0]);
    return nullptr;
}
static napi_value HttpBodyStreamIsEof(napi_env env, napi_callback_info info) {
    napi_value result;
    if (testIsEof) {
        napi_create_int32(env, 0, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}
static napi_value HttpBodyStreamIsInMemory(napi_env env, napi_callback_info info) {
    napi_value result;
    if (!testIsInMemory) {
        napi_create_int32(env, 0, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

static napi_value HttpBodyStreamIsChunked(napi_env env, napi_callback_info info) {
    napi_value result;
    OH_LOG_ERROR(LOG_APP, "HttpBodyStreamIsChunked. testIsChunked %{public}d", testIsChunked);
    OH_LOG_ERROR(LOG_APP, "HttpBodyStreamIsChunked. !testIsChunked %{public}d", !testIsChunked);
    if (testIsChunked) {
        napi_create_int32(env, 0, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

static napi_value HttpBodyStreamGetPosition(napi_env env, napi_callback_info info) {
    napi_value result;
    OH_LOG_ERROR(LOG_APP, "HttpBodyStreamGetPosition %{public}lu", testHttpBodyStreamGetPosition);
    if (testHttpBodyStreamGetPosition != 0) {
        napi_create_int32(env, 0, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

static napi_value HttpBodyStreamGetSize(napi_env env, napi_callback_info info) {
    napi_value result;
    OH_LOG_ERROR(LOG_APP, "HttpBodyStreamGetSize %{public}lu", testHttpBodyStreamGetSize);
    if (testHttpBodyStreamGetSize == 0) {
        napi_create_int32(env, 0, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

static napi_value HttpBodyStreamSetReadCallBack(napi_env env, napi_callback_info info) {
    napi_value result;
    OH_LOG_ERROR(LOG_APP, "HttpBodyStreamSetReadCallBack %{public}d", testHttpBodyStreamSetUserData);
    if (testHttpBodyStreamSetReadCallBack == 0) {
        napi_create_int32(env, 0, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

static napi_value HttpBodyStreamSetUserData(napi_env env, napi_callback_info info) {
    napi_value result;
    OH_LOG_ERROR(LOG_APP, "HttpBodyStreamSetUserData %{public}d", testHttpBodyStreamSetUserData);
    if (testHttpBodyStreamSetUserData == 0) {
        napi_create_int32(env, 0, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

static napi_value HttpBodyStreamInit(napi_env env, napi_callback_info info) {
    napi_value result;
    OH_LOG_ERROR(LOG_APP, "testHttpBodyStreamSetUserData %{public}d", testHttpBodyStreamInit);
    if (testHttpBodyStreamInit == 0) {
        napi_create_int32(env, 0, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

static napi_value ResourceHandlerDestroy(napi_env env, napi_callback_info info) {
    napi_value result;
    OH_LOG_ERROR(LOG_APP, "ResourceHandlerDestroy %{public}d", testResourceHandlerDestroy);

    if (testResourceHandlerDestroy == 0) {
        napi_create_int32(env, 0, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

static napi_value ResourceHandlerDidReceiveResponse(napi_env env, napi_callback_info info) {
    napi_value result;
    OH_LOG_ERROR(LOG_APP, "ResourceHandlerDidReceiveResponse %{public}d", testResourceHandlerDidReceiveResponse);

    if (testResourceHandlerDidReceiveResponse == 0) {
        napi_create_int32(env, 0, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }

    return result;
}

static napi_value ResourceHandlerDidReceiveData(napi_env env, napi_callback_info info) {
    napi_value result;
    OH_LOG_ERROR(LOG_APP, "ResourceHandlerDidReceiveData %{public}d", testResourceHandlerDidReceiveData);
    if (testResourceHandlerDidReceiveData == 0) {
        napi_create_int32(env, 0, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

static napi_value ResourceHandlerDidFinish(napi_env env, napi_callback_info info) {
    napi_value result;
    OH_LOG_ERROR(LOG_APP, "ResourceHandlerDidFinish %{public}d", testResourceHandlerDidFinish);
    if (testResourceHandlerDidFinish == 0) {
        napi_create_int32(env, 0, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
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

static napi_value ReleaseByteArray(napi_env env, napi_callback_info info) {
    napi_value result;
    OH_LOG_ERROR(LOG_APP, "ReleaseByteArray ");
    uint8_t *buffer = new uint8_t[1024];
    OH_ArkWeb_ReleaseByteArray(buffer);
    napi_create_int32(env, 0, &result);
    return result;
}

napi_value ArkWebGetNativeApiReturnNullptr(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_LOG_ERROR(LOG_APP, "ArkWebGetNativeApiReturnNullptr start ");
    ArkWeb_NativeAPIVariantKind type;
    ArkWeb_AnyNativeAPI* api = OH_ArkWeb_GetNativeAPI(type);
    OH_LOG_ERROR(LOG_APP, "OH_ArkWeb_GetNativeAPI success ");
    if (api == nullptr) {
        OH_LOG_ERROR(LOG_APP, "OH_ArkWeb_GetNativeAPI return null");
        napi_create_int32(env, 0, &result);
    } else {
        napi_create_int32(env, 1, &result);
    }
    return result;
}

napi_value ArkWebHttpBodyStreamGetUserDataReturnNullptr(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_LOG_ERROR(LOG_APP, "ArkWebHttpBodyStreamGetUserDataReturnNullptr start ");
    int *getUserData = static_cast<int *>(OH_ArkWebHttpBodyStream_GetUserData(nullptr));
    if (getUserData == nullptr) {
        OH_LOG_ERROR(LOG_APP, "OH_ArkWebHttpBodyStream_GetUserData return null");
        napi_create_int32(env, 0, &result);
    } else {
        napi_create_int32(env, 1, &result);
    }
    return result;
}

napi_value ArkWebResourceRequestGetUserDataReturnNullptr(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_LOG_ERROR(LOG_APP, "ArkWebResourceRequestGetUserDataReturnNullptr start ");
    int *getUserData = static_cast<int *>(OH_ArkWebResourceRequest_GetUserData(nullptr));
    if (getUserData == nullptr) {
        OH_LOG_ERROR(LOG_APP, "OH_ArkWebResourceRequest_GetUserData return null");
        napi_create_int32(env, 0, &result);
    } else {
        napi_create_int32(env, 1, &result);
    }
    return result;
}

napi_value ArkWebSchemeHandlerGetUserDataReturnNullptr(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_LOG_ERROR(LOG_APP, "ArkWebSchemeHandlerGetUserDataReturnNullptr start ");
    int *getUserData = static_cast<int *>(OH_ArkWebSchemeHandler_GetUserData(nullptr));
    if (getUserData == nullptr) {
        OH_LOG_ERROR(LOG_APP, "OH_ArkWebSchemeHandler_GetUserData return null");
        napi_create_int32(env, 0, &result);
    } else {
        napi_create_int32(env, 1, &result);
    }
    return result;
}

napi_value ArkWebSetSchemeHandlerReturnTrue(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_LOG_ERROR(LOG_APP, "ArkWebSetSchemeHandlerReturnTrue start ");
    bool ret = OH_ArkWeb_SetSchemeHandler("myScheme", "xts-handler", g_schemeHandler);
    if (ret) {
        napi_create_int32(env, 1, &result);
    } else {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value ArkWebSetSchemeHandlerReturnFalse(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_LOG_ERROR(LOG_APP, "ArkWebSetSchemeHandlerReturnFalse start ");
    bool ret = OH_ArkWeb_SetSchemeHandler("myScheme", "xts-handler", nullptr);
    if (ret) {
        napi_create_int32(env, 1, &result);
    } else {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value ArkWebServiceWorkerSetSchemeHandlerReturnTrue(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_LOG_ERROR(LOG_APP, "ArkWebServiceWorkerSetSchemeHandlerReturnTrue start ");
    bool ret = OH_ArkWebServiceWorker_SetSchemeHandler("myScheme", g_schemeHandlerForSW);
    if (ret) {
        napi_create_int32(env, 1, &result);
    } else {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value ArkWebServiceWorkerSetSchemeHandlerReturnFalse(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_LOG_ERROR(LOG_APP, "ArkWebServiceWorkerSetSchemeHandlerReturnFalse start ");
    bool ret = OH_ArkWebServiceWorker_SetSchemeHandler(nullptr, g_schemeHandlerForSW);
    if (ret) {
        napi_create_int32(env, 1, &result);
    } else {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value ArkWebResourceRequestIsMainFrameReturnTrue(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_LOG_ERROR(LOG_APP, "ArkWebResourceRequestIsMainFrameReturnTrue start ");
    if (g_testIsMainFrame) {
        napi_create_int32(env, 1, &result);
    } else {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

napi_value ArkWebHttpBodyStreamIsInMemoryTrue(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_LOG_ERROR(LOG_APP, "ArkWebHttpBodyStreamIsInMemoryTrue start ");
    if (g_testIsInMemoryTrue) {
        napi_create_int32(env, 1, &result);
    } else {
        napi_create_int32(env, 0, &result);
    }
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports) {
    napi_property_descriptor desc[] = {
        {"setSchemeHandler", nullptr, SetSchemeHandler, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"initResourceManager", nullptr, InitResourceManager, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"registerCustomSchemes", nullptr, RegisterCustomSchemes, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"httpBodyStreamIsEof", nullptr, HttpBodyStreamIsEof, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"httpBodyStreamIsInMemory", nullptr, HttpBodyStreamIsInMemory, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"httpBodyStreamIsChunked", nullptr, HttpBodyStreamIsChunked, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"httpBodyStreamGetPosition", nullptr, HttpBodyStreamGetPosition, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"httpBodyStreamGetSize", nullptr, HttpBodyStreamGetSize, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"httpBodyStreamSetReadCallBack", nullptr, HttpBodyStreamSetReadCallBack, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"httpBodyStreamSetUserData", nullptr, HttpBodyStreamSetUserData, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"httpBodyStreamInit", nullptr, HttpBodyStreamInit, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"resourceHandlerDestroy", nullptr, ResourceHandlerDestroy, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"resourceHandlerDidReceiveResponse", nullptr, ResourceHandlerDidReceiveResponse, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"resourceHandlerDidReceiveData", nullptr, ResourceHandlerDidReceiveData, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"resourceHandlerDidFinish", nullptr, ResourceHandlerDidFinish, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"resourceHandlerDidFailWithError", nullptr, ResourceHandlerDidFailWithError, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"releaseByteArray", nullptr, ReleaseByteArray, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"arkWebGetNativeApiReturnNullptr", nullptr, ArkWebGetNativeApiReturnNullptr, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"arkWebHttpBodyStreamGetUserDataReturnNullptr", nullptr, ArkWebHttpBodyStreamGetUserDataReturnNullptr, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"arkWebResourceRequestGetUserDataReturnNullptr", nullptr, ArkWebResourceRequestGetUserDataReturnNullptr,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"arkWebSchemeHandlerGetUserDataReturnNullptr", nullptr, ArkWebSchemeHandlerGetUserDataReturnNullptr, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"arkWebSetSchemeHandlerReturnTrue", nullptr, ArkWebSetSchemeHandlerReturnTrue, nullptr, nullptr,
            nullptr, napi_default, nullptr},
        {"arkWebSetSchemeHandlerReturnFalse", nullptr, ArkWebSetSchemeHandlerReturnFalse, nullptr, nullptr,
            nullptr, napi_default, nullptr},
        {"arkWebServiceWorkerSetSchemeHandlerReturnTrue", nullptr, ArkWebServiceWorkerSetSchemeHandlerReturnTrue,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"arkWebServiceWorkerSetSchemeHandlerReturnFalse", nullptr, ArkWebServiceWorkerSetSchemeHandlerReturnFalse,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"arkWebResourceRequestIsMainFrameReturnTrue", nullptr, ArkWebResourceRequestIsMainFrameReturnTrue,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"arkWebHttpBodyStreamIsInMemoryTrue", nullptr, ArkWebHttpBodyStreamIsInMemoryTrue,
            nullptr, nullptr, nullptr, napi_default, nullptr},
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