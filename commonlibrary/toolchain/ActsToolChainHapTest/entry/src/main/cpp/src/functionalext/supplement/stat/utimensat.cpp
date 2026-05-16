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
#include <dlfcn.h>
#include <fcntl.h>
#include <sys/stat.h>
#include "filepath_util.h"
#include "functionalext.h"
#include "time64_functions.h"

const long SEC = 123840;

using UtimensatTime64Func = int (*)(int, const char*, const struct timespec[2], int);
constexpr const char* UTIMENSAT_TIME64_SYMBOL = "__utimensat_time64";
/**
 * @tc.name      : utimensat_0100
 * @tc.desc      : change file timestamps with nanosecond precision
 * @tc.level     : Level 0
 */
void Utimensat0100(void)
{
    char path[PATH_MAX] = { 0 };
    FILE_ABSOLUTE_PATH(STR_FILE_TXT, path);
    int fd = open(path, O_RDWR | O_CREAT, TEST_MODE);
    struct timespec times[] = { { .tv_sec = 0 }, { .tv_sec = SEC } };

    int result = utimensat(fd, path, times, 0);
    if (result != 0) {
        t_error("%s failed: result = %d\n", __func__, result);
    }

    close(fd);

    struct stat statbuf;
    result = stat(path, &statbuf);
    if (result != 0) {
        t_error("%s failed: result = %d\n", __func__, result);
    }

    if (statbuf.st_mtim.tv_sec != SEC) {
        t_error("%s failed: statbuf.st_mtim.tv_sec = %ld\n", __func__, statbuf.st_mtim.tv_sec);
    }

    int removeRet = remove(path);
    if (removeRet != 0) {
        t_error("%s failed: remove ret = %d\n", __func__, removeRet);
    }
}

/**
 * @tc.name      : utimensat_0200
 * @tc.desc      : change file timestamps with invalid parameters
 * @tc.level     : Level 2
 */
void Utimensat0200(void)
{
    errno = 0;
    int result = utimensat(-1, nullptr, nullptr, 0);
    if (result == 0) {
        t_error("%s failed: result = %d\n", __func__, result);
    }

    if (errno != EBADF) {
        t_error("%s failed: errno = %d\n", __func__, errno);
    }
}

/**
 * @tc.name      : utimensat_time64_0100
 * @tc.desc      : change file timestamps with nanosecond precision
 * @tc.level     : Level 0
 */
void UtimensatTime640100(void)
{
    UtimensatTime64Func utimensatTime64 =
        reinterpret_cast<UtimensatTime64Func>(dlsym(RTLD_DEFAULT, UTIMENSAT_TIME64_SYMBOL));
    if (utimensatTime64 == nullptr) {
        t_error("%s failed: dlsym __utimensat_time64 failed\n", __func__);
        return;
    }
    char path[PATH_MAX] = { 0 };
    FILE_ABSOLUTE_PATH(STR_FILE_TXT, path);
    int fd = open(path, O_RDWR | O_CREAT, TEST_MODE);
    struct timespec times[] = { { .tv_sec = 0 }, { .tv_sec = SEC } };

    int result = utimensatTime64(fd, path, times, 0);
    if (result != 0) {
        t_error("%s failed: result = %d\n", __func__, result);
    }

    close(fd);

    struct stat statbuf;
    result = stat(path, &statbuf);
    if (result != 0) {
        t_error("%s failed: result = %d\n", __func__, result);
    }

    if (statbuf.st_mtim.tv_sec != SEC) {
        t_error("%s failed: statbuf.st_mtim.tv_sec = %ld\n", __func__, statbuf.st_mtim.tv_sec);
    }

    int removeRet = remove(path);
    if (removeRet != 0) {
        t_error("%s failed: remove ret = %d\n", __func__, removeRet);
    }
}

static int UtimensatTestImpl(int argc, char* argv[])
{
    Utimensat0100();
    Utimensat0200();
    UtimensatTime640100();

    return T_STATUS;
}

int UtimensatTest(void)
{
    static char libcProg[] = "libc_test";
    char* libcArgv[] = { libcProg, nullptr };
    return UtimensatTestImpl(1, libcArgv);
}
