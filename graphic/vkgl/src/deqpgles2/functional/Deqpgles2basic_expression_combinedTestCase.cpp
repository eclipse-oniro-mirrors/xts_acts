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

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008532,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.0");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008533,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.1");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008534,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.2");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008535,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.3");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008536,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.4");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008537,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.5");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008538,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.6");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008539,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.7");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008540,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.8");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008541,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.9");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008542,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.10");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008543,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.11");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008544,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.12");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008545,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.13");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008546,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.14");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008547,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.15");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008548,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.16");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008549,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.17");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008550,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.18");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008551,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.19");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008552,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.20");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008553,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.21");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008554,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.22");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008555,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.23");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008556,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.24");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008557,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.25");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008558,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.26");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008559,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.27");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008560,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.28");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008561,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.29");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008562,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.30");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008563,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.31");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008564,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.32");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008565,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.33");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008566,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.34");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008567,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.35");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008568,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.36");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008569,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.37");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008570,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.38");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008571,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.39");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008572,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.40");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008573,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.41");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008574,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.42");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008575,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.43");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008576,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.44");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008577,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.45");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008578,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.46");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008579,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.47");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008580,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.48");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008581,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.49");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008582,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.50");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008583,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.51");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008584,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.52");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008585,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.53");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008586,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.54");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008587,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.55");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008588,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.56");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008589,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.57");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008590,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.58");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008591,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.59");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008592,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.60");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008593,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.61");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008594,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.62");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008595,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.63");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008596,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.64");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008597,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.65");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008598,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.66");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008599,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.67");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008600,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.68");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008601,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.69");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008602,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.70");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008603,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.71");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008604,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.72");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008605,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.73");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008606,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.74");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008607,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.75");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008608,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.76");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008609,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.77");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008610,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.78");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008611,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.79");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008612,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.80");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008613,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.81");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008614,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.82");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008615,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.83");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008616,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.84");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008617,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.85");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008618,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.86");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008619,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.87");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008620,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.88");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008621,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.89");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008622,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.90");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008623,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.91");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008624,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.92");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008625,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.93");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008626,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.94");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008627,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.95");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008628,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.96");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008629,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.97");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008630,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.98");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008631,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.basic_expression.combined.99");
