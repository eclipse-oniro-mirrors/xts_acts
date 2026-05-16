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
#include <ctime>
#include <sys/timerfd.h>
#include "test.h"

/**
 * @tc.name      : TimerfdCreate0100
 * @tc.desc      : Create timer descriptor
 * @tc.level     : Level 0
 */
void TimerfdCreate0100(void)
{
    errno = 0;
    int timerfd = timerfd_create(CLOCK_MONOTONIC, TFD_NONBLOCK | TFD_CLOEXEC);
    if (timerfd == -1 || errno != 0) {
        t_error("%s timerfd create failed", __func__);
        return;
    }
    close(timerfd);
}

/**
 * @tc.name      : TimerfdCreate0200
 * @tc.desc      : Create timer descriptor with different parameters
 * @tc.level     : Level 1
 */
void TimerfdCreate0200(void)
{
    errno = 0;
    int timerfd = timerfd_create(CLOCK_REALTIME, 0);
    if (timerfd == -1 || errno != 0) {
        t_error("%s timerfd create failed", __func__);
        return;
    }
    close(timerfd);
}

/**
 * @tc.name      : TimerfdCreate0300
 * @tc.desc      : Exception parameter
 * @tc.level     : Level 2
 */
void TimerfdCreate0300(void)
{
    int timerfd = timerfd_create(-1, -1);
    if (timerfd != -1) {
        t_error("%s failed, timerfd is %d", __func__, timerfd);
        return;
    }
    close(timerfd);
}

static int TimerfdCreateTestImpl(int argc, char* argv[])
{
    TimerfdCreate0100();
    TimerfdCreate0200();
    TimerfdCreate0300();
    return T_STATUS;
}

int TimerfdCreateTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return TimerfdCreateTestImpl(1, libcArgvStub);
}
