/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <pthread.h>
#include <cstdio>
#include <cstdlib>
#include "functionalext.h"
#include "time64_functions.h"

#define TEST_MUTEX_ATTR 15

/**
 * @tc.name      : PthreadMutexTimedlock0100
 * @tc.desc      : Provide correct parameters, test timeout and lock
 * @tc.level     : Level 0
 */
void PthreadMutexTimedlock0100(void)
{
    struct timespec ts = {0};
    ts.tv_sec = 1;
    pthread_mutexattr_t mutexAttr;
    pthread_mutex_t mutex;
    pthread_mutexattr_init(&mutexAttr);
    pthread_mutexattr_settype(&mutexAttr, TEST_MUTEX_ATTR);
    pthread_mutex_init(&mutex, &mutexAttr);

    int rev = pthread_mutex_timedlock(&mutex, &ts);
    EXPECT_EQ("PthreadMutexTimedlock0100", rev, 0);

    pthread_mutex_unlock(&mutex);
    pthread_mutex_destroy(&mutex);
    pthread_mutexattr_destroy(&mutexAttr);
}

/**
 * @tc.name      : PthreadMutexTimedlock0200
 * @tc.desc      : The lock attribute is PTHREAD_MUTEX_ERRORCHECK, and the test timeout is locked
 * @tc.level     : Level 0
 */
void PthreadMutexTimedlock0200(void)
{
    struct timespec ts = {0};
    ts.tv_sec = 1;
    pthread_mutexattr_t mutexAttr;
    pthread_mutex_t mutex;

    pthread_mutexattr_init(&mutexAttr);
    pthread_mutexattr_settype(&mutexAttr, PTHREAD_MUTEX_ERRORCHECK);
    pthread_mutex_init(&mutex, &mutexAttr);
    int rev = pthread_mutex_timedlock(&mutex, &ts);
    EXPECT_EQ("PthreadMutexTimedlock0200", rev, 0);

    pthread_mutex_unlock(&mutex);
    pthread_mutex_destroy(&mutex);
    pthread_mutexattr_destroy(&mutexAttr);
}

/**
 * @tc.name      : PthreadMutexTimedlock0300
 * @tc.desc      : In the locked state, the test times out and locks
 * @tc.level     : Level 2
 */
void PthreadMutexTimedlock0300(void)
{
    struct timespec ts = {0};
    ts.tv_sec = 1;
    pthread_mutexattr_t mutexAttr;
    pthread_mutex_t mutex;
    pthread_mutexattr_init(&mutexAttr);
    pthread_mutexattr_settype(&mutexAttr, TEST_MUTEX_ATTR);
    pthread_mutex_init(&mutex, &mutexAttr);
    int rev = pthread_mutex_lock(&mutex);
    EXPECT_EQ("PthreadMutexTimedlock0300", rev, 0);
    rev = pthread_mutex_timedlock(&mutex, &ts);
    EXPECT_EQ("PthreadMutexTimedlock0300", rev, ETIMEDOUT);

    pthread_mutex_unlock(&mutex);
    pthread_mutex_destroy(&mutex);
    pthread_mutexattr_destroy(&mutexAttr);
}

/**
 * @tc.name      : PthreadMutexTimedlockTime640100
 * @tc.desc      : Provide correct parameters, test timeout and lock
 * @tc.level     : Level 0
 */
void PthreadMutexTimedlockTime640100(void)
{
    struct timespec ts = {0};
    ts.tv_sec = 1;
    pthread_mutexattr_t mutexAttr;
    pthread_mutex_t mutex;
    pthread_mutexattr_init(&mutexAttr);
    pthread_mutexattr_settype(&mutexAttr, TEST_MUTEX_ATTR);
    pthread_mutex_init(&mutex, &mutexAttr);

    int rev = PthreadMutexTimedlockTime64(&mutex, &ts);
    EXPECT_EQ("PthreadMutexTimedlockTime640100", rev, 0);

    pthread_mutex_unlock(&mutex);
    pthread_mutex_destroy(&mutex);
    pthread_mutexattr_destroy(&mutexAttr);
}

static int PthreadMutexTimedlockTestImpl(void)
{
    PthreadMutexTimedlock0100();
    PthreadMutexTimedlock0200();
    PthreadMutexTimedlock0300();
    PthreadMutexTimedlockTime640100();
    return g_tStatus;
}

int PthreadMutexTimedlockTest(void)
{
    return PthreadMutexTimedlockTestImpl();
}

