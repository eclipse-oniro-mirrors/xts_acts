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

#include <cstdio>
#include <ctime>
#include <pthread.h>
#include "test.h"

#define SLEEP_20_MS (20000)

static void ExpectTrue(bool cond, const char* expr)
{
    if (!cond) {
        t_error("%s failed\n", expr);
    }
}

pthread_rwlock_t g_rwlock1;
static int g_number = 0;

static void* PthreadRdlockR1(void* arg)
{
    ExpectTrue(pthread_rwlock_rdlock(&g_rwlock1) == 0, "pthread_rwlock_rdlock(&g_rwlock1) == 0");
    g_number++;
    ExpectTrue(pthread_rwlock_unlock(&g_rwlock1) == 0, "pthread_rwlock_unlock(&g_rwlock1) == 0");
    return arg;
}

static void* PthreadRdlockR2(void* arg)
{
    usleep(SLEEP_20_MS);
    ExpectTrue(pthread_rwlock_rdlock(&g_rwlock1) == 0, "pthread_rwlock_rdlock(&g_rwlock1) == 0");
    g_number--;
    ExpectTrue(pthread_rwlock_unlock(&g_rwlock1) == 0, "pthread_rwlock_unlock(&g_rwlock1) == 0");
    return arg;
}

/**
 * @tc.name      : PthreadRwlockRdlock0100
 * @tc.desc      : Verify read lock read-write lock success
 * @tc.level     : Level 0
 */
void PthreadRwlockRdlock0100(void)
{
    pthread_t thread;
    ExpectTrue(pthread_rwlock_init(&g_rwlock1, nullptr) == 0, "pthread_rwlock_init(&g_rwlock1, nullptr) == 0");
    ExpectTrue(pthread_rwlock_rdlock(&g_rwlock1) == 0, "pthread_rwlock_rdlock(&g_rwlock1) == 0");
    ExpectTrue(pthread_rwlock_unlock(&g_rwlock1) == 0, "pthread_rwlock_unlock(&g_rwlock1) == 0");
    ExpectTrue(pthread_rwlock_destroy(&g_rwlock1) == 0, "pthread_rwlock_destroy(&g_rwlock1) == 0");
}

/**
 * @tc.name      : PthreadRwlockRdlock0200
 * @tc.desc      : Verify that the read lock is successful for multiple read-write locks
 * @tc.level     : Level 1
 */
void PthreadRwlockRdlock0200(void)
{
    pthread_t thread;
    ExpectTrue(pthread_rwlock_init(&g_rwlock1, nullptr) == 0, "pthread_rwlock_init(&g_rwlock1, nullptr) == 0");
    ExpectTrue(pthread_rwlock_rdlock(&g_rwlock1) == 0, "pthread_rwlock_rdlock(&g_rwlock1) == 0");
    ExpectTrue(pthread_rwlock_rdlock(&g_rwlock1) == 0, "pthread_rwlock_rdlock(&g_rwlock1) == 0");
    ExpectTrue(pthread_rwlock_unlock(&g_rwlock1) == 0, "pthread_rwlock_unlock(&g_rwlock1) == 0");
    ExpectTrue(pthread_rwlock_unlock(&g_rwlock1) == 0, "pthread_rwlock_unlock(&g_rwlock1) == 0");
    ExpectTrue(pthread_rwlock_destroy(&g_rwlock1) == 0, "pthread_rwlock_destroy(&g_rwlock1) == 0");
}

/**
 * @tc.name      : PthreadRwlockRdlock0300
 * @tc.desc      : Verify that the read lock read-write lock is successfully set multiple times
 * @tc.level     : Level 1
 */
void PthreadRwlockRdlock0300(void)
{
    pthread_t tid[2];
    ExpectTrue(pthread_rwlock_init(&g_rwlock1, nullptr) == 0, "pthread_rwlock_init(&g_rwlock1, nullptr) == 0");

    ExpectTrue(pthread_create(&tid[0], nullptr, PthreadRdlockR1, nullptr) == 0,
               "pthread_create(&tid[0], nullptr, PthreadRdlockR1, nullptr) == 0");
    ExpectTrue(pthread_create(&tid[1], nullptr, PthreadRdlockR2, nullptr) == 0,
               "pthread_create(&tid[1], nullptr, PthreadRdlockR2, nullptr) == 0");
    ExpectTrue(pthread_join(tid[0], nullptr) == 0, "pthread_join(tid[0], nullptr) == 0");
    ExpectTrue(pthread_join(tid[1], nullptr) == 0, "pthread_join(tid[1], nullptr) == 0");
    ExpectTrue(g_number == 0, "g_number == 0");
    ExpectTrue(pthread_rwlock_destroy(&g_rwlock1) == 0, "pthread_rwlock_destroy(&g_rwlock1) == 0");
}

static int PthreadRwlockRdlockSupTestImpl(int argc, char* argv[])
{
    PthreadRwlockRdlock0100();
    PthreadRwlockRdlock0200();
    PthreadRwlockRdlock0300();
    return T_STATUS;
}

int PthreadRwlockRdlockSupTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return PthreadRwlockRdlockSupTestImpl(1, libcArgvStub);
}
