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
#include <csignal>
#include <threads.h>
#include <unistd.h>

#define PARAM_0 0
#define PARAM_3 3
#define PARAM_2 2
#define PARAM_1 1
#define MPARAM_1 (-1)
#define PARAM_10 10
#define PARAM_1000 1000
#define PARAM_100 100
#define FPARAM_100 100.0

struct callOnceParam {
    mtx_t mutex;
    int count;
    once_flag flag;
};
static callOnceParam gCallOnce;

void DoOnce(void)
{
    mtx_lock(&gCallOnce.mutex);
    gCallOnce.count++;
    mtx_unlock(&gCallOnce.mutex);
}

static void OnceFunc(void *data) { call_once(&gCallOnce.flag, DoOnce); }

static napi_value CallOnce(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    mtx_init(&gCallOnce.mutex, mtx_plain);
    gCallOnce.count = PARAM_0;
    gCallOnce.flag = ONCE_FLAG_INIT;
    thrd_t thread1;
    thrd_t thread2;
    thrd_t thread3;
    thrd_t thread4;
    thrd_create(&thread1, (thrd_start_t)OnceFunc, nullptr);
    thrd_create(&thread2, (thrd_start_t)OnceFunc, nullptr);
    thrd_create(&thread3, (thrd_start_t)OnceFunc, nullptr);
    thrd_create(&thread4, (thrd_start_t)OnceFunc, nullptr);
    thrd_join(thread1, nullptr);
    thrd_join(thread2, nullptr);
    thrd_join(thread3, nullptr);
    thrd_join(thread4, nullptr);
    int ret = gCallOnce.count;
    mtx_destroy(&gCallOnce.mutex);
    napi_create_int32(env, ret, &result);
    return result;
}

struct cndBroadcastParam {
    mtx_t mutex;
    cnd_t cond;
    unsigned int waitingThreads;
};
static int CndBroadcastThread(void *data)
{
    cndBroadcastParam *pparam = (cndBroadcastParam *)data;
    mtx_lock(&pparam->mutex);
    pparam->waitingThreads++;
    cnd_wait(&pparam->cond, &pparam->mutex);
    pparam->waitingThreads--;
    mtx_unlock(&pparam->mutex);
    thrd_exit(thrd_success);
}

static napi_value Cnd_broadcast(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    const int maxThreadNum = PARAM_3;
    thrd_t threadIds[maxThreadNum];
    cndBroadcastParam param;
    cnd_init(&param.cond);
    mtx_init(&param.mutex, mtx_plain);
    param.waitingThreads = PARAM_0;

    for (int i = PARAM_0; i < maxThreadNum; i++) {
        thrd_create(&threadIds[i], CndBroadcastThread, &param);
    }
    mtx_lock(&param.mutex);
    mtx_unlock(&param.mutex);
    timespec ts = {.tv_nsec = 100 * 1000 * 1000};
    thrd_sleep(&ts, nullptr);
    mtx_lock(&param.mutex);
    mtx_unlock(&param.mutex);
    int ret = cnd_broadcast(&param.cond);
    mtx_unlock(&param.mutex);

    for (int i = PARAM_0; i < maxThreadNum; i++) {
        thrd_join(threadIds[i], nullptr);
    }
    mtx_destroy(&param.mutex);
    cnd_destroy(&param.cond);
    ret += param.waitingThreads;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Cnd_destroy(napi_env env, napi_callback_info info)
{
    cnd_t cond;
    int ret = cnd_init(&cond);
    cnd_destroy(&cond);
    ret = cnd_init(&cond);
    cnd_destroy(&cond);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Cnd_init(napi_env env, napi_callback_info info)
{
    cnd_t cond;
    int ret = cnd_init(&cond);
    cnd_destroy(&cond);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

struct cndSignalParam {
    mtx_t mutex;
    cnd_t cond;
    timespec ts;
    int waitRet;
};
static int CndSignalThread(void *data)
{
    cndSignalParam *pparam = (cndSignalParam *)data;
    mtx_lock(&pparam->mutex);
    pparam->waitRet = cnd_timedwait(&pparam->cond, &pparam->mutex, &pparam->ts);
    mtx_unlock(&pparam->mutex);
    thrd_exit(thrd_success);
}
static napi_value Cnd_signal_One(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    thrd_t threadId;
    cndSignalParam param;
    cnd_init(&param.cond);
    mtx_init(&param.mutex, mtx_plain);
    clock_gettime(CLOCK_REALTIME, &param.ts);
    param.ts.tv_sec += PARAM_2;
    param.waitRet = MPARAM_1;

    thrd_create(&threadId, CndSignalThread, &param);
    sleep(PARAM_1);
    mtx_lock(&param.mutex);
    int ret = cnd_signal(&param.cond);
    mtx_unlock(&param.mutex);

    thrd_join(threadId, nullptr);
    ret |= param.waitRet;
    mtx_destroy(&param.mutex);
    cnd_destroy(&param.cond);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Cnd_signal_Two(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    thrd_t threadId;
    cndSignalParam param;
    cnd_init(&param.cond);
    mtx_init(&param.mutex, mtx_plain);
    clock_gettime(CLOCK_REALTIME, &param.ts);
    param.waitRet = MPARAM_1;

    thrd_create(&threadId, CndSignalThread, &param);
    sleep(PARAM_1);
    mtx_lock(&param.mutex);
    int ret = cnd_signal(&param.cond);
    mtx_unlock(&param.mutex);

    thrd_join(threadId, nullptr);
    ret |= !param.waitRet;
    mtx_destroy(&param.mutex);
    cnd_destroy(&param.cond);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value MtxDestroy(napi_env env, napi_callback_info info)
{
    mtx_t mutex;
    int ret = mtx_init(&mutex, mtx_plain);
    mtx_destroy(&mutex);
    ret = mtx_init(&mutex, mtx_plain);
    mtx_destroy(&mutex);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value MtxInit_One(napi_env env, napi_callback_info info)
{
    mtx_t mutex;
    int ret = mtx_init(&mutex, mtx_plain);
    mtx_destroy(&mutex);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value MtxInit_Two(napi_env env, napi_callback_info info)
{
    mtx_t mutex;
    int ret = mtx_init(&mutex, mtx_timed);
    mtx_destroy(&mutex);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value MtxInit_Three(napi_env env, napi_callback_info info)
{
    mtx_t mutex;
    int ret = mtx_init(&mutex, mtx_plain | mtx_recursive);
    mtx_destroy(&mutex);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value MtxInit_Four(napi_env env, napi_callback_info info)
{
    mtx_t mutex;
    int ret = mtx_init(&mutex, mtx_timed | mtx_recursive);
    mtx_destroy(&mutex);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static int MtxLockThread(void *data)
{
    mtx_t *pmutex = (mtx_t *)data;
    int ret = mtx_lock(pmutex);
    mtx_unlock(pmutex);
    thrd_exit(ret);
}

static int MtxRecursiveLock(void *data)
{
    mtx_t *pmutex = (mtx_t *)data;
    int ret = mtx_lock(pmutex);
    ret |= mtx_lock(pmutex);
    mtx_unlock(pmutex);
    thrd_exit(ret);
}

static napi_value MtxLock_One(napi_env env, napi_callback_info info)
{
    mtx_t mutex;
    thrd_t threadId;
    int ret;
    mtx_init(&mutex, mtx_plain);
    thrd_create(&threadId, MtxLockThread, &mutex);
    thrd_join(threadId, &ret);
    mtx_destroy(&mutex);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value MtxLock_Two(napi_env env, napi_callback_info info)
{
    mtx_t mutex;
    thrd_t threadId;
    int ret;
    mtx_init(&mutex, mtx_timed);
    thrd_create(&threadId, MtxLockThread, &mutex);
    thrd_join(threadId, &ret);
    mtx_destroy(&mutex);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value MtxLock_Three(napi_env env, napi_callback_info info)
{
    mtx_t mutex;
    thrd_t threadId;
    int ret;
    mtx_init(&mutex, mtx_plain | mtx_recursive);
    thrd_create(&threadId, MtxRecursiveLock, &mutex);
    thrd_join(threadId, &ret);
    mtx_destroy(&mutex);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value MtxLock_Four(napi_env env, napi_callback_info info)
{
    mtx_t mutex;
    thrd_t threadId;
    int ret;
    mtx_init(&mutex, mtx_timed | mtx_recursive);
    thrd_create(&threadId, MtxRecursiveLock, &mutex);
    thrd_join(threadId, &ret);
    mtx_destroy(&mutex);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value MtxTimedLock_One(napi_env env, napi_callback_info info)
{
    mtx_t mutex;
    timespec ts = {2, 0};
    mtx_init(&mutex, mtx_timed);
    int ret = mtx_timedlock(&mutex, &ts);
    mtx_unlock(&mutex);
    mtx_destroy(&mutex);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value MtxTimedLock_Two(napi_env env, napi_callback_info info)
{
    mtx_t mutex;
    timespec ts = {2, 0};
    mtx_init(&mutex, mtx_timed);
    mtx_lock(&mutex);
    int ret = mtx_timedlock(&mutex, &ts);
    mtx_unlock(&mutex);
    mtx_destroy(&mutex);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static int MtxTryLockThread(void *data)
{
    mtx_t *pmutex = (mtx_t *)data;
    int ret = mtx_lock(pmutex);
    ret = mtx_trylock(pmutex);
    mtx_unlock(pmutex);
    thrd_exit(ret);
}

static napi_value MtxTryLock_One(napi_env env, napi_callback_info info)
{
    mtx_t mutex;
    thrd_t threadId;
    int ret;
    mtx_init(&mutex, mtx_plain | mtx_recursive);
    thrd_create(&threadId, MtxTryLockThread, &mutex);
    thrd_join(threadId, &ret);
    mtx_destroy(&mutex);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value MtxTryLock_Two(napi_env env, napi_callback_info info)
{
    mtx_t mutex;
    thrd_t threadId;
    int ret;
    mtx_init(&mutex, mtx_plain);
    thrd_create(&threadId, MtxTryLockThread, &mutex);
    thrd_join(threadId, &ret);
    mtx_destroy(&mutex);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value MtxUnlock_One(napi_env env, napi_callback_info info)
{
    mtx_t mutex;
    mtx_init(&mutex, mtx_plain);
    int ret = mtx_lock(&mutex);
    ret = mtx_unlock(&mutex);
    mtx_destroy(&mutex);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value MtxUnlock_Two(napi_env env, napi_callback_info info)
{
    mtx_t mutex;
    mtx_init(&mutex, mtx_plain);
    int ret = mtx_lock(&mutex);
    ret = mtx_unlock(&mutex);
    ret = mtx_unlock(&mutex);
    mtx_destroy(&mutex);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static int ThrdCreateThread(void *arg)
{
    int ret = *(static_cast<int *>(arg));
    thrd_exit(ret);
}

static napi_value Thrd_create(napi_env env, napi_callback_info info)
{
    int threadArg = PARAM_1;
    int threadRet = PARAM_0;
    thrd_t threadId;
    int ret = thrd_create(&threadId, ThrdCreateThread, &threadArg);
    thrd_join(threadId, &threadRet);
    ret |= threadArg != threadRet;
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

struct thrdCurrentParam {
    thrd_t threadId;
};

static int ThrdCurrentThread(void *arg)
{
    thrdCurrentParam *pparam = (thrdCurrentParam *)arg;
    pparam->threadId = thrd_current();
    thrd_exit(thrd_success);
}

static napi_value Thrd_current(napi_env env, napi_callback_info info)
{
    thrdCurrentParam param;
    thrd_t threadId;
    thrd_create(&threadId, ThrdCurrentThread, &param);
    thrd_join(threadId, nullptr);
    int ret = thrd_equal(threadId, param.threadId);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static int ThrdDetachThreadA(void *arg)
{
    int *pret = static_cast<int *>(arg);
    *pret = thrd_detach(thrd_current());
    thrd_exit(thrd_success);
}

static int ThrdDetachThreadB(void *arg)
{
    timespec ts = {1, 0};
    thrd_sleep(&ts, nullptr);
    thrd_exit(thrd_success);
}

static napi_value Thrd_detach_One(napi_env env, napi_callback_info info)
{
    thrd_t threadId;
    int ret = MPARAM_1;
    timespec ts = {1, 0};
    thrd_create(&threadId, ThrdDetachThreadA, &ret);
    thrd_sleep(&ts, nullptr);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Thrd_detach_Two(napi_env env, napi_callback_info info)
{
    thrd_t threadId;
    thrd_create(&threadId, ThrdDetachThreadB, nullptr);
    int ret = thrd_detach(threadId);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

struct thrdEqualParam {
    thrd_t threadId;
};

static int ThrdEqualThread(void *arg)
{
    thrdEqualParam *pparam = (thrdEqualParam *)arg;
    pparam->threadId = thrd_current();
    thrd_exit(thrd_success);
}

static napi_value Thrd_equal_One(napi_env env, napi_callback_info info)
{
    thrdEqualParam param;
    thrd_t threadId;
    thrd_create(&threadId, ThrdEqualThread, &param);
    thrd_join(threadId, nullptr);
    int ret = thrd_equal(threadId, param.threadId);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Thrd_equal_Two(napi_env env, napi_callback_info info)
{
    thrdEqualParam param;
    thrd_t threadId;
    thrd_create(&threadId, ThrdEqualThread, &param);
    thrd_t currentId = thrd_current();
    int ret = thrd_equal(threadId, currentId);
    thrd_join(threadId, nullptr);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static int ThrdExitThread(void *arg)
{
    int ret = *(static_cast<int *>(arg));
    thrd_exit(ret);
}

static napi_value Thrd_exit(napi_env env, napi_callback_info info)
{
    int expectRet = PARAM_1;
    int threadRet = PARAM_0;
    thrd_t threadId;
    thrd_create(&threadId, ThrdExitThread, &expectRet);
    thrd_join(threadId, &threadRet);
    int ret = expectRet == threadRet;
    napi_value result = nullptr;
    napi_create_int32(env, !ret, &result);
    return result;
}

static int ThrdJoinThread(void *arg)
{
    int ret = *(static_cast<int *>(arg));
    thrd_exit(ret);
}

static napi_value Thrd_join_One(napi_env env, napi_callback_info info)
{
    int expectRet = PARAM_1;
    int threadRet = PARAM_0;
    thrd_t threadId;
    thrd_create(&threadId, ThrdJoinThread, &expectRet);
    int ret = thrd_join(threadId, &threadRet);
    ret |= expectRet != threadRet;
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Thrd_join_Two(napi_env env, napi_callback_info info)
{
    int expectRet = PARAM_1;
    thrd_t threadId;
    thrd_create(&threadId, ThrdJoinThread, &expectRet);
    int ret = thrd_join(threadId, nullptr);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

#define ms (1000.0)
#define us (1000000)
#define ns (1000000000L)
static double ustimer(timespec tss, timespec tse)
{
    double sd = difftime(tse.tv_sec, tss.tv_sec);
    long nsd = tse.tv_nsec - tss.tv_nsec;
    if (nsd < PARAM_0) {
        return us * (sd - PARAM_1) + (ns + nsd) / ms;
    } else {
        return us * (sd) + nsd / ms;
    }
}

static napi_value Thrd_sleep(napi_env env, napi_callback_info info)
{
    timespec ts = {0, 10 * us};
    timespec start, end, remain;
    timespec_get(&start, TIME_UTC);
    int ret = thrd_sleep(&ts, &remain);
    timespec_get(&end, TIME_UTC);
    double elapsed = ustimer(start, end);
    ret |= elapsed < PARAM_10 * ms;
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Thrd_yield(napi_env env, napi_callback_info info)
{
    const double elapsedMax = FPARAM_100;
    timespec start;
    timespec end;
    timespec_get(&start, TIME_UTC);
    do {
        thrd_yield();
        timespec_get(&end, TIME_UTC);
    } while (ustimer(start, end) < elapsedMax);
    double elapsed = ustimer(start, end);
    int ret = elapsed < elapsedMax;
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Tss_create(napi_env env, napi_callback_info info)
{
    tss_t key;
    int ret = tss_create(&key, nullptr);
    tss_delete(key);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Tss_delete(napi_env env, napi_callback_info info)
{
    tss_t key;
    int ret = tss_create(&key, nullptr);
    tss_delete(key);
    ret |= tss_create(&key, nullptr);
    tss_delete(key);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Tss_get(napi_env env, napi_callback_info info)
{
    tss_t key;
    int setValue = PARAM_1;
    tss_create(&key, nullptr);
    int ret = tss_set(key, static_cast<void *>(&setValue));
    int value = *static_cast<int *>(tss_get(key));
    tss_delete(key);

    ret |= value != setValue;
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Tss_set(napi_env env, napi_callback_info info)
{
    tss_t key;
    int setValue = PARAM_1;
    tss_create(&key, nullptr);
    int ret = tss_set(key, static_cast<void *>(&setValue));
    int value = *static_cast<int *>(tss_get(key));
    tss_delete(key);

    ret |= value != setValue;
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"callOnce", nullptr, CallOnce, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"cnd_broadcast", nullptr, Cnd_broadcast, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"cnd_destroy", nullptr, Cnd_destroy, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"cnd_init", nullptr, Cnd_init, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"cnd_signal_One", nullptr, Cnd_signal_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"cnd_signal_Two", nullptr, Cnd_signal_Two, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"mtxDestroy", nullptr, MtxDestroy, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"mtxInit_One", nullptr, MtxInit_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"mtxInit_Two", nullptr, MtxInit_Two, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"mtxInit_Three", nullptr, MtxInit_Three, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"mtxInit_Four", nullptr, MtxInit_Four, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"mtxLock_One", nullptr, MtxLock_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"mtxLock_Two", nullptr, MtxLock_Two, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"mtxLock_Three", nullptr, MtxLock_Three, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"mtxLock_Four", nullptr, MtxLock_Four, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"mtxTimedLock_One", nullptr, MtxTimedLock_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"mtxTimedLock_Two", nullptr, MtxTimedLock_Two, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"mtxTryLock_One", nullptr, MtxTryLock_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"mtxTryLock_Two", nullptr, MtxTryLock_Two, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"mtxUnlock_One", nullptr, MtxUnlock_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"mtxUnlock_Two", nullptr, MtxUnlock_Two, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"thrd_create", nullptr, Thrd_create, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"thrd_current", nullptr, Thrd_current, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"thrd_detach_One", nullptr, Thrd_detach_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"thrd_detach_Two", nullptr, Thrd_detach_Two, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"thrd_equal_One", nullptr, Thrd_equal_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"thrd_equal_Two", nullptr, Thrd_equal_Two, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"thrd_exit", nullptr, Thrd_exit, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"thrd_join_One", nullptr, Thrd_join_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"thrd_join_Two", nullptr, Thrd_join_Two, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"thrd_sleep", nullptr, Thrd_sleep, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"thrd_yield", nullptr, Thrd_yield, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"tss_create", nullptr, Tss_create, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"tss_delete", nullptr, Tss_delete, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"tss_get", nullptr, Tss_get, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"tss_set", nullptr, Tss_set, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "threads",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }
