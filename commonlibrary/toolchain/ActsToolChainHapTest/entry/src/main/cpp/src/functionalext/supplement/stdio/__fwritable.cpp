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

#include <stdio_ext.h>
#include "functionalext.h"
#include "filepath_util.h"

const int32_t NUM_ZERO = 0;

/**
 * @tc.name      : __fwritable_0100
 * @tc.desc      : Verify that the file is writable (parameters are valid)
 * @tc.level     : Level 0
 */
void Fwritable0100(void)
{
    char ptr[PATH_MAX] = {0};
    FILE_ABSOLUTE_PATH(STR_FREAD_TEST_TXT, ptr);
    FILE *fptr = fopen(ptr, "w+");
    if (!fptr) {
        t_error("%s fopen failed\n", __func__);
    }
    int result = __fwritable(fptr);
    EXPECT_NE("Fwritable0100", result, NUM_ZERO);
    fclose(fptr);
}

/**
 * @tc.name      : __fwritable_0200
 * @tc.desc      : Verify file is not writable (parameter invalid)
 * @tc.level     : Level 1
 */
void Fwritable0200(void)
{
    char ptr[PATH_MAX] = {0};
    FILE_ABSOLUTE_PATH(STR_FREAD_TEST_TXT, ptr);
    FILE *fptr = fopen(ptr, "r");
    if (!fptr) {
        t_error("%s fopen failed\n", __func__);
    }
    int result = __fwritable(fptr);
    EXPECT_EQ("Fwritable0200", result, NUM_ZERO);
    fclose(fptr);
    remove(ptr);
}

static int FwritableTestWithArgs(int argc, char *argv[])
{
    Fwritable0100();
    Fwritable0200();
    return g_tStatus;
}

int FwritableTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return FwritableTestWithArgs(1, libcArgv);
}
