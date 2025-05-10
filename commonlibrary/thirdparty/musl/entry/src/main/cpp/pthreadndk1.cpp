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
#include <cerrno>
#include <climits>
#include <csignal>
#include <cstdlib>
#include <cstring>
#include <pthread.h>
#include <semaphore.h>
#include <unistd.h>
#include <atomic>

#define PARAM_0 0
#define PARAM_1 1
#define PARAM_2 2
#define PARAM_3 3
#define PARAM_128 128
#define MPARAM_1 (-1)
#define PARAM_4 4
#define PARAM_5 5
#define PARAM_0x4001 0x4001
#define PARAM_4069 4069
#define SLEEP_10_MS 10

struct pthreadAtForkParam {
    pthread_mutex_t mutex;
    int prepare;
    int parent;
    int child;
};
static pthreadAtForkParam gPthreadAtForkParam;
static void PthreadAtForkPrepare()
{
    pthread_mutex_lock(&gPthreadAtForkParam.mutex);
    gPthreadAtForkParam.prepare++;
}
static void PthreadAtForkParent()
{
    pthread_mutex_unlock(&gPthreadAtForkParam.mutex);
    gPthreadAtForkParam.parent++;
}
static void PthreadAtForkChild()
{
    pthread_mutex_unlock(&gPthreadAtForkParam.mutex);
    gPthreadAtForkParam.child++;
}
static void *PthreadAtForkThread(void *arg)
{
    pthread_mutex_lock(&gPthreadAtForkParam.mutex);
    sleep(PARAM_3);
    pthread_mutex_unlock(&gPthreadAtForkParam.mutex);
    return nullptr;
}
static napi_value PThreadAtFork(napi_env env, napi_callback_info info)
{
    pthread_t threadId;
    gPthreadAtForkParam.mutex = PTHREAD_MUTEX_INITIALIZER;
    gPthreadAtForkParam.prepare = PARAM_0;
    gPthreadAtForkParam.parent = PARAM_0;
    gPthreadAtForkParam.child = PARAM_0;
    pthread_create(&threadId, nullptr, PthreadAtForkThread, nullptr);
    int ret = pthread_atfork(PthreadAtForkPrepare, PthreadAtForkParent, PthreadAtForkChild);
    sleep(PARAM_1);
    pid_t processId = fork();
    if (processId == PARAM_0) {
        pthread_mutex_lock(&gPthreadAtForkParam.mutex);
        sleep(PARAM_1);
        pthread_mutex_unlock(&gPthreadAtForkParam.mutex);
        _exit(PARAM_0);
    } else if (processId > PARAM_0) {
        pthread_join(threadId, nullptr);
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PThreadAttrDestroy(napi_env env, napi_callback_info info)
{
    pthread_attr_t attr;
    int ret = pthread_attr_destroy(&attr);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PThreadAttrGetDetachState(napi_env env, napi_callback_info info)
{
    pthread_attr_t attr;
    int state;
    pthread_attr_init(&attr);
    pthread_attr_setdetachstate(&attr, PTHREAD_CREATE_DETACHED);
    int ret = pthread_attr_getdetachstate(&attr, &state);
    pthread_attr_destroy(&attr);
    ret |= state != PTHREAD_CREATE_DETACHED;
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PThreadAttrGetGuardSize(napi_env env, napi_callback_info info)
{
    const size_t testSize = PARAM_128;
    pthread_attr_t attr;
    size_t size;
    pthread_attr_init(&attr);
    pthread_attr_setguardsize(&attr, testSize);
    int ret = pthread_attr_getguardsize(&attr, &size);
    pthread_attr_destroy(&attr);
    ret |= size != testSize;
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PThreadAttrGetInheritSched(napi_env env, napi_callback_info info)
{
    pthread_attr_t attr;
    int sched;
    pthread_attr_init(&attr);
    pthread_attr_setinheritsched(&attr, PTHREAD_EXPLICIT_SCHED);
    int ret = pthread_attr_getinheritsched(&attr, &sched);
    pthread_attr_destroy(&attr);
    ret |= sched != PTHREAD_EXPLICIT_SCHED;
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PThreadAttrGetSchedParam(napi_env env, napi_callback_info info)
{
    const int testSchedPriority = PARAM_1;
    pthread_attr_t attr;
    sched_param setparam;
    sched_param getparam;
    setparam.sched_priority = testSchedPriority;
    pthread_attr_init(&attr);
    pthread_attr_setschedparam(&attr, &setparam);
    int ret = pthread_attr_getschedparam(&attr, &getparam);
    pthread_attr_destroy(&attr);
    ret |= getparam.sched_priority != testSchedPriority;
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PThreadAttrGetSchedPolicy(napi_env env, napi_callback_info info)
{
    const int testSchedPolicy = PARAM_1;
    pthread_attr_t attr;
    int policy;
    pthread_attr_init(&attr);
    pthread_attr_setschedpolicy(&attr, testSchedPolicy);
    int ret = pthread_attr_getschedpolicy(&attr, &policy);
    pthread_attr_destroy(&attr);
    ret |= policy != testSchedPolicy;
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PThreadAttrGetScope(napi_env env, napi_callback_info info)
{
    pthread_attr_t attr;
    int scope;
    pthread_attr_init(&attr);
    pthread_attr_setscope(&attr, PTHREAD_SCOPE_SYSTEM);
    int ret = pthread_attr_getscope(&attr, &scope);
    pthread_attr_destroy(&attr);
    ret |= scope != PTHREAD_SCOPE_SYSTEM;
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PThreadAttrGetStack(napi_env env, napi_callback_info info)
{
    const size_t testStackSize = PARAM_0x4001;
    pthread_attr_t attr;
    void *stackAddr = nullptr;
    void *getStackAddr = nullptr;
    size_t getStackSize = PARAM_0;
    int pageSize = getpagesize();
    pthread_attr_init(&attr);
    posix_memalign(&stackAddr, pageSize, testStackSize);
    pthread_attr_setstack(&attr, stackAddr, testStackSize);
    int ret = pthread_attr_getstack(&attr, &getStackAddr, &getStackSize);
    pthread_attr_destroy(&attr);
    ret |= stackAddr != getStackAddr;
    ret |= getStackSize != testStackSize;
    if (stackAddr != nullptr) {
        free(stackAddr);
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PThreadAttrGetStackSize(napi_env env, napi_callback_info info)
{
    const size_t testStackSize = PARAM_4069;
    pthread_attr_t attr;
    size_t stackSize = PARAM_0;
    pthread_attr_init(&attr);
    pthread_attr_setstacksize(&attr, testStackSize);
    int ret = pthread_attr_getstacksize(&attr, &stackSize);
    pthread_attr_destroy(&attr);
    ret |= stackSize != testStackSize;
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PThreadAttrInit(napi_env env, napi_callback_info info)
{
    pthread_attr_t attr;
    int ret = pthread_attr_init(&attr);
    pthread_attr_destroy(&attr);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PThreadAttrSetDetachState_One(napi_env env, napi_callback_info info)
{
    pthread_attr_t attr;
    int state;
    pthread_attr_init(&attr);
    int ret = pthread_attr_setdetachstate(&attr, PTHREAD_CREATE_DETACHED);
    pthread_attr_getdetachstate(&attr, &state);
    pthread_attr_destroy(&attr);
    ret |= state != PTHREAD_CREATE_DETACHED;
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PThreadAttrSetDetachState_Two(napi_env env, napi_callback_info info)
{
    const int errorState = PARAM_2;
    pthread_attr_t attr;
    pthread_attr_init(&attr);
    int ret = pthread_attr_setdetachstate(&attr, errorState);
    pthread_attr_destroy(&attr);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PThreadAttrSetGuardSize_One(napi_env env, napi_callback_info info)
{
    const size_t testSize = PARAM_128;
    pthread_attr_t attr;
    size_t size;
    pthread_attr_init(&attr);
    int ret = pthread_attr_setguardsize(&attr, testSize);
    pthread_attr_getguardsize(&attr, &size);
    pthread_attr_destroy(&attr);
    ret |= size != testSize;
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PThreadAttrSetGuardSize_Two(napi_env env, napi_callback_info info)
{
    pthread_attr_t attr;
    pthread_attr_init(&attr);
    int ret = pthread_attr_setguardsize(&attr, SIZE_MAX);
    pthread_attr_destroy(&attr);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PThreadAttrSetInheritSched_One(napi_env env, napi_callback_info info)
{
    pthread_attr_t attr;
    int sched;
    pthread_attr_init(&attr);
    int ret = pthread_attr_setinheritsched(&attr, PTHREAD_EXPLICIT_SCHED);
    pthread_attr_getinheritsched(&attr, &sched);
    pthread_attr_destroy(&attr);
    ret |= sched != PTHREAD_EXPLICIT_SCHED;
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PThreadAttrSetInheritSched_Two(napi_env env, napi_callback_info info)
{
    const int testInheritSched = PARAM_2;
    pthread_attr_t attr;
    pthread_attr_init(&attr);
    int ret = pthread_attr_setinheritsched(&attr, testInheritSched);
    pthread_attr_destroy(&attr);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PThreadAttrSetSchedParam(napi_env env, napi_callback_info info)
{
    const int testSchedPriority = PARAM_1;
    pthread_attr_t attr;
    sched_param setparam;
    sched_param getparam;
    setparam.sched_priority = testSchedPriority;
    pthread_attr_init(&attr);
    int ret = pthread_attr_setschedparam(&attr, &setparam);
    pthread_attr_getschedparam(&attr, &getparam);
    pthread_attr_destroy(&attr);
    ret |= getparam.sched_priority != testSchedPriority;
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PThreadAttrSetSchedPolicy(napi_env env, napi_callback_info info)
{
    const int testSchedPolicy = PARAM_1;
    pthread_attr_t attr;
    int policy;
    pthread_attr_init(&attr);
    int ret = pthread_attr_setschedpolicy(&attr, testSchedPolicy);
    pthread_attr_getschedpolicy(&attr, &policy);
    pthread_attr_destroy(&attr);
    ret |= policy != testSchedPolicy;
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PThreadAttrSetScope_One(napi_env env, napi_callback_info info)
{
    pthread_attr_t attr;
    int scope;
    pthread_attr_init(&attr);
    int ret = pthread_attr_setscope(&attr, PTHREAD_SCOPE_SYSTEM);
    pthread_attr_getscope(&attr, &scope);
    pthread_attr_destroy(&attr);
    ret |= scope != PTHREAD_SCOPE_SYSTEM;
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PThreadAttrSetScope_Two(napi_env env, napi_callback_info info)
{
    const int testScope = PARAM_2;
    pthread_attr_t attr;
    pthread_attr_init(&attr);
    int ret = pthread_attr_setscope(&attr, testScope);
    pthread_attr_destroy(&attr);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PThreadAttrSetStack_One(napi_env env, napi_callback_info info)
{
    const size_t testStackSize = PARAM_0x4001;
    pthread_attr_t attr;
    void *stackAddr = nullptr;
    void *getStackAddr = nullptr;
    size_t getStackSize = PARAM_0;
    int pageSize = getpagesize();
    pthread_attr_init(&attr);
    posix_memalign(&stackAddr, pageSize, testStackSize);
    int ret = pthread_attr_setstack(&attr, stackAddr, testStackSize);
    pthread_attr_getstack(&attr, &getStackAddr, &getStackSize);
    pthread_attr_destroy(&attr);
    ret |= stackAddr != getStackAddr;
    ret |= getStackSize != testStackSize;
    if (stackAddr != nullptr) {
        free(stackAddr);
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PThreadAttrSetStack_Two(napi_env env, napi_callback_info info)
{
    const int testStackSize = MPARAM_1;
    pthread_attr_t attr;
    void *stackAddr = nullptr;
    pthread_attr_init(&attr);
    int ret = pthread_attr_setstack(&attr, stackAddr, testStackSize);
    pthread_attr_destroy(&attr);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PThreadAttrSetStack_Three(napi_env env, napi_callback_info info)
{
    const int testStackSize = PTHREAD_STACK_MIN - PARAM_1;
    pthread_attr_t attr;
    void *stackAddr = nullptr;
    pthread_attr_init(&attr);
    int ret = pthread_attr_setstack(&attr, stackAddr, testStackSize);
    pthread_attr_destroy(&attr);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PThreadAttrSetStackSize_One(napi_env env, napi_callback_info info)
{
    const size_t testStackSize = PARAM_4069;
    pthread_attr_t attr;
    size_t stackSize = PARAM_0;
    pthread_attr_init(&attr);
    int ret = pthread_attr_setstacksize(&attr, testStackSize);
    pthread_attr_getstacksize(&attr, &stackSize);
    pthread_attr_destroy(&attr);
    ret |= stackSize != testStackSize;
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PThreadAttrSetStackSize_Two(napi_env env, napi_callback_info info)
{
    const size_t testStackSize = MPARAM_1;
    pthread_attr_t attr;
    pthread_attr_init(&attr);
    int ret = pthread_attr_setstacksize(&attr, testStackSize);
    pthread_attr_destroy(&attr);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PThreadBarrierDestroy(napi_env env, napi_callback_info info)
{
    pthread_barrier_t barrier;
    unsigned int threadnum = PARAM_4;
    pthread_barrier_init(&barrier, nullptr, threadnum);
    int ret = pthread_barrier_destroy(&barrier);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PThreadBarrierInit(napi_env env, napi_callback_info info)
{
    pthread_barrier_t barrier;
    unsigned int threadnum = PARAM_4;
    int ret = pthread_barrier_init(&barrier, nullptr, threadnum);
    pthread_barrier_destroy(&barrier);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
int g_pthreadBarrierWaitResult;
static void *PThreadBarrierWaitThread(void *arg)
{
    pthread_barrier_t *pbarrier = (pthread_barrier_t *)arg;
    g_pthreadBarrierWaitResult = pthread_barrier_wait(pbarrier);
    return nullptr;
}

static napi_value PThreadBarrierWait(napi_env env, napi_callback_info info)
{
    const unsigned int threadnum = PARAM_4;
    pthread_barrier_t barrier;
    pthread_t threadIds[threadnum];
    pthread_barrier_init(&barrier, nullptr, threadnum + PARAM_1);
    for (unsigned int i = PARAM_0; i < threadnum; i++) {
        pthread_create(&threadIds[i], nullptr, PThreadBarrierWaitThread, &barrier);
    }
    int ret = pthread_barrier_wait(&barrier);
    for (unsigned int i = PARAM_0; i < threadnum; i++) {
        pthread_join(threadIds[i], nullptr);
        ret |= g_pthreadBarrierWaitResult;
    }
    pthread_barrier_destroy(&barrier);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PThreadBarrierAttrDestroy(napi_env env, napi_callback_info info)
{
    pthread_barrierattr_t attr;
    pthread_barrierattr_init(&attr);
    int ret = pthread_barrierattr_destroy(&attr);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PThreadBarrierAttrInit(napi_env env, napi_callback_info info)
{
    pthread_barrierattr_t attr;
    int ret = pthread_barrierattr_init(&attr);
    pthread_barrierattr_destroy(&attr);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PThreadBarrierAttrGetPShared(napi_env env, napi_callback_info info)
{
    pthread_barrierattr_t attr;
    int shared;
    pthread_barrierattr_init(&attr);
    pthread_barrierattr_setpshared(&attr, PTHREAD_PROCESS_SHARED);
    int ret = pthread_barrierattr_getpshared(&attr, &shared);
    pthread_barrierattr_destroy(&attr);
    ret |= shared != PTHREAD_PROCESS_SHARED;
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PThreadBarrierAttrSetPShared(napi_env env, napi_callback_info info)
{
    pthread_barrierattr_t attr;
    int shared;
    pthread_barrierattr_init(&attr);
    int ret = pthread_barrierattr_setpshared(&attr, PTHREAD_PROCESS_SHARED);
    pthread_barrierattr_getpshared(&attr, &shared);
    pthread_barrierattr_destroy(&attr);
    ret |= shared != PTHREAD_PROCESS_SHARED;
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PThreadCondBroadcast(napi_env env, napi_callback_info info)
{
    pthread_cond_t cond = PTHREAD_COND_INITIALIZER;
    int ret = pthread_cond_broadcast(&cond);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PThreadCondDestroy(napi_env env, napi_callback_info info)
{
    pthread_cond_t cond;
    pthread_cond_init(&cond, nullptr);
    int ret = pthread_cond_destroy(&cond);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PThreadCondInit(napi_env env, napi_callback_info info)
{
    pthread_cond_t cond = PTHREAD_COND_INITIALIZER;
    pthread_condattr_t attr;
    int ret = pthread_cond_init(&cond, &attr);
    pthread_cond_destroy(&cond);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PThreadCondSignal(napi_env env, napi_callback_info info)
{
    pthread_cond_t cond = PTHREAD_COND_INITIALIZER;
    int ret = pthread_cond_signal(&cond);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

struct pthreadCondTimedWaitParam {
    pthread_cond_t cond;
    pthread_mutex_t mutex;
};
int g_pthreadCondTimedWaitResult;
static void *PThreadCondTimedWaitThreadA(void *arg)
{
    pthreadCondTimedWaitParam *pparam = (pthreadCondTimedWaitParam *)arg;
    timespec outtime;
    pthread_mutex_lock(&(pparam->mutex));
    clock_gettime(CLOCK_REALTIME, &outtime);
    outtime.tv_sec += PARAM_5;
    g_pthreadCondTimedWaitResult = pthread_cond_timedwait(&(pparam->cond), &(pparam->mutex), &outtime);
    pthread_mutex_unlock(&(pparam->mutex));
    return nullptr;
}
static void *PThreadCondTimedWaitThreadB(void *arg)
{
    pthreadCondTimedWaitParam *pparam = (pthreadCondTimedWaitParam *)arg;
    pthread_mutex_lock(&(pparam->mutex));
    pthread_cond_signal(&(pparam->cond));
    pthread_mutex_unlock(&(pparam->mutex));
    return nullptr;
}

static napi_value PThreadCondTimedWait(napi_env env, napi_callback_info info)
{
    pthreadCondTimedWaitParam param;
    pthread_t threadIdA;
    pthread_t threadIdB;
    pthread_cond_init(&param.cond, nullptr);
    pthread_mutex_init(&param.mutex, nullptr);
    pthread_create(&threadIdA, nullptr, PThreadCondTimedWaitThreadA, &param);
    pthread_create(&threadIdB, nullptr, PThreadCondTimedWaitThreadB, &param);
    pthread_join(threadIdA, nullptr);
    pthread_join(threadIdB, nullptr);
    pthread_cond_destroy(&param.cond);
    pthread_mutex_destroy(&param.mutex);
    napi_value result = nullptr;
    napi_create_int32(env, g_pthreadCondTimedWaitResult, &result);
    return result;
}

struct pthreadCondWaitParam {
    pthread_cond_t cond;
    pthread_mutex_t mutex;
};
std:: atomic<bool> isPthreadRun (false);
int g_pthreadCondWaitResult;
static void *PThreadCondWaitThreadA(void *arg)
{
    pthreadCondWaitParam *pparam = (pthreadCondWaitParam *)arg;
    pthread_mutex_lock(&(pparam->mutex));
    isPthreadRun = true;
    g_pthreadCondWaitResult = pthread_cond_wait(&(pparam->cond), &(pparam->mutex));
    pthread_mutex_unlock(&(pparam->mutex));
    return nullptr;
}
static void *PThreadCondWaitThreadB(void *arg)
{
    pthreadCondWaitParam *pparam = (pthreadCondWaitParam *)arg;
    while(!isPthreadRun){
        usleep(SLEEP_10_MS);
    }
    pthread_mutex_lock(&(pparam->mutex));
    pthread_cond_signal(&(pparam->cond));
    pthread_mutex_unlock(&(pparam->mutex));
    return nullptr;
}

static napi_value PThreadCondWait(napi_env env, napi_callback_info info)
{
    isPthreadRun = false;
    pthreadCondWaitParam param;
    pthread_t threadIdA;
    pthread_t threadIdB;
    pthread_cond_init(&param.cond, nullptr);
    pthread_mutex_init(&param.mutex, nullptr);
    pthread_create(&threadIdA, nullptr, PThreadCondWaitThreadA, &param);
    pthread_create(&threadIdB, nullptr, PThreadCondWaitThreadB, &param);
    pthread_join(threadIdA, nullptr);
    pthread_join(threadIdB, nullptr);
    pthread_cond_destroy(&param.cond);
    pthread_mutex_destroy(&param.mutex);
    napi_value result = nullptr;
    napi_create_int32(env, g_pthreadCondWaitResult, &result);
    return result;
}

static napi_value PThreadCondAttrDestroy(napi_env env, napi_callback_info info)
{
    pthread_condattr_t attr;
    pthread_condattr_init(&attr);
    int ret = pthread_condattr_destroy(&attr);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PThreadCondAttrGetClock(napi_env env, napi_callback_info info)
{
    pthread_condattr_t attr;
    int clock;
    pthread_condattr_init(&attr);
    pthread_condattr_setclock(&attr, CLOCK_MONOTONIC);
    int ret = pthread_condattr_getclock(&attr, &clock);
    pthread_condattr_destroy(&attr);
    ret |= clock != CLOCK_MONOTONIC;
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PThreadCondAttrGetPShared(napi_env env, napi_callback_info info)
{
    pthread_condattr_t attr;
    int shared;
    pthread_condattr_init(&attr);
    pthread_condattr_setpshared(&attr, PTHREAD_PROCESS_SHARED);
    int ret = pthread_condattr_getpshared(&attr, &shared);
    pthread_condattr_destroy(&attr);
    ret |= shared != PTHREAD_PROCESS_SHARED;
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PThreadCondAttrInit(napi_env env, napi_callback_info info)
{
    pthread_condattr_t attr;
    int ret = pthread_condattr_init(&attr);
    pthread_condattr_destroy(&attr);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PThreadCondAttrSetClock(napi_env env, napi_callback_info info)
{
    pthread_condattr_t attr;
    int clock;
    pthread_condattr_init(&attr);
    int ret = pthread_condattr_setclock(&attr, CLOCK_MONOTONIC);
    pthread_condattr_getclock(&attr, &clock);
    pthread_condattr_destroy(&attr);
    ret |= clock != CLOCK_MONOTONIC;
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PThreadCondAttrSetPShared(napi_env env, napi_callback_info info)
{
    pthread_condattr_t attr;
    int shared;
    pthread_condattr_init(&attr);
    int ret = pthread_condattr_setpshared(&attr, PTHREAD_PROCESS_SHARED);
    pthread_condattr_getpshared(&attr, &shared);
    pthread_condattr_destroy(&attr);
    ret |= shared != PTHREAD_PROCESS_SHARED;
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static void *PThreadCreateThread(void *arg)
{
    int *pret = static_cast<int *>(arg);
    (*pret)++;
    return pret;
}

static napi_value PThreadCreate(napi_env env, napi_callback_info info)
{
    int count = PARAM_0;
    pthread_t threadId;
    int ret = pthread_create(&threadId, nullptr, PThreadCreateThread, &count);
    pthread_join(threadId, nullptr);
    ret |= count != PARAM_1;
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static void *PThreadDetachThread(void *arg)
{
    int *pret = static_cast<int *>(arg);
    (*pret)++;
    pthread_exit(PARAM_0);
    return pret;
}

static napi_value PThreadDetach(napi_env env, napi_callback_info info)
{
    int count = PARAM_0;
    pthread_t threadId;
    pthread_create(&threadId, nullptr, PThreadDetachThread, &count);
    int ret = pthread_detach(threadId);
    sleep(PARAM_1);
    ret |= count != PARAM_1;
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static void *PThreadEqualThread(void *arg)
{
    pthread_t *pthreadId = (pthread_t *)arg;
    *pthreadId = pthread_self();
    return nullptr;
}

static napi_value PThreadEqual(napi_env env, napi_callback_info info)
{
    pthread_t threadId;
    pthread_t threadId2;
    pthread_create(&threadId, nullptr, PThreadEqualThread, &threadId2);
    pthread_join(threadId, nullptr);
    int ret = pthread_equal(threadId, threadId2);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
int g_pthreadExitResult;
static void *PThreadExitThread(void *arg)
{
    g_pthreadExitResult = *static_cast<int *>(arg);
    pthread_exit((void *)&g_pthreadExitResult);
    return nullptr;
}

static napi_value PThreadExit(napi_env env, napi_callback_info info)
{
    pthread_t threadId;
    int count = PARAM_1;
    pthread_create(&threadId, nullptr, PThreadExitThread, &count);
    pthread_join(threadId, nullptr);
    int ret = count != g_pthreadExitResult;
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static void *PThreadGetAttrNpThread(void *arg) { return arg; }

static napi_value PThreadGetAttrNp(napi_env env, napi_callback_info info)
{
    pthread_t threadId;
    pthread_attr_t attr;
    pthread_attr_init(&attr);
    pthread_create(&threadId, nullptr, PThreadGetAttrNpThread, nullptr);
    int ret = pthread_getattr_np(threadId, &attr);
    pthread_join(threadId, nullptr);
    pthread_attr_destroy(&attr);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PThreadGetCpuClockId(napi_env env, napi_callback_info info)
{
    clockid_t clockid;
    int ret = pthread_getcpuclockid(pthread_self(), &clockid);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PThreadGetSchedParam(napi_env env, napi_callback_info info)
{
    int policy = PARAM_0;
    sched_param param;
    int ret = pthread_getschedparam(pthread_self(), &policy, &param);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PThreadGetSpecific(napi_env env, napi_callback_info info)
{
    int value = PARAM_1;
    pthread_key_t key;
    pthread_key_create(&key, nullptr);
    pthread_setspecific(key, static_cast<void *>(&value));
    int keyRet = *static_cast<int *>(pthread_getspecific(key));
    pthread_key_delete(key);
    int ret = value != keyRet;
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
int g_pthreadJoinResult;
static void *PThreadJoinThread(void *arg)
{
    g_pthreadJoinResult = *static_cast<int *>(arg);
    g_pthreadJoinResult++;
    return nullptr;
}

static napi_value PThreadJoin(napi_env env, napi_callback_info info)
{
    pthread_t threadId;
    int value = PARAM_0;
    pthread_create(&threadId, nullptr, PThreadJoinThread, static_cast<void *>(&value));
    int ret = pthread_join(threadId, nullptr);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PThreadKeyCreate(napi_env env, napi_callback_info info)
{
    pthread_key_t key;
    int ret = pthread_key_create(&key, nullptr);
    pthread_key_delete(key);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PThreadKeyDelete(napi_env env, napi_callback_info info)
{
    pthread_key_t key;
    pthread_key_create(&key, nullptr);
    int ret = pthread_key_delete(key);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static void PThreadKillHandler(int sig) { return; }

struct sigaction actold;
int g_pthreadKillResult;
static void *PThreadKillThread(void *arg)
{
    struct sigaction act;
    memset(&act, PARAM_0, sizeof(act));
    act.sa_flags = PARAM_0;
    act.sa_handler = PThreadKillHandler;
    sigemptyset(&act.sa_mask);
    sigaction(SIGUSR1, &act, &actold);
    int sigret = sigpause(SIGUSR1);
    g_pthreadKillResult = (sigret == -1) && (errno == EINTR);
    sigaction(SIGUSR1, &actold, nullptr);
    return nullptr;
}

static napi_value PThreadKill(napi_env env, napi_callback_info info)
{
    pthread_t threadId;
    pthread_create(&threadId, nullptr, PThreadKillThread, nullptr);
    sleep(PARAM_1);
    int killRet = pthread_kill(threadId, SIGUSR1);
    pthread_join(threadId, nullptr);
    int ret = (killRet == PARAM_0) && (g_pthreadKillResult == PARAM_1);
    napi_value result = nullptr;
    napi_create_int32(env, !ret, &result);
    return result;
}

static napi_value PThreadMutexDestroy(napi_env env, napi_callback_info info)
{
    pthread_mutex_t mutex;
    pthread_mutex_init(&mutex, nullptr);
    int ret = pthread_mutex_destroy(&mutex);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PThreadMutexInit(napi_env env, napi_callback_info info)
{
    pthread_mutex_t mutex;
    int ret = pthread_mutex_init(&mutex, nullptr);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PThreadMutexLock(napi_env env, napi_callback_info info)
{
    pthread_mutex_t mutex;
    pthread_mutex_init(&mutex, nullptr);
    int ret = pthread_mutex_lock(&mutex);
    pthread_mutex_unlock(&mutex);
    pthread_mutex_destroy(&mutex);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PThreadMutexTimedLock(napi_env env, napi_callback_info info)
{
    pthread_mutex_t mutex;
    timespec ts = {1, 0};
    pthread_mutex_init(&mutex, nullptr);
    int ret = pthread_mutex_timedlock(&mutex, &ts);
    pthread_mutex_unlock(&mutex);
    pthread_mutex_destroy(&mutex);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PThreadMutexTryLock(napi_env env, napi_callback_info info)
{
    pthread_mutex_t mutex;
    pthread_mutex_init(&mutex, nullptr);
    int ret = pthread_mutex_trylock(&mutex);
    pthread_mutex_unlock(&mutex);
    pthread_mutex_destroy(&mutex);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PThreadMutexUnlock(napi_env env, napi_callback_info info)
{
    pthread_mutex_t mutex;
    pthread_mutex_init(&mutex, nullptr);
    pthread_mutex_lock(&mutex);
    int ret = pthread_mutex_unlock(&mutex);
    pthread_mutex_destroy(&mutex);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PThreadMutexAttrDestroy(napi_env env, napi_callback_info info)
{
    pthread_mutexattr_t attr;
    pthread_mutexattr_init(&attr);
    int ret = pthread_mutexattr_destroy(&attr);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PThreadMutexAttrGetProtocol(napi_env env, napi_callback_info info)
{
    pthread_mutexattr_t attr;
    int protocol = PARAM_0;
    pthread_mutexattr_init(&attr);
    pthread_mutexattr_setprotocol(&attr, PTHREAD_PRIO_INHERIT);
    int ret = pthread_mutexattr_getprotocol(&attr, &protocol);
    pthread_mutexattr_destroy(&attr);
    ret |= protocol != PTHREAD_PRIO_INHERIT;
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PThreadMutexAttrGetPShared(napi_env env, napi_callback_info info)
{
    pthread_mutexattr_t attr;
    int shared = PARAM_0;
    pthread_mutexattr_init(&attr);
    pthread_mutexattr_setpshared(&attr, PTHREAD_PROCESS_SHARED);
    int ret = pthread_mutexattr_getpshared(&attr, &shared);
    pthread_mutexattr_destroy(&attr);
    ret |= shared != PTHREAD_PROCESS_SHARED;
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PThreadMutexAttrGetType(napi_env env, napi_callback_info info)
{
    pthread_mutexattr_t attr;
    int type = PARAM_0;
    pthread_mutexattr_init(&attr);
    pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_RECURSIVE);
    int ret = pthread_mutexattr_gettype(&attr, &type);
    pthread_mutexattr_destroy(&attr);
    ret |= type != PTHREAD_MUTEX_RECURSIVE;
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PThreadMutexAttrInit(napi_env env, napi_callback_info info)
{
    pthread_mutexattr_t attr;
    int ret = pthread_mutexattr_init(&attr);
    pthread_mutexattr_destroy(&attr);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PThreadMutexAttrSetProtocol(napi_env env, napi_callback_info info)
{
    pthread_mutexattr_t attr;
    int protocol = PARAM_0;
    pthread_mutexattr_init(&attr);
    int ret = pthread_mutexattr_setprotocol(&attr, PTHREAD_PRIO_INHERIT);
    pthread_mutexattr_getprotocol(&attr, &protocol);
    pthread_mutexattr_destroy(&attr);
    ret |= protocol != PTHREAD_PRIO_INHERIT;
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PThreadMutexAttrSetPShared(napi_env env, napi_callback_info info)
{
    pthread_mutexattr_t attr;
    int shared = PARAM_0;
    pthread_mutexattr_init(&attr);
    int ret = pthread_mutexattr_setpshared(&attr, PTHREAD_PROCESS_SHARED);
    pthread_mutexattr_getpshared(&attr, &shared);
    pthread_mutexattr_destroy(&attr);
    ret |= shared != PTHREAD_PROCESS_SHARED;
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PThreadMutexAttrSetType(napi_env env, napi_callback_info info)
{
    pthread_mutexattr_t attr;
    int type = PARAM_0;
    pthread_mutexattr_init(&attr);
    int ret = pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_RECURSIVE);
    pthread_mutexattr_gettype(&attr, &type);
    pthread_mutexattr_destroy(&attr);
    ret |= type != PTHREAD_MUTEX_RECURSIVE;
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

struct pthreadOnceParam {
    pthread_mutex_t mutex;
    pthread_once_t once;
    int count;
};
static pthreadOnceParam gOnceParam;
void PThreadOnceFunc(void)
{
    pthread_mutex_lock(&gOnceParam.mutex);
    gOnceParam.count++;
    pthread_mutex_unlock(&gOnceParam.mutex);
}
int g_pthreadOnceResult;
static void *PThreadOnceThread(void *arg)
{
    g_pthreadOnceResult = pthread_once(&gOnceParam.once, PThreadOnceFunc);
    return nullptr;
}
static napi_value PThreadOnce(napi_env env, napi_callback_info info)
{
    pthread_t thread1;
    pthread_t thread2;
    pthread_t thread3;
    pthread_t thread4;
    pthread_mutex_init(&gOnceParam.mutex, nullptr);
    gOnceParam.once = PTHREAD_ONCE_INIT;
    gOnceParam.count = PARAM_0;

    pthread_create(&thread1, nullptr, PThreadOnceThread, nullptr);
    pthread_create(&thread2, nullptr, PThreadOnceThread, nullptr);
    pthread_create(&thread3, nullptr, PThreadOnceThread, nullptr);
    pthread_create(&thread4, nullptr, PThreadOnceThread, nullptr);
    pthread_join(thread1, nullptr);
    pthread_join(thread2, nullptr);
    pthread_join(thread3, nullptr);
    pthread_join(thread4, nullptr);
    int ret = g_pthreadOnceResult | g_pthreadOnceResult | g_pthreadOnceResult | g_pthreadOnceResult | (gOnceParam.count != 1);
    pthread_mutex_destroy(&gOnceParam.mutex);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PThreadRwLockDestroy(napi_env env, napi_callback_info info)
{
    pthread_rwlock_t lock;
    pthread_rwlock_init(&lock, nullptr);
    int ret = pthread_rwlock_destroy(&lock);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PThreadRwLockInit(napi_env env, napi_callback_info info)
{
    pthread_rwlock_t lock;
    int ret = pthread_rwlock_init(&lock, nullptr);
    pthread_rwlock_destroy(&lock);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PThreadRwLockRdLock(napi_env env, napi_callback_info info)
{
    pthread_rwlock_t lock;
    pthread_rwlock_init(&lock, nullptr);
    int ret = pthread_rwlock_rdlock(&lock);
    pthread_rwlock_unlock(&lock);
    pthread_rwlock_destroy(&lock);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PThreadRwLockTimedRdLock(napi_env env, napi_callback_info info)
{
    pthread_rwlock_t lock;
    timespec ts;
    pthread_rwlock_init(&lock, nullptr);
    clock_gettime(CLOCK_REALTIME, &ts);
    ts.tv_sec += PARAM_1;
    int ret = pthread_rwlock_timedrdlock(&lock, &ts);
    pthread_rwlock_unlock(&lock);
    pthread_rwlock_destroy(&lock);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PThreadRwLockTimedWrLock(napi_env env, napi_callback_info info)
{
    pthread_rwlock_t lock;
    timespec ts;
    pthread_rwlock_init(&lock, nullptr);
    clock_gettime(CLOCK_REALTIME, &ts);
    ts.tv_sec += PARAM_1;
    int ret = pthread_rwlock_timedwrlock(&lock, &ts);
    pthread_rwlock_unlock(&lock);
    pthread_rwlock_destroy(&lock);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PThreadRwLockTryRdLock(napi_env env, napi_callback_info info)
{
    pthread_rwlock_t lock;
    pthread_rwlock_init(&lock, nullptr);
    int ret = pthread_rwlock_tryrdlock(&lock);
    pthread_rwlock_unlock(&lock);
    pthread_rwlock_destroy(&lock);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PThreadRwLockTryWrLock(napi_env env, napi_callback_info info)
{
    pthread_rwlock_t lock;
    pthread_rwlock_init(&lock, nullptr);
    int ret = pthread_rwlock_trywrlock(&lock);
    pthread_rwlock_unlock(&lock);
    pthread_rwlock_destroy(&lock);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PThreadRwLockUnLock(napi_env env, napi_callback_info info)
{
    pthread_rwlock_t lock;
    pthread_rwlock_init(&lock, nullptr);
    pthread_rwlock_rdlock(&lock);
    int ret = pthread_rwlock_unlock(&lock);
    pthread_rwlock_destroy(&lock);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PThreadRwLockWrLock(napi_env env, napi_callback_info info)
{
    pthread_rwlock_t lock;
    pthread_rwlock_init(&lock, nullptr);
    int ret = pthread_rwlock_wrlock(&lock);
    pthread_rwlock_unlock(&lock);
    pthread_rwlock_destroy(&lock);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PThreadRwLockAttrDestroy(napi_env env, napi_callback_info info)
{
    pthread_rwlockattr_t attr;
    pthread_rwlockattr_init(&attr);
    int ret = pthread_rwlockattr_destroy(&attr);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PThreadRwLockAttrGetPShared(napi_env env, napi_callback_info info)
{
    pthread_rwlockattr_t attr;
    int shared = PARAM_0;
    pthread_rwlockattr_init(&attr);
    pthread_rwlockattr_setpshared(&attr, PTHREAD_PROCESS_SHARED);
    int ret = pthread_rwlockattr_getpshared(&attr, &shared);
    pthread_rwlockattr_destroy(&attr);
    ret |= shared != PTHREAD_PROCESS_SHARED;
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PThreadRwLockAttrInit(napi_env env, napi_callback_info info)
{
    pthread_rwlockattr_t attr;
    int ret = pthread_rwlockattr_init(&attr);
    pthread_rwlockattr_destroy(&attr);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PThreadRwLockAttrSetPShared(napi_env env, napi_callback_info info)
{
    pthread_rwlockattr_t attr;
    int shared = PARAM_0;
    pthread_rwlockattr_init(&attr);
    int ret = pthread_rwlockattr_setpshared(&attr, PTHREAD_PROCESS_SHARED);
    pthread_rwlockattr_getpshared(&attr, &shared);
    pthread_rwlockattr_destroy(&attr);
    ret |= shared != PTHREAD_PROCESS_SHARED;
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static void *PThreadSelfThread(void *arg)
{
    pthread_t *pthreadId = (pthread_t *)arg;
    *pthreadId = pthread_self();
    return nullptr;
}

static napi_value PThreadSelf(napi_env env, napi_callback_info info)
{
    pthread_t threadId;
    pthread_t threadId2;
    pthread_create(&threadId, nullptr, PThreadSelfThread, &threadId2);
    pthread_join(threadId, nullptr);
    int ret = pthread_equal(threadId, threadId2);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static void *PThreadSetNameNpThread(void *arg)
{
    sleep(PARAM_1);
    return nullptr;
}

static napi_value PThreadSetNameNp(napi_env env, napi_callback_info info)
{
    const char *pname = const_cast<char *>("testThread");
    char name[20];
    pthread_t threadId;
    pthread_create(&threadId, nullptr, PThreadSetNameNpThread, nullptr);
    int ret = pthread_setname_np(threadId, pname);
    pthread_getname_np(threadId, name, sizeof(name));
    pthread_join(threadId, nullptr);
    int issame = strncmp(pname, name, sizeof(name));
    ret |= issame;
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static void *PThreadSetSchedParamThread(void *arg)
{
    sem_t *psem = (sem_t *)arg;
    sem_wait(psem);
    return nullptr;
}

static napi_value PThreadSetSchedParam(napi_env env, napi_callback_info info)
{
    sem_t sem;
    sched_param sched;
    sched.sched_priority = PARAM_0;
    pthread_t threadId;
    sem_init(&sem, PARAM_0, PARAM_0);
    pthread_create(&threadId, nullptr, PThreadSetSchedParamThread, &sem);
    int ret = pthread_setschedparam(threadId, SCHED_OTHER, &sched);
    sem_post(&sem);
    pthread_join(threadId, nullptr);
    sem_destroy(&sem);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PThreadSetSpecific(napi_env env, napi_callback_info info)
{
    int value = PARAM_1;
    pthread_key_t key;
    pthread_key_create(&key, nullptr);
    int ret = pthread_setspecific(key, static_cast<void *>(&value));
    int keyRet = *static_cast<int *>(pthread_getspecific(key));
    pthread_key_delete(key);
    ret |= value != keyRet;
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
int g_pthreadSigMaskResult;
static void *PThreadSigMaskThread(void *arg)
{
    sigset_t set;
    sigaddset(&set, SIGUSR1);
    g_pthreadSigMaskResult = pthread_sigmask(SIG_BLOCK, &set, nullptr);
    return nullptr;
}

static napi_value PThreadSigMask(napi_env env, napi_callback_info info)
{
    pthread_t threadId;
    pthread_create(&threadId, nullptr, PThreadSigMaskThread, nullptr);
    pthread_join(threadId, nullptr);
    napi_value result = nullptr;
    napi_create_int32(env, g_pthreadSigMaskResult, &result);
    return result;
}

static napi_value PThreadSpinInit(napi_env env, napi_callback_info info)
{
    pthread_spinlock_t lock;
    int ret = pthread_spin_init(&lock, PTHREAD_PROCESS_PRIVATE);
    pthread_spin_destroy(&lock);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PThreadSpinDestroy(napi_env env, napi_callback_info info)
{
    pthread_spinlock_t lock;
    pthread_spin_init(&lock, PTHREAD_PROCESS_PRIVATE);
    int ret = pthread_spin_destroy(&lock);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PThreadSpinLock(napi_env env, napi_callback_info info)
{
    pthread_spinlock_t lock;
    pthread_spin_init(&lock, PTHREAD_PROCESS_PRIVATE);
    int ret = pthread_spin_lock(&lock);
    pthread_spin_unlock(&lock);
    pthread_spin_destroy(&lock);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PThreadSpinTryLock(napi_env env, napi_callback_info info)
{
    pthread_spinlock_t lock;
    pthread_spin_init(&lock, PTHREAD_PROCESS_PRIVATE);
    int ret = pthread_spin_trylock(&lock);
    pthread_spin_unlock(&lock);
    pthread_spin_destroy(&lock);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PThreadSpinUnLock(napi_env env, napi_callback_info info)
{
    pthread_spinlock_t lock;
    pthread_spin_init(&lock, PTHREAD_PROCESS_PRIVATE);
    pthread_spin_lock(&lock);
    int ret = pthread_spin_unlock(&lock);
    pthread_spin_destroy(&lock);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"pThreadAtFork", nullptr, PThreadAtFork, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadAttrDestroy", nullptr, PThreadAttrDestroy, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadAttrGetDetachState", nullptr, PThreadAttrGetDetachState, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"pThreadAttrGetGuardSize", nullptr, PThreadAttrGetGuardSize, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadAttrGetInheritSched", nullptr, PThreadAttrGetInheritSched, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"pThreadAttrGetSchedParam", nullptr, PThreadAttrGetSchedParam, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"pThreadAttrGetSchedPolicy", nullptr, PThreadAttrGetSchedPolicy, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"pThreadAttrGetScope", nullptr, PThreadAttrGetScope, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadAttrGetStack", nullptr, PThreadAttrGetStack, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadAttrGetStackSize", nullptr, PThreadAttrGetStackSize, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadAttrInit", nullptr, PThreadAttrInit, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadAttrSetDetachState_One", nullptr, PThreadAttrSetDetachState_One, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"pThreadAttrSetDetachState_Two", nullptr, PThreadAttrSetDetachState_Two, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"pThreadAttrSetGuardSize_One", nullptr, PThreadAttrSetGuardSize_One, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"pThreadAttrSetGuardSize_Two", nullptr, PThreadAttrSetGuardSize_Two, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"pThreadAttrSetInheritSched_One", nullptr, PThreadAttrSetInheritSched_One, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"pThreadAttrSetInheritSched_Two", nullptr, PThreadAttrSetInheritSched_Two, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"pThreadAttrSetSchedParam", nullptr, PThreadAttrSetSchedParam, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"pThreadAttrSetSchedPolicy", nullptr, PThreadAttrSetSchedPolicy, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"pThreadAttrSetScope_One", nullptr, PThreadAttrSetScope_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadAttrSetScope_Two", nullptr, PThreadAttrSetScope_Two, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadAttrSetStack_One", nullptr, PThreadAttrSetStack_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadAttrSetStack_Two", nullptr, PThreadAttrSetStack_Two, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadAttrSetStack_Three", nullptr, PThreadAttrSetStack_Three, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"pThreadAttrSetStackSize_One", nullptr, PThreadAttrSetStackSize_One, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"pThreadAttrSetStackSize_Two", nullptr, PThreadAttrSetStackSize_Two, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"pThreadBarrierDestroy", nullptr, PThreadBarrierDestroy, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadBarrierInit", nullptr, PThreadBarrierInit, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadBarrierWait", nullptr, PThreadBarrierWait, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadBarrierAttrDestroy", nullptr, PThreadBarrierAttrDestroy, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"pThreadBarrierAttrInit", nullptr, PThreadBarrierAttrInit, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadBarrierAttrGetPShared", nullptr, PThreadBarrierAttrGetPShared, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"pThreadBarrierAttrSetPShared", nullptr, PThreadBarrierAttrSetPShared, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"pThreadCondBroadcast", nullptr, PThreadCondBroadcast, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadCondDestroy", nullptr, PThreadCondDestroy, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadCondInit", nullptr, PThreadCondInit, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadCondSignal", nullptr, PThreadCondSignal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadCondTimedWait", nullptr, PThreadCondTimedWait, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadCondWait", nullptr, PThreadCondWait, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadCondAttrDestroy", nullptr, PThreadCondAttrDestroy, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadCondAttrGetClock", nullptr, PThreadCondAttrGetClock, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadCondAttrGetPShared", nullptr, PThreadCondAttrGetPShared, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"pThreadCondAttrInit", nullptr, PThreadCondAttrInit, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadCondAttrSetClock", nullptr, PThreadCondAttrSetClock, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadCondAttrSetPShared", nullptr, PThreadCondAttrSetPShared, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"pThreadCreate", nullptr, PThreadCreate, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadDetach", nullptr, PThreadDetach, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadEqual", nullptr, PThreadEqual, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadExit", nullptr, PThreadExit, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadGetAttrNp", nullptr, PThreadGetAttrNp, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadGetCpuClockId", nullptr, PThreadGetCpuClockId, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadGetSchedParam", nullptr, PThreadGetSchedParam, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadGetSpecific", nullptr, PThreadGetSpecific, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadJoin", nullptr, PThreadJoin, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadKeyCreate", nullptr, PThreadKeyCreate, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadKeyDelete", nullptr, PThreadKeyDelete, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadKill", nullptr, PThreadKill, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadMutexDestroy", nullptr, PThreadMutexDestroy, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadMutexInit", nullptr, PThreadMutexInit, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadMutexLock", nullptr, PThreadMutexLock, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadMutexTimedLock", nullptr, PThreadMutexTimedLock, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadMutexTryLock", nullptr, PThreadMutexTryLock, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadMutexUnlock", nullptr, PThreadMutexUnlock, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadMutexAttrDestroy", nullptr, PThreadMutexAttrDestroy, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadMutexAttrGetProtocol", nullptr, PThreadMutexAttrGetProtocol, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"pThreadMutexAttrGetPShared", nullptr, PThreadMutexAttrGetPShared, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"pThreadMutexAttrGetType", nullptr, PThreadMutexAttrGetType, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadMutexAttrInit", nullptr, PThreadMutexAttrInit, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadMutexAttrSetProtocol", nullptr, PThreadMutexAttrSetProtocol, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"pThreadMutexAttrSetPShared", nullptr, PThreadMutexAttrSetPShared, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"pThreadMutexAttrSetType", nullptr, PThreadMutexAttrSetType, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadOnce", nullptr, PThreadOnce, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadRwLockDestroy", nullptr, PThreadRwLockDestroy, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadRwLockInit", nullptr, PThreadRwLockInit, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadRwLockRdLock", nullptr, PThreadRwLockRdLock, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadRwLockTimedRdLock", nullptr, PThreadRwLockTimedRdLock, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"pThreadRwLockTimedWrLock", nullptr, PThreadRwLockTimedWrLock, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"pThreadRwLockTryRdLock", nullptr, PThreadRwLockTryRdLock, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadRwLockTryWrLock", nullptr, PThreadRwLockTryWrLock, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadRwLockUnLock", nullptr, PThreadRwLockUnLock, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadRwLockWrLock", nullptr, PThreadRwLockWrLock, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadRwLockAttrDestroy", nullptr, PThreadRwLockAttrDestroy, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"pThreadRwLockAttrGetPShared", nullptr, PThreadRwLockAttrGetPShared, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"pThreadRwLockAttrInit", nullptr, PThreadRwLockAttrInit, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadRwLockAttrSetPShared", nullptr, PThreadRwLockAttrSetPShared, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"pThreadSelf", nullptr, PThreadSelf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadSetNameNp", nullptr, PThreadSetNameNp, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadSetSchedParam", nullptr, PThreadSetSchedParam, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadSetSpecific", nullptr, PThreadSetSpecific, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadSigMask", nullptr, PThreadSigMask, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadSpinInit", nullptr, PThreadSpinInit, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadSpinDestroy", nullptr, PThreadSpinDestroy, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadSpinLock", nullptr, PThreadSpinLock, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadSpinTryLock", nullptr, PThreadSpinTryLock, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pThreadSpinUnLock", nullptr, PThreadSpinUnLock, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "pthread1",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
