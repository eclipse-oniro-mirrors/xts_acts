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

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009532,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.fragment.0");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009533,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.fragment.1");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009534,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.fragment.2");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009535,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.fragment.3");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009536,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.fragment.4");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009537,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.fragment.5");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009538,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.fragment.6");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009539,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.fragment.7");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009540,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.fragment.8");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009541,
        "dEQP-GLES2.functional.shaders.",
        "random.trigonometric.fragment.9");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009542,
        "dEQP-GLES2.functional.shaders.r",
        "andom.trigonometric.fragment.10");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009543,
        "dEQP-GLES2.functional.shaders.r",
        "andom.trigonometric.fragment.11");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009544,
        "dEQP-GLES2.functional.shaders.r",
        "andom.trigonometric.fragment.12");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009545,
        "dEQP-GLES2.functional.shaders.r",
        "andom.trigonometric.fragment.13");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009546,
        "dEQP-GLES2.functional.shaders.r",
        "andom.trigonometric.fragment.14");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009547,
        "dEQP-GLES2.functional.shaders.r",
        "andom.trigonometric.fragment.15");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009548,
        "dEQP-GLES2.functional.shaders.r",
        "andom.trigonometric.fragment.16");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009549,
        "dEQP-GLES2.functional.shaders.r",
        "andom.trigonometric.fragment.17");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009550,
        "dEQP-GLES2.functional.shaders.r",
        "andom.trigonometric.fragment.18");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009551,
        "dEQP-GLES2.functional.shaders.r",
        "andom.trigonometric.fragment.19");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009552,
        "dEQP-GLES2.functional.shaders.r",
        "andom.trigonometric.fragment.20");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009553,
        "dEQP-GLES2.functional.shaders.r",
        "andom.trigonometric.fragment.21");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009554,
        "dEQP-GLES2.functional.shaders.r",
        "andom.trigonometric.fragment.22");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009555,
        "dEQP-GLES2.functional.shaders.r",
        "andom.trigonometric.fragment.23");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009556,
        "dEQP-GLES2.functional.shaders.r",
        "andom.trigonometric.fragment.24");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009557,
        "dEQP-GLES2.functional.shaders.r",
        "andom.trigonometric.fragment.25");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009558,
        "dEQP-GLES2.functional.shaders.r",
        "andom.trigonometric.fragment.26");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009559,
        "dEQP-GLES2.functional.shaders.r",
        "andom.trigonometric.fragment.27");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009560,
        "dEQP-GLES2.functional.shaders.r",
        "andom.trigonometric.fragment.28");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009561,
        "dEQP-GLES2.functional.shaders.r",
        "andom.trigonometric.fragment.29");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009562,
        "dEQP-GLES2.functional.shaders.r",
        "andom.trigonometric.fragment.30");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009563,
        "dEQP-GLES2.functional.shaders.r",
        "andom.trigonometric.fragment.31");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009564,
        "dEQP-GLES2.functional.shaders.r",
        "andom.trigonometric.fragment.32");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009565,
        "dEQP-GLES2.functional.shaders.r",
        "andom.trigonometric.fragment.33");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009566,
        "dEQP-GLES2.functional.shaders.r",
        "andom.trigonometric.fragment.34");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009567,
        "dEQP-GLES2.functional.shaders.r",
        "andom.trigonometric.fragment.35");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009568,
        "dEQP-GLES2.functional.shaders.r",
        "andom.trigonometric.fragment.36");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009569,
        "dEQP-GLES2.functional.shaders.r",
        "andom.trigonometric.fragment.37");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009570,
        "dEQP-GLES2.functional.shaders.r",
        "andom.trigonometric.fragment.38");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009571,
        "dEQP-GLES2.functional.shaders.r",
        "andom.trigonometric.fragment.39");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009572,
        "dEQP-GLES2.functional.shaders.r",
        "andom.trigonometric.fragment.40");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009573,
        "dEQP-GLES2.functional.shaders.r",
        "andom.trigonometric.fragment.41");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009574,
        "dEQP-GLES2.functional.shaders.r",
        "andom.trigonometric.fragment.42");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009575,
        "dEQP-GLES2.functional.shaders.r",
        "andom.trigonometric.fragment.43");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009576,
        "dEQP-GLES2.functional.shaders.r",
        "andom.trigonometric.fragment.44");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009577,
        "dEQP-GLES2.functional.shaders.r",
        "andom.trigonometric.fragment.45");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009578,
        "dEQP-GLES2.functional.shaders.r",
        "andom.trigonometric.fragment.46");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009579,
        "dEQP-GLES2.functional.shaders.r",
        "andom.trigonometric.fragment.47");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009580,
        "dEQP-GLES2.functional.shaders.r",
        "andom.trigonometric.fragment.48");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009581,
        "dEQP-GLES2.functional.shaders.r",
        "andom.trigonometric.fragment.49");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009582,
        "dEQP-GLES2.functional.shaders.r",
        "andom.trigonometric.fragment.50");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009583,
        "dEQP-GLES2.functional.shaders.r",
        "andom.trigonometric.fragment.51");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009584,
        "dEQP-GLES2.functional.shaders.r",
        "andom.trigonometric.fragment.52");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009585,
        "dEQP-GLES2.functional.shaders.r",
        "andom.trigonometric.fragment.53");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009586,
        "dEQP-GLES2.functional.shaders.r",
        "andom.trigonometric.fragment.54");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009587,
        "dEQP-GLES2.functional.shaders.r",
        "andom.trigonometric.fragment.55");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009588,
        "dEQP-GLES2.functional.shaders.r",
        "andom.trigonometric.fragment.56");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009589,
        "dEQP-GLES2.functional.shaders.r",
        "andom.trigonometric.fragment.57");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009590,
        "dEQP-GLES2.functional.shaders.r",
        "andom.trigonometric.fragment.58");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009591,
        "dEQP-GLES2.functional.shaders.r",
        "andom.trigonometric.fragment.59");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009592,
        "dEQP-GLES2.functional.shaders.r",
        "andom.trigonometric.fragment.60");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009593,
        "dEQP-GLES2.functional.shaders.r",
        "andom.trigonometric.fragment.61");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009594,
        "dEQP-GLES2.functional.shaders.r",
        "andom.trigonometric.fragment.62");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009595,
        "dEQP-GLES2.functional.shaders.r",
        "andom.trigonometric.fragment.63");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009596,
        "dEQP-GLES2.functional.shaders.r",
        "andom.trigonometric.fragment.64");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009597,
        "dEQP-GLES2.functional.shaders.r",
        "andom.trigonometric.fragment.65");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009598,
        "dEQP-GLES2.functional.shaders.r",
        "andom.trigonometric.fragment.66");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009599,
        "dEQP-GLES2.functional.shaders.r",
        "andom.trigonometric.fragment.67");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009600,
        "dEQP-GLES2.functional.shaders.r",
        "andom.trigonometric.fragment.68");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009601,
        "dEQP-GLES2.functional.shaders.r",
        "andom.trigonometric.fragment.69");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009602,
        "dEQP-GLES2.functional.shaders.r",
        "andom.trigonometric.fragment.70");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009603,
        "dEQP-GLES2.functional.shaders.r",
        "andom.trigonometric.fragment.71");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009604,
        "dEQP-GLES2.functional.shaders.r",
        "andom.trigonometric.fragment.72");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009605,
        "dEQP-GLES2.functional.shaders.r",
        "andom.trigonometric.fragment.73");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009606,
        "dEQP-GLES2.functional.shaders.r",
        "andom.trigonometric.fragment.74");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009607,
        "dEQP-GLES2.functional.shaders.r",
        "andom.trigonometric.fragment.75");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009608,
        "dEQP-GLES2.functional.shaders.r",
        "andom.trigonometric.fragment.76");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009609,
        "dEQP-GLES2.functional.shaders.r",
        "andom.trigonometric.fragment.77");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009610,
        "dEQP-GLES2.functional.shaders.r",
        "andom.trigonometric.fragment.78");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009611,
        "dEQP-GLES2.functional.shaders.r",
        "andom.trigonometric.fragment.79");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009612,
        "dEQP-GLES2.functional.shaders.r",
        "andom.trigonometric.fragment.80");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009613,
        "dEQP-GLES2.functional.shaders.r",
        "andom.trigonometric.fragment.81");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009614,
        "dEQP-GLES2.functional.shaders.r",
        "andom.trigonometric.fragment.82");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009615,
        "dEQP-GLES2.functional.shaders.r",
        "andom.trigonometric.fragment.83");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009616,
        "dEQP-GLES2.functional.shaders.r",
        "andom.trigonometric.fragment.84");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009617,
        "dEQP-GLES2.functional.shaders.r",
        "andom.trigonometric.fragment.85");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009618,
        "dEQP-GLES2.functional.shaders.r",
        "andom.trigonometric.fragment.86");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009619,
        "dEQP-GLES2.functional.shaders.r",
        "andom.trigonometric.fragment.87");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009620,
        "dEQP-GLES2.functional.shaders.r",
        "andom.trigonometric.fragment.88");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009621,
        "dEQP-GLES2.functional.shaders.r",
        "andom.trigonometric.fragment.89");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009622,
        "dEQP-GLES2.functional.shaders.r",
        "andom.trigonometric.fragment.90");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009623,
        "dEQP-GLES2.functional.shaders.r",
        "andom.trigonometric.fragment.91");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009624,
        "dEQP-GLES2.functional.shaders.r",
        "andom.trigonometric.fragment.92");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009625,
        "dEQP-GLES2.functional.shaders.r",
        "andom.trigonometric.fragment.93");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009626,
        "dEQP-GLES2.functional.shaders.r",
        "andom.trigonometric.fragment.94");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009627,
        "dEQP-GLES2.functional.shaders.r",
        "andom.trigonometric.fragment.95");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009628,
        "dEQP-GLES2.functional.shaders.r",
        "andom.trigonometric.fragment.96");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009629,
        "dEQP-GLES2.functional.shaders.r",
        "andom.trigonometric.fragment.97");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009630,
        "dEQP-GLES2.functional.shaders.r",
        "andom.trigonometric.fragment.98");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009631,
        "dEQP-GLES2.functional.shaders.r",
        "andom.trigonometric.fragment.99");
