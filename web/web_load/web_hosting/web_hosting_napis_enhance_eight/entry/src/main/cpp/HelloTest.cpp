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

#undef LOG_TAG
#define LOG_TAG "ss-handler"

ArkWeb_SchemeHandler *g_schemeHandler;
ArkWeb_SchemeHandler *g_schemeHandlerForSW;
NativeResourceManager *g_resourceManager;

int32_t g_testSetAsyncReadCallback = -1;
int32_t g_testAsyncRead = -1;
int32_t g_testAsyncReadMore = -1;
int32_t g_testAsyncReadCallback = -1;
std::string g_testReadBufferValue = "";
int32_t g_testThreadIdEqual = -1;
int32_t g_testRequestStop = -1;

// 注册三方协议的配置，需要在Web内核初始化之前调用，否则会注册失败。
static napi_value RegisterCustomSchemes(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "register custom schemes");
    OH_ArkWeb_RegisterCustomSchemes("custom", ARKWEB_SCHEME_OPTION_STANDARD | ARKWEB_SCHEME_OPTION_CORS_ENABLED);
    OH_ArkWeb_RegisterCustomSchemes("custom-local", ARKWEB_SCHEME_OPTION_LOCAL);
    OH_ArkWeb_RegisterCustomSchemes("custom-csp-bypassing",
        ARKWEB_SCHEME_OPTION_CSP_BYPASSING | ARKWEB_SCHEME_OPTION_STANDARD);
    OH_ArkWeb_RegisterCustomSchemes("custom-isolated", ARKWEB_SCHEME_OPTION_DISPLAY_ISOLATED);
    return nullptr;
}

// 请求开始的回调，在该函数中我们创建一个RawfileRequest来实现对Web内核请求的拦截。
void OnURLRequestStart(const ArkWeb_SchemeHandler *schemeHandler,
                       ArkWeb_ResourceRequest *resourceRequest,
                       const ArkWeb_ResourceHandler *resourceHandler,
                       bool *intercept)
{
    OH_LOG_INFO(LOG_APP, "OnURLRequestStart schemeHandler");
    *intercept = true;
    g_testRequestStop = -1;
    char *url;
    OH_ArkWebResourceRequest_GetUrl(resourceRequest, &url);
    OH_LOG_INFO(LOG_APP, "OnURLRequestStart schemeHandler url %{public}s", url);
    char *method;
    OH_ArkWebResourceRequest_GetMethod(resourceRequest, &method);
    OH_LOG_INFO(LOG_APP, "OnURLRequestStart schemeHandler method %{public}s", method);

    ArkWeb_RequestHeaderList *headerList;
    OH_ArkWebResourceRequest_GetRequestHeaders(resourceRequest, &headerList);
    OH_LOG_INFO(LOG_APP, "OnURLRequestStart OH_ArkWebResourceRequest_GetRequestHeaders");

    int size = OH_ArkWebRequestHeaderList_GetSize(headerList);
    OH_LOG_INFO(LOG_APP, "OnURLRequestStart OH_ArkWebRequestHeaderList_GetSize header size %{public}d", size);

    for (int i = 0; i < size; i++) {
        char *key;
        char *value;
        OH_ArkWebRequestHeaderList_GetHeader(headerList, i, &key, &value);
        OH_LOG_INFO(LOG_APP,
            "OnURLRequestStart OH_ArkWebRequestHeaderList_GetHeader header key:%{public}s,value:%{public}s",
            key,
            value);
    }

    RawfileRequest* request = new RawfileRequest(resourceRequest, resourceHandler, g_resourceManager);
    OH_ArkWebResourceRequest_SetUserData(resourceRequest, request);
    OH_LOG_INFO(LOG_APP, "OnURLRequestStart OH_ArkWebResourceRequest_SetUserData");
    if (strcmp(url, "https://www.example.com/httpBodyStreamNullptr") == 0) {
        request->httpBodyStreamNullptr_ = true;
    } else {
        request->httpBodyStreamNullptr_ = false;
    }

    if (strcmp(url, "https://www.example.com/bufLenZero") == 0) {
        request->bufLen_ = 0;
    } else {
        const int defaultBufLen = 10;
        request->bufLen_ = defaultBufLen;
    }

    request->Start();
    OH_LOG_INFO(LOG_APP, "OnURLRequestStart Start");
}

// 请求结束的回调，在该函数中我们需要标记RawfileRequest已经结束了，内部不应该再使用ResourceHandler。
void OnURLRequestStop(const ArkWeb_SchemeHandler *schemeHandler,
                      const ArkWeb_ResourceRequest *request)
{
    OH_LOG_ERROR(LOG_APP, "OnURLRequestStop start.");
    if (!request) {
        OH_LOG_ERROR(LOG_APP, "on request stop request is nullptr.");
        return;
    }

    RawfileRequest *rawfileRequest = (RawfileRequest *)OH_ArkWebResourceRequest_GetUserData(request);
    if (rawfileRequest) {
        g_testSetAsyncReadCallback = rawfileRequest->SetAsyncReadCallback();
        g_testAsyncRead = rawfileRequest->AsyncRead();
        g_testAsyncReadMore = rawfileRequest->AsyncReadMore();
        g_testAsyncReadCallback = rawfileRequest->AsyncReadCallback();
        g_testReadBufferValue = rawfileRequest->ReadBufferValue();
        g_testThreadIdEqual = rawfileRequest->ThreadIdEqual();
        rawfileRequest->Stop();
    }
    g_testRequestStop = 1;
    OH_LOG_ERROR(LOG_APP, "OnURLRequestStop end.");
}

void OnURLRequestStartForSW(const ArkWeb_SchemeHandler *schemeHandler,
                            ArkWeb_ResourceRequest *resourceRequest,
                            const ArkWeb_ResourceHandler *resourceHandler,
                            bool *intercept)
{
    *intercept = true;
    RawfileRequest* request = new RawfileRequest(resourceRequest, resourceHandler, g_resourceManager);
    OH_ArkWebResourceRequest_SetUserData(resourceRequest, request);
    request->Start();
}

void OnURLRequestStopForSW(const ArkWeb_SchemeHandler *schemeHandler,
                           const ArkWeb_ResourceRequest *request)
{
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
static napi_value SetSchemeHandler(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "set scheme handler");
    OH_ArkWeb_CreateSchemeHandler(&g_schemeHandler);
    OH_ArkWeb_CreateSchemeHandler(&g_schemeHandlerForSW);

    OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandler, OnURLRequestStart);
    OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandler, OnURLRequestStop);

    OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandlerForSW, OnURLRequestStart);
    OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandlerForSW, OnURLRequestStop);

    OH_ArkWeb_SetSchemeHandler("custom", "scheme-handler", g_schemeHandler);
    OH_ArkWeb_SetSchemeHandler("custom-csp-bypassing", "scheme-handler", g_schemeHandler);
    OH_ArkWeb_SetSchemeHandler("custom-isolated", "scheme-handler", g_schemeHandler);
    OH_ArkWeb_SetSchemeHandler("custom-local", "scheme-handler", g_schemeHandler);
    OH_ArkWeb_SetSchemeHandler("https", "scheme-handler", g_schemeHandler);
    OH_ArkWeb_SetSchemeHandler("http", "scheme-handler", g_schemeHandler);

    OH_ArkWebServiceWorker_SetSchemeHandler("http", g_schemeHandlerForSW);
    OH_ArkWebServiceWorker_SetSchemeHandler("https", g_schemeHandlerForSW);
    return nullptr;
}

static napi_value InitResourceManager(napi_env env, napi_callback_info info)
{
    OH_LOG_ERROR(LOG_APP, "InitResourceManager start.");
    size_t argc = 2;
    napi_value argv[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    g_resourceManager = OH_ResourceManager_InitNativeResourceManager(env, argv[0]);
    return nullptr;
}

static napi_value SetAsyncReadCallback(napi_env env, napi_callback_info info)
{
    napi_value result;
    if (g_testSetAsyncReadCallback == 1) {
        napi_create_int32(env, 1, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

static napi_value AsyncRead(napi_env env, napi_callback_info info)
{
    napi_value result;
    if (g_testAsyncRead == 1) {
        napi_create_int32(env, 1, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

static napi_value AsyncReadMore(napi_env env, napi_callback_info info)
{
    napi_value result;
    if (g_testAsyncReadMore == 1) {
        napi_create_int32(env, 1, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

static napi_value AsyncReadCallback(napi_env env, napi_callback_info info)
{
    napi_value result;
    if (g_testAsyncReadCallback == 1) {
        napi_create_int32(env, 1, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

static napi_value ReadBufferValue(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_string_utf8(env, g_testReadBufferValue.c_str(), NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value ThreadIdEqual(napi_env env, napi_callback_info info)
{
    napi_value result;
    if (g_testThreadIdEqual == 1) {
        napi_create_int32(env, 1, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

static napi_value RequestStop(napi_env env, napi_callback_info info)
{
    napi_value result;
    if (g_testRequestStop == 1) {
        napi_create_int32(env, 1, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"setSchemeHandler", nullptr, SetSchemeHandler, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"initResourceManager", nullptr, InitResourceManager, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"registerCustomSchemes", nullptr, RegisterCustomSchemes, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setAsyncReadCallback", nullptr, SetAsyncReadCallback, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"asyncRead", nullptr, AsyncRead, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"asyncReadMore", nullptr, AsyncReadMore, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"asyncReadCallback", nullptr, AsyncReadCallback, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"readBufferValue", nullptr, ReadBufferValue, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"threadIdEqual", nullptr, ThreadIdEqual, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"requestStop", nullptr, RequestStop, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}