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

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020294,
        "dEQP-GLES3.functional.shaders.r",
        "andom.scalar_conversion.vertex.0");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020295,
        "dEQP-GLES3.functional.shaders.r",
        "andom.scalar_conversion.vertex.1");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020296,
        "dEQP-GLES3.functional.shaders.r",
        "andom.scalar_conversion.vertex.2");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020297,
        "dEQP-GLES3.functional.shaders.r",
        "andom.scalar_conversion.vertex.3");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020298,
        "dEQP-GLES3.functional.shaders.r",
        "andom.scalar_conversion.vertex.4");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020299,
        "dEQP-GLES3.functional.shaders.r",
        "andom.scalar_conversion.vertex.5");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020300,
        "dEQP-GLES3.functional.shaders.r",
        "andom.scalar_conversion.vertex.6");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020301,
        "dEQP-GLES3.functional.shaders.r",
        "andom.scalar_conversion.vertex.7");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020302,
        "dEQP-GLES3.functional.shaders.r",
        "andom.scalar_conversion.vertex.8");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020303,
        "dEQP-GLES3.functional.shaders.r",
        "andom.scalar_conversion.vertex.9");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020304,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.vertex.10");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020305,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.vertex.11");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020306,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.vertex.12");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020307,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.vertex.13");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020308,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.vertex.14");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020309,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.vertex.15");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020310,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.vertex.16");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020311,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.vertex.17");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020312,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.vertex.18");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020313,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.vertex.19");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020314,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.vertex.20");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020315,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.vertex.21");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020316,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.vertex.22");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020317,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.vertex.23");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020318,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.vertex.24");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020319,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.vertex.25");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020320,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.vertex.26");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020321,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.vertex.27");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020322,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.vertex.28");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020323,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.vertex.29");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020324,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.vertex.30");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020325,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.vertex.31");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020326,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.vertex.32");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020327,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.vertex.33");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020328,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.vertex.34");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020329,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.vertex.35");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020330,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.vertex.36");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020331,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.vertex.37");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020332,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.vertex.38");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020333,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.vertex.39");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020334,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.vertex.40");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020335,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.vertex.41");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020336,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.vertex.42");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020337,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.vertex.43");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020338,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.vertex.44");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020339,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.vertex.45");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020340,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.vertex.46");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020341,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.vertex.47");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020342,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.vertex.48");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020343,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.vertex.49");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020344,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.vertex.50");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020345,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.vertex.51");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020346,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.vertex.52");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020347,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.vertex.53");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020348,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.vertex.54");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020349,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.vertex.55");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020350,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.vertex.56");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020351,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.vertex.57");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020352,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.vertex.58");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020353,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.vertex.59");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020354,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.vertex.60");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020355,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.vertex.61");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020356,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.vertex.62");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020357,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.vertex.63");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020358,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.vertex.64");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020359,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.vertex.65");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020360,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.vertex.66");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020361,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.vertex.67");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020362,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.vertex.68");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020363,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.vertex.69");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020364,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.vertex.70");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020365,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.vertex.71");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020366,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.vertex.72");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020367,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.vertex.73");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020368,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.vertex.74");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020369,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.vertex.75");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020370,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.vertex.76");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020371,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.vertex.77");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020372,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.vertex.78");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020373,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.vertex.79");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020374,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.vertex.80");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020375,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.vertex.81");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020376,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.vertex.82");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020377,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.vertex.83");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020378,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.vertex.84");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020379,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.vertex.85");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020380,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.vertex.86");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020381,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.vertex.87");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020382,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.vertex.88");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020383,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.vertex.89");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020384,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.vertex.90");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020385,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.vertex.91");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020386,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.vertex.92");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020387,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.vertex.93");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020388,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.vertex.94");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020389,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.vertex.95");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020390,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.vertex.96");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020391,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.vertex.97");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020392,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.vertex.98");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020393,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.vertex.99");
