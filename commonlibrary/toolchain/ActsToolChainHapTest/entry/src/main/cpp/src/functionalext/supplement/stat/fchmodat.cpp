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
#include "filepath_util.h"
#include "functionalext.h"

int g_success = 36863;
int g_successValue = 33279;
static int g_failed = -1;
static const mode_t MODE_MASK = 07777;

/**
 * @tc.name      : fchmodat_0100
 * @tc.desc      : Verify the permission to modify the file (parameters are set separately)
 * @tc.level     : Level 0
 */
void Fchmodat0100(void)
{
    int fd;
    struct stat buf;
    char path[PATH_MAX] = { 0 };
    FILE_ABSOLUTE_PATH(STR_TEST_TXT, path);
    fd = open(path, O_RDWR | O_CREAT, TEST_MODE);
    int result = fchmodat(AT_FDCWD,
                          path,
                          S_ISUID | S_ISGID | S_ISVTX | S_IRUSR | S_IWUSR | S_IXUSR | S_IRGRP | S_IWGRP | S_IXGRP |
                              S_IROTH | S_IWOTH | S_IXOTH,
                          AT_SYMLINK_NOFOLLOW);
    stat(path, &buf);
    if (result != 0) {
        close(fd);
        int removeRet = remove(path);
        EXPECT_EQ("fchmodat_0100", removeRet, 0);
        return;
    }
    EXPECT_EQ("fchmodat_0100", (buf.st_mode & MODE_MASK), (g_success & MODE_MASK));
    close(fd);
    int removeRet = remove(path);
    EXPECT_EQ("fchmodat_0100", removeRet, 0);
}

/**
 * @tc.name      : fchmod_0200
 * @tc.desc      : Verify permission to modify files (overall parameter settings)
 * @tc.level     : Level 0
 */
void Fchmodat0200(void)
{
    int fd;
    struct stat buf;
    char path[PATH_MAX] = { 0 };
    FILE_ABSOLUTE_PATH(STR_TEST_TXT, path);
    fd = open(path, O_RDWR | O_CREAT, TEST_MODE);
    int result = fchmodat(AT_FDCWD, path, S_IRWXU | S_IRWXG | S_IRWXO, AT_SYMLINK_NOFOLLOW);
    stat(path, &buf);
    if (result != 0) {
        close(fd);
        int removeRet = remove(path);
        EXPECT_EQ("fchmodat_0200", removeRet, 0);
        return;
    }
    EXPECT_EQ("fchmodat_0200", (buf.st_mode & MODE_MASK), (g_successValue & MODE_MASK));
    close(fd);
    int removeRet = remove(path);
    EXPECT_EQ("fchmodat_0200", removeRet, 0);
}

/**
 * @tc.name      : fchmod_0300
 * @tc.desc      : Failed to verify permission to modify file (fd parameter is invalid)
 * @tc.level     : Level 2
 */
void Fchmodat0300(void)
{
    int result =
        fchmodat(-1, "/data/storage/el2/base/cache/test.txt", S_IRWXU | S_IRWXG | S_IRWXO, AT_SYMLINK_NOFOLLOW);
    EXPECT_EQ("fchmodat_0300", result, g_failed);
}

static int FchmodatTestImpl(int argc, char* argv[])
{
    Fchmodat0100();
    Fchmodat0200();
    Fchmodat0300();

    return T_STATUS;
}

int FchmodatTest(void)
{
    static char libcProg[] = "libc_test";
    char* libcArgv[] = { libcProg, nullptr };
    return FchmodatTestImpl(1, libcArgv);
}
