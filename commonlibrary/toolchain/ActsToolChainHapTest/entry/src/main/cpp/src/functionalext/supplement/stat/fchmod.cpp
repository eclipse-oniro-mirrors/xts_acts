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
#include <sys/stat.h>
#include "functionalext.h"

typedef void (*TEST_FUN)();
constexpr mode_t EXPECT_MODE_34815 = 34815;
constexpr mode_t EXPECT_MODE_33279 = 33279;

/**
 * @tc.name      : fchmod_0100
 * @tc.desc      : Verify the permission to modify the file (parameters are set separately)
 * @tc.level     : Level 0
 */
void Fchmod0100()
{
    struct stat buf;
    const char* path = "/data/storage/el2/base/cache/test.txt";
    int fd = open(path, O_RDWR | O_CREAT, TEST_MODE);
    EXPECT_NE("fchmod_0100", fd, -1);

    int result = fchmod(fd,
                        S_IRUSR | S_ISGID | S_ISVTX | S_IWUSR | S_IROTH | S_IWUSR | S_IXUSR | S_IRGRP | S_IWGRP |
                            S_IXGRP | S_IROTH | S_IWOTH | S_IXOTH);
    stat(path, &buf);
    EXPECT_EQ("fchmod_0100", result, 0);
    EXPECT_EQ("fchmod_0100", buf.st_mode, EXPECT_MODE_34815);
    close(fd);
    int removeRet = remove(path);
    EXPECT_EQ("fchmod_0100", removeRet, 0);
}

/**
 * @tc.name      : fchmod_0200
 * @tc.desc      : Verify permission to modify files (overall parameter settings)
 * @tc.level     : Level 0
 */
void Fchmod0200()
{
    struct stat buf;
    const char* path = "/data/storage/el2/base/cache/test.txt";
    int fd = open(path, O_RDWR | O_CREAT, TEST_MODE);
    int result = fchmod(fd, S_IRWXU | S_IRWXG | S_IRWXO);
    stat(path, &buf);
    EXPECT_EQ("fchmod_0200", result, 0);
    EXPECT_EQ("fchmod_0200", buf.st_mode, EXPECT_MODE_33279);
    close(fd);
    int removeRet = remove(path);
    EXPECT_EQ("fchmod_0200", removeRet, 0);
}

/**
 * @tc.name      : fchmod_0300
 * @tc.desc      : Failed to verify permission to modify file (fd parameter is invalid)
 * @tc.level     : Level 2
 */
void Fchmod0300()
{
    int result = fchmod(-1, S_IRWXU | S_IRWXG | S_IRWXO);
    EXPECT_EQ("fchmod_0300", result, -1);
}

static TEST_FUN g_gFunArray[] = {
    Fchmod0100,
    Fchmod0200,
    Fchmod0300,
};

static int FchmodTestImpl(int argc, char* argv[])
{
    int num = sizeof(g_gFunArray) / sizeof(TEST_FUN);
    for (int pos = 0; pos < num; ++pos) {
        g_gFunArray[pos]();
    }

    return T_STATUS;
}

int FchmodTest(void)
{
    static char libcProg[] = "libc_test";
    char* libcArgv[] = { libcProg, nullptr };
    return FchmodTestImpl(1, libcArgv);
}
