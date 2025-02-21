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

#include <csignal>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <fcntl.h>
#include <js_native_api.h>
#include <node_api.h>
#include <pthread.h>
#include <sys/signalfd.h>
#include <unistd.h>

#define PARAM_0 0
#define PARAM_1 1
#define PARAM_2 2
#define PARAM_6000 6000
#define PARAM_99999 99999
#define FAIL (-1)
#define NO_ERR 0
#define STRLENGTH 64
#define SUCCESS 1
#define ONE 1
#define SFD_CLOEXEC O_CLOEXEC
#define ONEVAL 1
#define MINUSONE (-1)
#define MINUSTWO (-2)
#define THRVAL 3
#define ERRON_0 0

extern "C" int __sigtimedwait_time64(const sigset_t *__restrict, siginfo_t *__restrict,
                                     const struct timespec *__restrict);
static napi_value SigTimedWait_time641(napi_env env, napi_callback_info info)
{
    sigset_t set1;
    sigemptyset(&set1);
    sigaddset(&set1, SIGCHLD);
    sigprocmask(SIG_BLOCK, &set1, nullptr);
    pid_t pid = fork();
    int ret = FAIL;
    if (pid && pid != MINUSONE) {
        sigset_t set2;
        siginfo_t siginfo;
        timespec timeout = {.tv_sec = PARAM_2, .tv_nsec = PARAM_0};
        sigemptyset(&set2);
        sigaddset(&set2, SIGCHLD);
        ret = __sigtimedwait_time64(&set2, &siginfo, &timeout);
    }
    napi_value result = nullptr;
    if (ret != FAIL) {
        napi_create_int32(env, NO_ERR, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    return result;
}
static napi_value SigTimedWait_time642(napi_env env, napi_callback_info info)
{
    sigset_t set;
    siginfo_t siginfo;
    timespec timeout = {.tv_sec = PARAM_2, .tv_nsec = PARAM_0};
    int ret = ret = __sigtimedwait_time64(&set, &siginfo, &timeout);

    napi_value result = nullptr;
    if (ret != FAIL) {
        napi_create_int32(env, NO_ERR, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"__sigtimedwait_time641", nullptr, SigTimedWait_time641, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"__sigtimedwait_time642", nullptr, SigTimedWait_time642, nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = "signalndk1",
    .nm_register_func = Init,
    .nm_modname = "signalndk1",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
