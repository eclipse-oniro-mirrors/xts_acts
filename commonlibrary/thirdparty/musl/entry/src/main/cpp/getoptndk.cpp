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
#include <fcntl.h>
#include <getopt.h>
#include <glob.h>
#include <js_native_api_types.h>
#include <sys/random.h>

#define SUCCESS 1
#define FAIL (-1)
#define NO_ERRS 0
#define LENGTH 64
#define DEFAULT_VALUE 0
#define TEST_ID_VALUE 100
#define PARAM_UNNORMAL (-1)
#define PARAM_0 0
#define PARAM_1 1
#define PARAM_2 2

static napi_value GetoptLong(napi_env env, napi_callback_info info)
{
    int argcc = PARAM_2;
    char argvl[] = "-l";

    char argvn[] = "-n";
    char *argv[2] = {argvn, argvl};
    char shortOptions[] = "nbl:";
    struct option long_options[] = {
        {"name", DEFAULT_VALUE, nullptr, 'n'},
        {"bf_name", DEFAULT_VALUE, nullptr, 'b'},
        {"love", PARAM_1, nullptr, 'l'},
        {DEFAULT_VALUE, DEFAULT_VALUE, DEFAULT_VALUE, DEFAULT_VALUE},
    };
    int ret;
    ret = getopt_long(argcc, argv, shortOptions, long_options, nullptr);

    napi_value result = nullptr;
    if (ret == PARAM_UNNORMAL) {
        napi_create_int32(env, FAIL, &result);
    } else {
        napi_create_int32(env, NO_ERRS, &result);
    }
    return result;
}

static napi_value GetoptLongOnly(napi_env env, napi_callback_info info)
{
    optind = PARAM_0;
    int optArgc = PARAM_2;
    char cmdline[50] = "./parse_cmdline";
    char optArgv1[] = "a";
    char *optArgv[] = {cmdline, optArgv1};

    char optString[50] = "ab:c:d";
    int ret = PARAM_0;
    struct option long_options[] = {
        {"name", PARAM_0, nullptr, 'a'},
        {"bf_name", PARAM_0, nullptr, 'b'},
        {"love", PARAM_1, nullptr, 'c'},
        {PARAM_0, PARAM_0, PARAM_0, PARAM_0},
    };
    getopt_long_only(optArgc, optArgv, optString, long_options, nullptr);
    napi_value result = nullptr;
    if (ret == PARAM_UNNORMAL) {
        napi_create_int32(env, FAIL, &result);
    } else {
        napi_create_int32(env, DEFAULT_VALUE, &result);
    }
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"getoptLong", nullptr, GetoptLong, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getoptLongOnly", nullptr, GetoptLongOnly, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "libunistd",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }
