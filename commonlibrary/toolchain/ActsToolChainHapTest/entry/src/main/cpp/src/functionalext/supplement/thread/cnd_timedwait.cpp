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

#include <pthread.h>
#include <threads.h>
#include "functionalext.h"
#include "time64_functions.h"

#define TIMEOUT_SEC 3600

static cnd_t g_cond;
static mtx_t g_mutex;

static int SignalParent(void *arg)
{
    if (mtx_lock(&g_mutex) != thrd_success) {
        t_error("%s mtx_lock failed\n", __func__);
    }
    if (cnd_signal(&g_cond) != thrd_success) {
        t_error("%s cnd_signal failed\n", __func__);
    }
    if (mtx_unlock(&g_mutex) != thrd_success) {
        t_error("%s mtx_unlock failed\n", __func__);
    }

    thrd_exit(thrd_success);
}

/**
 * @tc.name      : cnd_timedwait_0100
 * @tc.desc      : The parameter is valid and can block the calling thread and release the specified mutex.
 * @tc.level     : Level 0
 */
void CndTimedwait0100(void)
{
    thrd_t id;
    struct timespec wTime;

    if (cnd_init(&g_cond) != thrd_success) {
        t_error("%s cnd_init failed\n", __func__);
    }
    if (mtx_init(&g_mutex, mtx_plain) != thrd_success) {
        t_error("%s mtx_init failed\n", __func__);
    }
    if (mtx_lock(&g_mutex) != thrd_success) {
        t_error("%s mtx_lock failed\n", __func__);
    }
    if (clock_gettime(CLOCK_REALTIME, &wTime) != 0) {
        t_error("%s clock_gettime failed\n", __func__);
    }

    wTime.tv_sec += TIMEOUT_SEC;

    if (thrd_create(&id, SignalParent, nullptr) != thrd_success) {
        t_error("%s thrd_create failed\n", __func__);
    }

    if (cnd_timedwait(&g_cond, &g_mutex, &wTime) != thrd_success) {
        t_error("%s cnd_timedwait failed\n", __func__);
    }

    if (thrd_join(id, nullptr) != thrd_success) {
        t_error("%s thrd_join failed\n", __func__);
    }

    if (mtx_unlock(&g_mutex) != thrd_success) {
        t_error("%s mtx_unlock failed\n", __func__);
    }
    mtx_destroy(&g_mutex);
    cnd_destroy(&g_cond);
}

/**
 * @tc.name      : cnd_timedwait_time64_0100
 * @tc.desc      : The parameter is valid and can block the calling thread and release the specified mutex.
 * @tc.level     : Level 0
 */
void CndTimedwaitTime640100(void)
{
    thrd_t id;
    struct timespec wTime;

    if (cnd_init(&g_cond) != thrd_success) {
        t_error("%s cnd_init failed\n", __func__);
    }
    if (mtx_init(&g_mutex, mtx_plain) != thrd_success) {
        t_error("%s mtx_init failed\n", __func__);
    }
    if (mtx_lock(&g_mutex) != thrd_success) {
        t_error("%s mtx_lock failed\n", __func__);
    }
    if (clock_gettime(CLOCK_REALTIME, &wTime) != 0) {
        t_error("%s clock_gettime failed\n", __func__);
    }

    wTime.tv_sec += TIMEOUT_SEC;

    if (thrd_create(&id, SignalParent, nullptr) != thrd_success) {
        t_error("%s thrd_create failed\n", __func__);
    }

    if (CndTimedwaitTime64(&g_cond, &g_mutex, &wTime) != thrd_success) {
        t_error("%s cnd_timedwait failed\n", __func__);
    }

    if (thrd_join(id, nullptr) != thrd_success) {
        t_error("%s thrd_join failed\n", __func__);
    }

    if (mtx_unlock(&g_mutex) != thrd_success) {
        t_error("%s mtx_unlock failed\n", __func__);
    }
    mtx_destroy(&g_mutex);
    cnd_destroy(&g_cond);
}

static int CndTimedwaitTestWithArgs(int argc, char *argv[])
{
    CndTimedwait0100();
    CndTimedwaitTime640100();
    return g_tStatus;
}

int CndTimedwaitTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return CndTimedwaitTestWithArgs(1, libcArgv);
}
