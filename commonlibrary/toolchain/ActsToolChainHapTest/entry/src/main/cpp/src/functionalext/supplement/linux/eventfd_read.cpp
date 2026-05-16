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

#include <fcntl.h>
#include <sys/eventfd.h>
#include "test.h"

/**
 * @tc.name      : EventfdRead0100
 * @tc.desc      : Read the value of event through the file descriptor
 * @tc.level     : Level 0
 */
void EventfdRead0100(void)
{
    unsigned int initialValue = 2;
    int fd = eventfd(initialValue, O_NONBLOCK);
    if (fd == -1) {
        t_error("%s eventfd failed\n", __func__);
    }

    eventfd_t value = 123;
    int result = eventfd_read(fd, &value);
    if (result != 0) {
        t_error("%s eventfd_read failed\n", __func__);
    }

    if (value != initialValue) {
        t_error("%s eventfd_read value invalid\n", __func__);
    }

    close(fd);
}

/**
 * @tc.name      : EventfdRead0200
 * @tc.desc      : When the file descriptor is invalid, test the return value of this function
 * @tc.level     : Level 2
 */
void EventfdRead0200(void)
{
    eventfd_t value = 123;
    int result = eventfd_read(-1, &value);
    if (result != -1) {
        t_error("%s eventfd_read should be failed\n", __func__);
    }
}

/**
 * @tc.name      : EventfdRead0300
 * @tc.desc      : When the eventfd_t value is invalid, test the return value of this function
 * @tc.level     : Level 2
 */
void EventfdRead0300(void)
{
    unsigned int initialValue = 2;
    int fd = eventfd(initialValue, O_NONBLOCK);
    if (fd == -1) {
        t_error("%s eventfd failed\n", __func__);
    }

    int result = eventfd_read(fd, nullptr);
    if (result != -1) {
        t_error("%s eventfd_read should be failed\n", __func__);
    }

    close(fd);
}

static int EventfdReadTestWithArgs(int argc, char* argv[])
{
    EventfdRead0100();
    EventfdRead0200();
    EventfdRead0300();
    return T_STATUS;
}

int EventfdReadTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return EventfdReadTestWithArgs(1, libcArgvStub);
}
