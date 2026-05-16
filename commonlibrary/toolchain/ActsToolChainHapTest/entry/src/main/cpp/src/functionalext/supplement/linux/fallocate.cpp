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

#include <cerrno>
#include <fcntl.h>
#include "functionalext.h"

const int SIZE = 18;
const int SUCCESS = 0;
const int FAILED = -1;

/**
 * @tc.name      : fallocate_0100
 * @tc.desc      : The parameter mode is 0, which can expand the file space.
 * @tc.level     : Level 0
 */
void Fallocate0100()
{
    char str[] = "this is a fatest\n";
    char buffer[1024] = { 0 };
    int fd = open("/data/storage/el2/base/cache/fatest.txt", O_RDWR | O_CREAT, TEST_MODE);
    EXPECT_TRUE("Fallocate0100", fd >= 0);
    int retwrite = write(fd, str, sizeof(str));
    EXPECT_EQ("Fallocate0100", retwrite, SIZE);
    int ret = fallocate(fd, 0, 4096, 4096 * 3);
    EXPECT_EQ("Fallocate0100", ret, SUCCESS);
    close(fd);
    int removeRet = remove("/data/storage/el2/base/cache/fatest.txt");
    EXPECT_EQ("Fallocate0100", removeRet, SUCCESS);
}

/**
 * @tc.name      : fallocate_0200
 * @tc.desc      : The parameter mode is FALLOC_FL_KEEP_SIZE, which can expand the file space.
 * @tc.level     : Level 1
 */
void Fallocate0200(void)
{
    char str[] = "this is a fatest\n";
    char buffer[1024] = { 0 };
    int fd = open("/data/storage/el2/base/cache/fatest.txt", O_RDWR | O_CREAT, TEST_MODE);
    EXPECT_TRUE("Fallocate0200", fd >= 0);
    int retwrite = write(fd, str, sizeof(str));
    EXPECT_EQ("Fallocate0200", retwrite, SIZE);
    int ret = fallocate(fd, FALLOC_FL_KEEP_SIZE, 4096, 4096 * 3);
    EXPECT_EQ("Fallocate0200", ret, SUCCESS);
    close(fd);
    int removeRet = remove("/data/storage/el2/base/cache/fatest.txt");
    EXPECT_EQ("Fallocate0200", removeRet, SUCCESS);
}

/**
 * @tc.name      : fallocate_0300
 * @tc.desc      : The parameter mode is FALLOC_FL_KEEP_SIZE|FALLOC_FL_PUNCH_HOLE, which can release file space.
 * @tc.level     : Level 1
 */
void Fallocate0300(void)
{
    char str[] = "this is a fatest\n";
    char buffer[1024] = { 0 };
    int fd = open("/data/storage/el2/base/cache/fatest.txt", O_RDWR | O_CREAT, TEST_MODE);
    EXPECT_TRUE("Fallocate0300", fd >= 0);
    int retwrite = write(fd, str, sizeof(str));
    EXPECT_EQ("Fallocate0300", retwrite, SIZE);
    lseek(fd, 0, SEEK_SET);
    int ret = fallocate(fd, FALLOC_FL_KEEP_SIZE | FALLOC_FL_PUNCH_HOLE, 4096, 4096 * 3);
    EXPECT_EQ("Fallocate0300", ret, SUCCESS);
    close(fd);
    int removeRet = remove("/data/storage/el2/base/cache/fatest.txt");
    EXPECT_EQ("Fallocate0300", removeRet, SUCCESS);
}

/**
 * @tc.name      : fallocate_0400
 * @tc.desc      : The parameter fd is invalid, the mode is FALLOC_FL_KEEP_SIZE, and the file space cannot be expanded
 * @tc.level     : Level 1
 */
void Fallocate0400(void)
{
    int fd = -1;
    int ret = fallocate(fd, FALLOC_FL_KEEP_SIZE, 4096, 4096 * 3);
    EXPECT_EQ("Fallocate0400", ret, FAILED);
    close(fd);
    int removeRet = remove("/data/storage/el2/base/cache/fatest.txt");
    EXPECT_TRUE("Fallocate0400", removeRet == SUCCESS || errno == ENOENT);
}

static int FallocateTestImpl(int argc, char* argv[])
{
    Fallocate0100();
    Fallocate0200();
    Fallocate0300();
    Fallocate0400();
    return T_STATUS;
}

int FallocateTest(void)
{
    static char libcProg[] = "libc_test";
    char* libcArgv[] = { libcProg, nullptr };
    return FallocateTestImpl(1, libcArgv);
}
