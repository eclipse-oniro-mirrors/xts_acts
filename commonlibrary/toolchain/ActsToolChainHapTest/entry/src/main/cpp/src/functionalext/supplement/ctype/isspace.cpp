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
constexpr int K_ASCII_CODE_COUNT = 128;
constexpr int K_EXPECTED_SPACE_IN_ASCII = 6;
} // namespace

/*
 * @tc.name      : Isspace0100
 * @tc.desc      : Verify that the input character is a space (the parameter is a space)
 * @tc.level     : Level 0
 */
void Isspace0100(void)
{
    int ret = isspace(' ');
    EXPECT_NE("Isspace0100", ret, 0);
}

/*
 * @tc.name      : Isspace0200
 * @tc.desc      : Verify that the input character is a space (parameter is \r)
 * @tc.level     : Level 1
 */
void Isspace0200(void)
{
    int ret = isspace('\r');
    EXPECT_NE("Isspace0200", ret, 0);
}

/*
 * @tc.name      : Isspace0300
 * @tc.desc      : Verify that the input character is a space (parameter is \n)
 * @tc.level     : Level 1
 */
void Isspace0300(void)
{
    int ret = isspace('\n');
    EXPECT_NE("Isspace0300", ret, 0);
}

/*
 * @tc.name      : Isspace0400
 * @tc.desc      : EVerify that the input character is a space (parameter is \v)
 * @tc.level     : Level 1
 */
void Isspace0400(void)
{
    int ret = isspace('\v');
    EXPECT_NE("Isspace0400", ret, 0);
}

/*
 * @tc.name      : Isspace0500
 * @tc.desc      : Verify that the input character is a space (parameter is \f)
 * @tc.level     : Level 1
 */
void Isspace0500(void)
{
    int ret = isspace('\f');
    EXPECT_NE("Isspace0500", ret, 0);
}

/*
 * @tc.name      : Isspace0600
 * @tc.desc      : Verify that the input character is not a space (parameter is 'a')
 * @tc.level     : Level 2
 */
void Isspace0600(void)
{
    int ret = isspace('a');
    EXPECT_EQ("Isspace0600", ret, 0);
}

/*
 * @tc.name      : Isspace0700
 * @tc.desc      : Verify that the input character is not a space (parameter is '6')
 * @tc.level     : Level 2
 */
void Isspace0700(void)
{
    int ret = isspace('6');
    EXPECT_EQ("Isspace0700", ret, 0);
}

/*
 * @tc.name      : Isspace0800
 * @tc.desc      : Verify that the input character is not a space (parameter is '#')
 * @tc.level     : Level 2
 */
void Isspace0800(void)
{
    int ret = isspace('#');
    EXPECT_EQ("Isspace0800", ret, 0);
}

/*
 * @tc.name      : Isspace0900
 * @tc.desc      : Verify the number of characters in the ascii code table
 * @tc.level     : Level 1
 */
void Isspace0900(void)
{
    int total = 0;
    for (int i = 0; i < K_ASCII_CODE_COUNT; i++) {
        int ret = isspace(static_cast<char>(i));
        if (ret) {
            total++;
        }
    }
    EXPECT_EQ("Isspace0900", total, K_EXPECTED_SPACE_IN_ASCII);
}

static int IsspaceTestImpl(void)
{
    Isspace0100();
    Isspace0200();
    Isspace0300();
    Isspace0400();
    Isspace0500();
    Isspace0600();
    Isspace0700();
    Isspace0800();
    Isspace0900();

    return T_STATUS;
}

int IsspaceTest(void)
{
    return IsspaceTestImpl();
}
