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

#include <pthread.h>
#include <cstdlib>
#include <unistd.h>
#include "functionalext.h"

static void *ThreadfuncA(void *arg)
{
    return arg;
}

/**
 * @tc.name      : pthread_getattr_np_0100
 * @tc.desc      : Verify pthread_getattr_np process success
 * @tc.level     : Level 0
 */
void PthreadGetattrNp0100(void)
{
    pthread_t ph;
    pthread_create(&ph, nullptr, ThreadfuncA, nullptr);
    pthread_attr_t attr;
    pthread_attr_init(&attr);
    void *threadResult = nullptr;
    int32_t ret = pthread_getattr_np(ph, &attr);
    pthread_attr_destroy(&attr);
    pthread_join(ph, &threadResult);
    void *stack = nullptr;
    size_t stacksize;
    pthread_attr_getstack(&attr, &stack, &stacksize);
    EXPECT_PTRNE("PthreadGetattrNp0100", stack, nullptr);
}

static int PthreadGetattrNpTestImpl(void)
{
    PthreadGetattrNp0100();
    return g_tStatus;
}

int PthreadGetattrNpTestTest(void)
{
    return PthreadGetattrNpTestImpl();
}

