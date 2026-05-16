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

// commit: e5dd18319bbd47c89aac5e1571771958a43e067d 2011-03-08
// pthread_rwlock_try* should fail with EBUSY
#include <cerrno>
#include <cstring>
#include <pthread.h>
#include "test.h"

static void CheckResult(int r, const char* name)
{
    if (r != 0) {
        t_error("%s failed: %s\n", name, strerror(r));
    }
}

static void* Tryrdlock(void* arg)
{
    int r = pthread_rwlock_tryrdlock((pthread_rwlock_t*)arg);
    if (r != EBUSY) {
        t_error("tryrdlock for wrlocked lock returned %s, want EBUSY\n", strerror(r));
    }
    return nullptr;
}

static void* Trywrlock(void* arg)
{
    int r = pthread_rwlock_trywrlock((pthread_rwlock_t*)arg);
    if (r != EBUSY) {
        t_error("trywrlock for rdlocked lock returned %s, want EBUSY\n", strerror(r));
    }
    return nullptr;
}

static int PthreadRwlockEbusyTestImpl(void)
{
    pthread_t t;
    pthread_rwlock_t rw = PTHREAD_RWLOCK_INITIALIZER;
    void* p;
    int r = 0;

    r = pthread_rwlock_rdlock(&rw);
    CheckResult(r, "pthread_rwlock_rdlock(&rw)");
    r = pthread_create(&t, nullptr, Trywrlock, &rw);
    CheckResult(r, "pthread_create(&t, nullptr, Trywrlock, &rw)");
    r = pthread_join(t, &p);
    CheckResult(r, "pthread_join(t, &p)");
    r = pthread_rwlock_unlock(&rw);
    CheckResult(r, "pthread_rwlock_unlock(&rw)");

    r = pthread_rwlock_wrlock(&rw);
    CheckResult(r, "pthread_rwlock_wrlock(&rw)");
    r = pthread_create(&t, nullptr, Tryrdlock, &rw);
    CheckResult(r, "pthread_create(&t, nullptr, Tryrdlock, &rw)");
    r = pthread_join(t, &p);
    CheckResult(r, "pthread_join(t, &p)");
    r = pthread_rwlock_unlock(&rw);
    CheckResult(r, "pthread_rwlock_unlock(&rw)");

    return T_STATUS;
}

int PthreadRwlockEbusyTest(void)
{
    return PthreadRwlockEbusyTestImpl();
}
