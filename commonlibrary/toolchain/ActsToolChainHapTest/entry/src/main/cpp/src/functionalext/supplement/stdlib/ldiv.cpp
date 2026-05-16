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

#include <cstdlib>
#include "functionalext.h"

#define TEST_LDIV_P_SEVENT 7
#define TEST_LDIV_P_FOUR 4
#define TEST_LDIV_P_THREE 3
#define TEST_LDIV_N_SEVENT (-7)
#define TEST_LDIV_N_FOUR (-4)
#define TEST_LDIV_N_THREE (-3)

/**
 * @tc.name      : Ldiv0100
 * @tc.desc      : Divide two long integers, return the quotient and remainder
 * @tc.level     : Level 0
 */
void Ldiv0100(void)
{
    ldiv_t ret = ldiv(TEST_LDIV_P_SEVENT, TEST_LDIV_P_FOUR);
    EXPECT_EQ("Ldiv0100", ret.quot, 1);
    EXPECT_EQ("Ldiv0100", ret.rem, TEST_LDIV_P_THREE);

    ret = ldiv(TEST_LDIV_P_SEVENT, TEST_LDIV_N_FOUR);
    EXPECT_EQ("Ldiv0100", ret.quot, -1);
    EXPECT_EQ("Ldiv0100", ret.rem, TEST_LDIV_P_THREE);

    ret = ldiv(TEST_LDIV_N_SEVENT, TEST_LDIV_P_FOUR);
    EXPECT_EQ("Ldiv0100", ret.quot, -1);
    EXPECT_EQ("Ldiv0100", ret.rem, TEST_LDIV_N_THREE);

    ret = ldiv(TEST_LDIV_N_SEVENT, TEST_LDIV_N_FOUR);
    EXPECT_EQ("Ldiv0100", ret.quot, 1);
    EXPECT_EQ("Ldiv0100", ret.rem, TEST_LDIV_N_THREE);
}

static int LdivTestImpl(void)
{
    Ldiv0100();
    return T_STATUS;
}

int LdivTest(void)
{
    return LdivTestImpl();
}
