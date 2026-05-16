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

#include <cctype>
#include <cstdlib>
#include <unistd.h>
#include <cwchar>
#include "functionalext.h"

const int SUCCESS = 0;
const int FAILED = -1;
const int STRING_EQUAL = 0;

/**
 * @tc.name      : Fputwc0100
 * @tc.desc      : Each parameter is valid, a single call can output wide characters to the file stream
 * @tc.level     : Level 0
 */
void Fputwc0100()
{
    wchar_t str[] = L"T";
    wchar_t buf[100];
    wint_t wc;
    int ri = 0;
    int j = 0;
    FILE *fp = fopen("/data/storage/el2/base/cache/file.txt", "w+");
    if (fp) {
        for (unsigned int i = 0; i < wcslen(str); i++) {
            wc = fputwc(str[i], fp);
            if (wc != str[i]) {
                ri++;
            }
        }
    } else {
        t_error("%s File opening failed", __func__);
    }

    (void)fclose(fp);
    FILE *ffp = fopen("/data/storage/el2/base/cache/file.txt", "r");
    EXPECT_PTRNE("Fputwc0100", ffp, NULL);
    fgetws(buf, wcslen(str) + 1, ffp);
    EXPECT_EQ("Fputwc0100", ri, 0);
    EXPECT_EQ("Fputwc0100", wcscoll(buf, str), STRING_EQUAL);

    (void)fclose(ffp);
    (void)remove("/data/storage/el2/base/cache/file.txt");
}

/**
 * @tc.name      : Fputwc0200
 * @tc.desc      : Each parameter is valid, called multiple times, and can output wide characters to the file stream
 * @tc.level     : Level 1
 */
void Fputwc0200()
{
    wchar_t str[] = L"This is a test";
    wchar_t buf[100];
    wint_t wc;
    int ri = 0;
    int j = 0;
    FILE *fp = fopen("/data/storage/el2/base/cache/file.txt", "w+");
    if (fp) {
        for (unsigned int i = 0; i < wcslen(str); i++) {
            wc = fputwc(str[i], fp);
            if (wc != str[i]) {
                ri++;
            }
        }
    } else {
        t_error("%s File opening failed", __func__);
    }
    (void)fclose(fp);
    FILE *ffp = fopen("/data/storage/el2/base/cache/file.txt", "r");
    EXPECT_PTRNE("Fputwc0200", ffp, NULL);
    fgetws(buf, wcslen(str) + 1, ffp);
    EXPECT_EQ("Fputwc0200", ri, 0);
    EXPECT_EQ("Fputwc0200", wcscoll(buf, str), STRING_EQUAL);
    (void)fclose(ffp);
    (void)remove("/data/storage/el2/base/cache/file.txt");
}

static int FputwcTestImpl(int argc, char *argv[])
{
    Fputwc0100();
    Fputwc0200();
    return g_tStatus;
}

int FputwcTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return FputwcTestImpl(1, libcArgv);
}
