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
#include "test.h"

namespace {
constexpr double K_SIGNIFICAND_ZERO = 0.0;
constexpr double K_SIGNIFICAND_ARG12 = 1.2;
constexpr double K_SIGNIFICAND_ARG1225 = 12.25;
constexpr double K_SIGNIFICAND_EXPECT1225 = 1.53125;
} // namespace

static void ExpectDoubleEq(double a, double b)
{
    if (!(fabs(a - b) < DBL_EPSILON)) {
        t_error("%s failed: %f is not equal to %f\n", __func__, a, b);
    }
}

/*
 * @tc.name      : Significand0100
 * @tc.desc      : Get mantissa of floating-point number 0.0
 * @tc.level     : Level 0
 */
void Significand0100(void)
{
    double d = significand(K_SIGNIFICAND_ZERO);
    ExpectDoubleEq(K_SIGNIFICAND_ZERO, d);
}

/*
 * @tc.name      : Significand0200
 * @tc.desc      : Get mantissa of floating-point number 1.2
 * @tc.level     : Level 1
 */
void Significand0200(void)
{
    double d = significand(K_SIGNIFICAND_ARG12);
    ExpectDoubleEq(K_SIGNIFICAND_ARG12, d);
}

/*
 * @tc.name      : Significand0300
 * @tc.desc      : Get mantissa of floating-point number 12.25
 * @tc.level     : Level 1
 */
void Significand0300(void)
{
    double d = significand(K_SIGNIFICAND_ARG1225);
    ExpectDoubleEq(K_SIGNIFICAND_EXPECT1225, d);
}

static int SignificandTestImpl(int argc, char* argv[])
{
    Significand0100();
    Significand0200();
    Significand0300();
    return T_STATUS;
}

int SignificandTest(void)
{
    static char libcProg[] = "libc_test";
    char* libcArgv[] = { libcProg, nullptr };
    return SignificandTestImpl(1, libcArgv);
}
