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

#include <dlfcn.h>
#include <fcntl.h>
#include <sys/stat.h>
#include <sys/time.h>
#include "test.h"
#include "time64_functions.h"

static const char* PATH = "/data/storage/el2/base/cache";
constexpr size_t WRITE_LEN = 5;

using FutimesatTime64Func = int (*)(int, const char*, const struct timeval[2]);
constexpr const char* FUTIMESAT_TIME64_SYMBOL = "__futimesat_time64";
/**
 * @tc.name      : futimesat_0100
 * @tc.desc      : Change timestamps of a file relative to a directory file descriptor
 * @tc.level     : Level 0
 */
void Futimesat0100(void)
{
    int dirFd = open(PATH, O_RDONLY | O_DIRECTORY);
    if (dirFd < 0) {
        t_error("%s open failed\n", __func__);
    }

    int fd = openat(dirFd, "test.txt", O_CREAT | O_RDWR | O_EXCL, 0666);
    if (fd < 0) {
        t_error("%s openat failed\n", __func__);
    }

    write(fd, "helloworld", WRITE_LEN);

    struct stat st1;
    if (fstat(fd, &st1) != 0) {
        t_error("%s fstat failed\n", __func__);
    }
    close(fd);

    struct timeval tv[2];
    tv[0].tv_sec = st1.st_atime + 1;
    tv[0].tv_usec = 0;
    tv[1].tv_sec = st1.st_mtime + 1;
    tv[1].tv_usec = 0;

    int result = futimesat(dirFd, "test.txt", tv);
    if (result != 0) {
        t_error("%s futimesat failed\n", __func__);
    }

    struct stat st2;
    if (fstatat(dirFd, "test.txt", &st2, 0) != 0) {
        t_error("%s fstatat failed\n", __func__);
    }

    if (st2.st_mtime != tv[1].tv_sec) {
        t_error("%s stat shows different mtime\n", __func__);
    }

    if (unlinkat(dirFd, "test.txt", 0) != 0) {
        t_error("%s unlinkat failed\n", __func__);
    }

    close(dirFd);
}

/**
 * @tc.name      : futimesat_0200
 * @tc.desc      : Test the return value of the function when timeval is NULL
 * @tc.level     : Level 1
 */
void Futimesat0200(void)
{
    int dirFd = open(PATH, O_RDONLY | O_DIRECTORY);
    if (dirFd < 0) {
        t_error("%s open failed\n", __func__);
    }

    int fd = openat(dirFd, "test.txt", O_CREAT | O_RDWR | O_EXCL, 0666);
    if (fd < 0) {
        t_error("%s openat failed\n", __func__);
    }

    int result = futimesat(dirFd, "test.txt", nullptr);
    if (result != 0) {
        t_error("%s futimesat failed\n", __func__);
    }

    if (unlinkat(dirFd, "test.txt", 0) != 0) {
        t_error("%s unlinkat failed\n", __func__);
    }

    close(dirFd);
}

/**
 * @tc.name      : futimesat_0300
 * @tc.desc      : Test the return value of the function when dirfd is invalid
 * @tc.level     : Level 2
 */
void Futimesat0300(void)
{
    int result = futimesat(-1, "/data/storage/el2/base/cache/test.txt", nullptr);
    if (result != -1) {
        t_error("%s futimesat should be failed\n", __func__);
    }
}

/**
 * @tc.name      : futimesat_0400
 * @tc.desc      : Test the return value of the function when pathname is invalid
 * @tc.level     : Level 2
 */
void Futimesat0400(void)
{
    int result = futimesat(AT_FDCWD, nullptr, nullptr);
    if (result != -1) {
        t_error("%s futimesat should be failed\n", __func__);
    }
}

/**
 * @tc.name      : futimesat_time64_0200
 * @tc.desc      : Test the return value of the function when timeval is NULL
 * @tc.level     : Level 1
 */
void FutimesatTime640200(void)
{
    FutimesatTime64Func futimesatTime64 =
        reinterpret_cast<FutimesatTime64Func>(dlsym(RTLD_DEFAULT, FUTIMESAT_TIME64_SYMBOL));
    if (futimesatTime64 == nullptr) {
        t_error("%s dlsym __futimesat_time64 failed\n", __func__);
        return;
    }
    int dirFd = open(PATH, O_RDONLY | O_DIRECTORY);
    if (dirFd < 0) {
        t_error("%s open failed\n", __func__);
    }

    int fd = openat(dirFd, "test.txt", O_CREAT | O_RDWR | O_EXCL, 0666);
    if (fd < 0) {
        t_error("%s openat failed\n", __func__);
    }

    int result = futimesatTime64(dirFd, "test.txt", nullptr);
    if (result != 0) {
        t_error("%s __futimesat_time64 failed\n", __func__);
    }

    if (unlinkat(dirFd, "test.txt", 0) != 0) {
        t_error("%s unlinkat failed\n", __func__);
    }

    close(dirFd);
}

static int FutimesatTestImpl(int argc, char* argv[])
{
    Futimesat0100();
    Futimesat0200();
    Futimesat0300();
    Futimesat0400();
    FutimesatTime640200();
    return T_STATUS;
}

int FutimesatTest(void)
{
    static char libcProg[] = "libc_test";
    char* libcArgv[] = { libcProg, nullptr };
    return FutimesatTestImpl(1, libcArgv);
}
