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

#include <cwchar>
#include <clocale>
#include "functionalext.h"

const int FAILED = -1;

/**
 * @tc.name      : Fputws0100
 * @tc.desc      : Each parameter is valid and can output a wide character string to a file stream.
 * @tc.level     : Level 0
 */
void Fputws0100(void)
{
    char str[100] = {0};
    const char *ptr = "/data/storage/el2/base/cache/fputwstest.txt";
    FILE *fptr = fopen(ptr, "w+");
    EXPECT_TRUE("Fputws0100", fptr != nullptr);
    (void)setlocale(LC_ALL, "en_US.utf8");
    int ret = fputws(L"this is the test", fptr);
    EXPECT_TRUE("Fputws0100", ret >= 0);
    if (fseek(fptr, 0, SEEK_SET) != 0) {
        t_error("%s fseek failed\n", __func__);
    }
    int rsize = fread(str, sizeof(char), 100, fptr);
    EXPECT_EQ("Fputws0100", rsize, ret);
    (void)fclose(fptr);
    (void)remove(ptr);
    fptr = nullptr;
    ptr = nullptr;
}

/**
 * @tc.name      : Fputws0200
 * @tc.desc      : The f parameter is invalid, a wide string cannot be output to a file stream.
 * @tc.level     : Level 2
 */
void Fputws0200(void)
{
    const char *ptr = "/data/storage/el2/base/cache/fputwstest.txt";
    FILE *fptr = fopen(ptr, "w+");
    EXPECT_TRUE("Fputws0200", fptr != nullptr);
    (void)fclose(fptr);
    fptr = fopen(ptr, "r");
    EXPECT_TRUE("Fputws0200", fptr != nullptr);
    int ret = fputws(L"this is the test", fptr);
    EXPECT_EQ("Fputws0200", ret, FAILED);
    (void)fclose(fptr);
    (void)remove(ptr);
    fptr = nullptr;
    ptr = nullptr;
}

static int FputwsTestImpl(int argc, char *argv[])
{
    Fputws0100();
    Fputws0200();
    return g_tStatus;
}

int FputwsTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return FputwsTestImpl(1, libcArgv);
}
