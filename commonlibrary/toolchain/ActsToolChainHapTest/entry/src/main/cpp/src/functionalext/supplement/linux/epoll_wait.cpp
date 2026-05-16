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
#include <sys/epoll.h>
#include <unistd.h>
#include "test.h"

/**
 * @tc.name      : EpollWait0100
 * @tc.desc      : Regular epoll_wait
 * @tc.level     : Level 0
 */
void EpollWait0100(void)
{
    int epollFd = epoll_create(1);
    if (epollFd == -1) {
        t_error("%s epoll_create failed\n", __func__);
    }

    struct epoll_event events[1];
    int result = epoll_wait(epollFd, events, 1, 1);
    if (result != 0) {
        t_error("%s epoll_pwait failed\n", __func__);
    }
    (void)close(epollFd);
}

static int EpollWaitTestWithArgs(int argc, char* argv[])
{
    EpollWait0100();
    return T_STATUS;
}

int EpollWaitTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return EpollWaitTestWithArgs(1, libcArgvStub);
}
