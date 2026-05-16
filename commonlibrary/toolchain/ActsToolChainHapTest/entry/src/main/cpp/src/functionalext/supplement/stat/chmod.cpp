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

/**
 * @tc.name      : chmod_0100
 * @tc.desc      : Verify the permission to modify the file (the mode parameter is set separately)
 * @tc.level     : Level 0
 */
void Chmod0100(void)
{
    constexpr mode_t EXPECT_MODE_34815 = 34815;
    struct stat buf;
    open("/data/storage/el2/base/cache/test.txt", O_RDWR | O_CREAT, TEST_MODE);
    int result = chmod("/data/storage/el2/base/cache/test.txt",
                       S_IRUSR | S_ISGID | S_ISVTX | S_IWUSR | S_IROTH | S_IWUSR | S_IXUSR | S_IRGRP | S_IWGRP |
                           S_IXGRP | S_IROTH | S_IWOTH | S_IXOTH);
    stat("/data/storage/el2/base/cache/test.txt", &buf);
    EXPECT_EQ("chmod_0100", result, 0);
    EXPECT_EQ("chmod_0100", buf.st_mode, EXPECT_MODE_34815);
    int removeRet = remove("/data/storage/el2/base/cache/test.txt");
    EXPECT_EQ("chmod_0100", removeRet, 0);
}

/*
 * @tc.name      : chmod_0200
 * @tc.desc      : Verify the permission to modify the file (the overall setting of the mode parameter)
 * @tc.level     : Level 2
 */
void Chmod0200(void)
{
    constexpr mode_t EXPECT_MODE_33279 = 33279;
    struct stat buf;
    open("/data/storage/el2/base/cache/test.txt", O_RDWR | O_CREAT, TEST_MODE);
    int result = chmod("/data/storage/el2/base/cache/test.txt", S_IRWXU | S_IRWXG | S_IRWXO);
    stat("/data/storage/el2/base/cache/test.txt", &buf);
    EXPECT_EQ("chmod_0200", result, 0);
    EXPECT_EQ("chmod_0200", buf.st_mode, EXPECT_MODE_33279);
    int removeRet = remove("/data/storage/el2/base/cache/test.txt");
    EXPECT_EQ("chmod_0200", removeRet, 0);
}

/*
 * @tc.name      : chmod_0300
 * @tc.desc      : Verify that file permissions cannot be modified (parameter invalid)
 * @tc.level     : Level 2
 */
void Chmod0300(void)
{
    int result = chmod("/data/storage/el2/base/cache/AAA.txt",
                       S_ISUID | S_ISGID | S_ISVTX | S_IRUSR | S_IWUSR | S_IXUSR | S_IRGRP | S_IWGRP | S_IXGRP |
                           S_IROTH | S_IWOTH | S_IXOTH);
    EXPECT_EQ("chmod_0300", result, -1);
}

static int ChmodTestWithArgs(int argc, char* argv[])
{
    Chmod0100();
    Chmod0200();
    Chmod0300();
    return T_STATUS;
}

int ChmodTest(void)
{
    static char libcProg[] = "libc_test";
    char* libcArgv[] = { libcProg, nullptr };
    return ChmodTestWithArgs(1, libcArgv);
}

int ChmodTestCompat(void)
{
    return ChmodTest();
}
