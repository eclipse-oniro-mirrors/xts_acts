/*
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

const int32_t COUNT_ZERO = 0;

namespace {
constexpr int K_ASCII_EXCLUSIVE_MAX = 128;
constexpr int K_EXPECTED_ALPHA_COUNT = 52;
constexpr int K_ASCII_UPPER_A = 65;
constexpr int K_ASCII_UPPER_Z_EXCLUSIVE = 91;
constexpr int K_ASCII_LOWER_A = 97;
constexpr int K_ASCII_LOWER_Z_EXCLUSIVE = 123;
} // namespace

/**
 * @tc.name      : Isalpha0100
 * @tc.desc      : Verify that the entered character is a letter (parameter is 'a')
 * @tc.level     : Level 0
 */
void Isalpha0100(void)
{
    int ret = isalpha('a');
    EXPECT_NE("Isalpha0100", ret, COUNT_ZERO);
}

/**
 * @tc.name      : Isalpha0200
 * @tc.desc      : Verify that the entered character is not a letter (parameter is 'A')
 * @tc.level     : Level 2
 */
void Isalpha0200(void)
{
    int ret = isalpha('A');
    EXPECT_NE("Isalpha0200", ret, COUNT_ZERO);
}

/**
 * @tc.name      : Isalpha0300
 * @tc.desc      : Verify that the entered character is not a letter (parameter is '1')
 * @tc.level     : Level 2
 */
void Isalpha0300(void)
{
    int ret = isspace('1');
    EXPECT_EQ("Isalpha0300", ret, COUNT_ZERO);
}

/**
 * @tc.name      : Isalpha0400
 * @tc.desc      : Verify that the entered character is not a letter (parameter is '【')
 * @tc.level     : Level 2
 */
void Isalpha0400(void)
{
    int ret = isspace('[');
    EXPECT_EQ("Isalpha0400", ret, COUNT_ZERO);
}

/**
 * @tc.name      : Isalpha0500
 * @tc.desc      : Verify the number of letters in the ascii code table
 * @tc.level     : Level 1
 */
void Isalpha0500(void)
{
    int total = 0;
    for (int i = 0; i < K_ASCII_EXCLUSIVE_MAX; i++) {
        int ret = isalpha(static_cast<char>(i));
        if (ret) {
            total++;
        }
    }
    EXPECT_EQ("Isalpha0500", total, K_EXPECTED_ALPHA_COUNT);
}

/**
 * @tc.name      : Isalpha0600
 * @tc.desc      : Verify all the letters in the ASCII code table
 * @tc.level     : Level 1
 */
void Isalpha0600(void)
{
    for (int i = K_ASCII_UPPER_A; i < K_ASCII_UPPER_Z_EXCLUSIVE; i++) {
        int ret = isalpha(static_cast<char>(i));
        EXPECT_NE("Isalpha0600", ret, COUNT_ZERO);
    }

    for (int i = K_ASCII_LOWER_A; i < K_ASCII_LOWER_Z_EXCLUSIVE; i++) {
        int ret = isalpha(static_cast<char>(i));
        EXPECT_NE("Isalpha0600", ret, COUNT_ZERO);
    }
}

/**
 * @tc.name      : Isalpha0700
 * @tc.desc      : Verify all non-alphabetic characters in the ASCII code table
 * @tc.level     : Level 1
 */
void Isalpha0700(void)
{
    for (int i = 0; i < K_ASCII_UPPER_A; i++) {
        int ret = isalpha(static_cast<char>(i));
        EXPECT_EQ("Isalpha0700", ret, COUNT_ZERO);
    }

    for (int i = K_ASCII_UPPER_Z_EXCLUSIVE; i < K_ASCII_LOWER_A; i++) {
        int ret = isalpha(static_cast<char>(i));
        EXPECT_EQ("Isalpha0700", ret, COUNT_ZERO);
    }

    for (int i = K_ASCII_LOWER_Z_EXCLUSIVE; i < K_ASCII_EXCLUSIVE_MAX; i++) {
        int ret = isalpha(static_cast<char>(i));
        EXPECT_EQ("Isalpha0700", ret, COUNT_ZERO);
    }
}

static int IsalphaTestImpl(void)
{
    Isalpha0100();
    Isalpha0200();
    Isalpha0300();
    Isalpha0400();
    Isalpha0500();
    Isalpha0600();
    Isalpha0700();
    return T_STATUS;
}

int IsalphaTest(void)
{
    return IsalphaTestImpl();
}
