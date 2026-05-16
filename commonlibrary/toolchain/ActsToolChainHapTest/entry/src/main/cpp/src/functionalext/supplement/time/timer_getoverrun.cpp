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
#include <cerrno>
#include <csignal>
#include <ctime>
#include <unistd.h>

#include "test.h"
#define SIGNUM (40)
#define USEC_DELAY (1000000)
#define NSEC_DELAY (1000000)
#define TIMER_FLAG (0)
#define SLEEP_SECONDS (1)
#define FAILURE_CODE (-1)
static int g_count = 0;
static timer_t g_timerid;

static void Handler(int sig)
{
    g_count++;
    usleep(USEC_DELAY);
    int ret = timer_getoverrun(g_timerid);
    if (ret < 0) {
        t_error("%s timer_getoverrun failed, ret is %d\n", __func__, ret);
    }
    return;
}

/**
 * @tc.name      : TimerGetoverrun0100
 * @tc.desc      : Get overrun count for a per-process timer
 * @tc.level     : Level 0
 */
void TimerGetoverrun0100(void)
{
    struct sigevent sev;

    sev.sigev_notify = SIGEV_SIGNAL;
    sev.sigev_signo = SIGNUM;
    sev.sigev_value.sival_ptr = &g_timerid;

    (void)signal(SIGNUM, Handler);

    int result = timer_create(CLOCK_REALTIME, &sev, &g_timerid);
    if (result != 0) {
        t_error("%s failed: result = %d\n", __func__, result);
    }

    struct itimerspec its;
    its.it_value.tv_sec = TIMER_FLAG;
    its.it_value.tv_nsec = NSEC_DELAY;
    its.it_interval.tv_sec = TIMER_FLAG;
    its.it_interval.tv_nsec = TIMER_FLAG;

    result = timer_settime(g_timerid, TIMER_FLAG, &its, nullptr);
    if (result != 0) {
        t_error("%s failed: result = %d\n", __func__, result);
    }

    while (g_count <= TIMER_FLAG) {
        sleep(SLEEP_SECONDS);
    }
    result = timer_delete(g_timerid);
    if (result != 0) {
        t_error("%s failed: result = %d\n", __func__, result);
    }
}

/**
 * @tc.name      : TimerGetoverrun0200
 * @tc.desc      : Invalid timerid
 * @tc.level     : Level 2
 */
void TimerGetoverrun0200(void)
{
    int result = timer_getoverrun(nullptr);
    if (result != FAILURE_CODE) {
        t_error("%s timer_getoverrun failed, ret is %d\n", __func__, result);
    }
}

static int TimerGetoverrunTestImpl(int argc, char *argv[])
{
    TimerGetoverrun0100();
    TimerGetoverrun0200();

    return T_STATUS;
}

int TimerGetoverrunTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return TimerGetoverrunTestImpl(1, libcArgv);
}
