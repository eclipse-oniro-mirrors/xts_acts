/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
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
#include <dlfcn.h>
#include <sys/timex.h>
#include "functionalext.h"

void ExceptionHandler(int sig)
{
    exit(T_STATUS);
}

using ClockAdjtime64Func = int (*)(clockid_t, struct timex*);
constexpr const char* CLOCK_ADJTIME64_SYMBOL = "__clock_adjtime64";

/**
 * @tc.name      : ClockAdjtime0100
 * @tc.desc      : Verify that the kernel time can be adjusted (all parameters are valid, clock_id is CLOCK_REALTIME)
 * @tc.level     : Level 0
 */
void ClockAdjtime0100(void)
{
    struct timex tx;
    memset(&tx, 0, sizeof(tx));

    int result = clock_adjtime(CLOCK_REALTIME, &tx);
    EXPECT_NE("ClockAdjtime0100", result, -1);
}

/**
 * @tc.name      : ClockAdjtime0200
 * @tc.desc      : Verify that the kernel time can not be adjusted (each parameter is valid, clock_id is
 *                 CLOCK_MONOTONIC)
 * @tc.level     : Level 2
 */
void ClockAdjtime0200(void)
{
    struct timex tx = { ADJ_OFFSET_SS_READ };

    int result = clock_adjtime(CLOCK_MONOTONIC, &tx);
    EXPECT_EQ("ClockAdjtime0200", result, -1);
}

/**
 * @tc.name      : ClockAdjtime0300
 * @tc.desc      : Verify that the kernel time can not be adjusted (all parameters are valid, clock_id is
 *                 CLOCK_PROCESS_CPUTIME_ID)
 * @tc.level     : Level 2
 */
void ClockAdjtime0300(void)
{
    struct timex tx;
    memset(&tx, 0, sizeof(tx));

    int result = clock_adjtime(CLOCK_PROCESS_CPUTIME_ID, &tx);
    EXPECT_EQ("ClockAdjtime0300", result, -1);
}

/**
 * @tc.name      : ClockAdjtime0400
 * @tc.desc      : Verify that the kernel time can not be adjusted (all parameters are valid, clock_id is
 *                 CLOCK_THREAD_CPUTIME_ID)
 * @tc.level     : Level 2
 */
void ClockAdjtime0400(void)
{
    struct timex tx = { 0 };
    memset(&tx, 0, sizeof(tx));

    int result = clock_adjtime(CLOCK_THREAD_CPUTIME_ID, &tx);
    EXPECT_EQ("ClockAdjtime0400", result, -1);
}

/**
 * @tc.name      : ClockAdjtime0500
 * @tc.desc      : Verify that kernel time cannot be adjusted (tx parameter invalid)
 * @tc.level     : Level 2
 */
void ClockAdjtime0500(void)
{
    signal(SIGSEGV, ExceptionHandler);

    errno = 0;
    int result = clock_adjtime(CLOCK_REALTIME, nullptr);
    EXPECT_EQ("ClockAdjtime0500", result, -1);
    EXPECT_EQ("ClockAdjtime0500", errno, EFAULT);
}

/**
 * @tc.name      : ClockAdjtime640100
 * @tc.desc      : Verify that the kernel time can be adjusted (all parameters are valid, clock_id is CLOCK_REALTIME)
 * @tc.level     : Level 0
 */
void ClockAdjtime640100(void)
{
    ClockAdjtime64Func clockAdjtime64 =
        reinterpret_cast<ClockAdjtime64Func>(dlsym(RTLD_DEFAULT, CLOCK_ADJTIME64_SYMBOL));
    if (clockAdjtime64 == nullptr) {
        t_error("ClockAdjtime640100 dlsym __clock_adjtime64 failed\n");
        return;
    }
    struct timex tx;
    memset(&tx, 0, sizeof(tx));

    int result = clockAdjtime64(CLOCK_REALTIME, &tx);
    EXPECT_NE("ClockAdjtime640100", result, -1);
}

static int ClockAdjtimeTestWithArgs(int argc, char* argv[])
{
    ClockAdjtime0100();
    ClockAdjtime0200();
    ClockAdjtime0300();
    ClockAdjtime0400();
    ClockAdjtime0500();
    ClockAdjtime640100();
    return T_STATUS;
}

int ClockAdjtimeTest(void)
{
    static char libcProg[] = "libc_test";
    char* libcArgv[] = { libcProg, nullptr };
    return ClockAdjtimeTestWithArgs(1, libcArgv);
}

int ClockAdjtimeTestCompat(void)
{
    return ClockAdjtimeTest();
}
