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
#include "mtest.h"

/*
 * @tc.name      :  SignbitfTc0100
 * @tc.desc      : The parameter value of float type is 0, and the sign bit of the return parameter is 0.
 * @tc.level     : Level 0
 */
void SignbitfTc0100(void)
{
    float x = 0.0f;
    int result = __signbitf(x);
    EXPECT_EQ("SignbitfTc0100", result, 0);
}

/*
 * @tc.name      :  SignbitfTc0200
 * @tc.desc      : The parameter value of type float is a positive number, and the sign bit of the returned
 *                 parameter is 0.
 * @tc.level     : Level 0
 */
void SignbitfTc0200(void)
{
    float x = 3.14f;
    int result = __signbitf(x);
    EXPECT_EQ("SignbitfTc0200", result, 0);
}

/*
 * @tc.name      :  SignbitfTc0300
 * @tc.desc      : The parameter value of type float is negative,
 *                 and the sign bit of the return parameter is 1.
 * @tc.level     : Level 0
 */
void SignbitfTc0300(void)
{
    float x = -3.14f;
    int result = __signbitf(x);
    EXPECT_EQ("SignbitfTc0300", result, 1);
}

/*
 * @tc.name      :  SignbitfTc0400
 * @tc.desc      : The parameter value of float type is positive infinity (+INFINITY),
 *                 and the sign bit of the return parameter is 0.
 * @tc.level     : Level 1
 */
void SignbitfTc0400(void)
{
    float x = INFINITY; // Positive infinity (float type)
    int result = __signbitf(x);
    EXPECT_EQ("SignbitfTc0400", result, 0);
}

/*
 * @tc.name      :  SignbitfTc0500
 * @tc.desc      : The parameter value of float type is negative infinity (-INFINITY),
 *                 and the sign bit of the return parameter is 1.
 * @tc.level     : Level 1
 */
void SignbitfTc0500(void)
{
    float x = -INFINITY; // Negative infinity (float type)
    int result = __signbitf(x);
    EXPECT_EQ("SignbitfTc0500", result, 1);
}

/*
 * @tc.name      :  SignbitfTc0600
 * @tc.desc      : The parameter value of float type is positive zero (+0.0f),
 *                 and the sign bit of the return parameter is 0.
 * @tc.level     : Level 1
 * @note         : Verify consistency between implicit zero and explicit positive zero
 */
void SignbitfTc0600(void)
{
    float x = +0.0f; // Explicit positive zero (float type)
    int result = __signbitf(x);
    EXPECT_EQ("SignbitfTc0600", result, 0);
}

/*
 * @tc.name      :  SignbitfTc0700
 * @tc.desc      : The parameter value of float type is negative zero (-0.0f),
 *                 and the sign bit of the return parameter is 1.
 * @tc.level     : Level 1
 * @note         : Negative zero is a floating-point specific value, numerically equal to 0 but with sign bit 1
 */
void SignbitfTc0700(void)
{
    float x = -0.0f; // Negative zero (float type)
    int result = __signbitf(x);
    EXPECT_EQ("SignbitfTc0700", result, 1);
}

/*
 * @tc.name      :  SignbitfTc0800
 * @tc.desc      : The parameter value of float type is positive NaN (Not a Number),
 *                 and the sign bit of the return parameter is 0.
 * @tc.level     : Level 2
 * @note         : NaN has no mathematical sign, but stores a sign bit in memory
 */
void SignbitfTc0800(void)
{
    float x = NAN; // Positive NaN (default NaN for float type)
    int result = __signbitf(x);
    EXPECT_EQ("SignbitfTc0800", result, 0);
}

/*
 * @tc.name      :  SignbitfTc0900
 * @tc.desc      : The parameter value of float type is the maximum positive value (FLT_MAX),
 *                 and the sign bit of the return parameter is 0.
 * @tc.level     : Level 1
 * @note         : Boundary value test for positive extreme of float type
 */
void SignbitfTc0900(void)
{
    float x = FLT_MAX; // Maximum positive value of float type
    int result = __signbitf(x);
    EXPECT_EQ("SignbitfTc0900", result, 0);
}

/*
 * @tc.name      :  SignbitfTc1000
 * @tc.desc      : The parameter value of float type is the maximum negative value (-FLT_MAX),
 *                 and the sign bit of the return parameter is 1.
 * @tc.level     : Level 1
 * @note         : Boundary value test for negative extreme of float type
 */
void SignbitfTc1000(void)
{
    float x = -FLT_MAX; // Maximum negative value of float type
    int result = __signbitf(x);
    EXPECT_EQ("SignbitfTc1000", result, 1);
}

/*
 * @tc.name      :  SignbitfTc1100
 * @tc.desc      : The parameter value of float type is the smallest positive value (FLT_MIN),
 *                 and the sign bit of the return parameter is 0.
 * @tc.level     : Level 1
 * @note         : test extremely small positive float value close to underflow threshold
 */
void SignbitfTc1100(void)
{
    float x = FLT_MIN; // Smallest positive value of float type
    int result = __signbitf(x);
    EXPECT_EQ("SignbitfTc1100", result, 0);
}

/*
 * @tc.name      :  SignbitfTc1200
 * @tc.desc      : The parameter value of float type is the smallest negative value (-FLT_MIN),
 *                 and the sign bit of the return parameter is 1.
 * @tc.level     : Level 1
 * @note         : test extremely small negative float value close to underflow threshold
 */
void SignbitfTc1200(void)
{
    float x = -FLT_MIN; // Smallest negative value of float type
    int result = __signbitf(x);
    EXPECT_EQ("SignbitfTc1200", result, 1);
}

/*
 * @tc.name      :  SignbitfTc1300
 * @tc.desc      : The parameter value of float type is a positive number in scientific notation,
 *                 and the sign bit of the return parameter is 0.
 * @tc.level     : Level 1
 * @note         : Verify sign bit recognition across different numeric formats
 */
void SignbitfTc1300(void)
{
    float x = 1.2345e5f; // Positive float in scientific notation
    int result = __signbitf(x);
    EXPECT_EQ("SignbitfTc1300", result, 0);
}

/*
 * @tc.name      :  SignbitfTc1400
 * @tc.desc      : The parameter value of float type is a negative number in scientific notation,
 *                 and the sign bit of the return parameter is 1.
 * @tc.level     : Level 1
 * @note         : Verify sign bit recognition across different numeric formats
 */
void SignbitfTc1400(void)
{
    float x = -9.8765e-3f; // Negative float in scientific notation
    int result = __signbitf(x);
    EXPECT_EQ("SignbitfTc1400", result, 1);
}

/*
 * @tc.name      :  SignbitfTc1500
 * @tc.desc      : The parameter value of float type is a denormalized positive number,
 *                 and the sign bit of the return parameter is 0.
 * @tc.level     : Level 2
 * @note         : Denormalized numbers are smaller than FLT_MIN, test sign bit recognition for edge cases
 */
void SignbitfTc1500(void)
{
    // Construct denormalized positive float (smaller than FLT_MIN)
    float x = FLT_MIN / 2.0f;
    int result = __signbitf(x);
    EXPECT_EQ("SignbitfTc1500", result, 0);
}

/*
 * @tc.name      :  SignbitfTc1600
 * @tc.desc      : The parameter value of float type is a denormalized negative number,
 *                 and the sign bit of the return parameter is 1.
 * @tc.level     : Level 2
 * @note         : Denormalized numbers are smaller than FLT_MIN, test sign bit recognition for edge cases
 */
void SignbitfTc1600(void)
{
    // Construct denormalized negative float (smaller than FLT_MIN)
    float x = -FLT_MIN / 2.0f;
    int result = __signbitf(x);
    EXPECT_EQ("SignbitfTc1600", result, 1);
}

static int SignbitfTestImpl(int argc, char* argv[])
{
    SignbitfTc0100();
    SignbitfTc0200();
    SignbitfTc0300();
    SignbitfTc0400();
    SignbitfTc0500();
    SignbitfTc0600();
    SignbitfTc0700();
    SignbitfTc0800();
    SignbitfTc0900();
    SignbitfTc1000();
    SignbitfTc1100();
    SignbitfTc1200();
    SignbitfTc1300();
    SignbitfTc1400();
    SignbitfTc1500();
    SignbitfTc1600();
    return T_STATUS;
}

int SignbitfTest(void)
{
    static char libcProg[] = "libc_test";
    char* libcArgv[] = { libcProg, nullptr };
    return SignbitfTestImpl(1, libcArgv);
}
