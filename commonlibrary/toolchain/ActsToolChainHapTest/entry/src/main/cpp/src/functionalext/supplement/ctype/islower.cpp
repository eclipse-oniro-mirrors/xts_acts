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
 * @tc.name      : Islower0100
 * @tc.desc      : The parameter c is a lowercase letter,which determines the case of the input character.
 * @tc.level     : Level 0
 */
void Islower0100(void)
{
    int ret = islower('a');
    EXPECT_NE("Islower0100", ret, EOK);
}

/**
 * @tc.name      : Islower0200
 * @tc.desc      : The parameter c is a uppercase letter,which determines the case of the input character.
 * @tc.level     : Level 2
 */
void Islower0200(void)
{
    int ret = islower('A');
    EXPECT_EQ("Islower0200", ret, EOK);
}

/**
 * @tc.name      : Islower0300
 * @tc.desc      : The parameter c is a number,which determines the case of the input character.
 * @tc.level     : Level 2
 */
void Islower0300(void)
{
    int ret = islower('1');
    EXPECT_EQ("Islower0300", ret, EOK);
}

/**
 * @tc.name      : Islower0400
 * @tc.desc      : The parameter c is a special character,which determines the case of the input character.
 * @tc.level     : Level 2
 */
void Islower0400(void)
{
    int ret = islower('[');
    EXPECT_EQ("Islower0400", ret, EOK);
}

/**
 * @tc.name      : Islower0500
 * @tc.desc      : Determine the number of lowercase letters in the ascii code table.
 * @tc.level     : Level 1
 */
void Islower0500(void)
{
    int total = 0;
    for (int i = 0; i < K_ASCII_CODE_UNIT_COUNT; i++) {
        int ret = islower(static_cast<char>(i));
        if (ret) {
            total++;
        }
    }
    EXPECT_EQ("Islower0500", total, COUNT);
}

/**
 * @tc.name      : IslowerL0100
 * @tc.desc      : Whether the characters in a string is lower characters
 * @tc.level     : Level 0
 */
void IslowerL0100(void)
{
    const char* str = "abcdegfhijklmnopqrstuvwxyz";
    const char* p = str;
    while (*p != '\0') {
        int ret = islower_l(*p, nullptr);
        EXPECT_EQ("IslowerL0100", ret, ONREXPECT);
        p++;
    }
}

/**
 * @tc.name      : IslowerL0200
 * @tc.desc      : Whether a character in a string is a non-lower character
 * @tc.level     : Level 2
 */
void IslowerL0200(void)
{
    const char* str = "23!@ABCHIJZ";
    const char* p = str;
    while (*p != '\0') {
        int ret = islower_l(*p, nullptr);
        EXPECT_EQ("IslowerL0200", ret, CMPFLAG);
        p++;
    }
}

static int IslowerTestImpl(void)
{
    Islower0100();
    Islower0200();
    Islower0300();
    Islower0400();
    Islower0500();
    IslowerL0100();
    IslowerL0200();
    return T_STATUS;
}

int IslowerTest(void)
{
    return IslowerTestImpl();
}
