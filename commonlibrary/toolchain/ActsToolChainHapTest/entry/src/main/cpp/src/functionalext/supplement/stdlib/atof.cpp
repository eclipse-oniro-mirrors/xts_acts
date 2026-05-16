/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <cfloat>
#include <cmath>
#include <cstdlib>
#include "test.h"

typedef void (*TEST_FUN)();

namespace {
constexpr double K_ATOF_EXPECT_VALUE = 123456.00;
} // namespace

static void ExpectDoubleEq(double a, double b)
{
    if (!(fabs(a - b) < DBL_EPSILON)) {
        t_error("%s failed: %f is not equal to %f\n", __func__, a, b);
    }
}

/**
 * @tc.name      : Atof0100
 * @tc.desc      : Convert a string to a double
 * @tc.level     : Level 0
 */
void Atof0100()
{
    const char* str = "123456.00";
    double result = atof(str);
    ExpectDoubleEq(result, K_ATOF_EXPECT_VALUE);
}

namespace {
TEST_FUN g_gFunArray[] = {
    Atof0100,
};
}

static int AtofTestWithArgs(int argc, char* argv[])
{
    int num = sizeof(g_gFunArray) / sizeof(g_gFunArray[0]);
    for (int pos = 0; pos < num; ++pos) {
        g_gFunArray[pos]();
    }

    return T_STATUS;
}

int AtofTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return AtofTestWithArgs(1, libcArgvStub);
}
