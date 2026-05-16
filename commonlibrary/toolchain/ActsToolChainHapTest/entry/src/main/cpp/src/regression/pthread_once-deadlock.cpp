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

// commit: 7e6be42a77989c01155bdc7333ea58206e1563d4 2011-03-08
// pthread_once should not deadlock
#include <cerrno>
#include <cstring>
#include <pthread.h>
#include <semaphore.h>
#include "test.h"

#define T(f)                                                 \
    do {                                                     \
        int macroRet = (f);                                  \
        if (macroRet != 0) {                                 \
            t_error(#f " failed: %s\n", strerror(macroRet)); \
        }                                                    \
    } while (0)
#define E(f) \
    if (f)   \
    t_error(#f " failed: %s\n", strerror(errno))

static int g_count;
constexpr long ONE_HUNDRED_MILLION_NS = 100 * 1000 * 1000;
constexpr long ONE_BILLION_NS = 1000 * 1000 * 1000;

static void Init(void)
{
    g_count++;
}

static void* Start(void* arg)
{
    void** a = (void**)arg;
    E(sem_post((sem_t*)a[1]));
    T(pthread_once((pthread_once_t*)a[0], Init));
    E(sem_post((sem_t*)a[1]));
    return nullptr;
}

static int Deadlocked(sem_t* s)
{
    struct timespec ts;

    E(sem_wait(s));
    E(clock_gettime(CLOCK_REALTIME, &ts));
    ts.tv_nsec += ONE_HUNDRED_MILLION_NS;
    if (ts.tv_nsec >= ONE_BILLION_NS) {
        ts.tv_nsec -= ONE_BILLION_NS;
        ts.tv_sec += 1;
    }
    errno = 0;
    E(sem_timedwait(s, &ts));
    if (errno != ETIMEDOUT) {
        return 0;
    }
    t_error("pthread_once deadlocked\n");
    return 1;
}

static int PthreadOnceDeadlockTestImpl(void)
{
    pthread_t t1;
    pthread_t t2;
    pthread_t t3;
    pthread_once_t once = PTHREAD_ONCE_INIT;
    sem_t s1;
    sem_t s2;
    sem_t s3;
    void* a1[] = { &once, &s1 };
    void* a2[] = { &once, &s2 };
    void* a3[] = { &once, &s3 };
    void* p;

    E(sem_init(&s1, 0, 0));
    E(sem_init(&s2, 0, 0));
    E(sem_init(&s3, 0, 0));
    T(pthread_create(&t1, nullptr, Start, a1));
    T(pthread_create(&t2, nullptr, Start, a2));
    T(pthread_create(&t3, nullptr, Start, a3));
    if (!Deadlocked(&s1)) {
        T(pthread_join(t1, &p));
    }
    if (!Deadlocked(&s2)) {
        T(pthread_join(t2, &p));
    }
    if (!Deadlocked(&s3)) {
        T(pthread_join(t3, &p));
    }
    if (g_count != 1) {
        t_error("pthread_once ran init %d times instead of once\n", g_count);
    }
    E(sem_destroy(&s1));
    E(sem_destroy(&s2));
    E(sem_destroy(&s3));
    return T_STATUS;
}

int PthreadOnceDeadlockTest(void)
{
    return PthreadOnceDeadlockTestImpl();
}
