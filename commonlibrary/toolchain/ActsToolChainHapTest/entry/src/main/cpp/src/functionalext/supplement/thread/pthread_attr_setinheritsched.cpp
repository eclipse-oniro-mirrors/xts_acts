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
#include <semaphore.h>

#include "functionalext.h"

/**
 * @tc.name      : PthreadAttrSetinheritsched0100
 * @tc.desc      : Verify that the preset properties can be obtained through get inheritsched in a single-threaded
 * environment
 * @tc.level     : Level 0
 */
void PthreadAttrSetinheritsched0100(void)
{
    pthread_attr_t attr;

    pthread_attr_init(&attr);

    pthread_attr_setinheritsched(&attr, PTHREAD_INHERIT_SCHED);
    int result = pthread_attr_getinheritsched(&attr, &result);
    EXPECT_EQ("PthreadAttrSetinheritsched0100", result, PTHREAD_INHERIT_SCHED);

    pthread_attr_setinheritsched(&attr, PTHREAD_EXPLICIT_SCHED);
    pthread_attr_getinheritsched(&attr, &result);
    EXPECT_EQ("PthreadAttrSetinheritsched0100", result, PTHREAD_EXPLICIT_SCHED);

    pthread_attr_destroy(&attr);
}

/**
 * @tc.name      : PthreadAttrSetinheritsched0200
 * @tc.desc      : Verify that the return value is EINVAL when setting an exception value in a single-threaded
 * environment
 * @tc.level     : Level 2
 */
void PthreadAttrSetinheritsched0200(void)
{
    pthread_attr_t attr;
    int inheritsched = 2;
    int result = -1;

    int ret = pthread_attr_init(&attr);
    EXPECT_EQ("PthreadAttrSetinheritsched0200", ret, CMPFLAG);

    ret = pthread_attr_setinheritsched(&attr, inheritsched);
    EXPECT_EQ("PthreadAttrSetinheritsched0200", ret, EINVAL);

    pthread_attr_destroy(&attr);
}

static int PthreadAttrSetinheritschedTestImpl(void)
{
    PthreadAttrSetinheritsched0100();
    PthreadAttrSetinheritsched0200();

    return T_STATUS;
}

int PthreadAttrSetinheritschedTest(void)
{
    return PthreadAttrSetinheritschedTestImpl();
}
