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

#include <cstdlib>
#include <cstdio>
#include <climits>
#include <cstring>
#include <unistd.h>
#include <dirent.h>
#include <fcntl.h>
#include "functionalext.h"

const int FAILED = -1;

/**
 * @tc.name      : Getdents0100
 * @tc.desc      : Each parameter is valid, the len parameter is less than or equal to INT_MAX, and the directory
 *                 information can be read into the specified buffer.
 * @tc.level     : Level 0
 */
void Getdents0100(void)
{
    struct dirent buf;
    static const char *PPATH = "/data/storage/el2/base/cache/";
    int fd = open(PPATH, O_RDONLY);
    EXPECT_NE("Getdents0100", fd, -1);
    int result = getdents(fd, &buf, INT_MAX);
    EXPECT_TRUE("Getdents0100", result > 0);
}

/**
 * @tc.name      : Getdents0200
 * @tc.desc      : The fd parameter is invalid, the directory information cannot be read into the specified buffer.
 * @tc.level     : Level 2
 */
void Getdents0200(void)
{
    struct dirent buf;
    int fd = open("/data/storage/el2/base/cache/getdents", O_RDONLY);
    int result = getdents(fd, &buf, INT_MAX);
    EXPECT_EQ("Getdents0200", result, FAILED);
}

/**
 * @tc.name      : Getdents0300
 * @tc.desc      : The buf parameter is invalid, the directory information cannot be read into the specified buffer.
 * @tc.level     : Level 2
 */
void Getdents0300(void)
{
    struct dirent buf;
    static const char *gPath = "/data/storage/el2/base/cache/";
    int fd = open(gPath, O_RDONLY);
    EXPECT_NE("Getdents0300", fd, -1);
    int result = getdents(fd, nullptr, INT_MAX);
    EXPECT_EQ("Getdents0300", result, FAILED);
}

static int GetdentsTestImpl(int argc, char *argv[])
{
    Getdents0100();
    Getdents0200();
    Getdents0300();
    return T_STATUS;
}

int GetdentsTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return GetdentsTestImpl(1, libcArgv);
}
