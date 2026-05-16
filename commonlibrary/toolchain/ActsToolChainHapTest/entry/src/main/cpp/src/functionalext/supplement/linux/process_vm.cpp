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

#include <cerrno>
#include <cstdlib>
#include <sys/uio.h>
#include "functionalext.h"

#define VALUE_BUFFER_SIZE 256
#define VALUE_DATA_SIZE 2

/**
 * @tc.name      : ProcessVmWritev0100
 * @tc.desc      : Single data inter-process data transfer
 * @tc.level     : Level 0
 */
void ProcessVmWritev0100(void)
{
    char src[VALUE_BUFFER_SIZE] = "This is ProcessVmWritev0100.";
    char dst[VALUE_BUFFER_SIZE] = "";
    struct iovec local = {.iov_base = dst, .iov_len = sizeof(dst)};
    struct iovec remote = {.iov_base = src, .iov_len = sizeof(src)};

    ssize_t rev = process_vm_readv(getpid(), &local, 1, &remote, 1, 0);
    EXPECT_EQ("ProcessVmWritev0100", rev, sizeof(dst));
    EXPECT_STREQ("ProcessVmWritev0100", dst, src);
}

/**
 * @tc.name      : ProcessVmWritev0200
 * @tc.desc      : Data transfer between multiple data processes
 * @tc.level     : Level 0
 */
void ProcessVmWritev0200(void)
{
    char src1[VALUE_BUFFER_SIZE] = "This is ProcessVmWritev0200_1.";
    char src2[VALUE_BUFFER_SIZE] = "This is ProcessVmWritev0200_2.";
    char dst1[VALUE_BUFFER_SIZE] = "";
    char dst2[VALUE_BUFFER_SIZE] = "";
    struct iovec local[VALUE_DATA_SIZE] = {
        {.iov_base = dst1, .iov_len = sizeof(dst1)},
        {.iov_base = dst2, .iov_len = sizeof(dst2)},
    };
    struct iovec remote[VALUE_DATA_SIZE] = {
        {.iov_base = src1, .iov_len = sizeof(src1)},
        {.iov_base = src2, .iov_len = sizeof(src2)},
    };

    ssize_t rev = process_vm_readv(getpid(), local, 2, remote, 2, 0);
    EXPECT_EQ("ProcessVmWritev0200", rev, sizeof(dst1) + sizeof(dst2));
    int i;
    for (i = 0; i < VALUE_DATA_SIZE; i++) {
        EXPECT_STREQ("ProcessVmWritev0200", (char*)local[i].iov_base, (char*)remote[i].iov_base);
    }
}

/**
 * @tc.name      : ProcessVmWritev0300
 * @tc.desc      : Provide the correct template, create a temporary file
 * @tc.level     : Level 2
 */
void ProcessVmWritev0300(void)
{
    char src[VALUE_BUFFER_SIZE] = "This is ProcessVmWritev0300.";
    struct iovec local = {
        .iov_base = nullptr,
        .iov_len = 0,
    };
    struct iovec remote = {.iov_base = src, .iov_len = sizeof(src)};

    ssize_t rev = process_vm_readv(getpid(), &local, 1, &remote, 1, 0);
    EXPECT_EQ("ProcessVmWritev0300", rev, 0);
}

/**
 * @tc.name      : ProcessVmReadv0100
 * @tc.desc      : Transfers data from the remote process to the local process
 * @tc.level     : Level 0
 */
void ProcessVmReadv0100(void)
{
    char src[VALUE_BUFFER_SIZE] = "This is ProcessVmReadv0100.";
    char dst[VALUE_BUFFER_SIZE] = "";
    struct iovec remote;
    struct iovec local;
    remote.iov_base = src;
    remote.iov_len = VALUE_BUFFER_SIZE;

    local.iov_base = dst;
    local.iov_len = VALUE_BUFFER_SIZE;

    int ret = process_vm_readv(getpid(), &local, 1, &remote, 1, 0);
    EXPECT_EQ("ProcessVmReadv0100", ret, sizeof(src));
    EXPECT_STREQ("ProcessVmReadv0100", dst, src);
}

/**
 * @tc.name      : ProcessVmReadv0200
 * @tc.desc      : No remote instance data specified, transfer data from remote process to local process
 * @tc.level     : Level 2
 */
void ProcessVmReadv0200(void)
{
    char dst[VALUE_BUFFER_SIZE] = "";
    struct iovec remote;
    struct iovec local;
    remote.iov_base = nullptr;
    remote.iov_len = VALUE_BUFFER_SIZE;

    local.iov_base = dst;
    local.iov_len = VALUE_BUFFER_SIZE;

    int ret = process_vm_readv(getpid(), &local, 1, &remote, 1, 0);
    EXPECT_EQ("ProcessVmReadv0200", ret, ERREXPECT);
    EXPECT_EQ("ProcessVmReadv0200", errno, EFAULT);
}

/**
 * @tc.name      : ProcessVmReadv0300
 * @tc.desc      : No local instance data specified, transfer data from remote process to local process
 * @tc.level     : Level 2
 */
void ProcessVmReadv0300(void)
{
    char src[VALUE_BUFFER_SIZE] = "This is ProcessVmReadv0300.";
    struct iovec remote;
    struct iovec local;
    remote.iov_base = src;
    remote.iov_len = VALUE_BUFFER_SIZE;

    local.iov_base = nullptr;
    local.iov_len = VALUE_BUFFER_SIZE;

    int ret = process_vm_readv(getpid(), &local, 1, &remote, 1, 0);
    EXPECT_EQ("ProcessVmReadv0300", ret, ERREXPECT);
    EXPECT_EQ("ProcessVmReadv0300", errno, EFAULT);
}

static int ProcessVmTestImpl(void)
{
    ProcessVmWritev0100();
    ProcessVmWritev0200();
    ProcessVmWritev0300();
    ProcessVmReadv0100();
    ProcessVmReadv0200();
    ProcessVmReadv0300();
    return T_STATUS;
}

int ProcessVmTest(void)
{
    return ProcessVmTestImpl();
}
