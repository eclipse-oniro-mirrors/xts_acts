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

#include <cerrno>
#include <csignal>
#include <cstdlib>
#include <ctime>
#include <unistd.h>

#include "test.h"
#include "time64_functions.h"

#define SIGNUM 40
static int g_count = 0;

static void Handler(int sig)
{
    g_count++;

    return;
}

static void ExceptionHandler(int sig)
{
    exit(g_tStatus);
}

/**
 * @tc.name      : TimerSettime0100
 * @tc.desc      : arms the timer
 * @tc.level     : Level 0
 */
void TimerSettime0100(void)
{
    struct sigevent sev;
    timer_t timerid;

    sev.sigev_notify = SIGEV_SIGNAL;
    sev.sigev_signo = SIGNUM;
    sev.sigev_value.sival_ptr = &timerid;

    (void)signal(SIGNUM, Handler);

    int result = timer_create(CLOCK_REALTIME, &sev, &timerid);
    if (result != 0) {
        t_error("%s failed: result = %d\n", __func__, result);
    }

    struct itimerspec its;
    its.it_value.tv_sec = 1;
    its.it_value.tv_nsec = 0;
    its.it_interval.tv_sec = 0;
    its.it_interval.tv_nsec = 0;

    result = timer_settime(timerid, 0, &its, nullptr);
    if (result != 0) {
        t_error("%s failed: result = %d\n", __func__, result);
    }

    while (g_count <= 0) {
        sleep(1);
    }

    result = timer_delete(timerid);
    if (result != 0) {
        t_error("%s failed: result = %d\n", __func__, result);
    }
}

/**
 * @tc.name      : TimerSettime0200
 * @tc.desc      : arms the timer with invalid parameters
 * @tc.level     : Level 2
 */
void TimerSettime0200(void)
{
    (void)signal(SIGSEGV, ExceptionHandler);

    timer_settime(nullptr, 0, nullptr, nullptr);
}

/**
 * @tc.name      : TimerSettime640100
 * @tc.desc      : arms the timer
 * @tc.level     : Level 0
 */
void TimerSettime640100(void)
{
    struct sigevent sev;
    timer_t timerid;

    sev.sigev_notify = SIGEV_SIGNAL;
    sev.sigev_signo = SIGNUM;
    sev.sigev_value.sival_ptr = &timerid;

    (void)signal(SIGNUM, Handler);

    int result = timer_create(CLOCK_REALTIME, &sev, &timerid);
    if (result != 0) {
        t_error("%s failed: result = %d\n", __func__, result);
    }

    struct itimerspec its;
    its.it_value.tv_sec = 1;
    its.it_value.tv_nsec = 0;
    its.it_interval.tv_sec = 0;
    its.it_interval.tv_nsec = 0;

    result = TimerSettime64(timerid, 0, &its, NULL);
    if (result != 0) {
        t_error("%s failed: result = %d\n", __func__, result);
    }

    while (g_count <= 0) {
        sleep(1);
    }

    result = timer_delete(timerid);
    if (result != 0) {
        t_error("%s failed: result = %d\n", __func__, result);
    }
}

static int TimerSettimeTestImpl(int argc, char *argv[])
{
    TimerSettime0100();
    TimerSettime0200();
    TimerSettime640100();

    return T_STATUS;
}

int TimerSettimeTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return TimerSettimeTestImpl(1, libcArgv);
}
