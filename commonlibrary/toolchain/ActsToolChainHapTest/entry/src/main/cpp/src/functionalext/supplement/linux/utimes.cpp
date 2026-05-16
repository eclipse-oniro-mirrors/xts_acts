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

#include <cstdio>
#include <ctime>
#include <dlfcn.h>
#include <fcntl.h>
#include <sys/stat.h>
#include <sys/time.h>
#include "test.h"

using Utime64Func = int (*)(const char*, const struct timeval[2]);
constexpr const char* UTIMES_TIME64_SYMBOL = "__utimes_time64";
/**
 * @tc.name      : utimes_0100
 * @tc.desc      : Change file last access and modification times
 * @tc.level     : Level 0
 */
void Utimes0100(void)
{
    const char* path = "/data/storage/el2/base/cache/utimes.txt";
    int fd = open(path, O_RDWR | O_RSYNC | O_CREAT, 0664);
    if (fd == -1) {
        t_error("%s write create file error", __func__);
        return;
    }
    close(fd);
    struct stat buf1;
    struct stat buf2;
    time_t tMold;
    time_t tAold;
    time_t tNow;
    time_t tNew;
    stat(path, &buf1);

    tMold = buf1.st_mtime;
    tAold = buf1.st_atime;
    tNow = time(nullptr);
    if (utimes(path, nullptr) != 0) {
        t_error("%s utimes failed", __func__);
    } else {
        stat(path, &buf2);
        tNew = buf2.st_mtime;
        if (tNew != tNow) {
            t_error("%s utimes failed", __func__);
        }
    }
    int removeRet = remove(path);
    if (removeRet != 0) {
        t_error("%s remove failed", __func__);
    }
}

/**
 * @tc.name      : utimes_0200
 * @tc.desc      : Specify time to change file last access and modification time
 * @tc.level     : Level 1
 */
void Utimes0200(void)
{
    const char* path = "/data/storage/el2/base/cache/utimes.txt";
    int fd = open(path, O_RDWR | O_RSYNC | O_CREAT, 0664);
    if (fd == -1) {
        t_error("%s write create file error", __func__);
        return;
    }
    close(fd);
    struct stat st;
    struct timeval tv[2] = { { 1, 0 }, { 1, 0 } };

    int result = utimes(path, tv);
    if (result != 0) {
        t_error("%s utimes failed", __func__);
    } else {
        stat(path, &st);
        if (st.st_atime != tv[0].tv_sec && st.st_mtime != tv[1].tv_sec) {
            t_error("%s utimes failed", __func__);
        }
    }
    int removeRet = remove(path);
    if (removeRet != 0) {
        t_error("%s remove failed", __func__);
    }
}

/**
 * @tc.name      : utimes_time64_0100
 * @tc.desc      : Change file last access and modification times
 * @tc.level     : Level 0
 */
void UtimesTime640100(void)
{
    const char* path = "/data/storage/el2/base/cache/utimes_time64.txt";
    int fd = open(path, O_RDWR | O_RSYNC | O_CREAT, 0664);
    if (fd == -1) {
        t_error("%s write create file error", __func__);
        return;
    }
    close(fd);
    struct stat buf1;
    struct stat buf2;
    time_t tMold;
    time_t tAold;
    time_t tNow;
    time_t tNew;
    stat(path, &buf1);

    tMold = buf1.st_mtime;
    tAold = buf1.st_atime;
    tNow = time(nullptr);
    Utime64Func utimesTime64 = reinterpret_cast<Utime64Func>(dlsym(RTLD_DEFAULT, UTIMES_TIME64_SYMBOL));
    if (utimesTime64 == nullptr) {
        t_error("%s dlsym __utimes_time64 failed", __func__);
        int removeRet = remove(path);
        if (removeRet != 0) {
            t_error("%s remove failed", __func__);
        }
        return;
    }
    if (utimesTime64(path, nullptr) != 0) {
        t_error("%s __utimes_time64 failed", __func__);
    } else {
        stat(path, &buf2);
        tNew = buf2.st_mtime;
        if (tNew != tNow) {
            t_error("%s __utimes_time64 failed", __func__);
        }
    }
    int removeRet = remove(path);
    if (removeRet != 0) {
        t_error("%s remove failed", __func__);
    }
}

static int UtimesTestImpl(int argc, char* argv[])
{
    Utimes0100();
    Utimes0200();
    UtimesTime640100();
    return T_STATUS;
}

int UtimesTest(void)
{
    static char libcProg[] = "libc_test";
    char* libcArgv[] = { libcProg, nullptr };
    return UtimesTestImpl(1, libcArgv);
}
