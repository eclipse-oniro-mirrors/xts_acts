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
#include <cstdlib>
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
 * @tc.name      : renameat_0100
 * @tc.desc      : When newname already exists, test the renameat function
 * @tc.level     : Level 0
 */
void Renameat0100(void)
{
    int oldfd;
    int newfd;
    char oldPath[] = "/data/storage/el2/base/cache/renameat.txt";
    char newPath[] = "/data/storage/el2/base/cache/newrenameat.txt";
    const char* msg = "test code";
    int len = strlen(msg);
    char buf[1024] = { 0 };

    // Create old file with proper permissions
    if ((oldfd = creat(oldPath, TEST_MODE)) < 0) {
        t_error("%s: creat oldPath failed (errno=%d)\n", __func__, errno);
        return;
    }
    close(oldfd);

    // Create new file with proper permissions
    if ((newfd = creat(newPath, TEST_MODE)) < 0) {
        t_error("%s: creat newPath failed (errno=%d)\n", __func__, errno);
        remove(oldPath);
        return;
    }
    close(newfd);

    // Write content to old file
    oldfd = open(oldPath, O_RDWR);
    if (oldfd < 0) {
        t_error("%s: open oldPath failed (errno=%d)\n", __func__, errno);
        remove(oldPath);
        remove(newPath);
        return;
    }

    int wresult = write(oldfd, msg, len);
    if (wresult != len) {
        t_error("%s: write get result is %d not want %d\n", __func__, wresult, len);
        close(oldfd);
        remove(oldPath);
        remove(newPath);
        return;
    }
    close(oldfd);

    // Use AT_FDCWD for absolute paths
    if (renameat(AT_FDCWD, oldPath, AT_FDCWD, newPath) == -1) {
        t_error("%s: renameat failed (errno=%d)\n", __func__, errno);
        remove(oldPath);
        remove(newPath);
        return;
    }

    // Verify the renamed file content
    newfd = open(newPath, O_RDWR);
    if (newfd < 0) {
        t_error("%s: open newPath after rename failed (errno=%d)\n", __func__, errno);
        remove(newPath);
        return;
    }

    int bytes = read(newfd, buf, len);
    if (bytes == -1) {
        t_error("%s: read file failed (errno=%d)\n", __func__, errno);
        close(newfd);
        remove(newPath);
        return;
    }

    if (bytes != len || strncmp(msg, buf, len) != 0) {
        t_error("%s: wrong string written to file. Expected '%s', got '%.*s'\n", __func__, msg, bytes, buf);
        close(newfd);
        remove(newPath);
        return;
    }

    close(newfd);

    // Verify old file no longer exists
    if (access(oldPath, F_OK) == 0) {
        t_error("%s: oldPath still exists after rename\n", __func__);
        remove(oldPath);
    }

    remove(newPath);
}

static int RenameatTestImpl(int argc, char* argv[])
{
    Renameat0100();
    return T_STATUS;
}

int RenameatTest(void)
{
    static char libcProg[] = "libc_test";
    char* libcArgv[] = { libcProg, nullptr };
    return RenameatTestImpl(1, libcArgv);
}
