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
#include "test.h"
#include "functionalext.h"

#define SLEEP_SECONDS (2)
#define EXPECTED_FLAG (1)

pthread_t g_pid;
static int g_flag = 0;

static void *ThreadFunc(void *arg)
{
    sleep(SLEEP_SECONDS);
    g_flag++;
    return nullptr;
}

/**
 * @tc.name      : PthreadJoin0100
 * @tc.desc      : The parameters are valid, verify that the main thread does not wait for other threads to end the
 * scene
 * @tc.level     : Level 0
 */
static void PthreadJoin0100(void)
{
    g_flag = 0;
    pthread_create(&g_pid, nullptr, ThreadFunc, nullptr);
    int result = pthread_join(g_pid, nullptr);
    if (result != 0) {
        t_error("%s pthread_join error get result is %d are not want 0\n", __func__, result);
    }
    if (g_flag != EXPECTED_FLAG) {
        t_error("%s pthread_join error get g_flag is %d are not want 1\n", __func__, g_flag);
    }
}

/**
 * @tc.name      : PthreadJoin0200
 * @tc.desc      : The input parameter pthread_t is nullptr, pthread_join() returns errno code ESRCH
 * @tc.level     : Level 0
 */
void PthreadJoin0200(void)
{
    pthread_t t = 0;
    int result = pthread_join(t, nullptr);
    if (result != ESRCH) {
        t_error("%s pthread_join error get result is %d are not want ESRCH\n", __func__, result);
    }
}

static int PthreadJoinTestImpl(int argc, char *argv[])
{
    PthreadJoin0100();
    PthreadJoin0200();
    return g_tStatus;
}

int PthreadJoinTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return PthreadJoinTestImpl(1, libcArgv);
}

