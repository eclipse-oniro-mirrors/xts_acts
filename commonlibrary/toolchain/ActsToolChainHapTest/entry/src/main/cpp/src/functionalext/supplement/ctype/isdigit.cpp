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

/**
 * @tc.name      : Isdigit0100
 * @tc.desc      : Whether the characters in a string is numeric characters
 * @tc.level     : Level 0
 */
void Isdigit0100(void)
{
    const char* str = "0123456789";
    const char* p = str;
    while (*p != '\0') {
        int ret = isdigit(*p);
        EXPECT_EQ("Isdigit0100", ret, ONREXPECT);
        p++;
    }
}

/**
 * @tc.name      : Isdigit0200
 * @tc.desc      : Whether a character in a string is a non-numeric character
 * @tc.level     : Level 2
 */
void Isdigit0200(void)
{
    const char* str = "!@hHiIjJZz";
    const char* p = str;
    while (*p != '\0') {
        int ret = isdigit(*p);
        EXPECT_EQ("Isdigit0200", ret, CMPFLAG);
        p++;
    }
}

/**
 * @tc.name      : Isdigit0300
 * @tc.desc      : Verify non-printable characters (e.g., \\0, EOF, negative) return false
 * @tc.level     : Level 2
 */
void Isdigit0300(void)
{
    int testChars[] = { '\0', EOF, -1, 128, 255 };
    for (size_t i = 0; i < sizeof(testChars) / sizeof(testChars[0]); i++) {
        int ret = isdigit(testChars[i]);
        EXPECT_EQ("Isdigit0300", ret, CMPFLAG);
    }
}

/**
 * @tc.name      : Isdigit0400
 * @tc.desc      : Verify mixed numeric and non-numeric characters
 * @tc.level     : Level 1
 */
void Isdigit0400(void)
{
    const char str[] = "a1B2c3D4#";
    const int expected[] = { 0, 1, 0, 1, 0, 1, 0, 1, 0 };
    for (size_t i = 0; str[i] != '\0'; i++) {
        int ret = isdigit(str[i]);
        EXPECT_EQ("Isdigit0400", ret, expected[i]);
    }
}

static int IsdigitTestImpl(void)
{
    Isdigit0100();
    Isdigit0200();
    Isdigit0300();
    Isdigit0400();
    return T_STATUS;
}

int IsdigitTest(void)
{
    return IsdigitTestImpl();
}
