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

#include <cstdlib>
#include <cwchar>
#include <cwctype>

#include "functionalext.h"

#define ARRY_MAX 128

namespace {
constexpr size_t K_MBSNRTOWCS_IN_BYTE_LEN = 2U;
constexpr size_t K_MUSL_TEST_WIDE_COUNT = 9U;
} // namespace

/**
 * @tc.name      : Mbsnrtowcs0100
 * @tc.desc      : whether the function successfully converted the character
 * @tc.level     : Level 0
 */
void Mbsnrtowcs0100(void)
{
    const char* test = "musl test";

    wchar_t wc[ARRY_MAX]{};

    size_t result = mbsnrtowcs(wc, &test, K_MBSNRTOWCS_IN_BYTE_LEN, ARRY_MAX, nullptr);
    if (result != -1) {
        EXPECT_EQ("Mbsnrtowcs0100", result, K_MBSNRTOWCS_IN_BYTE_LEN);
        EXPECT_EQ("Mbsnrtowcs0100", wc[0], L'm');
        EXPECT_EQ("Mbsnrtowcs0100", wc[1], L'u');
    }
}

/**
 * @tc.name      : Mbsnrtowcs0200
 * @tc.desc      : Pass in the return value of the abnormal length judgment function
 * @tc.level     : Level 2
 */
void Mbsnrtowcs0200(void)
{
    const char* test = "musl test";
    wchar_t wc[ARRY_MAX]{};
    size_t result = mbsnrtowcs(wc, &test, 11, ARRY_MAX, nullptr);

    EXPECT_EQ("Mbsnrtowcs0200", result, K_MUSL_TEST_WIDE_COUNT);
}

static int MbsnrtowcsTestImpl(void)
{
    Mbsnrtowcs0100();
    Mbsnrtowcs0200();

    return T_STATUS;
}

int MbsnrtowcsTest(void)
{
    return MbsnrtowcsTestImpl();
}
