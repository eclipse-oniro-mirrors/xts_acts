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

#include <fcntl.h>
#include <cstdio>
#include <sys/stat.h>
#include <ctime>
#include <utime.h>
#include "test.h"

/**
 * @tc.name      : utime_0100
 * @tc.desc      : Specify file modification and access times
 * @tc.level     : Level 0
 */
void Utime0100(void)
{
    int fd;
    char file[] = "/data/storage/el2/base/cache/utime1.txt";
    struct utimbuf ubuf;
    struct stat info;

    if ((fd = creat(file, S_IWUSR)) < 0) {
        t_error("%s creat failed", __func__);
    } else {
        close(fd);
        stat(file, &info);
        ubuf.modtime = 0;
        time(&ubuf.actime);
        if (utime(file, &ubuf) != 0) {
            t_error("%s utime failed", __func__);
        } else {
            stat(file, &info);
            if (info.st_mtim.tv_sec != 0) {
                t_error("%s modify file time failed", __func__);
            }
        }
    }
    (void)remove(file);
}

/**
 * @tc.name      : utime_0200
 * @tc.desc      : When times is a NULL pointer, the access and modification times are set to the current time
 * @tc.level     : Level 1
 */
void Utime0200(void)
{
    const char *path = "/data/storage/el2/base/cache/utime.txt";
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
    time_t tMnew;
    time_t tAnew;
    stat(path, &buf1);

    tMold = buf1.st_mtime;
    tAold = buf1.st_atime;
    tNow = time(nullptr);
    if (utime(path, nullptr) != 0) {
        stat(path, &buf2);
        tMnew = buf2.st_mtime;
        tAnew = buf2.st_atime;
        if (tMnew != tNow && tAnew != tNow) {
            t_error("%s utime failed", __func__);
        }
    }
    (void)remove(path);
}

/**
 * @tc.name      : utime64_0100
 * @tc.desc      : Specify file modification and access times
 * @tc.level     : Level 0
 */
void Utime640100(void)
{
    int fd;
    char file[] = "/data/storage/el2/base/cache/utime641.txt";
    struct utimbuf ubuf;
    struct stat info;

    if ((fd = creat(file, S_IWUSR)) < 0) {
        t_error("%s creat failed", __func__);
    } else {
        close(fd);
        stat(file, &info);
        ubuf.modtime = 0;
        time(&ubuf.actime);
        if (utime(file, &ubuf) != 0) {
            t_error("%s __utime64 failed", __func__);
        } else {
            stat(file, &info);
            if (info.st_mtim.tv_sec != 0) {
                t_error("%s modify file time failed", __func__);
            }
        }
    }
    (void)remove(file);
}

static int UtimeSupTestImpl(int argc, char *argv[])
{
    Utime0100();
    Utime0200();
    Utime640100();
    return T_STATUS;
}

int UtimeSupTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return UtimeSupTestImpl(1, libcArgv);
}
