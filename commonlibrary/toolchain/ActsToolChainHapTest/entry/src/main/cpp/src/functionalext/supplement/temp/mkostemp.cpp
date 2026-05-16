/**
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

#include <fcntl.h>
#include <cstdlib>
#include "functionalext.h"

/**
 * @tc.name      : mkostemp_0100
 * @tc.desc      : Verify mkostemp process success. Provide the correct template and no fixed suffix,
 *                 specified in flags: O_APPEND, create a temporary file.
 * @tc.level     : Level 0
 */
void Mkostemp0100(void)
{
    char tmpfile[] = "/data/storage/el2/base/cache/mkostemp_0100_XXXXXX";
    int fd = mkostemp(tmpfile, O_APPEND);
    EXPECT_TRUE("mkostemp_0100", fd != -1);
    if (fd != -1) {
        int cnt = write(fd, tmpfile, strlen(tmpfile));
        EXPECT_TRUE("mkostemp_0100", cnt == strlen(tmpfile));
        close(fd);
        char rmfile[128];
        int len = sprintf(rmfile, "rm %s", tmpfile);
        if (len > 0) {
            system(rmfile);
        }
    }
}

/**
 * @tc.name      : mkostemp_0200
 * @tc.desc      : Verify mkostemp process success. Provide the correct template and no fixed suffix,
 *                 specified in flags: O_CLOEXEC, create a temporary file.
 * @tc.level     : Level 0
 */
void Mkostemp0200(void)
{
    char tmpfile[] = "/data/storage/el2/base/cache/mkostemp_0200_XXXXXX";
    int fd = mkostemp(tmpfile, O_CLOEXEC);
    EXPECT_TRUE("mkostemp_0200", fd != -1);
    if (fd != -1) {
        int cnt = write(fd, tmpfile, strlen(tmpfile));
        EXPECT_TRUE("mkostemp_0200", cnt == strlen(tmpfile));
        close(fd);
        char rmfile[128];
        int len = sprintf(rmfile, "rm %s", tmpfile);
        if (len > 0) {
            system(rmfile);
        }
    }
}

/**
 * @tc.name      : mkostemp_0300
 * @tc.desc      : Verify mkostemp process success. Provide the correct template and no fixed suffix,
 *                 specified in flags: O_CLOEXEC, create a temporary file.
 * @tc.level     : Level 0
 */
void Mkostemp0300(void)
{
    char tmpfile[] = "/data/storage/el2/base/cache/mkostemp_0300_XXXXXX";
    int fd = mkostemp(tmpfile, O_SYNC);
    EXPECT_TRUE("mkostemp_0300", fd != -1);
    if (fd != -1) {
        int cnt = write(fd, tmpfile, strlen(tmpfile));
        EXPECT_TRUE("mkostemp_0300", cnt == strlen(tmpfile));
        close(fd);
        char rmfile[128];
        int len = sprintf(rmfile, "rm %s", tmpfile);
        if (len > 0) {
            system(rmfile);
        }
    }
}

/**
 * @tc.name      : mkostemp_0400
 * @tc.desc      : Verify mkostemp process fail. Provide error template, specified in flags: O_APPEND,
 *                 create temp file fail.
 * @tc.level     : Level 2
 */
void Mkostemp0400(void)
{
    char tmpfile[] = "/tmp/mkostemp_0400.dat";
    int fd = mkostemp(tmpfile, O_APPEND);
    EXPECT_TRUE("mkostemp_0400", fd == -1);
    if (fd != -1) {
        int cnt = write(fd, tmpfile, strlen(tmpfile));
        EXPECT_TRUE("mkostemp_0400", cnt == strlen(tmpfile));
        close(fd);
        char rmfile[128];
        int len = sprintf(rmfile, "rm %s", tmpfile);
        if (len > 0) {
            system(rmfile);
        }
    }
}

/**
 * @tc.name      : mkostemp_0500
 * @tc.desc      : Verify mkostemp process fail. Provide error template, specified in flags: O_CLOEXEC,
 *                 create temp file fail.
 * @tc.level     : Level 2
 */
void Mkostemp0500(void)
{
    char tmpfile[] = "/tmp/mkostemp_0500.dat";
    int fd = mkostemp(tmpfile, O_CLOEXEC);
    EXPECT_TRUE("mkostemp_0500", fd == -1);
    if (fd != -1) {
        int cnt = write(fd, tmpfile, strlen(tmpfile));
        EXPECT_TRUE("mkostemp_0500", cnt == strlen(tmpfile));
        close(fd);
        char rmfile[128];
        int len = sprintf(rmfile, "rm %s", tmpfile);
        if (len > 0) {
            system(rmfile);
        }
    }
}

/**
 * @tc.name      : mkostemp_0600
 * @tc.desc      : Verify mkostemp process fail. Provide error template, specified in flags: O_SYNC,
 *                 create temp file fail.
 * @tc.level     : Level 2
 */
void Mkostemp0600(void)
{
    char tmpfile[] = "/tmp/mkostemp_0600.dat";
    int fd = mkostemp(tmpfile, O_SYNC);
    EXPECT_TRUE("mkostemp_0600", fd == -1);
    if (fd != -1) {
        int cnt = write(fd, tmpfile, strlen(tmpfile));
        EXPECT_TRUE("mkostemp_0600", cnt == strlen(tmpfile));
        close(fd);
        char rmfile[128];
        int len = sprintf(rmfile, "rm %s", tmpfile);
        if (len > 0) {
            system(rmfile);
        }
    }
}

/**
 * @tc.name      : mkostemp_0700
 * @tc.desc      : Template with 'XXXXXX' not at the end
 * @tc.level     : Level 2
 */
void Mkostemp0700(void)
{
    char tempDir[] = "/data/storage/el2/base/cache/mkostemp_0700_XXXXXX_dir";
    int fd = mkostemp(tempDir, O_SYNC);
    //XXXXXX is not at the end, mkdtemp() will fail and return -1. Now template is unchanged.
    EXPECT_TRUE("mkostemp_0700", fd == -1);
    if (fd == -1) {
        EXPECT_EQ("mkostemp_0700", errno, EINVAL);
        EXPECT_STREQ("mkostemp_0700", tempDir, "/data/storage/el2/base/cache/mkostemp_0700_XXXXXX_dir");
    }
}

/**
 * @tc.name      : mkostemp_0800
 * @tc.desc      : Verify mkostemp generates unique filenames on multiple calls.
 * @tc.level     : Level 0
 */
void Mkostemp0800(void)
{
    char tmpfile1[] = "/data/storage/el2/base/cache/mkostemp_0800_XXXXXX";
    char tmpfile2[] = "/data/storage/el2/base/cache/mkostemp_0800_XXXXXX";
    int fd1 = mkostemp(tmpfile1, O_CLOEXEC);
    int fd2 = mkostemp(tmpfile2, O_CLOEXEC);
    EXPECT_TRUE("mkostemp_0800", fd1 != -1 && fd2 != -1);
    EXPECT_STRNE("mkostemp_0800", tmpfile1, tmpfile2); // The two results should be different
    if (fd1 != -1) {
        close(fd1);
        remove(tmpfile1); // clean
    }
    if (fd2 != -1) {
        close(fd2);
        remove(tmpfile2); // clean
    }
}

static int MkostempTestImpl(void)
{
    Mkostemp0100();
    Mkostemp0200();
    Mkostemp0300();
    Mkostemp0400();
    Mkostemp0500();
    Mkostemp0600();
    Mkostemp0700();
    Mkostemp0800();
    return T_STATUS;
}

int MkostempTest(void)
{
    return MkostempTestImpl();
}

