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

static pthread_once_t g_once = PTHREAD_ONCE_INIT;
static int32_t g_count = 0;

void OnceRun(void)
{
    g_count++;
}

static void *ThreadfuncA(void *arg)
{
    int32_t ret = pthread_once(&g_once, OnceRun);
    EXPECT_EQ("PthreadOnce0100", ret, 0);
    return arg;
}

static void *ThreadfuncB(void *arg)
{
    int32_t ret = pthread_once(&g_once, OnceRun);
    EXPECT_EQ("PthreadOnce0100", ret, 0);
    return arg;
}

/**
 * @tc.name:      pthread_once_0100
 * @tc.desc:      Verify process pthread_mutex_once success.
 * @tc.level:     level 0.
 */
void PthreadOnce0100(void)
{
    pthread_t tid1;
    pthread_t tid2;
    pthread_create(&tid1, nullptr, ThreadfuncA, nullptr);
    pthread_create(&tid2, nullptr, ThreadfuncB, nullptr);
    pthread_join(tid1, nullptr);
    pthread_join(tid2, nullptr);
}

static int PthreadOnceTestImpl(void)
{
    PthreadOnce0100();
    return g_tStatus;
}

int PthreadOnceTestTest(void)
{
    return PthreadOnceTestImpl();
}
