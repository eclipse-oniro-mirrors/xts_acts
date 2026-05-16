/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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
#include <cstdlib>
#include <unistd.h>
#include "functionalext.h"

static pthread_mutex_t g_mutex;

static void *ThreadfuncA(void *arg)
{
    int32_t ret = pthread_mutex_lock(&g_mutex);
    ret = pthread_mutex_unlock(&g_mutex);
    EXPECT_EQ("pthread_mutex_un_lock_0100", ret, 0);
    return arg;
}

static void *ThreadfuncB(void *arg)
{
    pthread_mutex_lock(&g_mutex);
    return arg;
}

static void *ThreadfuncC(void *arg)
{
    int32_t ret = pthread_mutex_unlock(&g_mutex);
    EXPECT_EQ("pthread_mutex_un_lock_0200", ret, EPERM);
    return arg;
}

/**
 * @tc.name:      pthread_mutex_un_lock_0100
 * @tc.desc:      Verify process pthread_mutex_un_lock once success.
 * @tc.level:     level 0.
 */
static void PthreadMutexUnLock0100(void)
{
    int32_t type = PTHREAD_MUTEX_RECURSIVE;
    pthread_mutex_init(&g_mutex, (pthread_mutexattr_t *)(&type));
    pthread_t tid1;
    pthread_create(&tid1, nullptr, ThreadfuncA, nullptr);
    pthread_join(tid1, nullptr);
}

/**
 * @tc.name:      pthread_mutex_un_lock_0200
 * @tc.desc:      Verify process pthread_mutex_un_lock fail. Because can not release a mutex pointed to a mutex
 *                that is not this thread.
 * @tc.level:     level 2.
 */
static void PthreadMutexUnLock0200(void)
{
    int32_t type = PTHREAD_MUTEX_RECURSIVE;
    pthread_mutex_init(&g_mutex, (pthread_mutexattr_t *)(&type));
    pthread_t tid2;
    pthread_t tid3;
    pthread_create(&tid2, nullptr, ThreadfuncB, nullptr);
    pthread_join(tid2, nullptr);
    pthread_create(&tid3, nullptr, ThreadfuncC, nullptr);
    pthread_join(tid3, nullptr);
    pthread_mutex_destroy(&g_mutex);
}

static int PthreadMutexUnlockTestTestImpl(void)
{
    PthreadMutexUnLock0100();
    PthreadMutexUnLock0200();
    return g_tStatus;
}

int PthreadMutexUnlockTestTest(void)
{
    return PthreadMutexUnlockTestTestImpl();
}
