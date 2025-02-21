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

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020494,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.combined.0");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020495,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.combined.1");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020496,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.combined.2");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020497,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.combined.3");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020498,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.combined.4");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020499,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.combined.5");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020500,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.combined.6");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020501,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.combined.7");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020502,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.combined.8");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020503,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.combined.9");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020504,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.combined.10");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020505,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.combined.11");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020506,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.combined.12");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020507,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.combined.13");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020508,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.combined.14");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020509,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.combined.15");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020510,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.combined.16");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020511,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.combined.17");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020512,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.combined.18");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020513,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.combined.19");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020514,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.combined.20");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020515,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.combined.21");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020516,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.combined.22");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020517,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.combined.23");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020518,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.combined.24");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020519,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.combined.25");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020520,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.combined.26");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020521,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.combined.27");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020522,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.combined.28");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020523,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.combined.29");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020524,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.combined.30");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020525,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.combined.31");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020526,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.combined.32");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020527,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.combined.33");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020528,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.combined.34");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020529,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.combined.35");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020530,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.combined.36");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020531,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.combined.37");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020532,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.combined.38");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020533,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.combined.39");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020534,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.combined.40");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020535,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.combined.41");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020536,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.combined.42");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020537,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.combined.43");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020538,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.combined.44");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020539,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.combined.45");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020540,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.combined.46");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020541,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.combined.47");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020542,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.combined.48");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020543,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.combined.49");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020544,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.combined.50");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020545,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.combined.51");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020546,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.combined.52");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020547,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.combined.53");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020548,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.combined.54");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020549,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.combined.55");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020550,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.combined.56");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020551,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.combined.57");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020552,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.combined.58");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020553,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.combined.59");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020554,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.combined.60");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020555,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.combined.61");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020556,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.combined.62");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020557,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.combined.63");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020558,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.combined.64");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020559,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.combined.65");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020560,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.combined.66");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020561,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.combined.67");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020562,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.combined.68");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020563,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.combined.69");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020564,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.combined.70");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020565,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.combined.71");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020566,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.combined.72");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020567,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.combined.73");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020568,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.combined.74");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020569,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.combined.75");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020570,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.combined.76");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020571,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.combined.77");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020572,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.combined.78");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020573,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.combined.79");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020574,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.combined.80");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020575,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.combined.81");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020576,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.combined.82");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020577,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.combined.83");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020578,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.combined.84");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020579,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.combined.85");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020580,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.combined.86");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020581,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.combined.87");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020582,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.combined.88");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020583,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.combined.89");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020584,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.combined.90");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020585,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.combined.91");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020586,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.combined.92");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020587,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.combined.93");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020588,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.combined.94");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020589,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.combined.95");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020590,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.combined.96");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020591,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.combined.97");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020592,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.combined.98");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020593,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.combined.99");
