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
#include <csignal>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <ifaddrs.h>
#include <js_native_api_types.h>
#include <threads.h>
#include <unistd.h>

#define PARAM_0 0
#define PARAM_1 1
#define PARAM_2 2
#define PARAM_UNNORMAL (-1)
#define ERRON_0 0
#define SUCCESS 1
#define FAIL (-1)
#define TSS_SET_VALUE (void *)0xFF
#define hs (100.0)
#define ms (1000.0)
#define us (1000000)
#define ns (1000000000L)

static tss_t key;
static int g_count = PARAM_0;
volatile int t_status = PARAM_0;
static thrd_t thr;

void exception_handler(int sig) { exit(t_status); }

int threadfun_create(void *arg)
{
    signal(SIGSEGV, exception_handler);
    g_count++;
    thrd_exit(thrd_success);
}
static napi_value Thrd_create(napi_env env, napi_callback_info info)
{
    thrd_t id;
    int result;
    result = thrd_create(&id, threadfun_create, nullptr);
    struct timespec;
    thrd_join(id, nullptr);
    g_count = PARAM_0;
    napi_value results = nullptr;
    napi_create_int32(env, result, &results);
    return results;
}
int threadfunc_current(void *arg)
{
    g_count++;
    thrd_current();
    thrd_exit(thrd_success);
}

static napi_value Thrd_current(napi_env env, napi_callback_info info)
{
    int result;
    result = thrd_create(&thr, threadfunc_current, nullptr);
    thrd_join(thr, nullptr);
    g_count = PARAM_0;
    napi_value napi_value = nullptr;
    napi_create_int32(env, result, &napi_value);
    return napi_value;
}

int threadfunc_detach(void *arg)
{
    g_count++;
    thrd_detach(thrd_current());
    thrd_exit(thrd_success);
}
static napi_value Thrd_detach(napi_env env, napi_callback_info info)
{
    g_count = PARAM_0;
    thrd_t id;
    int result;
    result = thrd_create(&id, threadfunc_detach, nullptr);
    napi_value napi_value = nullptr;
    napi_create_int32(env, result, &napi_value);
    return napi_value;
}

int threadfunc_equal(void *arg)
{
    g_count++;
    thrd_t id = thrd_current();
    if (!(thrd_equal(id, thr))) {
    }
    thrd_exit(thrd_success);
}

static napi_value Thrd_equal(napi_env env, napi_callback_info info)
{
    g_count = PARAM_0;
    int result;
    thrd_create(&thr, threadfunc_equal, nullptr);
    result = thrd_join(thr, nullptr);
    g_count = PARAM_0;
    napi_value napi_value = nullptr;
    napi_create_int32(env, result, &napi_value);
    return napi_value;
}
int threadfun_exit(void *arg)
{
    signal(SIGSEGV, exception_handler);
    g_count++;
    thrd_exit(thrd_success);
}
static napi_value Thrd_exit(napi_env env, napi_callback_info info)
{
    thrd_t id;
    int result;
    result = thrd_create(&id, threadfun_exit, nullptr);
    struct timespec;
    thrd_join(id, nullptr);
    g_count = PARAM_0;
    napi_value results = nullptr;
    napi_create_int32(env, result, &results);
    return results;
}
int threadfun_join(void *arg)
{
    g_count++;
    return PARAM_0;
}
static napi_value Thrd_join(napi_env env, napi_callback_info info)
{
    thrd_t id;
    int result;
    thrd_create(&id, threadfun_join, nullptr);
    result = thrd_join(id, nullptr);
    g_count = PARAM_0;
    napi_value napi_value = nullptr;
    napi_create_int32(env, result, &napi_value);
    return napi_value;
}
int threadfun_sleep(void *arg)
{
    g_count++;
    struct timespec const *tl = (struct timespec const *)arg;
    if (thrd_sleep(tl, nullptr) != PARAM_0) {
    }
    thrd_exit(thrd_success);
}
static napi_value Thrd_sleep(napi_env env, napi_callback_info info)
{
    int result;
    thrd_t id;
    struct timespec ts = {.tv_sec = PARAM_1};
    result = thrd_create(&id, threadfun_sleep, (void *)(&ts));
    thrd_join(id, nullptr);
    g_count = PARAM_0;
    napi_value napi_value = nullptr;
    napi_create_int32(env, result, &napi_value);
    return napi_value;
}

double ustimer(struct timespec tss, struct timespec tse)
{
    double sd = difftime(tse.tv_sec, tss.tv_sec);
    long nsd = tse.tv_nsec - tss.tv_nsec;
    if (nsd < PARAM_0) {
        return us * (sd - PARAM_1) + (ns + nsd) / ms;
    } else {
        return us * (sd) + nsd / ms;
    }
}

void Yieldfunc(void)
{
    struct timespec tss, tse;
    timespec_get(&tss, TIME_UTC);
    do {
        thrd_yield();
        timespec_get(&tse, TIME_UTC);
    } while (ustimer(tss, tse) < hs);
}

static napi_value Thrd_yield(napi_env env, napi_callback_info info)
{
    g_count = PARAM_0;
    int result = PARAM_0;
    struct timespec tss, tse;
    timespec_get(&tss, TIME_UTC);
    Yieldfunc();
    timespec_get(&tse, TIME_UTC);
    ustimer(tss, tse);
    napi_value napi_value = nullptr;
    napi_create_int32(env, result, &napi_value);
    return napi_value;
}

static napi_value Tss_create(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int isSuccessCase;
    napi_get_value_int32(env, args[0], &isSuccessCase);

    int toJsResult = FAIL;
    int ret;

    if (isSuccessCase == PARAM_1) {
        ret = tss_create(&key, nullptr);
        if (ret == thrd_success) {
            toJsResult = SUCCESS;
        }
    }
    tss_delete(key);

    napi_value result = nullptr;
    napi_create_int32(env, toJsResult, &result);
    return result;
}

static napi_value Tss_set(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int isSuccessCase;
    napi_get_value_int32(env, args[0], &isSuccessCase);

    int toJsResult = PARAM_0;
    int ret;

    if (isSuccessCase == PARAM_1) {
        ret = tss_create(&key, nullptr);
        if (ret == thrd_success) {
            ret = tss_set(key, TSS_SET_VALUE);
            if (ret == thrd_success) {
                toJsResult = SUCCESS;
            }
        }
    }
    tss_delete(key);

    napi_value result = nullptr;
    napi_create_int32(env, toJsResult, &result);
    return result;
}

static napi_value Tss_get(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int isSuccessCase;
    napi_get_value_int32(env, args[0], &isSuccessCase);

    int toJsResult = FAIL;
    int ret;

    if (isSuccessCase == PARAM_1) {
        tss_create(&key, nullptr);
        ret = tss_set(key, TSS_SET_VALUE);
        if (ret == thrd_success) {
            void *value = tss_get(key);
            if (value != PARAM_0 && value == TSS_SET_VALUE) {
                toJsResult = SUCCESS;
            }
        }
    }
    tss_delete(key);

    napi_value result = nullptr;
    napi_create_int32(env, toJsResult, &result);
    return result;
}

static napi_value Tss_delete(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int isSuccessCase;
    napi_get_value_int32(env, args[0], &isSuccessCase);

    int toJsResult = FAIL;

    if (isSuccessCase == PARAM_1) {
        tss_create(&key, nullptr);
        tss_set(key, TSS_SET_VALUE);
        void *value = tss_get(key);
        if (value != PARAM_0 && value == TSS_SET_VALUE) {
            tss_delete(key);
            value = tss_get(key);
            if (value == PARAM_0) {
                toJsResult = SUCCESS;
            }
        }
    }

    napi_value result = nullptr;
    napi_create_int32(env, toJsResult, &result);
    return result;
}

static napi_value Cnd_wait(napi_env env, napi_callback_info info)
{
    mtx_t mutex;
    cnd_t cond;
    cnd_init(&cond);
    mtx_lock(&mutex);
    int backParam = cnd_wait(&cond, &mutex);
    mtx_unlock(&mutex);
    cnd_destroy(&cond);
    mtx_destroy(&mutex);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}
int DoPlainTests(int (*fn1)(void *arg), void *arg1, int (*fn2)(void *arg), void *arg2)
{
    int ret = PARAM_0;
    int pid = PARAM_0;
    pid = fork();
    if (pid == FAIL) {
        return FAIL;
    }
    if (pid == PARAM_0) {
        _exit(PARAM_0);
    }
    if (fn2) {
        ret = fn2(arg2);
    }
    return ret;
}
int Cndtimewaittest(void *testarg)
{
    const struct timespec time_point = {0};
    mtx_t mutex;
    cnd_t cond;
    cnd_init(&cond);
    mtx_lock(&mutex);
    int backParam = cnd_timedwait(&cond, &mutex, &time_point);
    mtx_unlock(&mutex);
    cnd_destroy(&cond);
    mtx_destroy(&mutex);
    return backParam;
}
static napi_value Cnd_timedWait(napi_env env, napi_callback_info info)
{
    void *test = nullptr;
    DoPlainTests(Cndtimewaittest, test, nullptr, nullptr);

    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value Cnd_broadcast(napi_env env, napi_callback_info info)
{
    cnd_t cond;
    cnd_init(&cond);
    int backParam = cnd_broadcast(&cond);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value Cnd_destroy(napi_env env, napi_callback_info info)
{
    cnd_t cond;
    int backParam = cnd_init(&cond);
    cnd_destroy(&cond);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value Cnd_signal(napi_env env, napi_callback_info info)
{
    cnd_t cond;
    cnd_init(&cond);
    int backParam = cnd_signal(&cond);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value Cnd_init(napi_env env, napi_callback_info info)
{
    cnd_t cond;
    int backParam = cnd_init(&cond);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

void DoOnce(void)
{
    static char list[100];
    static char buf[12] = "called once";
    FILE *fp = fopen("/data/storage/el2/base/files/Fzl.txt", "a+");
    fwrite(buf, sizeof(char), strlen(buf), fp);
    fclose(fp);
    FILE *fpSecond = fopen("/data/storage/el2/base/files/Fzl.txt", "r");
    fread(list, sizeof(list), PARAM_1, fpSecond);
    fclose(fpSecond);
}
static once_flag flag = ONCE_FLAG_INIT;

void Func(void *data) { call_once(&flag, DoOnce); }

static napi_value CallOnce(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int returnValue = FAIL;
    thrd_t firstParam, secondParam, thirdParam, fourthParam;
    thrd_create(&firstParam, (thrd_start_t)Func, nullptr);
    thrd_create(&secondParam, (thrd_start_t)Func, nullptr);
    thrd_create(&thirdParam, (thrd_start_t)Func, nullptr);
    thrd_create(&fourthParam, (thrd_start_t)Func, nullptr);
    thrd_join(firstParam, nullptr);
    thrd_join(secondParam, nullptr);
    thrd_join(thirdParam, nullptr);
    thrd_join(fourthParam, nullptr);
    remove("/data/storage/el2/base/files/Fzl.txt");
    if (errno == PARAM_0) {
        returnValue = SUCCESS;
    }
    napi_create_int32(env, returnValue, &result);
    return result;
}
static napi_value MtxDestroy(napi_env env, napi_callback_info info)
{
    errno = ERRON_0;
    mtx_t mtx;
    mtx_init(&mtx, mtx_plain);
    mtx_destroy(&mtx);
    napi_value result;
    if (errno != PARAM_0) {
        napi_create_int32(env, PARAM_UNNORMAL, &result);
    } else {
        napi_create_int32(env, PARAM_0, &result);
    }
    return result;
}

static napi_value MtxInit(napi_env env, napi_callback_info info)
{
    errno = ERRON_0;
    mtx_t mtx;
    int ret = mtx_init(&mtx, mtx_plain);
    mtx_destroy(&mtx);
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value MtxLock(napi_env env, napi_callback_info info)
{
    errno = ERRON_0;
    mtx_t mtx;
    mtx_init(&mtx, mtx_plain);
    int ret = mtx_lock(&mtx);
    mtx_trylock(&mtx);
    mtx_unlock(&mtx);
    mtx_destroy(&mtx);
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value MtxTimedLock(napi_env env, napi_callback_info info)
{
    errno = ERRON_0;
    mtx_t mtx;
    struct timespec restrict;
    memset(&restrict, PARAM_0, sizeof(restrict));
    mtx_init(&mtx, mtx_plain);
    int ret = mtx_timedlock(&mtx, &restrict);
    mtx_trylock(&mtx);
    mtx_unlock(&mtx);
    mtx_destroy(&mtx);
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value MtxTryLock(napi_env env, napi_callback_info info)
{
    errno = ERRON_0;
    mtx_t mtx;
    struct timespec restrict;
    memset(&restrict, PARAM_0, sizeof(restrict));
    mtx_init(&mtx, mtx_plain);
    mtx_timedlock(&mtx, &restrict);
    int ret = mtx_trylock(&mtx);
    mtx_unlock(&mtx);
    mtx_destroy(&mtx);
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value MtxUnLock(napi_env env, napi_callback_info info)
{
    errno = ERRON_0;
    mtx_t mtx;
    struct timespec restrict;
    memset(&restrict, PARAM_0, sizeof(restrict));
    mtx_init(&mtx, mtx_plain);
    mtx_timedlock(&mtx, &restrict);
    mtx_trylock(&mtx);
    int ret = mtx_unlock(&mtx);
    mtx_destroy(&mtx);
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"thrd_create", nullptr, Thrd_create, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"thrd_current", nullptr, Thrd_current, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"thrd_detach", nullptr, Thrd_detach, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"thrd_equal", nullptr, Thrd_equal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"thrd_exit", nullptr, Thrd_exit, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"thrd_join", nullptr, Thrd_join, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"thrd_sleep", nullptr, Thrd_sleep, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"thrd_yield", nullptr, Thrd_yield, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"tss_create", nullptr, Tss_create, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"tss_set", nullptr, Tss_set, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"tss_get", nullptr, Tss_get, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"tss_delete", nullptr, Tss_delete, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"cnd_init", nullptr, Cnd_init, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"cnd_signal", nullptr, Cnd_signal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"cnd_destroy", nullptr, Cnd_destroy, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"cnd_wait", nullptr, Cnd_wait, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"cnd_timedwait", nullptr, Cnd_timedWait, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"cnd_broadcast", nullptr, Cnd_broadcast, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"callOnce", nullptr, CallOnce, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"mtxDestroy", nullptr, MtxDestroy, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"mtxInit", nullptr, MtxInit, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"mtxLock", nullptr, MtxLock, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"mtxTimedLock", nullptr, MtxTimedLock, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"mtxTryLock", nullptr, MtxTryLock, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"mtxUnLock", nullptr, MtxUnLock, nullptr, nullptr, nullptr, napi_default, nullptr},
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
