/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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

#ifndef COMMERCIAL
/**
 * @tc.name   testUmask
 * @tc.number SUB_KERNEL_FS_STAT_0100
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(FileSystemTest, testUmask, Function | MediumTest | Level2)
{
    // set mode
    mode_t maskNew = GetRandom(077);
    mode_t maskPre = umask(maskNew);
    LOG("> maskPre = %d", maskPre);
    LOG("> maskNew = %d", maskNew);
    EXPECT_EQ(umask(maskPre), maskNew) << "> umask error";
}
#endif
#if defined(LITE_FS_JFFS2)
#ifndef COMMERCIAL
/**
 * @tc.name   testStatLimt
 * @tc.number SUB_KERNEL_FS_STAT_0210
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(FileSystemTest, testStatLimt, Function | MediumTest | Level3)
{
    int fd = 0;
    mode_t mode = 0777;
    const char *filePath = TOP_DIR "/" FILE0;
    struct stat buf;

    // set mode
    mode_t maskNew = GetRandom(077);
    mode_t maskPre = umask(maskNew);
    mode = 0700 + GetRandom(077);
    LOG("> maskPre = %d", maskPre);
    LOG("> maskNew = %d", maskNew);
    LOG("> mode = %d", mode);

    fd = open(FILE0, O_CREAT | O_RDWR, mode);
    EXPECT_NE(close(fd), -1) << "> close errno = " << errno;
    EXPECT_NE(stat(filePath, &buf), -1) << "> fstat errno = " << errno;

    EXPECT_NE((buf.st_mode & S_IFREG), 0) << "> check file type faild";
    EXPECT_EQ((buf.st_mode & 0777), (mode & (~maskNew))) << "> check file permission faild";
    EXPECT_EQ(buf.st_nlink, 1) << "> buf.st_nlink not expect";                      // Number of (hard) links to file
    EXPECT_EQ(buf.st_uid, getuid()) << "> The UIDs are different";                  // uid
    EXPECT_EQ(buf.st_gid, getgid()) << "> The GIDs are different";                  // giu
    umask(maskPre);
}
#endif
#endif
#if defined(LITE_FS_JFFS2)
#ifndef COMMERCIAL
/**
 * @tc.name   testLstatLimt
 * @tc.number SUB_KERNEL_FS_STAT_0310
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(FileSystemTest, testLstatLimt, Function | MediumTest | Level3)
{
    int fd = 0;
    mode_t mode = 0777;
    const char *filePath = TOP_DIR "/" FILE0;
    struct stat buf;

    // set mode
    mode_t maskNew = GetRandom(077);
    mode_t maskPre = umask(maskNew);
    mode = 0700 + GetRandom(077);
    LOG("> maskPre = %d", maskPre);
    LOG("> maskNew = %d", maskNew);
    LOG("> mode = %d", mode);

    fd = open(filePath, O_CREAT | O_RDWR, mode);
    EXPECT_NE(fd, -1) << "> open faild errno = " << errno;
    EXPECT_NE(close(fd), -1) << "> close errno = " << errno;

    EXPECT_NE(lstat(filePath, &buf), -1) << "> fstat errno = " << errno;
    EXPECT_NE((buf.st_mode & S_IFREG), 0) << "> check file type faild";
    EXPECT_EQ((buf.st_mode & 0777), (mode & (~maskNew))) << "> check file permission faild";
    EXPECT_EQ(buf.st_nlink, 1) << "> buf.st_nlink not expect";                      // Number of (hard) links to file
    EXPECT_EQ(buf.st_uid, getuid()) << "> The UIDs are different";                  // uid
    EXPECT_EQ(buf.st_gid, getgid()) << "> The GIDs are different";                  // giu
    umask(maskPre);
}
#endif
#endif
#if defined(LITE_FS_JFFS2)
#ifndef COMMERCIAL
/**
 * @tc.name   testFstatLimt
 * @tc.number SUB_KERNEL_FS_STAT_0410
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(FileSystemTest, testFstatLimt, Function | MediumTest | Level3)
{
    int fd = 0;
    mode_t mode = 0777;
    struct stat buf;

    // set mode
    mode_t maskNew = GetRandom(077);
    mode_t maskPre = umask(maskNew);
    mode = 0700 + GetRandom(077);
    LOG("> maskPre = %d", maskPre);
    LOG("> maskNew = %d", maskNew);
    LOG("> mode = %d", mode);

    fd = open(FILE0, O_CREAT | O_RDWR, mode);
    EXPECT_NE(fd, -1) << "> open faild errno = " << errno;

    EXPECT_NE(fstat(fd, &buf), -1) << "> fstat errno = " << errno;
    EXPECT_NE((buf.st_mode & S_IFREG), 0) << "> check file type faild";
    EXPECT_EQ((buf.st_mode & 0777), (mode & (~maskNew))) << "> check file permission faild";
    EXPECT_EQ(buf.st_nlink, 1) << "> buf.st_nlink not expect";                      // Number of (hard) links to file
    EXPECT_EQ(buf.st_uid, getuid()) << "> The UIDs are different";                  // uid
    EXPECT_EQ(buf.st_gid, getgid()) << "> The GIDs are different";                  // giu

    EXPECT_NE(close(fd), -1) << "> close errno = " << errno;
    umask(maskPre);
}
#endif
#endif

/**
 * @tc.name   testMkdirat
 * @tc.number SUB_KERNEL_FS_STAT_0500
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(FileSystemTest, testMkdirat, Function | MediumTest | Level0)
{
    const char *pathName = TOP_DIR "/" DIR0;
    EXPECT_NE(mkdirat(AT_FDCWD, pathName, 0777), -1) << "> creat faild errno = " << errno;
    EXPECT_EQ(access(pathName, F_OK), 0) << "> access F_OK errno = " << errno;
    EXPECT_EQ(remove(pathName), 0) << "> remove errno = " << errno;
    EXPECT_NE(access(pathName, F_OK), 0) << "> access F_OK expect faild but success";
}

/**
 * @tc.name   testMkdiratEinval
 * @tc.number SUB_KERNEL_FS_STAT_0510
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(FileSystemTest, testMkdiratEinval, Function | MediumTest | Level3)
{
    EXPECT_EQ(mkdirat(AT_FDCWD, nullptr, 0777), -1) << "> should be error";
    EXPECT_EQ(errno, EINVAL);
}

/**
 * @tc.name   testMkdiratEnametoolong
 * @tc.number SUB_KERNEL_FS_STAT_0520
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(FileSystemTest, testMkdiratEnametoolong, Function | MediumTest | Level3)
{
    const char *pathName = "12345678901234567890123456789012345678901234567890\
                            12345678901234567890123456789012345678901234567890\
                            12345678901234567890123456789012345678901234567890\
                            12345678901234567890123456789012345678901234567890\
                            12345678901234567890123456789012345678901234567890\
                            12345678901234567890123456789012345678901234567890\
                            12345678901234567890123456789012345678901234567890\
                            12345678901234567890123456789012345678901234567890";
    EXPECT_EQ(mkdirat(AT_FDCWD, pathName, 0777), -1) << "> should be error";
    EXPECT_EQ(errno, ENAMETOOLONG);
}

/**
 * @tc.name   testMkdiratEnoent
 * @tc.number SUB_KERNEL_FS_STAT_0530
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(FileSystemTest, testMkdiratEnoent, Function | MediumTest | Level3)
{
    const char *pathName = TOP_DIR "/NoExist/NoExist";
    EXPECT_EQ(mkdirat(AT_FDCWD, pathName, 0777), -1) << "> should be error";
    EXPECT_EQ(errno, ENOENT);
}

/**
 * @tc.name   testMkdiratEexist
 * @tc.number SUB_KERNEL_FS_STAT_0540
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(FileSystemTest, testMkdiratEexist, Function | MediumTest | Level3)
{
    const char *pathName = TOP_DIR "/" DIR0;
    EXPECT_NE(mkdirat(AT_FDCWD, pathName, 0777), -1) << "> creat faild errno = " << errno;
    EXPECT_EQ(access(pathName, F_OK), 0) << "> access F_OK errno = " << errno;
    EXPECT_EQ(mkdirat(AT_FDCWD, pathName, 0777), -1) << "> should be error";
    EXPECT_EQ(errno, EEXIST);
}

#if defined(LITE_FS_JFFS2)
/**
 * @tc.name   testChmod
 * @tc.number SUB_KERNEL_FS_STAT_0600
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(FileSystemTest, testChmod, Function | MediumTest | Level3)
{
    struct stat buf;
    mode_t maskPre = umask(0);
    const char *fileName = TOP_DIR "/" FILE0;
    int fd = creat(FILE0, 0777);
    EXPECT_NE(fd, -1) << "> creat faild errno = " << errno;
    EXPECT_NE(close(fd), -1) << "> close errno = " << errno;

    mode_t mode = 0666;
    EXPECT_EQ(chmod(fileName, mode), 0);
    EXPECT_NE(stat(fileName, &buf), -1) << "> fstat errno = " << errno;
    EXPECT_EQ((buf.st_mode & 0777), mode) << "> check file permission faild";
    umask(maskPre);
}
#endif
