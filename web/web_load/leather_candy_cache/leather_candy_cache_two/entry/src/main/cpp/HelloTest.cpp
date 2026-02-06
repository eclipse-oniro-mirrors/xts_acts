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
#include "hilog/log.h"
#include "napi/native_api.h"
#include "web/arkweb_interface.h"
#include "web/native_interface_arkweb.h"
#include <iostream>
#include <new>
#include <string>
using namespace std;
constexpr unsigned int LOG_PRINT_DOMAIN = 0xFF00;
const char *g_tag = "YB";
const char *g_doblanklessGetInfoValue2048Key = "";
const char *g_doblanklessGetInfoValueWithKey = "GetBlanklessInfoWithKey";
const char *g_doblanklessINVALID_ARGS = "\0";
const char *g_doblanklessINVALID_ARGS_LENGTH1 = "y\0";
const char *g_doblanklessINVALID_ARGS_LENGTH2048 = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa";
const char *g_doblanklessINVALID_ARGS_LENGTH2049 = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa";
const char *g_setBlanklessLoadingWithKey = "SetBlanklessInfoWithKey";
const char *g_doblanklessClearWithKey = "ClearBlankLoadingCache";
const int g_errCode = 801;
const double g_similarity = 0.33;

static napi_value Doblankless_Success(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    // 获取第一个参数 webTag
    size_t webTagSize = 0;
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &webTagSize);
    char *webTagValue = new (std::nothrow) char[webTagSize + 1];
    size_t webTagLength = 0;
    napi_get_value_string_utf8(env, args[0], webTagValue, webTagSize + 1, &webTagLength);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, g_tag, "%{public}s, length = %{public}d", webTagValue,
                 (int)webTagSize);
    napi_value Capacity;
    ArkWeb_BlanklessInfo blanklessInfo =
        OH_NativeArkWeb_GetBlanklessInfoWithKey(webTagValue, g_doblanklessGetInfoValueWithKey);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, g_tag,
                 "mmx1 similarity:%{public}f,loadingTime:%{public}d,errCode:%{public}d", blanklessInfo.similarity,
                 blanklessInfo.loadingTime, blanklessInfo.errCode);
    if (blanklessInfo.errCode == ARKWEB_BLANKLESS_SUCCESS) {
        if (blanklessInfo.similarity >= g_similarity) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, g_tag,
                         "mmx2 similarity:%{public}f,loadingTime:%{public}d,errcode:%{public}d",
                         blanklessInfo.similarity, blanklessInfo.loadingTime, blanklessInfo.errCode);
            ArkWeb_BlanklessErrorCode err =
                OH_NativeArkWeb_SetBlanklessLoadingWithKey(webTagValue, g_doblanklessGetInfoValueWithKey, true);
            napi_create_double(env, blanklessInfo.errCode, &Capacity);
        } else {
            ArkWeb_BlanklessErrorCode err =
                OH_NativeArkWeb_SetBlanklessLoadingWithKey(webTagValue, g_doblanklessGetInfoValueWithKey, true);
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, g_tag,
                         "mmx3 similarity:%{public}f,loadingTime:%{public}d,errcode:%{public}d",
                         blanklessInfo.similarity, blanklessInfo.loadingTime, err);
            napi_create_double(env, err, &Capacity);
        }
    } else if (blanklessInfo.errCode == g_errCode) {
        napi_create_double(env, blanklessInfo.errCode, &Capacity);
    }
    return Capacity;
}
static napi_value Doblankless_Success100(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    // 获取第一个参数 webTag
    size_t webTagSize = 0;
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &webTagSize);
    char *webTagValue = new (std::nothrow) char[webTagSize + 1];
    size_t webTagLength = 0;
    napi_get_value_string_utf8(env, args[0], webTagValue, webTagSize + 1, &webTagLength);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, g_tag, "%{public}s, length = %{public}d", webTagValue,
                 (int)webTagSize);
    napi_value Capacity;
    ArkWeb_BlanklessInfo blanklessInfo =
        OH_NativeArkWeb_GetBlanklessInfoWithKey(webTagValue, "a_99");
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, g_tag,
                 "mmx1 similarity:%{public}f,loadingTime:%{public}d,errCode:%{public}d", blanklessInfo.similarity,
                 blanklessInfo.loadingTime, blanklessInfo.errCode);
    if (blanklessInfo.errCode == ARKWEB_BLANKLESS_SUCCESS) {
        if (blanklessInfo.similarity >= g_similarity) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, g_tag,
                         "mmx2 similarity:%{public}f,loadingTime:%{public}d,errcode:%{public}d",
                         blanklessInfo.similarity, blanklessInfo.loadingTime, blanklessInfo.errCode);
            ArkWeb_BlanklessErrorCode err =
                OH_NativeArkWeb_SetBlanklessLoadingWithKey(webTagValue, "a_99", true);
            napi_create_double(env, blanklessInfo.errCode, &Capacity);
        } else {
            ArkWeb_BlanklessErrorCode err =
                OH_NativeArkWeb_SetBlanklessLoadingWithKey(webTagValue, "a_99", true);
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, g_tag,
                         "mmx3 similarity:%{public}f,loadingTime:%{public}d,errcode:%{public}d",
                         blanklessInfo.similarity, blanklessInfo.loadingTime, err);
            napi_create_double(env, err, &Capacity);
        }
    } else if (blanklessInfo.errCode == g_errCode) {
        napi_create_double(env, blanklessInfo.errCode, &Capacity);
    }
    return Capacity;
}
static napi_value ClearBlanklessLoadingCache(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    // 获取第一个参数 webTag
    size_t webTagSize = 0;
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &webTagSize);
    char *webTagValue = new (std::nothrow) char[webTagSize + 1];
    size_t webTagLength = 0;
    napi_get_value_string_utf8(env, args[0], webTagValue, webTagSize + 1, &webTagLength);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, g_tag, "%{public}s, length = %{public}d", webTagValue,
                 (int)webTagSize);
    const char *key[1] = {g_doblanklessGetInfoValueWithKey};
    OH_NativeArkWeb_ClearBlanklessLoadingCache(key, 1);
    return nullptr;
}
static napi_value ClearBlanklessLoadingCache100(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    // 获取第一个参数 webTag
    size_t webTagSize = 0;
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &webTagSize);
    char *webTagValue = new (std::nothrow) char[webTagSize + 1];
    size_t webTagLength = 0;
    napi_get_value_string_utf8(env, args[0], webTagValue, webTagSize + 1, &webTagLength);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, g_tag, "%{public}s, length = %{public}d", webTagValue,
                 (int)webTagSize);
    const char *key[100] = {"a_0", "a_1", "a_2", "a_3", "a_4", "a_5", "a_6", "a_7", "a_8", "a_9", "a_10", "a_11", "a_12", "a_13", "a_14", "a_15", "a_16", "a_17", "a_18", "a_19", "a_20", "a_21", "a_22", "a_23", "a_24", "a_25", "a_26", "a_27", "a_28", "a_29", "a_30", "a_31", "a_32", "a_33", "a_34", "a_35", "a_36", "a_37", "a_38", "a_39", "a_40", "a_41", "a_42", "a_43", "a_44", "a_45", "a_46", "a_47", "a_48", "a_49", "a_50", "a_51", "a_52", "a_53", "a_54", "a_55", "a_56", "a_57", "a_58", "a_59", "a_60", "a_61", "a_62", "a_63", "a_64", "a_65", "a_66", "a_67", "a_68", "a_69", "a_70", "a_71", "a_72", "a_73", "a_74", "a_75", "a_76", "a_77", "a_78", "a_79", "a_80", "a_81", "a_82", "a_83", "a_84", "a_85", "a_86", "a_87", "a_88", "a_89", "a_90", "a_91", "a_92", "a_93", "a_94", "a_95", "a_96", "a_97", "a_98", "a_99"};
    OH_NativeArkWeb_ClearBlanklessLoadingCache(key, 100);
    return nullptr;
}
static napi_value ClearBlanklessLoadingCache101(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    // 获取第一个参数 webTag
    size_t webTagSize = 0;
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &webTagSize);
    char *webTagValue = new (std::nothrow) char[webTagSize + 1];
    size_t webTagLength = 0;
    napi_get_value_string_utf8(env, args[0], webTagValue, webTagSize + 1, &webTagLength);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, g_tag, "%{public}s, length = %{public}d", webTagValue,
                 (int)webTagSize);
    const char *key[101] = {"a_00", "a_0", "a_1", "a_2", "a_3", "a_4", "a_5", "a_6", "a_7", "a_8", "a_9", "a_10", "a_11", "a_12", "a_13", "a_14", "a_15", "a_16", "a_17", "a_18", "a_19", "a_20", "a_21", "a_22", "a_23", "a_24", "a_25", "a_26", "a_27", "a_28", "a_29", "a_30", "a_31", "a_32", "a_33", "a_34", "a_35", "a_36", "a_37", "a_38", "a_39", "a_40", "a_41", "a_42", "a_43", "a_44", "a_45", "a_46", "a_47", "a_48", "a_49", "a_50", "a_51", "a_52", "a_53", "a_54", "a_55", "a_56", "a_57", "a_58", "a_59", "a_60", "a_61", "a_62", "a_63", "a_64", "a_65", "a_66", "a_67", "a_68", "a_69", "a_70", "a_71", "a_72", "a_73", "a_74", "a_75", "a_76", "a_77", "a_78", "a_79", "a_80", "a_81", "a_82", "a_83", "a_84", "a_85", "a_86", "a_87", "a_88", "a_89", "a_90", "a_91", "a_92", "a_93", "a_94", "a_95", "a_96", "a_97", "a_98", "a_99"};
    OH_NativeArkWeb_ClearBlanklessLoadingCache(key, 101);
    return nullptr;
}
static napi_value Doblankless_ERR_KEY_NOT_MATCH(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    // 获取第一个参数 webTag
    size_t webTagSize = 0;
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &webTagSize);
    char *webTagValue = new (std::nothrow) char[webTagSize + 1];
    size_t webTagLength = 0;
    napi_get_value_string_utf8(env, args[0], webTagValue, webTagSize + 1, &webTagLength);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, g_tag, "%{public}s, length = %{public}d", webTagValue,
                 (int)webTagSize);

    napi_value Capacity;
    ArkWeb_BlanklessInfo blanklessInfo =
        OH_NativeArkWeb_GetBlanklessInfoWithKey(webTagValue, g_doblanklessGetInfoValueWithKey);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, g_tag,
                 "mmx1 similarity:%{public}f,loadingTime:%{public}d,errCode:%{public}d", blanklessInfo.similarity,
                 blanklessInfo.loadingTime, blanklessInfo.errCode);
    if (blanklessInfo.errCode == ARKWEB_BLANKLESS_SUCCESS) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, g_tag, "mmx similarity:%{public}f,loadingTime:%{public}d",
                     blanklessInfo.similarity, blanklessInfo.loadingTime);
        ArkWeb_BlanklessErrorCode err =
            OH_NativeArkWeb_SetBlanklessLoadingWithKey(webTagValue, g_setBlanklessLoadingWithKey, true);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, g_tag,
                     "mmx2 similarity:%{public}f,loadingTime:%{public}d,errcode:%{public}d", blanklessInfo.similarity,
                     blanklessInfo.loadingTime, err);
        if (err == ARKWEB_BLANKLESS_ERR_KEY_NOT_MATCH) {
            napi_create_double(env, err, &Capacity);
        }
    } else if (blanklessInfo.errCode == g_errCode) {
        napi_create_double(env, blanklessInfo.errCode, &Capacity);
    }
    return Capacity;
}

static napi_value Doblankless_CONTROLLER_NOT_INITED(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    // 获取第一个参数 webTag
    size_t webTagSize = 0;
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &webTagSize);
    char *webTagValue = new (std::nothrow) char[webTagSize + 1];
    size_t webTagLength = 0;
    napi_get_value_string_utf8(env, args[0], webTagValue, webTagSize + 1, &webTagLength);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, g_tag, "%{public}s, length = %{public}d", webTagValue,
                 (int)webTagSize);

    napi_value Capacity;
    ArkWeb_BlanklessInfo blanklessInfo = OH_NativeArkWeb_GetBlanklessInfoWithKey("", g_doblanklessGetInfoValueWithKey);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, g_tag,
                 "mmx1 similarity:%{public}f,loadingTime:%{public}d,errCode:%{public}d", blanklessInfo.similarity,
                 blanklessInfo.loadingTime, blanklessInfo.errCode);
    if (blanklessInfo.errCode == ARKWEB_BLANKLESS_ERR_CONTROLLER_NOT_INITED) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, g_tag, "mmx similarity:%{public}f,loadingTime:%{public}d",
                     blanklessInfo.similarity, blanklessInfo.loadingTime);
        napi_create_double(env, blanklessInfo.errCode, &Capacity);
    } else if (blanklessInfo.errCode == g_errCode) {
        napi_create_double(env, blanklessInfo.errCode, &Capacity);
    }
    return Capacity;
}

static napi_value Doblankless_INVALID_ARGS(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    // 获取第一个参数 webTag
    size_t webTagSize = 0;
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &webTagSize);
    char *webTagValue = new (std::nothrow) char[webTagSize + 1];
    size_t webTagLength = 0;
    napi_get_value_string_utf8(env, args[0], webTagValue, webTagSize + 1, &webTagLength);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, g_tag, "%{public}s, length = %{public}d", webTagValue,
                 (int)webTagSize);

    napi_value Capacity;
    ArkWeb_BlanklessInfo blanklessInfo =
        OH_NativeArkWeb_GetBlanklessInfoWithKey(webTagValue, g_doblanklessINVALID_ARGS);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, g_tag,
                 "mmx1 similarity:%{public}f,loadingTime:%{public}d,errCode:%{public}d", blanklessInfo.similarity,
                 blanklessInfo.loadingTime, blanklessInfo.errCode);
    if (blanklessInfo.errCode == ARKWEB_BLANKLESS_ERR_INVALID_ARGS) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, g_tag, "mmx similarity:%{public}f,loadingTime:%{public}d",
                     blanklessInfo.similarity, blanklessInfo.loadingTime);
        napi_create_double(env, blanklessInfo.errCode, &Capacity);
    } else if (blanklessInfo.errCode == g_errCode) {
        napi_create_double(env, blanklessInfo.errCode, &Capacity);
    }
    return Capacity;
}
static napi_value Doblankless_INVALID_ARGS_SET_ZERO(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    // 获取第一个参数 webTag
    size_t webTagSize = 0;
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &webTagSize);
    char *webTagValue = new (std::nothrow) char[webTagSize + 1];
    size_t webTagLength = 0;
    napi_get_value_string_utf8(env, args[0], webTagValue, webTagSize + 1, &webTagLength);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, g_tag, "%{public}s, length = %{public}d", webTagValue,
                 (int)webTagSize);
    napi_value Capacity;
    ArkWeb_BlanklessInfo blanklessInfo =
        OH_NativeArkWeb_GetBlanklessInfoWithKey(webTagValue, g_doblanklessINVALID_ARGS);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, g_tag,
                 "mmx1 similarity:%{public}f,loadingTime:%{public}d,errCode:%{public}d", blanklessInfo.similarity,
                 blanklessInfo.loadingTime, blanklessInfo.errCode);
            ArkWeb_BlanklessErrorCode err =
                OH_NativeArkWeb_SetBlanklessLoadingWithKey(webTagValue, g_doblanklessINVALID_ARGS, true);
            napi_create_double(env, err, &Capacity);
    return Capacity;
}
static napi_value Doblankless_INVALID_ARGS_SET_ONE(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    // 获取第一个参数 webTag
    size_t webTagSize = 0;
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &webTagSize);
    char *webTagValue = new (std::nothrow) char[webTagSize + 1];
    size_t webTagLength = 0;
    napi_get_value_string_utf8(env, args[0], webTagValue, webTagSize + 1, &webTagLength);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, g_tag, "%{public}s, length = %{public}d", webTagValue,
                 (int)webTagSize);
    napi_value Capacity;
    ArkWeb_BlanklessInfo blanklessInfo =
        OH_NativeArkWeb_GetBlanklessInfoWithKey(webTagValue, g_doblanklessINVALID_ARGS_LENGTH1);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, g_tag,
                 "mmx1 similarity:%{public}f,loadingTime:%{public}d,errCode:%{public}d", blanklessInfo.similarity,
                 blanklessInfo.loadingTime, blanklessInfo.errCode);
    if (blanklessInfo.errCode == ARKWEB_BLANKLESS_SUCCESS) {
            ArkWeb_BlanklessErrorCode err =
                OH_NativeArkWeb_SetBlanklessLoadingWithKey(webTagValue, g_doblanklessINVALID_ARGS_LENGTH1, true);
            napi_create_double(env, err, &Capacity);
    } else if (blanklessInfo.errCode == g_errCode) {
        napi_create_double(env, blanklessInfo.errCode, &Capacity);
    }
    return Capacity;
}
static napi_value Doblankless_INVALID_ARGS_GET_ONE(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    // 获取第一个参数 webTag
    size_t webTagSize = 0;
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &webTagSize);
    char *webTagValue = new (std::nothrow) char[webTagSize + 1];
    size_t webTagLength = 0;
    napi_get_value_string_utf8(env, args[0], webTagValue, webTagSize + 1, &webTagLength);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, g_tag, "%{public}s, length = %{public}d", webTagValue,
                 (int)webTagSize);

    napi_value Capacity;
    ArkWeb_BlanklessInfo blanklessInfo =
        OH_NativeArkWeb_GetBlanklessInfoWithKey(webTagValue, g_doblanklessINVALID_ARGS_LENGTH1);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, g_tag,
                 "Doblankless_INVALID_ARGS_GET_ONE similarity:%{public}f,loadingTime:%{public}d,errCode:%{public}d", blanklessInfo.similarity,
                 blanklessInfo.loadingTime, blanklessInfo.errCode);
    if (blanklessInfo.errCode == ARKWEB_BLANKLESS_ERR_INVALID_ARGS) {
        napi_create_double(env, blanklessInfo.errCode, &Capacity);
    } else if (blanklessInfo.errCode == g_errCode) {
        napi_create_double(env, blanklessInfo.errCode, &Capacity);
    }
    return Capacity;
}
static napi_value Doblankless_INVALID_ARGS_SET_2048(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    // 获取第一个参数 webTag
    size_t webTagSize = 0;
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &webTagSize);
    char *webTagValue = new (std::nothrow) char[webTagSize + 1];
    size_t webTagLength = 0;
    napi_get_value_string_utf8(env, args[0], webTagValue, webTagSize + 1, &webTagLength);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, g_tag, "%{public}s, length = %{public}d", webTagValue,
                 (int)webTagSize);
    napi_value Capacity;
    ArkWeb_BlanklessInfo blanklessInfo =
        OH_NativeArkWeb_GetBlanklessInfoWithKey(webTagValue, g_doblanklessINVALID_ARGS_LENGTH2048);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, g_tag,
                 "mmx1 similarity:%{public}f,loadingTime:%{public}d,errCode:%{public}d", blanklessInfo.similarity,
                 blanklessInfo.loadingTime, blanklessInfo.errCode);
    if (blanklessInfo.errCode == ARKWEB_BLANKLESS_SUCCESS) {
            ArkWeb_BlanklessErrorCode err =
                OH_NativeArkWeb_SetBlanklessLoadingWithKey(webTagValue, g_doblanklessINVALID_ARGS_LENGTH2048, true);
            napi_create_double(env, err, &Capacity);
    } else if (blanklessInfo.errCode == g_errCode) {
        napi_create_double(env, blanklessInfo.errCode, &Capacity);
    }
    return Capacity;
}
static napi_value Doblankless_INVALID_ARGS_GET_2048(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    // 获取第一个参数 webTag
    size_t webTagSize = 0;
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &webTagSize);
    char *webTagValue = new (std::nothrow) char[webTagSize + 1];
    size_t webTagLength = 0;
    napi_get_value_string_utf8(env, args[0], webTagValue, webTagSize + 1, &webTagLength);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, g_tag, "%{public}s, length = %{public}d", webTagValue,
                 (int)webTagSize);
    napi_value Capacity;
    ArkWeb_BlanklessInfo blanklessInfo =
        OH_NativeArkWeb_GetBlanklessInfoWithKey(webTagValue, g_doblanklessINVALID_ARGS_LENGTH2048);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, g_tag,
                 "mmx1 similarity:%{public}f,loadingTime:%{public}d,errCode:%{public}d", blanklessInfo.similarity,
                 blanklessInfo.loadingTime, blanklessInfo.errCode);
    napi_create_double(env, blanklessInfo.errCode, &Capacity);
    if (blanklessInfo.errCode == ARKWEB_BLANKLESS_SUCCESS) {
        if (blanklessInfo.similarity >= g_similarity) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, g_tag,
                         "mmx2 similarity:%{public}f,loadingTime:%{public}d,errcode:%{public}d",
                         blanklessInfo.similarity, blanklessInfo.loadingTime, blanklessInfo.errCode);
            ArkWeb_BlanklessErrorCode err =
                OH_NativeArkWeb_SetBlanklessLoadingWithKey(webTagValue, g_doblanklessINVALID_ARGS_LENGTH2048, true);
            napi_create_double(env, err, &Capacity);
        } else {
            ArkWeb_BlanklessErrorCode err =
                OH_NativeArkWeb_SetBlanklessLoadingWithKey(webTagValue, g_doblanklessGetInfoValueWithKey, true);
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, g_tag,
                         "mmx3 similarity:%{public}f,loadingTime:%{public}d,errcode:%{public}d",
                         blanklessInfo.similarity, blanklessInfo.loadingTime, err);
            napi_create_double(env, err, &Capacity);
        }
    } else if (blanklessInfo.errCode == g_errCode) {
        napi_create_double(env, blanklessInfo.errCode, &Capacity);
    }
    return Capacity;
}
static napi_value Doblankless_INVALID_ARGS_SET_2049(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    // 获取第一个参数 webTag
    size_t webTagSize = 0;
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &webTagSize);
    char *webTagValue = new (std::nothrow) char[webTagSize + 1];
    size_t webTagLength = 0;
    napi_get_value_string_utf8(env, args[0], webTagValue, webTagSize + 1, &webTagLength);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, g_tag, "%{public}s, length = %{public}d", webTagValue,
                 (int)webTagSize);
    napi_value Capacity;
    ArkWeb_BlanklessInfo blanklessInfo =
        OH_NativeArkWeb_GetBlanklessInfoWithKey(webTagValue, g_doblanklessINVALID_ARGS_LENGTH2049);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, g_tag,
                 "mmx1 similarity:%{public}f,loadingTime:%{public}d,errCode:%{public}d", blanklessInfo.similarity,
                 blanklessInfo.loadingTime, blanklessInfo.errCode);
            ArkWeb_BlanklessErrorCode err =
                OH_NativeArkWeb_SetBlanklessLoadingWithKey(webTagValue, g_doblanklessINVALID_ARGS_LENGTH2049, true);
            napi_create_double(env, err, &Capacity);
    return Capacity;
}
static napi_value Doblankless_INVALID_ARGS_GET_2049(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    // 获取第一个参数 webTag
    size_t webTagSize = 0;
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &webTagSize);
    char *webTagValue = new (std::nothrow) char[webTagSize + 1];
    size_t webTagLength = 0;
    napi_get_value_string_utf8(env, args[0], webTagValue, webTagSize + 1, &webTagLength);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, g_tag, "%{public}s, length = %{public}d", webTagValue,
                 (int)webTagSize);
    napi_value Capacity;
    ArkWeb_BlanklessInfo blanklessInfo =
        OH_NativeArkWeb_GetBlanklessInfoWithKey(webTagValue, g_doblanklessINVALID_ARGS_LENGTH2049);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, g_tag,
                 "mmx1 similarity:%{public}f,loadingTime:%{public}d,errCode:%{public}d", blanklessInfo.similarity,
                 blanklessInfo.loadingTime, blanklessInfo.errCode);
    napi_create_double(env, blanklessInfo.errCode, &Capacity);
    return Capacity;
}

static napi_value SetCacheCapacity_1(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    // 获取第一个参数 webTag
    size_t webTagSize = 0;
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &webTagSize);
    char *webTagValue = new (std::nothrow) char[webTagSize + 1];
    size_t webTagLength = 0;
    napi_value Capacity;
    napi_get_value_string_utf8(env, args[0], webTagValue, webTagSize + 1, &webTagLength);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, g_tag, "%{public}s, length = %{public}d", webTagValue,
                 (int)webTagSize);
    uint32_t capacity = OH_NativeArkWeb_SetBlanklessLoadingCacheCapacity(-1);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, g_tag, "testLog: SetCacheCapacity0:capacity:%{public}d",
                 capacity);
    napi_create_uint32(env, capacity, &Capacity);
    return Capacity;
}

static napi_value SetCacheCapacity0(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    // 获取第一个参数 webTag
    size_t webTagSize = 0;
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &webTagSize);
    char *webTagValue = new (std::nothrow) char[webTagSize + 1];
    size_t webTagLength = 0;
    napi_value Capacity;
    napi_get_value_string_utf8(env, args[0], webTagValue, webTagSize + 1, &webTagLength);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, g_tag, "%{public}s, length = %{public}d", webTagValue,
                 (int)webTagSize);
    uint32_t capacity = OH_NativeArkWeb_SetBlanklessLoadingCacheCapacity(0);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, g_tag, "testLog: SetCacheCapacity0:capacity:%{public}d",
                 capacity);
    napi_create_uint32(env, capacity, &Capacity);
    return Capacity;
}

static napi_value SetCacheCapacity50(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    // 获取第一个参数 webTag
    size_t webTagSize = 0;
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &webTagSize);
    char *webTagValue = new (std::nothrow) char[webTagSize + 1];
    size_t webTagLength = 0;
    napi_value Capacity;
    napi_get_value_string_utf8(env, args[0], webTagValue, webTagSize + 1, &webTagLength);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, g_tag, "%{public}s, length = %{public}d", webTagValue,
                 (int)webTagSize);
    uint32_t capacity = OH_NativeArkWeb_SetBlanklessLoadingCacheCapacity(50);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, g_tag, "testLog: SetCacheCapacity0:capacity:%{public}d",
                 capacity);
    napi_create_uint32(env, capacity, &Capacity);
    return Capacity;
}

static napi_value SetCacheCapacity101(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    // 获取第一个参数 webTag
    size_t webTagSize = 0;
    napi_get_value_string_utf8(env, args[0], nullptr, 0, &webTagSize);
    char *webTagValue = new (std::nothrow) char[webTagSize + 1];
    size_t webTagLength = 0;
    napi_value Capacity;
    napi_get_value_string_utf8(env, args[0], webTagValue, webTagSize + 1, &webTagLength);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, g_tag, "%{public}s, length = %{public}d", webTagValue,
                 (int)webTagSize);
    uint32_t capacity = OH_NativeArkWeb_SetBlanklessLoadingCacheCapacity(101);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, g_tag, "testLog: SetCacheCapacity0:capacity:%{public}d",
                 capacity);
    napi_create_uint32(env, capacity, &Capacity);
    return Capacity;
}

static napi_value Add(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    napi_valuetype valuetype0;
    napi_typeof(env, args[0], &valuetype0);

    napi_valuetype valuetype1;
    napi_typeof(env, args[1], &valuetype1);

    double value0;
    napi_get_value_double(env, args[0], &value0);

    double value1;
    napi_get_value_double(env, args[1], &value1);

    napi_value sum;
    napi_create_double(env, value0 + value1, &sum);

    return sum;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"add", nullptr, Add, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"doblankless_Success", nullptr, Doblankless_Success, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"doblankless_Success100", nullptr, Doblankless_Success100, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"clearBlanklessLoadingCache", nullptr, ClearBlanklessLoadingCache, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"clearBlanklessLoadingCache100", nullptr, ClearBlanklessLoadingCache100, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"clearBlanklessLoadingCache101", nullptr, ClearBlanklessLoadingCache101, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"doblankless_ERR_KEY_NOT_MATCH", nullptr, Doblankless_ERR_KEY_NOT_MATCH, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"doblankless_CONTROLLER_NOT_INITED", nullptr, Doblankless_CONTROLLER_NOT_INITED, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"doblankless_INVALID_ARGS", nullptr, Doblankless_INVALID_ARGS, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"doblankless_INVALID_ARGS_SET_ZERO", nullptr, Doblankless_INVALID_ARGS_SET_ZERO, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"doblankless_INVALID_ARGS_SET_ONE", nullptr, Doblankless_INVALID_ARGS_SET_ONE, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"doblankless_INVALID_ARGS_GET_ONE", nullptr, Doblankless_INVALID_ARGS_GET_ONE, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"doblankless_INVALID_ARGS_SET_2048", nullptr, Doblankless_INVALID_ARGS_SET_2048, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"doblankless_INVALID_ARGS_GET_2048", nullptr, Doblankless_INVALID_ARGS_GET_2048, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"doblankless_INVALID_ARGS_SET_2049", nullptr, Doblankless_INVALID_ARGS_SET_2049, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"doblankless_INVALID_ARGS_GET_2049", nullptr, Doblankless_INVALID_ARGS_GET_2049, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"setCacheCapacity_1", nullptr, SetCacheCapacity_1, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setCacheCapacity0", nullptr, SetCacheCapacity0, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setCacheCapacity50", nullptr, SetCacheCapacity50, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setCacheCapacity101", nullptr, SetCacheCapacity101, nullptr, nullptr, nullptr, napi_default, nullptr}

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
