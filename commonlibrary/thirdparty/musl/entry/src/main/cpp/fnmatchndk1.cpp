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
#include <pthread.h>
#include <semaphore.h>
#include <cstdlib>
#include <sys/resource.h>
#include <threads.h>
#include <unistd.h>

#define TEST_RESULT_PASSED 0
#define TEST_RESULT_FAILED (-1)
#define PARAM_5 5
#define PARAM_0 0
#define PARAM_1 1
#define PARAM_2 2
#define PARAM_500 500
#define PARAM_1000 1000
#define PARAM_UNNORMAL (-1)
#define ETIMEDOUTS       110

struct cndTimedWaitTime64Param {
    cnd_t cnd;
    mtx_t mutex;
    unsigned sleep;
};

static int CndTimedWaitTime64Thread(void *arg)
{
    struct cndTimedWaitTime64Param *pparam = (cndTimedWaitTime64Param *)arg;

    mtx_lock(&(pparam->mutex));
    if (pparam->sleep > PARAM_0) {
        sleep(pparam->sleep);
    }
    cnd_signal(&(pparam->cnd));
    mtx_unlock(&(pparam->mutex));

    thrd_exit(thrd_success);
}

extern "C" int __cnd_timedwait_time64(cnd_t *__restrict, mtx_t *__restrict, const struct timespec *__restrict);
static napi_value Cnd_timedWait_time64_One(napi_env env, napi_callback_info info)
{
    int ret = TEST_RESULT_FAILED;
    thrd_t id;
    struct cndTimedWaitTime64Param param;
    struct timespec ts {};

    ret = cnd_init(&(param.cnd));
    mtx_init(&(param.mutex), mtx_plain);
    mtx_lock(&(param.mutex));
    param.sleep = PARAM_0;
    clock_gettime(CLOCK_REALTIME, &ts);
    ts.tv_sec += PARAM_1;

    thrd_create(&id, CndTimedWaitTime64Thread, &param);
    ret = __cnd_timedwait_time64(&(param.cnd), &(param.mutex), &ts);
    thrd_join(id, nullptr);

    mtx_unlock(&(param.mutex));
    mtx_destroy(&(param.mutex));
    cnd_destroy(&(param.cnd));

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Cnd_timedWait_time64_Two(napi_env env, napi_callback_info info)
{
    int ret = TEST_RESULT_FAILED;
    thrd_t id;
    struct cndTimedWaitTime64Param param;
    struct timespec ts {};

    ret = cnd_init(&(param.cnd));
    mtx_init(&(param.mutex), mtx_plain);
    mtx_lock(&(param.mutex));
    param.sleep = PARAM_2;
    clock_gettime(CLOCK_REALTIME, &ts);
    ts.tv_sec += PARAM_1;

    thrd_create(&id, CndTimedWaitTime64Thread, &param);
    ret = __cnd_timedwait_time64(&(param.cnd), &(param.mutex), &ts);
    thrd_join(id, nullptr);

    mtx_unlock(&(param.mutex));
    mtx_destroy(&(param.mutex));
    cnd_destroy(&(param.cnd));

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

extern "C" pid_t __wait4_time64(pid_t, int *, int, struct rusage *);
static napi_value Wait4_time64_One(napi_env env, napi_callback_info info)
{
    int ret = TEST_RESULT_FAILED;
    pid_t pid = fork();
    if (pid > PARAM_0) {
        int status = PARAM_0;
        int options = PARAM_0;
        struct rusage ru;
        pid_t wait4ForPid = __wait4_time64(pid, &status, options, &ru);
        if (wait4ForPid == pid && status == PARAM_0) {
            ret = TEST_RESULT_PASSED;
        }
    } else {
        sleep(PARAM_1);
        exit(PARAM_0);
    }

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Wait4_time64_Two(napi_env env, napi_callback_info info)
{
    int ret = TEST_RESULT_FAILED;
    pid_t pid = fork();
    if (pid > PARAM_0) {
        int status = PARAM_0;
        int options = PARAM_0;
        struct rusage ru;
        sleep(PARAM_1);
        pid_t wait4ForPid = __wait4_time64(pid, &status, options, &ru);
        if (wait4ForPid == pid && status == PARAM_0) {
            ret = TEST_RESULT_PASSED;
        }
    } else {
        sleep(PARAM_0);
        exit(PARAM_0);
    }

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

#define NSEC_PER_SEC 1000000000
#define NSEC_PER_MSEC 1000000
#define MS_PER_S 1000
#define SLEEP_10_MS 10
#define SLEEP_100_MS 100
struct pthreadCondTimedwaitTime64Param {
    pthread_cond_t cond;
    pthread_mutex_t mutex;
};
extern "C" int __pthread_cond_timedwait_time64(pthread_cond_t *__restrict, pthread_mutex_t *__restrict,
                                               const struct timespec *__restrict);
static void *PThreadCondTimedWaitTime64Thread(void *arg)
{
    struct pthreadCondTimedwaitTime64Param *pparam = (pthreadCondTimedwaitTime64Param *)arg;
    struct timespec ts {};
    pthread_mutex_lock(&(pparam->mutex));
    clock_gettime(CLOCK_REALTIME, &ts);
    ts.tv_nsec += SLEEP_100_MS * NSEC_PER_MSEC;
    if (ts.tv_nsec >= NSEC_PER_SEC) {
        ts.tv_nsec -= NSEC_PER_SEC;
        ts.tv_sec += PARAM_1;
    }
    int ret = __pthread_cond_timedwait_time64(&(pparam->cond), &(pparam->mutex), &ts);
    pthread_mutex_unlock(&(pparam->mutex));
    return (void *)ret;
}

static napi_value PThread_cond_timedWait_time64_One(napi_env env, napi_callback_info info)
{
    struct pthreadCondTimedwaitTime64Param param;
    pthread_t threadId;
    struct timespec ts {
        PARAM_0, SLEEP_10_MS * NSEC_PER_MSEC
    };
    int ret = TEST_RESULT_FAILED;
    param.cond = PTHREAD_COND_INITIALIZER;
    param.mutex = PTHREAD_MUTEX_INITIALIZER;
    pthread_create(&threadId, nullptr, PThreadCondTimedWaitTime64Thread, &param);
    nanosleep(&ts, nullptr);
    pthread_mutex_lock(&param.mutex);
    pthread_cond_signal(&param.cond);
    pthread_mutex_unlock(&param.mutex);
    pthread_join(threadId, (void **)&ret);
    pthread_cond_destroy(&param.cond);
    pthread_mutex_destroy(&param.mutex);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PThread_cond_timedWait_time64_Two(napi_env env, napi_callback_info info)
{
    struct pthreadCondTimedwaitTime64Param param;
    pthread_t threadId;
    int ret = TEST_RESULT_FAILED;
    param.cond = PTHREAD_COND_INITIALIZER;
    param.mutex = PTHREAD_MUTEX_INITIALIZER;
    pthread_create(&threadId, nullptr, PThreadCondTimedWaitTime64Thread, &param);
    pthread_join(threadId, (void **)&ret);
    pthread_cond_destroy(&param.cond);
    pthread_mutex_destroy(&param.mutex);
    napi_value result = nullptr;
    napi_create_int32(env, ret != ETIMEDOUTS, &result);
    return result;
}

extern "C" int __sem_timedwait_time64(sem_t *__restrict, const struct timespec *__restrict);
static void *SemTimedWaitTime64Thread(void *arg)
{
    sem_t *psem = (sem_t *)arg;
    struct timespec ts;
    clock_gettime(CLOCK_REALTIME, &ts);
    ts.tv_sec += PARAM_1;
    int ret = __sem_timedwait_time64(psem, &ts);
    return (void *)ret;
}

static napi_value Sem_timedWait_time64(napi_env env, napi_callback_info info)
{
    int ret = PARAM_UNNORMAL;
    pthread_t threadId;
    sem_t sem;
    sem_init(&sem, PARAM_0, PARAM_0);
    pthread_create(&threadId, nullptr, SemTimedWaitTime64Thread, &sem);
    usleep(PARAM_500 * PARAM_1000);
    sem_post(&sem);
    pthread_join(threadId, (void **)&ret);
    sem_destroy(&sem);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"__cnd_timedwait_time64_One", nullptr, Cnd_timedWait_time64_One, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"__cnd_timedwait_time64_Two", nullptr, Cnd_timedWait_time64_Two, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"__wait4_time64_One", nullptr, Wait4_time64_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"__wait4_time64_Two", nullptr, Wait4_time64_Two, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"__pthread_cond_timedwait_time64_One", nullptr, PThread_cond_timedWait_time64_One, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"__pthread_cond_timedwait_time64_Two", nullptr, PThread_cond_timedWait_time64_Two, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"__sem_timedwait_time64", nullptr, Sem_timedWait_time64, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "libfnmatchndk1",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }
