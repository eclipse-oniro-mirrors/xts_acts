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
#include <ctime>
#include <sys/timerfd.h>
#include <unistd.h>

#define NANOSECOND (1000000000)
#define MICROSECONDS (1000000)
#define DATA_TWO (2)
#define NUMBER (-1)
#define ONE 1
#define TWO 2
#define PARAM_0 0
#define PARAM_1 1
#define TIME_L 1659177614

static napi_value Timerfd_create(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueFirst;
    napi_get_value_int32(env, args[0], &valueFirst);
    int timerfd = timerfd_create(NUMBER, NUMBER);
    napi_value result = nullptr;
    napi_create_int32(env, timerfd, &result);
    close(timerfd);
    return result;
}

static napi_value Timerfd_gettime(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueFirst;
    napi_get_value_int32(env, args[0], &valueFirst);
    int timeValue = timerfd_gettime(NUMBER, nullptr);
    napi_value result = nullptr;
    napi_create_int32(env, timeValue, &result);
    return result;
}

static napi_value Timerfd_settime(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueFirst;
    napi_get_value_int32(env, args[0], &valueFirst);
    struct itimerspec its = {{PARAM_0, PARAM_0}, {DATA_TWO, PARAM_0}};
    struct itimerspec val;
    int fd = PARAM_0;
    int timeValue = PARAM_0;
    fd = timerfd_create(CLOCK_REALTIME, PARAM_0);
    timeValue = timerfd_settime(fd, PARAM_0, &its, nullptr);
    timeValue = usleep(MICROSECONDS);
    timeValue = timerfd_gettime(fd, &val);
    napi_value result = nullptr;
    napi_create_int32(env, timeValue, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"timerfd_create", nullptr, Timerfd_create, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"timerfd_gettime", nullptr, Timerfd_gettime, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"timerfd_settime", nullptr, Timerfd_settime, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "time",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }
