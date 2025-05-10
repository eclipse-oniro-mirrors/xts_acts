/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

#include "common/napi_helper.cpp"
#include "common/native_common.h"
#include "napi/native_api.h"
#include <cerrno>
#include <clocale>
#include <ifaddrs.h>
#include <js_native_api_types.h>
#include <net/if.h>

#define MAX_NAMBER 80
#define FAIL (-1)
#define PARAM_0 0
#define PARAM_1 1
#define INIT (-1)
#define SUCCESS 0
#define ERRON_0 0

static napi_value Localeconv(napi_env env, napi_callback_info info)
{
    struct lconv *ptr = localeconv();
    napi_value result;
    if (ptr == nullptr) {
        napi_create_int32(env, FAIL, &result);
    } else {
        napi_create_int32(env, PARAM_0, &result);
    }
    return result;
}
static napi_value Freelocale(napi_env env, napi_callback_info info)
{
    errno = ERRON_0;
    setlocale(LC_ALL, "C");
    locale_t newlocale_ = duplocale(LC_GLOBAL_LOCALE);
    if (newlocale_) {
        freelocale(newlocale_);
        newlocale_ = nullptr;
    }
    napi_value result = nullptr;
    napi_create_int32(env, errno, &result);
    return result;
}
static napi_value Newlocale(napi_env env, napi_callback_info info)
{
    locale_t newLocale = newlocale(LC_ALL_MASK, "C.UTF-8", nullptr);
    napi_value result;
    if (newLocale == PARAM_0) {
        napi_create_int32(env, FAIL, &result);
    } else {
        napi_create_int32(env, PARAM_0, &result);
    }
    return result;
}

static napi_value Setlocale(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char *valueFirst = NapiHelper::GetString(env, args[0]);
    valueFirst = setlocale(LC_ALL, "C.UTF-8");
    napi_value result;
    napi_create_string_utf8(env, valueFirst, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value Uselocale(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int caseNumber;
    locale_t uselocaleResult;
    int toJsValue = FAIL;
    napi_get_value_int32(env, args[0], &caseNumber);

    if (caseNumber == PARAM_0) {
        uselocaleResult = uselocale(nullptr);
        if (uselocaleResult != nullptr && uselocaleResult == LC_GLOBAL_LOCALE) {
            toJsValue = PARAM_0;
        }
    } else if (caseNumber == PARAM_1) {
        uselocale(nullptr);
        locale_t newLocale = newlocale(LC_PAPER_MASK, "C.UTF-8", nullptr);
        locale_t usenow = uselocale(newLocale);
        if (usenow == LC_GLOBAL_LOCALE) {
            toJsValue = PARAM_0;
        }
    }

    napi_value result = nullptr;
    napi_create_int32(env, toJsValue, &result);
    return result;
}

static napi_value DupLocale(napi_env env, napi_callback_info info)
{
    locale_t locobj = LC_GLOBAL_LOCALE;
    locale_t newLocale = duplocale(locobj);
    int backResult = INIT;
    napi_value result = nullptr;
    if (newLocale) {
        backResult = SUCCESS;
    }
    napi_create_int32(env, backResult, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"setlocale", nullptr, Setlocale, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"uselocale", nullptr, Uselocale, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"duplocale", nullptr, DupLocale, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"localeconv", nullptr, Localeconv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"newlocale", nullptr, Newlocale, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"freelocale", nullptr, Freelocale, nullptr, nullptr, nullptr, napi_default, nullptr}};
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}

EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "locale",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
