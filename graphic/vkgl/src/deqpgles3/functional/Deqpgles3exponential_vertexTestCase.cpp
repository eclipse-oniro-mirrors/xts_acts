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
#include "../ActsDeqpgles30022TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021285,
        "dEQP-GLES3.functional.shader",
        "s.random.exponential.vertex.0");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021286,
        "dEQP-GLES3.functional.shader",
        "s.random.exponential.vertex.1");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021287,
        "dEQP-GLES3.functional.shader",
        "s.random.exponential.vertex.2");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021288,
        "dEQP-GLES3.functional.shader",
        "s.random.exponential.vertex.3");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021289,
        "dEQP-GLES3.functional.shader",
        "s.random.exponential.vertex.4");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021290,
        "dEQP-GLES3.functional.shader",
        "s.random.exponential.vertex.5");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021291,
        "dEQP-GLES3.functional.shader",
        "s.random.exponential.vertex.6");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021292,
        "dEQP-GLES3.functional.shader",
        "s.random.exponential.vertex.7");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021293,
        "dEQP-GLES3.functional.shader",
        "s.random.exponential.vertex.8");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021294,
        "dEQP-GLES3.functional.shader",
        "s.random.exponential.vertex.9");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021295,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.vertex.10");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021296,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.vertex.11");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021297,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.vertex.12");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021298,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.vertex.13");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021299,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.vertex.14");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021300,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.vertex.15");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021301,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.vertex.16");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021302,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.vertex.17");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021303,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.vertex.18");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021304,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.vertex.19");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021305,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.vertex.20");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021306,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.vertex.21");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021307,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.vertex.22");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021308,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.vertex.23");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021309,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.vertex.24");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021310,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.vertex.25");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021311,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.vertex.26");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021312,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.vertex.27");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021313,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.vertex.28");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021314,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.vertex.29");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021315,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.vertex.30");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021316,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.vertex.31");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021317,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.vertex.32");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021318,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.vertex.33");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021319,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.vertex.34");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021320,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.vertex.35");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021321,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.vertex.36");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021322,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.vertex.37");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021323,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.vertex.38");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021324,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.vertex.39");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021325,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.vertex.40");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021326,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.vertex.41");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021327,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.vertex.42");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021328,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.vertex.43");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021329,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.vertex.44");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021330,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.vertex.45");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021331,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.vertex.46");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021332,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.vertex.47");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021333,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.vertex.48");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021334,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.vertex.49");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021335,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.vertex.50");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021336,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.vertex.51");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021337,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.vertex.52");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021338,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.vertex.53");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021339,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.vertex.54");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021340,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.vertex.55");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021341,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.vertex.56");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021342,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.vertex.57");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021343,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.vertex.58");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021344,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.vertex.59");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021345,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.vertex.60");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021346,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.vertex.61");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021347,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.vertex.62");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021348,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.vertex.63");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021349,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.vertex.64");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021350,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.vertex.65");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021351,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.vertex.66");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021352,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.vertex.67");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021353,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.vertex.68");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021354,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.vertex.69");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021355,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.vertex.70");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021356,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.vertex.71");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021357,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.vertex.72");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021358,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.vertex.73");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021359,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.vertex.74");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021360,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.vertex.75");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021361,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.vertex.76");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021362,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.vertex.77");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021363,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.vertex.78");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021364,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.vertex.79");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021365,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.vertex.80");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021366,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.vertex.81");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021367,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.vertex.82");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021368,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.vertex.83");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021369,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.vertex.84");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021370,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.vertex.85");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021371,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.vertex.86");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021372,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.vertex.87");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021373,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.vertex.88");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021374,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.vertex.89");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021375,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.vertex.90");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021376,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.vertex.91");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021377,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.vertex.92");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021378,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.vertex.93");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021379,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.vertex.94");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021380,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.vertex.95");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021381,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.vertex.96");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021382,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.vertex.97");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021383,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.vertex.98");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021384,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.vertex.99");
