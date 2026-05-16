/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *	http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <pthread.h>
#include <cstring>
#include "test.h"

#define SLEEP_NSEC 1000000

static inline bool TestPthreadCondResult(int &result, int value, const char *expr, const char *msg)
{
    result = value;
    if (result == 0) {
        return true;
    }
    t_error("%s failed: %s (%s)\n", expr, strerror(result), msg);
    return false;
}

#define TEST(r, f, m) TestPthreadCondResult(r, (f), #f, m)


static void *StartSignalFunc(void *arg)
{
    void **args = (void **)arg;
    pthread_mutex_lock((pthread_mutex_t *)args[1]);
    pthread_cond_signal((pthread_cond_t *)args[0]);
    pthread_mutex_unlock((pthread_mutex_t *)args[1]);
    return nullptr;
}

static void *StartWaitFunc(void *arg)
{
    void **args = (void **)arg;
    pthread_mutex_t *m = (pthread_mutex_t *)args[1];
    pthread_cond_t *c = (pthread_cond_t *)args[0];
    int *x = (int *)args[2];

    pthread_mutex_lock(m);
    while (*x) {
        pthread_cond_wait(c, m);
    }
    pthread_mutex_unlock(m);

    return nullptr;
}

static void TestBasicCondVar(void)
{
    pthread_t td;
    int r;
    void *res;
    pthread_mutex_t mtx;
    pthread_cond_t cond;

    TEST(r, pthread_mutex_init(&mtx, nullptr), "");
    TEST(r, pthread_cond_init(&cond, nullptr), "");
    TEST(r, pthread_mutex_lock(&mtx), "");
    TEST(r, pthread_create(&td, nullptr, StartSignalFunc, (void *[]){ &cond, &mtx }), "");
    TEST(r, pthread_cond_wait(&cond, &mtx), "");
    TEST(r, pthread_join(td, &res), "");
    TEST(r, pthread_mutex_unlock(&mtx), "");
    TEST(r, pthread_mutex_destroy(&mtx), "");
    TEST(r, pthread_cond_destroy(&cond), "");
}

static void TestMultipleWaiters(void)
{
    pthread_t td1;
    pthread_t td2;
    pthread_t td3;
    int r;
    pthread_mutex_t mtx;
    pthread_cond_t cond;
    int foo[1];

    TEST(r, pthread_mutex_init(&mtx, nullptr), "");
    TEST(r, pthread_cond_init(&cond, nullptr), "");
    TEST(r, pthread_mutex_lock(&mtx), "");
    foo[0] = 1;
    TEST(r, pthread_create(&td1, nullptr, StartWaitFunc, (void *[]){ &cond, &mtx, foo }), "");
    TEST(r, pthread_create(&td2, nullptr, StartWaitFunc, (void *[]){ &cond, &mtx, foo }), "");
    TEST(r, pthread_create(&td3, nullptr, StartWaitFunc, (void *[]){ &cond, &mtx, foo }), "");
    TEST(r, pthread_mutex_unlock(&mtx), "");
    struct timespec ts1 = {0};
    ts1.tv_nsec = SLEEP_NSEC;
    nanosleep(&ts1, nullptr);
    foo[0] = 0;
    TEST(r, pthread_mutex_lock(&mtx), "");
    TEST(r, pthread_cond_signal(&cond), "");
    TEST(r, pthread_mutex_unlock(&mtx), "");
    TEST(r, pthread_mutex_lock(&mtx), "");
    TEST(r, pthread_cond_signal(&cond), "");
    TEST(r, pthread_mutex_unlock(&mtx), "");
    TEST(r, pthread_mutex_lock(&mtx), "");
    TEST(r, pthread_cond_signal(&cond), "");
    TEST(r, pthread_mutex_unlock(&mtx), "");
    TEST(r, pthread_join(td1, nullptr), "");
    TEST(r, pthread_join(td2, nullptr), "");
    TEST(r, pthread_join(td3, nullptr), "");
    TEST(r, pthread_mutex_destroy(&mtx), "");
    TEST(r, pthread_cond_destroy(&cond), "");
}

static void TestBroadcastSignal(void)
{
    pthread_t td1;
    pthread_t td2;
    pthread_t td3;
    int r;
    pthread_mutex_t mtx;
    pthread_cond_t cond;
    int foo[1];

    TEST(r, pthread_mutex_init(&mtx, nullptr), "");
    TEST(r, pthread_cond_init(&cond, nullptr), "");
    TEST(r, pthread_mutex_lock(&mtx), "");
    foo[0] = 1;
    TEST(r, pthread_create(&td1, nullptr, StartWaitFunc, (void *[]){ &cond, &mtx, foo }), "");
    TEST(r, pthread_create(&td2, nullptr, StartWaitFunc, (void *[]){ &cond, &mtx, foo }), "");
    TEST(r, pthread_create(&td3, nullptr, StartWaitFunc, (void *[]){ &cond, &mtx, foo }), "");
    TEST(r, pthread_mutex_unlock(&mtx), "");
    struct timespec ts2 = {0};
    ts2.tv_nsec = SLEEP_NSEC;
    nanosleep(&ts2, nullptr);
    TEST(r, pthread_mutex_lock(&mtx), "");
    foo[0] = 0;
    TEST(r, pthread_mutex_unlock(&mtx), "");
    TEST(r, pthread_cond_broadcast(&cond), "");
    TEST(r, pthread_join(td1, nullptr), "");
    TEST(r, pthread_join(td2, nullptr), "");
    TEST(r, pthread_join(td3, nullptr), "");
    TEST(r, pthread_mutex_destroy(&mtx), "");
    TEST(r, pthread_cond_destroy(&cond), "");
}

static int PthreadCondTestImpl(void)
{
    TestBasicCondVar();
    TestMultipleWaiters();
    TestBroadcastSignal();
    return g_tStatus;
}

int PthreadCondTest(void)
{
    return PthreadCondTestImpl();
}
