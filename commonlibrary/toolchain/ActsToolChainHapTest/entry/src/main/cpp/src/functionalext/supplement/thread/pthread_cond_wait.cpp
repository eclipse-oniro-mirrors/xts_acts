/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

#include <cstdio>
#include <pthread.h>
#include <unistd.h>
#include "test.h"

pthread_cond_t g_cond = PTHREAD_COND_INITIALIZER;
pthread_mutex_t g_mutex = PTHREAD_MUTEX_INITIALIZER;
int g_flag = 0;
pthread_t g_pid1;
pthread_t g_pid2;

void* Threadfunc1(void* arg)
{
    (void)arg;
    pthread_mutex_lock(&g_mutex);
    pthread_cond_wait(&g_cond, &g_mutex);
    g_flag++;
    pthread_mutex_unlock(&g_mutex);
    return nullptr;
}

void* Threadfunc2(void* arg)
{
    (void)arg;
    sleep(1);
    pthread_mutex_lock(&g_mutex);
    pthread_cond_signal(&g_cond);
    pthread_mutex_unlock(&g_mutex);
    return nullptr;
}

/**
 * @tc.name      : PthreadCondWait0100
 * @tc.desc      : The parameter is valid, verify that the condition variable is activated
 * @tc.level     : Level 0
 */
void PthreadCondWait0100(void)
{
    g_flag = 0;
    pthread_create(&g_pid1, nullptr, Threadfunc1, nullptr);
    pthread_create(&g_pid2, nullptr, Threadfunc2, nullptr);
    pthread_join(g_pid1, nullptr);
    pthread_join(g_pid2, nullptr);
    if (g_flag != 1) {
        t_error("PthreadCondWait0100 pthread_cond_wait error get g_flag is %d are not want 1\n", g_flag);
    }
}

static int PthreadCondWaitTestImpl(int argc, char* argv[])
{
    (void)argc;
    (void)argv;
    PthreadCondWait0100();
    return T_STATUS;
}

int PthreadCondWaitTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return PthreadCondWaitTestImpl(1, libcArgvStub);
}
