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

#include "ComplexTest.h"
#include "log.h"
#include "gtest/gtest.h"

using namespace testing::ext;

class MathComplexApiTest : public testing::Test {
};

/**
 * @tc.name   testCabs
 * @tc.number SUB_KERNEL_MATH_COMPLEX_CABS_0100
 * @tc.desc   [C- SOFTWARE -0100]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(MathComplexApiTest, testCabs, Function | MediumTest | Level1) {
    int ret = TestCabs();
    ASSERT_EQ(ret, 0);
}
/**
 * @tc.name   testCabsf
 * @tc.number SUB_KERNEL_MATH_COMPLEX_CABSF_0100
 * @tc.desc   [C- SOFTWARE -0100]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(MathComplexApiTest, testCabsf, Function | MediumTest | Level1) {
    int ret = TestCabsf();
    ASSERT_EQ(ret, 0);
}

/**
 * @tc.name   testCabsl
 * @tc.number SUB_KERNEL_MATH_COMPLEX_CABSL_0100
 * @tc.desc   [C- SOFTWARE -0100]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(MathComplexApiTest, testCabsl, Function | MediumTest | Level1) {
    int ret = TestCabsl();
    ASSERT_EQ(ret, 0);
}

/**
 * @tc.name   testCacos
 * @tc.number SUB_KERNEL_MATH_COMPLEX_CACOS_0100
 * @tc.desc   [C- SOFTWARE -0100]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(MathComplexApiTest, testCacos, Function | MediumTest | Level1) {
    int ret = TestCacos();
    ASSERT_EQ(ret, 0);
}

/**
 * @tc.name   testCacosf
 * @tc.number SUB_KERNEL_MATH_COMPLEX_CACOSF_0100
 * @tc.desc   [C- SOFTWARE -0100]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(MathComplexApiTest, testCacosf, Function | MediumTest | Level1) {
    int ret = TestCacosf();
    ASSERT_EQ(ret, 0);
}

/**
 * @tc.name   testCacoshf
 * @tc.number SUB_KERNEL_MATH_COMPLEX_CACOSHF_0100
 * @tc.desc   [C- SOFTWARE -0100]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(MathComplexApiTest, testCacoshf, Function | MediumTest | Level1) {
    int ret = TestCacoshf();
    ASSERT_EQ(ret, 0);
}

/**
 * @tc.name   testCacoshl
 * @tc.number SUB_KERNEL_MATH_COMPLEX_CACOSHL_0100
 * @tc.desc   [C- SOFTWARE -0100]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(MathComplexApiTest, testCacoshl, Function | MediumTest | Level1) {
    int ret = TestCacoshl();
    ASSERT_EQ(ret, 0);
}

/**
 * @tc.name   testCacosl
 * @tc.number SUB_KERNEL_MATH_COMPLEX_CACOSL_0100
 * @tc.desc   [C- SOFTWARE -0100]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(MathComplexApiTest, testCacosl, Function | MediumTest | Level1) {
    int ret = TestCacosl();
    ASSERT_EQ(ret, 0);
}

/**
 * @tc.name   testCarg
 * @tc.number SUB_KERNEL_MATH_COMPLEX_CARG_0100
 * @tc.desc   [C- SOFTWARE -0100]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(MathComplexApiTest, testCarg, Function | MediumTest | Level1) {
    int ret = TestCarg();
    ASSERT_EQ(ret, 0);
}

/**
 * @tc.name   testCargf
 * @tc.number SUB_KERNEL_MATH_COMPLEX_CARGF_0100
 * @tc.desc   [C- SOFTWARE -0100]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(MathComplexApiTest, testCargf, Function | MediumTest | Level1) {
    int ret = TestCargf();
    ASSERT_EQ(ret, 0);
}

/**
 * @tc.name   testCargl
 * @tc.number SUB_KERNEL_MATH_COMPLEX_CARGL_0100
 * @tc.desc   [C- SOFTWARE -0100]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(MathComplexApiTest, testCargl, Function | MediumTest | Level1) {
    int ret = TestCargl();
    ASSERT_EQ(ret, 0);
}

/**
 * @tc.name   testCasin
 * @tc.number SUB_KERNEL_MATH_COMPLEX_CASIN_0100
 * @tc.desc   [C- SOFTWARE -0100]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(MathComplexApiTest, testCasin, Function | MediumTest | Level1) {
    int ret = TestCasin();
    ASSERT_EQ(ret, 0);
}

/**
 * @tc.name   testCasinf
 * @tc.number SUB_KERNEL_MATH_COMPLEX_CASINF_0100
 * @tc.desc   [C- SOFTWARE -0100]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(MathComplexApiTest, testCasinf, Function | MediumTest | Level1) {
    int ret = TestCasinf();
    ASSERT_EQ(ret, 0);
}

/**
 * @tc.name   testCasinh
 * @tc.number SUB_KERNEL_MATH_COMPLEX_CASINH_0100
 * @tc.desc   [C- SOFTWARE -0100]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(MathComplexApiTest, testCasinh, Function | MediumTest | Level1) {
    int ret = TestCasinh();
    ASSERT_EQ(ret, 0);
}

/**
 * @tc.name   testCasinhf
 * @tc.number SUB_KERNEL_MATH_COMPLEX_CASINHF_0100
 * @tc.desc   [C- SOFTWARE -0100]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(MathComplexApiTest, testCasinhf, Function | MediumTest | Level1) {
    int ret = TestCasinhf();
    ASSERT_EQ(ret, 0);
}

/**
 * @tc.name   testCasinhl
 * @tc.number SUB_KERNEL_MATH_COMPLEX_CASINHL_0100
 * @tc.desc   [C- SOFTWARE -0100]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(MathComplexApiTest, testCasinhl, Function | MediumTest | Level1) {
    int ret = TestCasinhl();
    ASSERT_EQ(ret, 0);
}

/**
 * @tc.name   TestCasinl
 * @tc.number SUB_KERNEL_MATH_COMPLEX_CASINL_0100
 * @tc.desc   [C- SOFTWARE -0100]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(MathComplexApiTest, TestCasinl, Function | MediumTest | Level1) {
    int ret = TestCasinl();
    ASSERT_EQ(ret, 0);
}

/**
 * @tc.name   TestCatan
 * @tc.number SUB_KERNEL_MATH_COMPLEX_CATAN_0100
 * @tc.desc   [C- SOFTWARE -0100]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(MathComplexApiTest, TestCatan, Function | MediumTest | Level1) {
    int ret = TestCatan();
    ASSERT_EQ(ret, 0);
}

/**
 * @tc.name   TestCatanf
 * @tc.number SUB_KERNEL_MATH_COMPLEX_CATANF_0100
 * @tc.desc   [C- SOFTWARE -0100]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(MathComplexApiTest, TestCatanf, Function | MediumTest | Level1) {
    int ret = TestCatanf();
    ASSERT_EQ(ret, 0);
}

/**
 * @tc.name   TestCatanh
 * @tc.number SUB_KERNEL_MATH_COMPLEX_CATANH_0100
 * @tc.desc   [C- SOFTWARE -0100]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(MathComplexApiTest, TestCatanh, Function | MediumTest | Level1) {
    int ret = TestCatanh();
    ASSERT_EQ(ret, 0);
}

/**
 * @tc.name   TestCatanhf
 * @tc.number SUB_KERNEL_MATH_COMPLEX_CATANHF_0100
 * @tc.desc   [C- SOFTWARE -0100]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(MathComplexApiTest, TestCatanhf, Function | MediumTest | Level1) {
    int ret = TestCatanhf();
    ASSERT_EQ(ret, 0);
}

/**
 * @tc.name   TestCatanhl
 * @tc.number SUB_KERNEL_MATH_COMPLEX_CATANHL_0100
 * @tc.desc   [C- SOFTWARE -0100]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(MathComplexApiTest, TestCatanhl, Function | MediumTest | Level1) {
    int ret = TestCatanhl();
    ASSERT_EQ(ret, 0);
}

/**
 * @tc.name   TestCatanl
 * @tc.number SUB_KERNEL_MATH_COMPLEX_CATANL_0100
 * @tc.desc   [C- SOFTWARE -0100]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(MathComplexApiTest, TestCatanl, Function | MediumTest | Level1) {
    int ret = TestCatanl();
    ASSERT_EQ(ret, 0);
}

/**
 * @tc.name   TestCcos
 * @tc.number SUB_KERNEL_MATH_COMPLEX_CCOS_0100
 * @tc.desc   [C- SOFTWARE -0100]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(MathComplexApiTest, TestCcos, Function | MediumTest | Level1) {
    int ret = TestCcos();
    ASSERT_EQ(ret, 0);
}

/**
 * @tc.name   TestCcosf
 * @tc.number SUB_KERNEL_MATH_COMPLEX_CCOSF_0100
 * @tc.desc   [C- SOFTWARE -0100]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(MathComplexApiTest, TestCcosf, Function | MediumTest | Level1) {
    int ret = TestCcosf();
    ASSERT_EQ(ret, 0);
}

/**
 * @tc.name   TestCcosh
 * @tc.number SUB_KERNEL_MATH_COMPLEX_CCOSH_0100
 * @tc.desc   [C- SOFTWARE -0100]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(MathComplexApiTest, TestCcosh, Function | MediumTest | Level1) {
    int ret = TestCcosh();
    ASSERT_EQ(ret, 0);
}

/**
 * @tc.name   TestCcoshf
 * @tc.number SUB_KERNEL_MATH_COMPLEX_CCOSHF_0100
 * @tc.desc   [C- SOFTWARE -0100]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(MathComplexApiTest, TestCcoshf, Function | MediumTest | Level1) {
    int ret = TestCcoshf();
    ASSERT_EQ(ret, 0);
}

/**
 * @tc.name   TestCcoshl
 * @tc.number SUB_KERNEL_MATH_COMPLEX_CCOSHL_0100
 * @tc.desc   [C- SOFTWARE -0100]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(MathComplexApiTest, TestCcoshl, Function | MediumTest | Level1) {
    int ret = TestCcoshl();
    ASSERT_EQ(ret, 0);
}

/**
 * @tc.name   TestCcosl
 * @tc.number SUB_KERNEL_MATH_COMPLEX_CCOSL_0100
 * @tc.desc   [C- SOFTWARE -0100]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(MathComplexApiTest, TestCcosl, Function | MediumTest | Level1) {
    int ret = TestCcosl();
    ASSERT_EQ(ret, 0);
}

/**
 * @tc.name   TestCexp
 * @tc.number SUB_KERNEL_MATH_COMPLEX_CEXP_0100
 * @tc.desc   [C- SOFTWARE -0100]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(MathComplexApiTest, TestCexp, Function | MediumTest | Level1) {
    int ret = TestCexp();
    ASSERT_EQ(ret, 0);
}

/**
 * @tc.name   TestCexpf
 * @tc.number SUB_KERNEL_MATH_COMPLEX_CEXPF_0100
 * @tc.desc   [C- SOFTWARE -0100]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(MathComplexApiTest, TestCexpf, Function | MediumTest | Level1) {
    int ret = TestCexpf();
    ASSERT_EQ(ret, 0);
}

/**
 * @tc.name   TestCexpl
 * @tc.number SUB_KERNEL_MATH_COMPLEX_CEXPL_0100
 * @tc.desc   [C- SOFTWARE -0100]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(MathComplexApiTest, TestCexpl, Function | MediumTest | Level1) {
    int ret = TestCexpl();
    ASSERT_EQ(ret, 0);
}

/**
 * @tc.name   TestCimag
 * @tc.number SUB_KERNEL_MATH_COMPLEX_CIMAG_0100
 * @tc.desc   [C- SOFTWARE -0100]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(MathComplexApiTest, TestCimag, Function | MediumTest | Level1) {
    int ret = TestCimag();
    ASSERT_EQ(ret, 0);
}

/**
 * @tc.name   TestCimagf
 * @tc.number SUB_KERNEL_MATH_COMPLEX_CIMAGF_0100
 * @tc.desc   [C- SOFTWARE -0100]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(MathComplexApiTest, TestCimagf, Function | MediumTest | Level1) {
    int ret = TestCimagf();
    ASSERT_EQ(ret, 0);
}

/**
 * @tc.name   TestCimagl
 * @tc.number SUB_KERNEL_MATH_COMPLEX_CIMAGL_0100
 * @tc.desc   [C- SOFTWARE -0100]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(MathComplexApiTest, TestCimagl, Function | MediumTest | Level1) {
    int ret = TestCimagl();
    ASSERT_EQ(ret, 0);
}

/**
 * @tc.name   TestClog
 * @tc.number SUB_KERNEL_MATH_COMPLEX_CLOG_0100
 * @tc.desc   [C- SOFTWARE -0100]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(MathComplexApiTest, TestClog, Function | MediumTest | Level1) {
    int ret = TestClog();
    ASSERT_EQ(ret, 0);
}

/**
 * @tc.name   TestClogf
 * @tc.number SUB_KERNEL_MATH_COMPLEX_CLOGF_0100
 * @tc.desc   [C- SOFTWARE -0100]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(MathComplexApiTest, TestClogf, Function | MediumTest | Level1) {
    int ret = TestClogf();
    ASSERT_EQ(ret, 0);
}

/**
 * @tc.name   TestClogl
 * @tc.number SUB_KERNEL_MATH_COMPLEX_CLOGL_0100
 * @tc.desc   [C- SOFTWARE -0100]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(MathComplexApiTest, TestClogl, Function | MediumTest | Level1) {
    int ret = TestClogl();
    ASSERT_EQ(ret, 0);
}

/**
 * @tc.name   testConj
 * @tc.number SUB_KERNEL_MATH_COMPLEX_CONJ_0100
 * @tc.desc   [C- SOFTWARE -0100]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(MathComplexApiTest, testConj, Function | MediumTest | Level1) {
    int ret = TestConj();
    ASSERT_EQ(ret, 0);
}

/**
 * @tc.name   testConjf
 * @tc.number SUB_KERNEL_MATH_COMPLEX_CONJF_0100
 * @tc.desc   [C- SOFTWARE -0100]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(MathComplexApiTest, testConjf, Function | MediumTest | Level1) {
    int ret = TestConjf();
    ASSERT_EQ(ret, 0);
}

/**
 * @tc.name   testConjl
 * @tc.number SUB_KERNEL_MATH_COMPLEX_CONJL_0100
 * @tc.desc   [C- SOFTWARE -0100]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(MathComplexApiTest, testConjl, Function | MediumTest | Level1) {
    int ret = TestConjl();
    ASSERT_EQ(ret, 0);
}

/**
 * @tc.name   TestCpow
 * @tc.number SUB_KERNEL_MATH_COMPLEX_CPOW_0100
 * @tc.desc   [C- SOFTWARE -0100]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(MathComplexApiTest, TestCpow, Function | MediumTest | Level1) {
    int ret = TestCpow();
    ASSERT_EQ(ret, 0);
}

/**
 * @tc.name   TestCpowf
 * @tc.number SUB_KERNEL_MATH_COMPLEX_CPOWF_0100
 * @tc.desc   [C- SOFTWARE -0100]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(MathComplexApiTest, TestCpowf, Function | MediumTest | Level1) {
    int ret = TestCpowf();
    ASSERT_EQ(ret, 0);
}

/**
 * @tc.name   TestCpowl
 * @tc.number SUB_KERNEL_MATH_COMPLEX_CPOWL_0100
 * @tc.desc   [C- SOFTWARE -0100]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(MathComplexApiTest, TestCpowl, Function | MediumTest | Level1) {
    int ret = TestCpowl();
    ASSERT_EQ(ret, 0);
}

/**
 * @tc.name   testCproj
 * @tc.number SUB_KERNEL_MATH_COMPLEX_CPROJ_0100
 * @tc.desc   [C- SOFTWARE -0100]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(MathComplexApiTest, testCproj, Function | MediumTest | Level1) {
    int ret = TestCproj();
    ASSERT_EQ(ret, 0);
}

/**
 * @tc.name   testCprojf
 * @tc.number SUB_KERNEL_MATH_COMPLEX_CPROJF_0100
 * @tc.desc   [C- SOFTWARE -0100]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(MathComplexApiTest, testCprojf, Function | MediumTest | Level1) {
    int ret = TestCprojf();
    ASSERT_EQ(ret, 0);
}

/**
 * @tc.name   testCprojl
 * @tc.number SUB_KERNEL_MATH_COMPLEX_CPROJL_0100
 * @tc.desc   [C- SOFTWARE -0100]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(MathComplexApiTest, testCprojl, Function | MediumTest | Level1) {
    int ret = TestCprojl();
    ASSERT_EQ(ret, 0);
}

/**
 * @tc.name   testCreal
 * @tc.number SUB_KERNEL_MATH_COMPLEX_CREAL_0100
 * @tc.desc   [C- SOFTWARE -0100]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(MathComplexApiTest, testCreal, Function | MediumTest | Level1) {
    int ret = TestCreal();
    ASSERT_EQ(ret, 0);
}

/**
 * @tc.name   testCrealf
 * @tc.number SUB_KERNEL_MATH_COMPLEX_CREALF_0100
 * @tc.desc   [C- SOFTWARE -0100]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(MathComplexApiTest, testCrealf, Function | MediumTest | Level1) {
    int ret = TestCrealf();
    ASSERT_EQ(ret, 0);
}

/**
 * @tc.name   testCreall
 * @tc.number SUB_KERNEL_MATH_COMPLEX_CREALL_0100
 * @tc.desc   [C- SOFTWARE -0100]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(MathComplexApiTest, testCreall, Function | MediumTest | Level1) {
    int ret = TestCreall();
    ASSERT_EQ(ret, 0);
}

/**
 * @tc.name   testCsin
 * @tc.number SUB_KERNEL_MATH_COMPLEX_CSIN_0100
 * @tc.desc   [C- SOFTWARE -0100]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(MathComplexApiTest, testCsin, Function | MediumTest | Level1) {
    int ret = TestCsin();
    ASSERT_EQ(ret, 0);
}

/**
 * @tc.name   testCsinf
 * @tc.number SUB_KERNEL_MATH_COMPLEX_CSINF_0100
 * @tc.desc   [C- SOFTWARE -0100]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(MathComplexApiTest, testCsinf, Function | MediumTest | Level1) {
    int ret = TestCsinf();
    ASSERT_EQ(ret, 0);
}

/**
 * @tc.name   testCsinh
 * @tc.number SUB_KERNEL_MATH_COMPLEX_CSINH_0100
 * @tc.desc   [C- SOFTWARE -0100]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(MathComplexApiTest, testCsinh, Function | MediumTest | Level1) {
    int ret = TestCsinh();
    ASSERT_EQ(ret, 0);
}

/**
 * @tc.name   testCsinhf
 * @tc.number SUB_KERNEL_MATH_COMPLEX_CSINHF_0100
 * @tc.desc   [C- SOFTWARE -0100]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(MathComplexApiTest, testCsinhf, Function | MediumTest | Level1) {
    int ret = TestCsinhf();
    ASSERT_EQ(ret, 0);
}

/**
 * @tc.name   testCsinhl
 * @tc.number SUB_KERNEL_MATH_COMPLEX_CSINHL_0100
 * @tc.desc   [C- SOFTWARE -0100]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(MathComplexApiTest, testCsinhl, Function | MediumTest | Level1) {
    int ret = TestCsinhl();
    ASSERT_EQ(ret, 0);
}

/**
 * @tc.name   testCsinl
 * @tc.number SUB_KERNEL_MATH_COMPLEX_CSINL_0100
 * @tc.desc   [C- SOFTWARE -0100]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(MathComplexApiTest, testCsinl, Function | MediumTest | Level1) {
    int ret = TestCsinl();
    ASSERT_EQ(ret, 0);
}

/**
 * @tc.name   testCsqrt
 * @tc.number SUB_KERNEL_MATH_COMPLEX_CSQRT_0100
 * @tc.desc   [C- SOFTWARE -0100]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(MathComplexApiTest, testCsqrt, Function | MediumTest | Level1) {
    int ret = TestCsqrt();
    ASSERT_EQ(ret, 0);
}

/**
 * @tc.name   testCsqrtf
 * @tc.number SUB_KERNEL_MATH_COMPLEX_CSQRTF_0100
 * @tc.desc   [C- SOFTWARE -0100]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(MathComplexApiTest, testCsqrtf, Function | MediumTest | Level1) {
    int ret = TestCsqrtf();
    ASSERT_EQ(ret, 0);
}

/**
 * @tc.name   testCsqrtl
 * @tc.number SUB_KERNEL_MATH_COMPLEX_CSQRTL_0100
 * @tc.desc   [C- SOFTWARE -0100]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(MathComplexApiTest, testCsqrtl, Function | MediumTest | Level1) {
    int ret = TestCsqrtl();
    ASSERT_EQ(ret, 0);
}

/**
 * @tc.name   testCtan
 * @tc.number SUB_KERNEL_MATH_COMPLEX_CTAN_0100
 * @tc.desc   [C- SOFTWARE -0100]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(MathComplexApiTest, testCtan, Function | MediumTest | Level1) {
    int ret = TestCtan();
    ASSERT_EQ(ret, 0);
}

/**
 * @tc.name   testCtanf
 * @tc.number SUB_KERNEL_MATH_COMPLEX_CTANF_0100
 * @tc.desc   [C- SOFTWARE -0100]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(MathComplexApiTest, testCtanf, Function | MediumTest | Level1) {
    int ret = TestCtanf();
    ASSERT_EQ(ret, 0);
}

/**
 * @tc.name   testCtanh
 * @tc.number SUB_KERNEL_MATH_COMPLEX_CTANH_0100
 * @tc.desc   [C- SOFTWARE -0100]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(MathComplexApiTest, testCtanh, Function | MediumTest | Level1) {
    int ret = TestCtanh();
    ASSERT_EQ(ret, 0);
}

/**
 * @tc.name   testCtanhf
 * @tc.number SUB_KERNEL_MATH_COMPLEX_CTANHF_0100
 * @tc.desc   [C- SOFTWARE -0100]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(MathComplexApiTest, testCtanhf, Function | MediumTest | Level1) {
    int ret = TestCtanhf();
    ASSERT_EQ(ret, 0);
}

/**
 * @tc.name   testCtanhl
 * @tc.number SUB_KERNEL_MATH_COMPLEX_CTANHL_0100
 * @tc.desc   [C- SOFTWARE -0100]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(MathComplexApiTest, testCtanhl, Function | MediumTest | Level1) {
    int ret = TestCtanhl();
    ASSERT_EQ(ret, 0);
}

/**
 * @tc.name   testCtanl
 * @tc.number SUB_KERNEL_MATH_COMPLEX_CTANL_0100
 * @tc.desc   [C- SOFTWARE -0100]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(MathComplexApiTest, testCtanl, Function | MediumTest | Level1) {
    int ret = TestCtanl();
    ASSERT_EQ(ret, 0);
}

/**
 * @tc.name   testCacosh
 * @tc.number SUB_KERNEL_MATH_COMPLEX_CACOSH_0100
 * @tc.desc   [C- SOFTWARE -0100]
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(MathComplexApiTest, testCacosh, Function | MediumTest | Level1) {
    int ret = TestCacosh();
    ASSERT_EQ(ret, 0);
}