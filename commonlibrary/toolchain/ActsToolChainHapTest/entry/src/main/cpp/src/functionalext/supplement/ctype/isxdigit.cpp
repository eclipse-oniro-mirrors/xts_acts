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
#include "functionalext.h"

namespace {
constexpr int K_ASCII_CODE_UNIT_COUNT = 128;
} // namespace

const int COUNT = 22;
const int EOK = 0;

/**
 * @tc.name      : Isxdigit0100
 * @tc.desc      : The parameter c is alphanumeric, and the input character is judged to be a hexadecimal number.
 * @tc.level     : Level 0
 */
void Isxdigit0100(void)
{
    int ret = isxdigit('0');
    EXPECT_NE("Isxdigit0100", ret, EOK);
}

/**
 * @tc.name      : Isxdigit0200
 * @tc.desc      : The parameter c is a valid English letter(uppercase),
 *                 and the input character is judged to be a hexadecimal number.
 * @tc.level     : Level 0
 */
void Isxdigit0200(void)
{
    int ret = isxdigit('f');
    EXPECT_NE("Isxdigit0200", ret, EOK);
}

/**
 * @tc.name      : Isxdigit0300
 * @tc.desc      : The parameter c is a valid English letter(lowercase),
 *                 and the input character is judged to be a hexadecimal number.
 * @tc.level     : Level 0
 */
void Isxdigit0300(void)
{
    int ret = isxdigit('a');
    EXPECT_NE("Isxdigit0300", ret, EOK);
}

/**
 * @tc.name      : Isxdigit0400
 * @tc.desc      : The parameter c is a invalid English letter(uppercase),
 *                 and the input character is not a hexadecimal number.
 * @tc.level     : Level 2
 */
void Isxdigit0400(void)
{
    int ret = isxdigit('G');
    EXPECT_EQ("Isxdigit0400", ret, EOK);
}

/**
 * @tc.name      : Isxdigit0500
 * @tc.desc      : The parameter c is a special letter(%),
 *                 and the input character is not a hexadecimal number.
 * @tc.level     : Level 2
 */
void Isxdigit0500(void)
{
    int ret = isxdigit('%');
    EXPECT_EQ("Isxdigit0500", ret, EOK);
}

/**
 * @tc.name      : Isxdigit0600
 * @tc.desc      : Determine the number of hexadecimal letters in the ascii code table.
 * @tc.level     : Level 2
 */
void Isxdigit0600(void)
{
    int total = 0;
    for (int i = 0; i < K_ASCII_CODE_UNIT_COUNT; i++) {
        int ret = isxdigit(static_cast<char>(i));
        if (ret) {
            total++;
        }
    }
    EXPECT_EQ("Isxdigit0600", total, COUNT);
}

/**
 * @tc.name      : IsxdigitL0100
 * @tc.desc      : Whether the characters in a string is hexadecimal digit character
 * @tc.level     : Level 0
 */
void IsxdigitL0100(void)
{
    const char* str = "0123456789AaBbCcDdEeFf";
    const char* p = str;
    while (*p != '\0') {
        int ret = isxdigit_l(*p, nullptr);
        EXPECT_EQ("IsxdigitL0100", ret, ONREXPECT);
        p++;
    }
}

/**
 * @tc.name      : IsxdigitL0200
 * @tc.desc      : Whether the characters in a string is non-hexadecimal digit character
 * @tc.level     : Level 2
 */
void IsxdigitL0200(void)
{
    const char* str = "!@hHiIjJZz";
    const char* p = str;
    while (*p != '\0') {
        int ret = isxdigit_l(*p, nullptr);
        EXPECT_EQ("IsxdigitL0200", ret, CMPFLAG);
        p++;
    }
}

static int IsxdigitTestImpl(void)
{
    Isxdigit0100();
    Isxdigit0200();
    Isxdigit0300();
    Isxdigit0400();
    Isxdigit0500();
    Isxdigit0600();
    IsxdigitL0100();
    IsxdigitL0200();
    return T_STATUS;
}

int IsxdigitTest(void)
{
    return IsxdigitTestImpl();
}
