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
#include "pthread.h"
#include <cstdio>
#include <js_native_api_types.h>
#include <poll.h>
#include <sys/prctl.h>
#include <sys/stat.h>
#include <unistd.h>

#define TEST_AT_FDCWD (-100)
#define TEST_ERROR_AT_FDCWD 100
#define NO_ERR 0
#define SUCCESS 1
#define FAIL (-1)
#define PARAM_0 0
#define TEN 10
#define BUFSIZE 32
#define TEST_FIFO_MODE 0666

int g_prctlRet = FAIL;
void *Thread(void *)
{
    char name[BUFSIZE] = "wenhao";
    g_prctlRet = prctl(PR_SET_NAME, (unsigned long)name);
    pthread_exit(&g_prctlRet);
}

static napi_value Prctl(napi_env env, napi_callback_info info)
{
    void *pThreadResult = nullptr;
    pthread_t tid = PARAM_0;
    pthread_create(&tid, nullptr, Thread, nullptr);
    pthread_join(tid, &pThreadResult);
    napi_value result = nullptr;
    napi_create_int32(env, *static_cast<int *>(pThreadResult), &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"prctl", nullptr, Prctl, nullptr, nullptr, nullptr, napi_default, nullptr},

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
    .nm_modname = "prctl",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }
