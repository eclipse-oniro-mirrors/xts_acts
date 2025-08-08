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

#include "napi/native_api.h"
#include "web/arkweb_interface.h"
#include "web/arkweb_scheme_handler.h"
#include <cstdint>
#include <hilog/log.h>
#include <js_native_api_types.h>
#include <napi/native_api.h>
#include <web/native_interface_arkweb.h>
#include "WebErrorCodeList.h"

static napi_value WebErrorCodeSuccess(napi_env env, napi_callback_info info)
{
    OH_LOG_DEBUG(LOG_APP, "WebErrorCodeSuccess start..");
    napi_value result;
    const char *webTag = "web1211";
    const char *data = "<html>\n"
                       "    <head>\n"
                       "        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0, "
                       "user-scalable=0, minimum-scale="
                       "1.0, maximum-scale=1.0\">\n"
                       "    </head>\n"
                       "    <body>\n"
                       "        Source:<pre>source</pre>\n"
                       "        <div dir=\"auto\">\n"
                       "            <br />\n"
                       "            <img style=\"max-width:592px;height:auto\" src=\"image.jpg\" alt=\"图片\""
                       "width=\"592\" height=\"1052\" />\n"
                       "            <div>\n"
                       "                <br /><br /><br /><br /><br />\n"
                       "                <div>图片</div>\n"
                       "            </div>\n"
                       "        </div>\n"
                       "    </body>\n"
                       "</html>";
    const char *mimeType = "text/html";
    const char *encoding = "UTF-8";
    const char *baseUrl = "resource://rawfile/";
    const char *historyUrl = "www";
    int ret = OH_NativeArkWeb_LoadData(webTag, data, mimeType, encoding, baseUrl, historyUrl);
    if (ret == ArkWeb_ErrorCode::ARKWEB_SUCCESS) {
        napi_create_int32(env, ret, &result);
    }

    OH_LOG_DEBUG(LOG_APP, "WebErrorCodeSuccess end..");
    return result;
}

static napi_value WebInitError(napi_env env, napi_callback_info info)
{
    OH_LOG_DEBUG(LOG_APP, "WebInitError start..");
    napi_value result;
    const char *webTag = "";
    const char *data = "";
    const char *mimeType = "";
    const char *encoding = "";
    const char *baseUrl = "";
    const char *historyUrl = "";
    int ret = OH_NativeArkWeb_LoadData(webTag, data, mimeType, encoding, baseUrl, historyUrl);
    if (ret == ArkWeb_ErrorCode::ARKWEB_INIT_ERROR) {
        napi_create_int32(env, ret, &result);
    }
    OH_LOG_DEBUG(LOG_APP, "WebInitError end..");
    return result;
}

static napi_value WebErrorUnknow(napi_env env, napi_callback_info info)
{
    OH_LOG_DEBUG(LOG_APP, "WebErrorUnknow start..");
    ArkWeb_HttpBodyStream *httpBodyStream = nullptr;
    ArkWeb_HttpBodyStreamAsyncReadCallback readCallback;
    int ret = OH_ArkWebHttpBodyStream_SetAsyncReadCallback(httpBodyStream, readCallback);
    napi_value result;
    if (ret == ArkWeb_ErrorCode::ARKWEB_ERROR_UNKNOWN) {
        napi_create_int32(env, ret, &result);
    }

    OH_LOG_DEBUG(LOG_APP, "WebErrorUnknow end..");
    return result;
}

static napi_value WebErrorInvalidParam(napi_env env, napi_callback_info info)
{
    OH_LOG_DEBUG(LOG_APP, "WebErrorInvalidParam start..");
    int32_t p = 6;
    int *value = &p;
    ArkWeb_SchemeHandler *g_schemeHandler;
    OH_ArkWeb_CreateSchemeHandler(&g_schemeHandler);
    OH_ArkWebSchemeHandler_SetUserData(g_schemeHandler, &value);

    ArkWeb_HttpBodyStream *httpBodyStream = nullptr;
    ArkWeb_HttpBodyStreamAsyncReadCallback readCallback;
    int ret = OH_ArkWebHttpBodyStream_SetAsyncReadCallback(httpBodyStream, readCallback);
    napi_value result;
    if (ret == ArkWeb_ErrorCode::ARKWEB_INVALID_PARAM) {
        napi_create_int32(env, ret, &result);
    }

    OH_ArkWeb_DestroySchemeHandler(g_schemeHandler);
    OH_LOG_DEBUG(LOG_APP, "WebErrorInvalidParam en..");
    return result;
}

static napi_value WebErrorSchemeRegitsterFailed(napi_env env, napi_callback_info info)
{
    OH_LOG_DEBUG(LOG_APP, "WebErrorSchemeRegitsterFailed start..");
    ArkWeb_ErrorCode ret = ARKWEB_SCHEME_REGISTER_FAILED;
    ArkWeb_SchemeHandler *g_schemeHandler;
    OH_ArkWeb_CreateSchemeHandler(&g_schemeHandler);
    OH_ArkWeb_DestroySchemeHandler(g_schemeHandler);
    napi_value result;
    if (ret == ArkWeb_ErrorCode::ARKWEB_SCHEME_REGISTER_FAILED) {
        napi_create_int32(env, ret, &result);
    }
    OH_LOG_DEBUG(LOG_APP, "WebErrorSchemeRegitsterFailed end..");
    return result;
}

static napi_value WebErrorInvaledURL(napi_env env, napi_callback_info info)
{
    OH_LOG_DEBUG(LOG_APP, "WebErrorInvaledURL start..");
    ArkWeb_ErrorCode ret = ARKWEB_INVALID_URL;
    ArkWeb_SchemeHandler *g_schemeHandler;
    OH_ArkWeb_CreateSchemeHandler(&g_schemeHandler);
    OH_ArkWeb_DestroySchemeHandler(g_schemeHandler);
    napi_value result;
    if (ret == ArkWeb_ErrorCode::ARKWEB_INVALID_URL) {
        napi_create_int32(env, ret, &result);
    }
    OH_LOG_DEBUG(LOG_APP, "WebErrorInvaledURL end..");
    return result;
}

static napi_value WebErrorInvaledCookieValue(napi_env env, napi_callback_info info)
{
    OH_LOG_DEBUG(LOG_APP, "WebErrorInvaledCookieValue start..");
    ArkWeb_SchemeHandler *g_schemeHandler;
    OH_ArkWeb_CreateSchemeHandler(&g_schemeHandler);
    OH_ArkWeb_DestroySchemeHandler(g_schemeHandler);
    ArkWeb_ErrorCode ret = ARKWEB_INVALID_COOKIE_VALUE;
    napi_value result;
    napi_create_int32(env, ret, &result);
    OH_LOG_DEBUG(LOG_APP, "WebErrorInvaledCookieValue end..");
    return result;
}

static napi_value WebErrorLibraryOpenFailure(napi_env env, napi_callback_info info)
{
    OH_LOG_DEBUG(LOG_APP, "WebErrorLibraryOpenFailure start..");
    ArkWeb_SchemeHandler *g_schemeHandler;
    OH_ArkWeb_CreateSchemeHandler(&g_schemeHandler);
    OH_ArkWeb_DestroySchemeHandler(g_schemeHandler);
    ArkWeb_ErrorCode ret = ARKWEB_LIBRARY_OPEN_FAILURE;
    napi_value result;
    napi_create_int32(env, ret, &result);
    OH_LOG_DEBUG(LOG_APP, "WebErrorLibraryOpenFailure end..");
    return result;
}

static napi_value WebErrorLibraySymbolNotFound(napi_env env, napi_callback_info info)
{
    OH_LOG_DEBUG(LOG_APP, "WebErrorLibraySymbolNotFound start..");
    ArkWeb_ErrorCode ret = ARKWEB_LIBRARY_SYMBOL_NOT_FOUND;
    ArkWeb_SchemeHandler *g_schemeHandler;
    OH_ArkWeb_CreateSchemeHandler(&g_schemeHandler);
    OH_ArkWeb_DestroySchemeHandler(g_schemeHandler);
    napi_value result;
    napi_create_int32(env, ret, &result);
    OH_LOG_DEBUG(LOG_APP, "WebErrorLibraySymbolNotFound end..");
    return result;
}

static napi_value WebErrorCookeManagerNotInitialized(napi_env env, napi_callback_info info)
{
    OH_LOG_DEBUG(LOG_APP, "WebErrorCookeManagerNotInitialized start..");
    ArkWeb_ErrorCode ret = ARKWEB_COOKIE_MANAGER_NOT_INITIALIZED;
    ArkWeb_SchemeHandler *g_schemeHandler;
    OH_ArkWeb_CreateSchemeHandler(&g_schemeHandler);
    OH_ArkWeb_DestroySchemeHandler(g_schemeHandler);
    napi_value result;
    napi_create_int32(env, ret, &result);
    OH_LOG_DEBUG(LOG_APP, "WebErrorCookeManagerNotInitialized end..");
    return result;
}

static napi_value WebBlanklessSuccess(napi_env env, napi_callback_info info)
{
    OH_LOG_DEBUG(LOG_APP, "WebErrorCookeManagerNotInitialized start..");
    ArkWeb_BlanklessErrorCode ret = ARKWEB_BLANKLESS_SUCCESS;
    OH_NativeArkWeb_SetBlanklessLoadingWithKey("web1211", "https://www.example.com", true);

    napi_value result;
    napi_create_int32(env, ret, &result);
    OH_LOG_DEBUG(LOG_APP, "WebErrorCookeManagerNotInitialized end..");
    return result;
}

static napi_value WebBlanklessErrUnknown(napi_env env, napi_callback_info info)
{
    OH_LOG_DEBUG(LOG_APP, "WebErrorCookeManagerNotInitialized start..");
    ArkWeb_BlanklessErrorCode ret = ARKWEB_BLANKLESS_ERR_UNKNOWN;
    OH_NativeArkWeb_GetBlanklessInfoWithKey("web1211", "test");

    napi_value result;
    napi_create_int32(env, ret, &result);
    OH_LOG_DEBUG(LOG_APP, "WebErrorCookeManagerNotInitialized end..");
    return result;
}

static napi_value WebBlanklessErrInvalidArgs(napi_env env, napi_callback_info info)
{
    OH_LOG_DEBUG(LOG_APP, "WebBlanklessErrInvalidArgs start..");
    ArkWeb_BlanklessErrorCode ret = ARKWEB_BLANKLESS_ERR_INVALID_ARGS;
    OH_NativeArkWeb_SetBlanklessLoadingWithKey("web1211", "web.blankless.enabled", false);
    OH_NativeArkWeb_GetBlanklessInfoWithKey("web1211", "web.blankless.enabled");

    napi_value result;
    napi_create_int32(env, ret, &result);
    OH_LOG_DEBUG(LOG_APP, "WebBlanklessErrInvalidArgs end..");
    return result;
}

static napi_value WebBlanklessErrControllerNotInited(napi_env env, napi_callback_info info)
{
    OH_LOG_DEBUG(LOG_APP, "WebBlanklessErrControllerNotInited start..");
    ArkWeb_BlanklessErrorCode ret = ARKWEB_BLANKLESS_ERR_CONTROLLER_NOT_INITED;
    OH_NativeArkWeb_GetBlanklessInfoWithKey("web1211", "web.blankless.enabled");

    napi_value result;
    napi_create_int32(env, ret, &result);
    OH_LOG_DEBUG(LOG_APP, "WebBlanklessErrControllerNotInited end..");
    return result;
}

static napi_value WebBlanklessErrKeyNotMatch(napi_env env, napi_callback_info info)
{
    OH_LOG_DEBUG(LOG_APP, "WebBlanklessErrKeyNotMatch start..");
    ArkWeb_BlanklessErrorCode ret = ARKWEB_BLANKLESS_ERR_KEY_NOT_MATCH;
    OH_NativeArkWeb_GetBlanklessInfoWithKey("web1211", "testtest");

    napi_value result;
    napi_create_int32(env, ret, &result);
    OH_LOG_DEBUG(LOG_APP, "WebBlanklessErrKeyNotMatch end..");
    return result;
}

static napi_value WebBlanklessErrSignificantChange(napi_env env, napi_callback_info info)
{
    OH_LOG_DEBUG(LOG_APP, "WebBlanklessErrSignificantChange start..");
    ArkWeb_BlanklessErrorCode ret = ARKWEB_BLANKLESS_ERR_SIGNIFICANT_CHANGE;
    OH_NativeArkWeb_GetBlanklessInfoWithKey("test", "test000");

    napi_value result;
    napi_create_int32(env, ret, &result);
    OH_LOG_DEBUG(LOG_APP, "WebBlanklessErrSignificantChange end..");
    return result;
}

static napi_value WebBlanklessDeviceNotSupport(napi_env env, napi_callback_info info)
{
    OH_LOG_DEBUG(LOG_APP, "WebBlanklessDeviceNotSupport start..");
    napi_value result;
    ArkWeb_BlanklessErrorCode retSet =
        OH_NativeArkWeb_SetBlanklessLoadingWithKey("web1211", "web.blankless.enabled", false);
    if (retSet == ARKWEB_BLANKLESS_ERR_DEVICE_NOT_SUPPORT) {
        napi_create_int32(env, retSet, &result);
        return result;
    }

    OH_NativeArkWeb_GetBlanklessInfoWithKey("web1211", "web.blankless.enabled");
    napi_create_int32(env, ARKWEB_BLANKLESS_ERR_DEVICE_NOT_SUPPORT, &result);
    OH_LOG_DEBUG(LOG_APP, "WebBlanklessDeviceNotSupport end..");
    return result;
}

static napi_value WebAnyNativeAPI(napi_env env, napi_callback_info info)
{
    OH_LOG_DEBUG(LOG_APP, "WebAnyNativeAPI start..");
    ArkWeb_NativeAPIVariantKind type = ARKWEB_NATIVE_COMPONENT;
    ArkWeb_AnyNativeAPI* retInfo = OH_ArkWeb_GetNativeAPI(type);
    int ret = 0;
    if (retInfo != nullptr) {
        ret  = retInfo->size > 0? 0: -1;
    }

    napi_value result;
    napi_create_int32(env, ret, &result);
    OH_LOG_DEBUG(LOG_APP, "WebAnyNativeAPI end..");
    return result;
}

static napi_value WebNativeComponent(napi_env env, napi_callback_info info)
{
    OH_LOG_DEBUG(LOG_APP, "WebNativeComponent start..");
    ArkWeb_NativeAPIVariantKind type = ARKWEB_NATIVE_COMPONENT;
    ArkWeb_AnyNativeAPI* retInfo = OH_ArkWeb_GetNativeAPI(type);
    int ret = 0;
    if (retInfo != nullptr) {
        ret  = retInfo->size > 0? 0: -1;
    }

    napi_value result;
    napi_create_int32(env, ret, &result);
    OH_LOG_DEBUG(LOG_APP, "WebNativeComponent end..");
    return result;
}

static napi_value WebNativeController(napi_env env, napi_callback_info info)
{
    OH_LOG_DEBUG(LOG_APP, "WebNativeController start..");
    ArkWeb_NativeAPIVariantKind type = ARKWEB_NATIVE_CONTROLLER;
    ArkWeb_AnyNativeAPI* retInfo = OH_ArkWeb_GetNativeAPI(type);
    int ret = 0;
    if (retInfo != nullptr) {
        ret  = retInfo->size > 0? 0: -1;
    }

    napi_value result;
    napi_create_int32(env, ret, &result);
    OH_LOG_DEBUG(LOG_APP, "WebNativeController end..");
    return result;
}

static napi_value WebNativeWebMessagePort(napi_env env, napi_callback_info info)
{
    OH_LOG_DEBUG(LOG_APP, "WebNativeWebMessagePort start..");
    ArkWeb_NativeAPIVariantKind type = ARKWEB_NATIVE_WEB_MESSAGE_PORT;
    ArkWeb_AnyNativeAPI* retInfo = OH_ArkWeb_GetNativeAPI(type);
    int ret = 0;
    if (retInfo != nullptr) {
        ret  = retInfo->size > 0? 0: -1;
    }

    napi_value result;
    napi_create_int32(env, ret, &result);
    OH_LOG_DEBUG(LOG_APP, "WebNativeWebMessagePort end..");
    return result;
}

static napi_value WebNativeWebMessage(napi_env env, napi_callback_info info)
{
    OH_LOG_DEBUG(LOG_APP, "WebNativeWebMessage start..");
    ArkWeb_NativeAPIVariantKind type = ARKWEB_NATIVE_WEB_MESSAGE;
    ArkWeb_AnyNativeAPI* retInfo = OH_ArkWeb_GetNativeAPI(type);
    int ret = 0;
    if (retInfo != nullptr) {
        ret  = retInfo->size > 0? 0: -1;
    }

    napi_value result;
    napi_create_int32(env, ret, &result);
    OH_LOG_DEBUG(LOG_APP, "WebNativeWebMessage end..");
    return result;
}

static napi_value WebNativeCookieManger(napi_env env, napi_callback_info info)
{
    OH_LOG_DEBUG(LOG_APP, "WebNativeCookieManger start..");
    ArkWeb_NativeAPIVariantKind type = ARKWEB_NATIVE_COOKIE_MANAGER;
    ArkWeb_AnyNativeAPI* retInfo = OH_ArkWeb_GetNativeAPI(type);
    int ret = 0;
    if (retInfo != nullptr) {
        ret  = retInfo->size > 0? 0: -1;
    }

    napi_value result;
    napi_create_int32(env, ret, &result);
    OH_LOG_DEBUG(LOG_APP, "WebNativeCookieManger end..");
    return result;
}

static napi_value WebNativeJavaScriptValue(napi_env env, napi_callback_info info)
{
    OH_LOG_DEBUG(LOG_APP, "WebNativeJavaScriptValue start..");
    ArkWeb_NativeAPIVariantKind type = ARKWEB_NATIVE_JAVASCRIPT_VALUE;
    ArkWeb_AnyNativeAPI* retInfo = OH_ArkWeb_GetNativeAPI(type);
    int ret = 0;
    if (retInfo != nullptr) {
        ret  = retInfo->size > 0? 0: -1;
    }

    napi_value result;
    napi_create_int32(env, ret, &result);
    OH_LOG_DEBUG(LOG_APP, "WebNativeJavaScriptValue end..");
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"webErrCodeSuccess", nullptr, WebErrorCodeSuccess, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"webInitError", nullptr, WebInitError, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"webErrorUnknow", nullptr, WebErrorUnknow, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"webErrorInvalidParam", nullptr, WebErrorInvalidParam, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"webErrorSchemeRegitsterFailed", nullptr, WebErrorSchemeRegitsterFailed, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"webErrorInvaledURL", nullptr, WebErrorInvaledURL, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"webErrorInvaledCookieValue", nullptr, WebErrorInvaledCookieValue, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"webErrorLibraryOpenFailure", nullptr, WebErrorLibraryOpenFailure, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"webErrorLibraySymbolNotFound", nullptr, WebErrorLibraySymbolNotFound, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"webErrorCookeManagerNotInitialized", nullptr, WebErrorCookeManagerNotInitialized, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"webBlanklessSuccess", nullptr, WebBlanklessSuccess, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"webBlanklessErrUnknown", nullptr, WebBlanklessErrUnknown, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"webBlanklessErrInvalidArgs", nullptr, WebBlanklessErrInvalidArgs, nullptr, nullptr, nullptr, napi_default,
         nullptr},

        {"webBlanklessErrControllerNotInited", nullptr, WebBlanklessErrControllerNotInited, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"webBlanklessErrKeyNotMatch", nullptr, WebBlanklessErrKeyNotMatch, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"webBlanklessErrSignificantChange", nullptr, WebBlanklessErrSignificantChange, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"webBlanklessDeviceNotSupport", nullptr, WebBlanklessDeviceNotSupport, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"webAnyNativeAPI", nullptr, WebAnyNativeAPI, nullptr, nullptr, nullptr, napi_default, nullptr},

        {"webNativeComponent", nullptr, WebNativeComponent, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"webNativeController", nullptr, WebNativeController, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"webNativeWebMessagePort", nullptr, WebNativeWebMessagePort, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"webNativeWebMessage", nullptr, WebNativeWebMessage, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"webNativeCookieManger", nullptr, WebNativeCookieManger, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"webNativeJavaScriptValue", nullptr, WebNativeJavaScriptValue, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"webNetErrorResponeseSetError", nullptr, WebNetErrorResponeseSetError, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"webArkWebResponseGetError", nullptr, WebArkWebResponseGetError, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"webArkWebConnectError", nullptr, WebArkWebConnectError, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"webArkWebSSLError", nullptr, WebArkWebSSLError, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "weberrorcodetest",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }