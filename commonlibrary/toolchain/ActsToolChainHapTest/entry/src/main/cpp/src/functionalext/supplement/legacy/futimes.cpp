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
#include <unistd.h>
#include "functionalext.h"
#include "time64_functions.h"

const int FAIL = -1;
const int SUCCESS = 0;

using FutimesTime64Func = int (*)(int, const struct timeval[2]);
constexpr const char* FUTIMES_TIME64_SYMBOL = "__futimes_time64";
/**
 * @tc.name      : futimes_0100
 * @tc.desc      : All parameters are valid, TV is not 0, and futimes can modify the timestamp of the file.
 * @tc.level     : Level 0
 */
void Futimes0100(void)
{
    int ret = -1;
    struct stat s;
    static struct timeval tv[2] = { { 0L, 0L }, { 0L, 0L } };
    tv[0].tv_sec = s.st_atime;
    tv[0].tv_usec = 0;
    tv[1].tv_sec = s.st_mtime;
    tv[1].tv_usec = 0;
    int fd = open("/data/storage/el2/base/cache/futimes.txt", O_RDWR | O_CREAT, 777);
    ret = futimes(fd, tv);
    EXPECT_EQ("Futimes0100", ret, SUCCESS);
    int removeRet = remove("/data/storage/el2/base/cache/futimes.txt");
    EXPECT_EQ("Futimes0100", removeRet, SUCCESS);
}

/**
 * @tc.name      : futimes_0200
 * @tc.desc      : All parameters are valid, TV is 0, and futimes can modify the timestamp of the file.
 * @tc.level     : Level 1
 */
void Futimes0200(void)
{
    int ret = -1;
    int fd = open("/data/storage/el2/base/cache/futimes.txt", O_RDWR | O_CREAT, 777);
    ret = futimes(fd, nullptr);
    EXPECT_EQ("Futimes0200", ret, SUCCESS);
    int removeRet = remove("/data/storage/el2/base/cache/futimes.txt");
    EXPECT_EQ("Futimes0200", removeRet, SUCCESS);
}

/**
 * @tc.name      : futimes_0300
 * @tc.desc      : The fd argument is invalid and the futimes function cannot modify the timestamp of the file.
 * @tc.level     : Level 2
 */
void Futimes0300(void)
{
    int ret = -1;
    static struct timeval tv[2] = { { 0L, 0L }, { 0L, 0L } };
    int fd = open("/data/storage/el2/base/cache/futimes.txt", O_RDWR);
    ret = futimes(fd, tv);
    EXPECT_EQ("/data/storage/el2/base/cache/Futimes0300", ret, FAIL);
}

/**
 * @tc.name      : futimes_time64_0100
 * @tc.desc      : All parameters are valid, TV is not 0, and futimes can modify the timestamp of the file.
 * @tc.level     : Level 0
 */
void FutimesTime640100(void)
{
    FutimesTime64Func futimesTime64 = reinterpret_cast<FutimesTime64Func>(dlsym(RTLD_DEFAULT, FUTIMES_TIME64_SYMBOL));
    if (futimesTime64 == nullptr) {
        t_error("%s dlsym __futimes_time64 failed\n", __func__);
        return;
    }
    int ret = -1;
    struct stat s;
    static struct timeval tv[2] = { { 0L, 0L }, { 0L, 0L } };
    tv[0].tv_sec = s.st_atime;
    tv[0].tv_usec = 0;
    tv[1].tv_sec = s.st_mtime;
    tv[1].tv_usec = 0;
    int fd = open("/data/storage/el2/base/cache/futimes.txt", O_RDWR | O_CREAT, 777);
    ret = futimesTime64(fd, tv);
    EXPECT_EQ("FutimesTime640100", ret, SUCCESS);
    int removeRet = remove("/data/storage/el2/base/cache/futimes.txt");
    EXPECT_EQ("FutimesTime640100", removeRet, SUCCESS);
}

static int FutimesTestImpl(int argc, char* argv[])
{
    Futimes0100();
    Futimes0200();
    Futimes0300();
    FutimesTime640100();
    return T_STATUS;
}

int FutimesTest(void)
{
    static char libcProg[] = "libc_test";
    char* libcArgv[] = { libcProg, nullptr };
    return FutimesTestImpl(1, libcArgv);
}
