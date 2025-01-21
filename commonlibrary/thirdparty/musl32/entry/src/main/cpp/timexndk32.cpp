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
#include "common/native_common.h"
#include "napi/native_api.h"
#include <cerrno>
#include <cstdio>
#include <ctime>
#include <js_native_api_types.h>
#include <memory.h>
#include <sys/timerfd.h>
#include <sys/timex.h>
#include <unistd.h>
#include <utime.h>

#define PARAM_1 1
#define MPARAM_1 (-1)
#define PARAM_0 0

extern "C" int __adjtimex_time64(struct timex *);
static napi_value AdjTimex_time64_One(napi_env env, napi_callback_info info)
{
    struct timex tx;
    tx.offset = ADJ_OFFSET;
    tx.tick = ADJ_TICK;
    tx.maxerror = ADJ_MAXERROR;
    tx.esterror = ADJ_ESTERROR;
    tx.constant = ADJ_TIMECONST;
    tx.freq = ADJ_FREQUENCY;
    tx.status = ADJ_STATUS;
    tx.precision = PARAM_1;
    tx.tolerance = PARAM_1;
    tx.ppsfreq = PARAM_1;
    tx.jitter = PARAM_1;
    tx.stabil = PARAM_1;
    tx.jitcnt = PARAM_1;
    tx.calcnt = PARAM_1;
    tx.errcnt = PARAM_1;
    tx.stbcnt = PARAM_1;
    int resultValue = __adjtimex_time64(&tx);
    NAPI_ASSERT(env, resultValue != MPARAM_1, "AdjTimex_time64_One failed");
    napi_value result = nullptr;
    napi_create_int32(env, resultValue == TIME_BAD, &result);
    return result;
}

static napi_value AdjTimex_time64_Two(napi_env env, napi_callback_info info)
{
    errno = PARAM_0;
    struct timex tx;
    int resultValue = __adjtimex_time64(&tx);
    NAPI_ASSERT(env, resultValue != MPARAM_1, "AdjTimex_time64_Two failed");
    napi_value result = nullptr;
    napi_create_int32(env, resultValue == TIME_BAD, &result);
    return result;
}

extern "C" int adjtimex(struct timex *);
static napi_value AdjTimex_One(napi_env env, napi_callback_info info)
{
    struct timex tx;
    tx.offset = ADJ_OFFSET;
    tx.tick = ADJ_TICK;
    tx.maxerror = ADJ_MAXERROR;
    tx.esterror = ADJ_ESTERROR;
    tx.constant = ADJ_TIMECONST;
    tx.freq = ADJ_FREQUENCY;
    tx.status = ADJ_STATUS;
    tx.precision = PARAM_1;
    tx.tolerance = PARAM_1;
    tx.ppsfreq = PARAM_1;
    tx.jitter = PARAM_1;
    tx.stabil = PARAM_1;
    tx.jitcnt = PARAM_1;
    tx.calcnt = PARAM_1;
    tx.errcnt = PARAM_1;
    tx.stbcnt = PARAM_1;
    int resultValue = adjtimex(&tx);
    NAPI_ASSERT(env, resultValue != MPARAM_1, "AdjTimex_One failed");
    napi_value result = nullptr;
    napi_create_int32(env, resultValue == TIME_BAD, &result);
    return result;
}

static napi_value AdjTimex_Two(napi_env env, napi_callback_info info)
{
    errno = PARAM_0;
    struct timex tx;
    int resultValue = adjtimex(&tx);
    napi_value result = nullptr;
    napi_create_int32(env, resultValue == TIME_BAD, &result);
    return result;
}

extern "C" int __clock_adjtime64(clockid_t, struct timex *);
static napi_value Clock_adjTime64_One(napi_env env, napi_callback_info info)
{
    struct timex tx;
    memset(&tx, PARAM_0, sizeof(tx));
    int returnValue = __clock_adjtime64(CLOCK_REALTIME, &tx);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue == TIME_BAD, &result);
    return result;
}

static napi_value Clock_adjTime64_Two(napi_env env, napi_callback_info info)
{
    struct timex tx = {ADJ_OFFSET_SS_READ};
    int returnValue = __clock_adjtime64(CLOCK_MONOTONIC, &tx);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue == MPARAM_1, &result);
    return result;
}

static napi_value Clock_adjTime64_Three(napi_env env, napi_callback_info info)
{
    struct timex tx;
    memset(&tx, PARAM_0, sizeof(tx));
    int returnValue = __clock_adjtime64(CLOCK_PROCESS_CPUTIME_ID, &tx);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue == MPARAM_1, &result);
    return result;
}

static napi_value Clock_adjTime64_Four(napi_env env, napi_callback_info info)
{
    struct timex tx;
    memset(&tx, PARAM_0, sizeof(tx));
    int returnValue = __clock_adjtime64(CLOCK_THREAD_CPUTIME_ID, &tx);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue == MPARAM_1, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"AdjTimex_time64_One", nullptr, AdjTimex_time64_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AdjTimex_time64_Two", nullptr, AdjTimex_time64_Two, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AdjTimex_One", nullptr, AdjTimex_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AdjTimex_Two", nullptr, AdjTimex_Two, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Clock_adjTime64_One", nullptr, Clock_adjTime64_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Clock_adjTime64_Two", nullptr, Clock_adjTime64_Two, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Clock_adjTime64_Three", nullptr, Clock_adjTime64_Three, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Clock_adjTime64_Four", nullptr, Clock_adjTime64_Four, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "libtimexndk1",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }