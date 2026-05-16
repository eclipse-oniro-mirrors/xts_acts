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

/* testing pthread mutex behaviour with various attributes */
#include <pthread.h>
#include <semaphore.h>
#include <cstdio>
#include <cerrno>
#include <cstring>
#include "test.h"

#define NSEC_100MS (100)
#define NSEC_1SEC (1000)
#define FAILURE_CODE (-1)

static inline void TestPthreadResultPi(int result, int *rPtr, const char *expr)
{
    *rPtr = result;
    if (*rPtr) {
        t_error("%s failed: %s\n", expr, strerror(*rPtr));
    }
}

static inline void TestErrnoConditionPi(bool condition, const char *expr)
{
    if (condition) {
        t_error("%s failed: %s\n", expr, strerror(errno));
    }
}

#define T(f) do { \
    int tmpResult; \
    TestPthreadResultPi((f), &tmpResult, #f); \
} while (0)
#define E(f) TestErrnoConditionPi((f), #f)

static void *RelockFunc(void *arg)
{
    void **a = (void **)arg;
    int r;
    pthread_mutex_t *m = (pthread_mutex_t *)a[0];
    sem_t *s = (sem_t *)a[1];
    int *ret = (int *)a[2];

    T(pthread_mutex_lock(m));
    E(sem_post(s));
    *ret = pthread_mutex_lock(m);
    E(sem_post(s));

    T(pthread_mutex_unlock(m));
    if (*ret == 0) {
        T(pthread_mutex_unlock(m));
    }
    return nullptr;
}

static int TestRelock(int mtype)
{
    struct timespec ts;
    pthread_t t;
    pthread_mutex_t m;
    pthread_mutexattr_t ma;
    sem_t s;
    int i;
    int r;
    void *p;
    void *a[] = {&m, &s, &i};

    T(pthread_mutexattr_init(&ma));
    T(pthread_mutexattr_settype(&ma, mtype));
    T(pthread_mutexattr_setprotocol(&ma, PTHREAD_PRIO_INHERIT));
    T(pthread_mutex_init((pthread_mutex_t *)a[0], &ma));
    T(pthread_mutexattr_destroy(&ma));
    E(sem_init((sem_t *)a[1], 0, 0));
    T(pthread_create(&t, nullptr, RelockFunc, a));
    E(sem_wait((sem_t *)a[1]));
    E(clock_gettime(CLOCK_REALTIME, &ts));
    ts.tv_nsec += NSEC_100MS;
    if (ts.tv_nsec >= NSEC_1SEC) {
        ts.tv_nsec -= NSEC_1SEC;
        ts.tv_sec += 1;
    }
    r = sem_timedwait((sem_t *)a[1], &ts);
    if (r == FAILURE_CODE) {
        if (errno != ETIMEDOUT) {
            t_error("sem_timedwait failed with unexpected error: %s\n", strerror(errno));
        }
        return FAILURE_CODE;
    }
    T(pthread_join(t, &p));
    T(pthread_mutex_destroy((pthread_mutex_t *)a[0]));
    E(sem_destroy((sem_t *)a[1]));
    return i;
}

static void *UnlockFunc(void *arg)
{
    void **a = (void **)arg;
    *(int *)a[1] = pthread_mutex_unlock((pthread_mutex_t *)a[0]);
    return nullptr;
}

static int TestUnlock(int mtype)
{
    pthread_t t;
    pthread_mutex_t m;
    pthread_mutexattr_t ma;
    int i;
    int r;
    void *p;
    void *a[] = {&m, &i};

    T(pthread_mutexattr_init(&ma));
    T(pthread_mutexattr_settype(&ma, mtype));
    T(pthread_mutexattr_setprotocol(&ma, PTHREAD_PRIO_INHERIT));
    T(pthread_mutex_init((pthread_mutex_t *)a[0], &ma));
    T(pthread_mutexattr_destroy(&ma));
    T(pthread_create(&t, nullptr, UnlockFunc, a));
    T(pthread_join(t, &p));
    T(pthread_mutex_destroy((pthread_mutex_t *)a[0]));
    return i;
}

static int TestUnlockOther(int mtype)
{
    pthread_t t;
    pthread_mutex_t m;
    pthread_mutexattr_t ma;
    int i;
    int r;
    void *p;
    void *a[] = {&m, &i};

    T(pthread_mutexattr_init(&ma));
    T(pthread_mutexattr_settype(&ma, mtype));
    T(pthread_mutexattr_setprotocol(&ma, PTHREAD_PRIO_INHERIT));
    T(pthread_mutex_init((pthread_mutex_t *)a[0], &ma));
    T(pthread_mutexattr_destroy(&ma));
    T(pthread_mutex_lock((pthread_mutex_t *)a[0]));
    T(pthread_create(&t, nullptr, UnlockFunc, a));
    T(pthread_join(t, &p));
    T(pthread_mutex_unlock((pthread_mutex_t *)a[0]));
    T(pthread_mutex_destroy((pthread_mutex_t *)a[0]));
    return i;
}

static void TestMutexattr()
{
    pthread_mutex_t m;
    pthread_mutexattr_t a;
    int r;
    int i;

    T(pthread_mutexattr_init(&a));
    T(pthread_mutexattr_gettype(&a, &i));
    if (i != PTHREAD_MUTEX_DEFAULT) {
        t_error("default mutex type is %d, wanted PTHREAD_MUTEX_DEFAULT (%d)\n", i, PTHREAD_MUTEX_DEFAULT);
    }
    T(pthread_mutexattr_settype(&a, PTHREAD_MUTEX_ERRORCHECK));
    T(pthread_mutexattr_gettype(&a, &i));
    if (i != PTHREAD_MUTEX_ERRORCHECK) {
        t_error("setting error check mutex type failed failed: got %d, wanted %d\n", i, PTHREAD_MUTEX_ERRORCHECK);
    }
    T(pthread_mutexattr_destroy(&a));
}

static int PthreadMutexPiTestImpl(void)
{
    int i;

    TestMutexattr();

    i = TestRelock(PTHREAD_MUTEX_NORMAL);
    if (i != -1) {
        t_error("PTHREAD_MUTEX_NORMAL relock did not deadlock, got %s\n", strerror(i));
    }
    i = TestRelock(PTHREAD_MUTEX_ERRORCHECK);
    if (i != EDEADLK) {
        t_error("PTHREAD_MUTEX_ERRORCHECK relock did not return EDEADLK, got %s\n", i == -1 ? "deadlock" : strerror(i));
    }
    i = TestRelock(PTHREAD_MUTEX_RECURSIVE);
    if (i != 0) {
        t_error("PTHREAD_MUTEX_RECURSIVE relock did not succed, got %s\n", i == -1 ? "deadlock" : strerror(i));
    }

    i = TestUnlock(PTHREAD_MUTEX_ERRORCHECK);
    if (i != EPERM) {
        t_error("PTHREAD_MUTEX_ERRORCHECK Unlock did not return EPERM, got %s\n", strerror(i));
    }
    i = TestUnlock(PTHREAD_MUTEX_RECURSIVE);
    if (i != EPERM) {
        t_error("PTHREAD_MUTEX_RECURSIVE Unlock did not return EPERM, got %s\n", strerror(i));
    }

    i = TestUnlockOther(PTHREAD_MUTEX_ERRORCHECK);
    if (i != EPERM) {
        t_error("PTHREAD_MUTEX_ERRORCHECK Unlock did not return EPERM, got %s\n", strerror(i));
    }
    i = TestUnlockOther(PTHREAD_MUTEX_RECURSIVE);
    if (i != EPERM) {
        t_error("PTHREAD_MUTEX_RECURSIVE Unlock did not return EPERM, got %s\n", strerror(i));
    }

    return g_tStatus;
}

int PthreadMutexPiTest(void)
{
    return PthreadMutexPiTestImpl();
}
