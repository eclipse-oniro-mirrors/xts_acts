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

#include <cfloat>
#include <cmath>
#include "functionalext.h"

/**
 * @tc.name      : Fpclassifyf0100
 * @tc.desc      : The parameter is valid, x is 1.0, can get the integer value matching the
 *                 classification macro constant.
 * @tc.level     : Level 0
 */
void Fpclassifyf0100(void)
{
    float x = 1.0;
    int ret = __fpclassifyf(x);
    EXPECT_EQ("Fpclassifyf0100", ret, FP_NORMAL);
}

/**
 * @tc.name      : Fpclassifyf0200
 * @tc.desc      : The parameter is valid, x is NAN, can get the integer value matching the
 *                 classification macro constant.
 * @tc.level     : Level 1
 */
void Fpclassifyf0200(void)
{
    float x = NAN;
    int ret = __fpclassifyf(x);
    EXPECT_EQ("Fpclassifyf0200", ret, FP_NAN);
}

/**
 * @tc.name      : Fpclassifyf0300
 * @tc.desc      : The parameter is valid, x is INFINITY, can get the integer value matching the
 *                 classification macro constant.
 * @tc.level     : Level 1
 */
void Fpclassifyf0300(void)
{
    float x = INFINITY;
    int ret = __fpclassifyf(x);
    EXPECT_EQ("Fpclassifyf0300", ret, FP_INFINITE);
}

/**
 * @tc.name      : Fpclassifyf0400
 * @tc.desc      : The parameter is valid, x is -0.0, can get the integer value matching the
 *                 classification macro constant.
 * @tc.level     : Level 1
 */
void Fpclassifyf0400(void)
{
    float x = -0.0;
    int ret = __fpclassifyf(x);
    EXPECT_EQ("Fpclassifyf0400", ret, FP_ZERO);
}

/**
* @tc.name      : Fpclassifyf0500
* @tc.desc      : The parameter is valid, x is a negative normal float number (-3.14f),
                  can get the integer value matching the classification macro constant.
* @tc.level     : Level 0
*/
void Fpclassifyf0500(void)
{
    float x = -3.14f;
    int ret = __fpclassifyf(x);
    EXPECT_EQ("Fpclassifyf0500", ret, FP_NORMAL);
}

/**
* @tc.name      : Fpclassifyf0600
* @tc.desc      : The parameter is valid, x is a positive subnormal (denormal) float number,
                  can get the integer value matching the classification macro constant.
* @tc.level     : Level 2
*/
void Fpclassifyf0600(void)
{
    // Smallest positive subnormal float value
    float x = FLT_MIN / 2.0f;
    int ret = __fpclassifyf(x);
    EXPECT_EQ("Fpclassifyf0600", ret, FP_SUBNORMAL);
}

/**
* @tc.name      : Fpclassifyf0700
* @tc.desc      : The parameter is valid, x is a negative subnormal (denormal) float number,
                  can get the integer value matching the classification macro constant.
* @tc.level     : Level 2
*/
void Fpclassifyf0700(void)
{
    // Smallest negative subnormal float value
    float x = -(FLT_MIN / 2.0f);
    int ret = __fpclassifyf(x);
    EXPECT_EQ("Fpclassifyf0700", ret, FP_SUBNORMAL);
}

/**
* @tc.name      : Fpclassifyf0800
* @tc.desc      : The parameter is valid, x is the maximum positive normal float number,
                  can get the integer value matching the classification macro constant.
* @tc.level     : Level 0
*/
void Fpclassifyf0800(void)
{
    float x = FLT_MAX;
    int ret = __fpclassifyf(x);
    EXPECT_EQ("Fpclassifyf0800", ret, FP_NORMAL);
}

/**
* @tc.name      : Fpclassifyf0900
* @tc.desc      : The parameter is valid, x is the minimum negative normal float number,
                  can get the integer value matching the classification macro constant.
* @tc.level     : Level 0
*/
void Fpclassifyf0900(void)
{
    float x = -FLT_MAX;
    int ret = __fpclassifyf(x);
    EXPECT_EQ("Fpclassifyf0900", ret, FP_NORMAL);
}

/**
* @tc.name      : Fpclassifyf1000
* @tc.desc      : The parameter is valid, x is positive 0.0,
                  can get the integer value matching the classification macro constant.
* @tc.level     : Level 1
*/
void Fpclassifyf1000(void)
{
    float x = 0.0f;
    int ret = __fpclassifyf(x);
    EXPECT_EQ("Fpclassifyf1000", ret, FP_ZERO);
}

/**
* @tc.name      : Fpclassifyf1100
* @tc.desc      : The parameter is valid, x is negative infinity,
                  can get the integer value matching the classification macro constant.
* @tc.level     : Level 1
*/
void Fpclassifyf1100(void)
{
    float x = -INFINITY;
    int ret = __fpclassifyf(x);
    EXPECT_EQ("Fpclassifyf1100", ret, FP_INFINITE);
}

/**
* @tc.name      : Fpclassifyf1200
* @tc.desc      : The parameter is valid, x is a positive normal small float number (0.5f),
                  can get the integer value matching the classification macro constant.
* @tc.level     : Level 0
*/
void Fpclassifyf1200(void)
{
    float x = 0.5f;
    int ret = __fpclassifyf(x);
    EXPECT_EQ("Fpclassifyf1200", ret, FP_NORMAL);
}

static int FpclassifyfTestImpl(int argc, char* argv[])
{
    Fpclassifyf0100();
    Fpclassifyf0200();
    Fpclassifyf0300();
    Fpclassifyf0400();
    Fpclassifyf0500();
    Fpclassifyf0600();
    Fpclassifyf0700();
    Fpclassifyf0800();
    Fpclassifyf0900();
    Fpclassifyf1000();
    Fpclassifyf1100();
    Fpclassifyf1200();
    return T_STATUS;
}

int FpclassifyfTest(void)
{
    static char libcProg[] = "libc_test";
    char* libcArgv[] = { libcProg, nullptr };
    return FpclassifyfTestImpl(1, libcArgv);
}
