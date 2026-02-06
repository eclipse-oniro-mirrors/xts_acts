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
 * See the License for the specific language governing permissions and * limitations under the License.
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
 * @tc.name   testAccess
 * @tc.number SUB_KERNEL_FS_UNISTD_0100
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(FileSystemTest, testAccess, Function | MediumTest | Level0)
{
    int fd = 0;
    fd = creat(FILE0, 0777);
    EXPECT_NE(fd, -1) << "> creat faild errno = " << errno;
    EXPECT_NE(close(fd), -1) << "> close errno = " << errno;
    EXPECT_EQ(access(FILE0, F_OK), 0) << "> access F_OK errno = " << errno;
}

/**
 * @tc.name   testAccessEnoent
 * @tc.number SUB_KERNEL_FS_UNISTD_0110
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(FileSystemTest, testAccessEnoent, Function | MediumTest | Level0)
{
    EXPECT_EQ(access(FILE0, F_OK), -1) << "> access F_OK expect faild but success";
    EXPECT_EQ(errno, ENOENT);
}

#if defined(LITE_FS_JFFS2)
/**
 * @tc.name   testAccessRok
 * @tc.number SUB_KERNEL_FS_UNISTD_0120
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(FileSystemTest, testAccessRok, Function | MediumTest | Level1)
{
    int fd = 0;
    fd = creat(FILE0, 0777);
    EXPECT_NE(fd, -1) << "> creat faild errno = " << errno;
    EXPECT_NE(close(fd), -1) << "> close errno = " << errno;
    EXPECT_EQ(access(FILE0, R_OK), 0) << "> access F_OK errno = " << errno;
}
#endif

#if defined(LITE_FS_JFFS2)
/**
 * @tc.name   testAccessWok
 * @tc.number SUB_KERNEL_FS_UNISTD_0130
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(FileSystemTest, testAccessWok, Function | MediumTest | Level1)
{
    int fd = 0;
    fd = creat(FILE0, 0777);
    EXPECT_NE(fd, -1) << "> creat faild errno = " << errno;
    EXPECT_NE(close(fd), -1) << "> close errno = " << errno;
    EXPECT_EQ(access(FILE0, W_OK), 0) << "> access F_OK errno = " << errno;
}
#endif

#if defined(LITE_FS_JFFS2)
/**
 * @tc.name   testAccessXok
 * @tc.number SUB_KERNEL_FS_UNISTD_0140
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(FileSystemTest, testAccessXok, Function | MediumTest | Level1)
{
    int fd = 0;
    fd = creat(FILE0, 0777);
    EXPECT_NE(fd, -1) << "> creat faild errno = " << errno;
    EXPECT_NE(close(fd), -1) << "> close errno = " << errno;
    EXPECT_EQ(access(FILE0, X_OK), 0) << "> access F_OK errno = " << errno;
}
#endif

/**
 * @tc.name   testChdir
 * @tc.number SUB_KERNEL_FS_UNISTD_0200
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(FileSystemTest, testChdir, Function | MediumTest | Level1)
{
    char testDir[MAX_PATH_SIZE];
    const char *expectDirStandard = TOP_DIR "/" DIR0;
    EXPECT_NE(mkdir(DIR0, 0777), -1) << "> mkdir errno = " << errno;
    EXPECT_NE(chdir(DIR0), -1) << "> chdir errno = " << errno;
    EXPECT_NE(getcwd(testDir, sizeof(testDir)), nullptr) << "> getcwd errno = " << errno;
    EXPECT_NE(chdir(TOP_DIR), -1) << "> chdir errno = " << errno;

    EXPECT_STREQ(testDir, expectDirStandard);
    LOG("> expectDirStandard  = %s", expectDirStandard);
    LOG("> testDir   = %s", testDir);
}

/**
 * @tc.name   testChdirEnoent
 * @tc.number SUB_KERNEL_FS_UNISTD_0210
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(FileSystemTest, testChdirEnoent, Function | MediumTest | Level3)
{
    const char *fileName = "not_exist_file";
    EXPECT_EQ(chdir(fileName), -1) << "> chdir errno = " << errno;
    EXPECT_EQ(errno, ENOENT);
    EXPECT_NE(chdir(TOP_DIR), -1) << "> chdir errno = " << errno;
}

/**
 * @tc.name   testChdirEnametoolong
 * @tc.number SUB_KERNEL_FS_UNISTD_0220
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(FileSystemTest, testChdirEnametoolong, Function | MediumTest | Level3)
{
    const char *fileName = "12345678901234567890123456789012345678901234567890\
                            12345678901234567890123456789012345678901234567890\
                            12345678901234567890123456789012345678901234567890\
                            12345678901234567890123456789012345678901234567890\
                            12345678901234567890123456789012345678901234567890\
                            12345678901234567890123456789012345678901234567890\
                            12345678901234567890123456789012345678901234567890\
                            12345678901234567890123456789012345678901234567890";
    EXPECT_EQ(chdir(fileName), -1) << "> chdir errno = " << errno;
    EXPECT_EQ(errno, ENAMETOOLONG);
    EXPECT_NE(chdir(TOP_DIR), -1) << "> chdir errno = " << errno;
}

/**
 * @tc.name   testChdirEnotdir
 * @tc.number SUB_KERNEL_FS_UNISTD_0230
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(FileSystemTest, testChdirEnotdir, Function | MediumTest | Level3)
{
    int fd = 0;
    const char *fileName = FILE0;
    fd = creat(FILE0, 0777);
    EXPECT_NE(fd, -1) << "> creat faild errno = " << errno;
    EXPECT_NE(close(fd), -1) << "> close errno = " << errno;
    EXPECT_EQ(chdir(fileName), -1) << "> chdir errno = " << errno;
    EXPECT_EQ(errno, ENOTDIR);
    EXPECT_NE(chdir(TOP_DIR), -1) << "> chdir errno = " << errno;
}
#if defined(LITE_FS_VFAT)
/**
 * @tc.name   testFtruncate
 * @tc.number SUB_KERNEL_FS_UNISTD_0500
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(FileSystemTest, testFtruncate, Function | MediumTest | Level1)
{
    struct stat statbuf;
    char writeBuf[] = "this is a file";
    int fd = 0;

    fd = open(FILE0, O_CREAT | O_RDWR, 0777);
    EXPECT_NE(fd, -1) << "> open faild errno = " << errno;
    EXPECT_NE(write(fd, writeBuf, sizeof(writeBuf)), -1) << "> write errno = " << errno;

    EXPECT_NE(ftruncate(fd, 1000), -1) << "truncate errno = " << errno;
    EXPECT_NE(close(fd), -1) << "> close errno = " << errno;

    EXPECT_NE(stat(FILE0, &statbuf), -1) << "> fstat errno = " << errno;
    EXPECT_EQ(statbuf.st_size, 1000);
}
#endif

#if defined(LITE_FS_VFAT)
/**
 * @tc.name   testFtruncateEinval
 * @tc.number SUB_KERNEL_FS_UNISTD_0501
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(FileSystemTest, testFtruncateEinval, Function | MediumTest | Level3)
{
    char writeBuf[] = "this is a file";
    int fd = 0;

    fd = open(FILE0, O_CREAT | O_RDWR, 0777);
    EXPECT_NE(fd, -1) << "> open faild errno = " << errno;
    EXPECT_NE(write(fd, writeBuf, sizeof(writeBuf)), -1) << "> write errno = " << errno;

    EXPECT_EQ(ftruncate(fd, -1), -1);
    EXPECT_EQ(errno, EINVAL);
    EXPECT_NE(close(fd), -1) << "> close errno = " << errno;
}
#endif

#if defined(LITE_FS_VFAT)
/**
 * @tc.name   testFtruncateEacces
 * @tc.number SUB_KERNEL_FS_UNISTD_0502
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(FileSystemTest, testFtruncateEacces, Function | MediumTest | Level3)
{
    EXPECT_EQ(ftruncate(STDERR_FILENO, 10), -1);
    EXPECT_EQ(errno, ENOSYS);
}
#endif

#if defined(LITE_FS_VFAT)
/**
 * @tc.name   testFtruncateEbadf
 * @tc.number SUB_KERNEL_FS_UNISTD_0503
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(FileSystemTest, testFtruncateEbadf, Function | MediumTest | Level3)
{
    int invalidFd = 99999;
    EXPECT_EQ(ftruncate(invalidFd, 10), -1);
    EXPECT_EQ(errno, EBADF);
}
#endif

#if defined(LITE_FS_VFAT)
/**
 * @tc.name   testTruncate
 * @tc.number SUB_KERNEL_FS_UNISTD_0510
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(FileSystemTest, testTruncate, Function | MediumTest | Level1)
{
    struct stat statbuf;
    char writeBuf[] = "this is a file";
    int fd = 0;

    fd = open(FILE0, O_CREAT | O_RDWR, 0777);
    EXPECT_NE(fd, -1) << "> open faild errno = " << errno;
    EXPECT_NE(write(fd, writeBuf, sizeof(writeBuf)), -1) << "> write errno = " << errno;
    EXPECT_NE(close(fd), -1) << "> close errno = " << errno;

    EXPECT_NE(truncate(FILE0, 100), -1) << "truncate errno = " << errno;
    EXPECT_NE(stat(FILE0, &statbuf), -1) << "> fstat errno = " << errno;
    EXPECT_EQ(statbuf.st_size, 100);
}
#endif

#if defined(LITE_FS_VFAT)
/**
 * @tc.name   testTruncateEinval
 * @tc.number SUB_KERNEL_FS_UNISTD_0511
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(FileSystemTest, testTruncateEinval, Function | MediumTest | Level3)
{
    char writeBuf[] = "this is a file";
    int fd = 0;

    fd = open(FILE0, O_CREAT | O_RDWR, 0777);
    EXPECT_NE(fd, -1) << "> open faild errno = " << errno;
    EXPECT_NE(write(fd, writeBuf, sizeof(writeBuf)), -1) << "> write errno = " << errno;
    EXPECT_NE(close(fd), -1) << "> close errno = " << errno;

    EXPECT_EQ(truncate(FILE0, -1), -1);
    EXPECT_EQ(errno, EINVAL);
}
#endif

#if defined(LITE_FS_VFAT)
/**
 * @tc.name   testTruncateEacces
 * @tc.number SUB_KERNEL_FS_UNISTD_0512
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(FileSystemTest, testTruncateEacces, Function | MediumTest | Level3)
{
    EXPECT_EQ(truncate("/", 10), -1);
    printf("errno = %d\n", errno);
    EXPECT_EQ(errno, EISDIR);
}
#endif

#if defined(LITE_FS_VFAT)
/**
 * @tc.name   testTruncateEnametoolong
 * @tc.number SUB_KERNEL_FS_UNISTD_0513
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(FileSystemTest, testTruncateEnametoolong, Function | MediumTest | Level3)
{
    const char *fileName = "12345678901234567890123456789012345678901234567890\
                            12345678901234567890123456789012345678901234567890\
                            12345678901234567890123456789012345678901234567890\
                            12345678901234567890123456789012345678901234567890\
                            12345678901234567890123456789012345678901234567890\
                            12345678901234567890123456789012345678901234567890\
                            12345678901234567890123456789012345678901234567890\
                            12345678901234567890123456789012345678901234567890";
    EXPECT_EQ(truncate(fileName, 10), -1);
    EXPECT_EQ(errno, ENAMETOOLONG);
}
#endif

#if defined(LITE_FS_VFAT)
/**
 * @tc.name   testTruncateEnoent
 * @tc.number SUB_KERNEL_FS_UNISTD_0514
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
HWTEST_F(FileSystemTest, testTruncateEnoent, Function | MediumTest | Level3)
{
    const char invalidPath[] = "noExit";
    EXPECT_EQ(truncate(invalidPath, 10), -1);
    EXPECT_EQ(errno, ENOENT);
}
#endif

#ifdef LITE_FS_PATHCONF
/**
 * @tc.name   testPathconf
 * @tc.number SUB_KERNEL_FS_UNISTD_0600
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(FileSystemTest, testPathconf, Function | MediumTest | Level2)
{
    const char filePath[] = TOP_DIR "/" DIR0 "/" DIR0_FILE0;
    CreateTestFolder();

    // use correctly
    int param[] = {
        _PC_LINK_MAX,
        _PC_MAX_CANON,
        _PC_MAX_INPUT,
        _PC_NAME_MAX,
        _PC_PATH_MAX,
        _PC_PIPE_BUF,
        _PC_CHOWN_RESTRICTED,
        _PC_NO_TRUNC,
        _PC_VDISABLE,
        _PC_SYNC_IO,
        _PC_ASYNC_IO,
        _PC_PRIO_IO,
        _PC_SOCK_MAXBUF,
        _PC_FILESIZEBITS,
        _PC_REC_INCR_XFER_SIZE,
        _PC_REC_MAX_XFER_SIZE,
        _PC_REC_MIN_XFER_SIZE,
        _PC_REC_XFER_ALIGN,
        _PC_ALLOC_SIZE_MIN,
        _PC_SYMLINK_MAX,
        _PC_2_SYMLINKS
    };
    int size = sizeof(param) / sizeof(int);
    for (int i = 0; i < size; i++) {
        errno = 0;
        if (pathconf(filePath, param[i]) == -1) {
            EXPECT_EQ(errno, 0) << "fpathconf i = " << i << " errno = " << errno;
        }
    }
}
#endif

#ifdef LITE_FS_PATHCONF
/**
 * @tc.name   testPathconfEinval
 * @tc.number SUB_KERNEL_FS_UNISTD_0610
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(FileSystemTest, testPathconfEinval, Function | MediumTest | Level2)
{
    const char filePath[] = TOP_DIR "/" DIR0 "/" DIR0_FILE0;
    CreateTestFolder();

    // invalid name
    EXPECT_EQ(pathconf(filePath, -100), -1);
    EXPECT_EQ(errno, EINVAL) << "fpathconf invalidPath errno = " << errno;
}
#endif

#ifdef LITE_FS_PATHCONF
/**
 * @tc.name   testPathconfEfault
 * @tc.number SUB_KERNEL_FS_UNISTD_0620
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(FileSystemTest, testPathconfEfault, Function | MediumTest | Level2)
{
    // null path
    EXPECT_EQ(pathconf(nullptr, _PC_LINK_MAX), -1);
    EXPECT_EQ(errno, EFAULT) << "fpathconf invalidPath errno = " << errno;
}
#endif

#ifdef LITE_FS_PATHCONF
/**
 * @tc.name   testPathconfEnoent
 * @tc.number SUB_KERNEL_FS_UNISTD_0630
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(FileSystemTest, testPathconfEnoent, Function | MediumTest | Level2)
{
    // path not exit
    const char invalidPath[] = "noExit";
    EXPECT_EQ(pathconf(invalidPath, _PC_LINK_MAX), -1);
    EXPECT_EQ(errno, ENOENT) << "fpathconf invalidPath errno = " << errno;
}
#endif

#ifdef LITE_FS_PATHCONF
/**
 * @tc.name   testFpathconf
 * @tc.number SUB_KERNEL_FS_UNISTD_0700
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(FileSystemTest, testFpathconf, Function | MediumTest | Level2)
{
    int fd = open(FILE0, O_CREAT | O_RDWR, 0777);
    EXPECT_NE(fd, -1) << "> open errno = " << errno;

    // use correctly
    int param[] = {
        _PC_LINK_MAX,
        _PC_MAX_CANON,
        _PC_MAX_INPUT,
        _PC_NAME_MAX,
        _PC_PATH_MAX,
        _PC_PIPE_BUF,
        _PC_CHOWN_RESTRICTED,
        _PC_NO_TRUNC,
        _PC_VDISABLE,
        _PC_SYNC_IO,
        _PC_ASYNC_IO,
        _PC_PRIO_IO,
        _PC_SOCK_MAXBUF,
        _PC_FILESIZEBITS,
        _PC_REC_INCR_XFER_SIZE,
        _PC_REC_MAX_XFER_SIZE,
        _PC_REC_MIN_XFER_SIZE,
        _PC_REC_XFER_ALIGN,
        _PC_ALLOC_SIZE_MIN,
        _PC_SYMLINK_MAX,
        _PC_2_SYMLINKS
    };
    int size = sizeof(param) / sizeof(int);
    for (int i = 0; i < size; i++) {
        errno = 0;
        if (fpathconf(fd, param[i]) == -1) {
            EXPECT_EQ(errno, 0) << "fpathconf i = " << i << " errno = " << errno;
        }
    }
    EXPECT_NE(close(fd), -1) << "> close errno = " << errno;
}
#endif

#ifdef LITE_FS_PATHCONF
/**
 * @tc.name   testFpathconfEinval
 * @tc.number SUB_KERNEL_FS_UNISTD_0710
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(FileSystemTest, testFpathconfEinval, Function | MediumTest | Level2)
{
    int fd = open(FILE0, O_CREAT | O_RDWR, 0777);
    EXPECT_NE(fd, -1) << "> open errno = " << errno;

    // invalid name
    errno = 0;
    EXPECT_EQ(fpathconf(fd, -100), -1);
    EXPECT_EQ(errno, EINVAL) << "fpathconf invalidPath errno = " << errno;

    EXPECT_NE(close(fd), -1) << "> close errno = " << errno;
}
#endif

#ifdef LITE_FS_PATHCONF
/**
 * @tc.name   testFpathconfEbadf
 * @tc.number SUB_KERNEL_FS_UNISTD_0720
 * @tc.desc   [C- SOFTWARE -0200]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
HWTEST_F(FileSystemTest, testFpathconfEbadf, Function | MediumTest | Level2)
{
    // invalid file description
    EXPECT_EQ(fpathconf(-100, _PC_LINK_MAX), -1);
    EXPECT_EQ(errno, EBADF) << "fpathconf invalidPath errno = " << errno;
}
#endif
