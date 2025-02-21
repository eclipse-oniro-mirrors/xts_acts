/*
 * Copyright (c) 2020-2021 Huawei Device Co., Ltd.
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
#include "FileSystemTest.h"
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include <sys/stat.h>
#include <sys/types.h>
#include <fcntl.h>
#include <unistd.h>
#include <dirent.h>
#include <ftw.h>
#include <libgen.h>

#include <gtest/gtest.h>

#include "utils.h"
#include "log.h"
#include "KernelConstants.h"
#include "libfs.h"

using namespace testing::ext;
/**
 * @tc.number   SUB_KERNEL_FS_STDIO_0700
 * @tc.name     basic function test : Use the rename function to rename files.
 * @tc.desc     [C- SOFTWARE -0200]
 */
HWTEST_F(FileSystemTest, testRename, Function | MediumTest | Level3)
{
    int fd = 0;
    const char *newFileName = "FILE_NEW";
    fd = creat(FILE0, 0777);
    EXPECT_NE(fd, -1) << "> creat faild errno = " << errno;
    EXPECT_NE(close(fd), -1) << "> close errno = " << errno;

    EXPECT_NE(rename(FILE0, newFileName), -1) << "> rename errno = " << errno;
    EXPECT_NE(unlink(newFileName), -1) << "> unlink errno = " << errno;
}

/**
 * @tc.number   SUB_KERNEL_FS_STDIO_0710
 * @tc.name     basic function test : Use the rename function to rename directories.
 * @tc.desc     [C- SOFTWARE -0200]
 */
HWTEST_F(FileSystemTest, testRenameDir, Function | MediumTest | Level3)
{
    const char *newDirName = "DIR_NEW";
    EXPECT_NE(mkdir(DIR0, 0777), -1) << "> mkdir errno = " << errno;

    EXPECT_NE(rename(DIR0, newDirName), -1) << "> rename errno = " << errno;
    EXPECT_NE(rmdir(newDirName), -1) << "> rmdir errno = " << errno;
}
