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
#ifndef EPOLL_CREATE_TEST
#define EPOLL_CREATE_TEST
#endif

#include <cerrno>
#include <sys/epoll.h>
#include <unistd.h>
#include "test.h"

/**
 * @tc.name      : EpollCreate0100
 * @tc.desc      : Returns a file descriptor referring to the new epoll instance
 * @tc.level     : Level 0
 */
void EpollCreate0100(void)
{
    errno = 0;
    int epollFd = epoll_create(1);
    if (epollFd == -1) {
        t_error("%s epoll_create failed\n", __func__);
    }
    if (errno != 0) {
        t_error("%s errno is %d, not 0\n", __func__, errno);
    }
    (void)close(epollFd);
}

static int EpollCreateTestWithArgs(int argc, char* argv[])
{
    EpollCreate0100();
    return T_STATUS;
}

int EpollCreateTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return EpollCreateTestWithArgs(1, libcArgvStub);
}

#ifdef EPOLL_CREATE_TEST
#undef EPOLL_CREATE_TEST
#endif
