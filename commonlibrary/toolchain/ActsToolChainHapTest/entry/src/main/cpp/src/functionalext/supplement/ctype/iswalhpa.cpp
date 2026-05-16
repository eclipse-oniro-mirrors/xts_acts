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

#include <cctype>
#include <cerrno>
#include <clocale>
#include <cstdio>
#include <cstring>
#include <cwchar>
#include <cwctype>
#include <dlfcn.h>
#include "functionalext.h"

/**
 * @tc.name      : Iswalhpa0100
 * @tc.desc      : Determine if the input wide character is a letter.
 * @tc.level     : Level 0
 */
void Iswalhpa0100()
{
    (void)setlocale(LC_CTYPE, "UTF-8");
    wchar_t str[] = L"a";
    int ret;
    int i = 0;
    while (str[i]) {
        ret = iswalpha(str[i]);
        if (!ret) {
            wprintf(L"'%lc' is not\n", str[i]);
        }
        i++;
    }
    EXPECT_NE("Iswalhpa0100", ret, 0);
}

/**
 * @tc.name      : Iswalhpa0200
 * @tc.desc      : Determine if the input wide character is a letter.
 * @tc.level     : Level 0
 */
void Iswalhpa0200()
{
    (void)setlocale(LC_CTYPE, "UTF-8");
    wchar_t str[] = L"A";
    int ret;
    int i = 0;
    while (str[i]) {
        ret = iswalpha(str[i]);
        if (!ret) {
            wprintf(L"'%lc' is not\n", str[i]);
        }
        i++;
    }
    EXPECT_NE("Iswalhpa0200", ret, 0);
}

/**
 * @tc.name      : Iswalhpa0300
 * @tc.desc      : Determine if the input wide character is not a letter.
 * @tc.level     : Level 2
 */
void Iswalhpa0300()
{
    (void)setlocale(LC_CTYPE, "UTF-8");
    wchar_t str[] = L"1";
    int ret;
    int i = 0;
    while (str[i]) {
        ret = iswalpha(str[i]);
        if (ret) {
            wprintf(L"'%lc' is alphabetic\n", str[i]);
        }
        i++;
    }
    EXPECT_EQ("Iswalhpa0300", ret, 0);
}

/**
 * @tc.name      : Iswalhpa0400
 * @tc.desc      : Determine if the input wide character is not a letter.
 * @tc.level     : Level 2
 */
void Iswalhpa0400()
{
    (void)setlocale(LC_CTYPE, "UTF-8");
    wchar_t str[] = L"【";
    int ret;
    int i = 0;
    while (str[i]) {
        ret = iswalpha(str[i]);
        if (ret) {
            wprintf(L"'%lc' is alphabetic\n", str[i]);
        }
        i++;
    }
    EXPECT_EQ("Iswalhpa0400", ret, 0);
}

static int IswalhpaTestImpl(int argc, char* argv[])
{
    Iswalhpa0100();
    Iswalhpa0200();
    Iswalhpa0300();
    Iswalhpa0400();
    return T_STATUS;
}

int IswalhpaTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return IswalhpaTestImpl(1, libcArgvStub);
}
