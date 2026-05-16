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

#define TEST_MUTEXT_ATTR_VALUE 2

/**
 * @tc.name      : PthreadMutexattrSetpshared0100
 * @tc.desc      : Correct parameter setting mutex attribute value
 * @tc.level     : Level 0
 */
void PthreadMutexattrSetpshared0100(void)
{
    pthread_mutexattr_t attr;
    pthread_mutexattr_init(&attr);
    int ret = pthread_mutexattr_setpshared(&attr, 1);
    EXPECT_EQ("PthreadMutexattrSetpshared0100", ret, CMPFLAG);
    pthread_mutexattr_destroy(&attr);
}

/**
 * @tc.name      : PthreadMutexattrSetpshared0200
 * @tc.desc      : Invalid parameter setting mutex attribute value
 * @tc.level     : Level 2
 */
void PthreadMutexattrSetpshared0200(void)
{
    pthread_mutexattr_t attr;
    pthread_mutexattr_init(&attr);
    int ret = pthread_mutexattr_setpshared(&attr, TEST_MUTEXT_ATTR_VALUE);
    EXPECT_EQ("PthreadMutexattrSetpshared0200", ret, EINVAL);
    pthread_mutexattr_destroy(&attr);
}

static int PthreadMutexattrSetpsharedTestImpl(void)
{
    PthreadMutexattrSetpshared0100();
    PthreadMutexattrSetpshared0200();
    return T_STATUS;
}

int PthreadMutexattrSetpsharedTest(void)
{
    return PthreadMutexattrSetpsharedTestImpl();
}
