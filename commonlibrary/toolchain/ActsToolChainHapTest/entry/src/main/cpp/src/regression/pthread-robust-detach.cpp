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

// commit 12e1e324683a1d381b7f15dd36c99b37dd44d940 2015-04-10
// robust mutex should work with detached threads too
#include <cerrno>
#include <cstring>
#include <ctime>
#include <pthread.h>
#include "test.h"

#define TX(r, f, x)                                                                                                   \
    (((r) = (f)) == (x) ||                                                                                            \
     (t_error(                                                                                                        \
          #f " failed: (pshared==%d) got %d \"%s\" want %d \"%s\"\n", g_pshared, (r), strerror(r), (x), strerror(x)), \
      0))
#define T(r, f) TX(r, f, 0)

static pthread_barrier_t g_barrier2;
static int g_pshared;
constexpr int NANOSECONDS_100M = 100 * 1000 * 1000;
constexpr int NANOSECONDS_1S = 1000 * 1000 * 1000;

static void* StartLock(void* arg)
{
    pthread_mutex_lock((pthread_mutex_t*)arg);
    pthread_barrier_wait(&g_barrier2);
    return nullptr;
}

static void F()
{
    pthread_t td;
    int r;
    pthread_mutexattr_t mtxA;
    pthread_mutex_t mtx;
    struct timespec ts;

    T(r, pthread_barrier_init(&g_barrier2, nullptr, 2));
    T(r, pthread_mutexattr_init(&mtxA));
    /* skip robust attr on this toolchain */
    if (g_pshared) {
        T(r, pthread_mutexattr_setpshared(&mtxA, PTHREAD_PROCESS_SHARED));
    }
    T(r, pthread_mutex_init(&mtx, &mtxA));
    T(r, pthread_create(&td, nullptr, StartLock, &mtx));
    T(r, pthread_detach(td));
    pthread_barrier_wait(&g_barrier2);
    pthread_barrier_destroy(&g_barrier2);

    // enough time to ensure that the detached thread is dead
    clock_gettime(CLOCK_REALTIME, &ts);
    ts.tv_nsec += NANOSECONDS_100M;
    if (ts.tv_nsec >= NANOSECONDS_1S) {
        ts.tv_sec++;
        ts.tv_nsec -= NANOSECONDS_1S;
    }

    TX(r, pthread_mutex_timedlock(&mtx, &ts), EOWNERDEAD);
}

static int PthreadRobustDetachTestImpl(void)
{
    // test non-pshared and pshared robust mutexes as well
    F();
    return 0;
}

int PthreadRobustDetachTest(void)
{
    return PthreadRobustDetachTestImpl();
}
