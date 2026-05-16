/**
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
#include <unistd.h>
#include "functionalext.h"

#define TEST_ALARM_TIME 2

int g_gtestPauseFlag = 0;
static void SignalFunc(int signum)
{
    if (signum == SIGALRM) {
        g_gtestPauseFlag = 1;
    }
}

/**
 * @tc.name      : Pause0100
 * @tc.desc      : Wake up a suspended process with a signal
 * @tc.level     : Level 0
 */
void Pause0100(void)
{
    struct sigaction act;
    act.sa_handler = SignalFunc;
    act.sa_flags = 0;
    sigaction(SIGALRM, &act, nullptr);

    alarm(TEST_ALARM_TIME);
    EXPECT_FALSE("Pause0100", g_gtestPauseFlag);
    int ret = pause();
    EXPECT_EQ("Pause0100", ret, ERREXPECT);
    EXPECT_EQ("Pause0100", errno, EINTR);
    EXPECT_TRUE("Pause0100", g_gtestPauseFlag);
}

static int PauseTestImpl(void)
{
    return T_STATUS;
}

int PauseTest(void)
{
    return PauseTestImpl();
}
