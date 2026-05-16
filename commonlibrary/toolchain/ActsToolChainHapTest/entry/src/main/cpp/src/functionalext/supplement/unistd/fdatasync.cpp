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
#include <unistd.h>
#include "functionalext.h"

typedef void (*TEST_FUN)();

static const char* PATH = "/data/storage/el2/base/cache/readtest.txt";
constexpr int BUFFER_SIZE = 1024;

/**
 * @tc.name      : fdatasync_0100
 * @tc.desc      : Verify flush kernel's cache (parameter valid)
 * @tc.level     : Level 0
 */
void Fdatasync0100()
{
    char str[] = "hello";
    char buffer[BUFFER_SIZE] = { "\0" };
    int fd = open(PATH, O_RDWR | O_CREAT, TEST_MODE);
    EXPECT_NE("fdatasync_0100", fd, -1);

    write(fd, str, sizeof(str));
    lseek(fd, 0L, SEEK_SET);
    read(fd, buffer, BUFFER_SIZE);

    int result = fdatasync(fd);
    EXPECT_EQ("fdatasync_0100", result, 0);
    EXPECT_STREQ("fdatasync_0100", buffer, "hello");

    close(fd);
    int removeRet = remove(PATH);
    EXPECT_EQ("fdatasync_0100", removeRet, 0);
}

/**
 * @tc.name      : fdatasync_0200
 * @tc.desc      : Verify failed to flush kernel's cache (file close)
 * @tc.level     : Level 2
 */
void Fdatasync0200()
{
    char str[] = "hello\n";
    char buffer[BUFFER_SIZE] = { "\0" };
    int fd = open(PATH, O_RDWR | O_CREAT, TEST_MODE);
    EXPECT_NE("fdatasync_0100", fd, -1);
    close(fd);
    fd = -1;

    int result = fdatasync(fd);
    EXPECT_EQ("fdatasync_0200", result, -1);

    int removeRet = remove(PATH);
    EXPECT_EQ("fdatasync_0200", removeRet, 0);
}

/**
 * @tc.name      : fdatasync_0300
 * @tc.desc      : Validation failed to flush kernel's cache (invalid parameter)
 * @tc.level     : Level 2
 */
void Fdatasync0300()
{
    int result = fdatasync(-1);
    EXPECT_EQ("fdatasync_0300", result, -1);
}

static TEST_FUN g_gFunArray[] = {
    Fdatasync0100,
    Fdatasync0200,
    Fdatasync0300,
};

static int FdatasyncTestImpl(int argc, char* argv[])
{
    int num = sizeof(g_gFunArray) / sizeof(TEST_FUN);
    for (int pos = 0; pos < num; ++pos) {
        g_gFunArray[pos]();
    }

    return T_STATUS;
}

int FdatasyncTest(void)
{
    static char libcProg[] = "libc_test";
    char* libcArgv[] = { libcProg, nullptr };
    return FdatasyncTestImpl(1, libcArgv);
}
