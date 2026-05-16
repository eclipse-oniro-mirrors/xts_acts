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
#include <climits>

#include "functionalext.h"

#define THREADNUM 4

pthread_barrier_t g_mybarrier;

static void *ThreadFunc(void *arg)
{
    (void)arg;
    sleep(1);
    int ret = pthread_barrier_wait(&g_mybarrier);
    EXPECT_NE("PthreadBarrierWait0100", ret, ERREXPECT);
    return nullptr;
}

/**
 * @tc.name      : PthreadBarrierWait0100
 * @tc.desc      : Blocking and waiting for 4 sub-threads, the return value of the calling function is successful
 * @tc.level     : Level 1
 */
void PthreadBarrierWait0100(void)
{
    int i = 0;
    pthread_t ids[THREADNUM];

    int ret = pthread_barrier_init(&g_mybarrier, nullptr, THREADNUM + 1);
    EXPECT_EQ("PthreadBarrierWait0100", ret, CMPFLAG);

    for (i = 0; i < THREADNUM; i++) {
        if (pthread_create(&ids[i], nullptr, ThreadFunc, nullptr) != 0) {
            t_error("create thread failed\n");
            return;
        }
    }

    ret = pthread_barrier_wait(&g_mybarrier);

    for (i = 0; i < THREADNUM; i++) {
        ret = pthread_join(ids[i], nullptr);
        if (ret != 0) {
            t_error("thread wait failed\n");
            return;
        }
    }

    ret = pthread_barrier_destroy(&g_mybarrier);
    EXPECT_EQ("PthreadBarrierWait0100", ret, CMPFLAG);
}

/**
 * @tc.name      : PthreadBarrierWait0200
 * @tc.desc      : The number of blocked threads is 1, and the calling function returns ERREXPECT
 * @tc.level     : Level 2
 */
void PthreadBarrierWait0200(void)
{
    int threadnum = 1;

    int ret = pthread_barrier_init(&g_mybarrier, nullptr, threadnum);
    EXPECT_EQ("PthreadBarrierWait0200", ret, CMPFLAG);

    ret = pthread_barrier_wait(&g_mybarrier);
    EXPECT_EQ("PthreadBarrierWait0200", ret, ERREXPECT);

    ret = pthread_barrier_destroy(&g_mybarrier);
    EXPECT_EQ("PthreadBarrierWait0200", ret, CMPFLAG);
}

static int PthreadBarrierWaitTestImpl(void)
{
    PthreadBarrierWait0100();
    PthreadBarrierWait0200();

    return g_tStatus;
}

int PthreadBarrierWaitTest(void)
{
    return PthreadBarrierWaitTestImpl();
}
