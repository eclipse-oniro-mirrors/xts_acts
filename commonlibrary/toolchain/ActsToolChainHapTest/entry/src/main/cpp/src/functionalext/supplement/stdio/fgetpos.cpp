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

#include <cstdlib>
#include <cstdint>
#include "functionalext.h"

typedef void (*TEST_FUN)();

const int32_t NUN_ELEVEN = 11;

/**
 * @tc.name      : Fgetpos0100
 * @tc.desc      : File pointer at the end of a file, the position to which the current file pointer points
 * @tc.level     : Level 0
 */
void Fgetpos0100()
{
    fpos_t pos;
    char buff[] = "hello world";
    const char *path = "/data/storage/el2/base/cache/test.txt";

    FILE *fp = fopen(path, "w+");
    EXPECT_PTRNE("Fgetpos0100", fp, NULL);

    (void)fputs(buff, fp);
    if (fseek(fp, 0, SEEK_END) != 0) {
        t_error("%s fseek failed\n", __func__);
    }

    int result = fgetpos(fp, &pos);
    EXPECT_EQ("Fgetpos0100", result, 0);

    (void)fclose(fp);
    (void)remove(path);
}

/**
 * @tc.name      : Fgetpos0200
 * @tc.desc      : File pointer at the beginning of a file, the location to which the current file pointer points
 * @tc.level     : Level 0
 */
void Fgetpos0200()
{
    fpos_t pos;
    char buff[] = "hello world";
    const char *path = "/data/storage/el2/base/cache/test.txt";

    FILE *fptr = fopen(path, "w+");
    EXPECT_PTRNE("Fgetpos0100", fptr, NULL);

    (void)fputs(buff, fptr);
    if (fseek(fptr, 0, SEEK_SET) != 0) {
        t_error("%s fseek failed\n", __func__);
    }
    int result = fgetpos(fptr, &pos);
    EXPECT_EQ("Fgetpos0200", result, 0);

    (void)fclose(fptr);
    (void)remove(path);
}

static TEST_FUN g_funArray[] = {
    Fgetpos0100,
    Fgetpos0200,
};

static int FgetposTestImpl(int argc, char *argv[])
{
    int num = sizeof(g_funArray) / sizeof(g_funArray[0]);
    for (int pos = 0; pos < num; ++pos) {
        g_funArray[pos]();
    }

    return g_tStatus;
}

int FgetposTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return FgetposTestImpl(1, libcArgv);
}
