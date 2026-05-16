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
 * @tc.name      : EventfdWrite0100
 * @tc.desc      : Write the value through this function
 * @tc.level     : Level 0
 */
void EventfdWrite0100(void)
{
    eventfd_t value;
    unsigned int initialValue = 0;
    int fd = eventfd(initialValue, O_NONBLOCK);
    if (fd == -1) {
        t_error("%s eventfd failed\n", __func__);
    }

    int ret = eventfd_write(fd, 1);
    if (ret != 0) {
        t_error("%s eventfd_write failed\n", __func__);
    }
    ret = eventfd_write(fd, 1);
    if (ret != 0) {
        t_error("%s eventfd_write failed\n", __func__);
    }
    ret = eventfd_write(fd, 1);
    if (ret != 0) {
        t_error("%s eventfd_write failed\n", __func__);
    }

    ret = eventfd_read(fd, &value);
    if (ret != 0) {
        t_error("%s eventfd_read failed\n", __func__);
    }
    if (value != 3U) {
        t_error("%s value is %d, not three\n", __func__);
    }
    close(fd);
}

/**
 * @tc.name      : EventfdWrite0200
 * @tc.desc      : When the file descriptor is invalid, test the return value of this function
 * @tc.level     : Level 2
 */
void EventfdWrite0200(void)
{
    int ret = eventfd_write(-1, 1);
    if (ret != -1) {
        t_error("%s eventfd_write should be failed\n", __func__);
    }
}

/**
 * @tc.name      : EventfdWrite0300
 * @tc.desc      : When the eventfd_t value is invalid, test the return value of this function
 * @tc.level     : Level 2
 */
void EventfdWrite0300(void)
{
    unsigned int initialValue = 2;
    int fd = eventfd(initialValue, O_NONBLOCK);
    if (fd == -1) {
        t_error("%s eventfd failed\n", __func__);
    }

    int result = eventfd_write(fd, -1);
    if (result != -1) {
        t_error("%s eventfd_write should be failed\n", __func__);
    }

    close(fd);
}

static int EventfdWriteTestWithArgs(int argc, char* argv[])
{
    EventfdWrite0100();
    EventfdWrite0200();
    EventfdWrite0300();
    return T_STATUS;
}

int EventfdWriteTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return EventfdWriteTestWithArgs(1, libcArgvStub);
}
