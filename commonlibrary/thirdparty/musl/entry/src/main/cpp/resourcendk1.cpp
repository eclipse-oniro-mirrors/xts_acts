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
#include <cstdlib>
#include <cstring>
#include <ifaddrs.h>
#include <js_native_api_types.h>
#include <net/if.h>
#include <sys/inotify.h>
#include <sys/resource.h>
#include <unistd.h>
#include <utmp.h>
#include <uv.h>

#define NO_ERR 0
#define SUCCESS 1
#define FAIL (-1)
#define TRUE 1
#define LENGTH 1
#define ONE 1
#define PARAM_0 0
#define PARAM_1 1
#define PARAM_4 4
#define PARAM_100 100
#define ONEVAL 1
#define MINUSONE (-1)
#define MINUSTWO (-2)
#define MINUSTHR (-3)
#define FOURTWO 42
#define SIZE_1024 1024

static napi_value GetPriority1(napi_env env, napi_callback_info info)
{
    int ret;
    errno = NO_ERR;
    id_t pid = getpid();
    ret = getpriority(PRIO_PROCESS, pid);

    napi_value result = nullptr;
    if (ret == MINUSONE && errno != NO_ERR) {
        napi_create_int32(env, FAIL, &result);
    } else {
        napi_create_int32(env, NO_ERR, &result);
    }
    return result;
}
static napi_value GetPriority2(napi_env env, napi_callback_info info)
{
    errno = NO_ERR;
    int ret = getpriority(PRIO_PROCESS, MINUSONE);
    napi_value result = nullptr;
    if (ret == MINUSONE && errno != NO_ERR) {
        napi_create_int32(env, FAIL, &result);
    } else {
        napi_create_int32(env, NO_ERR, &result);
    }
    return result;
}
static napi_value Setpriority1(napi_env env, napi_callback_info info)
{
    id_t pid = getpid();
    int ret = setpriority(PRIO_PROCESS, pid, ONE);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value Setpriority2(napi_env env, napi_callback_info info)
{
    int ret = setpriority(PRIO_PROCESS, MINUSONE, ONE);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value GetRLimit1(napi_env env, napi_callback_info info)
{
    struct rlimit limit;
    int ret = getrlimit(RLIMIT_FSIZE, &limit);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value GetRLimit2(napi_env env, napi_callback_info info)
{
    struct rlimit limit;
    int ret = getrlimit(MINUSONE, &limit);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value Setrlimit1(napi_env env, napi_callback_info info)
{
    struct rlimit limit;
    getrlimit(PRIO_PROCESS, &limit);
    int ret = setrlimit(PRIO_PROCESS, &limit);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value Setrlimit2(napi_env env, napi_callback_info info)
{
    struct rlimit limit;
    limit.rlim_cur = PARAM_4;
    limit.rlim_max = PARAM_1;
    int ret = setrlimit(PRIO_PROCESS, &limit);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value Getrlimit641(napi_env env, napi_callback_info info)
{
    int ret;
    struct rlimit64 limit;
    ret = getrlimit64(RLIMIT_FSIZE, &limit);

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value Getrlimit642(napi_env env, napi_callback_info info)
{
    struct rlimit64 limit;
    int ret = getrlimit64(MINUSONE, &limit);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value GetRUsage1(napi_env env, napi_callback_info info)
{
    struct rusage usage;
    int ret = getrusage(RUSAGE_SELF, &usage);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value GetRUsage2(napi_env env, napi_callback_info info)
{
    struct rusage usage;
    int ret = getrusage(PARAM_100, &usage);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value Setrlimit641(napi_env env, napi_callback_info info)
{
    struct rlimit64 limit;
    getrlimit64(PRIO_PROCESS, &limit);
    int ret = setrlimit64(PRIO_PROCESS, &limit);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value Setrlimit642(napi_env env, napi_callback_info info)
{
    int ret;
    struct rlimit64 limit;
    limit.rlim_cur = PARAM_4;
    limit.rlim_max = PARAM_1;
    ret = setrlimit64(PRIO_PROCESS, &limit);

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value PrLimit1(napi_env env, napi_callback_info info)
{
    int ret;
    id_t pid = getpid();
    static const unsigned long long lim = PARAM_4;
    struct rlimit limit = {.rlim_cur = lim, .rlim_max = lim};
    ret = prlimit(pid, RLIMIT_STACK, &limit, nullptr);

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value PrLimit2(napi_env env, napi_callback_info info)
{
    int ret;
    id_t pid = getpid();
    static const unsigned long long lim = PARAM_4;
    struct rlimit limit = {.rlim_cur = lim, .rlim_max = lim};
    ret = prlimit(pid, MINUSONE, &limit, nullptr);

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value PrLimit641(napi_env env, napi_callback_info info)
{
    int ret;
    id_t pid = getpid();
    static const unsigned long long lim = PARAM_4;
    struct rlimit64 limit = {.rlim_cur = lim, .rlim_max = lim};
    ret = prlimit64(pid, RLIMIT_STACK, &limit, nullptr);

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value PrLimit642(napi_env env, napi_callback_info info)
{
    int ret;
    id_t pid = getpid();
    static const unsigned long long lim = PARAM_4;
    struct rlimit64 limit = {.rlim_cur = lim, .rlim_max = lim};
    ret = prlimit64(pid, MINUSONE, &limit, nullptr);

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"getPriority1", nullptr, GetPriority1, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getPriority2", nullptr, GetPriority2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setpriority1", nullptr, Setpriority1, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setpriority2", nullptr, Setpriority2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getRLimit1", nullptr, GetRLimit1, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getRLimit2", nullptr, GetRLimit2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setrlimit1", nullptr, Setrlimit1, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setrlimit2", nullptr, Setrlimit2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getrlimit641", nullptr, Getrlimit641, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getrlimit642", nullptr, Getrlimit642, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getRUsage1", nullptr, GetRUsage1, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getRUsage2", nullptr, GetRUsage2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setrlimit641", nullptr, Setrlimit641, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setrlimit642", nullptr, Setrlimit642, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"prLimit1", nullptr, PrLimit1, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"prLimit2", nullptr, PrLimit2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"prLimit641", nullptr, PrLimit641, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"prLimit642", nullptr, PrLimit642, nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = "resourcendk1",
    .nm_register_func = Init,
    .nm_modname = "libresourcendk1",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }
