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
#include "functionalext.h"

/**
 * @tc.name      : rename_0100
 * @tc.desc      : Each parameter is valid, and the file name can be changed.
 * @tc.level     : Level 0
 */
void Rename0100(void)
{
    const char *oldname = "/data/storage/el2/base/cache/oldfile.txt";
    const char *newname = "/data/storage/el2/base/cache/newfile.txt";
    int fd = open(oldname, O_RDONLY | O_CREAT, TEST_MODE);
    EXPECT_TRUE("rename_0100", fd != -1);
    close(fd);

    int ret = rename(oldname, newname);
    EXPECT_EQ("rename_0100", ret, 0);
    fd = open(oldname, O_RDONLY);
    EXPECT_EQ("rename_0100", fd, -1);
    fd = open(newname, O_RDONLY);
    EXPECT_NE("rename_0100", fd, -1);
    close(fd);
    (void)remove(newname);
}

/**
 * @tc.name      : rename_0200
 * @tc.desc      : Parameter 1 is invalid, the file name cannot be changed.
 * @tc.level     : Level 2
 */
void Rename0200(void)
{
    const char *oldname = "/data/storage/el2/base/cache/oldfile.txt";
    const char *newname = "/data/storage/el2/base/cache/newfile.txt";
    int ret = rename(oldname, newname);
    EXPECT_EQ("rename_0200", ret, -1);
}

/**
 * @tc.name      : rename_0300
 * @tc.desc      : Newpath already exists, the file name can be changed.
 * @tc.level     : Level 1
 */
void Rename0300(void)
{
    const char *oldname = "/data/storage/el2/base/cache/oldfile.txt";
    const char *newname = "/data/storage/el2/base/cache/newfile.txt";
    int fdOld = open(oldname, O_RDWR | O_CREAT, TEST_MODE);
    EXPECT_TRUE("rename_0300", fdOld != -1);

    char strOld[] = "old";
    int retOld = write(fdOld, strOld, sizeof(strOld));
    EXPECT_TRUE("rename_0300", retOld > 0);
    close(fdOld);
    fdOld = -1;

    int fdNew = open(newname, O_RDWR | O_CREAT, TEST_MODE);
    EXPECT_TRUE("rename_0100", fdNew != -1);

    char strNew[] = "new";
    int retNew = write(fdNew, strNew, sizeof(strNew));
    EXPECT_TRUE("rename_0300", retNew > 0);
    close(fdNew);
    fdNew = -1;

    int result = rename(oldname, newname);
    EXPECT_EQ("rename_0300", result, 0);

    int fd = open(newname, O_RDONLY);
    EXPECT_TRUE("rename_0300", fd != -1);

    char buf[10];
    memset(buf, 0, sizeof(buf));
    int nread = read(fd, buf, sizeof(buf));
    EXPECT_TRUE("rename_0300", nread > 0);
    EXPECT_TRUE("rename_0300", strcmp(buf, "old") == 0);

    (void)remove(newname);
}

static int RenameTestImpl(int argc, char *argv[])
{
    Rename0100();
    Rename0200();
    Rename0300();
    return g_tStatus;
}

int RenameTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, NULL };
    return RenameTestImpl(1, libcArgv);
}
