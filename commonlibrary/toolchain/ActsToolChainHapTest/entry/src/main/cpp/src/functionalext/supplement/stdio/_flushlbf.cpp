/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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
#include <stdio_ext.h>
#include "functionalext.h"

const int32_t INIT_LEN = 0;
#define READ_SIZE 10
#define FLUSH_SIZE 20

/**
 * @tc.name      : flushlbf_0100
 * @tc.desc      : Verify that flushing the line buffer was successful.
 * @tc.level     : Level 0
 */
void Flushlbf0100(void)
{
    char buffer[1024] = {0};
    char array[] = "This is a test!";
    const char *path = "/data/storage/el2/base/cache/test.txt";

    FILE *fd = fopen(path, "w+");
    EXPECT_PTRNE("flushlbf_0100", fd, nullptr);

    fprintf(fd, "%s", array);
    FILE *fp = freopen("/data/storage/el2/base/cache/test.txt", "r", stdin);
    EXPECT_PTRNE("flushlbf_0100", fp, nullptr);

    fseek(fp, 0, SEEK_SET);
    int32_t rsize = fread(buffer, 1, 10, fd);
    EXPECT_EQ("flushlbf_0100", rsize, INIT_LEN);

    _flushlbf();

    fseek(fp, 0, SEEK_SET);
    fread(buffer, 1, FLUSH_SIZE, fp);
    EXPECT_STREQ("flushlbf_0100", buffer, array);

    fclose(stdin);
    fclose(fd);
    fclose(fp);
    remove(path);
}

static int FlushlbfTestWithArgs(int argc, char *argv[])
{
    Flushlbf0100();
    return g_tStatus;
}

int FlushlbfTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return FlushlbfTestWithArgs(1, libcArgv);
}
