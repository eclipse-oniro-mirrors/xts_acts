/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2020-2020. All rights reserved.
 */
/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

#include <csignal>
#include <cstdlib>
#include <threads.h>
#include <pthread.h>
#include <cstdio>
#include <ctime>
#include <cerrno>
#include "test.h"

#define LOCK_SUCCESS (0)
#define LOCK_TIMEOUT (-1)
#define LOCK_WAIT_MAX_TIME_COUNT (50)
#define NSEC_TO_MS (1000000)
#define TRYLOCK_FAIL (-2)
#define SLEEP_MS_MULTIPLIER (10)
#define THREAD_COUNT (2)

static thrd_t g_thr;
static int g_count = 0;
static pthread_mutex_t g_mutex = PTHREAD_MUTEX_INITIALIZER;

static int TrylockWithTimeout(pthread_mutex_t *mutex)
{
    int rc;

    int sleepCount = 0;

    do {
        rc = pthread_mutex_trylock(mutex);
        if (rc == 0) {
            return LOCK_SUCCESS;
        } else if (rc != EBUSY) {
            perror("pthread_mutex_trylock");
            return TRYLOCK_FAIL;
        }

        struct timespec req = { .tv_sec = 0, .tv_nsec = NSEC_TO_MS * SLEEP_MS_MULTIPLIER }; // 等待10毫秒
        nanosleep(&req, nullptr);
        
        sleepCount++;
        if (sleepCount >= LOCK_WAIT_MAX_TIME_COUNT) {
            return LOCK_TIMEOUT;
        }
    } while (true);
}

static int ThreadfuncA(void *arg)
{
    pthread_mutex_t *mtx = (pthread_mutex_t *)arg;
    pthread_mutex_lock(mtx);
    g_count++;
    thrd_t id = thrd_current();
    if (!(thrd_equal(id, g_thr))) {
        t_error("%s thrd_current failed", __func__);
    }
    pthread_mutex_unlock(mtx);
    thrd_exit(thrd_success);
}

static int ThreadfuncB(void *arg)
{
    int result = TrylockWithTimeout(&g_mutex);
    if (result == LOCK_SUCCESS) {
        g_count++;
        pthread_mutex_unlock(&g_mutex);
    } else if (result == LOCK_TIMEOUT) {
        t_error("Lock acquisition timed out.\n");
    } else {
        t_error("Error pthread_mutex_trylock.\n");
    }

    thrd_exit(thrd_success);
}

/**
 * @tc.name      : ThrdEqual0100
 * @tc.desc      : Test that two threads have the same ID
 * @tc.level     : Level 0
 */
void ThrdEqual0100(void)
{
    int result;
    pthread_mutex_t mtx = PTHREAD_MUTEX_INITIALIZER;
    pthread_mutex_lock(&mtx);
    result = thrd_create(&g_thr, ThreadfuncA, static_cast<void *>(&mtx));
    pthread_mutex_unlock(&mtx);
    pthread_mutex_destroy(&mtx);
    if (result != thrd_success) {
        t_error("%s thrd_create failed", __func__);
    }

    struct timespec sleepTime = { .tv_sec = 1, .tv_nsec = 0 };
    result = thrd_sleep(&sleepTime, nullptr);
    if (result != 0) {
        t_error("%s thrd_sleep failed", __func__);
    }

    result = thrd_join(g_thr, nullptr);
    if (result != thrd_success) {
        t_error("%s thrd_join failed", __func__);
    }

    if (g_count != 1) {
        t_error("%s failed, g_count is %d", __func__, g_count);
    }
    g_count = 0;
}

/**
 * @tc.name      : ThrdEqual0200
 * @tc.desc      : Test that two threads have different ID
 * @tc.level     : Level 1
 */
void ThrdEqual0200(void)
{
    thrd_t thr1;
    thrd_t thr2;
    int result;

    result = thrd_create(&thr1, ThreadfuncB, nullptr);
    if (result != thrd_success) {
        t_error("%s thrd_create failed", __func__);
    }

    result = thrd_create(&thr2, ThreadfuncB, nullptr);
    if (result != thrd_success) {
        t_error("%s thrd_create failed", __func__);
    }

    struct timespec sleepTime = { .tv_sec = 1, .tv_nsec = 0 };
    result = thrd_sleep(&sleepTime, nullptr);
    if (result != 0) {
        t_error("%s thrd_sleep failed", __func__);
    }

    if (thrd_equal(thr1, thr2)) {
        t_error("%s failed, thr1 and thr2 equal", __func__);
    }

    if (thrd_equal(thr1, thrd_current())) {
        t_error("%s failed, thr1 and current thread equal", __func__);
    }

    if (thrd_equal(thr2, thrd_current())) {
        t_error("%s failed, thr2 and current thread equal", __func__);
    }

    result = thrd_join(thr1, nullptr);
    if (result != thrd_success) {
        t_error("%s thrd_join failed", __func__);
    }

    result = thrd_join(thr2, nullptr);
    if (result != thrd_success) {
        t_error("%s thrd_join failed", __func__);
    }

    if (g_count != THREAD_COUNT) {
        t_error("%s failed, g_count is %d", __func__, g_count);
    }
    g_count = 0;
}

static int ThrdEqualTestImpl(int argc, char *argv[])
{
    ThrdEqual0100();
    ThrdEqual0200();
    return g_tStatus;
}

int ThrdEqualTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return ThrdEqualTestImpl(1, libcArgv);
}
