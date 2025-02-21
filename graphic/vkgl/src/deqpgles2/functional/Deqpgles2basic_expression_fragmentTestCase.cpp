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
#include "../Deqpgles2BaseFunc.h"
#include "../ActsDeqpgles20009TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008432,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.0");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008433,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.1");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008434,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.2");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008435,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.3");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008436,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.4");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008437,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.5");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008438,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.6");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008439,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.7");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008440,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.8");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008441,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.9");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008442,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.10");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008443,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.11");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008444,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.12");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008445,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.13");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008446,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.14");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008447,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.15");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008448,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.16");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008449,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.17");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008450,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.18");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008451,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.19");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008452,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.20");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008453,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.21");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008454,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.22");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008455,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.23");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008456,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.24");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008457,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.25");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008458,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.26");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008459,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.27");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008460,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.28");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008461,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.29");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008462,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.30");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008463,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.31");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008464,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.32");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008465,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.33");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008466,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.34");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008467,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.35");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008468,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.36");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008469,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.37");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008470,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.38");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008471,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.39");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008472,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.40");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008473,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.41");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008474,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.42");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008475,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.43");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008476,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.44");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008477,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.45");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008478,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.46");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008479,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.47");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008480,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.48");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008481,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.49");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008482,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.50");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008483,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.51");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008484,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.52");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008485,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.53");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008486,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.54");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008487,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.55");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008488,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.56");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008489,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.57");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008490,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.58");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008491,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.59");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008492,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.60");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008493,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.61");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008494,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.62");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008495,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.63");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008496,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.64");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008497,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.65");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008498,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.66");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008499,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.67");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008500,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.68");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008501,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.69");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008502,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.70");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008503,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.71");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008504,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.72");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008505,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.73");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008506,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.74");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008507,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.75");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008508,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.76");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008509,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.77");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008510,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.78");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008511,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.79");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008512,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.80");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008513,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.81");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008514,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.82");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008515,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.83");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008516,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.84");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008517,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.85");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008518,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.86");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008519,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.87");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008520,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.88");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008521,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.89");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008522,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.90");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008523,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.91");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008524,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.92");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008525,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.93");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008526,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.94");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008527,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.95");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008528,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.96");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008529,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.97");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008530,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.98");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008531,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.fragment.99");
