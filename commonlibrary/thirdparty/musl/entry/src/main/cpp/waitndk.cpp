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
#include <js_native_api.h>
#include <node_api.h>
#include <sys/resource.h>
#include <sys/wait.h>
#include <unistd.h>

#define PARAM_0 0
#define PARAM_1 1
#define NO_ERR 0
#define SUCCESS 1
#define FAIL (-1)
int do_plain_tests(int (*fn1)(void *arg), void *arg1, int (*fn2)(void *arg), void *arg2)
{
    int ret = PARAM_0;
    int pid = PARAM_0;
    pid = fork();
    if (pid == FAIL) {
        return FAIL;
    }
    if (pid == PARAM_0) {
        _exit(fn1(arg1));
    }
    if (fn2) {
        ret = fn2(arg2); 
    }
    return ret;
}

int waittest(void *testarg)
{
    int flag = PARAM_0;
    pid_t wait_for_pind = wait(&flag);
    return wait_for_pind;
}

static napi_value Wait(napi_env env, napi_callback_info info)
{
    void *test = nullptr;
    do_plain_tests(waittest, test, nullptr, nullptr);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}
int wait4test(void *testarg)
{
    pid_t pid = fork();
    int status = PARAM_0;
    int options = PARAM_0;
    struct rusage ru;
    pid_t wait4ForPind = wait4(pid, &status, options, &ru);
    return wait4ForPind;
}

static napi_value Wait4(napi_env env, napi_callback_info info)
{
    void *test = nullptr;
    do_plain_tests(wait4test, test, nullptr, nullptr);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

int Wait3test(void *testarg)
{
    int status = PARAM_0;
    int options = PARAM_0;
    struct rusage ru;
    pid_t wait3_for_pind = wait3(&status, options, &ru);
    return wait3_for_pind;
}

static napi_value Wait3(napi_env env, napi_callback_info info)
{
    void *test = nullptr;
    do_plain_tests(Wait3test, test, nullptr, nullptr);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

int waitidtest(void *testarg)
{
    siginfo_t si = {};
    pid_t pid = fork();
    int result = waitid(P_PID, pid, &si, WEXITED);
    return result;
}

static napi_value Waitid(napi_env env, napi_callback_info info)
{
    void *test = nullptr;
    do_plain_tests(waitidtest, test, nullptr, nullptr);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

int waitpidtest(void *testarg)
{
    int status = PARAM_0;
    int options = PARAM_0;
    pid_t pid = fork();
    pid_t waitpid_for_pind = waitpid(pid, &status, options);
    return waitpid_for_pind;
}

static napi_value Waitpid(napi_env env, napi_callback_info info)
{
    void *test = nullptr;
    do_plain_tests(waitpidtest, test, nullptr, nullptr);

    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"wait", nullptr, Wait, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wait4", nullptr, Wait4, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"waitid", nullptr, Waitid, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"waitpid", nullptr, Waitpid, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"wait3", nullptr, Wait3, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "waitndk",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }
