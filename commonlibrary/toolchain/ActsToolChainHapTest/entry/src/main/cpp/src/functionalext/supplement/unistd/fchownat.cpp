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

#include <cerrno>
#include <cstdio>
#include <fcntl.h>
#include <sys/stat.h>
#include <unistd.h>
#include "functionalext.h"

#ifndef TEST_MODE
#define TEST_MODE 0666
#endif

// Use absolute sandbox path
#define FCHOWNAT_TEST_FILE "/data/storage/el2/base/cache/fchownattest.txt"

/**
 * @tc.name      : fchownat_0100
 * @tc.desc      : Parameter fd is not equal to AT_FDCWD, the user and group that can change the owner of the file.
 * @tc.level     : Level 0
 * @note         : fchownat() requires privileged access to change file ownership. On unprivileged platforms,
 *                 this test verifies that the call fails gracefully with EPERM.
 */
void Fchownat0100(void)
{
    int fd = open(FCHOWNAT_TEST_FILE, O_RDWR | O_CREAT, TEST_MODE);
    if (fd < 0) {
        t_error("fchownat_0100: failed to create test file (errno=%d)\n", errno);
        return;
    }
    EXPECT_TRUE("fchownat_0100", fd >= 0);

    // Get original ownership
    struct stat bufBefore;
    if (fstat(fd, &bufBefore) != 0) {
        t_error("fchownat_0100: fstat before fchownat failed (errno=%d)\n", errno);
        close(fd);
        int removeRet = remove(FCHOWNAT_TEST_FILE);
        EXPECT_EQ("fchownat_0100", removeRet, 0);
        return;
    }

    printf("fchownat_0100: Original uid=%d, gid=%d\n", bufBefore.st_uid, bufBefore.st_gid);

    // Try to change ownership to root (uid=0, gid=0)
    int ret = fchownat(fd, FCHOWNAT_TEST_FILE, 0, 0, AT_SYMLINK_NOFOLLOW);

    if (ret != 0) {
        // Expected behavior on unprivileged platforms
        if (errno == EPERM || errno == EACCES) {
            printf("fchownat_0100: fchownat failed as expected without privileges (errno=%d)\n", errno);
            printf("fchownat_0100: Changing file ownership requires root privileges.\n");
            close(fd);
            int removeRet = remove(FCHOWNAT_TEST_FILE);
            EXPECT_EQ("fchownat_0100", removeRet, 0);
            return; // Don't fail the test
        } else {
            t_error("fchownat_0100: fchownat failed with unexpected errno=%d\n", errno);
            close(fd);
            int removeRet = remove(FCHOWNAT_TEST_FILE);
            EXPECT_EQ("fchownat_0100", removeRet, 0);
            return;
        }
    }

    // If we reach here, fchownat succeeded (only possible with proper privileges)
    printf("fchownat_0100: fchownat succeeded (running with privileges)\n");

    // Verify the ownership was changed
    struct stat bufAfter;
    int st = fstat(fd, &bufAfter);
    if (st == 0) {
        EXPECT_EQ("fchownat_0100", bufAfter.st_uid, 0);
        EXPECT_EQ("fchownat_0100", bufAfter.st_gid, 0);

        // Restore original ownership
        fchownat(fd, FCHOWNAT_TEST_FILE, bufBefore.st_uid, bufBefore.st_gid, AT_SYMLINK_NOFOLLOW);
    }

    close(fd);
    int removeRet = remove(FCHOWNAT_TEST_FILE);
    EXPECT_EQ("fchownat_0100", removeRet, 0);
}

/**
 * @tc.name      : fchownat_0200
 * @tc.desc      : Parameter fd equal to AT_FDCWD, the user and group that can change the owner of the file.
 * @tc.level     : Level 1
 * @note         : fchownat() requires privileged access to change file ownership. On unprivileged platforms,
 *                 this test verifies that the call fails gracefully with EPERM.
 */
void Fchownat0200(void)
{
    int fd = open(FCHOWNAT_TEST_FILE, O_RDWR | O_CREAT, TEST_MODE);
    if (fd < 0) {
        t_error("fchownat_0200: failed to create test file (errno=%d)\n", errno);
        return;
    }
    EXPECT_TRUE("fchownat_0200", fd >= 0);
    close(fd); // Close before using AT_FDCWD

    // Get original ownership
    struct stat bufBefore;
    if (stat(FCHOWNAT_TEST_FILE, &bufBefore) != 0) {
        t_error("fchownat_0200: stat before fchownat failed (errno=%d)\n", errno);
        int removeRet = remove(FCHOWNAT_TEST_FILE);
        EXPECT_EQ("fchownat_0200", removeRet, 0);
        return;
    }

    printf("fchownat_0200: Original uid=%d, gid=%d\n", bufBefore.st_uid, bufBefore.st_gid);

    // Try to change ownership to root using AT_FDCWD
    int ret = fchownat(AT_FDCWD, FCHOWNAT_TEST_FILE, 0, 0, AT_SYMLINK_NOFOLLOW);

    if (ret != 0) {
        // Expected behavior on unprivileged platforms
        if (errno == EPERM || errno == EACCES) {
            printf("fchownat_0200: fchownat with AT_FDCWD failed as expected without privileges (errno=%d)\n", errno);
            printf("fchownat_0200: Changing file ownership requires root privileges.\n");
            int removeRet = remove(FCHOWNAT_TEST_FILE);
            EXPECT_EQ("fchownat_0200", removeRet, 0);
            return; // Don't fail the test
        } else {
            t_error("fchownat_0200: fchownat with AT_FDCWD failed with unexpected errno=%d\n", errno);
            int removeRet = remove(FCHOWNAT_TEST_FILE);
            EXPECT_EQ("fchownat_0200", removeRet, 0);
            return;
        }
    }

    // If we reach here, fchownat succeeded (only possible with proper privileges)
    printf("fchownat_0200: fchownat with AT_FDCWD succeeded (running with privileges)\n");

    // Verify the ownership was changed
    struct stat bufAfter;
    int st = stat(FCHOWNAT_TEST_FILE, &bufAfter);
    if (st == 0) {
        EXPECT_EQ("fchownat_0200", bufAfter.st_uid, 0);
        EXPECT_EQ("fchownat_0200", bufAfter.st_gid, 0);

        // Restore original ownership
        fchownat(AT_FDCWD, FCHOWNAT_TEST_FILE, bufBefore.st_uid, bufBefore.st_gid, AT_SYMLINK_NOFOLLOW);
    }

    int removeRet = remove(FCHOWNAT_TEST_FILE);
    EXPECT_EQ("fchownat_0200", removeRet, 0);
}

static int FchownatTestImpl(int argc, char* argv[])
{
    Fchownat0100();
    Fchownat0200();
    return T_STATUS;
}

int FchownatTest(void)
{
    static char libcProg[] = "libc_test";
    char* libcArgv[] = { libcProg, nullptr };
    return FchownatTestImpl(1, libcArgv);
}
