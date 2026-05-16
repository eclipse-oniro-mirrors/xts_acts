/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

// WARNING: failed to inject status
#include <poll.h>
#include <type_traits>
#include "libc_test_shim.h"

template <typename T> static void TypePun()
{
    (void)static_cast<std::add_pointer_t<T>>(nullptr);
}

template <typename T, typename F> static void CheckField(T& obj, F T::*member)
{
    F* ptr = &(obj.*member);
    (void)ptr;
}

static void IgnorePollConst(int value)
{
    (void)value;
}

static void PollFortifyBody()
{
    TypePun<nfds_t>();
    {
        struct pollfd x;
        CheckField(x, &pollfd::fd);
        CheckField(x, &pollfd::events);
        CheckField(x, &pollfd::revents);
    }
    IgnorePollConst(POLLIN);
    IgnorePollConst(POLLRDNORM);
    IgnorePollConst(POLLRDBAND);
    IgnorePollConst(POLLPRI);
    IgnorePollConst(POLLOUT);
    IgnorePollConst(POLLWRNORM);
    IgnorePollConst(POLLWRBAND);
    IgnorePollConst(POLLERR);
    IgnorePollConst(POLLHUP);
    IgnorePollConst(POLLNVAL);
    {
        int (*p)(struct pollfd[], nfds_t, int) = poll;
        (void)p;
    }
}

int PollTest()
{
    PollFortifyBody();
    return SUCCESS_CODE;
}
