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
#include "functionalext.h"

/**
 * @tc.name      : PthreadRwlockTryrdlock0100
 * @tc.desc      : Try adding a read lock
 * @tc.level     : Level 0
 */
void PthreadRwlockTryrdlock0100(void)
{
    pthread_rwlock_t rwlock;
    pthread_rwlockattr_t rwlockattr;
    pthread_rwlockattr_init(&rwlockattr);
    pthread_rwlock_init(&rwlock, &rwlockattr);

    int ret = pthread_rwlock_tryrdlock(&rwlock);
    EXPECT_EQ("PthreadRwlockTryrdlock0100", ret, CMPFLAG);
    ret = pthread_rwlock_unlock(&rwlock);
    EXPECT_EQ("PthreadRwlockTryrdlock0100", ret, CMPFLAG);

    pthread_rwlock_destroy(&rwlock);
    pthread_rwlockattr_destroy(&rwlockattr);
}

/**
 * @tc.name      : PthreadRwlockTryrdlock0200
 * @tc.desc      : If a write lock has been added, try adding a read lock again
 * @tc.level     : Level 2
 */
void PthreadRwlockTryrdlock0200(void)
{
    pthread_rwlock_t rwlock;
    pthread_rwlockattr_t rwlockattr;
    pthread_rwlockattr_init(&rwlockattr);
    pthread_rwlock_init(&rwlock, &rwlockattr);

    int ret = pthread_rwlock_wrlock(&rwlock);
    EXPECT_EQ("PthreadRwlockTryrdlock0200", ret, CMPFLAG);

    ret = pthread_rwlock_tryrdlock(&rwlock);
    EXPECT_EQ("PthreadRwlockTryrdlock0200", ret, EBUSY);

    ret = pthread_rwlock_unlock(&rwlock);
    EXPECT_EQ("PthreadRwlockTryrdlock0200", ret, CMPFLAG);

    pthread_rwlock_destroy(&rwlock);
    pthread_rwlockattr_destroy(&rwlockattr);
}

static int PthreadRwlockTryrdlockTestImpl(void)
{
    PthreadRwlockTryrdlock0100();
    PthreadRwlockTryrdlock0200();
    return T_STATUS;
}

int PthreadRwlockTryrdlockTest(void)
{
    return PthreadRwlockTryrdlockTestImpl();
}
