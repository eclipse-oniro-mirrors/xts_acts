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
const int COUNT = 95;

/**
 * @tc.name      : Isprint0100
 * @tc.desc      : The parameter c is 32, and the input character is judged to be a printable character.
 * @tc.level     : Level 0
 */
void Isprint0100(void)
{
    int ret = isprint(32);
    EXPECT_NE("Isprint0100", ret, RET);
}

/**
 * @tc.name      : Isprint0200
 * @tc.desc      : The parameter c is 63, and the input character is judged to be a printable character.
 * @tc.level     : Level 0
 */
void Isprint0200(void)
{
    int ret = isprint(63);
    EXPECT_NE("Isprint0200", ret, RET);
}

/**
 * @tc.name      : Isprint0300
 * @tc.desc      : The parameter c is 126, and the input character is judged to be a printable character.
 * @tc.level     : Level 2
 */
void Isprint0300(void)
{
    int ret = isprint(126);
    EXPECT_NE("Isprint0300", ret, RET);
}

/**
 * @tc.name      : Isprint0400
 * @tc.desc      : The parameter c is the control character 20, which judges that the input character
 *                 is not a printable character.
 * @tc.level     : Level 2
 */
void Isprint0400(void)
{
    int ret = isprint(20);
    EXPECT_EQ("Isprint0400", ret, RET);
}

/**
 * @tc.name      : Isprint0500
 * @tc.desc      : Determine the number of printable characters in the ascii code table.
 * @tc.level     : Level 1
 */
void Isprint0500(void)
{
    int total = 0;
    for (int i = 0; i < K_ASCII_CODE_UNIT_COUNT; i++) {
        int ret = isprint(static_cast<char>(i));
        if (ret) {
            total++;
        }
    }
    EXPECT_EQ("Isprint0500", total, COUNT);
}

static int IsprintTestImpl(void)
{
    Isprint0100();
    Isprint0200();
    Isprint0300();
    Isprint0400();
    Isprint0500();
    return T_STATUS;
}

int IsprintTest(void)
{
    return IsprintTestImpl();
}
