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

#include <ctime>
#include "functionalext.h"

/**
 * @tc.name      : ClockGetcpuclockid0100
 * @tc.desc      : Verify that the clock ID can be obtained when parameters are valid
 * @tc.level     : Level 0
 */
void ClockGetcpuclockid0100(void)
{
    clockid_t clk;
    struct timespec ts;
    pid_t pid = getppid();

    int result = clock_getcpuclockid(pid, &clk);
    EXPECT_EQ("ClockGetcpuclockid0100", result, 0);

    result = clock_gettime(clk, &ts);
    EXPECT_EQ("ClockGetcpuclockid0100", result, 0);
}

/**
 * @tc.name      : ClockGetcpuclockid0200
 * @tc.desc      : Verify could not get clock ID when pid parameter is invalid
 * @tc.level     : Level 2
 */
void ClockGetcpuclockid0200(void)
{
    errno = 0;
    clockid_t clk;

    int result = clock_getcpuclockid(65536, &clk);
    EXPECT_NE("ClockGetcpuclockid0200", result, 0);
}

static int ClockGetcpuclockidTestWithArgs(int argc, char* argv[])
{
    ClockGetcpuclockid0100();
    ClockGetcpuclockid0200();
    return T_STATUS;
}

int ClockGetcpuclockidTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return ClockGetcpuclockidTestWithArgs(1, libcArgvStub);
}
