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
#include <cstdio>
#include <cwchar>
#include <cwctype>
#include "test.h"

/**
 * @tc.name      : Towctrans0100
 * @tc.desc      : Convert character of current type to lowercases
 * @tc.level     : Level 0
 */
void Towctrans0100(void)
{
    wchar_t str[] = L"ABCD";
    wctrans_t trans = wctrans("tolower");
    for (int i = 0; i < wcslen(str); i++) {
        str[i] = towctrans(str[i], trans);
    }
    if (wcscmp(str, L"abcd")) {
        t_error("%s towctrans lower failed", __func__);
    }
}

/**
 * @tc.name      : Towctrans0200
 * @tc.desc      : Convert character of current type to uppercase
 * @tc.level     : Level 1
 */
void Towctrans0200(void)
{
    wchar_t str[] = L"abcd";
    wctrans_t trans = wctrans("toupper");
    for (int i = 0; i < wcslen(str); i++) {
        str[i] = towctrans(str[i], trans);
    }
    if (wcscmp(str, L"ABCD")) {
        t_error("%s towctrans upper failed", __func__);
    }
}

/**
 * @tc.name      : Towctrans0300
 * @tc.desc      : Convert character of current type to uppercase
 * @tc.level     : Level 1
 */
void Towctrans0300(void)
{
    wchar_t str[] = L"Abcd";
    for (int i = 0; i < wcslen(str); i++) {
        str[i] = towctrans(str[i], nullptr);
    }
    if (wcscmp(str, L"Abcd")) {
        t_error("%s towctrans failed", __func__);
    }
}

static int TowctransTestImpl(int argc, char* argv[])
{
    Towctrans0100();
    Towctrans0200();
    Towctrans0300();
    return T_STATUS;
}

int TowctransTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return TowctransTestImpl(1, libcArgvStub);
}
