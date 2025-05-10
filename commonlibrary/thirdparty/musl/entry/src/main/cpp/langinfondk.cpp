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

#include "napi/native_api.h"
#include <cstring>
#include <js_native_api.h>
#include <js_native_api_types.h>
#include <langinfo.h>
#include <locale>
#include <node_api.h>
#include <sys/select.h>
#include <utmp.h>

#define STRLENGTH 64
#define FALSE 0
#define ERROR (-1)
#define FIVE 5
#define PARAM_0 0
#define ONE 1
#define DAY_2 0x20008

static napi_value NlLanginfo(napi_env env, napi_callback_info info)
{
    setlocale(LC_CTYPE, "UTF-8");
    char *ret = nl_langinfo(DAY_2);
    napi_value result;
    napi_create_string_utf8(env, ret, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value NlLanginfoL(napi_env env, napi_callback_info info)
{
    locale_t c_locale = newlocale(LC_ALL_MASK, "C", NULL);
    char *getInfo = nl_langinfo_l(CODESET, c_locale);
    napi_value result = nullptr;
    freelocale(c_locale);
    napi_create_string_utf8(env, getInfo, NAPI_AUTO_LENGTH, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"nlLanginfo", nullptr, NlLanginfo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"nlLanginfoL", nullptr, NlLanginfoL, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "langinfo",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
