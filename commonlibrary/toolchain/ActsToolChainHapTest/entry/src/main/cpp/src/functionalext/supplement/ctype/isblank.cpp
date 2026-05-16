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

namespace {
constexpr int K_ASCII_CODE_UNIT_COUNT = 128;
} // namespace

const int RET = 0;
const int COUNT = 2;

/**
 * @tc.name      : Isblank0100
 * @tc.desc      : The parameter c is a space (' '), and the input character is judged to be a space.
 * @tc.level     : Level 0
 */
void Isblank0100(void)
{
    int ret = isblank(' ');
    EXPECT_NE("Isblank0100", ret, RET);
}

/**
 * @tc.name      : Isblank0200
 * @tc.desc      : The parameter c is a carriage return ('\t'), and the input character is judged to be a space.
 * @tc.level     : Level 0
 */
void Isblank0200(void)
{
    int ret = isblank('\t');
    EXPECT_NE("Isblank0200", ret, RET);
}

/**
 * @tc.name      : Isblank0300
 * @tc.desc      : The parameter c is carriage return ('\r'), which determines that the input character is not a space.
 * @tc.level     : Level 2
 */
void Isblank0300(void)
{
    int ret = isblank('\r');
    EXPECT_EQ("Isblank0300", ret, RET);
}

/**
 * @tc.name      : Isblank0400
 * @tc.desc      : The parameter c is a newline ('\n'), judging that the input character is not a space.
 * @tc.level     : Level 2
 */
void Isblank0400(void)
{
    int ret = isblank('\n');
    EXPECT_EQ("Isblank0400", ret, RET);
}

/**
 * @tc.name      : Isblank0500
 * @tc.desc      : The parameter c is the vertical positioning character ('\v'),
 *                 which judges that the input character is not a space.
 * @tc.level     : Level 2
 */
void Isblank0500(void)
{
    int ret = isblank('\v');
    EXPECT_EQ("Isblank0500", ret, RET);
}

/**
 * @tc.name      : Isblank0600
 * @tc.desc      : The parameter c is page turning ('\f'), which determines that the input character is not a space.
 * @tc.level     : Level 2
 */
void Isblank0600(void)
{
    int ret = isblank('\f');
    EXPECT_EQ("Isblank0600", ret, RET);
}

/**
 * @tc.name      : Isblank0700
 * @tc.desc      : The parameter c is an English letter, and it is judged that the input character is not a space.
 * @tc.level     : Level 2
 */
void Isblank0700(void)
{
    int ret = isblank('a');
    EXPECT_EQ("Isblank0700", ret, RET);
}

/**
 * @tc.name      : Isblank0800
 * @tc.desc      : The parameter c is alphanumeric, and it is judged that the input character is not a space.
 * @tc.level     : Level 2
 */
void Isblank0800(void)
{
    int ret = isblank('6');
    EXPECT_EQ("Isblank0800", ret, RET);
}

/**
 * @tc.name      : Isblank0900
 * @tc.desc      : The parameter c is a special character, and it is judged that the input character is not a space.
 * @tc.level     : Level 2
 */
void Isblank0900(void)
{
    int ret = isblank('#');
    EXPECT_EQ("Isblank0900", ret, RET);
}

/**
 * @tc.name      : Isblank1000
 * @tc.desc      : Determine the number of space characters in the ascii code table.
 * @tc.level     : Level 1
 */
void Isblank1000(void)
{
    int total = 0;
    for (int i = 0; i < K_ASCII_CODE_UNIT_COUNT; i++) {
        int ret = isblank(static_cast<char>(i));
        if (ret) {
            total++;
        }
    }
    EXPECT_EQ("Isblank1000", total, COUNT);
}

static int IsblankTestImpl(void)
{
    Isblank0100();
    Isblank0200();
    Isblank0300();
    Isblank0400();
    Isblank0500();
    Isblank0600();
    Isblank0700();
    Isblank0800();
    Isblank0900();
    Isblank1000();
    return T_STATUS;
}

int IsblankTest(void)
{
    return IsblankTestImpl();
}
