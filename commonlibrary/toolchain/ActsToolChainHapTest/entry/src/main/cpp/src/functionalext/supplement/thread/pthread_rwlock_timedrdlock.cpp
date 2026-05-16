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

/**
 * @tc.name      : pthread_rwlock_timedrdlock_0100
 * @tc.desc      : Provide correct parameters, test timeout and rwlock
 * @tc.level     : Level 0
 */
void PthreadRwlockTimedrdlock0100(void)
{
    struct timespec ts = {0};
    pthread_rwlock_t rwlock;
    pthread_rwlock_init(&rwlock, nullptr);
    clock_gettime(CLOCK_REALTIME, &ts);
    struct tm *tmp = localtime(&ts.tv_sec);
    int rev = -1;
    if (tmp) {
        ts.tv_sec += 1;
        rev = pthread_rwlock_timedrdlock(&rwlock, &ts);
    }
    EXPECT_EQ("PthreadRwlockTimedrdlock0100", rev, 0);
    if (rev == 0) {
        pthread_rwlock_unlock(&rwlock);
    }
    pthread_rwlock_destroy(&rwlock);
}

/**
 * @tc.name      : PthreadRwlockTimedrdlock0200
 * @tc.desc      : In the locked (read lock) state, the test times out and rwlock
 * @tc.level     : Level 0
 */
void PthreadRwlockTimedrdlock0200(void)
{
    struct timespec ts = {0};
    pthread_rwlock_t rwlock;
    pthread_rwlock_init(&rwlock, nullptr);
    int rev = pthread_rwlock_timedrdlock(&rwlock, nullptr);
    EXPECT_EQ("PthreadRwlockTimedrdlock0200", rev, 0);
    clock_gettime(CLOCK_REALTIME, &ts);
    struct tm *tmp = localtime(&ts.tv_sec);
    rev = -1;
    if (tmp) {
        ts.tv_sec += 1;
        rev = pthread_rwlock_timedrdlock(&rwlock, &ts);
    }
    EXPECT_EQ("PthreadRwlockTimedrdlock0200", rev, 0);
    pthread_rwlock_unlock(&rwlock);
    pthread_rwlock_destroy(&rwlock);
}

/**
 * @tc.name      : pthread_rwlock_timedrdlock_0300
 * @tc.desc      : In the locked (write lock) state, the test times out and rwlock
 * @tc.level     : Level 2
 */
void PthreadRwlockTimedrdlock0300(void)
{
    struct timespec ts = {0};
    pthread_rwlock_t rwlock;
    pthread_rwlock_init(&rwlock, nullptr);
    int rev = pthread_rwlock_timedwrlock(&rwlock, nullptr);
    EXPECT_EQ("PthreadRwlockTimedrdlock0300", rev, 0);
    clock_gettime(CLOCK_REALTIME, &ts);
    struct tm *tmp = localtime(&ts.tv_sec);
    rev = -1;
    if (tmp) {
        ts.tv_sec += 1;
        rev = pthread_rwlock_timedrdlock(&rwlock, &ts);
    }
    EXPECT_EQ("PthreadRwlockTimedrdlock0300", rev, ETIMEDOUT);
    pthread_rwlock_unlock(&rwlock);
    pthread_rwlock_destroy(&rwlock);
}

/**
 * @tc.name      : pthread_rwlock_timedrdlock_time64_0100
 * @tc.desc      : Provide correct parameters, test timeout and rwlock
 * @tc.level     : Level 0
 */
void PthreadRwlockTimedrdlockTime640100(void)
{
    struct timespec ts = {0};
    pthread_rwlock_t rwlock;
    pthread_rwlock_init(&rwlock, nullptr);
    clock_gettime(CLOCK_REALTIME, &ts);
    struct tm *tmp = localtime(&ts.tv_sec);
    int rev = -1;
    if (tmp) {
        ts.tv_sec += 1;
        rev = PthreadRwlockTimedrdlockTime64(&rwlock, &ts);
    }
    EXPECT_EQ("PthreadRwlockTimedrdlockTime640100", rev, 0);
    if (rev == 0) {
        pthread_rwlock_unlock(&rwlock);
    }
    pthread_rwlock_destroy(&rwlock);
}

static int PthreadRwlockTimedrdlockTestImpl(void)
{
    PthreadRwlockTimedrdlock0100();
    PthreadRwlockTimedrdlock0200();
    PthreadRwlockTimedrdlock0300();
    PthreadRwlockTimedrdlockTime640100();
    return g_tStatus;
}

int PthreadRwlockTimedrdlockTest(void)
{
    return PthreadRwlockTimedrdlockTestImpl();
}

