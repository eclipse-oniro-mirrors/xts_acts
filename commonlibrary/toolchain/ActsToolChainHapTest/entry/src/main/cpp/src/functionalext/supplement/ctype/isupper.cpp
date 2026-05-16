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

const int COUNT = 26;
const int EOK = 0;

/**
 * @tc.name      : Isupper0100
 * @tc.desc      : The parameter c is a uppercase letter,which determines the case of the input character.
 * @tc.level     : Level 0
 */
void Isupper0100(void)
{
    int ret = isupper('A');
    EXPECT_NE("Isupper0100", ret, EOK);
}

/**
 * @tc.name      : Isupper0200
 * @tc.desc      : The parameter c is a lowercase letter,which determines the case of the input character.
 * @tc.level     : Level 2
 */
void Isupper0200(void)
{
    int ret = isupper('a');
    EXPECT_EQ("Isupper0200", ret, EOK);
}

/**
 * @tc.name      : Isupper0300
 * @tc.desc      : The parameter c is a number,which determines the case of the input character.
 * @tc.level     : Level 2
 */
void Isupper0300(void)
{
    int ret = isupper('1');
    EXPECT_EQ("Isupper0300", ret, EOK);
}

/**
 * @tc.name      : Isupper0400
 * @tc.desc      : The parameter c is a special character,which determines the case of the input character.
 * @tc.level     : Level 2
 */
void Isupper0400(void)
{
    int ret = isupper('[');
    EXPECT_EQ("Isupper0400", ret, EOK);
}

/**
 * @tc.name      : Isupper0500
 * @tc.desc      : Determine the number of uppercase letters in the ascii code table.
 * @tc.level     : Level 1
 */
void Isupper0500(void)
{
    int total = 0;
    for (int i = 0; i < K_ASCII_CODE_UNIT_COUNT; i++) {
        int ret = isupper(static_cast<char>(i));
        if (ret) {
            total++;
        }
    }
    EXPECT_EQ("Isupper0500", total, COUNT);
}

/**
 * @tc.name      : IsupperL0100
 * @tc.desc      : Whether the characters in a string is upper characters
 * @tc.level     : Level 0
 */
void IsupperL0100(void)
{
    const char* str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    const char* p = str;
    while (*p != '\0') {
        int ret = isupper_l(*p, nullptr);
        EXPECT_EQ("IsupperL0100", ret, ONREXPECT);
        p++;
    }
}

/**
 * @tc.name      : IsupperL0200
 * @tc.desc      : Whether a character in a string is a non-upper character
 * @tc.level     : Level 2
 */
void IsupperL0200(void)
{
    const char* str = "23!@abcdefg";
    const char* p = str;
    while (*p != '\0') {
        int ret = isupper_l(*p, nullptr);
        EXPECT_EQ("IsupperL0200", ret, CMPFLAG);
        p++;
    }
}

static int IsupperTestImpl(void)
{
    Isupper0100();
    Isupper0200();
    Isupper0300();
    Isupper0400();
    Isupper0500();
    IsupperL0100();
    IsupperL0200();
    return T_STATUS;
}

int IsupperTest(void)
{
    return IsupperTestImpl();
}
