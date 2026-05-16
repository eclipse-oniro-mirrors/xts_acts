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

#include <cstdio>
#include <stdio_ext.h>
#include <cstdlib>
#include <cstdint>
#include <cstddef>
#include "functionalext.h"
#include "filepath_util.h"

const int32_t NUM_ZERO = 0;

/**
 * @tc.name      : __fwriting_0100
 * @tc.desc      : Verify that the file stream is write-only
 * @tc.level     : Level 0
 */
void Fwriting0100(void)
{
    char ptr[PATH_MAX] = {0};
    FILE_ABSOLUTE_PATH(STR_FREAD_TEST_TXT, ptr);
    FILE *fptr = fopen(ptr, "w");
    int result = __fwriting(fptr);
    EXPECT_NE("Fwriting0100", result, NUM_ZERO);
    fclose(fptr);
    remove(ptr);
}

/**
 * @tc.name      : __fwriting_0200
 * @tc.desc      : The last operation on the stream was a write operation
 * @tc.level     : Level 0
 */
void Fwriting0200(void)
{
    const char *wrstring = "helloworld";
    char ptr[PATH_MAX] = {0};
    FILE_ABSOLUTE_PATH(STR_FREAD_TEST_TXT, ptr);
    FILE *fptr = fopen(ptr, "w+");
    fwrite(wrstring, sizeof(char), strlen(wrstring), fptr);
    int result = __fwriting(fptr);
    EXPECT_NE("Fwriting0200", result, NUM_ZERO);
    fclose(fptr);
    remove(ptr);
}

/**
 * @tc.name      : __fwriting_0300
 * @tc.desc      : The last operation on the stream was not a write operation
 * @tc.level     : Level 2
 */
void Fwriting0300(void)
{
    char abc[100] = {0};
    const char *wrstring = "helloworld";
    char ptr[PATH_MAX] = {0};
    FILE_ABSOLUTE_PATH(STR_FREAD_TEST_TXT, ptr);
    FILE *fptr = fopen(ptr, "w+");
    fwrite(wrstring, sizeof(char), strlen(wrstring), fptr);
    fseek(fptr, 0, SEEK_SET);
    int32_t rsize = fread(abc, 1, 10, fptr);
    int result = __fwriting(fptr);
    EXPECT_EQ("Fwriting0300", result, NUM_ZERO);
    fclose(fptr);
    remove(ptr);
}

static int FwritingTestWithArgs(int argc, char *argv[])
{
    Fwriting0100();
    Fwriting0200();
    Fwriting0300();
    return g_tStatus;
}

int FwritingTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return FwritingTestWithArgs(1, libcArgv);
}
