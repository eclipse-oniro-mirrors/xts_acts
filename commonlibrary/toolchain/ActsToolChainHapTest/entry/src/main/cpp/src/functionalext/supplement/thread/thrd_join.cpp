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
#include <cstdlib>
#include <threads.h>
#include "test.h"
#include <sys/wait.h>
#include <pthread.h>
#include "functionalext.h"

static int g_count = 0;

static void ExceptionHandler(int sig)
{
    exit(g_tStatus);
}

static int Threadfunc(void *arg)
{
    g_count++;
    return 0;
}

/**
 * @tc.name      : ThrdJoin0100
 * @tc.desc      : Blocks current thread until it identified by thr finishes execution with no return value
 * @tc.level     : Level 0
 */
void ThrdJoin0100(void)
{
    thrd_t id;
    int result = thrd_create(&id, Threadfunc, nullptr);
    if (result != thrd_success) {
        t_error("%s thrd_create failed", __func__);
    }

    struct timespec sleepTime = {.tv_nsec = 1000000};
    result = thrd_sleep(&sleepTime, nullptr);
    if (result != 0) {
        t_error("%s thrd_sleep failed", __func__);
    }

    result = thrd_join(id, nullptr);
    if (result != thrd_success) {
        t_error("%s thrd_join failed", __func__);
    }

    if (g_count != 1) {
        t_error("%s failed, g_count is %d", __func__, g_count);
    }
    g_count = 0;
}

/**
 * @tc.name      : ThrdJoin0200
 * @tc.desc      : Blocks current thread until it identified by thr finishes execution with return value
 * @tc.level     : Level 1
 */
void ThrdJoin0200(void)
{
    thrd_t id;
    int ret = 1;
    int result = thrd_create(&id, Threadfunc, nullptr);
    if (result != thrd_success) {
        t_error("%s thrd_create failed", __func__);
    }

    struct timespec sleepTime = {.tv_nsec = 1000000};
    result = thrd_sleep(&sleepTime, nullptr);
    if (result != 0) {
        t_error("%s thrd_sleep failed", __func__);
    }

    result = thrd_join(id, &ret);
    if (result != thrd_success) {
        t_error("%s thrd_join failed", __func__);
    }

    if (ret != 0) {
        t_error("%s return value failed", __func__);
    }

    if (g_count != 1) {
        t_error("%s failed, g_count is %d", __func__, g_count);
    }
    g_count = 0;
}

/**
 * @tc.name      : ThrdJoin0300
 * @tc.desc      : Invalid parameter test
 * @tc.level     : Level 2
 */
void ThrdJoin0300(void)
{
    pid_t pid = fork();
    if (pid == -1) {
        t_error("ThrdJoin0300: Error forking process");
    } else if (pid == 0) {
        (void)thrd_join(0, nullptr);
    } else {
        int status;
        waitpid(pid, &status, 0);
        if (WIFSIGNALED(status)) {
            int sig = WTERMSIG(status);
            EXPECT_EQ("ThrdJoin0300", SIGABRT, sig);
        }
    }
}

static int ThrdJoinTestImpl(int argc, char *argv[])
{
    ThrdJoin0100();
    ThrdJoin0200();
    ThrdJoin0300();
    return g_tStatus;
}

int ThrdJoinTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return ThrdJoinTestImpl(1, libcArgv);
}
