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
#include "web/arkweb_net_error_list.h"
#include <bits/alltypes.h>
#include <web/arkweb_interface.h>

#undef LOG_TAG
#define LOG_TAG "ss-handler"

ArkWeb_SchemeHandler *g_schemeHandler;
ArkWeb_SchemeHandler *g_schemeHandlerForSW;
NativeResourceManager *g_resourceManager;

int32_t testReleaseString = -1;
int32_t testReleaseByteArray = -1;
int32_t testDestroyHttpBodyStream = -1;
int32_t testSetHeaderByName = -1;

int32_t testResourceHandler = -1;
int32_t testResponse = -1;
std::string testResourceRequest("test");
int32_t testRequestHeaderList = -1;
int32_t testHttpBodyStream = -1;
int32_t testHttpBodyStreamInitCallback = -1;
int32_t testHttpBodyStreamReadCallback = -1;
int32_t testRegisterCustom = -1;

// 注册三方协议的配置，需要在Web内核初始化之前调用，否则会注册失败。
static napi_value RegisterCustomSchemes(napi_env env, napi_callback_info info) 
{
    OH_LOG_INFO(LOG_APP, "register custom schemes");
    testRegisterCustom = OH_ArkWeb_RegisterCustomSchemes("custom",  ARKWEB_SCHEME_OPTION_DISPLAY_ISOLATED
    | ARKWEB_SCHEME_OPTION_FETCH_ENABLED | ARKWEB_SCHEME_OPTION_CORS_ENABLED | ARKWEB_SCHEME_OPTION_CSP_BYPASSING);

    return nullptr;
}

// 请求开始的回调，在该函数中我们创建一个RawfileRequest来实现对Web内核请求的拦截。
void OnURLRequestStart(const ArkWeb_SchemeHandler *schemeHandler, ArkWeb_ResourceRequest *resourceRequest,
                       const ArkWeb_ResourceHandler *resourceHandler, bool *intercept) 
{
    *intercept = true;
    RawfileRequest *request = new RawfileRequest(resourceRequest, resourceHandler, g_resourceManager);

    OH_ArkWebResourceRequest_SetUserData(resourceRequest, request);
    request->Start();
    
    testReleaseString = request->releaseString();
    testReleaseByteArray = request->releaseByteArray();
    testSetHeaderByName = request->setHeaderByName();
    
    testHttpBodyStream = request->haveBodyStream();
    testRequestHeaderList = request->getRequestHeaderList();
    testResourceRequest = request->reqUrl();
    testHttpBodyStreamInitCallback = request->isInit();
    testHttpBodyStreamReadCallback = request->isRead();
    
    OH_ArkWebSchemeHandler_GetUserData(schemeHandler);
}

// 请求结束的回调，在该函数中我们需要标记RawfileRequest已经结束了，内部不应该再使用ResourceHandler。
void OnURLRequestStop(const ArkWeb_SchemeHandler *schemeHandler, const ArkWeb_ResourceRequest *request) 
{
    if (!request) {
        OH_LOG_ERROR(LOG_APP, "on request stop request is nullptr.");
        return;
    }

    RawfileRequest *rawfileRequest = (RawfileRequest *)OH_ArkWebResourceRequest_GetUserData(request);
    if (rawfileRequest) {
        rawfileRequest->Stop();
        testDestroyHttpBodyStream = rawfileRequest->destroyHttpBodyStream();
        
        testResponse = rawfileRequest->haveResponse();
        testResourceHandler = rawfileRequest->haveResourceHandler();
    }
    
    OH_ArkWebSchemeHandler_SetUserData(g_schemeHandler, rawfileRequest);
    OH_ArkWebServiceWorker_ClearSchemeHandlers();
}

// 设置SchemeHandler。
static napi_value SetSchemeHandler(napi_env env, napi_callback_info info) 
{
    OH_LOG_INFO(LOG_APP, "set scheme handler");
    napi_value result;

    OH_ArkWeb_CreateSchemeHandler(&g_schemeHandler);
    OH_ArkWeb_CreateSchemeHandler(&g_schemeHandlerForSW);
    OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandler, OnURLRequestStart);

    OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandler, OnURLRequestStop);

    OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandlerForSW, OnURLRequestStart);
    OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandlerForSW, OnURLRequestStop);
    OH_ArkWeb_SetSchemeHandler("custom", "scheme-handler", g_schemeHandler);
    OH_ArkWebServiceWorker_SetSchemeHandler("custom", g_schemeHandlerForSW);
    
    OH_ArkWeb_SetSchemeHandler("http", "scheme-handler", g_schemeHandler);
    OH_ArkWeb_SetSchemeHandler("https", "scheme-handler", g_schemeHandler);
    OH_ArkWebServiceWorker_SetSchemeHandler("https", g_schemeHandlerForSW);
    
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value InitResourceManager(napi_env env, napi_callback_info info) 
{
    size_t argc = 2;
    napi_value argv[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    g_resourceManager = OH_ResourceManager_InitNativeResourceManager(env, argv[0]);
    return nullptr;
}

static napi_value GetNativeAPI(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_LOG_INFO(LOG_APP, "OH_ArkWeb_GetNativeAPI");
    ArkWeb_AnyNativeAPI* api = OH_ArkWeb_GetNativeAPI(ARKWEB_NATIVE_COMPONENT);
    size_t api_size = api->size;
    napi_create_int32(env, api_size, &result);

    return result;
}

static napi_value ReleaseString(napi_env env, napi_callback_info info) 
{
    napi_value result;
    OH_LOG_INFO(LOG_APP, "OH_ArkWeb_ReleaseString");

    if (testReleaseString == 0) {
        napi_create_int32(env, 0, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

static napi_value ReleaseByteArray(napi_env env, napi_callback_info info) 
{
    napi_value result;
    OH_LOG_INFO(LOG_APP, "OH_ArkWeb_ReleaseByteArray");

    if (testReleaseByteArray == 0) {
        napi_create_int32(env, 0, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

static napi_value DestroyHttpBodyStream(napi_env env, napi_callback_info info) 
{
    napi_value result;
    OH_LOG_INFO(LOG_APP, "OH_ArkWebResourceRequest_DestroyHttpBodyStream");

    if (testDestroyHttpBodyStream == 0) {
        napi_create_int32(env, 0, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

static napi_value SetHeaderByName(napi_env env, napi_callback_info info) 
{
    napi_value result;
    OH_LOG_INFO(LOG_APP, "OH_ArkWebResponse_SetHeaderByName");

    if (testSetHeaderByName == 0) {
        napi_create_int32(env, 0, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

static napi_value ResourceHandler(napi_env env, napi_callback_info info) 
{
    napi_value result;
    OH_LOG_INFO(LOG_APP, "ArkWeb_ResourceHandler");

    if (testResourceHandler == 0) {
        napi_create_int32(env, 0, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

static napi_value Response(napi_env env, napi_callback_info info) 
{
    napi_value result;
    OH_LOG_INFO(LOG_APP, "ArkWeb_Response");

    if (testResponse == 0) {
        napi_create_int32(env, 0, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

static napi_value ResourceRequest(napi_env env, napi_callback_info info) 
{
    napi_value result;
    OH_LOG_INFO(LOG_APP, "ArkWeb_ResourceRequest ");

    if (testResourceRequest != "test") {
        napi_create_int32(env, 0, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

static napi_value RequestHeaderList(napi_env env, napi_callback_info info) 
{
    napi_value result;
    OH_LOG_INFO(LOG_APP, "ArkWeb_RequestHeaderList ");

    if (testRequestHeaderList != -1) {
        napi_create_int32(env, 0, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

static napi_value HttpBodyStream(napi_env env, napi_callback_info info) 
{
    napi_value result;
    OH_LOG_INFO(LOG_APP, "ArkWeb_HttpBodyStream  ");

    if (testHttpBodyStream == 0) {
        napi_create_int32(env, 0, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

static napi_value HttpBodyStreamInitCallback(napi_env env, napi_callback_info info) 
{
    napi_value result;
    OH_LOG_INFO(LOG_APP, "ArkWeb_HttpBodyStreamInitCallback");

    if (testHttpBodyStreamInitCallback == 0) {
        napi_create_int32(env, 0, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

static napi_value HttpBodyStreamReadCallback(napi_env env, napi_callback_info info) 
{
    napi_value result;
    OH_LOG_INFO(LOG_APP, "ArkWeb_HttpBodyStreamReadCallback ");

    if (testHttpBodyStreamReadCallback == 0) {
        napi_create_int32(env, 0, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

static napi_value GetNativeApiFalse(napi_env env, napi_callback_info info)
{
    napi_value result;
    ArkWeb_AnyNativeAPI* api = OH_ArkWeb_GetNativeAPI(ArkWeb_NativeAPIVariantKind(5));
    if (!api) {
        OH_LOG_INFO(LOG_APP, "OH_ArkWeb_GetNativeAPI nullptr");
        napi_create_int32(env, 0, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

static napi_value RequestHeaderListFalse(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t headerSize = OH_ArkWebRequestHeaderList_GetSize(nullptr);
    napi_create_int32(env, headerSize, &result);
    return result;
}

static napi_value HttpBodyStreamSetUserDataFalse(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t isTest = OH_ArkWebHttpBodyStream_SetUserData(nullptr, nullptr);
    napi_create_int32(env, isTest, &result);
    return result;
}

static napi_value HttpBodyStreamSetReadCallbackFalse(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t isTest = OH_ArkWebHttpBodyStream_SetReadCallback(nullptr, nullptr);
    napi_create_int32(env, isTest, &result);
    return result;
}

static napi_value HttpBodyStreamInitFalse(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t isTest = OH_ArkWebHttpBodyStream_Init(nullptr, nullptr);
    napi_create_int32(env, isTest, &result);
    return result;
}


static napi_value HttpBodyStreamIsChunkedFalse(napi_env env, napi_callback_info info)
{
    napi_value result;
    
    bool isTestChunked = OH_ArkWebHttpBodyStream_IsChunked(nullptr);
    if (!isTestChunked) {
        napi_create_int32(env, 0, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

static napi_value HttpBodyStreamIsEofFalse(napi_env env, napi_callback_info info)
{
    napi_value result;
    
    bool isTestEof = OH_ArkWebHttpBodyStream_IsEof(nullptr);
    if (!isTestEof) {
        napi_create_int32(env, 0, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

static napi_value HttpBodyStreamIsInMemoryFalse(napi_env env, napi_callback_info info)
{
    napi_value result;
    
    bool isTestInMemory = OH_ArkWebHttpBodyStream_IsInMemory(nullptr);
    if (!isTestInMemory) {
        napi_create_int32(env, 0, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

static napi_value ResourceRequestIsRedirectFalse(napi_env env, napi_callback_info info)
{
    napi_value result;
    
    bool isTestIsRedirect = OH_ArkWebResourceRequest_IsRedirect(nullptr);
    if (!isTestIsRedirect) {
        napi_create_int32(env, 0, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

static napi_value ResourceRequestIsMainFrameFalse(napi_env env, napi_callback_info info)
{
    napi_value result;
    
    bool isTestIsMainFrame = OH_ArkWebResourceRequest_IsMainFrame(nullptr);
    if (!isTestIsMainFrame) {
        napi_create_int32(env, 0, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

static napi_value ResourceRequestHasGestureFalse(napi_env env, napi_callback_info info)
{
    napi_value result;
    
    bool isTestHasGesture = OH_ArkWebResourceRequest_HasGesture(nullptr);
    if (!isTestHasGesture) {
        napi_create_int32(env, 0, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

static napi_value RegisterCustomSchemesTrue(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_int32(env, testRegisterCustom, &result);
    return result;
}

static napi_value RegisterCustomSchemesInvalid(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t isTest = OH_ArkWeb_RegisterCustomSchemes(nullptr, -2);
    napi_create_int32(env, isTest, &result);
    return result;
}

static napi_value RegisterCustomSchemesError(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t isTest = OH_ArkWeb_RegisterCustomSchemes("test", -2);
    napi_create_int32(env, isTest, &result);
    return result;
}

static napi_value ServiceWorkerSetSchemeHandlerFalse(napi_env env, napi_callback_info info)
{
    napi_value result;
    bool isTest = OH_ArkWebServiceWorker_SetSchemeHandler(nullptr, nullptr);
    if (!isTest) {
        napi_create_int32(env, 0, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

static napi_value SetSchemeHandlerFalse(napi_env env, napi_callback_info info)
{
    napi_value result;
    bool isTest = OH_ArkWeb_SetSchemeHandler(nullptr, nullptr, nullptr);
    if (!isTest) {
        napi_create_int32(env, 0, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

static napi_value ClearSchemeHandlersFalse(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t isTest = OH_ArkWeb_ClearSchemeHandlers(nullptr);
    napi_create_int32(env, isTest, &result);
    return result;
}

static napi_value SchemeHandlerSetUserDataFalse(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t isTest = OH_ArkWebSchemeHandler_SetUserData(nullptr, nullptr);
    napi_create_int32(env, isTest, &result);
    return result;
}

static napi_value SetOnRequestStartFalse(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t isTest = OH_ArkWebSchemeHandler_SetOnRequestStart(nullptr, nullptr);
    napi_create_int32(env, isTest, &result);
    return result;
}

static napi_value SetOnRequestStopFalse(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t isTest = OH_ArkWebSchemeHandler_SetOnRequestStop(nullptr, nullptr);
    napi_create_int32(env, isTest, &result);
    return result;
}

static napi_value ResponseSetUrlFalse(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t isTestSetUrl = OH_ArkWebResponse_SetUrl(nullptr, "test");
    napi_create_int32(env, isTestSetUrl, &result);
    return result;
}

static napi_value ResponseSetErrorFalse(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t isTestSetCode = OH_ArkWebResponse_SetError(nullptr, ARKWEB_ERR_CACHE_READ_FAILURE);
    napi_create_int32(env, isTestSetCode, &result);
    return result;
}


static napi_value ResponseSetStatusFalse(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t isTestSetCode = OH_ArkWebResponse_SetStatus(nullptr, 0);
    napi_create_int32(env, isTestSetCode, &result);
    return result;
}

static napi_value ResponseGetStatusFalse(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t isTestGetStatus = OH_ArkWebResponse_GetStatus(nullptr);
    napi_create_int32(env, isTestGetStatus, &result);
    return result;
}

static napi_value ResponseSetStatusTextFalse(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t isTestSetStatusText = OH_ArkWebResponse_SetStatusText(nullptr, "test");
    napi_create_int32(env, isTestSetStatusText, &result);
    return result;
}

static napi_value ResponseSetMimeTypeFalse(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t isTestSetMimeType = OH_ArkWebResponse_SetMimeType(nullptr, "test");
    napi_create_int32(env, isTestSetMimeType, &result);
    return result;
}

static napi_value ResponseSetCharsetFalse(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t isTestSetCharset = OH_ArkWebResponse_SetCharset(nullptr, "test");
    napi_create_int32(env, isTestSetCharset, &result);
    return result;
}

static napi_value SetHeaderByNameNameNull(napi_env env, napi_callback_info info)
{
    napi_value result;
    ArkWeb_Response* testResponse;
    OH_ArkWeb_CreateResponse(&testResponse);
    int32_t isSetHeader = OH_ArkWebResponse_SetHeaderByName(testResponse, nullptr, "test", true);
    napi_create_int32(env, isSetHeader, &result);
    return result;
}

static napi_value SetHeaderByNameValueNull(napi_env env, napi_callback_info info)
{
    napi_value result;
    ArkWeb_Response* testResponse;
    OH_ArkWeb_CreateResponse(&testResponse);
    int32_t isSetHeader = OH_ArkWebResponse_SetHeaderByName(testResponse, "test", nullptr, true);
    napi_create_int32(env, isSetHeader, &result);
    return result;
}

static napi_value SetHeaderByNameOverwriteNull(napi_env env, napi_callback_info info)
{
    napi_value result;
    ArkWeb_Response* testResponse;
    OH_ArkWeb_CreateResponse(&testResponse);
    int32_t isSetHeader = OH_ArkWebResponse_SetHeaderByName(testResponse, "test", "test", 3);
    napi_create_int32(env, isSetHeader, &result);
    return result;
}

static napi_value ResourceHandlerDestroyFalse(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t isDestroy = OH_ArkWebResourceHandler_Destroy(nullptr);
    napi_create_int32(env, isDestroy, &result);
    return result;
}

static napi_value DidReceiveResponseFalse(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t isResponse = OH_ArkWebResourceHandler_DidReceiveResponse(nullptr, nullptr);
    napi_create_int32(env, isResponse, &result);
    return result;
}

static napi_value DidReceiveDataFalse(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t isResponse = OH_ArkWebResourceHandler_DidReceiveData(nullptr, nullptr, 200);
    napi_create_int32(env, isResponse, &result);
    return result;
}

static napi_value DidFinishFalse(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t isResponse = OH_ArkWebResourceHandler_DidFinish(nullptr);
    napi_create_int32(env, isResponse, &result);
    return result;
}

static napi_value DidFailWithErrorFalse(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t isResponse = OH_ArkWebResourceHandler_DidFailWithError(nullptr, ARKWEB_ERR_CACHE_READ_FAILURE);
    napi_create_int32(env, isResponse, &result);
    return result;
}



EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports) {
    napi_property_descriptor desc[] = {
        {"setSchemeHandler", nullptr, SetSchemeHandler, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"initResourceManager", nullptr, InitResourceManager, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"registerCustomSchemes", nullptr, RegisterCustomSchemes, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getNativeAPI", nullptr, GetNativeAPI, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"releaseString", nullptr, ReleaseString, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"releaseByteArray", nullptr, ReleaseByteArray, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"destroyHttpBodyStream", nullptr, DestroyHttpBodyStream, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setHeaderByName", nullptr, SetHeaderByName, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"resourceHandler", nullptr, ResourceHandler, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"response", nullptr, Response, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"resourceRequest", nullptr, ResourceRequest, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"requestHeaderList", nullptr, RequestHeaderList, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"httpBodyStream", nullptr, HttpBodyStream, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"httpBodyStreamInitCallback", nullptr, HttpBodyStreamInitCallback, nullptr, nullptr, nullptr, napi_default, 
    nullptr},
        {"httpBodyStreamReadCallback", nullptr, HttpBodyStreamReadCallback, nullptr, nullptr, nullptr, napi_default, 
    nullptr},
        {"getNativeApiFalse", nullptr, GetNativeApiFalse, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"requestHeaderListFalse", nullptr, RequestHeaderListFalse, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"httpBodyStreamSetUserDataFalse", nullptr, HttpBodyStreamSetUserDataFalse, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"httpBodyStreamSetReadCallbackFalse", nullptr, HttpBodyStreamSetReadCallbackFalse, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"httpBodyStreamInitFalse", nullptr, HttpBodyStreamInitFalse, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"httpBodyStreamIsChunkedFalse", nullptr, HttpBodyStreamIsChunkedFalse, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"httpBodyStreamIsEofFalse", nullptr, HttpBodyStreamIsEofFalse, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"httpBodyStreamIsInMemoryFalse", nullptr, HttpBodyStreamIsInMemoryFalse, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"resourceRequestIsRedirectFalse", nullptr, ResourceRequestIsRedirectFalse, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"resourceRequestIsMainFrameFalse", nullptr, ResourceRequestIsMainFrameFalse, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"resourceRequestHasGestureFalse", nullptr, ResourceRequestHasGestureFalse, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"registerCustomSchemesTrue", nullptr, RegisterCustomSchemesTrue, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"registerCustomSchemesInvalid", nullptr, RegisterCustomSchemesInvalid, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"registerCustomSchemesError", nullptr, RegisterCustomSchemesError, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"serviceWorkerSetSchemeHandlerFalse", nullptr, ServiceWorkerSetSchemeHandlerFalse, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setSchemeHandlerFalse", nullptr, SetSchemeHandlerFalse, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"clearSchemeHandlersFalse", nullptr, ClearSchemeHandlersFalse, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"schemeHandlerSetUserDataFalse", nullptr, SchemeHandlerSetUserDataFalse, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setOnRequestStartFalse", nullptr, SetOnRequestStartFalse, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setOnRequestStopFalse", nullptr, SetOnRequestStopFalse, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"responseSetUrlFalse", nullptr, ResponseSetUrlFalse, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"responseSetErrorFalse", nullptr, ResponseSetErrorFalse, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"responseSetStatusFalse", nullptr, ResponseSetStatusFalse, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"responseGetStatusFalse", nullptr, ResponseGetStatusFalse, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"responseSetStatusTextFalse", nullptr, ResponseSetStatusTextFalse, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"responseSetMimeTypeFalse", nullptr, ResponseSetMimeTypeFalse, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"responseSetCharsetFalse", nullptr, ResponseSetCharsetFalse, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setHeaderByNameNameNull", nullptr, SetHeaderByNameNameNull, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setHeaderByNameValueNull", nullptr, SetHeaderByNameValueNull, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setHeaderByNameOverwriteNull", nullptr, SetHeaderByNameOverwriteNull, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"resourceHandlerDestroyFalse", nullptr, ResourceHandlerDestroyFalse, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"didReceiveResponseFalse", nullptr, DidReceiveResponseFalse, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"didReceiveDataFalse", nullptr, DidReceiveDataFalse, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"didFinishFalse", nullptr, DidFinishFalse, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"didFailWithErrorFalse", nullptr, DidFailWithErrorFalse, nullptr, nullptr, nullptr, napi_default, nullptr},
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
