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

// Solve the build error of this test code when importing the header file <sys/epoll.h>
#ifndef EPOLL_PWAIT_TEST
#define EPOLL_PWAIT_TEST
#endif

#include <cerrno>
#include <csignal>
#include <sys/epoll.h>
#include <unistd.h>
#include "test.h"

/**
 * @tc.name      : EpollPwait0100
 * @tc.desc      : epoll_pwait without a sigset
 * @tc.level     : Level 0
 */
void EpollPwait0100(void)
{
    int epollFd = epoll_create(1);
    if (epollFd == -1) {
        t_error("%s epoll_create failed\n", __func__);
    }

    struct epoll_event events[1];
    int result = epoll_pwait(epollFd, events, 1, 1, nullptr);
    if (result != 0) {
        t_error("%s epoll_pwait failed\n", __func__);
    }
    (void)close(epollFd);
}

/**
 * @tc.name      : EpollPwait0200
 * @tc.desc      : epoll_pwait with a sigset
 * @tc.level     : Level 0
 */
void EpollPwait0200(void)
{
    int epollFd = epoll_create(1);
    if (epollFd == -1) {
        t_error("%s epoll_create failed\n", __func__);
    }

    struct epoll_event events[1];
    sigset_t ss;
    sigemptyset(&ss);
    sigaddset(&ss, SIGPIPE);

    int result = epoll_pwait(epollFd, events, 1, 1, &ss);
    if (result != 0) {
        t_error("%s epoll_pwait failed\n", __func__);
    }
    (void)close(epollFd);
}

static int EpollPwaitTestWithArgs(int argc, char* argv[])
{
    EpollPwait0100();
    EpollPwait0200();
    return T_STATUS;
}

int EpollPwaitTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return EpollPwaitTestWithArgs(1, libcArgvStub);
}

#ifdef EPOLL_PWAIT_TEST
#undef EPOLL_PWAIT_TEST
#endif