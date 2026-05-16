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
#include "time64_functions.h"

#define THRD_SLEEP_INVALID_PARAM (-2)

static int g_count = 0;

static void ExceptionHandler(int sig)
{
    exit(g_tStatus);
}

static int Threadfunc(void *arg)
{
    g_count++;

    struct timespec const *tl = (struct timespec const *)arg;
    if (thrd_sleep(tl, nullptr) != 0) {
        t_error("%s thrd_sleep failed", __func__);
    }

    thrd_exit(thrd_success);
}

/**
 * @tc.name      : thrd_sleep_0100
 * @tc.desc      : Thread waits for 1s
 * @tc.level     : Level 0
 */
void ThrdSleep0100(void)
{
    int result;
    thrd_t id;
    struct timespec ts = {.tv_sec = 1};

    result = thrd_create(&id, Threadfunc, static_cast<void *>(&ts));
    if (result != thrd_success) {
        t_error("%s thrd_create failed", __func__);
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
 * @tc.name      : thrd_sleep_0200
 * @tc.desc      : Negative value
 * @tc.level     : Level 1
 */
void ThrdSleep0200(void)
{
    struct timespec ts;
    ts.tv_sec = -1;
    ts.tv_nsec = 0; // 必须初始化
    int result = thrd_sleep(&ts, nullptr);
    if (result != THRD_SLEEP_INVALID_PARAM) {
        t_error("%s negative value", __func__);
    }
}

/**
 * @tc.name      : thrd_sleep_0300
 * @tc.desc      : Invalid parameter test
 * @tc.level     : Level 2
 */
void ThrdSleep0300(void)
{
    (void)signal(SIGSEGV, ExceptionHandler);

    (void)thrd_sleep(nullptr, nullptr);
}

/**
 * @tc.name      : thrd_sleep_time64_0200
 * @tc.desc      : Negative value
 * @tc.level     : Level 1
 */
void ThrdSleepTime640200(void)
{
    struct timespec ts;
    ts.tv_sec = -1;
    ts.tv_nsec = 0; // 必须初始化
    int result = ThrdSleepTime64(&ts, nullptr);
    if (result != THRD_SLEEP_INVALID_PARAM) {
        t_error("%s negative value", __func__);
    }
}

static int ThrdSleepTestImpl(int argc, char *argv[])
{
    ThrdSleep0100();
    ThrdSleep0200();
    ThrdSleep0300();
    ThrdSleepTime640200();
    return g_tStatus;
}

int ThrdSleepTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return ThrdSleepTestImpl(1, libcArgv);
}
