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
#include "../ActsDeqpgles20010TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009432,
        "dEQP-GLES2.functional.shaders",
        ".random.trigonometric.vertex.0");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009433,
        "dEQP-GLES2.functional.shaders",
        ".random.trigonometric.vertex.1");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009434,
        "dEQP-GLES2.functional.shaders",
        ".random.trigonometric.vertex.2");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009435,
        "dEQP-GLES2.functional.shaders",
        ".random.trigonometric.vertex.3");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009436,
        "dEQP-GLES2.functional.shaders",
        ".random.trigonometric.vertex.4");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009437,
        "dEQP-GLES2.functional.shaders",
        ".random.trigonometric.vertex.5");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009438,
        "dEQP-GLES2.functional.shaders",
        ".random.trigonometric.vertex.6");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009439,
        "dEQP-GLES2.functional.shaders",
        ".random.trigonometric.vertex.7");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009440,
        "dEQP-GLES2.functional.shaders",
        ".random.trigonometric.vertex.8");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009441,
        "dEQP-GLES2.functional.shaders",
        ".random.trigonometric.vertex.9");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009442,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.vertex.10");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009443,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.vertex.11");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009444,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.vertex.12");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009445,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.vertex.13");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009446,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.vertex.14");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009447,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.vertex.15");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009448,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.vertex.16");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009449,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.vertex.17");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009450,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.vertex.18");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009451,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.vertex.19");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009452,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.vertex.20");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009453,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.vertex.21");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009454,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.vertex.22");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009455,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.vertex.23");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009456,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.vertex.24");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009457,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.vertex.25");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009458,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.vertex.26");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009459,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.vertex.27");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009460,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.vertex.28");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009461,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.vertex.29");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009462,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.vertex.30");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009463,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.vertex.31");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009464,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.vertex.32");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009465,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.vertex.33");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009466,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.vertex.34");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009467,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.vertex.35");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009468,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.vertex.36");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009469,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.vertex.37");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009470,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.vertex.38");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009471,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.vertex.39");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009472,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.vertex.40");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009473,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.vertex.41");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009474,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.vertex.42");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009475,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.vertex.43");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009476,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.vertex.44");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009477,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.vertex.45");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009478,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.vertex.46");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009479,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.vertex.47");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009480,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.vertex.48");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009481,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.vertex.49");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009482,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.vertex.50");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009483,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.vertex.51");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009484,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.vertex.52");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009485,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.vertex.53");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009486,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.vertex.54");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009487,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.vertex.55");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009488,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.vertex.56");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009489,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.vertex.57");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009490,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.vertex.58");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009491,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.vertex.59");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009492,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.vertex.60");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009493,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.vertex.61");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009494,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.vertex.62");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009495,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.vertex.63");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009496,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.vertex.64");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009497,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.vertex.65");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009498,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.vertex.66");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009499,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.vertex.67");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009500,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.vertex.68");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009501,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.vertex.69");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009502,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.vertex.70");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009503,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.vertex.71");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009504,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.vertex.72");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009505,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.vertex.73");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009506,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.vertex.74");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009507,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.vertex.75");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009508,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.vertex.76");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009509,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.vertex.77");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009510,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.vertex.78");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009511,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.vertex.79");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009512,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.vertex.80");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009513,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.vertex.81");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009514,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.vertex.82");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009515,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.vertex.83");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009516,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.vertex.84");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009517,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.vertex.85");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009518,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.vertex.86");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009519,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.vertex.87");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009520,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.vertex.88");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009521,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.vertex.89");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009522,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.vertex.90");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009523,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.vertex.91");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009524,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.vertex.92");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009525,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.vertex.93");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009526,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.vertex.94");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009527,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.vertex.95");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009528,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.vertex.96");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009529,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.vertex.97");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009530,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.vertex.98");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009531,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.vertex.99");
