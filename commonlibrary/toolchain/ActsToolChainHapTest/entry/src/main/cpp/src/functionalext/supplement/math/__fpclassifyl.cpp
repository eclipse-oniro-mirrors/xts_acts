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
 * @tc.name      : Fpclassifyl0100
 * @tc.desc      : The parameter is valid, x is 1.0, can get the integer value matching the
 *                 classification macro constant.
 * @tc.level     : Level 0
 */
void Fpclassifyl0100(void)
{
    long double x = 1.0;
    int ret = __fpclassifyl(x);
    EXPECT_EQ("Fpclassifyl0100", ret, FP_NORMAL);
}

/**
 * @tc.name      : Fpclassifyl0200
 * @tc.desc      : The parameter is valid, x is NAN, can get the integer value matching the
 *                 classification macro constant.
 * @tc.level     : Level 1
 */
void Fpclassifyl0200(void)
{
    long double x = NAN;
    int ret = __fpclassifyl(x);
    EXPECT_EQ("Fpclassifyl0200", ret, FP_NAN);
}

/**
 * @tc.name      : Fpclassifyl0300
 * @tc.desc      : The parameter is valid, x is INFINITY, can get the integer value matching the
 *                 classification macro constant.
 * @tc.level     : Level 1
 */
void Fpclassifyl0300(void)
{
    long double x = INFINITY;
    int ret = __fpclassifyl(x);
    EXPECT_EQ("Fpclassifyl0300", ret, FP_INFINITE);
}

/**
 * @tc.name      : Fpclassifyl0400
 * @tc.desc      : The parameter is valid, x is -0.0, can get the integer value matching the
 *                 classification macro constant.
 * @tc.level     : Level 1
 */
void Fpclassifyl0400(void)
{
    long double x = -0.0;
    int ret = __fpclassifyl(x);
    EXPECT_EQ("Fpclassifyl0400", ret, FP_ZERO);
}

/**
 * @tc.name      : Fpclassifyl0500
 * @tc.desc      : The parameter is valid, x is a negative normal long double number (-3.14L),
                   can get the integer value matching the classification macro constant.
 * @tc.level     : Level 0
 */
void Fpclassifyl0500(void)
{
    long double x = -3.14L;
    int ret = __fpclassifyl(x);
    EXPECT_EQ("Fpclassifyl0500", ret, FP_NORMAL);
}

/**
 * @tc.name      : Fpclassifyl0600
 * @tc.desc      : The parameter is valid, x is a positive subnormal (denormal) long double number,
                   can get the integer value matching the classification macro constant.
 * @tc.level     : Level 2
 */
void Fpclassifyl0600(void)
{
    // Smallest positive subnormal long double value
    long double x = LDBL_MIN / 2.0L;
    int ret = __fpclassifyl(x);
    EXPECT_EQ("Fpclassifyl0600", ret, FP_SUBNORMAL);
}

/**
 * @tc.name      : Fpclassifyl0700
 * @tc.desc      : The parameter is valid, x is a negative subnormal (denormal) long double number,
                   can get the integer value matching the classification macro constant.
 * @tc.level     : Level 2
 */
void Fpclassifyl0700(void)
{
    // Smallest negative subnormal long double value
    long double x = -(LDBL_MIN / 2.0L);
    int ret = __fpclassifyl(x);
    EXPECT_EQ("Fpclassifyl0700", ret, FP_SUBNORMAL);
}

/**
 * @tc.name      : Fpclassifyl0800
 * @tc.desc      : The parameter is valid, x is the maximum positive normal long double number,
                   can get the integer value matching the classification macro constant.
 * @tc.level     : Level 0
 */
void Fpclassifyl0800(void)
{
    long double x = LDBL_MAX;
    int ret = __fpclassifyl(x);
    EXPECT_EQ("Fpclassifyl0800", ret, FP_NORMAL);
}

/**
 * @tc.name      : Fpclassifyl0900
 * @tc.desc      : The parameter is valid, x is the minimum negative normal long double number,
                   can get the integer value matching the classification macro constant.
 * @tc.level     : Level 0
 */
void Fpclassifyl0900(void)
{
    long double x = -LDBL_MAX;
    int ret = __fpclassifyl(x);
    EXPECT_EQ("Fpclassifyl0900", ret, FP_NORMAL);
}

/**
 * @tc.name      : Fpclassifyl1000
 * @tc.desc      : The parameter is valid, x is positive 0.0, can get the integer value matching
                   the classification macro constant.
 * @tc.level     : Level 1
 */
void Fpclassifyl1000(void)
{
    long double x = 0.0L;
    int ret = __fpclassifyl(x);
    EXPECT_EQ("Fpclassifyl1000", ret, FP_ZERO);
}

/**
 * @tc.name      : Fpclassifyl1100
 * @tc.desc      : The parameter is valid, x is negative infinity, can get the integer value matching
                   the classification macro constant.
 * @tc.level     : Level 1
 */
void Fpclassifyl1100(void)
{
    long double x = -INFINITY;
    int ret = __fpclassifyl(x);
    EXPECT_EQ("Fpclassifyl1100", ret, FP_INFINITE);
}

/**
 * @tc.name      : Fpclassifyl1200
 * @tc.desc      : The parameter is valid, x is a positive normal small long double number (0.5L),
                   can get the integer value matching the classification macro constant.
 * @tc.level     : Level 0
 */
void Fpclassifyl1200(void)
{
    long double x = 0.5L;
    int ret = __fpclassifyl(x);
    EXPECT_EQ("Fpclassifyl1200", ret, FP_NORMAL);
}

/**
 * @tc.name      : Fpclassifyl1300
 * @tc.desc      : The parameter is valid, x is a positive normal large long double number (1e300L),
                   can get the integer value matching the classification macro constant.
 * @tc.level     : Level 0
 */
void Fpclassifyl1300(void)
{
    long double x = 1e300L;
    int ret = __fpclassifyl(x);
    EXPECT_EQ("Fpclassifyl1300", ret, FP_NORMAL);
}

/**
 * @tc.name      : Fpclassifyl1400
 * @tc.desc      : The parameter is valid, x is a negative normal small long double number (-0.25L),
                   can get the integer value matching the classification macro constant.
 * @tc.level     : Level 0
 */
void Fpclassifyl1400(void)
{
    long double x = -0.25L;
    int ret = __fpclassifyl(x);
    EXPECT_EQ("Fpclassifyl1400", ret, FP_NORMAL);
}

static int FpclassifylTestImpl(int argc, char* argv[])
{
    Fpclassifyl0100();
    Fpclassifyl0200();
    Fpclassifyl0300();
    Fpclassifyl0400();
    Fpclassifyl0500();
    Fpclassifyl0600();
    Fpclassifyl0700();
    Fpclassifyl0800();
    Fpclassifyl0900();
    Fpclassifyl1000();
    Fpclassifyl1100();
    Fpclassifyl1200();
    Fpclassifyl1300();
    Fpclassifyl1400();
    return T_STATUS;
}

int FpclassifylTest(void)
{
    static char libcProg[] = "libc_test";
    char* libcArgv[] = { libcProg, nullptr };
    return FpclassifylTestImpl(1, libcArgv);
}
