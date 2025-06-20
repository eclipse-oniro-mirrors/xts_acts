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
#include "rawfile/raw_file_manager.h"
#include "web/arkweb_scheme_handler.h"
#include <bits/alltypes.h>
#include <web/arkweb_interface.h>
#include <map>
#include <string>

#undef LOG_TAG
#define LOG_TAG "ss-handler"

ArkWeb_SchemeHandler *g_schemeHandler;
ArkWeb_SchemeHandler *g_schemeHandlerForSW;
NativeResourceManager *g_resourceManager;

std::map<int, std::string> testRequestTypeMap;

int32_t testFrameUrl = -1;
int32_t testServiceWorkerFrameUrl = -1;
int32_t testLoadUrlFrameUrl = -1;
int32_t testSubFrameUrl = -1;


// 注册三方协议的配置，需要在Web内核初始化之前调用，否则会注册失败。
static napi_value RegisterCustomSchemes(napi_env env, napi_callback_info info) 
{
    OH_LOG_INFO(LOG_APP, "register custom schemes");
    OH_ArkWeb_RegisterCustomSchemes("custom",  ARKWEB_SCHEME_OPTION_DISPLAY_ISOLATED
    | ARKWEB_SCHEME_OPTION_FETCH_ENABLED | ARKWEB_SCHEME_OPTION_CORS_ENABLED | ARKWEB_SCHEME_OPTION_CSP_BYPASSING);

    return nullptr;
}

// 请求开始的回调，在该函数中我们创建一个RawfileRequest来实现对Web内核请求的拦截。
void OnURLRequestStart(const ArkWeb_SchemeHandler *schemeHandler, ArkWeb_ResourceRequest *resourceRequest,
                       const ArkWeb_ResourceHandler *resourceHandler, bool *intercept) 
{
    *intercept = false;
    int32_t reType = OH_ArkWebResourceRequest_GetResourceType(resourceRequest);
    
    char* url;
    OH_ArkWebResourceRequest_GetUrl(resourceRequest, &url);
    std::string url1(url);
    testRequestTypeMap[reType] = url1;
    
    OH_ArkWebSchemeHandler_GetUserData(schemeHandler);
    
    char* frameUrl;
    OH_ArkWebResourceRequest_GetFrameUrl(resourceRequest, &frameUrl);
    std::string frameUrl1(frameUrl);
    OH_LOG_INFO(LOG_APP, "OH_ArkWebResourceRequest_GetFrameUrl %{public}s.", frameUrl1.c_str());
    
    if (reType == MAIN_FRAME && frameUrl1 == "") {
        OH_LOG_INFO(LOG_APP, "resourceType == MAIN_FRAME && frameUrl1 is blank");
        testFrameUrl = 0;
    }
    
    if (reType == SERVICE_WORKER || frameUrl1.find("iqiyi.com") != std::string::npos) {
        OH_LOG_INFO(LOG_APP, "resourceType == SERVICE_WORKER || frameUrl1.find is blank");
        testServiceWorkerFrameUrl = 0;
    }
    
    if (url1.find("schemeHandler_loader") != std::string::npos && frameUrl1 == "") {
        OH_LOG_INFO(LOG_APP, "schemeHandler_loader isLoadFrameUrl");
        testLoadUrlFrameUrl = 0;
    }
    
    if (frameUrl1.find("sdkSchemeHandler") != std::string::npos) {
        OH_LOG_INFO(LOG_APP, "sdkSchemeHandler isLoadFrameUrl");
        testSubFrameUrl = 0;
    }
}

// 请求结束的回调，在该函数中我们需要标记RawfileRequest已经结束了，内部不应该再使用ResourceHandler。
void OnURLRequestStop(const ArkWeb_SchemeHandler *schemeHandler, const ArkWeb_ResourceRequest *request) 
{
    if (!request) {
        OH_LOG_INFO(LOG_APP, "on request stop request is nullptr.");
        return;
    }
    OH_ArkWebServiceWorker_ClearSchemeHandlers();
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
    OH_ArkWeb_SetSchemeHandler("https", "scheme-handler", g_schemeHandler);
    OH_ArkWeb_SetSchemeHandler("http", "scheme-handler", g_schemeHandler);
    
    OH_ArkWebServiceWorker_SetSchemeHandler("https", g_schemeHandlerForSW);
    
    OH_ArkWeb_SetSchemeHandler("resource", "scheme-handler", g_schemeHandler);
    OH_ArkWebServiceWorker_SetSchemeHandler("resource", g_schemeHandlerForSW);
    
    return nullptr;
}

static napi_value InitResourceManager(napi_env env, napi_callback_info info) 
{
    size_t argc = 2;
    napi_value argv[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    g_resourceManager = OH_ResourceManager_InitNativeResourceManager(env, argv[0]);
    return nullptr;
}

static int32_t checkResourceType(ArkWeb_ResourceType rType, int& typeNumber, std::map<int, std::string>& TypeMap)
{
    int32_t result = 0;
    auto it = TypeMap.find(rType);
    if(it != TypeMap.end()) {
        OH_LOG_INFO(LOG_APP, "ResourceType: %{public}d, %{public}s.", rType, TypeMap[rType].c_str());
        result = 0;
    } else {
        if(rType != typeNumber) {
            result = -1;
        } else {
            result = 0;
        }
    }
    return result;
}

static napi_value GetResourceType_MAIN_FRAME(napi_env env, napi_callback_info info)
{
    ArkWeb_ResourceType rType = MAIN_FRAME;
    int32_t typeNumber = 0;
    napi_value result;
    int32_t isCheck = checkResourceType(rType, typeNumber, testRequestTypeMap);
    napi_create_int32(env, isCheck, &result);
    return result;
}

static napi_value GetResourceType_SUB_FRAME(napi_env env, napi_callback_info info)
{
    ArkWeb_ResourceType rType = SUB_FRAME;
    int32_t typeNumber = 1;
    napi_value result;
    int32_t isCheck = checkResourceType(rType, typeNumber, testRequestTypeMap);
    napi_create_int32(env, isCheck, &result);
    return result;
}

static napi_value GetResourceType_STYLE_SHEET(napi_env env, napi_callback_info info)
{
    ArkWeb_ResourceType rType = STYLE_SHEET;
    int32_t typeNumber = 2;
    napi_value result;
    int32_t isCheck = checkResourceType(rType, typeNumber, testRequestTypeMap);
    napi_create_int32(env, isCheck, &result);
    return result;
}

static napi_value GetResourceType_SCRIPT(napi_env env, napi_callback_info info)
{
    ArkWeb_ResourceType rType = SCRIPT;
    int32_t typeNumber = 3;
    napi_value result;
    int32_t isCheck = checkResourceType(rType, typeNumber, testRequestTypeMap);
    napi_create_int32(env, isCheck, &result);
    return result;
}

static napi_value GetResourceType_IMAGE(napi_env env, napi_callback_info info)
{
    ArkWeb_ResourceType rType = IMAGE;
    int32_t typeNumber = 4;
    napi_value result;
    int32_t isCheck = checkResourceType(rType, typeNumber, testRequestTypeMap);
    napi_create_int32(env, isCheck, &result);
    return result;
}

static napi_value GetResourceType_FONT_RESOURCE(napi_env env, napi_callback_info info)
{
    ArkWeb_ResourceType rType = FONT_RESOURCE;
    int32_t typeNumber = 5;
    napi_value result;
    int32_t isCheck = checkResourceType(rType, typeNumber, testRequestTypeMap);
    napi_create_int32(env, isCheck, &result);
    return result;
}

static napi_value GetResourceType_SUB_RESOURCE(napi_env env, napi_callback_info info)
{
    ArkWeb_ResourceType rType = SUB_RESOURCE;
    int32_t typeNumber = 6;
    napi_value result;
    int32_t isCheck = checkResourceType(rType, typeNumber, testRequestTypeMap);
    napi_create_int32(env, isCheck, &result);
    return result;
}

static napi_value GetResourceType_OBJECT(napi_env env, napi_callback_info info)
{
    ArkWeb_ResourceType rType = OBJECT;
    int32_t typeNumber = 7;
    napi_value result;
    int32_t isCheck = checkResourceType(rType, typeNumber, testRequestTypeMap);
    napi_create_int32(env, isCheck, &result);
    return result;
}

static napi_value GetResourceType_MEDIA(napi_env env, napi_callback_info info)
{
    ArkWeb_ResourceType rType = MEDIA;
    int32_t typeNumber = 8;
    napi_value result;
    int32_t isCheck = checkResourceType(rType, typeNumber, testRequestTypeMap);
    napi_create_int32(env, isCheck, &result);
    return result;
}

static napi_value GetResourceType_WORKER(napi_env env, napi_callback_info info)
{
    ArkWeb_ResourceType rType = WORKER;
    int32_t typeNumber = 9;
    napi_value result;
    int32_t isCheck = checkResourceType(rType, typeNumber, testRequestTypeMap);
    napi_create_int32(env, isCheck, &result);
    return result;
}

static napi_value GetResourceType_SHARED_WORKER(napi_env env, napi_callback_info info)
{
    ArkWeb_ResourceType rType = SHARED_WORKER;
    int32_t typeNumber = 10;
    napi_value result;
    int32_t isCheck = checkResourceType(rType, typeNumber, testRequestTypeMap);
    napi_create_int32(env, isCheck, &result);
    return result;
}

static napi_value GetResourceType_PREFETCH(napi_env env, napi_callback_info info)
{
    ArkWeb_ResourceType rType = PREFETCH;
    int32_t typeNumber = 11;
    napi_value result;
    int32_t isCheck = checkResourceType(rType, typeNumber, testRequestTypeMap);
    napi_create_int32(env, isCheck, &result);
    return result;
}

static napi_value GetResourceType_FAVICON(napi_env env, napi_callback_info info)
{
    ArkWeb_ResourceType rType = FAVICON;
    int32_t typeNumber = 12;
    napi_value result;
    int32_t isCheck = checkResourceType(rType, typeNumber, testRequestTypeMap);
    napi_create_int32(env, isCheck, &result);
    return result;
}

static napi_value GetResourceType_XHR(napi_env env, napi_callback_info info)
{
    ArkWeb_ResourceType rType = XHR;
    int32_t typeNumber = 13;
    napi_value result;
    int32_t isCheck = checkResourceType(rType, typeNumber, testRequestTypeMap);
    napi_create_int32(env, isCheck, &result);
    return result;
}

static napi_value GetResourceType_PING(napi_env env, napi_callback_info info)
{
    ArkWeb_ResourceType rType = PING;
    int32_t typeNumber = 14;
    napi_value result;
    int32_t isCheck = checkResourceType(rType, typeNumber, testRequestTypeMap);
    napi_create_int32(env, isCheck, &result);
    return result;
}

static napi_value GetResourceType_SERVICE_WORKER(napi_env env, napi_callback_info info)
{
    ArkWeb_ResourceType rType = SERVICE_WORKER;
    int32_t typeNumber = 15;
    napi_value result;
    int32_t isCheck = checkResourceType(rType, typeNumber, testRequestTypeMap);
    napi_create_int32(env, isCheck, &result);
    return result;
}

static napi_value GetResourceType_CSP_REPORT(napi_env env, napi_callback_info info)
{
    ArkWeb_ResourceType rType = CSP_REPORT;
    int32_t typeNumber = 16;
    napi_value result;
    int32_t isCheck = checkResourceType(rType, typeNumber, testRequestTypeMap);
    napi_create_int32(env, isCheck, &result);
    return result;
}

static napi_value GetResourceType_PLUGIN_RESOURCE(napi_env env, napi_callback_info info)
{
    ArkWeb_ResourceType rType = PLUGIN_RESOURCE;
    int32_t typeNumber = 17;
    napi_value result;
    int32_t isCheck = checkResourceType(rType, typeNumber, testRequestTypeMap);
    napi_create_int32(env, isCheck, &result);
    return result;
}

static napi_value GetResourceType_PRELOAD_MAIN(napi_env env, napi_callback_info info)
{
    ArkWeb_ResourceType rType = NAVIGATION_PRELOAD_MAIN_FRAME;
    int32_t typeNumber = 19;
    napi_value result;
    int32_t isCheck = checkResourceType(rType, typeNumber, testRequestTypeMap);
    napi_create_int32(env, isCheck, &result);
    return result;
}

static napi_value GetResourceType_PRELOAD_SUB(napi_env env, napi_callback_info info)
{
    ArkWeb_ResourceType rType = NAVIGATION_PRELOAD_SUB_FRAME;
    int32_t typeNumber = 20;
    napi_value result;
    int32_t isCheck = checkResourceType(rType, typeNumber, testRequestTypeMap);
    napi_create_int32(env, isCheck, &result);
    return result;
}

static napi_value GetFrameUrl(napi_env env, napi_callback_info info)
{
    napi_value result;
    if (testFrameUrl == 0) {
        napi_create_int32(env, 0, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

static napi_value GetServiceWorkerFrameUrl(napi_env env, napi_callback_info info)
{
    napi_value result;
    if (testServiceWorkerFrameUrl == 0) {
        napi_create_int32(env, 0, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

static napi_value GetLoadUrlFrameUrl(napi_env env, napi_callback_info info)
{
    napi_value result;
    if (testLoadUrlFrameUrl == 0) {
        napi_create_int32(env, 0, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

static napi_value GetSubFrameUrl(napi_env env, napi_callback_info info)
{
    napi_value result;
    if (testSubFrameUrl == 0) {
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
        {"initResourceManager", nullptr, InitResourceManager, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"registerCustomSchemes", nullptr, RegisterCustomSchemes, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getResourceType_MAIN_FRAME", nullptr, GetResourceType_MAIN_FRAME, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getResourceType_SUB_FRAME", nullptr, GetResourceType_SUB_FRAME, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getResourceType_STYLE_SHEET", nullptr, GetResourceType_STYLE_SHEET, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getResourceType_SCRIPT", nullptr, GetResourceType_SCRIPT, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getResourceType_IMAGE", nullptr, GetResourceType_IMAGE, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getResourceType_FONT_RESOURCE", nullptr, GetResourceType_FONT_RESOURCE, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getResourceType_SUB_RESOURCE", nullptr, GetResourceType_SUB_RESOURCE, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getResourceType_OBJECT", nullptr, GetResourceType_OBJECT, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getResourceType_MEDIA", nullptr, GetResourceType_MEDIA, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getResourceType_WORKER", nullptr, GetResourceType_WORKER, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getResourceType_SHARED_WORKER", nullptr, GetResourceType_SHARED_WORKER, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getResourceType_PREFETCH", nullptr, GetResourceType_PREFETCH, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getResourceType_FAVICON", nullptr, GetResourceType_FAVICON, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getResourceType_XHR", nullptr, GetResourceType_XHR, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getResourceType_PING", nullptr, GetResourceType_PING, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getResourceType_SERVICE_WORKER", nullptr, GetResourceType_SERVICE_WORKER, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getResourceType_CSP_REPORT", nullptr, GetResourceType_CSP_REPORT, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getResourceType_PLUGIN_RESOURCE", nullptr, GetResourceType_PLUGIN_RESOURCE, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getResourceType_PRELOAD_MAIN", nullptr, GetResourceType_PRELOAD_MAIN, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getResourceType_PRELOAD_SUB", nullptr, GetResourceType_PRELOAD_SUB, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getFrameUrl", nullptr, GetFrameUrl, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getServiceWorkerFrameUrl", nullptr, GetServiceWorkerFrameUrl, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getLoadUrlFrameUrl", nullptr, GetLoadUrlFrameUrl, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getSubFrameUrl", nullptr, GetSubFrameUrl, nullptr, nullptr, nullptr, napi_default, nullptr}
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
