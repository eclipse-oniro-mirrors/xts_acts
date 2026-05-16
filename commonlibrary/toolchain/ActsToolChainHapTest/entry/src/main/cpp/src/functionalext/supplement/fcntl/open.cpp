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

#include <fcntl.h>
#include "functionalext.h"

// Test constants for file operations
#define TEST_STRING_LENGTH 5
#define EXPECTED_FD_VALUE 2

typedef void (*TEST_FUN)();

static const char *PATH = "/data/storage/el2/base/cache/test.txt";

/*
 * @tc.name      : open_0100
 * @tc.desc      : Verify file open mode is O_RDONLY
 * @tc.level     : Level 0
 */
void Open0100(void)
{
    char s[] = "test";
    char buffer[80] = {0};
    int fd = open(PATH, O_RDONLY + O_CREAT, TEST_MODE);
    int len = write(fd, s, sizeof(s));
    ssize_t size = read(fd, buffer, sizeof(buffer));
    EXPECT_MT("open_0100", fd, EXPECTED_FD_VALUE);
    EXPECT_EQ("open_0100", len, -1);
    EXPECT_STREQ("open_0100", buffer, "");

    close(fd);
    remove(PATH);
}

/*
 * @tc.name      : open_0200
 * @tc.desc      : Verify file open mode is O_RDONLY (file does not exist)
 * @tc.level     : Level 2
 */
void Open0200(void)
{
    int fd = open(PATH, O_RDONLY);
    EXPECT_EQ("open_0200", fd, -1);
}

/*
 * @tc.name      : open_0300
 * @tc.desc      : Verify file open mode is O_WRONLY
 * @tc.level     : Level 0
 */
void Open0300(void)
{
    char s[] = "test";
    char buffer[80] = {0};
    int fd = open(PATH, O_WRONLY + O_CREAT, TEST_MODE);
    ssize_t size = read(fd, buffer, sizeof(buffer));
    EXPECT_MT("open_0300", fd, EXPECTED_FD_VALUE);
    EXPECT_STREQ("open_0300", buffer, "");
    int len = write(fd, s, sizeof(s));
    EXPECT_EQ("open_0300", len, TEST_STRING_LENGTH);
    close(fd);
    remove(PATH);
}

/*
 * @tc.name      : open_0400
 * @tc.desc      : Verify file open mode is O_WRONLY(file does not exist)
 * @tc.level     : Level 2
 */
void Open0400(void)
{
    int fd = open(PATH, O_WRONLY);
    EXPECT_EQ("open_0400", fd, -1);
}

/*
 * @tc.name      : open_0500
 * @tc.desc      : Verify file open mode is O_RDWR | O_APPEND
 * @tc.level     : Level 0
 */
void Open0500(void)
{
    char s[] = "test";
    char buffer[80] = {0};
    int fd = open(PATH, O_RDWR | O_APPEND + O_CREAT, TEST_MODE);
    ssize_t size = read(fd, buffer, sizeof(buffer));
    EXPECT_MT("open_0500", fd, EXPECTED_FD_VALUE);
    EXPECT_STREQ("open_0500", buffer, "");
    int len = write(fd, s, sizeof(s));
    EXPECT_EQ("open_0500", len, TEST_STRING_LENGTH);
    close(fd);
    remove(PATH);
}

/*
 * @tc.name      : open_0600
 * @tc.desc      : Verify file open mode is O_RDWR | O_APPEND(file does not exist)
 * @tc.level     : Level 1
 */
void Open0600(void)
{
    char s[] = "test";
    char buffer[80] = {0};
    int fd = open(PATH, O_RDWR | O_APPEND);
    ssize_t size = read(fd, buffer, sizeof(buffer));
    EXPECT_EQ("open_0600", fd, -1);
    EXPECT_STREQ("open_0600", buffer, "");
    int len = write(fd, s, sizeof(s));
    EXPECT_EQ("open_0600", len, -1);
    close(fd);
}

/*
 * @tc.name      : open_0700
 * @tc.desc      : Verify file open mode is O_RDWR | O_APPEND(file pathname is invalid)
 * @tc.level     : Level 2
 */
void Open0700(void)
{
    int fd = open(PATH, O_RDWR | O_APPEND);
    EXPECT_EQ("open_0700", fd, -1);
}

/*
 * @tc.name      : open_0800
 * @tc.desc      : Verify file open mode is O_RDWR | O_CREAT
 * @tc.level     : Level 0
 */
void Open0800(void)
{
    char s[] = "test";
    char buffer[80] = {0};
    int fd = open(PATH, O_RDWR | O_CREAT, TEST_MODE);
    ssize_t size = read(fd, buffer, sizeof(buffer));
    EXPECT_MT("open_0800", fd, EXPECTED_FD_VALUE);
    EXPECT_STREQ("open_0800", buffer, "");
    int len = write(fd, s, sizeof(s));
    EXPECT_EQ("open_0800", len, TEST_STRING_LENGTH);
    close(fd);
    remove(PATH);
}

/*
 * @tc.name      : open_0900
 * @tc.desc      : Verify file open mode is O_RDWR | O_CLOEXEC
 * @tc.level     : Level 0
 */
void Open0900(void)
{
    char s[] = "test";
    char buffer[80] = {0};
    int fd = open(PATH, O_RDWR | O_CLOEXEC + O_CREAT, TEST_MODE);
    ssize_t size = read(fd, buffer, sizeof(buffer));
    EXPECT_MT("open_0900", fd, EXPECTED_FD_VALUE);
    EXPECT_STREQ("open_0900", buffer, "");
    int len = write(fd, s, sizeof(s));
    EXPECT_EQ("open_0900", len, TEST_STRING_LENGTH);
    close(fd);
    remove(PATH);
}

static TEST_FUN g_gFunArray[] = {
    Open0100,
    Open0200,
    Open0300,
    Open0400,
    Open0500,
    Open0600,
    Open0700,
    Open0800,
    Open0900,

};

static int OpenTestImpl(int argc, char *argv[])
{
    int num = sizeof(g_gFunArray) / sizeof(TEST_FUN);
    for (int pos = 0; pos < num; ++pos) {
        g_gFunArray[pos]();
    }

    return g_tStatus;
}

int OpenTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return OpenTestImpl(1, libcArgv);
}

