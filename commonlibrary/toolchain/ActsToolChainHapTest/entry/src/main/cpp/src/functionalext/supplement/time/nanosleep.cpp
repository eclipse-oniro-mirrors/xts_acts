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
#include "time64_functions.h"

/*
 * @tc.name      : nanosleep_0100
 * @tc.desc      : Verify that the execution of the program can be paused
 * @tc.level     : Level 0
 */
void Nanosleep0100(void)
{
    struct timespec nSleep;
    nSleep.tv_sec = 0;
    nSleep.tv_nsec = 5e8L;
    int data = nanosleep(&nSleep, nullptr);
    EXPECT_EQ("nanosleep_0100", data, 0);
}

/*
 * @tc.name      : nanosleep_time64_0100
 * @tc.desc      : Verify that the execution of the program can be paused with time64
 * @tc.level     : Level 0
 */
void NanosleepTime640100(void)
{
    struct timespec nSleep;
    nSleep.tv_sec = 0;
    nSleep.tv_nsec = 5e8L;
    int data = NanosleepTime64(&nSleep, nullptr);
    EXPECT_EQ("nanosleep_time64_0100", data, 0);
}

static int NanosleepTestImpl(int argc, char *argv[])
{
    Nanosleep0100();
    NanosleepTime640100();
    return T_STATUS;
}

int NanosleepTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return NanosleepTestImpl(1, libcArgv);
}
