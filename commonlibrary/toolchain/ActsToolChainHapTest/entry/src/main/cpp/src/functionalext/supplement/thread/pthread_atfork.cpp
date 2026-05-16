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
#include <sys/wait.h>
#include <unistd.h>
#include "functionalext.h"

#define TEST_THREAD_SLEEP 3
#ifdef FEATURE_PTHREAD_CANCEL
#undef FEATURE_PTHREAD_CANCEL
#endif

pthread_mutex_t g_glock = PTHREAD_MUTEX_INITIALIZER;
static int g_gprepareFlag = 0;
static int g_gparentFlag = 0;
static int g_gchildFlag = 0;

void ResetData(void)
{
    g_gprepareFlag = 0;
    g_gparentFlag = 0;
    g_gchildFlag = 0;
}

static void Prepare(void)
{
    int ret = pthread_mutex_lock(&g_glock);
    EXPECT_EQ("pthread_atfork Prepare", ret, 0);
    g_gprepareFlag++;
}

static void Parent(void)
{
    int ret = pthread_mutex_unlock(&g_glock);
    EXPECT_EQ("pthread_atfork Prepare", ret, 0);
    g_gparentFlag++;
}

static void Child(void)
{
    int ret = pthread_mutex_unlock(&g_glock);
    EXPECT_EQ("pthread_atfork Prepare", ret, 0);
    g_gchildFlag++;
}

static void* ThreadFun(void* arg)
{
#ifdef FEATURE_PTHREAD_CANCEL
    while (1) {
        pthread_testcancel();
        pthread_mutex_lock(&g_glock);
        sleep(TEST_THREAD_SLEEP);
        pthread_mutex_unlock(&g_glock);
        sleep(1);
    }
#else
    pthread_mutex_lock(&g_glock);
    sleep(TEST_THREAD_SLEEP);
    pthread_mutex_unlock(&g_glock);
    sleep(1);
#endif
    return nullptr;
}

/**
 * @tc.name      : PthreadAtfork0100
 * @tc.desc      : Provide a callback to test the relationship between pthread_atfork and fork
 * @tc.level     : Level 1
 */
void PthreadAtfork0100(void)
{
    ResetData();
#ifdef FEATURE_PTHREAD_CANCEL
    pthread_setcancelstate(PTHREAD_CANCEL_ENABLE, nullptr);
    pthread_setcanceltype(PTHREAD_CANCEL_ASYNCHRONOUS, nullptr);
#endif
    pthread_t tid;
    int ret = pthread_create(&tid, nullptr, ThreadFun, nullptr);
    EXPECT_EQ("PthreadAtfork0100", ret, CMPFLAG);
    if (ret != 0) {
        return;
    }

    ret = pthread_atfork(Prepare, Parent, Child);
    EXPECT_EQ("PthreadAtfork0100", ret, CMPFLAG);
    if (ret != 0) {
        return;
    }
    sleep(TEST_THREAD_SLEEP + 1);

    pid_t pid = fork();
    if (pid == 0) {
        pthread_mutex_lock(&g_glock);
        sleep(1);
        pthread_mutex_unlock(&g_glock);
        EXPECT_EQ("PthreadAtfork0100", g_gchildFlag, 1);
        _exit(0);
    } else if (pid > 0) {
#ifdef FEATURE_PTHREAD_CANCEL
        wait(nullptr);
        pthread_cancel(tid);
#endif
        pthread_join(tid, nullptr);

        EXPECT_EQ("PthreadAtfork0100", g_gprepareFlag, 1);
        EXPECT_EQ("PthreadAtfork0100", g_gparentFlag, 1);
    } else {
        EXPECT_FALSE("PthreadAtfork0100", 1);
    }
}

/**
 * @tc.name      : PthreadAtfork0200
 * @tc.desc      : No callback is provided, test the relationship between pthread_atfork and fork
 * @tc.level     : Level 2
 */
void PthreadAtfork0200(void)
{
    ResetData();
    int ret = pthread_atfork(nullptr, nullptr, nullptr);
    EXPECT_EQ("PthreadAtfork0200", ret, CMPFLAG);
    if (ret != 0) {
        return;
    }

    pid_t pid = fork();
    if (pid == 0) {
        EXPECT_EQ("PthreadAtfork0200", g_gchildFlag, 0);
        _exit(0);
    } else if (pid > 0) {
        wait(nullptr);

        EXPECT_EQ("PthreadAtfork0200", g_gprepareFlag, 0);
        EXPECT_EQ("PthreadAtfork0200", g_gparentFlag, 0);
    } else {
        EXPECT_FALSE("PthreadAtfork0200", 1);
    }
}

static int PthreadAtforkTestImpl(void)
{
    PthreadAtfork0200();
    PthreadAtfork0100();
    return T_STATUS;
}

int PthreadAtforkTest(void)
{
    return PthreadAtforkTestImpl();
}
