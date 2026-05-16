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
#include "functionalext.h"

static pthread_mutexattr_t g_gmutexattr;
const int INVALIDTYPE = 4;

/**
 * @tc.name:      PthreadMutexattrSettype0100
 * @tc.desc:      Verify process pthread_mutexattr_settype success
 * @tc.level:     level 0
 */
void PthreadMutexattrSettype0100(void)
{
    pthread_mutexattr_init(&g_gmutexattr);
    int ret = pthread_mutexattr_settype(&g_gmutexattr, PTHREAD_MUTEX_NORMAL);
    EXPECT_EQ("pthread_mutexattr_settype", ret, 0);
    pthread_mutexattr_destroy(&g_gmutexattr);
}

/**
 * @tc.name:      PthreadMutexattrSettype0200
 * @tc.desc:      Verify process pthread_mutexattr_settype fail. Because type is invalid
 * @tc.level:     level 2
 */
void PthreadMutexattrSettype0200(void)
{
    pthread_mutexattr_init(&g_gmutexattr);
    int ret = pthread_mutexattr_settype(&g_gmutexattr, INVALIDTYPE);
    EXPECT_EQ("pthread_mutexattr_settype", ret, EINVAL);
    pthread_mutexattr_destroy(&g_gmutexattr);
}

static int PthreadMutexattrSettypeTestImpl(void)
{
    PthreadMutexattrSettype0100();
    PthreadMutexattrSettype0200();
    return T_STATUS;
}

int PthreadMutexattrSettypeTest(void)
{
    return PthreadMutexattrSettypeTestImpl();
}
