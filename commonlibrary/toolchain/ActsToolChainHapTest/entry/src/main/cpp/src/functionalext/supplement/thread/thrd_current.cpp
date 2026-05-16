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
#define THREAD_COUNT (2)

static thrd_t g_thr;
static int g_count = 0;
static pthread_mutex_t g_mutex = PTHREAD_MUTEX_INITIALIZER;

int TrylockWithTimeout(pthread_mutex_t *mutex)
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

        struct timespec req = { .tv_sec = 0, .tv_nsec = NSEC_TO_MS * 10 }; // 等待10毫秒
        nanosleep(&req, nullptr);
        
        sleepCount++;
        if (sleepCount >= LOCK_WAIT_MAX_TIME_COUNT) {
            return LOCK_TIMEOUT;
        }
    } while (true);
}

static int ThreadFuncA(void *arg)
{
    g_count++;
    thrd_t id = thrd_current();
    if (!(thrd_equal(id, g_thr))) {
        t_error("%s thrd_current failed", __func__);
    }

    thrd_exit(thrd_success);
}

static int ThreadFuncB(void *arg)
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
 * @tc.name      : thrd_current_0100
 * @tc.desc      : Returns the identifier of the calling thread
 * @tc.level     : Level 0
 */
void ThrdCurrent0100(void)
{
    int result;

    result = thrd_create(&g_thr, ThreadFuncA, nullptr);
    if (result != thrd_success) {
        t_error("%s thrd_create failed", __func__);
    }

    struct timespec sleepTime = {.tv_sec = 1};
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
 * @tc.name      : thrd_current_0200
 * @tc.desc      : Create two threads to execute the same func
 * @tc.level     : Level 1
 */
void ThrdCurrent0200(void)
{
    thrd_t thr1;
    thrd_t thr2;
    int result;

    result = thrd_create(&thr1, ThreadFuncB, nullptr);
    if (result != thrd_success) {
        t_error("%s thrd_create failed", __func__);
    }

    result = thrd_create(&thr2, ThreadFuncB, nullptr);
    if (result != thrd_success) {
        t_error("%s thrd_create failed", __func__);
    }

    struct timespec sleepTime = {.tv_sec = 1};
    result = thrd_sleep(&sleepTime, nullptr);
    if (result != 0) {
        t_error("%s thrd_sleep failed", __func__);
    }

    if (thrd_equal(thr1, thr2)) {
        t_error("%s equal", __func__);
    }

    if (thrd_equal(thr1, thrd_current())) {
        t_error("%s equal", __func__);
    }

    if (thrd_equal(thr2, thrd_current())) {
        t_error("%s equal", __func__);
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

static int ThrdCurrentTestImpl(int argc, char *argv[])
{
    ThrdCurrent0100();
    ThrdCurrent0200();
    return g_tStatus;
}

int ThrdCurrentTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return ThrdCurrentTestImpl(1, libcArgv);
}
