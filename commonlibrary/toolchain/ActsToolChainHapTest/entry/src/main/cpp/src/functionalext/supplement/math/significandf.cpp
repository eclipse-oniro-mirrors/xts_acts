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

static void ExpectFloatEq(float a, float b)
{
    if (!(fabsf(a - b) < FLT_EPSILON)) {
        t_error("%s failed: %f is not equal to %f\n", __func__, a, b);
    }
}

/*
 * @tc.name      : Significandf0100
 * @tc.desc      : Get mantissa of floating-point number 0.0f
 * @tc.level     : Level 0
 */
void Significandf0100(void)
{
    float f = significandf(0.0f);
    ExpectFloatEq(0.0f, f);
}

/*
 * @tc.name      : Significandf0200
 * @tc.desc      : Get mantissa of floating-point number 1.2f
 * @tc.level     : Level 1
 */
void Significandf0200(void)
{
    float f = significandf(1.2f);
    ExpectFloatEq(1.2f, f);
}

/*
 * @tc.name      : Significandf0300
 * @tc.desc      : Get mantissa of floating-point number 12.25f
 * @tc.level     : Level 1
 */
void Significandf0300(void)
{
    float f = significandf(12.25f);
    ExpectFloatEq(1.53125f, f);
}

static int SignificandfTestImpl(int argc, char* argv[])
{
    Significandf0100();
    Significandf0200();
    Significandf0300();
    return T_STATUS;
}

int SignificandfTest(void)
{
    static char libcProg[] = "libc_test";
    char* libcArgv[] = { libcProg, nullptr };
    return SignificandfTestImpl(1, libcArgv);
}
