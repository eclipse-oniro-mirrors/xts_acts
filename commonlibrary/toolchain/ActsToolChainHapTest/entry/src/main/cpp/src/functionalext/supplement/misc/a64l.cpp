/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
#include "functionalext.h"
#include "include/src/functionalext/supplement/misc.h"

constexpr int CHAR_GROUP_BASE = 6;
constexpr int UPPERCASE_OFFSET = 12;
constexpr int LOWERCASE_OFFSET = 38;

extern "C" long A64l(const char* s)
{
    if (s == nullptr) {
        return 0;
    }
    long result = 0;
    for (int i = 0; i < CHAR_GROUP_BASE && s[i] != '\0'; ++i) {
        unsigned char ch = static_cast<unsigned char>(s[i]);
        int value = -1;
        if (ch >= '.' && ch <= '9') {
            value = ch - '.';
        } else if (ch >= 'A' && ch <= 'Z') {
            value = ch - 'A' + UPPERCASE_OFFSET;
        } else if (ch >= 'a' && ch <= 'z') {
            value = ch - 'a' + LOWERCASE_OFFSET;
        } else {
            break;
        }
        result |= (static_cast<long>(value) << (CHAR_GROUP_BASE * i));
    }
    return result;
}

#define VALUE_0 2
#define VALUE_A 12
#define VALUE_Z 63
#define VALUE 64
#define VALUE_0123 1327298
#define VALUE_ABCD 3990348
#define VALUE_ZZZZZ 1073741823

/**
 * @tc.name      : A64l0100
 * @tc.desc      : Verify normal character
 * @tc.level     : Level 0
 */
void A64l0100(void)
{
    long result1 = A64l("0");
    long result2 = A64l("A");
    long result3 = A64l("z");
    long result4 = A64l("./");
    EXPECT_EQ("A64l0100", result1, VALUE_0); // expect result is 2
    EXPECT_EQ("A64l0100", result2, VALUE_A); // expect result is 12
    EXPECT_EQ("A64l0100", result3, VALUE_Z); // expect result is 63
    EXPECT_EQ("A64l0100", result4, VALUE);   // expect result is 64
}

/**
 * @tc.name      : A64l0200
 * @tc.desc      : Verify multi character
 * @tc.level     : Level 0
 */
void A64l0200(void)
{
    long result1 = A64l("0123");
    long result2 = A64l("ABCD");
    EXPECT_EQ("A64l0200", result1, VALUE_0123); // (2 | (3 << 6) | (4 << 12) | (5 << 18))
    EXPECT_EQ("A64l0200", result2, VALUE_ABCD); // (12 | (13 << 6) | (14 << 12) | (15 << 18)
}

/**
 * @tc.name      : A64l0300
 * @tc.desc      : Verify illegal character
 * @tc.level     : Level 0
 */
void A64l0300(void)
{
    long result1 = A64l("A@B");
    long result2 = A64l("0#");
    EXPECT_EQ("A64l0300", result1, VALUE_A); // expect result is 12
    EXPECT_EQ("A64l0300", result2, VALUE_0); // expect result is 2
}

/**
 * @tc.name      : A64l0400
 * @tc.desc      : Verify empty characters
 * @tc.level     : Level 0
 */
void A64l0400(void)
{
    long result = A64l("");
    EXPECT_EQ("A64l0400", result, 0);
}

/**
 * @tc.name      : A64l0500
 * @tc.desc      : Verify the maximum length
 * @tc.level     : Level 0
 */
void A64l0500(void)
{
    long result1 = A64l("zzzzzz");
    long result2 = A64l("zzzzz");
    EXPECT_EQ("A64l0500", result1, -1);          // (63 | (63 << 6) | (63 << 12) | (63 << 18) | (63 << 24) | (63 << 30))
    EXPECT_EQ("A64l0500", result2, VALUE_ZZZZZ); // (63 | (63 << 6) | (63 << 12) | (63 << 18) | (63 << 24))
}

static int A64lTestWithArgs(int argc, char* argv[])
{
    A64l0100();
    A64l0200();
    A64l0300();
    A64l0400();
    A64l0500();
    return T_STATUS;
}

int A64lTest(void)
{
    static char libcProg[] = "libc_test";
    char* libcArgv[] = { libcProg, nullptr };
    return A64lTestWithArgs(1, libcArgv);
}

int A64lTestCompat(void)
{
    return A64lTest();
}
