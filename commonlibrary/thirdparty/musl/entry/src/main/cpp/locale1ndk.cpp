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
#include <ctime>
#include <ifaddrs.h>
#include <js_native_api_types.h>
#include <climits>
#include <net/if.h>

#define MAX_NAMBER 80
#define FAIL (-1)
#define PARAM_0 0
#define PARAM_1 1
#define INIT (-1)
#define SUCCESS 0
#define ERRON_0 0
#define ONE_YEAR 31622400LL

extern "C" struct tm *__localtime64(const time_t *);
static napi_value Localtime64(napi_env env, napi_callback_info info)
{
    int ret = SUCCESS;
    struct tm *tm;
    const time_t time = INT_MIN * ONE_YEAR + PARAM_1;
    errno = ERRON_0;
    tm = __localtime64(&time);
    if (tm == nullptr || errno == EOVERFLOW) {
        ret = FAIL;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Newlocale(napi_env env, napi_callback_info info)
{
    locale_t newLocale = newlocale(LC_ALL_MASK, "de.UTF-8", nullptr);
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
    char *locale = setlocale(INIT, "");
    int ret = SUCCESS;
    if (locale == nullptr) {
        ret = FAIL;
    }
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"__localtime64", nullptr, Localtime64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"newlocale", nullptr, Newlocale, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setlocale", nullptr, Setlocale, nullptr, nullptr, nullptr, napi_default, nullptr}};
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}

EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "locale1",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
