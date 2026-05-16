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

#include <cstdlib>
#include <pthread.h>
#include <unistd.h>
#include "functionalext.h"

static pthread_mutex_t g_mutex;

/**
 * @tc.name:      PthreadMutexInit0100
 * @tc.desc:      Verify pthread_mutex_init process success when second args is null.
 * @tc.desc:      level 0
 */
void PthreadMutexInit0100(void)
{
    int32_t ret = pthread_mutex_init(&g_mutex, nullptr);
    EXPECT_EQ("PthreadMutexInit0100", ret, 0);
    (void)pthread_mutex_destroy(&g_mutex);
}

/**
 * @tc.name:      PthreadMutexInit0200
 * @tc.desc:      Verify pthread_mutex_init process success when second args is PTHREAD_MUTEX_RECURSIVE.
 * @tc.desc:      level 1
 */
void PthreadMutexInit0200(void)
{
    pthread_mutexattr_t attr;
    int32_t ret = pthread_mutexattr_init(&attr);
    EXPECT_EQ("PthreadMutexInit0200", ret, 0);
    ret = pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_RECURSIVE);
    EXPECT_EQ("PthreadMutexInit0200", ret, 0);
    ret = pthread_mutex_init(&g_mutex, &attr);
    EXPECT_EQ("PthreadMutexInit0200", ret, 0);
    (void)pthread_mutexattr_destroy(&attr);
    (void)pthread_mutex_destroy(&g_mutex);
}

/**
 * @tc.name:      PthreadMutexInit0300
 * @tc.desc:      Verify pthread_mutex_init process success when second args is PTHREAD_MUTEX_RECURSIVE.
 * @tc.desc:      level 1
 */
void PthreadMutexInit0300(void)
{
    pthread_mutexattr_t attr;
    int32_t ret = pthread_mutexattr_init(&attr);
    EXPECT_EQ("PthreadMutexInit0300", ret, 0);
    ret = pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_ERRORCHECK);
    EXPECT_EQ("PthreadMutexInit0300", ret, 0);
    ret = pthread_mutex_init(&g_mutex, &attr);
    EXPECT_EQ("PthreadMutexInit0300", ret, 0);
    (void)pthread_mutexattr_destroy(&attr);
    (void)pthread_mutex_destroy(&g_mutex);
}

static int PthreadMutexInitTestTestImpl(void)
{
    PthreadMutexInit0100();
    PthreadMutexInit0200();
    PthreadMutexInit0300();
    return T_STATUS;
}

int PthreadMutexInitTestTest(void)
{
    return PthreadMutexInitTestTestImpl();
}
