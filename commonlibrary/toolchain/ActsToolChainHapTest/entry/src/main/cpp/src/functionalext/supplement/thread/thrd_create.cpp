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
const char *SRC = "Hello";

static void ExceptionHandler(int sig)
{
    exit(g_tStatus);
}

static int Threadfunc(void *arg)
{
    (void)signal(SIGSEGV, ExceptionHandler);

    g_count++;
    thrd_exit(thrd_success);
}

/**
 * @tc.name      : ThrdCreate0100
 * @tc.desc      : Creates a new thread executing the function func
 * @tc.level     : Level 0
 */
void ThrdCreate0100(void)
{
    thrd_t id;
    int result = thrd_create(&id, Threadfunc, nullptr);
    if (result != thrd_success) {
        t_error("%s thrd_create failed", __func__);
    }

    struct timespec sleepTime = {.tv_sec = 1};
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
 * @tc.name      : ThrdCreate0200
 * @tc.desc      : Creates a new thread executing the function func(arg)
 * @tc.level     : Level 1
 */
void ThrdCreate0200(void)
{
    thrd_t id;
    int result = thrd_create(&id, Threadfunc, const_cast<char*>(SRC));
    if (result != thrd_success) {
        t_error("%s thrd_create failed", __func__);
    }

    struct timespec sleepTime = {.tv_sec = 1};
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
 * @tc.name      : ThrdCreate0300
 * @tc.desc      : exception test
 * @tc.level     : Level 2
 */
void ThrdCreate0300(void)
{
    (void)thrd_create(nullptr, Threadfunc, nullptr);
}

static int ThrdCreateTestImpl(int argc, char *argv[])
{
    ThrdCreate0100();
    ThrdCreate0200();
    ThrdCreate0300();
    return g_tStatus;
}

int ThrdCreateTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return ThrdCreateTestImpl(1, libcArgv);
}
