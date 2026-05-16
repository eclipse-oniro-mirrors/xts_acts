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
#include "functionalext.h"

/**
 * @tc.name      : fwprintf_0100
 * @tc.desc      : Verify the number of wide characters returned by the function (if the file parameter is stdout)
 * @tc.level     : Level 0
 */
void Fwprintf0100(void)
{
    int result = fwprintf(stdout, L"This is a test!!QAZ@WSX12");
    printf("\n");
    int ret = strlen("This is a test!!QAZ@WSX12");
    EXPECT_EQ("Fwprintf0100", result, ret);
}

/**
 * @tc.name      : fwprintf_0200
 * @tc.desc      : Verify the number of wide characters returned by the function (if the file parameter is stderr)
 * @tc.level     : Level 0
 */
void Fwprintf0200(void)
{
    int result = fwprintf(stderr, L"This is a test!");
    printf("\n");
    int ret = strlen("This is a test!");
    EXPECT_EQ("Fwprintf0200", result, ret);
}

/**
 * @tc.name      : fwprintf_0300
 * @tc.desc      : Verifies the number of wide characters returned by the function
                   (if the file is successfully opened in W mode and its return value is used as the file parameter)
 * @tc.level     : Level 0
 */
void Fwprintf0300(void)
{
    FILE *fptr = fopen("/data/storage/el2/base/cache/test.txt", "w");
    EXPECT_PTRNE("Fwprintf0300", fptr, NULL);

    int result = fwprintf(fptr, L"This is a test!");
    int ret = strlen("This is a test!");
    EXPECT_EQ("Fwprintf0300", result, ret);

    (void)fclose(fptr);
    (void)remove("/data/storage/el2/base/cache/test.txt");
}

/**
 * @tc.name      : fwprintf_0400
 * @tc.desc      : Verifies the number of wide characters returned by the function
                  (if the file is successfully opened in R mode and its return value is used as a file parameter)
 * @tc.level     : Level 2
 */
void Fwprintf0400(void)
{
    const char *path = "/data/storage/el2/base/cache/test.txt";

    FILE *fptr1 = fopen(path, "w");
    EXPECT_PTRNE("Fwprintf0400", fptr1, NULL);
    (void)fclose(fptr1);

    FILE *fptr2 = fopen(path, "r");
    int result = fwprintf(fptr2, L"This is a test!");
    EXPECT_EQ("Fwprintf0400", result, -1);

    (void)fclose(fptr2);
    (void)remove(path);
}

static int FwprintfTestImpl(int argc, char *argv[])
{
    Fwprintf0100();
    Fwprintf0200();
    Fwprintf0300();
    Fwprintf0400();
    return g_tStatus;
}

int FwprintfTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return FwprintfTestImpl(1, libcArgv);
}
