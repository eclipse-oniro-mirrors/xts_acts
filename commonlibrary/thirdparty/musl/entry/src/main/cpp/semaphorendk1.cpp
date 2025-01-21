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

#include <cstdio>
#include <ctime>
#include <fcntl.h>
#include <js_native_api.h>
#include <js_native_api_types.h>
#include <node_api.h>
#include <semaphore.h>
#include <unistd.h>

#define MPARAM_1 (-1)
#define PARAM_1 1
#define PARAM_0 0
#define PARAM_0777 0777

static napi_value SemUnlink(napi_env env, napi_callback_info info)
{
    char buf[100];
    struct timespec ts;
    int ret = MPARAM_1;
    sem_t *psem = SEM_FAILED;
    do {
        clock_gettime(CLOCK_REALTIME, &ts);
        snprintf(buf, sizeof(buf), "/testsem-%d-%d", static_cast<int>(getpid()), static_cast<int>(ts.tv_nsec));
        psem = sem_open(buf, O_CREAT, PARAM_0777, PARAM_1);
        if (psem == SEM_FAILED) {
            break;
        }
        ret = sem_close(psem);
        if (ret == MPARAM_1) {
            break;
        }
        ret = sem_unlink(buf);
    } while (PARAM_0);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"sem_unlink", nullptr, SemUnlink, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "semaphore1",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
