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

#include <csignal>
#include <cstdlib>
#include <threads.h>
#include "test.h"

static int g_count = 0;

static void ExceptionHandler(int sig)
{
    exit(g_tStatus);
}

static int Threadfunc(void *arg)
{
    g_count++;
    int ret = thrd_detach(thrd_current());
    if (ret != thrd_success) {
        t_error("%s thrd_detach failed", __func__);
    }

    thrd_exit(thrd_success);
}

/**
 * @tc.name      : thrd_detach_0100
 * @tc.desc      : Detaches the thread identified by thr from the current environment
 * @tc.level     : Level 0
 */
void ThrdDetach0100(void)
{
    thrd_t id;
    int result;

    result = thrd_create(&id, Threadfunc, nullptr);
    if (result != thrd_success) {
        t_error("%s thrd_create failed", __func__);
    }

    struct timespec sleepTime = {.tv_sec = 1};
    result = thrd_sleep(&sleepTime, nullptr);
    if (result != 0) {
        t_error("%s thrd_sleep failed", __func__);
    }

    if (g_count != 1) {
        t_error("%s failed, g_count is %d", __func__, g_count);
    }
    g_count = 0;
}

/**
 * @tc.name      : thrd_detach_0200
 * @tc.desc      : Use thrd_join after thrd_detach
 * @tc.level     : Level 2
 */
void ThrdDetach0200(void)
{
    (void)signal(SIGSEGV, ExceptionHandler);

    thrd_t id;
    int result;

    result = thrd_create(&id, Threadfunc, nullptr);
    if (result != thrd_success) {
        t_error("%s thrd_create failed", __func__);
    }

    struct timespec sleepTime = {.tv_sec = 1};
    result = thrd_sleep(&sleepTime, nullptr);
    if (result != 0) {
        t_error("%s thrd_sleep failed", __func__);
    }

    result = thrd_join(id, nullptr);
    if (result == thrd_success) {
        t_error("%s thrd_join should fail", __func__);
    }

    if (g_count != 1) {
        t_error("%s failed, g_count is %d", __func__, g_count);
    }
    g_count = 0;
}

static int ThrdDetachTestImpl(int argc, char *argv[])
{
    ThrdDetach0100();
    ThrdDetach0200();
    return g_tStatus;
}

int ThrdDetachTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return ThrdDetachTestImpl(1, libcArgv);
}
