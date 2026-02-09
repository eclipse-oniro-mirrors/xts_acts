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

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020394,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.fragment.0");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020395,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.fragment.1");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020396,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.fragment.2");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020397,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.fragment.3");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020398,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.fragment.4");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020399,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.fragment.5");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020400,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.fragment.6");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020401,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.fragment.7");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020402,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.fragment.8");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020403,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.scalar_conversion.fragment.9");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020404,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.fragment.10");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020405,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.fragment.11");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020406,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.fragment.12");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020407,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.fragment.13");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020408,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.fragment.14");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020409,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.fragment.15");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020410,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.fragment.16");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020411,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.fragment.17");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020412,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.fragment.18");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020413,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.fragment.19");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020414,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.fragment.20");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020415,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.fragment.21");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020416,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.fragment.22");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020417,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.fragment.23");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020418,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.fragment.24");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020419,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.fragment.25");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020420,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.fragment.26");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020421,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.fragment.27");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020422,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.fragment.28");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020423,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.fragment.29");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020424,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.fragment.30");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020425,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.fragment.31");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020426,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.fragment.32");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020427,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.fragment.33");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020428,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.fragment.34");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020429,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.fragment.35");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020430,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.fragment.36");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020431,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.fragment.37");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020432,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.fragment.38");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020433,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.fragment.39");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020434,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.fragment.40");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020435,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.fragment.41");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020436,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.fragment.42");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020437,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.fragment.43");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020438,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.fragment.44");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020439,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.fragment.45");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020440,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.fragment.46");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020441,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.fragment.47");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020442,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.fragment.48");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020443,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.fragment.49");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020444,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.fragment.50");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020445,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.fragment.51");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020446,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.fragment.52");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020447,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.fragment.53");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020448,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.fragment.54");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020449,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.fragment.55");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020450,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.fragment.56");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020451,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.fragment.57");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020452,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.fragment.58");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020453,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.fragment.59");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020454,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.fragment.60");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020455,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.fragment.61");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020456,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.fragment.62");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020457,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.fragment.63");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020458,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.fragment.64");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020459,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.fragment.65");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020460,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.fragment.66");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020461,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.fragment.67");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020462,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.fragment.68");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020463,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.fragment.69");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020464,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.fragment.70");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020465,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.fragment.71");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020466,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.fragment.72");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020467,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.fragment.73");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020468,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.fragment.74");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020469,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.fragment.75");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020470,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.fragment.76");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020471,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.fragment.77");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020472,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.fragment.78");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020473,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.fragment.79");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020474,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.fragment.80");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020475,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.fragment.81");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020476,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.fragment.82");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020477,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.fragment.83");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020478,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.fragment.84");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020479,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.fragment.85");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020480,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.fragment.86");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020481,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.fragment.87");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020482,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.fragment.88");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020483,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.fragment.89");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020484,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.fragment.90");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020485,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.fragment.91");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020486,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.fragment.92");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020487,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.fragment.93");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020488,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.fragment.94");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020489,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.fragment.95");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020490,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.fragment.96");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020491,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.fragment.97");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020492,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.fragment.98");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020493,
        "dEQP-GLES3.functional.shaders.ran",
        "dom.scalar_conversion.fragment.99");
