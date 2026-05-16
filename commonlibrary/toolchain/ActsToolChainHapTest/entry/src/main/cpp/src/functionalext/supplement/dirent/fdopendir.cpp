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

#include <dirent.h>
#include <dlfcn.h>
#include <fcntl.h>
#include <cstdlib>
#include <unistd.h>
#include "functionalext.h"

/**
 * @tc.name      : fdopendir_0100
 * @tc.desc      : Each parameter is valid, and the directory information can be obtained.
 * @tc.level     : Level 0
 */
void Fdopendir0100(void)
{
    bool flag = false;
    DIR *dir = nullptr;
    int fd = open("/data/storage/el2/base/cache", O_RDONLY);
    EXPECT_NE("fdopendir_0100", fd, -1);

    dir = fdopendir(fd);
    EXPECT_TRUE("fdopendir_0100", dir != nullptr);
}

/**
 * @tc.name      : fdopendir_0200
 * @tc.desc      : The fd parameter is invalid (0), the directory information of the file cannot be obtained.
 * @tc.level     : Level 2
 */
void Fdopendir0200(void)
{
    DIR *dir = fdopendir(0);
    EXPECT_EQ("fdopendir_0200", dir, nullptr);
}

/**
 * @tc.name      : fdopendir_0300
 * @tc.desc      : The fd parameter is invalid (a non-existing directory), and the directory information.
 *                 of the file cannot be obtained.
 * @tc.level     : Level 2
 */
void Fdopendir0300(void)
{
    DIR *dir = nullptr;
    int fd = open("/data/storage/el2/base/cache/test.txt", O_RDONLY);
    dir = fdopendir(fd);
    EXPECT_EQ("fdopendir_0300", dir, nullptr);
}

/**
 * @tc.name      : fdopendir_0400
 * @tc.desc      : Each parameter is valid, and the directory information of the file can be obtained.
 * @tc.level     : Level 2
 */
void Fdopendir0400(void)
{
    DIR *dir = nullptr;
    int fd = open("/data/storage/el2/base/cache/test.txt", O_RDONLY);
    dir = fdopendir(fd);
    EXPECT_EQ("fdopendir_0400", dir, nullptr);
    remove("/data/storage/el2/base/cache/test.txt");
}

static int FdopendirTestImpl(int argc, char *argv[])
{
    Fdopendir0100();
    Fdopendir0200();
    Fdopendir0300();
    Fdopendir0400();
    return g_tStatus;
}

int FdopendirTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return FdopendirTestImpl(1, libcArgv);
}
