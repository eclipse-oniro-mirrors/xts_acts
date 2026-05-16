/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

// commit: 9d5251f72b627974bcf438501e07ad42c24d94be 2011-03-08
// disallow cpu time clocks in condattr
#include <cerrno>
#include <cstring>
#include <ctime>
#include <pthread.h>
#include "test.h"

namespace {
constexpr long K_NANOS_PER_MILLI = 1000L * 1000L;
constexpr long K_NANOS_PER_SECOND = 1000L * 1000L * 1000L;
constexpr int K_COND_TIMED_WAIT_MS = 10;
} // namespace

static void CheckPthreadResult(int& r, int exprResult, const char* expr)
{
    r = exprResult;
    if (r != 0) {
        t_error("%s failed: %s\n", expr, strerror(r));
    }
}

static int PthreadCondattrSetclockTestImpl(void)
{
    pthread_cond_t c;
    pthread_condattr_t a;
    pthread_mutex_t m;
    clockid_t clk;
    struct timespec ts;
    void* p;
    int r;

    CheckPthreadResult(r, pthread_condattr_init(&a), "pthread_condattr_init(&a)");
    r = pthread_condattr_setclock(&a, CLOCK_PROCESS_CPUTIME_ID);
    if (r != EINVAL) {
        t_error("pthread_condattr_setclock CLOCK_PROCESS_CPUTIME_ID should fail with EINVAL, got %s\n", strerror(r));
    }
    r = pthread_condattr_setclock(&a, CLOCK_THREAD_CPUTIME_ID);
    if (r != EINVAL) {
        t_error("pthread_condattr_setclock CLOCK_THREAD_CPUTIME_ID should fail with EINVAL, got %s\n", strerror(r));
    }
    CheckPthreadResult(r, pthread_condattr_getclock(&a, &clk), "pthread_condattr_getclock(&a, &clk)");
    if (clk != CLOCK_REALTIME) {
        t_error("condattr default clock is %d, wanted CLOCK_REALTIME (%d)\n",
                static_cast<int>(clk),
                static_cast<int>(CLOCK_REALTIME));
    }

    CheckPthreadResult(r, pthread_cond_init(&c, &a), "pthread_cond_init(&c, &a)");
    CheckPthreadResult(r, pthread_mutex_init(&m, nullptr), "pthread_mutex_init(&m, nullptr)");
    CheckPthreadResult(r, pthread_mutex_lock(&m), "pthread_mutex_lock(&m)");
    r = clock_gettime(CLOCK_REALTIME, &ts);
    if (r) {
        t_error("clock_gettime failed: %s\n", strerror(errno));
    }
    /* wait 10ms */
    ts.tv_nsec += K_COND_TIMED_WAIT_MS * K_NANOS_PER_MILLI;
    if (ts.tv_nsec >= K_NANOS_PER_SECOND) {
        ts.tv_nsec -= K_NANOS_PER_SECOND;
        ts.tv_sec += 1;
    }
    r = pthread_cond_timedwait(&c, &m, &ts);
    if (r != ETIMEDOUT) {
        t_error("pthread_cond_timedwait did not timeout, returned %s\n", strerror(r));
    }
    CheckPthreadResult(r, pthread_mutex_unlock(&m), "pthread_mutex_unlock(&m)");

    CheckPthreadResult(r, pthread_mutex_destroy(&m), "pthread_mutex_destroy(&m)");
    CheckPthreadResult(r, pthread_cond_destroy(&c), "pthread_cond_destroy(&c)");
    CheckPthreadResult(r, pthread_condattr_destroy(&a), "pthread_condattr_destroy(&a)");
    return T_STATUS;
}

int PthreadCondattrSetclockTest(void)
{
    return PthreadCondattrSetclockTestImpl();
}
