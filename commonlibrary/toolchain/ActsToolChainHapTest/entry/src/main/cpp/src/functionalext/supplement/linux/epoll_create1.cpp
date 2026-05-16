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
#ifndef EPOLL_CREAT_E1_TEST
#define EPOLL_CREAT_E1_TEST
#endif

#include <cerrno>
#include <fcntl.h>
#include <sys/epoll.h>
#include "test.h"

void CloseOnExec(int fd, bool enableCloseOnExec)
{
    int flags = fcntl(fd, F_GETFD);
    if (flags == -1) {
        t_error("%s fcntl failed\n", __func__);
    }
    if ((enableCloseOnExec ? FD_CLOEXEC : 0) != (flags & FD_CLOEXEC)) {
        t_error("%s failed, expect equal\n", __func__);
    }
}

/**
 * @tc.name      : EpollCreate10100
 * @tc.desc      : Returns a file descriptor referring to the new epoll instance
 * @tc.level     : Level 0
 */
void EpollCreate10100(void)
{
    errno = 0;

    int fd = epoll_create1(0);
    CloseOnExec(fd, false);
    close(fd);

    fd = epoll_create1(EPOLL_CLOEXEC);
    CloseOnExec(fd, true);
    close(fd);
}

static int EpollCreate1TestWithArgs(int argc, char* argv[])
{
    EpollCreate10100();
    return T_STATUS;
}

int EpollCreate1Test(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return EpollCreate1TestWithArgs(1, libcArgvStub);
}

#ifdef EPOLL_CREAT_E1_TEST
#undef EPOLL_CREAT_E1_TEST
#endif
