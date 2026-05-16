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

#include <climits>
#include <cstdlib>
#include <pthread.h>
#include <semaphore.h>
#include "functionalext.h"

#define THREAD_STACK_LEN 0x4001
#define BUFFEIZE 0x3000

/**
 * @tc.name      : PthreadAttrSetstack0100
 * @tc.desc      : Create a stack memory size of 4k, get the size value through the
 *                 pthread_attr_getstack function, whether the setting is successful
 * @tc.level     : Level 0
 */
void PthreadAttrSetstack0100(void)
{
    pthread_t thread;
    pthread_attr_t attr;
    void* stackAddr = nullptr;
    void* getstackaddr = nullptr;

    size_t getstackSize = 0;
    int ret = 0;
    void* p = nullptr;

    int pageSize = getpagesize();
    if (pageSize == 0) {
        t_error("page Size is 0\n");
        return;
    }
    pthread_attr_init(&attr);
    ret = posix_memalign(&stackAddr, pageSize, THREAD_STACK_LEN);
    if (ret != 0) {
        EXPECT_EQ("PthreadAttrSetstack0100", ret, 0);
        return;
    }
    ret = pthread_attr_setstack(&attr, stackAddr, THREAD_STACK_LEN);
    if (ret != 0) {
        EXPECT_EQ("PthreadAttrSetstack0100", ret, 0);
        return;
    }

    pthread_attr_getstack(&attr, &getstackaddr, &getstackSize);
    EXPECT_EQ("PthreadAttrSetstack0100", getstackSize, THREAD_STACK_LEN);

    pthread_attr_destroy(&attr);
    free(stackAddr);
    stackAddr = nullptr;
}

/**
 * @tc.name      : PthreadAttrSetstack0200
 * @tc.desc      : Determine whether the stack maximum function returns an abnormal value
 * @tc.level     : Level 2
 */
void PthreadAttrSetstack0200(void)
{
    pthread_attr_t attr;
    void* stackAddr = nullptr;
    int ret = 0;
    int minsize = PTHREAD_STACK_MIN - 1;

    pthread_attr_init(&attr);

    ret = pthread_attr_setstack(&attr, stackAddr, ERREXPECT);
    EXPECT_EQ("PthreadAttrSetstack0200", ret, EINVAL);

    ret = pthread_attr_setstack(&attr, stackAddr, minsize);
    EXPECT_EQ("PthreadAttrSetstack0200", ret, EINVAL);

    pthread_attr_destroy(&attr);
}

static int PthreadAttrSetstackTestImpl(void)
{
    PthreadAttrSetstack0100();
    PthreadAttrSetstack0200();

    return T_STATUS;
}

int PthreadAttrSetstackTest(void)
{
    return PthreadAttrSetstackTestImpl();
}
