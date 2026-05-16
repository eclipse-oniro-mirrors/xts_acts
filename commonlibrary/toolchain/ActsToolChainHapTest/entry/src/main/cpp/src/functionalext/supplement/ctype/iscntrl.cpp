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
const int COUNT = 33;

/**
 * @tc.name      : Iscntrl0100
 * @tc.desc      : If the parameter c is 0, it is judged that the input character is a control character.
 * @tc.level     : Level 0
 */
void Iscntrl0100(void)
{
    int ret = iscntrl(0);
    EXPECT_NE("Iscntrl0100", ret, RET);
}

/**
 * @tc.name      : Iscntrl0200
 * @tc.desc      : The parameter c is 31, and the input character is judged to be a control character.
 * @tc.level     : Level 0
 */
void Iscntrl0200(void)
{
    int ret = iscntrl(31);
    EXPECT_NE("Iscntrl0200", ret, RET);
}

/**
 * @tc.name      : Iscntrl0300
 * @tc.desc      : The parameter c is 127, and the input character is judged to be a control character.
 * @tc.level     : Level 2
 */
void Iscntrl0300(void)
{
    int ret = iscntrl(127);
    EXPECT_NE("Iscntrl0300", ret, RET);
}

/**
 * @tc.name      : Iscntrl0400
 * @tc.desc      : The parameter c is a special character, and it is judged that the input
 *                 character is not a control character.
 * @tc.level     : Level 2
 */
void Iscntrl0400(void)
{
    int ret = iscntrl('[');
    EXPECT_EQ("Iscntrl0400", ret, RET);
}

/**
 * @tc.name      : Iscntrl0500
 * @tc.desc      : Determine the number of control characters in the ascii code table.
 * @tc.level     : Level 1
 */
void Iscntrl0500(void)
{
    int total = 0;
    for (int i = 0; i < K_ASCII_CODE_UNIT_COUNT; i++) {
        int ret = iscntrl(static_cast<char>(i));
        if (ret) {
            total++;
        }
    }
    EXPECT_EQ("Iscntrl0500", total, COUNT);
}

/**
 * @tc.name      : Iscntrl0600
 * @tc.desc      : If the parameter c is 0x20 (32, space), it is judged as a non-control character.
 * @tc.level     : Level 0
 */
void Iscntrl0600(void)
{
    int ret = iscntrl(0x20);
    EXPECT_EQ("Iscntrl0600", ret, RET);
}

/**
 * @tc.name      : Iscntrl0700
 * @tc.desc      : If the parameter c is 0x7E (126, '~'), it is judged as a non-control character.
 * @tc.level     : Level 0
 */
void Iscntrl0700(void)
{
    int ret = iscntrl(0x7E);
    EXPECT_EQ("Iscntrl0700", ret, RET);
}

/**
 * @tc.name      : Iscntrl0800
 * @tc.desc      : If the parameter c is 0x0A ('\n'), it is judged as a control character.
 * @tc.level     : Level 1
 */
void Iscntrl0800(void)
{
    int ret = iscntrl('\n');
    EXPECT_NE("Iscntrl0800", ret, RET);
}

/**
 * @tc.name      : Iscntrl0900
 * @tc.desc      : If the parameter c is 0x09 ('\t'), it is judged as a control character.
 * @tc.level     : Level 1
 */
void Iscntrl0900(void)
{
    int ret = iscntrl('\t');
    EXPECT_NE("Iscntrl0900", ret, RET);
}

/**
 * @tc.name      : Iscntrl1000
 * @tc.desc      : If the parameter c is 0x0D ('\r'), it is judged as a control character.
 * @tc.level     : Level 1
 */
void Iscntrl1000(void)
{
    int ret = iscntrl('\r');
    EXPECT_NE("Iscntrl1000", ret, RET);
}

/**
 * @tc.name      : Iscntrl1100
 * @tc.desc      : If the parameter c is 0x80 (128, non-ASCII), it is judged as a non-control character.
 * @tc.level     : Level 1
 */
void Iscntrl1100(void)
{
    int ret = iscntrl(0x80);
    EXPECT_EQ("Iscntrl1100", ret, RET);
}

/**
 * @tc.name      : Iscntrl1200
 * @tc.desc      : If the parameter c is -1 (negative), it is judged as a non-control character.
 * @tc.level     : Level 2
 */
void Iscntrl1200(void)
{
    int ret = iscntrl(-1);
    EXPECT_EQ("Iscntrl1200", ret, RET);
}

static int IscntrlTestImpl(void)
{
    Iscntrl0100();
    Iscntrl0200();
    Iscntrl0300();
    Iscntrl0400();
    Iscntrl0500();
    Iscntrl0600();
    Iscntrl0700();
    Iscntrl0800();
    Iscntrl0900();
    Iscntrl1000();
    Iscntrl1100();
    Iscntrl1200();
    return T_STATUS;
}

int IscntrlTest(void)
{
    return IscntrlTestImpl();
}
