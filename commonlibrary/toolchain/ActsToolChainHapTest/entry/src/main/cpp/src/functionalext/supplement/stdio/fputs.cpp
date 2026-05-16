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

static const char *PATH = "/data/storage/el2/base/cache/fputs.txt";

/**
 * @tc.name       : Fputs0100
 * @tc.desc       : Writes the string s to stream
 * @tc.level      : level 0.
 */
void Fputs0100(void)
{
    FILE *fptr = fopen(PATH, "w+");
    EXPECT_PTRNE("Fputs0100", fptr, NULL);

    int len = fputs("this is a test string", fptr);
    EXPECT_TRUE("Fputs0100", len >= 0);
    (void)fclose(fptr);
    (void)remove(PATH);
}

/**
 * @tc.name       : Fputs0200
 * @tc.desc       : An empty string is written in the specified file.
 * @tc.level      : level 0.
 */
void Fputs0200(void)
{
    FILE *fptr = fopen(PATH, "w+");
    EXPECT_PTRNE("Fputs0200", fptr, NULL);

    int len = fputs("", fptr);
    EXPECT_TRUE("Fputs0200", len >= 0);
    (void)fclose(fptr);
    (void)remove(PATH);
}

/**
 * @tc.name       : Fputs0300
 * @tc.desc       : Verify that an empty string cannot be written to the specified file.
 * @tc.level      : level 2.
 */
void Fputs0300(void)
{
    FILE *p = fopen(PATH, "w");
    (void)fclose(p);
    p = fopen(PATH, "r");
    int len = fputs("this is a test string", p);
    EXPECT_EQ("Fputs0300", len, EOF);
    (void)fclose(p);
    (void)remove(PATH);
}

static int FputsTestImpl(int argc, char *argv[])
{
    Fputs0100();
    Fputs0200();
    Fputs0300();
    return g_tStatus;
}

int FputsTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, NULL };
    return FputsTestImpl(1, libcArgv);
}
