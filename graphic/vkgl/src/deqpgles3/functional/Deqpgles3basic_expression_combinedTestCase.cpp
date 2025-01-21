/*
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

#include <climits>
#include <gtest/gtest.h>
#include "../Deqpgles3BaseFunc.h"
#include "../ActsDeqpgles30021TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020194,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.0");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020195,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.1");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020196,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.2");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020197,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.3");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020198,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.4");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020199,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.5");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020200,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.6");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020201,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.7");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020202,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.8");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020203,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.9");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020204,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.10");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020205,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.11");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020206,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.12");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020207,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.13");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020208,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.14");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020209,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.15");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020210,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.16");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020211,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.17");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020212,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.18");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020213,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.19");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020214,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.20");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020215,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.21");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020216,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.22");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020217,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.23");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020218,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.24");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020219,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.25");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020220,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.26");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020221,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.27");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020222,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.28");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020223,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.29");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020224,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.30");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020225,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.31");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020226,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.32");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020227,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.33");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020228,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.34");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020229,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.35");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020230,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.36");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020231,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.37");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020232,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.38");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020233,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.39");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020234,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.40");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020235,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.41");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020236,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.42");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020237,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.43");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020238,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.44");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020239,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.45");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020240,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.46");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020241,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.47");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020242,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.48");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020243,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.49");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020244,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.50");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020245,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.51");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020246,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.52");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020247,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.53");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020248,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.54");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020249,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.55");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020250,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.56");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020251,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.57");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020252,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.58");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020253,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.59");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020254,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.60");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020255,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.61");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020256,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.62");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020257,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.63");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020258,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.64");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020259,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.65");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020260,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.66");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020261,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.67");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020262,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.68");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020263,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.69");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020264,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.70");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020265,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.71");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020266,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.72");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020267,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.73");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020268,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.74");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020269,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.75");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020270,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.76");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020271,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.77");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020272,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.78");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020273,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.79");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020274,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.80");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020275,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.81");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020276,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.82");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020277,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.83");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020278,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.84");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020279,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.85");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020280,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.86");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020281,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.87");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020282,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.88");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020283,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.89");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020284,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.90");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020285,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.91");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020286,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.92");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020287,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.93");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020288,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.94");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020289,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.95");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020290,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.96");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020291,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.97");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020292,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.98");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020293,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.combined.99");
