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

#define STR_LEN 10
static const char *TEST_TXT_PATH = "/data/storage/el2/base/cache/test.txt";
static const char *FILE_TXT_PATH = "/data/storage/el2/base/cache/file.txt";

/**
 * @tc.name      : Getline0100
 * @tc.desc      : Verify that a row of data can be read (parameters are valid).
 * @tc.level     : Level 0
 */
void Getline0100(void)
{
    char *wrString = "helloworld";
    char *line = nullptr;
    size_t len = 0;

    FILE *fp = fopen(TEST_TXT_PATH, "w+");
    EXPECT_PTRNE("Getline0100", fp, NULL);
    (void)fwrite(wrString, sizeof(char), strlen(wrString), fp);
    if (fseek(fp, 0, SEEK_SET) != 0) {
        t_error("%s fseek failed\n", __func__);
    }

    ssize_t read = getline(&line, &len, fp);
    EXPECT_EQ("Getline0100", read, STR_LEN);
    EXPECT_STREQ("Getline0100", line, "helloworld");

    (void)fclose(fp);
    (void)remove(TEST_TXT_PATH);
}

/**
 * @tc.name      : Getline0200
 * @tc.desc      : Validation cannot read a row of data (parameter is NULL).
 * @tc.level     : Level 2
 */
void Getline0200(void)
{
    size_t len = 0;

    FILE *fp = fopen(FILE_TXT_PATH, "w+");
    EXPECT_PTRNE("Getline0100", fp, NULL);

    ssize_t read = getline(NULL, &len, fp);
    EXPECT_EQ("Getline0200", read, -1);

    (void)fclose(fp);
    (void)remove(FILE_TXT_PATH);
}

/**
 * @tc.name      : Getline0300
 * @tc.desc      : TValidation cannot read a row of data (parameter is 0).
 * @tc.level     : Level 2
 */
void Getline0300(void)
{
    char *line = nullptr;

    FILE *fp = fopen(FILE_TXT_PATH, "w+");
    EXPECT_PTRNE("Getline0100", fp, NULL);

    ssize_t read = getline(&line, 0, fp);
    EXPECT_EQ("Getline0300", read, -1);
    (void)fclose(fp);
    (void)remove(FILE_TXT_PATH);
}

static int GetlineTestImpl(int argc, char *argv[])
{
    Getline0100();
    Getline0200();
    Getline0300();
    return g_tStatus;
}

int GetlineTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, NULL };
    return GetlineTestImpl(1, libcArgv);
}
