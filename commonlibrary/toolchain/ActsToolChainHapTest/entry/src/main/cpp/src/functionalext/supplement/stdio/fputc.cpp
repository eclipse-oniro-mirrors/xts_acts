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

#include "functionalext.h"
#include "filepath_util.h"

#define CHAR_A_ASCII 97

/**
 * @tc.name       : Fputc0100
 * @tc.desc       : Verify that a character can be written to the file
 * @tc.level      : level 0.
 */
void Fputc0100(void)
{
    char path[PATH_MAX] = {0};
    if (!FileAbsolutePath(STR_FPUTC_TXT, path, sizeof(path))) {
        return;
    }
    FILE *fptr = fopen(path, "w");
    int exitCode = fputc('a', fptr);
    EXPECT_EQ("Fputc0100", exitCode, CHAR_A_ASCII);
    (void)fclose(fptr);
}

/**
 * @tc.name       : Fputc0200
 * @tc.desc       : Verify that a character cannot be written to the file
 * @tc.level      : level 2.
 */
void Fputc0200(void)
{
    char path[PATH_MAX] = {0};
    if (!FileAbsolutePath(STR_FPUTC_TXT, path, sizeof(path))) {
        return;
    }
    FILE *fptr = fopen(path, "r");
    int exitCode = fputc('a', fptr);
    EXPECT_EQ("Fputc0200", exitCode, EOF);
    (void)fclose(fptr);
    (void)remove(path);
}

static int FputcTestImpl(void)
{
    Fputc0100();
    Fputc0200();
    return g_tStatus;
}

int FputcTest(void)
{
    return FputcTestImpl();
}
