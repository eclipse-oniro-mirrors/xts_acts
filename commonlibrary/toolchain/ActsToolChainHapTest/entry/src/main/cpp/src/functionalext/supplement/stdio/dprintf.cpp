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
 * @tc.name      : Dprintf0100
 * @tc.desc      : Verify the number of characters returned by the function (if the file parameter is stdout)
 * @tc.level     : Level 0
 */
void Dprintf0100(void)
{
    int result = dprintf(1, "This is a test!!QAZ@WSX12");
    printf("\n");
    int ret = strlen("This is a test!!QAZ@WSX12");
    EXPECT_EQ("Dprintf0100", result, ret);
}

/**
 * @tc.name      : Dprintf0200
 * @tc.desc      : Verify the number of characters returned by the function (if the file argument is stderr)
 * @tc.level     : Level 0
 */
void Dprintf0200(void)
{
    int result = dprintf(2, "This is a test!");
    printf("\n");
    int ret = strlen("This is a test!");
    EXPECT_EQ("Dprintf0200", result, ret);
}

/**
 * @tc.name      : Dprintf0300
 * @tc.desc      : Verify the number of characters returned by the function
                  (if the file is successfully opened in W mode and its return value is used as a file parameter)
 * @tc.level     : Level 0
 */
void Dprintf0300(void)
{
    const char *path = "/data/storage/el2/base/cache/test.txt";
    int fd = open(path, O_CREAT | O_WRONLY, TEST_MODE);
    EXPECT_NE("Dprintf0300", fd, -1);

    int result = dprintf(fd, "This is a test!");
    int ret = strlen("This is a test!");

    EXPECT_EQ("Dprintf0300", result, ret);

    close(fd);
    (void)remove(path);
}

/**
 * @tc.name      : Dprintf0400
 * @tc.desc      : Verify the number of characters returned by the function
                  (if the file is successfully opened in R mode and its return value is used as a file parameter)
 * @tc.level     : Level 2
 */
void Dprintf0400(void)
{
    const char *path = "/data/storage/el2/base/cache/test.txt";
    int fd = open(path, O_CREAT | O_RDONLY, TEST_MODE);
    EXPECT_NE("Dprintf0400", fd, -1);

    int result = dprintf(fd, "This is a test!");
    EXPECT_EQ("Dprintf0400", result, -1);

    close(fd);
    (void)remove(path);
}

static int DprintfTestWithArgs(int argc, char *argv[])
{
    Dprintf0100();
    Dprintf0200();
    Dprintf0300();
    Dprintf0400();
    return g_tStatus;
}

int DprintfTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, NULL };
    return DprintfTestWithArgs(1, libcArgv);
}
