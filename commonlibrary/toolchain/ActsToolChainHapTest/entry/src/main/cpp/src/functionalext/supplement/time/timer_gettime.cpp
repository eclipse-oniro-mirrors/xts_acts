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
#include <cstdio>
#include <cstdlib>
#include <ctime>
#include "test.h"
#include "time64_functions.h"

#define NANOSECONDS (1000000000)
static int g_count = 0;

static void TimerHandler(int sig)
{
    g_count++;
    return;
}

static void ExceptionHandler(int sig)
{
    exit(g_tStatus);
}

/**
 * @tc.name      : TimerGettime0100
 * @tc.desc      : Get the remaining time of the timer
 * @tc.level     : Level 0
 */
void TimerGettime0100(void)
{
    timer_t timerid;
    struct sigevent sev;
    struct itimerspec its;
    struct itimerspec tmp;

    sev.sigev_notify = SIGEV_SIGNAL;
    sev.sigev_signo = SIGUSR1;
    sev.sigev_value.sival_ptr = &timerid;
    (void)signal(SIGUSR1, TimerHandler);

    if (timer_create(CLOCK_MONOTONIC, &sev, &timerid) == -1) {
        t_error("%s timer create failed", __func__);
        return;
    }

    its.it_value.tv_sec = 1;
    its.it_value.tv_nsec = 0;
    its.it_interval.tv_sec = 1;
    its.it_interval.tv_nsec = 0;

    if (timer_settime(timerid, 0, &its, nullptr) == -1) {
        t_error("%s timer set time failed", __func__);
        return;
    }

    if (timer_gettime(timerid, &tmp) == -1 && errno == EINVAL) {
        t_error("%s timer gettimer failed", __func__);
    }

    if (tmp.it_value.tv_sec >= 1 || tmp.it_value.tv_nsec >= NANOSECONDS) {
        t_error("%s get time failed", __func__);
    }

    while (g_count <= 0) {
        sleep(1);
    }

    if (timer_delete(timerid) != 0) {
        t_error("%s timer_delete failed", __func__);
    }
}

/**
 * @tc.name      : TimerGettime0200
 * @tc.desc      : The return value of the function when the parameter is abnormal
 * @tc.level     : Level 2
 */
void TimerGettime0200(void)
{
    int result = timer_gettime(nullptr, nullptr);
    if (result != -1 && errno != EINVAL) {
        t_error("%s failed result = %d", __func__, result);
    }
}

/**
 * @tc.name      : TimerGettime640200
 * @tc.desc      : The return value of the function when the parameter is abnormal
 * @tc.level     : Level 2
 */
void TimerGettime640200(void)
{
    int result = TimerGettime64(nullptr, nullptr);
    if (result != -1 && errno != EINVAL) {
        t_error("%s failed result = %d", __func__, result);
    }
}

static int TimerGettimeTestImpl(int argc, char *argv[])
{
    TimerGettime0100();
    TimerGettime0200();
    TimerGettime640200();
    return T_STATUS;
}

int TimerGettimeTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return TimerGettimeTestImpl(1, libcArgv);
}
