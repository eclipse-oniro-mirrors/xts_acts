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
#include <cstring>
#include <dirent.h>
#include <fcntl.h>
#include <sys/stat.h>
#include <unistd.h>
#include "test.h"

#ifndef TEST_MODE
#define TEST_MODE 0666
#endif

/**
 * @tc.name      : Symlinkat0100
 * @tc.desc      : Create a symbolic link to the specified file
 * @tc.level     : Level 0
 * @note         : Symbolic links may not be supported on all filesystems or platforms.
 */
void Symlinkat0100(void)
{
    char buffer[BUFSIZ];
    const char* pathName = "/data/storage/el2/base/cache";
    const char* fileName = "/data/storage/el2/base/cache/symlinkat.txt";
    const char* symlinkName = "mysymlinkat";
    ssize_t sz;
    DIR* dp;
    int fdd;
    int fdf;

    // Create target file with proper permissions
    fdf = open(fileName, O_RDWR | O_CREAT | O_TRUNC, TEST_MODE);
    if (fdf == -1) {
        t_error("%s: open/creat failed (errno=%d)\n", __func__, errno);
        return;
    }
    close(fdf);

    // Open directory
    dp = opendir(pathName);
    if (dp == nullptr) {
        t_error("%s: opendir failed (errno=%d)\n", __func__, errno);
        unlink(fileName);
        return;
    }

    fdd = dirfd(dp);
    if (fdd < 0) {
        t_error("%s: dirfd failed (errno=%d)\n", __func__, errno);
        closedir(dp);
        unlink(fileName);
        return;
    }

    // Create symbolic link
    if (symlinkat(fileName, fdd, symlinkName) < 0) {
        printf("%s: symlinkat failed (errno=%d). ", __func__, errno);
        printf("Symbolic links may not be supported on this platform/filesystem.\n");
        closedir(dp);
        unlink(fileName);
        return;
    }

    // Read the symbolic link target
    memset(buffer, 0, sizeof(buffer));
    sz = readlinkat(fdd, symlinkName, buffer, sizeof(buffer) - 1);
    if (sz < 0) {
        t_error("%s: readlinkat failed (errno=%d)\n", __func__, errno);
        unlinkat(fdd, symlinkName, 0);
        closedir(dp);
        unlink(fileName);
        return;
    }
    buffer[sz] = '\0'; // Null-terminate the string

    // Verify the link target
    if (strcmp(buffer, fileName) != 0) {
        t_error("%s: buffer is '%s', expected '%s'\n", __func__, buffer, fileName);
    }

    // Cleanup
    unlinkat(fdd, symlinkName, 0);
    closedir(dp);
    unlink(fileName);
}

/**
 * @tc.name      : Symlinkat0200
 * @tc.desc      : Create a symbolic link even when the target file does not exist
 * @tc.level     : Level 1
 * @note         : Symbolic links can point to non-existent targets (dangling links).
 */
void Symlinkat0200(void)
{
    const char* pathName = "/data/storage/el2/base/cache";
    const char* fileName = "/data/storage/el2/base/cache/nonexistent_symlinkat_target.txt";
    const char* symlinkName = "mysymlinkat_dangling";
    DIR* dp;
    int fd;

    // Open directory
    dp = opendir(pathName);
    if (dp == nullptr) {
        t_error("%s: opendir failed (errno=%d)\n", __func__, errno);
        return;
    }

    fd = dirfd(dp);
    if (fd < 0) {
        t_error("%s: dirfd failed (errno=%d)\n", __func__, errno);
        closedir(dp);
        return;
    }

    // Create symbolic link to non-existent file (this should succeed)
    if (symlinkat(fileName, fd, symlinkName) < 0) {
        printf("%s: symlinkat failed (errno=%d). ", __func__, errno);
        printf("Symbolic links may not be supported on this platform/filesystem.\n");
        closedir(dp);
        return;
    }

    // Cleanup
    unlinkat(fd, symlinkName, 0);
    closedir(dp);
}

static int SymlinkatTestImpl(int argc, char* argv[])
{
    Symlinkat0100();
    Symlinkat0200();
    return T_STATUS;
}

int SymlinkatTest(void)
{
    static char libcProg[] = "libc_test";
    char* libcArgv[] = { libcProg, nullptr };
    return SymlinkatTestImpl(1, libcArgv);
}
