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

#include <cmath>
#include "functionalext.h"

typedef void (*TEST_FUN)();
const int SUCCESS = 1;
const int FAILED = 0;

/**
 * @tc.name      : finite_0100
 * @tc.desc      : The parameter is 0.0, it is judged that the parameter is a finite value.
 * @tc.level     : Level 0
 */
void Finite0100(void)
{
    int ret = finite(0.0);
    EXPECT_EQ("finite_0100", ret, SUCCESS);
}

/**
 * @tc.name      : finite_0200
 * @tc.desc      : The parameter is DBL_MIN/2.0, and it is judged that the parameter is a finite value
 * @tc.level     : Level 0
 */
void Finite0200(void)
{
    int ret = finite(__DBL_MIN__ / 2);
    EXPECT_EQ("finite_0100", ret, SUCCESS);
}

/**
 * @tc.name      : finite_0300
 * @tc.desc      : If the parameter is NAN, it is judged that the parameter is not a finite value.
 * @tc.level     : Level 2
 */
void Finite0300(void)
{
    int ret = finite(NAN);
    EXPECT_EQ("finite_0100", ret, FAILED);
}

/**
 * @tc.name      : finite_0400
 * @tc.desc      : If the parameter is INFINITY, it is judged that the parameter is not a finite value.
 * @tc.level     : Level 2
 */
void Finite0400(void)
{
    int ret = finite(INFINITY);
    EXPECT_EQ("finite_0400", ret, FAILED);
}

/**
 * @tc.name      : finite_0500
 * @tc.desc      : If the parameter is sqrt(-1.0), it is judged that the parameter is not a finite value.
 * @tc.level     : Level 2
 */
void Finite0500(void)
{
    int ret = finite(sqrt(-1.0));
    EXPECT_EQ("finite_0500", ret, FAILED);
}

/**
 * @tc.name      : finite_0600
 * @tc.desc      : If the parameter is exp(800), it is judged that the parameter is not a finite value.
 * @tc.level     : Level 2
 */
void Finite0600(void)
{
    int ret = finite(exp(800));
    EXPECT_EQ("finite_0600", ret, FAILED);
}

static TEST_FUN g_gFunArray[] = {
    Finite0100, Finite0200, Finite0300, Finite0400, Finite0500, Finite0600,
};

static int FiniteTestImpl(int argc, char* argv[])
{
    int num = sizeof(g_gFunArray) / sizeof(TEST_FUN);
    for (int pos = 0; pos < num; ++pos) {
        g_gFunArray[pos]();
    }

    return T_STATUS;
}

int FiniteTest(void)
{
    static char libcProg[] = "libc_test";
    char* libcArgv[] = { libcProg, nullptr };
    return FiniteTestImpl(1, libcArgv);
}
