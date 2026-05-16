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

#include <fcntl.h>
#include "functionalext.h"

const int FAILED = -1;

/**
 * @tc.name     : dup3_0100
 * @tc.desc     : The parameter flags is O_CLOEXEC, which can assign the old file descriptor to the new file descriptor
 * @tc.level    : Level 0
 */
void Dup30100(void)
{
    int fd = open("/data/storage/el2/base/cache/dup3test.txt", O_RDWR | O_CREAT, TEST_MODE);
    EXPECT_TRUE("Dup30100", fd >= 0);
    int ret = dup3(fd, fileno(stderr), O_CLOEXEC);
    EXPECT_EQ("Dup30100", ret, fileno(stderr));
    close(fd);
    int removeRet = remove("/data/storage/el2/base/cache/dup3test.txt");
    EXPECT_EQ("Dup30100", removeRet, 0);
}

/**
 * @tc.name     : dup3_0200
 * @tc.desc     : The parameter old is invalid, the old file descriptor cannot be assigned to the new file descriptor.
 * @tc.level    : Level 2
 */
void Dup30200(void)
{
    int fd = -1;
    int ret = dup3(fd, fileno(stderr), O_CLOEXEC);
    EXPECT_EQ("Dup30200", ret, FAILED);
}

/**
 * @tc.name     : dup3_0300
 * @tc.desc     : The parameter new is invalid, the old file descriptor cannot be assigned to the new file descriptor.
 * @tc.level    : Level 2
 */
void Dup30300(void)
{
    int newfd = -1;
    int fd = open("/data/storage/el2/base/cache/readtest.txt", O_RDWR | O_CREAT, TEST_MODE);
    EXPECT_TRUE("Dup30300", fd >= 0);
    int ret = dup3(fd, newfd, O_CLOEXEC);
    EXPECT_EQ("Dup30300", ret, FAILED);
    close(fd);
    int removeRet = remove("/data/storage/el2/base/cache/readtest.txt");
    EXPECT_EQ("Dup30300", removeRet, 0);
}

static int Dup3TestWithArgs(int argc, char* argv[])
{
    Dup30100();
    Dup30200();
    Dup30300();
    return T_STATUS;
}

int Dup3Test(void)
{
    static char libcProg[] = "libc_test";
    char* libcArgv[] = { libcProg, nullptr };
    return Dup3TestWithArgs(1, libcArgv);
}

int Dup3TestCompat(void)
{
    return Dup3Test();
}
