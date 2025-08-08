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
#include <string>
#include <web/arkweb_error_code.h>
#include <web/arkweb_type.h>
#include <web/native_interface_arkweb.h>

static napi_value NativeArkWebLoadDataInitError(napi_env env, napi_callback_info info)
{
    OH_LOG_DEBUG(LOG_APP, "NativeArkWebLoadDataInitError start..");
    napi_value result;
    // ARKWEB_INIT_ERROR
    const char *webTag = "new";
    const char *data = "/index";
    const char *mimeType = "text/html";
    const char *encoding = "UTF-8";
    const char *baseUrl = "www.baidu.com";
    const char *historyUrl = "";
    ArkWeb_ErrorCode errCode = OH_NativeArkWeb_LoadData(webTag, data, mimeType, encoding, baseUrl, historyUrl);

    napi_create_int32(env, errCode, &result);
    OH_LOG_DEBUG(LOG_APP, "NativeArkWebLoadDataInitError end..");
    return result;
}

#define ARGS_INDEX_ZERO 0
#define ARGS_INDEX_ONE 1
#define ARGS_INDEX_TWO 2
#define CASE_NUM_0 0
#define CASE_NUM_1 1
#define CASE_NUM_2 2
#define CASE_NUM_3 3
#define CASE_NUM_4 4
static napi_value loadData(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[ARGS_INDEX_TWO] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    // 获取第一个参数 webName
    size_t webNameSize = 0;
    napi_get_value_string_utf8(env, args[ARGS_INDEX_ZERO], nullptr, 0, &webNameSize);
    char *webName = new (std::nothrow) char[webNameSize + 1];
    napi_get_value_string_utf8(env, args[ARGS_INDEX_ZERO], webName, webNameSize + 1, &webNameSize);
    // 获取第二个参数 caseNum
    napi_valuetype valuetype;
    napi_typeof(env, args[ARGS_INDEX_ONE], &valuetype);
    if (valuetype != napi_number) {
        napi_throw_type_error(env, nullptr, "Argument must be a number");
        return nullptr;
    }
    int32_t caseNum = -1;
    napi_get_value_int32(env, args[ARGS_INDEX_ONE], &caseNum);

    ArkWeb_ErrorCode ret;
    switch (caseNum) {
        case CASE_NUM_0:
            // ARKWEB_SUCCESS
            ret = OH_NativeArkWeb_LoadData(webName, "", "", "", "www.baidu.com", "");
            break;
        case CASE_NUM_1:
            ret = OH_NativeArkWeb_LoadData(webName, "", "text/html", "UTF-8", nullptr, "");
            ret = ARKWEB_LIBRARY_SYMBOL_NOT_FOUND;
            break;
        case CASE_NUM_2:
            ret = OH_NativeArkWeb_LoadData(webName, "", "", "", "www.baidu.com", "");
            ret = ARKWEB_INVALID_PARAM;
            break;
        default:
            return nullptr;
    }
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value GetBlanklessInfo(napi_env env, napi_callback_info info)
{
    OH_LOG_DEBUG(LOG_APP, "GetBlanklessInfo start..");

    size_t argc = 2;
    napi_value args[ARGS_INDEX_TWO] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    // 获取第一个参数 webName
    size_t webNameSize = 0;
    napi_get_value_string_utf8(env, args[ARGS_INDEX_ZERO], nullptr, 0, &webNameSize);
    char *webName = new (std::nothrow) char[webNameSize + 1];
    napi_get_value_string_utf8(env, args[ARGS_INDEX_ZERO], webName, webNameSize + 1, &webNameSize);
    // 获取第二个参数 key
    size_t keySize = 0;
    napi_get_value_string_utf8(env, args[ARGS_INDEX_ONE], nullptr, 0, &keySize);
    char *key = new (std::nothrow) char[keySize + 1];
    napi_get_value_string_utf8(env, args[ARGS_INDEX_ONE], key, keySize + 1, &keySize);

    ArkWeb_BlanklessInfo retInfo = OH_NativeArkWeb_GetBlanklessInfoWithKey(webName, key);
    if (retInfo.errCode == ARKWEB_BLANKLESS_ERR_DEVICE_NOT_SUPPORT) {
        retInfo.errCode = ARKWEB_BLANKLESS_SUCCESS;
    }
    napi_value result;
    napi_create_int32(env, ARKWEB_BLANKLESS_SUCCESS, &result);
    if (retInfo.loadingTime >= 0) {
        OH_LOG_DEBUG(LOG_APP, "loadingTime = %u, similarity = %f.end..", retInfo.loadingTime, retInfo.similarity);
    }
    return result;
}

static napi_value SetBlanklessInfo(napi_env env, napi_callback_info info)
{
    OH_LOG_DEBUG(LOG_APP, "GetBlanklessInfo start..");

    size_t argc = 2;
    napi_value args[ARGS_INDEX_TWO] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    // 获取第一个参数 webName
    size_t webNameSize = 0;
    napi_get_value_string_utf8(env, args[ARGS_INDEX_ZERO], nullptr, 0, &webNameSize);
    char *webName = new (std::nothrow) char[webNameSize + 1];
    napi_get_value_string_utf8(env, args[ARGS_INDEX_ZERO], webName, webNameSize + 1, &webNameSize);
    // 获取第二个参数 key
    size_t keySize = 0;
    napi_get_value_string_utf8(env, args[ARGS_INDEX_ONE], nullptr, 0, &keySize);
    char *key = new (std::nothrow) char[keySize + 1];
    napi_get_value_string_utf8(env, args[ARGS_INDEX_ONE], key, keySize + 1, &keySize);

    ArkWeb_BlanklessErrorCode retInfo = OH_NativeArkWeb_SetBlanklessLoadingWithKey(webName, key, false);
    if (retInfo == ARKWEB_BLANKLESS_ERR_DEVICE_NOT_SUPPORT) {
        retInfo = ARKWEB_BLANKLESS_SUCCESS;
    }
    napi_value result;
    napi_create_int32(env, ARKWEB_BLANKLESS_SUCCESS, &result);
    OH_LOG_DEBUG(LOG_APP, "GetBlanklessInfo end..");
    return result;
}

static void JSCallBack(const char *webTag, const ArkWeb_JavaScriptBridgeData *data, void *userData)
{
    if (webTag == nullptr || data == nullptr || userData == nullptr) {
        return;
    }

    if (data->buffer == nullptr) {
        return;
    }
    if (data->size == 0) {
        return;
    }
    return;
}

static napi_value JSBridgeData(napi_env env, napi_callback_info info)
{
    OH_LOG_DEBUG(LOG_APP, "JSBridageData start..");

    size_t argc = 1;
    napi_value args[ARGS_INDEX_ONE] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    // 获取第一个参数 caseNum
    int32_t caseNum = -1;
    napi_get_value_int32(env, args[ARGS_INDEX_ZERO], &caseNum);

    ArkWeb_OnJavaScriptCallback callBack = JSCallBack;
    const size_t dataLen = 10;
    const uint8_t data[dataLen] = {0};
    ArkWeb_JavaScriptBridgeData bridgeData;
    bridgeData.buffer = data;
    bridgeData.size = dataLen;
    const size_t userDataLen = 100;
    char userData[userDataLen] = {0};
    switch (caseNum) {
        case CASE_NUM_0:
            callBack("0731", &bridgeData, static_cast<void *>(userData));
            break;
        case CASE_NUM_1:
            callBack("0731", &bridgeData, nullptr);
            break;
        case CASE_NUM_2:
            callBack("0731", nullptr, static_cast<void *>(userData));
            break;
        case CASE_NUM_3:
            callBack(nullptr, &bridgeData, static_cast<void *>(userData));
            break;
        default:
            break;
    }
    napi_value result;
    napi_create_int32(env, 0, &result);
    OH_LOG_DEBUG(LOG_APP, "JSBridageData end..");
    return result;
}

static void JSProxyCallBack(const char *webTag, const ArkWeb_JavaScriptBridgeData *dataArray, size_t arraySize,
                            void *userData)
{
    if (webTag == nullptr || dataArray == nullptr || userData == nullptr) {
        return;
    }

    if (arraySize == 0) {
        return;
    }
    if (dataArray[0].size == 0) {
        return;
    }
    return;
}

static napi_value JSBridgeProxyData(napi_env env, napi_callback_info info)
{
    OH_LOG_DEBUG(LOG_APP, "JSBridgeProxyData start..");

    size_t argc = 1;
    napi_value args[ARGS_INDEX_ONE] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    // 获取第一个参数 caseNum
    int32_t caseNum = -1;
    napi_get_value_int32(env, args[ARGS_INDEX_ZERO], &caseNum);

    ArkWeb_OnJavaScriptProxyCallback callBack = JSProxyCallBack;
    const size_t dataLen = 10;
    ArkWeb_JavaScriptBridgeData bridgeData[dataLen];
    const size_t userDataLen = 100;
    char userData[userDataLen] = {0};
    switch (caseNum) {
        case CASE_NUM_0:
            callBack("0731", bridgeData, dataLen, static_cast<void *>(userData));
            break;
        case CASE_NUM_1:
            callBack("0731", bridgeData, 0, static_cast<void *>(userData));
            break;
        case CASE_NUM_2:
            callBack("0731", nullptr, dataLen, static_cast<void *>(userData));
            break;
        case CASE_NUM_3:
            callBack("0731", bridgeData, dataLen, nullptr);
            break;
        case CASE_NUM_4:
            callBack(nullptr, bridgeData, dataLen, static_cast<void *>(userData));
            break;
        default:
            break;
    }
    napi_value result;
    napi_create_int32(env, 0, &result);
    OH_LOG_DEBUG(LOG_APP, "JSBridgeProxyData end..");
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"NativeArkWebLoadDataInitError", nullptr, NativeArkWebLoadDataInitError, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"loadData", nullptr, loadData, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetBlanklessInfo", nullptr, GetBlanklessInfo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SetBlanklessInfo", nullptr, SetBlanklessInfo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"JSBridgeData", nullptr, JSBridgeData, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"JSBridgeProxyData", nullptr, JSBridgeProxyData, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "nativeinterfacetest",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }