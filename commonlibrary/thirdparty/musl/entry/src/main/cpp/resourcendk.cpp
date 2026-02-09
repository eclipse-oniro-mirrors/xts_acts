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
#define PARAM_42 42
#define ONEVAL 1
#define MINUSONE (-1)
#define MINUSTWO (-2)
#define MINUSTHR (-3)
#define FOURTWO 42
#define SIZE_1024 1024

static napi_value GetPriority(napi_env env, napi_callback_info info)
{
    errno = NO_ERR;
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueZero = PARAM_0;
    napi_get_value_int32(env, args[0], &valueZero);
    int ret = getpriority(valueZero, NO_ERR);
    if ((ret = FAIL) && (errno)) {
        ret = FAIL;
    } else {
        ret = TRUE;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value GetRLimit(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int valueZero = PARAM_0;
    napi_get_value_int32(env, args[0], &valueZero);
    size_t length = ONE;
    struct rlimit rLim[length];
    int ret = getrlimit(valueZero, rLim);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value GetRUsage(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int valueZero = PARAM_0;
    napi_get_value_int32(env, args[0], &valueZero);
    size_t length = LENGTH;
    struct rusage rup[length];
    int ret = getrusage(valueZero, rup);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value PrLimit(napi_env env, napi_callback_info info)
{
    static const unsigned long long lim = PARAM_4;
    struct rlimit newLimit = {0};
    struct rlimit oldLimit = {0};
    id_t pid = getpid();
    int ret = prlimit(pid, RLIMIT_STACK, nullptr, &newLimit);
    newLimit.rlim_cur = lim;
    ret += prlimit(pid, RLIMIT_STACK, &newLimit, &oldLimit);
    ret += prlimit(pid, RLIMIT_STACK, &oldLimit, nullptr);

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value PrLimit64(napi_env env, napi_callback_info info)
{
    static const unsigned long long lim = PARAM_4;

    struct rlimit newLimit = {0};
    struct rlimit oldLimit = {0};
    id_t pid = getpid();
    int ret = prlimit64(pid, RLIMIT_STACK, nullptr, &newLimit);
    newLimit.rlim_cur = lim;
    ret += prlimit64(pid, RLIMIT_STACK, &newLimit, &oldLimit);
    ret += prlimit64(pid, RLIMIT_STACK, &oldLimit, nullptr);

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value Getrlimit64(napi_env env, napi_callback_info info)
{
    static const long lim = PARAM_42;
    static const int r = RLIMIT_NOFILE;
    struct rlimit rl = {PARAM_0};
    rl.rlim_max = lim;
    rl.rlim_cur = lim;
    int ret = setrlimit(r, &rl);
    struct rlimit retrl = {PARAM_0};
    ret = getrlimit64(r, &retrl);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value Setpriority(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueFirst = PARAM_0;
    napi_get_value_int32(env, args[0], &valueFirst);
    int oldprio = getpriority(PRIO_PROCESS, getpid());
    int setval = setpriority(PRIO_PROCESS, getpid(), oldprio + valueFirst);
    napi_value result = nullptr;
    napi_create_int32(env, setval, &result);
    return result;
}

static napi_value Setrlimit(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueFirst = PARAM_0;
    napi_get_value_int32(env, args[0], &valueFirst);
    napi_value result = nullptr;
    if (valueFirst == PARAM_0) {
        static const long lim = FOURTWO;
        static const int r = RLIMIT_NOFILE;
        struct rlimit rl = {PARAM_0};
        rl.rlim_max = lim;
        rl.rlim_cur = lim;
        int setval = setrlimit(r, &rl);
        napi_create_int32(env, setval, &result);
    } else if (valueFirst == ONEVAL) {
        int r = RLIMIT_NOFILE;
        long lim = PARAM_0;
        long lim1 = SIZE_1024;
        struct rlimit rl = {PARAM_0};
        rl.rlim_max = lim;
        rl.rlim_cur = lim1;
        int setval = setrlimit(r, &rl);
        napi_create_int32(env, setval, &result);
    }
    return result;
}

static napi_value Setrlimit64(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueFirst = PARAM_0;
    napi_get_value_int32(env, args[0], &valueFirst);
    napi_value result = nullptr;
    if (valueFirst == PARAM_0) {
        static const long lim = FOURTWO;
        static const int r = RLIMIT_NOFILE;
        struct rlimit rl = {PARAM_0};
        rl.rlim_max = lim;
        rl.rlim_cur = lim;
        int setval = setrlimit64(r, &rl);
        napi_create_int32(env, setval, &result);
    } else if (valueFirst == ONEVAL) {
        int r = RLIMIT_NOFILE;
        long lim = PARAM_0;
        long lim1 = SIZE_1024;
        struct rlimit rl = {PARAM_0};
        rl.rlim_max = lim;
        rl.rlim_cur = lim1;
        int setval = setrlimit64(r, &rl);
        napi_create_int32(env, setval, &result);
    }
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"getPriority", nullptr, GetPriority, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getRLimit", nullptr, GetRLimit, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getRUsage", nullptr, GetRUsage, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setpriority", nullptr, Setpriority, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setrlimit", nullptr, Setrlimit, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"setrlimit64", nullptr, Setrlimit64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getRUsage", nullptr, GetRUsage, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"prLimit", nullptr, PrLimit, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getRUsage", nullptr, GetRUsage, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getPriority", nullptr, GetPriority, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getRLimit", nullptr, GetRLimit, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getRUsage", nullptr, GetRUsage, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getrlimit64", nullptr, Getrlimit64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getRLimit", nullptr, GetRLimit, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"prLimit64", nullptr, PrLimit64, nullptr, nullptr, nullptr, napi_default, nullptr},

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
    .nm_modname = "resource",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }
