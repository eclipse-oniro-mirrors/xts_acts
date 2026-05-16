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
#include <js_native_api.h>
#include <node_api.h>
#include <regex.h>

#define ONE 1
#define PARAM_0 0
#define PARAM_1 1
#define PARAM_2 2
#define PARAM_UNNORMAL (-1)
#define RETURN_0 0
#define FAILD (-1)
#define ERRON_0 0
#define SIZE_10 10
#define SIZE_100 100
#define SIZE_4096 4096
#define SIZE_8192 8192

static napi_value Regcomp(napi_env env, napi_callback_info info)
{
    regex_t r = {PARAM_0};
    const char pstTern[] = "1234567890";
    int regCompValue = regcomp(&r, pstTern, REG_EXTENDED);
    napi_value result = nullptr;
    napi_create_int32(env, regCompValue, &result);
    return result;
}

static napi_value Regexec(napi_env env, napi_callback_info info)
{
    const char *pstTern = "1234567890";
    char buff[10] = "1";
    const size_t nMatch = ONE;
    regex_t r = {PARAM_0};
    regmatch_t pMatch[1];
    napi_value result = nullptr;
    int regCompValue = regcomp(&r, pstTern, REG_EXTENDED);
    if (regCompValue == PARAM_0) {
        int regExecValue = regexec(&r, buff, nMatch, pMatch, PARAM_0);
        napi_create_int32(env, regExecValue, &result);
    }
    return result;
}

static napi_value Regerror(napi_env env, napi_callback_info info)
{
    char buf[200];
    regex_t reg = {PARAM_0};
    int resultValue = FAILD;
    int error_value = regerror(PARAM_0, &reg, buf, sizeof buf);
    if (error_value != PARAM_0) {
        resultValue = RETURN_0;
    }

    napi_value result = nullptr;
    napi_create_int32(env, resultValue, &result);

    return result;
}

static napi_value Regfree(napi_env env, napi_callback_info info)
{
    regex_t reg = {PARAM_0};
    const char *psttern = "1234567890";
    regcomp(&reg, psttern, REG_EXTENDED);
    int resultValue = FAILD;
    errno = ERRON_0;
    regfree(&reg);
    if (errno == ERRON_0) {
        resultValue = RETURN_0;
    }

    napi_value result = nullptr;
    napi_create_int32(env, resultValue, &result);

    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"regcomp", nullptr, Regcomp, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"regexec", nullptr, Regexec, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"regerror", nullptr, Regerror, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"regfree", nullptr, Regfree, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "regex",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
