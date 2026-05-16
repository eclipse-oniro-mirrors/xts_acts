/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
#include <semaphore.h>
#include <cstdio>
#include <cerrno>
#include <cstring>
#include "test.h"
#include <csignal>
#include <sys/wait.h>
#include <sigchain.h>
#include "fortify_test.h"
#include "functionalext.h"

#define T(f) if ((r=(f))) t_error(#f " failed: %s\n", strerror(r))
#define E(f) if (f) t_error(#f " failed: %s\n", strerror(errno))

static void *PthreadMutexLockAfterDestroyed(void *arg)
{
    void **a = (void**)arg;

    *(int*)a[1] = pthread_mutex_lock((pthread_mutex_t*)a[0]);
    return nullptr;
}

static int TestPthreadMutexLockAfterDestroyed(int mtype)
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
    T(pthread_mutex_init((pthread_mutex_t*)a[0], &ma));
    T(pthread_mutexattr_destroy(&ma));
    T(pthread_create(&t, nullptr, PthreadMutexLockAfterDestroyed, a));
    T(pthread_mutex_destroy((pthread_mutex_t*)a[0]));
    T(pthread_join(t, &p));
    return i;
}

static void *PthreadMutexUnlockAfterDestroyed(void *arg)
{
    void **a = (void**)arg;

    *(int*)a[1] = pthread_mutex_unlock((pthread_mutex_t*)a[0]);
    return nullptr;
}

static int TestPthreadMutexUnlockAfterDestroyed(int mtype)
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
    T(pthread_mutex_init((pthread_mutex_t*)a[0], &ma));
    T(pthread_mutexattr_destroy(&ma));
    T(pthread_create(&t, nullptr, PthreadMutexUnlockAfterDestroyed, a));
    T(pthread_mutex_destroy((pthread_mutex_t*)a[0]));
    T(pthread_join(t, &p));
    return i;
}

static void *PthreadMutexTimedlockAfterDestroyed(void *arg)
{
    void **a = (void**)arg;
    struct timespec ts;
    clock_gettime(CLOCK_REALTIME, &ts);
    ts.tv_sec += 1;
    *(int*)a[1] = pthread_mutex_timedlock((pthread_mutex_t*)a[0], &ts);
    return nullptr;
}

static int TestPthreadMutexTimedlockAfterDestroyed(int mtype)
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
    T(pthread_mutex_init((pthread_mutex_t*)a[0], &ma));
    T(pthread_mutexattr_destroy(&ma));
    T(pthread_create(&t, nullptr, PthreadMutexTimedlockAfterDestroyed, a));
    T(pthread_mutex_destroy((pthread_mutex_t*)a[0]));
    T(pthread_join(t, &p));
    return i;
}

static void *PthreadMutexTrylockAfterDestroyed(void *arg)
{
    void **a = (void**)arg;

    *(int*)a[1] = pthread_mutex_trylock((pthread_mutex_t*)a[0]);
    return nullptr;
}

static int TestPthreadMutexTrylockAfterDestroyed(int mtype)
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
    T(pthread_mutex_init((pthread_mutex_t*)a[0], &ma));
    T(pthread_mutexattr_destroy(&ma));
    T(pthread_create(&t, nullptr, PthreadMutexTrylockAfterDestroyed, a));
    T(pthread_mutex_destroy((pthread_mutex_t*)a[0]));
    T(pthread_join(t, &p));
    return i;
}

static int PthreadFortifyTestTestImpl(int argc, char *argv[])
{
    int i;

    i = TestPthreadMutexLockAfterDestroyed(PTHREAD_MUTEX_NORMAL);
    if (i != 0) {
        t_error("PTHREAD_MUTEX_NORMAL lock failed after destroyed, got %s\n", strerror(i));
    }
    i = TestPthreadMutexLockAfterDestroyed(PTHREAD_MUTEX_ERRORCHECK);
    if (i != 0) {
        t_error("PTHREAD_MUTEX_ERRORCHECK lock failed after destroyed, got %s\n", strerror(i));
    }
    i = TestPthreadMutexLockAfterDestroyed(PTHREAD_MUTEX_RECURSIVE);
    if (i != 0) {
        t_error("PTHREAD_MUTEX_RECURSIVE lock failed after destroyed, got %s\n", strerror(i));
    }
    i = TestPthreadMutexUnlockAfterDestroyed(PTHREAD_MUTEX_ERRORCHECK);
    if (i == 0) {
        t_error("PTHREAD_MUTEX_ERRORCHECK unlock failed after destroyed, got %s\n", strerror(i));
    }
    i = TestPthreadMutexUnlockAfterDestroyed(PTHREAD_MUTEX_RECURSIVE);
    if (i == 0) {
        t_error("PTHREAD_MUTEX_RECURSIVE unlock failed after destroyed, got %s\n", strerror(i));
    }
    i = TestPthreadMutexTimedlockAfterDestroyed(PTHREAD_MUTEX_NORMAL);
    if (i != 0) {
        t_error("PTHREAD_MUTEX_NORMAL timedlock failed after destroyed, got %s\n", strerror(i));
    }
    i = TestPthreadMutexTimedlockAfterDestroyed(PTHREAD_MUTEX_ERRORCHECK);
    if (i != 0) {
        t_error("PTHREAD_MUTEX_ERRORCHECK timedlock failed after destroyed, got %s\n", strerror(i));
    }
    i = TestPthreadMutexTimedlockAfterDestroyed(PTHREAD_MUTEX_RECURSIVE);
    if (i != 0) {
        t_error("PTHREAD_MUTEX_RECURSIVE timedlock failed after destroyed, got %s\n", strerror(i));
    }
    i = TestPthreadMutexTrylockAfterDestroyed(PTHREAD_MUTEX_ERRORCHECK);
    if (i != 0) {
        t_error("PTHREAD_MUTEX_NORMAL trylock failed after destroyed, got %s\n", strerror(i));
    }
    i = TestPthreadMutexTrylockAfterDestroyed(PTHREAD_MUTEX_ERRORCHECK);
    if (i != 0) {
        t_error("PTHREAD_MUTEX_ERRORCHECK trylock failed after destroyed, got %s\n", strerror(i));
    }
    i = TestPthreadMutexTrylockAfterDestroyed(PTHREAD_MUTEX_RECURSIVE);
    if (i != 0) {
        t_error("PTHREAD_MUTEX_RECURSIVE trylock failed after destroyed, got %s\n", strerror(i));
    }
    return g_tStatus;
}

int PthreadFortifyTestTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return PthreadFortifyTestTestImpl(1, libcArgv);
}
