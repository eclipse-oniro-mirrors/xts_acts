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

#include <cstdlib>
#include <pthread.h>
#include "functionalext.h"

#define TEST_GUARD_SIZE 128

/**
 * @tc.name      : PthreadAttrSetguardsize0100
 * @tc.desc      : Set thread property threshold value
 * @tc.level     : Level 0
 */
void PthreadAttrSetguardsize0100(void)
{
    int scope = 0;
    pthread_attr_t attr;
    pthread_attr_init(&attr);
    int rev = pthread_attr_setguardsize(&attr, TEST_GUARD_SIZE);
    EXPECT_EQ("PthreadAttrSetguardsize0100", rev, 0);
    pthread_attr_destroy(&attr);
}

/**
 * @tc.name      : PthreadAttrSetguardsize0200
 * @tc.desc      : Use an excessively large value, set the thread property threshold value
 * @tc.level     : Level 2
 */
void PthreadAttrSetguardsize0200(void)
{
    int scope = 0;
    pthread_attr_t attr;
    pthread_attr_init(&attr);
    int rev = pthread_attr_setguardsize(&attr, SIZE_MAX);
    EXPECT_EQ("PthreadAttrSetguardsize0200", rev, EINVAL);
    pthread_attr_destroy(&attr);
}

static int PthreadAttrSetguardsizeTestImpl(void)
{
    PthreadAttrSetguardsize0100();
    PthreadAttrSetguardsize0200();
    return T_STATUS;
}

int PthreadAttrSetguardsizeTest(void)
{
    return PthreadAttrSetguardsizeTestImpl();
}
