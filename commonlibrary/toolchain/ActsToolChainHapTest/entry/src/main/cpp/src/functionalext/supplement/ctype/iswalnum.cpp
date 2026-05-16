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

#include <cctype>
#include <cwchar>
#include "functionalext.h"

/**
 * @tc.name      : Iswalnum0100
 * @tc.desc      : Tests whether the characters in the given string are numbers or letters
 * @tc.level     : Level 0
 */
void Iswalnum0100(void)
{
    const wchar_t* str = L"aAÇçΔδ2";
    int ret = 0;
    while (*str) {
        ret = iswalnum(*str);
        EXPECT_EQ("Iswalnum0100", ret, ONREXPECT);
        str++;
    }
}

/**
 * @tc.name      : Iswalnum0200
 * @tc.desc      : Tests that the characters in the given string are not numbers or letters
 * @tc.level     : Level 2
 */
void Iswalnum0200(void)
{
    const wchar_t* str = L"@#$*&!";
    int ret = 0;
    while (*str) {
        ret = iswalnum(*str);
        EXPECT_EQ("Iswalnum0200", ret, CMPFLAG);
        str++;
    }
}

static int IswalnumTestImpl(void)
{
    Iswalnum0100();
    Iswalnum0200();
    return T_STATUS;
}

int IswalnumTest(void)
{
    return IswalnumTestImpl();
}
