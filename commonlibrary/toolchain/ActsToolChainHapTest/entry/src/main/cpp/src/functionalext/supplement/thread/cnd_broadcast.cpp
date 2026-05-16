/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <threads.h>
#include "test.h"

static cnd_t g_cond;
static mtx_t g_mutex;
static unsigned int g_waitingThreads;

#define N 3

static int ChildWait(void *data)
{
    (void)mtx_lock(&g_mutex);
    ++g_waitingThreads;
    (void)cnd_wait(&g_cond, &g_mutex);
    (void)mtx_unlock(&g_mutex);

    thrd_exit(thrd_success);
}

/**
 * @tc.name      : CndBroadcast0100
 * @tc.desc      : Test cnd_broadcast to wake up all waiting threads
 * @tc.level     : Level 0
 */
void CndBroadcast0100(void)
{
    thrd_t ids[N];
    unsigned char i;

    if (cnd_init(&g_cond) != thrd_success) {
        t_error("%s cnd_init failed\n", __func__);
    }

    if (mtx_init(&g_mutex, mtx_plain) != thrd_success) {
        t_error("%s mtx_init failed\n", __func__);
    }

    for (i = 0; i < N; ++i) {
        if (thrd_create(&ids[i], ChildWait, nullptr) != thrd_success) {
            t_error("%s thrd_create failed\n", __func__);
        }
    }

    while (true) {
        (void)mtx_lock(&g_mutex);
        if (g_waitingThreads > N) {
            t_error("%s ", __func__);
        }
        bool doneWaiting = g_waitingThreads == N;
        (void)mtx_unlock(&g_mutex);
        if (doneWaiting) {
            break;
        }
        {
            struct timespec sleepTime = {.tv_nsec = 100 * 1000 * 1000};
            (void)thrd_sleep(&sleepTime, nullptr);
        }
    }

    (void)mtx_lock(&g_mutex);
    if (cnd_broadcast(&g_cond) != thrd_success) {
        t_error("%s cnd_broadcast failed\n", __func__);
    }
    (void)mtx_unlock(&g_mutex);

    for (i = 0; i < N; ++i) {
        if (thrd_join(ids[i], nullptr) != thrd_success) {
            t_error("%s thrd_join failed\n", __func__);
        }
    }

    mtx_destroy(&g_mutex);
    cnd_destroy(&g_cond);
}

static int CndBroadcastTestWithArgs(int argc, char *argv[])
{
    CndBroadcast0100();
    return g_tStatus;
}

int CndBroadcastTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return CndBroadcastTestWithArgs(1, libcArgv);
}
