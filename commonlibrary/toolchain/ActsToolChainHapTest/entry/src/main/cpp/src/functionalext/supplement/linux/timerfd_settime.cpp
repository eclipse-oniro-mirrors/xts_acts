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
#include <sys/timerfd.h>
#include <ctime>
#include "test.h"
#include "time64_functions.h"

#define NANOSECOND (1000000000)
#define MICROSECONDS (1000000)
#define DATA_TWO (2)

static void ExceptionHandler(int sig)
{
    exit(g_tStatus);
}

/**
 * @tc.name      : TimerfdSettime0100
 * @tc.desc      : Start the timer specified by fd
 * @tc.level     : Level 0
 */
void TimerfdSettime0100(void)
{
    struct itimerspec its = {{0, 0}, {DATA_TWO, 0}};
    struct itimerspec val;
    int fd;
    int result;

    fd = timerfd_create(CLOCK_REALTIME, 0);
    if (fd < 0) {
        t_error("%s timerfd_create failed\n", __func__);
        return;
    }

    result = timerfd_settime(fd, 0, &its, nullptr);
    if (result != 0) {
        t_error("%s timerfd_settime failed\n", __func__);
        return;
    }

    result = usleep(MICROSECONDS);
    if (result != 0) {
        t_error("%s usleep failed\n", __func__);
        return;
    }

    result = timerfd_gettime(fd, &val);
    if (result != 0) {
        t_error("%s timerfd_gettime failed\n", __func__);
        return;
    }
    if (val.it_value.tv_nsec > NANOSECOND) {
        t_error("%s timerfd error\n");
    }
}

/**
 * @tc.name      : TimerfdSettime0200
 * @tc.desc      : arms the timer with invalid parameters
 * @tc.level     : Level 2
 */
void TimerfdSettime0200(void)
{
    (void)signal(SIGSEGV, ExceptionHandler);

    timerfd_settime(-1, 0, nullptr, nullptr);
}

/**
 * @tc.name      : TimerfdSettime640100
 * @tc.desc      : Start the timer specified by fd
 * @tc.level     : Level 0
 */
void TimerfdSettime640100(void)
{
    struct itimerspec its = {{0, 0}, {DATA_TWO, 0}};
    struct itimerspec val;
    int fd;
    int result;

    fd = timerfd_create(CLOCK_REALTIME, 0);
    if (fd < 0) {
        t_error("%s timerfd_create failed\n", __func__);
        return;
    }

    result = TimerfdSettime64(fd, 0, &its, nullptr);
    if (result != 0) {
        t_error("%s __timerfd_settime64 failed\n", __func__);
        return;
    }

    result = usleep(MICROSECONDS);
    if (result != 0) {
        t_error("%s usleep failed\n", __func__);
        return;
    }

    result = timerfd_gettime(fd, &val);
    if (result != 0) {
        t_error("%s timerfd_gettime failed\n", __func__);
        return;
    }
    if (val.it_value.tv_nsec > NANOSECOND) {
        t_error("%s timerfd error\n");
    }
}

static int TimerfdSettimeTestImpl(int argc, char *argv[])
{
    TimerfdSettime0100();
    TimerfdSettime0200();
    TimerfdSettime640100();
    return T_STATUS;
}

int TimerfdSettimeTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return TimerfdSettimeTestImpl(1, libcArgv);
}
