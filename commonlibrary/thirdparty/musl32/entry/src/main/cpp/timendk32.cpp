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
#include <csignal>
#include <cstdlib>
#include <cstring>
#include <ctime>
#include <malloc.h>
#include <net/if.h>
#include <sched.h>
#include <sys/time.h>
#include <sys/timex.h>
#include <unistd.h>
#include <utime.h>
#include <utmp.h>
#include <uv.h>

#define NANOSECONDS (1000000000)
#define TEST_FILE "/data/storage/el2/base/files/test.txt"
#define TEST_FILE_PATH "/data/storage/el2/base/files/"
#define TEST_FILE_NAME "test.txt"
#define PARAM_0 0
#define PARAM_1 1
#define MPARAM_1 (-1)
#define PARAM_3 3
#define PARAM_111 111
#define PARAM_777 777
#define PARAM_0666 0666
#define PARAM_0777 0777
#define MPARAM_123 (-123)

extern "C" int __timer_gettime64(timer_t, struct itimerspec *);
extern "C" int __timer_settime64(timer_t, int, const struct itimerspec *__restrict, struct itimerspec *__restrict);
void TimerThread(union sigval v) {}

static napi_value Timer_getTime64_One(napi_env env, napi_callback_info info)
{
    timer_t timerid;
    struct sigevent evp;
    memset(&evp, PARAM_0, sizeof(struct sigevent));

    evp.sigev_value.sival_int = PARAM_111;
    evp.sigev_notify = SIGEV_THREAD;
    evp.sigev_notify_function = TimerThread;

    int ret = timer_create(CLOCK_REALTIME, &evp, &timerid);

    struct itimerspec it;
    it.it_interval.tv_sec = PARAM_1;
    it.it_interval.tv_nsec = PARAM_0;
    it.it_value.tv_sec = PARAM_3;
    it.it_value.tv_nsec = PARAM_0;
    ret = __timer_settime64(timerid, PARAM_0, &it, nullptr);

    struct itimerspec tmp;
    ret = __timer_gettime64(timerid, &tmp);
    NAPI_ASSERT(env, tmp.it_value.tv_sec < PARAM_1 || tmp.it_value.tv_nsec < NANOSECONDS,
                "Timer_getTime64_One--__timer_gettime64 failed");

    napi_value result = nullptr;
    napi_create_int32(env, ret == PARAM_0, &result);

    timer_delete(timerid);
    return result;
}

static napi_value Timer_getTime64_Two(napi_env env, napi_callback_info info)
{
    struct itimerspec tmp;
    int ret = __timer_gettime64(nullptr, &tmp);

    napi_value result = nullptr;
    napi_create_int32(env, ret != PARAM_1 && errno == EINVAL, &result);
    return result;
}

static napi_value Timer_setTime64_One(napi_env env, napi_callback_info info)
{
    timer_t timerid;
    struct sigevent evp;
    memset(&evp, PARAM_0, sizeof(struct sigevent));
    evp.sigev_value.sival_int = PARAM_111;
    evp.sigev_notify = SIGEV_THREAD;
    evp.sigev_notify_function = TimerThread;

    int ret = timer_create(CLOCK_REALTIME, &evp, &timerid);
    struct itimerspec it;
    it.it_interval.tv_sec = PARAM_1;
    it.it_interval.tv_nsec = PARAM_0;
    it.it_value.tv_sec = PARAM_3;
    it.it_value.tv_nsec = PARAM_0;
    ret = __timer_settime64(timerid, PARAM_0, &it, nullptr);

    struct itimerspec tmp;
    ret = __timer_gettime64(timerid, &tmp);
    NAPI_ASSERT(env, tmp.it_value.tv_sec < PARAM_1 || tmp.it_value.tv_nsec < NANOSECONDS,
                "Timer_setTime64_One--__timer_gettime64 failed");

    napi_value result = nullptr;
    napi_create_int32(env, ret == PARAM_0, &result);

    timer_delete(timerid);
    return result;
}

static napi_value Timer_setTime64_Two(napi_env env, napi_callback_info info)
{
    struct itimerspec it;
    it.it_interval.tv_sec = PARAM_1;
    it.it_interval.tv_nsec = PARAM_0;
    it.it_value.tv_sec = PARAM_3;
    it.it_value.tv_nsec = PARAM_0;
    int ret = __timer_settime64(nullptr, PARAM_0, &it, nullptr);

    napi_value result = nullptr;
    napi_create_int32(env, ret != PARAM_1 && errno == EINVAL, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"Timer_getTime64_One", nullptr, Timer_getTime64_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Timer_getTime64_Two", nullptr, Timer_getTime64_Two, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Timer_setTime64_One", nullptr, Timer_setTime64_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Timer_setTime64_Two", nullptr, Timer_setTime64_Two, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "libtimendk1",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }
