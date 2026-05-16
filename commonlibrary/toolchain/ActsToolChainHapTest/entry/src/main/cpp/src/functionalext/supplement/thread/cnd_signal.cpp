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

#include <cstdint>
#include <ctime>
#include <threads.h>
#include <unistd.h>
#include "functionalext.h"

namespace {
constexpr unsigned K_CND_SIGNAL_THREAD_DELAY_SEC = 2U;
constexpr time_t K_CND_SIGNAL_WAIT_TIMEOUT_SEC = 60;
} // namespace

static mtx_t g_mtx;
static cnd_t g_cndPut;
void CndTimedwaitfirst(void* arg)
{
    int res = -1;
    struct timespec ts;
    (void)clock_gettime(CLOCK_REALTIME, &ts);
    ts.tv_sec += K_CND_SIGNAL_WAIT_TIMEOUT_SEC;
    (void)mtx_lock(&g_mtx);
    res = cnd_timedwait(&g_cndPut, &g_mtx, &ts);
    (void)mtx_unlock(&g_mtx);
}

/**
 * @tc.name      : CndSignal0100
 * @tc.desc      : The parameter is valid, among any number of threads waiting for the specified condition
 *                 variable, wake up one of the threads.
 * @tc.level     : Level 0
 */
void CndSignal0100(void)
{
    thrd_t id1;
    int ret;
    int res = -1;
    (void)cnd_init(&g_cndPut);
    (void)mtx_init(&g_mtx, 0);
    ret = thrd_create(
        &id1, reinterpret_cast<thrd_start_t>(CndTimedwaitfirst), reinterpret_cast<void*>(static_cast<uintptr_t>(1)));
    EXPECT_EQ("CndSignal0100", ret, 0);

    sleep(K_CND_SIGNAL_THREAD_DELAY_SEC);
    (void)mtx_lock(&g_mtx);
    res = cnd_signal(&g_cndPut);
    EXPECT_EQ("CndSignal0100", res, thrd_success);
    (void)mtx_unlock(&g_mtx);
    (void)thrd_join(id1, nullptr);
    cnd_destroy(&g_cndPut);
    mtx_destroy(&g_mtx);
}

static int CndSignalTestWithArgs(int argc, char* argv[])
{
    CndSignal0100();
    return T_STATUS;
}

int CndSignalTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return CndSignalTestWithArgs(1, libcArgvStub);
}
