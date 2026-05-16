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
#include <sys/time.h>
#include <unistd.h>
#include "functionalext.h"

#define NSEC_VALUE 1
#define TIMEOUT_SEC 5
#define USEC_TO_NSEC 1000
#define EXPECTED_FLAG 1

static int g_flag = 0;
static pthread_cond_t g_gcond;
static pthread_mutex_t g_gmutex;
struct timespec g_gtm;

static void *ThreadFuncA(void *arg)
{
    struct timeval now;
    struct timespec outtime;
    g_gtm.tv_nsec = NSEC_VALUE;
    pthread_mutex_lock(&g_gmutex);
    gettimeofday(&now, nullptr);
    outtime.tv_sec = now.tv_sec + TIMEOUT_SEC;
    outtime.tv_nsec = now.tv_usec * USEC_TO_NSEC;
    pthread_cond_timedwait(&g_gcond, &g_gmutex, &outtime);
    g_flag++;
    pthread_mutex_unlock(&g_gmutex);
    return arg;
}

static void *ThreadFuncB(void *arg)
{
    pthread_mutex_lock(&g_gmutex);
    pthread_cond_signal(&g_gcond);
    pthread_mutex_unlock(&g_gmutex);
    return arg;
}

/**
 * @tc.name:      PthreadCondTimedwait0100
 * @tc.desc:      Verify pthread create process success
 * @tc.level:     level 0.
 */
void PthreadCondTimedwait0100(void)
{
    pthread_t pid1;
    pthread_t pid2;
    pthread_create(&pid1, nullptr, ThreadFuncA, nullptr);
    pthread_create(&pid2, nullptr, ThreadFuncB, nullptr);
    pthread_join(pid1, nullptr);
    pthread_join(pid2, nullptr);
    EXPECT_EQ("pthread_cond_timedwait_0200", g_flag, EXPECTED_FLAG);
    pthread_mutex_destroy(&g_gmutex);
    pthread_cond_destroy(&g_gcond);
}

static int PthreadCondTimedwaitSupTestImpl(void)
{
    PthreadCondTimedwait0100();
    return g_tStatus;
}

int PthreadCondTimedwaitSupTest(void)
{
    return PthreadCondTimedwaitSupTestImpl();
}

