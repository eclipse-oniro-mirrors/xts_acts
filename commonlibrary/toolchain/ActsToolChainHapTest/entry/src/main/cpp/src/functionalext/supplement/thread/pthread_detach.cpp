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
#include <cstdio>
#include <unistd.h>
#include "functionalext.h"
static int g_flag = 0;
const int SLEEPTIME = 3;

static void *ThreadFunc(void *arg)
{
    sleep(1);
    g_flag++;
    pthread_exit(nullptr);
    return arg;
}

/**
 * @tc.name:      pthread_detach_0100
 * @tc.desc:      Verify pthread_detach process sucess
 * @tc.level:     level 0.
 */
void PthreadDetach0100(void)
{
    pthread_t pid;
    g_flag = 0;
    pthread_create(&pid, nullptr, ThreadFunc, nullptr);
    pthread_detach(pid);
    EXPECT_EQ("pthread_detach_0100", g_flag, 0);
    sleep(SLEEPTIME);
}

static int PthreadDetachTestImpl(void)
{
    PthreadDetach0100();
    return g_tStatus;
}

int PthreadDetachTest(void)
{
    return PthreadDetachTestImpl();
}

