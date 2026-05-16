/**
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

#include <algorithm>
#include <cstdlib>
#include <cwchar>
#include <cwctype>
#include "functionalext.h"

#define TEST_BUFFER_SIZE 128

/**
 * @tc.name      : Mbstowcs0100
 * @tc.desc      : Convert a multibyte string to a wide-character string
 * @tc.level     : Level 0
 */
void Mbstowcs0100(void)
{
    const char* src = "Mbstowcs0100";
    wchar_t dst[TEST_BUFFER_SIZE];
    const wchar_t* wsrc = L"Mbstowcs0100";

    std::fill_n(dst, TEST_BUFFER_SIZE, L'\0');
    size_t ret = mbstowcs(dst, src, strlen(src));
    EXPECT_EQ("Mbstowcs0100", ret, strlen(src));

    if (ret > 0) {
        int r = wmemcmp(dst, wsrc, ret);
        EXPECT_EQ("Mbstowcs0100", r, CMPFLAG);
    }
}

/**
 * @tc.name      : Mbstowcs0200
 * @tc.desc      : Provide exception parameter data, convert the string to a wide string
 * @tc.level     : Level 2
 */
void Mbstowcs0200(void)
{
    const char* src = "Mbstowcs0200";
    wchar_t dst[TEST_BUFFER_SIZE];
    std::fill_n(dst, TEST_BUFFER_SIZE, L'\0');

    size_t ret = mbstowcs(dst, src, 0);
    if (ret != CMPFLAG) {
        EXPECT_EQ("Mbstowcs0200", ret, CMPFLAG);
    }

    ret = mbstowcs(nullptr, src, strlen(src));
    EXPECT_EQ("Mbstowcs0200", ret, strlen(src));
}

static int MbstowcsTestImpl(void)
{
    Mbstowcs0100();
    Mbstowcs0200();
    return T_STATUS;
}

int MbstowcsTest(void)
{
    return MbstowcsTestImpl();
}
