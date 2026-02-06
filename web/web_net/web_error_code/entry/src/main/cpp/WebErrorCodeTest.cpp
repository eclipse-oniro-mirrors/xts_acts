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

#include "WebErrorCodeList.h"
#include "WebSchemeHandlerTest.h"
#include "napi/native_api.h"
#include "native_common.h"
#include "web/arkweb_interface.h"
#include "web/arkweb_scheme_handler.h"
#include <cstdint>
#include <vector>
#include <hilog/log.h>
#include <js_native_api_types.h>
#include <napi/native_api.h>
#include <web/native_interface_arkweb.h>

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
    int ret = ArkWeb_ErrorCode::ARKWEB_ERROR_UNKNOWN;
    napi_value result;
    int32_t retCallBack = OH_ArkWebHttpBodyStream_SetAsyncReadCallback(httpBodyStream, readCallback);
    if (retCallBack == ArkWeb_ErrorCode::ARKWEB_ERROR_UNKNOWN) {
        OH_LOG_DEBUG(LOG_APP, "OH_ArkWebHttpBodyStream_SetAsyncReadCallback error unknown");
    }

    napi_create_int32(env, ret, &result);
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
    static ArkWeb_CookieManagerAPI *cookieManager = nullptr;
    cookieManager = reinterpret_cast<ArkWeb_CookieManagerAPI *>(OH_ArkWeb_GetNativeAPI(ARKWEB_NATIVE_COOKIE_MANAGER));
    char *cookieValue;
    ArkWeb_ErrorCode resultCode = cookieManager->fetchCookieSync("", true, true, &cookieValue);
    napi_value result;
    if (resultCode == ARKWEB_INVALID_URL) {
        napi_create_int32(env, resultCode, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

static napi_value WebErrorInvaledCookieValue(napi_env env, napi_callback_info info)
{
    OH_LOG_DEBUG(LOG_APP, "WebErrorInvaledCookieValue start..");
    static ArkWeb_CookieManagerAPI *cookieManager = nullptr;
    cookieManager = reinterpret_cast<ArkWeb_CookieManagerAPI *>(OH_ArkWeb_GetNativeAPI(ARKWEB_NATIVE_COOKIE_MANAGER));
    char *cookieValue = "test=abc\nd123";
    ArkWeb_ErrorCode ret = ARKWEB_INVALID_COOKIE_VALUE;
    ArkWeb_ErrorCode resultCode = cookieManager->configCookieSync("https://example.com", cookieValue, false, false);

    napi_value result;
    if (resultCode != ARKWEB_INVALID_COOKIE_VALUE) {
        napi_create_int32(env, ret, &result);
    } else {
        napi_create_int32(env, resultCode, &result);
    }

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
    ArkWeb_ErrorCode ret1 = ARKWEB_COOKIE_MANAGER_INITIALIZE_FAILED;
    ArkWeb_ErrorCode ret2 = ARKWEB_COOKIE_SAVE_FAILED;
    int saveRet = OH_ArkWebCookieManager_SaveCookieSync();
    napi_value result;
    if (saveRet == ARKWEB_SUCCESS) {
        napi_create_int32(env, saveRet, &result);
    } else if (saveRet == ARKWEB_COOKIE_MANAGER_NOT_INITIALIZED) {
        napi_create_int32(env, ret, &result);
    } else if (saveRet == ARKWEB_COOKIE_MANAGER_INITIALIZE_FAILED) {
        napi_create_int32(env, ret1, &result);
    } else if (saveRet == ARKWEB_COOKIE_SAVE_FAILED) {
        napi_create_int32(env, ret2, &result);
    }
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
    ArkWeb_AnyNativeAPI *retInfo = OH_ArkWeb_GetNativeAPI(type);
    int ret = 0;
    if (retInfo != nullptr) {
        ret = retInfo->size > 0 ? 0 : -1;
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
    ArkWeb_AnyNativeAPI *retInfo = OH_ArkWeb_GetNativeAPI(type);
    int ret = 0;
    if (retInfo != nullptr) {
        ret = retInfo->size > 0 ? 0 : -1;
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
    ArkWeb_AnyNativeAPI *retInfo = OH_ArkWeb_GetNativeAPI(type);
    int ret = 0;
    if (retInfo != nullptr) {
        ret = retInfo->size > 0 ? 0 : -1;
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
    ArkWeb_AnyNativeAPI *retInfo = OH_ArkWeb_GetNativeAPI(type);
    int ret = 0;
    if (retInfo != nullptr) {
        ret = retInfo->size > 0 ? 0 : -1;
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
    ArkWeb_AnyNativeAPI *retInfo = OH_ArkWeb_GetNativeAPI(type);
    int ret = 0;
    if (retInfo != nullptr) {
        ret = retInfo->size > 0 ? 0 : -1;
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
    ArkWeb_AnyNativeAPI *retInfo = OH_ArkWeb_GetNativeAPI(type);
    int ret = 0;
    if (retInfo != nullptr) {
        ret = retInfo->size > 0 ? 0 : -1;
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
    ArkWeb_AnyNativeAPI *retInfo = OH_ArkWeb_GetNativeAPI(type);
    int ret = 0;
    if (retInfo != nullptr) {
        ret = retInfo->size > 0 ? 0 : -1;
    }

    napi_value result;
    napi_create_int32(env, ret, &result);
    OH_LOG_DEBUG(LOG_APP, "WebNativeJavaScriptValue end..");
    return result;
}

static napi_value OH_ArkWeb_RegisterCustomSchemes0100(napi_env env, napi_callback_info info)
{
    int32_t option = ARKWEB_SCHEME_OPTION_STANDARD;
    char *scheme = "custom-local";
    int32_t errcode = OH_ArkWeb_RegisterCustomSchemes(scheme, option);
    int ret = -1;
    if (errcode == ARKWEB_SCHEME_REGISTER_FAILED) {
        ret = 0;
    }
    scheme = nullptr;
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OH_ArkWeb_RegisterCustomSchemes0101(napi_env env, napi_callback_info info)
{
    int32_t option = ARKWEB_SCHEME_OPTION_LOCAL;
    char *scheme = "custom-local";
    int ret = -1;
    int32_t errcode = OH_ArkWeb_RegisterCustomSchemes(nullptr, option);
    if (errcode == ARKWEB_INVALID_PARAM) {
        ret = 0;
    }
    scheme = nullptr;
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OH_ArkWebServiceWorker_ClearSchemeHandlers0100(napi_env env, napi_callback_info info)
{
    int32_t option = ARKWEB_SCHEME_OPTION_LOCAL;
    char *scheme = "custom-local";
    ArkWeb_SchemeHandler *schemeHandler;
    OH_ArkWebServiceWorker_SetSchemeHandler(scheme, schemeHandler);
    int32_t errcode = OH_ArkWebServiceWorker_ClearSchemeHandlers();
    int ret = -1;
    if (errcode == ARKWEB_NET_OK) {
        ret = 0;
    }
    scheme = nullptr;
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OH_ArkWeb_ClearSchemeHandlers0100(napi_env env, napi_callback_info info)
{
    char *scheme = "local";
    ArkWeb_SchemeHandler *schemeHandler;
    OH_ArkWeb_CreateSchemeHandler(&schemeHandler);
    char *webTag = "a";
    OH_ArkWeb_SetSchemeHandler(scheme, webTag, schemeHandler);
    int ret = -1;
    int32_t errcode = OH_ArkWeb_ClearSchemeHandlers(webTag);
    if (errcode == ARKWEB_NET_OK) {
        ret = 0;
    }
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value OH_ArkWeb_ClearSchemeHandlers0101(napi_env env, napi_callback_info info)
{
    char *scheme = "local";
    ArkWeb_SchemeHandler *schemeHandler;
    OH_ArkWeb_CreateSchemeHandler(&schemeHandler);
    char *webTag = "a";
    OH_ArkWeb_SetSchemeHandler(scheme, webTag, schemeHandler);
    int ret = -1;
    int32_t errcode = OH_ArkWeb_ClearSchemeHandlers(nullptr);
    if (errcode == ARKWEB_INVALID_PARAM) {
        ret = 0;
    }
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OH_ArkWebSchemeHandler_SetUserData0100(napi_env env, napi_callback_info info)
{
    ArkWeb_SchemeHandler *schemeHandler;
    OH_ArkWeb_CreateSchemeHandler(&schemeHandler);
    char *userData = "MySchemeHandler";
    int ret = -1;
    int32_t errcode = OH_ArkWebSchemeHandler_SetUserData(schemeHandler, userData);
    if (errcode == ARKWEB_NET_OK) {
        ret = 0;
    }
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OH_ArkWebSchemeHandler_SetUserData0101(napi_env env, napi_callback_info info)
{
    ArkWeb_SchemeHandler *g_schemeHandler;
    OH_ArkWeb_CreateSchemeHandler(&g_schemeHandler);
    char *userData = "MySchemeHandler";
    int ret = -1;
    int32_t errcode = OH_ArkWebSchemeHandler_SetUserData(g_schemeHandler, nullptr);
    if (errcode == ARKWEB_INVALID_PARAM) {
        ret = 0;
    }
    userData = nullptr;
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OH_ArkWebSchemeHandler_SetOnRequestStart0100(napi_env env, napi_callback_info info)
{
    ArkWeb_SchemeHandler *schemeHandler;
    OH_ArkWeb_CreateSchemeHandler(&schemeHandler);
    char *userData = "MySchemeHandler";
    int ret = -1;
    int32_t errcode = OH_ArkWebSchemeHandler_SetOnRequestStart(schemeHandler, nullptr);
    if (errcode == ARKWEB_NET_OK) {
        ret = 0;
    }
    userData = nullptr;
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OH_ArkWebSchemeHandler_SetOnRequestStart0101(napi_env env, napi_callback_info info)
{
    ArkWeb_SchemeHandler *schemeHandler;
    OH_ArkWeb_CreateSchemeHandler(&schemeHandler);
    char *userData = "MySchemeHandler";
    int ret = -1;
    int32_t errcode = OH_ArkWebSchemeHandler_SetOnRequestStart(nullptr, nullptr);
    if (errcode == ARKWEB_INVALID_PARAM) {
        ret = 0;
    }
    userData = nullptr;
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OH_ArkWebSchemeHandler_SetOnRequestStop0100(napi_env env, napi_callback_info info)
{
    ArkWeb_SchemeHandler *schemeHandler;
    OH_ArkWeb_CreateSchemeHandler(&schemeHandler);
    char *userData = "MySchemeHandler";
    int ret = -1;
    int32_t errcode = OH_ArkWebSchemeHandler_SetOnRequestStop(nullptr, nullptr);
    if (errcode == ARKWEB_INVALID_PARAM) {
        ret = 0;
    }
    userData = nullptr;
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OH_ArkWebSchemeHandler_SetOnRequestStop0101(napi_env env, napi_callback_info info)
{
    ArkWeb_SchemeHandler *schemeHandler;
    OH_ArkWeb_CreateSchemeHandler(&schemeHandler);
    char *userData = "MySchemeHandler";
    int ret = -1;
    int32_t errcode = OH_ArkWebSchemeHandler_SetOnRequestStop(schemeHandler, nullptr);
    if (errcode == ARKWEB_NET_OK) {
        ret = 0;
    }
    userData = nullptr;
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OH_ArkWebResponse_SetUrl0100(napi_env env, napi_callback_info info)
{
    ArkWeb_Response *response;
    OH_ArkWeb_CreateResponse(&response);
    char *url = "https://example.com/custom_response";
    int ret = -1;
    int32_t errcode = OH_ArkWebResponse_SetUrl(response, url);
    if (errcode == ARKWEB_NET_OK) {
        ret = 0;
    }
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OH_ArkWebResponse_SetUrl0101(napi_env env, napi_callback_info info)
{
    ArkWeb_Response *response;
    OH_ArkWeb_CreateResponse(&response);
    int ret = -1;
    int32_t errcode = OH_ArkWebResponse_SetUrl(nullptr, nullptr);
    if (errcode == ARKWEB_INVALID_PARAM) {
        ret = 0;
    }
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OH_ArkWebResponse_SetError0100(napi_env env, napi_callback_info info)
{
    ArkWeb_Response *response;
    OH_ArkWeb_CreateResponse(&response);
    int ret = -1;
    int32_t errcode = OH_ArkWebResponse_SetError(nullptr, ARKWEB_ERR_FAILED);
    if (errcode == ARKWEB_INVALID_PARAM) {
        ret = 0;
    }
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OH_ArkWebResponse_SetStatus0100(napi_env env, napi_callback_info info)
{
    ArkWeb_Response *response;
    OH_ArkWeb_CreateResponse(&response);
    int status = 200;
    int ret = -1;
    int32_t errcode = OH_ArkWebResponse_SetStatus(response, status);
    if (errcode == ARKWEB_NET_OK) {
        ret = 0;
    }
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OH_ArkWebResponse_SetStatus0101(napi_env env, napi_callback_info info)
{
    ArkWeb_Response *response;
    OH_ArkWeb_CreateResponse(&response);
    int status = 200;
    int ret = -1;
    int32_t errcode = OH_ArkWebResponse_SetStatus(nullptr, status);
    if (errcode == ARKWEB_INVALID_PARAM) {
        ret = 0;
    }
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OH_ArkWebResponse_SetStatusText0100(napi_env env, napi_callback_info info)
{
    ArkWeb_Response *response;
    OH_ArkWeb_CreateResponse(&response);
    char *statusText = "success";
    int ret = -1;
    int32_t errcode = OH_ArkWebResponse_SetStatusText(response, statusText);
    if (errcode == ARKWEB_NET_OK) {
        ret = 0;
    }
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OH_ArkWebResponse_SetStatusText0101(napi_env env, napi_callback_info info)
{
    ArkWeb_Response *response;
    OH_ArkWeb_CreateResponse(&response);
    char *statusText = "success";
    int ret = -1;
    int32_t errcode = OH_ArkWebResponse_SetStatusText(nullptr, statusText);
    if (errcode == ARKWEB_INVALID_PARAM) {
        ret = 0;
    }
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OH_ArkWebResponse_SetMimeType0100(napi_env env, napi_callback_info info)
{
    ArkWeb_Response *response;
    OH_ArkWeb_CreateResponse(&response);
    char *mimeType = "mp4";
    int ret = -1;
    int32_t errcode = OH_ArkWebResponse_SetMimeType(response, mimeType);
    if (errcode == ARKWEB_NET_OK) {
        ret = 0;
    }
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OH_ArkWebResponse_SetMimeType0101(napi_env env, napi_callback_info info)
{
    ArkWeb_Response *response;
    OH_ArkWeb_CreateResponse(&response);
    char *mimeType = "mp4";
    int ret = -1;
    int32_t errcode = OH_ArkWebResponse_SetMimeType(nullptr, mimeType);
    if (errcode == ARKWEB_INVALID_PARAM) {
        ret = 0;
    }
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OH_ArkWebResponse_SetCharset0100(napi_env env, napi_callback_info info)
{
    ArkWeb_Response *response;
    OH_ArkWeb_CreateResponse(&response);
    char *charset = "0123456789";
    int ret = -1;
    int32_t errcode = OH_ArkWebResponse_SetCharset(response, charset);
    if (errcode == ARKWEB_NET_OK) {
        ret = 0;
    }
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OH_ArkWebResponse_SetCharset0101(napi_env env, napi_callback_info info)
{
    ArkWeb_Response *response;
    OH_ArkWeb_CreateResponse(&response);
    char *charset = "0123456789";
    int ret = -1;
    int32_t errcode = OH_ArkWebResponse_SetCharset(nullptr, charset);
    if (errcode == ARKWEB_INVALID_PARAM) {
        ret = 0;
    }
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OH_ArkWebResponse_SetHeaderByName0100(napi_env env, napi_callback_info info)
{
    ArkWeb_Response *response;
    OH_ArkWeb_CreateResponse(&response);
    char *name = "a";
    char *value = "0";
    bool overwrite = true;
    int ret = -1;
    int32_t errcode = OH_ArkWebResponse_SetHeaderByName(response, name, value, overwrite);
    if (errcode == ARKWEB_NET_OK) {
        ret = 0;
    }
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OH_ArkWebResponse_SetHeaderByName0101(napi_env env, napi_callback_info info)
{
    ArkWeb_Response *response;
    OH_ArkWeb_CreateResponse(&response);
    char *name = "a";
    char *value = "0";
    bool overwrite = true;
    int ret = -1;
    int32_t errcode = OH_ArkWebResponse_SetHeaderByName(nullptr, name, value, overwrite);
    if (errcode == ARKWEB_INVALID_PARAM) {
        ret = 0;
    }
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OH_ArkWebResourceHandler_Destroy0100(napi_env env, napi_callback_info info)
{
    ArkWeb_Response *response;
    OH_ArkWeb_CreateResponse(&response);
    ArkWeb_SchemeHandler *schemeHandler;
    OH_ArkWeb_CreateSchemeHandler(&schemeHandler);
    ArkWeb_ResourceHandler *resourceHandler;
    int ret = -1;
    int32_t errcode = OH_ArkWebResourceHandler_Destroy(nullptr);
    if (errcode == ARKWEB_INVALID_PARAM) {
        ret = 0;
    }
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OH_ArkWebResourceHandler_DidReceiveResponse0100(napi_env env, napi_callback_info info)
{
    ArkWeb_Response *response;
    OH_ArkWeb_CreateResponse(&response);
    ArkWeb_SchemeHandler *schemeHandler;
    OH_ArkWeb_CreateSchemeHandler(&schemeHandler);
    ArkWeb_ResourceHandler *resourceHandler;
    int ret = -1;
    int32_t errcode = OH_ArkWebResourceHandler_DidReceiveResponse(nullptr, nullptr);
    if (errcode == ARKWEB_INVALID_PARAM) {
        ret = 0;
    }
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OH_ArkWebResourceHandler_DidReceiveData0100(napi_env env, napi_callback_info info)
{
    ArkWeb_Response *response;
    OH_ArkWeb_CreateResponse(&response);
    ArkWeb_SchemeHandler *schemeHandler;
    OH_ArkWeb_CreateSchemeHandler(&schemeHandler);
    ArkWeb_ResourceHandler *resourceHandler{nullptr};
    int64_t fixedLen = 1024;
    uint8_t buffer[fixedLen];
    int64_t bufLen = fixedLen;
    int ret = -1;
    int32_t errcode = OH_ArkWebResourceHandler_DidReceiveData(nullptr, buffer, bufLen);
    if (errcode == ARKWEB_INVALID_PARAM) {
        ret = 0;
    }
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OH_ArkWebResourceHandler_DidFinish0100(napi_env env, napi_callback_info info)
{
    ArkWeb_Response *response;
    OH_ArkWeb_CreateResponse(&response);
    ArkWeb_SchemeHandler *schemeHandler;
    OH_ArkWeb_CreateSchemeHandler(&schemeHandler);
    ArkWeb_ResourceHandler *resourceHandler;
    int64_t fixedLen = 1024;
    uint8_t buffer[fixedLen];
    int64_t bufLen = fixedLen;
    int ret = 0;
    int32_t errcode = OH_ArkWebResourceHandler_DidFinish(nullptr);
    if (errcode == ARKWEB_INVALID_PARAM) {
        ret = 0;
    }
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OH_ArkWebResourceHandler_DidFailWithError0100(napi_env env, napi_callback_info info)
{
    ArkWeb_Response *response;
    OH_ArkWeb_CreateResponse(&response);
    ArkWeb_SchemeHandler *schemeHandler;
    OH_ArkWeb_CreateSchemeHandler(&schemeHandler);
    ArkWeb_ResourceHandler *resourceHandler;
    int64_t fixedLen = 1024;
    uint8_t buffer[fixedLen];
    int64_t bufLen = fixedLen;
    int ret = 0;
    int32_t errcode = OH_ArkWebResourceHandler_DidFailWithError(nullptr, ARKWEB_NET_OK);
    if (errcode == ARKWEB_INVALID_PARAM) {
        ret = 0;
    }
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OH_ArkWebResourceHandler_DidFailWithErrorV20100(napi_env env, napi_callback_info info)
{
    ArkWeb_Response *response;
    OH_ArkWeb_CreateResponse(&response);
    ArkWeb_SchemeHandler *schemeHandler;
    OH_ArkWeb_CreateSchemeHandler(&schemeHandler);
    ArkWeb_ResourceHandler *resourceHandler;
    int64_t fixedLen = 1024;
    uint8_t buffer[fixedLen];
    int64_t bufLen = fixedLen;
    bool completeIfNoResponse = true;
    int ret = -1;
    int32_t errcode = OH_ArkWebResourceHandler_DidFailWithErrorV2(nullptr, ARKWEB_NET_OK, completeIfNoResponse);
    if (errcode == ARKWEB_INVALID_PARAM) {
        ret = 0;
    }
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

EXTERN_C_START

static void AddExFunction(std::vector<napi_property_descriptor> &descVector)
{
    std::vector<napi_property_descriptor> descEx = {
        DECLARE_NAPI_FUNCTION("OH_ArkWeb_RegisterCustomSchemes0100", OH_ArkWeb_RegisterCustomSchemes0100),
        DECLARE_NAPI_FUNCTION("OH_ArkWeb_RegisterCustomSchemes0101", OH_ArkWeb_RegisterCustomSchemes0101),
        DECLARE_NAPI_FUNCTION("OH_ArkWebServiceWorker_ClearSchemeHandlers0100",
                              OH_ArkWebServiceWorker_ClearSchemeHandlers0100),
        DECLARE_NAPI_FUNCTION("OH_ArkWeb_ClearSchemeHandlers0100", OH_ArkWeb_ClearSchemeHandlers0100),
        DECLARE_NAPI_FUNCTION("OH_ArkWeb_ClearSchemeHandlers0101", OH_ArkWeb_ClearSchemeHandlers0101),
        DECLARE_NAPI_FUNCTION("OH_ArkWebSchemeHandler_SetUserData0100", OH_ArkWebSchemeHandler_SetUserData0100),
        DECLARE_NAPI_FUNCTION("OH_ArkWebSchemeHandler_SetUserData0101", OH_ArkWebSchemeHandler_SetUserData0101),
        DECLARE_NAPI_FUNCTION("OH_ArkWebSchemeHandler_SetOnRequestStart0100",
                              OH_ArkWebSchemeHandler_SetOnRequestStart0100),
        DECLARE_NAPI_FUNCTION("OH_ArkWebSchemeHandler_SetOnRequestStart0101",
                              OH_ArkWebSchemeHandler_SetOnRequestStart0101),
        DECLARE_NAPI_FUNCTION("OH_ArkWebSchemeHandler_SetOnRequestStop0100",
                              OH_ArkWebSchemeHandler_SetOnRequestStop0100),
        DECLARE_NAPI_FUNCTION("OH_ArkWebSchemeHandler_SetOnRequestStop0101",
                              OH_ArkWebSchemeHandler_SetOnRequestStop0101),
        DECLARE_NAPI_FUNCTION("OH_ArkWebResponse_SetUrl0100", OH_ArkWebResponse_SetUrl0100),
        DECLARE_NAPI_FUNCTION("OH_ArkWebResponse_SetUrl0101", OH_ArkWebResponse_SetUrl0101),
        DECLARE_NAPI_FUNCTION("OH_ArkWebResponse_SetError0100", OH_ArkWebResponse_SetError0100),
        DECLARE_NAPI_FUNCTION("OH_ArkWebResponse_SetStatus0100", OH_ArkWebResponse_SetStatus0100),
        DECLARE_NAPI_FUNCTION("OH_ArkWebResponse_SetStatus0101", OH_ArkWebResponse_SetStatus0101),
        DECLARE_NAPI_FUNCTION("OH_ArkWebResponse_SetStatusText0100", OH_ArkWebResponse_SetStatusText0100),
        DECLARE_NAPI_FUNCTION("OH_ArkWebResponse_SetStatusText0101", OH_ArkWebResponse_SetStatusText0101),
        DECLARE_NAPI_FUNCTION("OH_ArkWebResponse_SetMimeType0100", OH_ArkWebResponse_SetMimeType0100),
        DECLARE_NAPI_FUNCTION("OH_ArkWebResponse_SetMimeType0101", OH_ArkWebResponse_SetMimeType0101),
        DECLARE_NAPI_FUNCTION("OH_ArkWebResponse_SetCharset0100", OH_ArkWebResponse_SetCharset0100),
        DECLARE_NAPI_FUNCTION("OH_ArkWebResponse_SetCharset0101", OH_ArkWebResponse_SetCharset0101),
        DECLARE_NAPI_FUNCTION("OH_ArkWebResponse_SetHeaderByName0100", OH_ArkWebResponse_SetHeaderByName0100),
        DECLARE_NAPI_FUNCTION("OH_ArkWebResponse_SetHeaderByName0101", OH_ArkWebResponse_SetHeaderByName0101),
        DECLARE_NAPI_FUNCTION("OH_ArkWebResourceHandler_Destroy0100", OH_ArkWebResourceHandler_Destroy0100),
        DECLARE_NAPI_FUNCTION("OH_ArkWebResourceHandler_DidReceiveResponse0100",
                              OH_ArkWebResourceHandler_DidReceiveResponse0100),
        DECLARE_NAPI_FUNCTION("OH_ArkWebResourceHandler_DidReceiveData0100",
                              OH_ArkWebResourceHandler_DidReceiveData0100),
        DECLARE_NAPI_FUNCTION("OH_ArkWebResourceHandler_DidFinish0100", OH_ArkWebResourceHandler_DidFinish0100),
        DECLARE_NAPI_FUNCTION("OH_ArkWebResourceHandler_DidFailWithError0100",
                              OH_ArkWebResourceHandler_DidFailWithError0100),
        DECLARE_NAPI_FUNCTION("OH_ArkWebResourceHandler_DidFailWithErrorV20100",
                              OH_ArkWebResourceHandler_DidFailWithErrorV20100),
    };

    for (const auto& desc : descEx) {
        descVector.push_back(desc);
    }
}

static napi_value Init(napi_env env, napi_value exports)
{
    std::vector<napi_property_descriptor> desc = {
        DECLARE_NAPI_FUNCTION("webErrCodeSuccess", WebErrorCodeSuccess),
        DECLARE_NAPI_FUNCTION("webInitError", WebInitError),
        DECLARE_NAPI_FUNCTION("webErrorUnknow", WebErrorUnknow),
        DECLARE_NAPI_FUNCTION("webErrorInvalidParam", WebErrorInvalidParam),
        DECLARE_NAPI_FUNCTION("webErrorSchemeRegitsterFailed", WebErrorSchemeRegitsterFailed),
        DECLARE_NAPI_FUNCTION("webErrorInvaledURL", WebErrorInvaledURL),
        DECLARE_NAPI_FUNCTION("webErrorInvaledCookieValue", WebErrorInvaledCookieValue),
        DECLARE_NAPI_FUNCTION("webErrorLibraryOpenFailure", WebErrorLibraryOpenFailure),
        DECLARE_NAPI_FUNCTION("webErrorLibraySymbolNotFound", WebErrorLibraySymbolNotFound),
        DECLARE_NAPI_FUNCTION("webErrorCookeManagerNotInitialized", WebErrorCookeManagerNotInitialized),
        DECLARE_NAPI_FUNCTION("webBlanklessSuccess", WebBlanklessSuccess),
        DECLARE_NAPI_FUNCTION("webBlanklessErrUnknown", WebBlanklessErrUnknown),
        DECLARE_NAPI_FUNCTION("webBlanklessErrInvalidArgs", WebBlanklessErrInvalidArgs),
        DECLARE_NAPI_FUNCTION("webBlanklessErrControllerNotInited", WebBlanklessErrControllerNotInited),
        DECLARE_NAPI_FUNCTION("webBlanklessErrKeyNotMatch", WebBlanklessErrKeyNotMatch),
        DECLARE_NAPI_FUNCTION("webBlanklessErrSignificantChange", WebBlanklessErrSignificantChange),
        DECLARE_NAPI_FUNCTION("webBlanklessDeviceNotSupport", WebBlanklessDeviceNotSupport),
        DECLARE_NAPI_FUNCTION("webAnyNativeAPI", WebAnyNativeAPI),
        DECLARE_NAPI_FUNCTION("webNativeComponent", WebNativeComponent),
        DECLARE_NAPI_FUNCTION("webNativeController", WebNativeController),
        DECLARE_NAPI_FUNCTION("webNativeWebMessagePort", WebNativeWebMessagePort),
        DECLARE_NAPI_FUNCTION("webNativeWebMessage", WebNativeWebMessage),
        DECLARE_NAPI_FUNCTION("webNativeCookieManger", WebNativeCookieManger),
        DECLARE_NAPI_FUNCTION("webNativeJavaScriptValue", WebNativeJavaScriptValue),
        DECLARE_NAPI_FUNCTION("webArkWebNetError", WebArkWebNetError),
        DECLARE_NAPI_FUNCTION("webRegisterCustomSchemes", WebRegisterCustomSchemes),
        DECLARE_NAPI_FUNCTION("initResourceManager", InitResourceManager),
        DECLARE_NAPI_FUNCTION("setSchemeHandler", SetSchemeHandler),
        DECLARE_NAPI_FUNCTION("webSchemeHandlerProcess", WebSchemeHandlerProcess),
        DECLARE_NAPI_FUNCTION("registerCustomSchemes", RegisterCustomSchemes),
        DECLARE_NAPI_FUNCTION("requestStop", RequestStop),
        DECLARE_NAPI_FUNCTION("setAsyncReadCallback", SetAsyncReadCallback),
    };
    
    AddExFunction(desc);

    napi_define_properties(env, exports, desc.size(), desc.data());
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