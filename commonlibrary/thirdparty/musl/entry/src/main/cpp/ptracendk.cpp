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

#include <cerrno>
#include <js_native_api.h>
#include <node_api.h>
#include <pthread.h>
#include <sys/ptrace.h>
#include <unistd.h>

#define TEST_FLAG_SIZE 4
#define TEST_FD_LIMIT 128
#define R_OK 4
#define PARAM_0 0
#define MPARAM_1 (-1)
#define ERRON_0 0
#define PARAM_UNNORMAL (-1)

static napi_value Ptrace(napi_env env, napi_callback_info info)
{
    errno = ERRON_0;
    int32_t ret = PARAM_0;
    pid_t pid = fork();
    if (pid == PARAM_0) {
        ret = ptrace(PTRACE_TRACEME);
        _exit(PARAM_0);
    }
    napi_value result;
    if (MPARAM_1 == ret) {
        napi_create_int32(env, PARAM_UNNORMAL, &result);
    } else {
        napi_create_int32(env, PARAM_0, &result);
    }
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"ptrace", nullptr, Ptrace, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "dirent",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
