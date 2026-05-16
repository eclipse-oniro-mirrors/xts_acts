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

// commit 5f95f965e933c5b155db75520ac27c92ddbcf400 2014-03-18
// syscall should not sign extend pointers on x32
#include <cerrno>
#include <cstring>
#include <fcntl.h>
#include <sys/syscall.h>
#include <unistd.h>
#include "libc_test_shim.h"
int SyscallSignExtendTest()
{
    int status = SUCCESS_CODE;

    char buf[1] = { 1 };
    int fd;
    int r;

    // test syscall with pointer
    if (!((fd = open("/dev/zero", O_RDONLY)) >= 0)) {
        LibcTestError(&status, "(fd = open(\"/dev/zero\", O_RDONLY)) >= 0 failed: %s\n", strerror(errno));
    }
    if (!((r = syscall(SYS_read, fd, buf, 1)) == 1)) {
        LibcTestError(&status, "(r = syscall(SYS_read, fd, buf, 1)) == 1 failed: %s\n", strerror(errno));
    }
    if (buf[0] != 0) {
        LibcTestError(&status, "read %d instead of 0\n", buf[0]);
    }

    return status;
}
