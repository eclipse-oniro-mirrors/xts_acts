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
#include <sys/sem.h>

#define PARAM_0 0
#define PARAM_1 1
#define ONEVAL 1
#define MINUSONE (-1)
#define TEST_MODE 0666
#define PARAM_EACCES 13

static napi_value Semop(napi_env env, napi_callback_info info)
{
    static const char path[] = ".";
    static const int id = 's';
    struct sembuf sops = {PARAM_0};
    key_t k = ftok(path, id);
    sops.sem_num = PARAM_0;
    sops.sem_op = MINUSONE;
    sops.sem_flg = PARAM_0;
    int semid = semget(k, PARAM_0, PARAM_0);
    int semval = semop(semid, &sops, ONEVAL);
    napi_value result = nullptr;
    napi_create_int32(env, semval, &result);
    return result;
}
static napi_value Semtimedop(napi_env env, napi_callback_info info)
{
    static const char path[] = ".";
    static const int id = 's';
    struct sembuf sops = {PARAM_0};
    key_t k = ftok(path, id);
    sops.sem_num = PARAM_0;
    sops.sem_op = MINUSONE;
    sops.sem_flg = PARAM_0;
    int semid = semget(k, PARAM_0, PARAM_0);
    int semval = semtimedop(semid, &sops, ONEVAL, nullptr);
    napi_value result = nullptr;
    napi_create_int32(env, semval, &result);
    return result;
}

static napi_value Semctl(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueFirst;
    napi_get_value_int32(env, args[0], &valueFirst);
    static const char path[] = ".";
    static const int id = 's';
    key_t k = ftok(path, id);
    int semid = semget(k, ONEVAL, IPC_CREAT | TEST_MODE);
    if (valueFirst == PARAM_0) {
        int semval = semctl(semid, PARAM_0, GETVAL);
        if (semval == PARAM_EACCES) {
            napi_value result;
            napi_create_int32(env, semval, &result);
            return result;
        } else {
            napi_value result;
            napi_create_int32(env, ONEVAL, &result);
            return result;
        }
    }
    return nullptr;
}

static napi_value Semget(napi_env env, napi_callback_info info)
{
    static const char path[] = ".";
    static const int id = 's';
    key_t k = ftok(path, id);
    int semval = semget(k, ONEVAL, IPC_CREAT | TEST_MODE);
    napi_value result;
    napi_create_int32(env, semval, &result);
    return result;
}
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"semop", nullptr, Semop, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"semtimedop", nullptr, Semtimedop, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"semctl", nullptr, Semctl, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"semget", nullptr, Semget, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "sem",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
