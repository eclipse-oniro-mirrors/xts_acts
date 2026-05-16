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

const int COUNT = 62;
const int ISALNUM_SUCCESS_RETURN = 1;
const int COUNT_DEFAULT_LOCALE_UTF_8_1_BYTE = 62;
const int COUNT_DEFAULT_LOCALE_UTF_8_2_BYTE = 0;
const int COUNT_DEFAULT_LOCALE_UTF_8_3_BYTE = 0;
const int COUNT_DEFAULT_LOCALE_UTF_8_4_BYTE = 0;
const int COUNT_DEFAULT_LOCALE_UTF_8_4_BYTE_NEGTIVE = 0;
const int UTF_8_1_BYTE_MIN = 0x00;
const int UTF_8_1_BYTE_MAX = 0x7f;
const int UTF_8_2_BYTE_MIN = 0x0080;
const int UTF_8_2_BYTE_MAX = 0x07ff;
const int UTF_8_3_BYTE_MIN = 0x0800;
const int UTF_8_3_BYTE_MAX = 0xffff;
const int UTF_8_4_BYTE_MIN = 0x10000;
const int UTF_8_4_BYTE_MAX = 0x10ffff;
const int EOK = 0;

/**
 * @tc.name      : Isalnum0100
 * @tc.desc      : The parameter c is an English letter, and it is judged that the input character is a letter.
 * @tc.level     : Level 0
 */
void Isalnum0100(void)
{
    int ret = isalnum('a');
    EXPECT_NE("Isalnum0100", ret, EOK);
}

/**
 * @tc.name      : Isalnum0200
 * @tc.desc      : The parameter c is an English number, and it is judged that the input character is a number.
 * @tc.level     : Level 0
 */
void Isalnum0200(void)
{
    int ret = isalnum('1');
    EXPECT_NE("Isalnum0200", ret, EOK);
}

/**
 * @tc.name      : Isalnum0300
 * @tc.desc      : The parameter c is an special character,
 *                 and it is judged that the input character is not a letter or a number.
 * @tc.level     : Level 2
 */
void Isalnum0300(void)
{
    int ret = isalnum('*');
    EXPECT_EQ("Isalnum0300", ret, EOK);
}

/**
 * @tc.name      : Isalnum0400
 * @tc.desc      : Determine the number of letters and numbers in the ascii code table.
 * @tc.level     : Level 1
 */
void Isalnum0400(void)
{
    int total = 0;
    for (int i = 0; i < K_ASCII_CODE_UNIT_COUNT; i++) {
        int ret = isalnum(static_cast<char>(i));
        if (ret) {
            total++;
        }
    }
    EXPECT_EQ("Isalnum0400", total, COUNT);
}

/**
 * @tc.name      : Isalnum0500
 * @tc.desc      : test all input:0x00 - 0x7f(UTF-8 1 byte).
 * @tc.level     : Level 1
 */
void Isalnum0500(void)
{
    int total = 0;
    for (int i = UTF_8_1_BYTE_MIN; i <= UTF_8_1_BYTE_MAX; i++) {
        int ret = isalnum(i);
        if (ret) {
            EXPECT_EQ("Isalnum0500", ret, ISALNUM_SUCCESS_RETURN);
            total++;
        }
    }
    EXPECT_EQ("Isalnum0500", total, COUNT_DEFAULT_LOCALE_UTF_8_1_BYTE);
}

/**
 * @tc.name      : Isalnum0600
 * @tc.desc      : test all input:0x0080 - 0x07ff(UTF-8 2 byte).
 * @tc.level     : Level 1
 */
void Isalnum0600(void)
{
    int total = 0;
    for (int i = UTF_8_2_BYTE_MIN; i <= UTF_8_2_BYTE_MAX; i++) {
        int ret = isalnum(i);
        if (ret) {
            EXPECT_EQ("Isalnum0600", ret, ISALNUM_SUCCESS_RETURN);
            total++;
        }
    }
    EXPECT_EQ("Isalnum0600", total, COUNT_DEFAULT_LOCALE_UTF_8_2_BYTE);
}

/**
 * @tc.name      : Isalnum0700
 * @tc.desc      : test all input:0x0800 - 0xffff(UTF-8 3 byte).
 * @tc.level     : Level 1
 */
void Isalnum0700(void)
{
    int total = 0;
    for (int i = UTF_8_3_BYTE_MIN; i <= UTF_8_3_BYTE_MAX; i++) {
        int ret = isalnum(i);
        if (ret) {
            EXPECT_EQ("Isalnum0700", ret, ISALNUM_SUCCESS_RETURN);
            total++;
        }
    }
    EXPECT_EQ("Isalnum0700", total, COUNT_DEFAULT_LOCALE_UTF_8_3_BYTE);
}

/**
 * @tc.name      : Isalnum0800
 * @tc.desc      : test all input:0x10000 - 0x10ffff(UTF-8 4 byte).
 * @tc.level     : Level 1
 */
void Isalnum0800(void)
{
    int total = 0;
    for (int i = UTF_8_4_BYTE_MIN; i <= UTF_8_4_BYTE_MAX; i++) {
        int ret = isalnum(i);
        if (ret) {
            EXPECT_EQ("Isalnum0800", ret, ISALNUM_SUCCESS_RETURN);
            total++;
        }
    }
    EXPECT_EQ("Isalnum0800", total, COUNT_DEFAULT_LOCALE_UTF_8_4_BYTE);
}

/**
 * @tc.name      : Isalnum0900
 * @tc.desc      : test zero input.
 * @tc.level     : Level 1
 */
void Isalnum0900(void)
{
    int ret = isalnum(0);
    EXPECT_EQ("Isalnum0900", ret, 0);
}

/**
 * @tc.name      : Isalnum1000
 * @tc.desc      : test negative input -1.
 * @tc.level     : Level 1
 */
void Isalnum1000(void)
{
    int ret = isalnum(-1);
    EXPECT_EQ("Isalnum1000", ret, 0);
}

/**
 * @tc.name      : Isalnum1100
 * @tc.desc      : test negative input, max -1 * 0x10ffff.
 * @tc.level     : Level 1
 */
void Isalnum1100(void)
{
    int total = 0;
    for (int i = -1; i >= -1 * UTF_8_4_BYTE_MAX; i--) {
        int ret = isalnum(i);
        if (ret) {
            EXPECT_EQ("Isalnum1100", ret, ISALNUM_SUCCESS_RETURN);
            total++;
        }
    }
    EXPECT_EQ("Isalnum1100", total, COUNT_DEFAULT_LOCALE_UTF_8_4_BYTE_NEGTIVE);
}

static int IsalnumTestImpl(void)
{
    Isalnum0100();
    Isalnum0200();
    Isalnum0300();
    Isalnum0400();
    Isalnum0500();
    Isalnum0600();
    Isalnum0700();
    Isalnum0800();
    Isalnum0900();
    Isalnum1000();
    Isalnum1100();

    return T_STATUS;
}

int IsalnumTest(void)
{
    return IsalnumTestImpl();
}
