/*
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
#include "web/arkweb_scheme_handler.h"
#include <bits/alltypes.h>
#include <string>
#include <threads.h>

#undef LOG_TAG
#define LOG_TAG "ss-handler"

ArkWeb_SchemeHandler *g_schemeHandler;
ArkWeb_SchemeHandler *g_schemeHandlerFowSW;

bool g_testWebServiceWorkerSetSchemeHandler = false;
int32_t testWebSchemeHandler_SetOnRequestStart = -1;
int32_t testWebSchemeHandler_SetOnRequestStop = -1;
bool g_testWebResourceRequestGetRequestHeaders = false;
const int BUFF_LEN = 5;
const int REDIRECT_CODE = 302;
const int OK = 200;

class URLRequest {
public:
    URLRequest(const ArkWeb_ResourceRequest *resourceRequest, const ArkWeb_ResourceHandler *resourceHandler,
               std::string url);
    ~URLRequest();
    void StartRead();
    void Start();
    void Stop();
    const ArkWeb_ResourceHandler *resourceHandler() { return resourceHandler_; }
    std::string url();
    ArkWeb_Response *response() { return response_; }


private:
    const ArkWeb_ResourceRequest *resourceRequest_;
    const ArkWeb_ResourceHandler *resourceHandler_;
    ArkWeb_HttpBodyStream *stream_{nullptr};
    std::string url_;
    ArkWeb_Response *response_;
};

namespace {
    uint8_t buffer[1024];

    void InitCallback(const ArkWeb_HttpBodyStream *httpBodyStream, ArkWeb_NetError result)
    {
        std::fill(buffer, buffer + BUFF_LEN, 0);
        OH_ArkWebHttpBodyStream_Read(httpBodyStream, buffer, BUFF_LEN);
    }

    void ReadCallback(const ArkWeb_HttpBodyStream *httpBodyStream, uint8_t *buffer, int bytesRead)
    {
        bool isEof = OH_ArkWebHttpBodyStream_IsEof(httpBodyStream);
        if (!isEof && bytesRead != 0) {
            std::fill(buffer, buffer + BUFF_LEN, 0);
            OH_ArkWebHttpBodyStream_Read(httpBodyStream, buffer, BUFF_LEN);
            OH_LOG_INFO(LOG_APP, "OH_ArkWebHttpBodyStream_Read");
        } else {
            OH_LOG_INFO(LOG_APP, "OH_ArkWeb_ReleaseByteArray");
            URLRequest *urlRequest = (URLRequest *)OH_ArkWebHttpBodyStream_GetUserData(httpBodyStream);
            if (urlRequest) {
                urlRequest->StartRead();
            }
        }
    }

    int ReadHTTP302PageOnWorkerThread(void *urlRequest)
    {
        OH_LOG_INFO(LOG_APP, "ReadHTTP302PageOnWorkerThread");

        ArkWeb_Response *response;
        OH_ArkWeb_CreateResponse(&response);
        OH_ArkWebResponse_SetError(response, ARKWEB_NET_OK);
        OH_ArkWebResponse_SetStatus(response, REDIRECT_CODE);
        OH_ArkWebResponse_SetStatusText(response, "page not found");
        OH_ArkWebResponse_SetMimeType(response, "text/html");
        OH_ArkWebResponse_SetUrl(response, "https://www.example.com");
        OH_ArkWebResponse_SetCharset(response, "utf-8");

        // response
        OH_ArkWebResourceHandler_DidReceiveResponse(static_cast<URLRequest *>(urlRequest)->resourceHandler(), response);
        OH_ArkWebResourceHandler_DidFinish(static_cast<URLRequest *>(urlRequest)->resourceHandler());

        return 0;
    }

    int ReadXHRWithStatusNormalOnWorkerThread(void *urlRequest)
    {
        OH_LOG_ERROR(LOG_APP, "scheme_handler readnormalxhr in worker thread.");
        ArkWeb_Response *response;
        OH_ArkWeb_CreateResponse(&response);
        OH_ArkWebResponse_SetError(response, ARKWEB_NET_OK);
        OH_ArkWebResponse_SetStatus(response, OK);
        OH_ArkWebResponse_SetMimeType(response, "text/html");
        OH_ArkWebResponse_SetCharset(response, "utf-8");

        OH_ArkWebResponse_SetHeaderByName(response, "Access-Control-Allow-Origin", "*", false);

        // 模拟一个response.
        OH_ArkWebResourceHandler_DidReceiveResponse(static_cast<URLRequest *>(urlRequest)->resourceHandler(), response);
        // 模拟第一份数据。
        std::string html_str = "{\"wanghui-debug\":\"jsontest\"}";
        OH_ArkWebResourceHandler_DidReceiveData(static_cast<URLRequest *>(urlRequest)->resourceHandler(),
                                                (uint8_t *)html_str.c_str(), html_str.length());
        OH_ArkWebResourceHandler_DidFinish(static_cast<URLRequest *>(urlRequest)->resourceHandler());
        return 0;
    }
} // namesapce


URLRequest::URLRequest(const ArkWeb_ResourceRequest *resourceRequest, const ArkWeb_ResourceHandler *resourceHandler,
                       std::string url)
    : resourceRequest_(resourceRequest), resourceHandler_(resourceHandler), url_(url) {}


void URLRequest::StartRead()
{
    OH_ArkWeb_CreateResponse(&response_);
    // 开启线程
    thrd_t th;
    ArkWeb_RequestHeaderList* headerList;

    OH_ArkWebResourceRequest_GetRequestHeaders(resourceRequest_, &headerList);
    int size = OH_ArkWebRequestHeaderList_GetSize(headerList);
    for (int i = 0; i < size; i++) {
        char *key;
        char *value;
        OH_ArkWebRequestHeaderList_GetHeader(headerList, i, &key, &value);
        g_testWebResourceRequestGetRequestHeaders = true;
    }

    OH_LOG_INFO(LOG_APP, "OH_ArkWebResourceRequest_GetRequestHeaders after %{public}p", headerList);

    char *method;
    char *referrer;
    OH_ArkWebResourceRequest_GetMethod(resourceRequest_, &method);
    OH_ArkWebResourceRequest_GetReferrer(resourceRequest_, &referrer);

    if (url_ == "custom://www.example.com/302.html") {
        if (thrd_create(&th, ReadHTTP302PageOnWorkerThread, (void *)this) != thrd_success) {
        } else {
            thrd_detach(th);
        }
    };
    if (url_ == "custom://www.example.com/xhr/normal/") {
        if (thrd_create(&th, ReadXHRWithStatusNormalOnWorkerThread, (void *)this) != thrd_success) {
        } else {
            thrd_detach(th);
        }
    };
}

void URLRequest::Start()
{
    OH_ArkWebResourceRequest_GetHttpBodyStream(resourceRequest_, &stream_);

    if (stream_) {
        OH_ArkWebHttpBodyStream_SetUserData(stream_, this);
        OH_ArkWebHttpBodyStream_SetReadCallback(stream_, ReadCallback);
        OH_ArkWebHttpBodyStream_Init(stream_, InitCallback);
    } else {
        StartRead();
    }
}

void URLRequest::Stop()
{
}

// 注册三方协议的配置，需要在Web内核初始化之前调用，否则会注册失败。
static napi_value RegisterCustomSchemes(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "register custom schemes");
    OH_ArkWeb_RegisterCustomSchemes("custom", ARKWEB_SCHEME_OPTION_DISPLAY_ISOLATED
    | ARKWEB_SCHEME_OPTION_FETCH_ENABLED | ARKWEB_SCHEME_OPTION_CORS_ENABLED | ARKWEB_SCHEME_OPTION_CSP_BYPASSING);

    return nullptr;
}

// 请求开始的回调，在该函数中我们创建一个RawfileRequest来实现对Web内核请求的拦截。
void OnURLRequestStart(const ArkWeb_SchemeHandler *schemeHandler, ArkWeb_ResourceRequest *resourceRequest,
                       const ArkWeb_ResourceHandler *resourceHandler, bool *intercept)
{
    void* userdata = OH_ArkWebSchemeHandler_GetUserData(schemeHandler);

    char* url;
    OH_ArkWebResourceRequest_GetUrl(resourceRequest, &url);

    *intercept = true;
    URLRequest* request = new URLRequest(resourceRequest, resourceHandler, std::string(url));
    request->Start();
}

// 请求结束的回调，在该函数中我们需要标记RawfileRequest已经结束了，内部不应该再使用ResourceHandler
void OnURLRequestStop(const ArkWeb_SchemeHandler *schemeHandler, const ArkWeb_ResourceRequest *request)
{
    if (!request) {
        return;
    }

    URLRequest* urlRequest = (URLRequest*)OH_ArkWebResourceRequest_GetUserData(request);
    urlRequest->Stop();
    // 接口覆盖 OH_ArkWebResourceRequest_DestroyHttpBodyStream
    ArkWeb_HttpBodyStream *httpBodyStreamTest;
    OH_ArkWebResourceRequest_GetHttpBodyStream(request, &httpBodyStreamTest);
    OH_ArkWebResourceRequest_DestroyHttpBodyStream(httpBodyStreamTest);
    OH_LOG_INFO(LOG_APP, "OH_ArkWebResourceRequest_DestroyHttpBodyStream");
}


// 设置 SchemeHandler
static napi_value SetSchemeHandler(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "set scheme handler");

    OH_ArkWeb_CreateSchemeHandler(&g_schemeHandler);

    testWebSchemeHandler_SetOnRequestStart = OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandler,
                                                                                      OnURLRequestStart);
    testWebSchemeHandler_SetOnRequestStop =OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandler, OnURLRequestStop);

    OH_ArkWeb_SetSchemeHandler("custom", "scheme-handler", g_schemeHandler);
    g_testWebServiceWorkerSetSchemeHandler = OH_ArkWebServiceWorker_SetSchemeHandler("http", g_schemeHandler);
    OH_LOG_INFO(LOG_APP, "testWebSchemeHandler_SetOnRequestStart %{public}d", testWebSchemeHandler_SetOnRequestStart);
    OH_LOG_INFO(LOG_APP, "testWebSchemeHandler_SetOnRequestStop %{public}d", testWebSchemeHandler_SetOnRequestStop);
    OH_LOG_INFO(LOG_APP, "g_testWebServiceWorkerSetSchemeHandler %{public}d", g_testWebServiceWorkerSetSchemeHandler);

    return nullptr;
}

static napi_value ServiceWorkerSetSchemeHandler(napi_env env, napi_callback_info info)
{
    napi_value result;
    if (g_testWebServiceWorkerSetSchemeHandler) {
        napi_create_int32(env, 0, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

static napi_value SchemeHandlerSetOnRequestStart(napi_env env, napi_callback_info info)
{
    napi_value result;
    if (testWebSchemeHandler_SetOnRequestStart == 0) {
        napi_create_int32(env, 0, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

static napi_value SchemeHandlerSetOnRequestStop(napi_env env, napi_callback_info info)
{
    napi_value result;
    if (testWebSchemeHandler_SetOnRequestStop == 0) {
        napi_create_int32(env, 0, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

static napi_value ReleaseString(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_LOG_ERROR(LOG_APP, "ReleaseString ");
    char* url = new char[1024];
    OH_ArkWeb_ReleaseString(url);
    napi_create_int32(env, 0, &result);

    return result;
}

static napi_value ReleaseByteArray(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_LOG_ERROR(LOG_APP, "ReleaseByteArray ");
    uint8_t* buffer = new uint8_t[1024];
    OH_ArkWeb_ReleaseByteArray(buffer);
    napi_create_int32(env, 0, &result);

    return result;
}

static napi_value DestroyResponse(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_LOG_ERROR(LOG_APP, "DestroyResponse ");
    ArkWeb_Response *response;
    OH_ArkWeb_CreateResponse(&response);
    OH_ArkWeb_DestroyResponse(response);

    napi_create_int32(env, 0, &result);

    return result;
}

static napi_value CreateSchemeHandler(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_LOG_ERROR(LOG_APP, "CreateSchemeHandler ");
    ArkWeb_SchemeHandler* test_schemeHandler;
    OH_ArkWeb_CreateSchemeHandler(&test_schemeHandler);

    napi_create_int32(env, 0, &result);

    return result;
}

static napi_value ResourceRequestGetRequestHeader(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_LOG_ERROR(LOG_APP, "ResourceRequestGetRequestHeader ");
    if (g_testWebResourceRequestGetRequestHeaders) {
        napi_create_int32(env, 0, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

static napi_value HttpBodyStreamGetUserData(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_LOG_ERROR(LOG_APP, "HttpBodyStreamGetUserData ");

    ArkWeb_HttpBodyStream* httpBodyStream;

    int data = 100;

    OH_ArkWebHttpBodyStream_SetUserData(httpBodyStream, (void*)&data);
    int getData = *(int*)OH_ArkWebHttpBodyStream_GetUserData(httpBodyStream);

    OH_LOG_ERROR(LOG_APP, "OH_ArkWebHttpBodyStream_GetUserData %{public}d", getData);

    if (data == getData) {
        napi_create_int32(env, 0, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }

    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports) {
    napi_property_descriptor desc[] = {
        {"setSchemeHandler", nullptr, SetSchemeHandler, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"registerCustomSchemes", nullptr, RegisterCustomSchemes, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"serviceWorkerSetSchemeHandler", nullptr, ServiceWorkerSetSchemeHandler, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"schemeHandlerSetOnRequestStart", nullptr, SchemeHandlerSetOnRequestStart, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"schemeHandlerSetOnRequestStop", nullptr, SchemeHandlerSetOnRequestStop, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"releaseString", nullptr, ReleaseString, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"releaseByteArray", nullptr, ReleaseByteArray, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"destroyResponse", nullptr, DestroyResponse, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"createSchemeHandler", nullptr, CreateSchemeHandler, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"resourceRequestGetRequestHeaders", nullptr, ResourceRequestGetRequestHeader, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"httpBodyStreamGetUserData", nullptr, HttpBodyStreamGetUserData, nullptr, nullptr, nullptr, napi_default,
         nullptr}

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

