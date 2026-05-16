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

#include <cstring>
#include <fcntl.h>
#include <js_native_api.h>
#include <js_native_api_types.h>
#include <node_api.h>
#include <pthread.h>
#include <sched.h>
#include <semaphore.h>
#include <sys/stat.h>

#define ONEHUNDRED 100
#define TWOHUNDRED 200
#define THOUSAND 1000
#define ONE 1
#define FLAG (0644)
#define PARAM_0 0
#define PARAM_1 1
#define ONEVAL 1
#define MINUSONE (-1)
#define VALUE100 100
#define VALUE200 200
#define MINUSVALUE1000 (-1000)
#define TEST_MODE 0777
#define FLAGS (0600)

static napi_value SemGetvalue(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int first = PARAM_0;
    napi_get_value_int32(env, args[0], &first);
    sem_t semp = {PARAM_0};
    int ret = sem_getvalue(&semp, &first);
    sem_destroy(&semp);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value SemOpen(napi_env env, napi_callback_info info)
{
    char name[] = "/testsemopen";
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);

    int ret;
    sem_t *semFirst = sem_open(name, O_CREAT, TEST_MODE, ONE);
    if (semFirst == nullptr || semFirst == SEM_FAILED) {
        ret = -THOUSAND;
    } else {
        ret = TWOHUNDRED;
    }
    if (param == PARAM_0) {
        sem_t *semSecond = sem_open(name, O_CREAT | O_EXCL, TEST_MODE, ONE);
        if (semSecond == nullptr || semSecond == SEM_FAILED) {
            ret = -THOUSAND;
        } else {
            ret = TWOHUNDRED;
        }
        sem_close(semSecond);
        sem_destroy(semSecond);
    }
    sem_close(semFirst);
    sem_unlink(name);
    sem_destroy(semFirst);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value SemUnlink(napi_env env, napi_callback_info info)
{
    char buf[] = "mysemXXXXXX";
    sem_open(buf, O_CREAT | O_EXCL, FLAGS, PARAM_0);
    sem_open(buf, PARAM_0);
    int semval = sem_unlink(buf);
    napi_value result = nullptr;
    napi_create_int32(env, semval, &result);
    return result;
}
static napi_value SemInit(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int first = PARAM_0;
    napi_get_value_int32(env, args[0], &first);
    sem_t bin_sem;
    int ret = sem_init(&bin_sem, PARAM_0, first);
    sem_destroy(&bin_sem);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static sem_t g_sem;
void *threadfuncA(void *arg)
{
    sem_wait(&g_sem);
    return arg;
}

static napi_value SemDestroy(napi_env env, napi_callback_info info)
{
    sem_t semp = {PARAM_0};
    sem_init(&semp, PARAM_0, ONEVAL);
    int sem = sem_destroy(&semp);
    napi_value result = nullptr;
    napi_create_int32(env, sem, &result);
    return result;
}

static napi_value SemPost(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int first = PARAM_0;
    napi_get_value_int32(env, args[0], &first);
    pthread_t tid = PARAM_0;
    sem_init(&g_sem, PARAM_0, PARAM_0);
    pthread_create(&tid, nullptr, threadfuncA, nullptr);
    struct sched_param sched = {PARAM_0};
    sched.sched_priority = PARAM_0;
    pthread_setschedparam(tid, SCHED_OTHER, &sched);
    int semRet = sem_post(&g_sem);
    napi_value result = nullptr;
    napi_create_int32(env, semRet, &result);
    return result;
}

static napi_value SemWait(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int first = PARAM_0;
    napi_get_value_int32(env, args[0], &first);
    sem_t semp = {PARAM_0};
    sem_init(&semp, PARAM_0, first);
    int sem = sem_wait(&semp);
    sem_destroy(&semp);
    napi_value result = nullptr;
    napi_create_double(env, sem, &result);
    return result;
}

static napi_value SemTrywait(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int first = PARAM_0;
    napi_get_value_int32(env, args[0], &first);
    sem_t semp = {PARAM_0};
    sem_init(&semp, PARAM_0, first);
    int sem = sem_trywait(&semp);
    sem_destroy(&semp);
    napi_value result = nullptr;
    napi_create_double(env, sem, &result);
    return result;
}

static napi_value SemTimedwait(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int first = PARAM_0;
    napi_get_value_int32(env, args[0], &first);
    sem_t semp = {PARAM_0};
    sem_init(&semp, PARAM_0, first);
    struct timespec spec = {PARAM_0};
    int sem = sem_timedwait(&semp, &spec);
    sem_destroy(&semp);
    napi_value result = nullptr;
    napi_create_double(env, sem, &result);
    return result;
}
static napi_value SemClose(napi_env env, napi_callback_info info)
{
    char buf[] = "mysemXXXXXX";
    sem_t *sem = sem_open(buf, O_CREAT | O_EXCL, FLAGS, PARAM_0);
    sem_open(buf, PARAM_0);
    sem_unlink(buf);
    int semval = sem_close(sem);
    sem_destroy(sem);
    napi_value result = nullptr;
    napi_create_int32(env, semval, &result);
    return result;
}
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"sem_init", nullptr, SemInit, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sem_destroy", nullptr, SemDestroy, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sem_open", nullptr, SemOpen, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sem_post", nullptr, SemPost, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sem_wait", nullptr, SemWait, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sem_timedwait", nullptr, SemTimedwait, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sem_trywait", nullptr, SemTrywait, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sem_getvalue", nullptr, SemGetvalue, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sem_close", nullptr, SemClose, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "semaphore",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
