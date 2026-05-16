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

const int SIZE = 20;

/**
 * @tc.name      : read_0100
 * @tc.desc      : The parameters are valid and the actual number of characters can be read.
 * @tc.level     : Level 0
 */
void Read0100(void)
{
    char str[] = "this is a readtest\n";
    char buffer[1024] = { 0 };
    int fd = open("/data/storage/el2/base/cache/readtest.txt", O_RDWR | O_CREAT, TEST_MODE);
    EXPECT_TRUE("Read0100", fd >= 0);
    int retwrite = write(fd, str, sizeof(str));
    EXPECT_EQ("Read0100", retwrite, SIZE);
    lseek(fd, 0, SEEK_SET);
    int size = read(fd, buffer, 1024);
    EXPECT_EQ("Read0100", size, SIZE);
    close(fd);
    remove("/data/storage/el2/base/cache/readtest.txt");
}

static int ReadTestImpl(int argc, char* argv[])
{
    Read0100();
    return T_STATUS;
}

int ReadTest(void)
{
    static char libcProg[] = "libc_test";
    char* libcArgv[] = { libcProg, nullptr };
    return ReadTestImpl(1, libcArgv);
}
