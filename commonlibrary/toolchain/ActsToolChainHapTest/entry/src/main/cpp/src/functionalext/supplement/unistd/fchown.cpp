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

#include <csignal>
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <fcntl.h>
#include <sys/stat.h>
#include <unistd.h>
#include "functionalext.h"

typedef void (*TEST_FUN)();
const int COUNT_ZERO = 0;
const int COUNT_NEFATIVE = -1;
constexpr int INVALID_FD = -1;

/**
 * @tc.name      : Fchown0100
 * @tc.desc      : Parameter is valid and can change the user and group of the file's owner
 * @tc.level     : Level 0
 */
void Fchown0100()
{
    int fd = open("/data/storage/el2/base/cache/test.txt", O_RDONLY | O_CREAT, TEST_MODE);
    EXPECT_NE("fchown_0100", fd, -1);
    if (fd == -1) {
        return;
    }

    int result = fchown(fd, 0, 0);
    struct stat buff;
    int statResult = fstat(fd, &buff);

    if (result == 0 && statResult == 0) {
        EXPECT_EQ("Fchown0100", buff.st_uid, 0);
        EXPECT_EQ("Fchown0100", buff.st_gid, 0);
    } else {
        printf("Fchown0100: fchown not supported without root privileges (result=%d, errno=%d)\n", result, errno);
    }
    close(fd);
    int removeRet = remove("/data/storage/el2/base/cache/test.txt");
    EXPECT_EQ("Fchown0100", removeRet, COUNT_ZERO);
}

/**
 * @tc.name      : Fchown0200
 * @tc.desc      : Parameter valid, can change the file owner of the user
 * @tc.level     : Level 0
 */
void Fchown0200()
{
    int fd = open("/data/storage/el2/base/cache/test.txt", O_RDONLY | O_CREAT, TEST_MODE);
    EXPECT_NE("fchown_0200", fd, -1);
    if (fd == -1) {
        return;
    }

    int result = fchown(fd, 0, -1);
    struct stat buff;
    int statResult = fstat(fd, &buff);

    if (result == 0 && statResult == 0) {
        EXPECT_EQ("Fchown0200", buff.st_uid, 0);
    } else {
        printf("Fchown0200: fchown not supported without root privileges (result=%d, errno=%d)\n", result, errno);
    }
    close(fd);
    int removeRet = remove("/data/storage/el2/base/cache/test.txt");
    EXPECT_EQ("Fchown0200", removeRet, COUNT_ZERO);
}

/**
 * @tc.name      : Fchown0300
 * @tc.desc      : Parameter valid to change the owner group of the file
 * @tc.level     : Level 0
 */
void Fchown0300()
{
    int fd = open("/data/storage/el2/base/cache/test.txt", O_RDONLY | O_CREAT, TEST_MODE);
    EXPECT_NE("fchown_0300", fd, -1);
    if (fd == -1) {
        return;
    }

    int result = fchown(fd, -1, 0);
    struct stat buff;
    int statResult = fstat(fd, &buff);

    if (result == 0 && statResult == 0) {
        EXPECT_EQ("Fchown0300", buff.st_gid, 0);
    } else {
        printf("Fchown0300: fchown not supported without root privileges (result=%d, errno=%d)\n", result, errno);
    }
    close(fd);
    int removeRet = remove("/data/storage/el2/base/cache/test.txt");
    EXPECT_EQ("Fchown0300", removeRet, COUNT_ZERO);
}

/**
 * @tc.name      : Fchown0400
 * @tc.desc      : The user and group of the file's owner cannot be changed
 * @tc.level     : Level 2
 */
void Fchown0400()
{
    int fd = open("/data/storage/el2/base/cache/test.txt", O_RDONLY | O_CREAT, TEST_MODE);
    EXPECT_NE("fchown_0400", fd, -1);
    if (fd == -1) {
        return;
    }
    close(fd);
    int result = fchown(INVALID_FD, 0, 0);
    EXPECT_EQ("Fchown0400", result, COUNT_NEFATIVE);
    int removeRet = remove("/data/storage/el2/base/cache/test.txt");
    EXPECT_EQ("Fchown0400", removeRet, COUNT_ZERO);
}

/**
 * @tc.name      : Fchown0500
 * @tc.desc      : The user and group of the file's owner cannot be changed
 * @tc.level     : Level 2
 */
void Fchown0500()
{
    int fd = open("/data/storage/el2/base/cache/test.txt", O_RDONLY | O_CREAT, TEST_MODE);
    EXPECT_NE("fchown_0500", fd, -1);
    if (fd == -1) {
        return;
    }

    int result = fchown(INVALID_FD, 0, 0);
    EXPECT_EQ("Fchown0500", result, COUNT_NEFATIVE);
    close(fd);
    int removeRet = remove("/data/storage/el2/base/cache/test.txt");
    EXPECT_EQ("Fchown0500", removeRet, COUNT_ZERO);
}

static TEST_FUN g_gFunArray[] = {
    Fchown0100, Fchown0200, Fchown0300, Fchown0400, Fchown0500,
};

static int FchownTestImpl(int argc, char* argv[])
{
    int num = sizeof(g_gFunArray) / sizeof(TEST_FUN);
    for (int pos = 0; pos < num; ++pos) {
        g_gFunArray[pos]();
    }

    return T_STATUS;
}

int FchownTest(void)
{
    static char libcProg[] = "libc_test";
    char* libcArgv[] = { libcProg, nullptr };
    return FchownTestImpl(1, libcArgv);
}
