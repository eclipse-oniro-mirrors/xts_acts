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
#include <semaphore.h>
#include "functionalext.h"

static int32_t g_priorityTen = 10;
static int32_t g_priorityHundred = 100;
static sem_t g_sem;

static void *ThreadfuncA(void *arg)
{
    sem_wait(&g_sem);
    return arg;
}

/**
 * @tc.name      : pthread_setschedparam_0100
 * @tc.desc      : Verify pthread_setschedparam process success when scheduling policy is SCHED_OTHER and priority is 0
 * @tc.level     : Level 1
 */
static void PthreadSetschedparam0100(void)
{
    pthread_t tid;
    sem_init(&g_sem, 0, 0);
    pthread_create(&tid, nullptr, ThreadfuncA, nullptr);
    struct sched_param sched;
    sched.sched_priority = 0;
    int32_t ret = pthread_setschedparam(tid, SCHED_OTHER, &sched);
    EXPECT_EQ("PthreadSetschedparam0100", ret, 0);
    int32_t semRet = sem_post(&g_sem);
    EXPECT_EQ("PthreadSetschedparam0100", semRet, 0);
    pthread_join(tid, nullptr);
    sem_destroy(&g_sem);
}

static int PthreadSetschedparamTestImpl(void)
{
    PthreadSetschedparam0100();
    return g_tStatus;
}

int PthreadSetschedparamTestTest(void)
{
    return PthreadSetschedparamTestImpl();
}
