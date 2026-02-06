/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <math.h>
#include <limits.h>
#include "log.h"
#include "gtest/gtest.h"

using namespace testing::ext;

class MathApiTest : public testing::Test {
};

/**
 * @tc.name   testCeil
 * @tc.number SUB_KERNEL_MATH_MATH_CEIL_0100
 * @tc.desc   [C- SOFTWARE -0100]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(MathApiTest, testCeil, Function | MediumTest | Level1) {
    const int testCount = 3;
    double testValues[] = {-5.9, 0, 123.45};
    double expected[] = {-5, 0, 124};
    double ret;
    for (int i = 0; i < testCount; ++i) {
        ret = ceil(testValues[i]);
        EXPECT_EQ(ret, expected[i]) << " ceil failed";
    }
}

/**
 * @tc.name   testCeilf
 * @tc.number SUB_KERNEL_MATH_MATH_CEILF_0100
 * @tc.desc   [C- SOFTWARE -0100]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(MathApiTest, testCeilf, Function | MediumTest | Level1) {
    const int testCount = 3;
    float testValues[] = {-5.9, 0, 123.45};
    float expected[] = {-5, 0, 124};
    float ret;
    for (int i = 0; i < testCount; ++i) {
        ret = ceilf(testValues[i]);
        EXPECT_EQ(ret, expected[i]) << " ceilf failed";
    }
}

/**
 * @tc.name   testfinite
 * @tc.number SUB_KERNEL_MATH_MATH_FINITE_0100
 * @tc.desc   [C- SOFTWARE -0100]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(MathApiTest, testfinite, Function | MediumTest | Level1) {
    const int testCount = 7;
    double testValues[7] = {1.0000001, 0.0/0.0, 1.0000001/0.0, 1.79769e+308, NAN};
    testValues[5] = sqrt(-1.0000001);
    testValues[6] = log(0);
    double expected[] = {1, 0, 0, 1, 0, 0, 0};
    double ret;
    for (int i = 0; i < testCount; ++i) {
        ret = finite(testValues[i]);
        EXPECT_EQ(ret, expected[i]) << " finite failed";
    }
}

/**
 * @tc.name   testfinitef
 * @tc.number SUB_KERNEL_MATH_MATH_FINITEF_0100
 * @tc.desc   [C- SOFTWARE -0100]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(MathApiTest, testfinitef, Function | MediumTest | Level1) {
    const int testCount = 6;
    float testValues[6] = {1, -1, 3.40282e+038, NAN};
    testValues[4] = sqrt(-1.0);
    testValues[5] = log(0);
    float expected[] = {1, 1, 1, 0, 0, 0};
    float ret;
    for (int i = 0; i < testCount; ++i) {
        ret = finitef(testValues[i]);
        EXPECT_EQ(ret, expected[i]) << " finitef failed";
    }
}

/**
 * @tc.name   testnan
 * @tc.number SUB_KERNEL_MATH_MATH_NAN_0100
 * @tc.desc   [C- SOFTWARE -0100]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(MathApiTest, testnan, Function | MediumTest | Level1) {
    const int testCount = 3;
    const char *testValues[] = {"1", "99", "abc"};
    double ret;
    for (int i = 0; i < testCount; ++i) {
        ret = nan(testValues[i]);
        ASSERT_TRUE(ret != 0) << " nan failed";
    }
}

/**
 * @tc.name   testnanf
 * @tc.number SUB_KERNEL_MATH_MATH_NANF_0100
 * @tc.desc   [C- SOFTWARE -0100]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(MathApiTest, testnanf, Function | MediumTest | Level1) {
    const int testCount = 3;
    const char *testValues[] = {"abc", "99", " "};
    float ret;
    for (int i = 0; i < testCount; ++i) {
        ret = nanf(testValues[i]);
        ASSERT_TRUE(ret != 0) << " nanf failed";
    }
}

/**
 * @tc.name   testnanl
 * @tc.number SUB_KERNEL_MATH_MATH_NANL_0100
 * @tc.desc   [C- SOFTWARE -0100]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(MathApiTest, testnanl, Function | MediumTest | Level1) {
    const int testCount = 3;
    const char *testValues[] = {"abc", "99", " "};
    long double ret;
    for (int i = 0; i < testCount; ++i) {
        ret = nanl(testValues[i]);
        ASSERT_TRUE(ret != 0) << " nanl failed";
    }
}

/**
 * @tc.name   testpowf10
 * @tc.number SUB_KERNEL_MATH_MATH_POW10F_0100
 * @tc.desc   [C- SOFTWARE -0100]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(MathApiTest, testpowf10, Function | MediumTest | Level1) {
    const int testCount = 3;
    float testValues[] = {0.0, 1.111111, -1.111111, 3.40282e+038};
    float expected[] = {1, 12.915494918823242, 0.077426381409168243};
    float ret;
    for (int i = 0; i < testCount; ++i) {
        ret = pow10f(testValues[i]);
        EXPECT_EQ(ret, expected[i]) << " pow10f failed";
    }
}

/**
 * @tc.name   testpowl10
 * @tc.number SUB_KERNEL_MATH_MATH_POW10L_0100
 * @tc.desc   [C- SOFTWARE -0100]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(MathApiTest, testpowl10, Function | MediumTest | Level1) {
    const int testCount = 3;
    long double testValues[] = {0.0000000000000000, 1.1111111111111111111, -1.1111111111111111111};
    long double expected[] = {1, 12.91549665014884, 0.077426368268112708};
    long double ret;
    for (int i = 0; i < testCount; ++i) {
        ret = pow10l(testValues[i]);
        EXPECT_EQ(ret, expected[i]) << " pow10l failed";
    }
}

/**
 * @tc.name   testsignbit
 * @tc.number SUB_KERNEL_MATH_MATH_SIGNBIT_0100
 * @tc.desc   [C- SOFTWARE -0100]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(MathApiTest, testsignbit, Function | MediumTest | Level1) {
    const int testCount = 3;
    float testValues[] = {3.000001, -3.000001, 0.0};
    float expected[] = {0, 1, 0};
    float ret;
    for (int i = 0; i < testCount; ++i) {
        ret = signbit(testValues[i]);
        EXPECT_EQ(ret, expected[i]) << " signbit failed";
    }
}

/**
 * @tc.name   testsignificand
 * @tc.number SUB_KERNEL_MATH_MATH_SIGNIFICAND_0100
 * @tc.desc   [C- SOFTWARE -0100]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(MathApiTest, testsignificand, Function | MediumTest | Level1) {
    const int testCount = 4;
    double testValues[] = {3.0000001, -3.0000001, 0.0000000, 3.40282e+038};
    double expected[] = {1.5000000499999999, -1.5000000499999999, 0.0000000, 1.9999978434325483};
    double ret;
    for (int i = 0; i < testCount; ++i) {
        ret = significand(testValues[i]);
        EXPECT_EQ(ret, expected[i]) << " significand failed";
    }
}

/**
 * @tc.name   testsignificandf
 * @tc.number SUB_KERNEL_MATH_MATH_SIGNIFICANDF_0100
 * @tc.desc   [C- SOFTWARE -0100]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(MathApiTest, testsignificandf, Function | MediumTest | Level1) {
    const int testCount = 4;
    float testValues[] = {3.000001, -3.000001, 0.000000, 3.40282e+038};
    float expected[] = {1.5000004768371582, -1.5000004768371582, 0.000000, 1.9999978542327881};
    float ret;
    for (int i = 0; i < testCount; ++i) {
        ret = significandf(testValues[i]);
        EXPECT_EQ(ret, expected[i]) << " significandf failed";
    }
}