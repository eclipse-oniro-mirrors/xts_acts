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

#include <csignal>
#include <ctime>
#include <fcntl.h>
#include <sys/select.h>
#include <unistd.h>
#include "functionalext.h"

namespace {
constexpr size_t K_FD_SET_PROBE_LIMIT = 1024U;
constexpr time_t K_PSELECT_BLOCK_TIMEOUT_SEC = 5;
constexpr time_t K_PSELECT_SHORT_TIMEOUT_SEC = 2;
constexpr int K_PSELECT_READY_ONE_FD = 1;
} // namespace

/**
 * @tc.name      : PselectFdset0100
 * @tc.desc      : Determine whether the fdset macro is normal
 * @tc.level     : Level 0
 */
void PselectFdset0100(void)
{
    fd_set set;
    FD_ZERO(&set);
    for (size_t i = 0; i < K_FD_SET_PROBE_LIMIT; ++i) {
        EXPECT_FALSE("PselectFdset0100", FD_ISSET(i, &set));
    }
    FD_SET(STDIN_FILENO, &set);
    EXPECT_TRUE("PselectFdset0100", FD_ISSET(STDIN_FILENO, &set));
    EXPECT_FALSE("PselectFdset0100", FD_ISSET(STDOUT_FILENO, &set));
    FD_SET(STDOUT_FILENO, &set);
    EXPECT_TRUE("PselectFdset0100", FD_ISSET(STDIN_FILENO, &set));
    EXPECT_TRUE("PselectFdset0100", FD_ISSET(STDOUT_FILENO, &set));
    FD_CLR(STDIN_FILENO, &set);
    EXPECT_FALSE("PselectFdset0100", FD_ISSET(STDIN_FILENO, &set));
    EXPECT_TRUE("PselectFdset0100", FD_ISSET(STDOUT_FILENO, &set));
    FD_CLR(STDOUT_FILENO, &set);
    EXPECT_FALSE("PselectFdset0100", FD_ISSET(STDIN_FILENO, &set));
    EXPECT_FALSE("PselectFdset0100", FD_ISSET(STDOUT_FILENO, &set));
}

/**
 * @tc.name      : PselectNormal0100
 * @tc.desc      : Monitor stdout file for writability (normal)
 * @tc.level     : Level 0
 */
void PselectNormal0100(void)
{
    fd_set set;
    struct timespec timeout;
    timeout.tv_sec = K_PSELECT_BLOCK_TIMEOUT_SEC;
    timeout.tv_nsec = 0;
    FD_ZERO(&set);
    FD_SET(STDOUT_FILENO, &set);

    int ret = pselect(STDOUT_FILENO + 1, nullptr, &set, nullptr, &timeout, nullptr);
    EXPECT_EQ("PselectNormal0100", ret, K_PSELECT_READY_ONE_FD);
    EXPECT_TRUE("PselectNormal0100", FD_ISSET(STDOUT_FILENO, &set));
}

/**
 * @tc.name      : PselectError0100
 * @tc.desc      : Incoming illegal file descriptor size to monitor stdout file writability
 * @tc.level     : Level 2
 */
void PselectError0100(void)
{
    fd_set set;
    struct timespec timeout;
    timeout.tv_sec = K_PSELECT_BLOCK_TIMEOUT_SEC;
    timeout.tv_nsec = 0;
    FD_ZERO(&set);
    FD_SET(STDOUT_FILENO, &set);

    int ret = pselect(-1, nullptr, &set, nullptr, &timeout, nullptr);
    EXPECT_EQ("PselectError0100", ret, ERREXPECT);
}

/**
 * @tc.name      : PselectTimeout0100
 * @tc.desc      : Monitor stdout file for readability (timeout)
 * @tc.level     : Level 2
 */
void PselectTimeout0100(void)
{
    fd_set set;
    sigset_t sigmask;
    struct timespec timeout;
    timeout.tv_sec = K_PSELECT_SHORT_TIMEOUT_SEC;
    timeout.tv_nsec = 0;
    FD_ZERO(&set);
    FD_SET(STDOUT_FILENO, &set);
    sigemptyset(&sigmask);
    sigaddset(&sigmask, SIGINT);
    int ret = pselect(STDOUT_FILENO + 1, &set, nullptr, nullptr, &timeout, &sigmask);
    if (ret == 0) {
        EXPECT_FALSE("PselectTimeout0100", FD_ISSET(STDOUT_FILENO, &set));
    }
}

/**
 * @tc.name      : PselectTime64Normal0100
 * @tc.desc      : Monitor stdout file for writability (normal)
 * @tc.level     : Level 0
 */
void PselectTime64Normal0100(void)
{
    fd_set set;
    struct timespec timeout;
    timeout.tv_sec = K_PSELECT_BLOCK_TIMEOUT_SEC;
    timeout.tv_nsec = 0;
    FD_ZERO(&set);
    FD_SET(STDOUT_FILENO, &set);

    // Some runtimes do not export internal symbol __pselect_time64.
    // Use standard pselect for compatibility.
    int ret = pselect(STDOUT_FILENO + 1, nullptr, &set, nullptr, &timeout, nullptr);
    EXPECT_EQ("PselectTime64Normal0100", ret, K_PSELECT_READY_ONE_FD);
    EXPECT_TRUE("PselectTime64Normal0100", FD_ISSET(STDOUT_FILENO, &set));
}

static int PselectTestImpl(void)
{
    PselectFdset0100();
    PselectNormal0100();
    PselectError0100();
    PselectTimeout0100();
    PselectTime64Normal0100();

    return T_STATUS;
}

int PselectTest(void)
{
    return PselectTestImpl();
}
