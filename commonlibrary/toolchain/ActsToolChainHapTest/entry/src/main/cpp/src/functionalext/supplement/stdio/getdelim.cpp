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

#include <cstdio>
#include <cstdlib>
#include "functionalext.h"

static const char *GETDELIM_PATH = "/data/storage/el2/base/cache/getdelim.txt";

/**
 * @tc.name      : getdelim_0100
 * @tc.desc      : Verify that the file content can be read with the specified delimiter (parameters are valid)
 * @tc.level     : Level 0
 */
void Getdelim0100(void)
{
    char *wrstring = "hello,world";
    char *line = nullptr;
    size_t len = 0;

    FILE *fp = fopen(GETDELIM_PATH, "w+");
    EXPECT_PTRNE("getdelim_0100", fp, nullptr);

    (void)fwrite(wrstring, sizeof(char), strlen(wrstring), fp);
    if (fseek(fp, 0, SEEK_SET) != 0) {
        t_error("%s fseek failed\n", __func__);
    }

    ssize_t result = getdelim(&line, &len, ',', fp);
    EXPECT_TRUE("getdelim_0100", result > 0);
    EXPECT_TRUE("getdelim_0100", strcmp(line, "hello,") == 0);
    EXPECT_TRUE("getdelim_0100", len > strlen("hello,"));

    (void)remove(GETDELIM_PATH);
}

/**
 * @tc.name      : getdelim_0200
 * @tc.desc      : Verify that the delimiter cannot be specified to read the file content (the s parameter is invalid)
 * @tc.level     : Level 2
 */
void Getdelim0200(void)
{
    char *line = nullptr;
    char *wrstring = "helloworld";

    FILE *fp = fopen(GETDELIM_PATH, "w+");
    EXPECT_PTRNE("getdelim_0200", fp, NULL);

    ssize_t result = getdelim(&line, nullptr, 'l', fp);
    EXPECT_EQ("getdelim_0200", result, -1);
    (void)remove(GETDELIM_PATH);
}

/**
 * @tc.name      : getdelim_0300
 * @tc.desc      : Verify that the delimiter cannot be specified to read the file content (the n parameter is invalid)
 * @tc.level     : Level 2
 */
void Getdelim0300(void)
{
    size_t a = 0;
    char *wrstring = "helloworld";

    FILE *fp = fopen(GETDELIM_PATH, "w+");
    EXPECT_PTRNE("getdelim_0300", fp, NULL);

    ssize_t result = getdelim(nullptr, &a, 'l', fp);
    EXPECT_EQ("getdelim_0300", result, -1);
    (void)remove(GETDELIM_PATH);
}

static int GetdelimTestImpl(int argc, char *argv[])
{
    Getdelim0100();
    Getdelim0200();
    Getdelim0300();

    return g_tStatus;
}

int GetdelimTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return GetdelimTestImpl(1, libcArgv);
}
