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
#include <cstdlib>
#include <cstring>
#include <ctime>
#include <dlfcn.h>
#include <fnmatch.h>
#include <js_native_api_types.h>
#include <poll.h>
#include <pthread.h>
#include <semaphore.h>
#include <sys/resource.h>
#include <sys/sem.h>
#include <sys/socket.h>
#include <sys/stat.h>
#include <sys/timerfd.h>
#include <sys/timex.h>
#include <sys/wait.h>
#include <threads.h>
#include <unistd.h>
#include <utime.h>

#define PARAM_5 5
#define PARAM_0 0
#define PARAM_1 1
#define PARAM_UNNORMAL (-1)

extern "C" int __getitimer_time64(int, struct itimerval *);
static napi_value GetITimer_time64(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);

    int ret;
    struct itimerval val;
    ret = __getitimer_time64(param, &val);

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

extern "C" int __getrusage_time64(int, struct rusage *);
static napi_value GetRusAge_time64(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);

    int ret;
    struct rusage val;
    ret = __getrusage_time64(param, &val);

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

extern "C" int __gettimeofday_time64(struct timeval *__restrict, void *__restrict);
static napi_value GetTimeOfDay_time64(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);

    int ret;
    struct timeval val;
    if (param == PARAM_0) {
        ret = __gettimeofday_time64(&val, nullptr);
    } else {
        struct timezone tz;
        tz.tz_dsttime = PARAM_UNNORMAL;
        tz.tz_minuteswest = PARAM_UNNORMAL;
        ret = __gettimeofday_time64(&val, &tz);
        if (tz.tz_dsttime == PARAM_UNNORMAL || tz.tz_minuteswest == PARAM_UNNORMAL) {
            ret = PARAM_UNNORMAL;
        }
    }

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

extern "C" int __pselect_time64(int, fd_set *__restrict, fd_set *__restrict, fd_set *__restrict,
                                const struct timespec *__restrict, const sigset_t *__restrict);
static napi_value PSelect_time64(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);

    int ret;
    fd_set set;
    struct timespec val;
    FD_ZERO(&set);
    FD_SET(STDIN_FILENO, &set);
    val.tv_sec = PARAM_1;
    val.tv_nsec = PARAM_0;
    ret = __pselect_time64(param, &set, nullptr, nullptr, &val, nullptr);
    if (ret > PARAM_0) {
        ret = PARAM_0;
    }

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

extern "C" int __setitimer_time64(int, const struct itimerval *__restrict, struct itimerval *__restrict);
static int g_count = PARAM_0;
void SignalHandler(int signo)
{
    switch (signo) {
        case SIGALRM:
            struct itimerval val;
            g_count++;
            if (g_count > PARAM_1) {
                __getitimer_time64(signo, &val);
                val.it_value.tv_sec = PARAM_0;
                val.it_value.tv_usec = PARAM_0;
                __setitimer_time64(signo, &val, nullptr);
                g_count = PARAM_0;
            }
            break;
        default:
            break;
    }
}
static napi_value SetITimer_time64(napi_env env, napi_callback_info info)
{
    signal(SIGALRM, SignalHandler);
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);

    int ret;
    struct itimerval val;
    __getitimer_time64(param, &val);
    ret = __setitimer_time64(param, &val, nullptr);

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"__getitimer_time64", nullptr, GetITimer_time64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"__getrusage_time64", nullptr, GetRusAge_time64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"__gettimeofday_time64", nullptr, GetTimeOfDay_time64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"__pselect_time64", nullptr, PSelect_time64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"__setitimer_time64", nullptr, SetITimer_time64, nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = "fnmatch1ndk",
    .nm_register_func = Init,
    .nm_modname = "libfnmatch1ndk",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }
