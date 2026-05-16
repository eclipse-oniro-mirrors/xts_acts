/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

#include <cstdio>
#include <cstring>
#include <fcntl.h>
#include <sys/uio.h>
#include <unistd.h>
#include "test.h"

/**
 * @tc.name      : Writev0100
 * @tc.desc      : Writes iovcnt buffers of data described by iov to the file associated with fd
 * @tc.level     : Level 0
 */
void Writev0100(void)
{
    char* str0 = "test ";
    char* str1 = "writev\n";
    struct iovec iov[2];

    iov[0].iov_base = str0;
    iov[0].iov_len = strlen(str0) + 1;
    iov[1].iov_base = str1;
    iov[1].iov_len = strlen(str1) + 1;

    ssize_t result = writev(STDOUT_FILENO, iov, 2);
    if (result != (iov[0].iov_len + iov[1].iov_len)) {
        t_error("%s writev falied", __func__);
    }
}

/**
 * @tc.name      : Writev0200
 * @tc.desc      : When iovlen is equal to 0, the data in the structure iov will not be read
 * @tc.level     : Level 1
 */
void Writev0200(void)
{
    char* str0 = "test ";
    char* str1 = "writev\n";
    struct iovec iov[2];

    iov[0].iov_base = str0;
    iov[0].iov_len = 0;
    iov[1].iov_base = str1;
    iov[1].iov_len = strlen(str1) + 1;

    ssize_t result = writev(STDOUT_FILENO, iov, 2);
    if (result != (iov[0].iov_len + iov[1].iov_len)) {
        t_error("%s writev falied", __func__);
    }
}

/**
 * @tc.name      : Writev0300
 * @tc.desc      : Invalid parameter input
 * @tc.level     : Level 2
 */
void Writev0300(void)
{
    ssize_t result = writev(-1, nullptr, -1);
    if (result != -1) {
        t_error("%s writev should falied", __func__);
    }
}

static int WritevTestImpl(int argc, char* argv[])
{
    Writev0100();
    Writev0200();
    Writev0300();
    return T_STATUS;
}

int WritevTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return WritevTestImpl(1, libcArgvStub);
}
