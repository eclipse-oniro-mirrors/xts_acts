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
#include <cstring>
#include <ctime>
#include <sys/ipc.h>
#include <sys/shm.h>

#define SHM_RDONLY 010000
#define PARAM_0 0
#define ONEVAL 1
#define MINUSONE (-1)
#define TEST_MODE 0666
#define VALUE100 100
#define ERRON_0 0

static napi_value Shmget(napi_env env, napi_callback_info info)
{
    errno = ERRON_0;
    static const char path[] = ".";
    static const int id = 'h';
    int shmid;
    shmid = shmget(ftok(path, id), VALUE100, IPC_CREAT | TEST_MODE);
    napi_value result;
    napi_create_int32(env, shmid, &result);
    return result;
}

static napi_value Shmdt(napi_env env, napi_callback_info info)
{
    static const char path[] = ".";
    static const int id = 'h';
    key_t k;
    int shmid;
    void *p;
    k = ftok(path, id);
    shmid = shmget(k, PARAM_0, PARAM_0);
    napi_value result = nullptr;
    p = shmat(shmid, PARAM_0, SHM_RDONLY);
    int shmval = shmdt(p);
    napi_create_int32(env, shmval, &result);
    return result;
}
static napi_value Shmctl(napi_env env, napi_callback_info info)
{
    static const char path[] = ".";
    static const int id = 'h';
    int shmid = shmget(ftok(path, id), VALUE100, IPC_CREAT | TEST_MODE);
    int shmval = shmctl(shmid, IPC_RMID, PARAM_0);
    napi_value result = nullptr;
    napi_create_int32(env, shmval, &result);
    return result;
}
static napi_value Shmat(napi_env env, napi_callback_info info)
{
    static const char path[] = ".";
    static const int id = 'h';
    key_t k;
    int shmid;
    void *p;
    k = ftok(path, id);
    shmid = shmget(k, PARAM_0, PARAM_0);
    napi_value result = nullptr;
    if ((p = shmat(shmid, PARAM_0, SHM_RDONLY)) == PARAM_0) {
        napi_create_int32(env, MINUSONE, &result);
    } else {
        napi_create_int32(env, PARAM_0, &result);
    }
    return result;
}
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"shmat", nullptr, Shmat, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"shmget", nullptr, Shmget, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"shmdt", nullptr, Shmdt, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"shmctl", nullptr, Shmctl, nullptr, nullptr, nullptr, napi_default, nullptr},

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
    .nm_modname = "shm",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }
