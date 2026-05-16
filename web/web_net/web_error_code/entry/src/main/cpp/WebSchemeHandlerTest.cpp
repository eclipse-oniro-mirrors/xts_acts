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

#include <map>
#include <cstring>
#include "WebSchemeHandlerTest.h"
#include "WebTestUtils.h"
#include "WebRequestTest.h"
#include "web/arkweb_scheme_handler.h"
#include "web/arkweb_net_error_list.h"
#include "rawfile/raw_file_manager.h"
#include <web/arkweb_interface.h>
#include <hilog/log.h>

using ArkWebHandlerFunc = napi_value (*)(napi_env, napi_callback_info);
ArkWeb_SchemeHandler *g_schemeHandler;
ArkWeb_SchemeHandler *g_schemeHandlerForSW;
NativeResourceManager *g_resourceManager;
int32_t g_testRequestStop = -1;
int32_t g_testSetAsyncReadCallback = -1;
const int BUFF_LEN = 5;

namespace  {
    static int g_registerCustomSchemes = -1;
};

ArkWeb_CustomSchemeOption GetSchemeOptionByName(const std::string name)
{
    std::map<std::string, ArkWeb_CustomSchemeOption> optionMap = {
        {"OH_ARKWEB_SCHEME_OPTION_NONE", OH_ARKWEB_SCHEME_OPTION_NONE},
        {"ARKWEB_SCHEME_OPTION_SECURE", ARKWEB_SCHEME_OPTION_SECURE},
        {"ARKWEB_SCHEME_OPTION_CODE_CACHE_ENABLED", ARKWEB_SCHEME_OPTION_CODE_CACHE_ENABLED},
    };

    auto it = optionMap.find(name);
    if (it != optionMap.end()) {
        return OH_ARKWEB_SCHEME_OPTION_NONE;
    }

    return it->second;
}

const std::map<std::string, ArkWebHandlerFunc> FunctionMap = {
    {"OH_ArkWebResourceRequest_SetUserData_ARKWEB_NET_OK", ArkWebResourceRequestSetUserDataOK},
    {"OH_ArkWebResourceRequest_SetUserData_ARKWEB_INVALID_PARAM", ArkWebResourceRequestSetUserDataInvalidParam},
    {"OH_ArkWebHttpBodyStream_SetUserData_ARKWEB_NET_OK", ArkWebHttpBodyStreamSetReadCallbackOK},
    {"OH_ArkWebHttpBodyStream_SetUserData_ARKWEB_INVALID_PARAM", ArkWebHttpBodyStreamSetUserDataInvalidParam},
    {"OH_ArkWebHttpBodyStream_SetReadCallback_ARKWEB_NET_OK", ArkWebHttpBodyStreamSetReadCallbackOK},
    {"OH_ArkWebHttpBodyStream_SetReadCallback_ARKWEB_INVALID_PARAM", ArkWebHttpBodyStreamSetReadCallbackInvalidParam},
    {"OH_ArkWebHttpBodyStream_SetAsyncReadCallback_ARKWEB_NET_OK", ArkWebHttpBodyStreamSetReadCallbackOK},
    {"OH_ArkWebHttpBodyStream_SetAsyncReadCallback_ARKWEB_INVALID_PARAM",
        ArkWebHttpBodyStreamSetAsyncReadCallbackInvalidParam},
    {"OH_ArkWebHttpBodyStream_Init_ARKWEB_NET_OK", ArkWebHttpBodyStreamSetReadCallbackOK},
    {"OH_ArkWebHttpBodyStream_Init_ARKWEB_INVALID_PARAM", ArkWebHttpBodyStreamInitInvalidParam},
    {"OH_ArkWeb_RegisterCustomSchemes_ARKWEB_NET_OK", ArkWebRegisterCustomSchemesOK},
    {"OH_ArkWebHttpBodyStream_AsyncRead_API", ArkWebHttpBodyStreamAsyncRead},
    {"OH_ArkWebResourceRequest_Destroy_ARKWEB_NET_OK", ArkWebHttpBodyStreamSetReadCallbackOK},
    {"OH_ArkWebResourceRequest_Destroy_ARKWEB_INVALID_PARAM", ArkWebResourceRequestDestroyInvalidParam},
    {"OH_ArkWebResourceHandler_Destroy_ARKWEB_NET_OK", ArkWebHttpBodyStreamSetReadCallbackOK},
    {"OH_ArkWebResourceHandler_DidReceiveResponse_ARKWEB_NET_OK", ArkWebHttpBodyStreamSetReadCallbackOK},
    {"OH_ArkWebResourceHandler_DidReceiveData_ARKWEB_NET_OK", ArkWebHttpBodyStreamSetReadCallbackOK},
    {"OH_ArkWebResourceHandler_DidFinish_ARKWEB_NET_OK", ArkWebHttpBodyStreamSetReadCallbackOK},
    {"OH_ArkWebResourceHandler_DidFailWithError_ARKWEB_NET_OK", ArkWebHttpBodyStreamSetReadCallbackOK},
    {"OH_ArkWebResourceHandler_DidFailWithErrorV2_ARKWEB_NET_OK", ArkWebHttpBodyStreamSetReadCallbackOK},
};

napi_value RequestStop(napi_env env, napi_callback_info info)
{
    napi_value result;
    int ret = -1;
    if (g_testRequestStop == 1) {
        ret = 1;
    }
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value SetAsyncReadCallback(napi_env env, napi_callback_info info)
{
    napi_value result;
    int ret = -1;
    if (g_testSetAsyncReadCallback == 1) {
        ret = 1;
    }
    napi_create_int32(env, 1, &result);
    return result;
}

napi_value SetSchemeHandler(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "set scheme handler");

    OH_ArkWeb_CreateSchemeHandler(&g_schemeHandler);
    OH_ArkWeb_CreateSchemeHandler(&g_schemeHandlerForSW);

    int ret = OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandler, OnURLRequestStart);
    OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandler, OnURLRequestStop);
    OH_ArkWebSchemeHandler_SetOnRequestStart(g_schemeHandlerForSW, OnURLRequestStart);
    OH_ArkWebSchemeHandler_SetOnRequestStop(g_schemeHandlerForSW, OnURLRequestStop);

    OH_ArkWeb_SetSchemeHandler("custom", "web1211", g_schemeHandler);
    OH_ArkWeb_SetSchemeHandler("custom-csp-bypassing", "web1211", g_schemeHandler);
    OH_ArkWeb_SetSchemeHandler("custom-isolated", "web1211", g_schemeHandler);
    OH_ArkWeb_SetSchemeHandler("custom-local", "web1211", g_schemeHandler);
    OH_ArkWeb_SetSchemeHandler("http", "web1211", g_schemeHandler);
    OH_ArkWeb_SetSchemeHandler("https", "web1211", g_schemeHandler);

    OH_ArkWebServiceWorker_SetSchemeHandler("https", g_schemeHandlerForSW);
    OH_ArkWebServiceWorker_SetSchemeHandler("http", g_schemeHandlerForSW);
    
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value InitResourceManager(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value argv[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    g_resourceManager = OH_ResourceManager_InitNativeResourceManager(env, argv[0]);
    return nullptr;
}

void OnURLRequestStart(const ArkWeb_SchemeHandler *schemeHandler, ArkWeb_ResourceRequest *resourceRequest,
                       const ArkWeb_ResourceHandler *resourceHandler, bool *intercept)
{
    OH_LOG_INFO(LOG_APP, "OnURLRequestStart");
    WebRequestTest* testRequest = new WebRequestTest(resourceRequest, resourceHandler, g_resourceManager);
    OH_ArkWebResourceRequest_SetUserData(resourceRequest, testRequest);
    testRequest->Start();
}

void OnURLRequestStop(const ArkWeb_SchemeHandler *schemeHandler, const ArkWeb_ResourceRequest *request)
{
    if (!request) {
        OH_LOG_ERROR(LOG_APP, "on request stop request is nullptr.");
        return;
    }

    WebRequestTest *testRequest = (WebRequestTest *)OH_ArkWebResourceRequest_GetUserData(request);
    if (testRequest) {
        g_testSetAsyncReadCallback = testRequest->GetAsyncReadCallback();
        testRequest->Stop();
        delete testRequest;
    }
    g_testRequestStop = 1;
}

napi_value RegisterCustomSchemes(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "register custom schemes");
    int ret =
        OH_ArkWeb_RegisterCustomSchemes("custom", ARKWEB_SCHEME_OPTION_STANDARD | ARKWEB_SCHEME_OPTION_CORS_ENABLED);
    if (ret == ARKWEB_NET_OK) {
        g_registerCustomSchemes = ARKWEB_NET_OK;
    }

    OH_ArkWeb_RegisterCustomSchemes("custom-local", ARKWEB_SCHEME_OPTION_LOCAL);
    OH_ArkWeb_RegisterCustomSchemes("custom-csp-bypassing",
                                    ARKWEB_SCHEME_OPTION_CSP_BYPASSING | ARKWEB_SCHEME_OPTION_STANDARD);
    OH_ArkWeb_RegisterCustomSchemes("custom-isolated", ARKWEB_SCHEME_OPTION_DISPLAY_ISOLATED);
    return nullptr;
}

napi_value WebRegisterCustomSchemes(napi_env env, napi_callback_info info)
{
    auto param = WebTestUtils::GetArgsOneParameter(env, info);
    ArkWeb_CustomSchemeOption optionEnum = GetSchemeOptionByName(param.get());
    int ret = OH_ArkWeb_RegisterCustomSchemes("custom1", optionEnum);
    if (ret == ARKWEB_SCHEME_REGISTER_FAILED) {
        ret = 0;
    }
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value ArkWebResourceRequestSetUserDataOK(napi_env env, napi_callback_info info)
{
    ArkWeb_ResourceRequest *resourceRequest;
    ArkWeb_ResourceHandler *resourceHandler;
    WebRequestTest* testRequest = new WebRequestTest(resourceRequest, resourceHandler, g_resourceManager);
    napi_value result;
    int ret = -1;
    int32_t retSetUserData = OH_ArkWebResourceRequest_SetUserData(resourceRequest, testRequest);
    if (retSetUserData == ARKWEB_NET_OK) {
        ret = 0;
    }
    napi_create_int32(env, 0, &result);
    return result;
}

napi_value ArkWebResourceRequestSetUserDataInvalidParam(napi_env env, napi_callback_info info)
{
    ArkWeb_ResourceRequest *resourceRequest;
    napi_value result;
    int ret = -1;
    int32_t retSetUserData = OH_ArkWebResourceRequest_SetUserData(resourceRequest, nullptr);
    if (retSetUserData == ARKWEB_INVALID_PARAM) {
        ret = 0;
    }
    napi_create_int32(env, 0, &result);
    return result;
}

napi_value WebSchemeHandlerProcess(napi_env env, napi_callback_info info)
{
    auto parmaters = WebTestUtils::GetArgsTwoParameters(env, info);
    std::string key;
    key.append(parmaters.first.get());
    key.append("_");
    key.append(parmaters.second.get());
    auto it = FunctionMap.find(key);
    if (it != FunctionMap.end()) {
        return it->second(env, info);
    } else {
        OH_LOG_ERROR(LOG_APP, "ArkWebTest WebSchemeHandlerProcess find %{public}s failed....", key.c_str());
    }

    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

napi_value ArkWebHttpBodyStreamSetUserDataInvalidParam(napi_env env, napi_callback_info info)
{
    int ret = -1;
    int data = 0;
    int32_t retSetUserData = OH_ArkWebHttpBodyStream_SetUserData(nullptr, static_cast<void*>(&data));
    if (retSetUserData == ARKWEB_INVALID_PARAM) {
        ret = 0;
    }

    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value ArkWebHttpBodyStreamSetReadCallbackOK(napi_env env, napi_callback_info info)
{
    napi_value result = SetSchemeHandler(env, info);
    return result;
}

napi_value ArkWebHttpBodyStreamSetReadCallbackInvalidParam(napi_env env, napi_callback_info info)
{
    int ret = -1;
    ArkWeb_HttpBodyStream *stream_{nullptr};
    int retCallBack = OH_ArkWebHttpBodyStream_SetReadCallback(stream_, nullptr);
    if (retCallBack == ARKWEB_INVALID_PARAM) {
        ret = 0;
    }

    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

void readCallback(const ArkWeb_HttpBodyStream *httpBodyStream, uint8_t *buffer, int bytesRead)
{
    httpBodyStream = nullptr;
    buffer = nullptr;
    bytesRead = 0;
}

napi_value ArkWebHttpBodyStreamSetAsyncReadCallbackInvalidParam(napi_env env, napi_callback_info info)
{
    napi_value result;
    int ret = -1;
    ArkWeb_HttpBodyStream *httpBodyStream = nullptr;
    int retCallBack = OH_ArkWebHttpBodyStream_SetAsyncReadCallback(httpBodyStream, readCallback);
    if (retCallBack == ARKWEB_INVALID_PARAM) {
        ret = 0;
    }
    napi_create_int32(env, ret, &result);
    return result;
}

void InitcallBack(const ArkWeb_HttpBodyStream* httpBodyStream, ArkWeb_NetError result)
{
    httpBodyStream = nullptr;
    result = ARKWEB_NET_OK;
};

napi_value ArkWebHttpBodyStreamInitInvalidParam(napi_env env, napi_callback_info info)
{
    napi_value result;
    ArkWeb_HttpBodyStream* httpBodyStream = nullptr;
    int ret = -1;
    int retInit = OH_ArkWebHttpBodyStream_Init(httpBodyStream, InitcallBack);
    if (retInit == ARKWEB_INVALID_PARAM) {
        ret = 0;
    }
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value ArkWebRegisterCustomSchemesOK(napi_env env, napi_callback_info info)
{
    napi_value result;
    int ret = -1;
    if (g_registerCustomSchemes == ARKWEB_NET_OK) {
        ret = 0;
    }
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value ArkWebHttpBodyStreamAsyncRead(napi_env env, napi_callback_info info)
{
    napi_value result;
    int ret = -1;

    const ArkWeb_HttpBodyStream* httpBodyStream1 = nullptr;
    uint8_t buffer[256] = {0};
    int bufLen = sizeof(buffer);
    OH_ArkWebHttpBodyStream_Read(httpBodyStream1, buffer, bufLen);
    OH_ArkWebHttpBodyStream_AsyncRead(httpBodyStream1, buffer, bufLen);
    
    bool isEof = OH_ArkWebHttpBodyStream_IsEof(httpBodyStream1);
    if (isEof == false) {
        OH_LOG_INFO(LOG_APP, "ArkWebTest  OH_ArkWebHttpBodyStream_IsEof:%{public}d", isEof);
        ret = 0;
    }
    
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value ArkWebResourceRequestDestroyInvalidParam(napi_env env, napi_callback_info info)
{
    int ret = -1;
    int retDestory = OH_ArkWebResourceRequest_Destroy(nullptr);
    if (retDestory == ARKWEB_INVALID_PARAM) {
        ret = 0;
    }

    napi_value result;
    napi_create_int32(env, 0, &result);
    return result;
}
