/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
#include <cstring>
#include <sys/wait.h>
#include <sys/select.h>
#include <sigchain.h>
#include "fortify_test.h"
#include "functionalext.h"
#include "test.h"

/**
 * @tc.name     : FdSet0010
 * @tc.desc     : test FD_SET with normal fd
 * @tc.level    : Level 1
 */
static void FdSet0010(void)
{
    fd_set readfds;
    FD_ZERO(&readfds);
    int sockfd = 0;
    FD_SET(sockfd, &readfds);
    EXPECT_EQ(FdSet0010, (&readfds)->fds_bits[0], 1);

    return;
}

/**
 * @tc.name     : fd_set_0020
 * @tc.desc     : test FD_SET with fd < 0
 * @tc.level    : Level 2
 */
static void FdSet0020(void)
{
    struct sigaction sigabrt = {
        .sa_handler = SignalHandler,
    };
    sigaction(SIGABRT, &sigabrt, nullptr);

    int status;
    int pid = fork();
    fd_set readfds;
    int sockfd = -1;
    switch (pid) {
        case -1:
            t_error("fork failed: %s\n", strerror(errno));
            break;
        case 0:
            FD_ZERO(&readfds);
            FD_SET(sockfd, &readfds);
            exit(0);
        default:
            waitpid(pid, &status, WUNTRACED);
            TEST(WIFEXITED(status) == 0);
            TEST(WIFSTOPPED(status) == 1);
            TEST(WSTOPSIG(status) == SIGSTOP);
            kill(pid, SIGCONT);
            break;
    }

    return;
}

/**
 * @tc.name     : fd_set_0030
 * @tc.desc     : test FD_SET with fd >= 1024
 * @tc.level    : Level 2
 */
static void FdSet0030(void)
{
    struct sigaction sigabrt = {
        .sa_handler = SignalHandler,
    };
    sigaction(SIGABRT, &sigabrt, nullptr);

    int status;
    int pid = fork();
    fd_set readfds;
    int sockfd = 1024;
    switch (pid) {
        case -1:
            t_error("fork failed: %s\n", strerror(errno));
            break;
        case 0:
            FD_ZERO(&readfds);
            FD_SET(sockfd, &readfds);
            exit(0);
        default:
            waitpid(pid, &status, WUNTRACED);
            TEST(WIFEXITED(status) == 0);
            TEST(WIFSTOPPED(status) == 1);
            TEST(WSTOPSIG(status) == SIGSTOP);
            kill(pid, SIGCONT);
            break;
    }

    return;
}

/**
 * @tc.name     : fd_clr_0010
 * @tc.desc     : test FD_CLR with normal fd
 * @tc.level    : Level 1
 */
static void FdClr0010(void)
{
    fd_set readfds;
    FD_ZERO(&readfds);
    int sockfd = 0;
    FD_SET(sockfd, &readfds);
    FD_CLR(sockfd, &readfds);
    EXPECT_EQ(FdSet0010, (&readfds)->fds_bits[0], 0);
    
    return;
}

/**
 * @tc.name     : fd_clr_0020
 * @tc.desc     : test FD_CLR with fd < 0
 * @tc.level    : Level 2
 */
static void FdClr0020(void)
{
    struct sigaction sigabrt = {
        .sa_handler = SignalHandler,
    };
    sigaction(SIGABRT, &sigabrt, nullptr);

    int status;
    int pid = fork();
    fd_set readfds;
    int sockfd = -1;
    switch (pid) {
        case -1:
            t_error("fork failed: %s\n", strerror(errno));
            break;
        case 0:
            FD_ZERO(&readfds);
            FD_CLR(sockfd, &readfds);
            exit(0);
        default:
            waitpid(pid, &status, WUNTRACED);
            TEST(WIFEXITED(status) == 0);
            TEST(WIFSTOPPED(status) == 1);
            TEST(WSTOPSIG(status) == SIGSTOP);
            kill(pid, SIGCONT);
            break;
    }

    return;
}

/**
 * @tc.name     : fd_clr_0030
 * @tc.desc     : test FD_CLR with fd >= 1024
 * @tc.level    : Level 2
 */
static void FdClr0030(void)
{
    struct sigaction sigabrt = {
        .sa_handler = SignalHandler,
    };
    sigaction(SIGABRT, &sigabrt, nullptr);

    int status;
    int pid = fork();
    fd_set readfds;
    int sockfd = 1024;
    switch (pid) {
        case -1:
            t_error("fork failed: %s\n", strerror(errno));
            break;
        case 0:
            FD_ZERO(&readfds);
            FD_CLR(sockfd, &readfds);
            exit(0);
        default:
            waitpid(pid, &status, WUNTRACED);
            TEST(WIFEXITED(status) == 0);
            TEST(WIFSTOPPED(status) == 1);
            TEST(WSTOPSIG(status) == SIGSTOP);
            kill(pid, SIGCONT);
            break;
    }

    return;
}

/**
 * @tc.name     : fd_isset_0010
 * @tc.desc     : test FD_ISSET with normal fd
 * @tc.level    : Level 1
 */
static void FdIsset0010(void)
{
    fd_set readfds;
    FD_ZERO(&readfds);
    int sockfd = 0;
    FD_SET(sockfd, &readfds);
    int res = FD_ISSET(sockfd, &readfds);
    EXPECT_EQ(FdSet0010, res, 1);
    
    return;
}

/**
 * @tc.name     : fd_isset_0020
 * @tc.desc     : test FD_ISSET with fd < 0
 * @tc.level    : Level 2
 */
static void FdIsset0020(void)
{
    fd_set readfds;
    FD_ZERO(&readfds);
    int sockfd = -1;
    int res = FD_ISSET(sockfd, &readfds);
    EXPECT_EQ(FdSet0010, res, 0);
    
    return;
}

/**
 * @tc.name     : fd_isset_0030
 * @tc.desc     : test FD_ISSET with fd >= 1024
 * @tc.level    : Level 2
 */
static void FdIsset0030(void)
{
    fd_set readfds;
    FD_ZERO(&readfds);
    int sockfd = 1024;
    int res = FD_ISSET(sockfd, &readfds);
    EXPECT_EQ(FdSet0010, res, 0);
    
    return;
}

static int SelectTestTestImpl(int argc, char *argv[])
{
    FdSet0010();
    FdSet0020();
    FdSet0030();
    FdClr0010();
    FdClr0020();
    FdClr0030();
    FdIsset0010();
    FdIsset0020();
    FdIsset0030();
    return g_tStatus;
}

int SelectTestTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return SelectTestTestImpl(1, libcArgv);
}
