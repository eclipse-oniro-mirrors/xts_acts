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

const int32_t STACK_SIZE = 4 * 1024;

/**
 * @tc.name      : PthreadAttrGetstack0100
 * @tc.desc      : Verify pthread_attr_getstack process fail. By default, get the thread stack address and size fail
 * @tc.level     : Level 2
 */
void PthreadAttrGetstack0100(void)
{
    pthread_attr_t attr;
    pthread_attr_init(&attr);
    void* stack = nullptr;
    size_t stacksize;
    int32_t ret = pthread_attr_getstack(&attr, &stack, &stacksize);
    EXPECT_EQ("PthreadAttrGetstack0100", ret, EINVAL);
    pthread_attr_destroy(&attr);
}

/**
 * @tc.name      : PthreadAttrGetstack0200
 * @tc.desc      : Verify pthread_asuccessttr_getstack process success.Customize the thread stack，get the thread stack
 *                 address and size success
 * @tc.level     : Level 1
 */
void PthreadAttrGetstack0200(void)
{
    pthread_attr_t attr;
    pthread_attr_init(&attr);
    void* stack = malloc(STACK_SIZE);
    EXPECT_PTRNE("PthreadAttrGetstack0200", stack, nullptr);
    void* retstack = nullptr;
    size_t stacksize;
    pthread_attr_setstack(&attr, stack, STACK_SIZE);
    int32_t ret = pthread_attr_getstack(&attr, &retstack, &stacksize);
    EXPECT_EQ("PthreadAttrGetstack0200", ret, 0);
    EXPECT_PTREQ("PthreadAttrGetstack0200", stack, retstack);
    EXPECT_EQ("PthreadAttrGetstack0200", stacksize, STACK_SIZE);
    pthread_attr_destroy(&attr);
}

static int PthreadAttrGetstackTestTestImpl(void)
{
    PthreadAttrGetstack0100();
    PthreadAttrGetstack0200();
    return T_STATUS;
}

int PthreadAttrGetstackTestTest(void)
{
    return PthreadAttrGetstackTestTestImpl();
}
