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
#include <arm-linux-ohos/bits/user.h>
#include <hilog/log.h>
#include "napi/native_api.h"
#include "web/arkweb_scheme_handler.h"
#include <bits/alltypes.h>
#include <web/arkweb_interface.h>
#include "rawfile/raw_file_manager.h"
#include "test_request.h"

#undef LOG_DOMAIN

#undef LOG_TAG

#define LOG_DOMAIN 0x0000

#define LOG_TAG "webtest"

ArkWeb_SchemeHandler *g_schemeHandler;
ArkWeb_SchemeHandler *g_scheme_handler_for_service_worker;
NativeResourceManager *g_resourceManager;

std::string testUrl;
std::string testMethod;
std::string testRef("test");
bool testGetHttpBodyStream = false;
int32_t testHeaderSize = 0;
bool testHasHeader = false;
bool testDestroyHeaderList = false;
bool testHasGesture = false;
bool testIsMainFrame = false;
bool testIsRedirect = false;
bool testSchemeHandlerGetUserData = false;
int32_t testSchemeHandlerSetUserData = -1;
bool testResourceRequestGetUserData = false;
int32_t testResourceRequestSetUserData = -1;
int32_t testResourceRequestDestroy = -1;
std::string testResponseUrl("test");
int32_t testResponseError;
int32_t testResponseStatus;
std::string testResponseStatusText;
std::string testResponseMimeType;
std::string testResponseCharSet;
std::string testResponseHost("test");
int32_t testResponseSetUrl = -1;
int32_t testResponseSetError = -1;
int32_t testResponseSetStatus = -1;
int32_t testResponseSetStatusText = -1;
int32_t testResponseSetMimeType = -1;
int32_t testResponseSetCharSet = -1;
int32_t testResponseSetHost = -1;

const int DEFAULT_TYPE = -100;
int32_t testResourceType = DEFAULT_TYPE;
std::string testFrameUrl("test");

const int NOT_FOUND = 404;
const int OK = 200;

static napi_value RegisterCustomSchemes(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "register custom schemes start");

    int32_t value;
    value = OH_ArkWeb_RegisterCustomSchemes("custom",
                                            ARKWEB_SCHEME_OPTION_DISPLAY_ISOLATED | ARKWEB_SCHEME_OPTION_FETCH_ENABLED | ARKWEB_SCHEME_OPTION_CORS_ENABLED);

    OH_LOG_INFO(LOG_APP, "register custom schemes end %{public}d", value);

    napi_value result;
    napi_create_int32(env, value, &result);

    return result;
}

static napi_value ClearSchemeHandlers(napi_env env, napi_callback_info info)
{
    int32_t value;
    value = OH_ArkWeb_ClearSchemeHandlers("scheme-handler");

    napi_value result;
    napi_create_int32(env, value, &result);
    return result;
}

static napi_value ServiceWorkerClearSchemeHandlers(napi_env env, napi_callback_info info)
{
    int32_t value;
    value = OH_ArkWebServiceWorker_ClearSchemeHandlers();
    napi_value result;
    napi_create_int32(env, value, &result);
    return result;
}

void OnURLRequestStart(const ArkWeb_SchemeHandler *schemeHandler, ArkWeb_ResourceRequest *resourceRequest,
                       const ArkWeb_ResourceHandler *resourceHandler, bool *intercept)
{
    OH_LOG_INFO(LOG_APP, "OnURLRequestStart");

    int32_t p = 6;
    int* value = &p;
    testSchemeHandlerSetUserData = OH_ArkWebSchemeHandler_SetUserData(g_schemeHandler, &value);

    *intercept = true;

    TestRequest* testRequest = new TestRequest(resourceRequest, resourceHandler, g_resourceManager);
    testResourceRequestSetUserData = OH_ArkWebResourceRequest_SetUserData(resourceRequest, testRequest);

    testRequest->Start();

    testUrl = testRequest->url().c_str();
    testMethod = testRequest->method().c_str();
    testGetHttpBodyStream = testRequest->isGetBodyStream();
    testHeaderSize = testRequest->header_size();
    testHasHeader = testRequest->hasHeader();
    testDestroyHeaderList = testRequest->isHeaderDestroy();
    testHasGesture = testRequest->hasGesture();
    testIsMainFrame = testRequest->isMainFrame();
    testIsRedirect = testRequest->isRedirect();
    testRef = testRequest->referrer().c_str();
    
    testResourceType = testRequest->rspResourceType();
    testFrameUrl = testRequest->rspFrameUrl();

    testResponseUrl = testRequest->rspUrl();
    testResponseError = testRequest->rspNetError();
    testResponseStatus = testRequest->rspStatus();
    testResponseStatusText = testRequest->rspStatusText();
    testResponseMimeType = testRequest->rspMimeType();
    testResponseCharSet = testRequest->rspCharSet();
    testResponseHost = testRequest->rspHost();

    testRequest->rawfilePath();

    testResponseSetUrl = testRequest->setRspUrl();
    testResponseSetError = testRequest->setRspError();
    testResponseSetStatus = testRequest->setStatus();
    testResponseSetStatusText = testRequest->setStatusText();
    testResponseSetMimeType = testRequest->setMimeType();
    testResponseSetCharSet = testRequest->setCharset();
    testResponseSetHost = testRequest->setHeaderByName();

    OH_LOG_INFO(LOG_APP, "testRequest->rawfilePath() %{public}s", testRequest->rawfilePath().c_str());

    OH_LOG_INFO(LOG_APP, "testRequest->url() %{public}s", testUrl.c_str());
    OH_LOG_INFO(LOG_APP, "testRequest->method() %{public}s", testMethod.c_str());
    OH_LOG_INFO(LOG_APP, "testRequest->isGetBodyStream() %{public}d", testGetHttpBodyStream);
    OH_LOG_INFO(LOG_APP, "testRequest->header_size() %{public}d", testHeaderSize);
    OH_LOG_INFO(LOG_APP, "testRequest->hasHeader() %{public}d", testHasHeader);
    OH_LOG_INFO(LOG_APP, "testRequest->isHeaderDestroy() %{public}d", testDestroyHeaderList);
    OH_LOG_INFO(LOG_APP, "testRequest->hasGesture() %{public}d", testHasGesture);
    OH_LOG_INFO(LOG_APP, "testRequest->isMainFrame() %{public}d", testIsMainFrame);
    OH_LOG_INFO(LOG_APP, "testRequest->isRedirect() %{public}d", testIsRedirect);
    OH_LOG_INFO(LOG_APP, "testRequest->referrer() %{public}s", testRef.c_str());
    
    OH_LOG_INFO(LOG_APP, "testRequest->rspResourceType() %{public}d", testResourceType);
    OH_LOG_INFO(LOG_APP, "testRequest->rspFrameUrl() %{public}s", testFrameUrl.c_str());

    OH_LOG_INFO(LOG_APP, "testRequest->rspUrl() %{public}s", testResponseUrl.c_str());
    OH_LOG_INFO(LOG_APP, "testRequest->rspNetError() %{public}d", testResponseError);
    OH_LOG_INFO(LOG_APP, "testRequest->rspStatus() %{public}d", testResponseStatus);
    OH_LOG_INFO(LOG_APP, "testRequest->rspStatusText() %{public}s", testResponseStatusText.c_str());
    OH_LOG_INFO(LOG_APP, "testRequest->rspMimeType() %{public}s", testResponseMimeType.c_str());
    OH_LOG_INFO(LOG_APP, "testRequest->rspCharSet() %{public}s", testResponseCharSet.c_str());
    OH_LOG_INFO(LOG_APP, "testRequest->rspHost() %{public}s", testResponseHost.c_str());

    OH_LOG_INFO(LOG_APP, "testRequest->setRspUrl() %{public}d", testResponseSetUrl);
    OH_LOG_INFO(LOG_APP, "testRequest->setRspError() %{public}d", testResponseSetError);
    OH_LOG_INFO(LOG_APP, "testRequest->setStatus() %{public}d", testResponseSetStatus);
    OH_LOG_INFO(LOG_APP, "testRequest->setStatusText() %{public}d", testResponseSetStatusText);
    OH_LOG_INFO(LOG_APP, "testRequest->setMimeType() %{public}d", testResponseSetMimeType);
    OH_LOG_INFO(LOG_APP, "testRequest->setCharset() %{public}d", testResponseSetCharSet);
    OH_LOG_INFO(LOG_APP, "testRequest->setHeaderByName() %{public}d", testResponseSetHost);

    void* userdata = OH_ArkWebSchemeHandler_GetUserData(schemeHandler);
    int* getValue = static_cast<int*>(userdata);
    if (userdata) {
        testSchemeHandlerGetUserData = true;
    }

    void* resourceUserData = OH_ArkWebResourceRequest_GetUserData(resourceRequest);
    if (resourceUserData) {
        testResourceRequestGetUserData = true;
    }

    OH_LOG_INFO(LOG_APP, "OH_ArkWebSchemeHandler_GetUserData %{public}d", *getValue);
    OH_LOG_INFO(LOG_APP, "OH_ArkWebSchemeHandler_SetUserData %{public}d", testSchemeHandlerSetUserData);

    OH_LOG_INFO(LOG_APP, "OH_ArkWebResourceRequest_GetUserData %{public}d", testResourceRequestGetUserData);
    OH_LOG_INFO(LOG_APP, "OH_ArkWebResourceRequest_SetUserData %{public}d", testResourceRequestSetUserData);
}

void OnURLRequestStartForSW(const ArkWeb_SchemeHandler *schemeHandler, ArkWeb_ResourceRequest *resourceRequest,
                            const ArkWeb_ResourceHandler *resourceHandler, bool *intercept)
{
    OH_LOG_INFO(LOG_APP, "OnURLRequestStartForSW");
}

void OnURLRequestStop(const ArkWeb_SchemeHandler *schemeHandler, const ArkWeb_ResourceRequest *request)
{
    OH_LOG_INFO(LOG_APP, "OnURLRequestStop");

    if (!request) {
        return;
    }

    TestRequest* testRequest = (TestRequest*)OH_ArkWebResourceRequest_GetUserData(request);
    if (testRequest) {
        testRequest->Stop();
        testResourceRequestDestroy = testRequest->resourceRequestDestroy();
    }
}

void OnURLRequestStopForSW(const ArkWeb_SchemeHandler *schemeHandler, const ArkWeb_ResourceRequest *request)
{
    if (!request) {
        return;
    }
}

static napi_value DestroySchemeHandler(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_ArkWeb_DestroySchemeHandler(g_schemeHandler);
    napi_create_int32(env, 0, &result);

    return result;
}

static napi_value GetNativeAPI(napi_env env, napi_callback_info info)
{
    napi_value result;
    ArkWeb_AnyNativeAPI* api = OH_ArkWeb_GetNativeAPI(ARKWEB_NATIVE_CONTROLLER);
    size_t api_size = api->size;
    napi_create_int32(env, api_size, &result);

    return result;
}

static napi_value SetSchemeHandler(napi_env env, napi_callback_info info)
{
    //  创建一个处理器
    OH_LOG_INFO(LOG_APP, "OH_ArkWeb_CreateSchemeHandler");

    OH_ArkWeb_CreateSchemeHandler(&g_schemeHandler);

    OH_LOG_INFO(LOG_APP, "OH_ArkWeb_CreateSchemeHandler");
    OH_ArkWeb_CreateSchemeHandler(&g_scheme_handler_for_service_worker);

    // 给SchemeHandler创建回调函数
    int32_t ret = OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandler, OnURLRequestStart);
    if (ret != ARKWEB_NET_OK) {
        return nullptr;
    }
    OH_LOG_INFO(LOG_APP, "OH_ArkWebSchemeHandler_SetOnRequestStart %{public}d", ret);

    ret = OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandler, OnURLRequestStop);
    if (ret != ARKWEB_NET_OK) {
        return nullptr;
    }
    OH_LOG_INFO(LOG_APP, "OH_ArkWebSchemeHandler_SetOnRequestStop %{public}d", ret);

    ret = OH_ArkWebSchemeHandler_SetOnRequestStart(g_scheme_handler_for_service_worker, OnURLRequestStartForSW);
    if (ret != ARKWEB_NET_OK) {
        return nullptr;
    }
    OH_LOG_INFO(LOG_APP, "OH_ArkWebSchemeHandler_SetOnRequestStart service_worker %{public}d", ret);

    ret = OH_ArkWebSchemeHandler_SetOnRequestStop(g_scheme_handler_for_service_worker, OnURLRequestStopForSW);
    if (ret != ARKWEB_NET_OK) {
        return nullptr;
    }
    OH_LOG_INFO(LOG_APP, "OH_ArkWebSchemeHandler_SetOnRequestStop service_worker %{public}d", ret);

    bool isSuccess1 = false;
    bool isSuccess2 = false;

    // 设置SchemeHandler到内核.
    isSuccess1 = OH_ArkWeb_SetSchemeHandler("custom", "scheme-handler", g_schemeHandler);
    isSuccess2 = OH_ArkWebServiceWorker_SetSchemeHandler("custom", g_scheme_handler_for_service_worker);

    OH_LOG_INFO(LOG_APP, "OH_ArkWeb_SetSchemeHandler");
    OH_LOG_INFO(LOG_APP, "OH_ArkWebServiceWorker_SetSchemeHandler");

    napi_value result;

    if (isSuccess1 && isSuccess2) {
        napi_create_int32(env, 0, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }

    return result;
}

static napi_value InitResourceManager(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value argv[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    g_resourceManager = OH_ResourceManager_InitNativeResourceManager(env, argv[0]);
    OH_LOG_INFO(LOG_APP, "InitResourceManager");

    return nullptr;
}

static napi_value GetUrl(napi_env env, napi_callback_info info)
{
    napi_value result;
    if (testUrl == "custom://www.example.com/isolated_script.js") {
        napi_create_int32(env, 0, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

static napi_value GetMethod(napi_env env, napi_callback_info info)
{
    napi_value result;
    if (testMethod == "GET") {
        napi_create_int32(env, 0, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

static napi_value GetHttpBodyStream(napi_env env, napi_callback_info info)
{
    napi_value result;
    if (testGetHttpBodyStream) {
        napi_create_int32(env, 0, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

static napi_value GetHeaderListSize(napi_env env, napi_callback_info info)
{
    napi_value result;
    if (testHeaderSize != 0) {
        napi_create_int32(env, 0, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

static napi_value GetHeader(napi_env env, napi_callback_info info)
{
    napi_value result;
    if (testHasHeader) {
        napi_create_int32(env, 0, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

static napi_value GetRef(napi_env env, napi_callback_info info)
{
    napi_value result;
    if (testRef == "") {
        napi_create_int32(env, 0, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

static napi_value DestroyHeaderList(napi_env env, napi_callback_info info)
{
    napi_value result;
    if (testDestroyHeaderList) {
        napi_create_int32(env, 0, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

static napi_value HasGesture(napi_env env, napi_callback_info info)
{
    napi_value result;
    if (!testHasGesture) {
        napi_create_int32(env, 0, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

static napi_value IsMainFrame(napi_env env, napi_callback_info info)
{
    napi_value result;
    if (!testIsMainFrame) {
        napi_create_int32(env, 0, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

static napi_value IsRedirect(napi_env env, napi_callback_info info)
{
    napi_value result;
    if (!testIsRedirect) {
        napi_create_int32(env, 0, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

static napi_value SchemeHandlerGetUserData(napi_env env, napi_callback_info info)
{
    napi_value result;
    if (testSchemeHandlerGetUserData) {
        napi_create_int32(env, 0, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

static napi_value SchemeHandlerSetUserData(napi_env env, napi_callback_info info)
{
    napi_value result;
    if (testSchemeHandlerSetUserData == 0) {
        napi_create_int32(env, 0, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

static napi_value ResourceRequestGetUserData(napi_env env, napi_callback_info info)
{
    napi_value result;
    if (testResourceRequestGetUserData) {
        napi_create_int32(env, 0, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

static napi_value ResourceRequestSetUserData(napi_env env, napi_callback_info info)
{
    napi_value result;
    if (testResourceRequestSetUserData == 0) {
        napi_create_int32(env, 0, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

static napi_value ResourceRequestDestroy(napi_env env, napi_callback_info info)
{
    napi_value result;
    if (testResourceRequestDestroy == 0) {
        napi_create_int32(env, 0, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

static napi_value ResponseGetUrl(napi_env env, napi_callback_info info)
{
    napi_value result;
    if (testResponseUrl == "") {
        napi_create_int32(env, 0, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

static napi_value ResponseGetError(napi_env env, napi_callback_info info)
{
    napi_value result;
    if (testResponseError == 0) {
        napi_create_int32(env, 0, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

static napi_value ResponseGetStatus(napi_env env, napi_callback_info info)
{
    napi_value result;
    if (testResponseStatus == NOT_FOUND || testResponseStatus == OK) {
        napi_create_int32(env, 0, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

static napi_value ResponseGetStatusText(napi_env env, napi_callback_info info)
{
    napi_value result;
    // 与SetStatusText对应
    if (testResponseStatusText == "not found" || testResponseStatusText == "ok") {
        napi_create_int32(env, 0, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

static napi_value ResponseGetMimeType(napi_env env, napi_callback_info info)
{
    napi_value result;
    if (testResponseMimeType == "text/javascript") {
        napi_create_int32(env, 0, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

static napi_value ResponseGetCharSet(napi_env env, napi_callback_info info)
{
    napi_value result;
    if (testResponseCharSet == "UTF-8") {
        napi_create_int32(env, 0, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

static napi_value ResponseGetHeaderByName(napi_env env, napi_callback_info info)
{
    napi_value result;
    if (testResponseHost == "") {
        napi_create_int32(env, 0, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

static napi_value ResponseSetUrl(napi_env env, napi_callback_info info)
{
    napi_value result;
    if (testResponseSetUrl == 0) {
        napi_create_int32(env, 0, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

static napi_value ResponseSetError(napi_env env, napi_callback_info info)
{
    napi_value result;
    if (testResponseSetError == 0) {
        napi_create_int32(env, 0, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

static napi_value ResponseSetStatus(napi_env env, napi_callback_info info)
{
    napi_value result;
    if (testResponseSetStatus == 0) {
        napi_create_int32(env, 0, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

static napi_value ResponseSetStatusText(napi_env env, napi_callback_info info)
{
    napi_value result;
    if (testResponseSetStatusText == 0) {
        napi_create_int32(env, 0, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

static napi_value ResponseSetMimeType(napi_env env, napi_callback_info info)
{
    napi_value result;
    if (testResponseSetMimeType == 0) {
        napi_create_int32(env, 0, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

static napi_value ResponseSetCharSet(napi_env env, napi_callback_info info)
{
    napi_value result;
    if (testResponseSetCharSet == 0) {
        napi_create_int32(env, 0, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

static napi_value ResponseSetHeaderByName(napi_env env, napi_callback_info info)
{
    napi_value result;
    if (testResponseSetHost == 0) {
        napi_create_int32(env, 0, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

static napi_value CreateResponse(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_LOG_ERROR(LOG_APP, "OH_ArkWeb_CreateResponse napi_value ");

    ArkWeb_Response* testResponse;
    try {
        OH_ArkWeb_CreateResponse(&testResponse);
        OH_ArkWeb_DestroyResponse(testResponse);
        OH_LOG_INFO(LOG_APP, "OH_ArkWeb_CreateResponse create");
        napi_create_int32(env, 0, &result);
    } catch (std::exception& e) {
        OH_LOG_ERROR(LOG_APP, "OH_ArkWeb_CreateResponse ERROR %{public}s", e.what());
        napi_create_int32(env, -1, &result);
    }
    return result;
}

static napi_value GetResourceType(napi_env env, napi_callback_info info)
{
    napi_value result;
    if (testResourceType != DEFAULT_TYPE) {
        napi_create_int32(env, 0, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

static napi_value GetFrameUrl(napi_env env, napi_callback_info info)
{
    napi_value result;
    if (testFrameUrl != "test") {
        napi_create_int32(env, 0, &result);
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
        {"registerCustomSchemes", nullptr, RegisterCustomSchemes, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"clearSchemeHandlers", nullptr, ClearSchemeHandlers, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"serviceWorkerClearSchemeHandlers", nullptr, ServiceWorkerClearSchemeHandlers, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"destroySchemeHandler", nullptr, DestroySchemeHandler, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getNativeAPI", nullptr, GetNativeAPI, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"initResourceManager", nullptr, InitResourceManager, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getUrl", nullptr, GetUrl, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getMethod", nullptr, GetMethod, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getRef", nullptr, GetRef, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getHttpBodyStream", nullptr, GetHttpBodyStream, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getHeaderListSize", nullptr, GetHeaderListSize, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getHeader", nullptr, GetHeader, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"destroyHeaderList", nullptr, DestroyHeaderList, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hasGesture", nullptr, HasGesture, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"isMainFrame", nullptr, IsMainFrame, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"isRedirect", nullptr, IsRedirect, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"schemeHandlerGetUserData", nullptr, SchemeHandlerGetUserData, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"schemeHandlerSetUserData", nullptr, SchemeHandlerSetUserData, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"resourceRequestGetUserData", nullptr, ResourceRequestGetUserData, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"resourceRequestSetUserData", nullptr, ResourceRequestSetUserData, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"resourceRequestDestroy", nullptr, ResourceRequestDestroy, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"responseGetUrl", nullptr, ResponseGetUrl, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"responseGetError", nullptr, ResponseGetError, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"responseGetStatus", nullptr, ResponseGetStatus, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"responseGetStatusText", nullptr, ResponseGetStatusText, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"responseGetMimeType", nullptr, ResponseGetMimeType, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"responseGetCharset", nullptr, ResponseGetCharSet, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"responseGetHeaderByName", nullptr, ResponseGetHeaderByName, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"responseSetUrl", nullptr, ResponseSetUrl, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"responseSetError", nullptr, ResponseSetError, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"responseSetStatus", nullptr, ResponseSetStatus, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"responseSetStatusText", nullptr, ResponseSetStatusText, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"responseSetMimeType", nullptr, ResponseSetMimeType, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"responseSetCharset", nullptr, ResponseSetCharSet, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"responseSetHeaderByName", nullptr, ResponseSetHeaderByName, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"createResponse", nullptr, CreateResponse, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getResourceType", nullptr, GetResourceType, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getFrameUrl", nullptr, GetFrameUrl, nullptr, nullptr, nullptr, napi_default, nullptr}
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

