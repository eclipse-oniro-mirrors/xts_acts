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

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021385,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.fragment.0");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021386,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.fragment.1");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021387,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.fragment.2");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021388,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.fragment.3");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021389,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.fragment.4");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021390,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.fragment.5");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021391,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.fragment.6");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021392,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.fragment.7");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021393,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.fragment.8");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021394,
        "dEQP-GLES3.functional.shaders",
        ".random.exponential.fragment.9");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021395,
        "dEQP-GLES3.functional.shaders.",
        "random.exponential.fragment.10");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021396,
        "dEQP-GLES3.functional.shaders.",
        "random.exponential.fragment.11");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021397,
        "dEQP-GLES3.functional.shaders.",
        "random.exponential.fragment.12");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021398,
        "dEQP-GLES3.functional.shaders.",
        "random.exponential.fragment.13");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021399,
        "dEQP-GLES3.functional.shaders.",
        "random.exponential.fragment.14");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021400,
        "dEQP-GLES3.functional.shaders.",
        "random.exponential.fragment.15");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021401,
        "dEQP-GLES3.functional.shaders.",
        "random.exponential.fragment.16");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021402,
        "dEQP-GLES3.functional.shaders.",
        "random.exponential.fragment.17");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021403,
        "dEQP-GLES3.functional.shaders.",
        "random.exponential.fragment.18");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021404,
        "dEQP-GLES3.functional.shaders.",
        "random.exponential.fragment.19");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021405,
        "dEQP-GLES3.functional.shaders.",
        "random.exponential.fragment.20");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021406,
        "dEQP-GLES3.functional.shaders.",
        "random.exponential.fragment.21");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021407,
        "dEQP-GLES3.functional.shaders.",
        "random.exponential.fragment.22");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021408,
        "dEQP-GLES3.functional.shaders.",
        "random.exponential.fragment.23");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021409,
        "dEQP-GLES3.functional.shaders.",
        "random.exponential.fragment.24");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021410,
        "dEQP-GLES3.functional.shaders.",
        "random.exponential.fragment.25");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021411,
        "dEQP-GLES3.functional.shaders.",
        "random.exponential.fragment.26");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021412,
        "dEQP-GLES3.functional.shaders.",
        "random.exponential.fragment.27");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021413,
        "dEQP-GLES3.functional.shaders.",
        "random.exponential.fragment.28");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021414,
        "dEQP-GLES3.functional.shaders.",
        "random.exponential.fragment.29");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021415,
        "dEQP-GLES3.functional.shaders.",
        "random.exponential.fragment.30");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021416,
        "dEQP-GLES3.functional.shaders.",
        "random.exponential.fragment.31");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021417,
        "dEQP-GLES3.functional.shaders.",
        "random.exponential.fragment.32");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021418,
        "dEQP-GLES3.functional.shaders.",
        "random.exponential.fragment.33");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021419,
        "dEQP-GLES3.functional.shaders.",
        "random.exponential.fragment.34");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021420,
        "dEQP-GLES3.functional.shaders.",
        "random.exponential.fragment.35");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021421,
        "dEQP-GLES3.functional.shaders.",
        "random.exponential.fragment.36");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021422,
        "dEQP-GLES3.functional.shaders.",
        "random.exponential.fragment.37");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021423,
        "dEQP-GLES3.functional.shaders.",
        "random.exponential.fragment.38");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021424,
        "dEQP-GLES3.functional.shaders.",
        "random.exponential.fragment.39");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021425,
        "dEQP-GLES3.functional.shaders.",
        "random.exponential.fragment.40");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021426,
        "dEQP-GLES3.functional.shaders.",
        "random.exponential.fragment.41");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021427,
        "dEQP-GLES3.functional.shaders.",
        "random.exponential.fragment.42");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021428,
        "dEQP-GLES3.functional.shaders.",
        "random.exponential.fragment.43");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021429,
        "dEQP-GLES3.functional.shaders.",
        "random.exponential.fragment.44");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021430,
        "dEQP-GLES3.functional.shaders.",
        "random.exponential.fragment.45");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021431,
        "dEQP-GLES3.functional.shaders.",
        "random.exponential.fragment.46");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021432,
        "dEQP-GLES3.functional.shaders.",
        "random.exponential.fragment.47");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021433,
        "dEQP-GLES3.functional.shaders.",
        "random.exponential.fragment.48");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021434,
        "dEQP-GLES3.functional.shaders.",
        "random.exponential.fragment.49");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021435,
        "dEQP-GLES3.functional.shaders.",
        "random.exponential.fragment.50");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021436,
        "dEQP-GLES3.functional.shaders.",
        "random.exponential.fragment.51");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021437,
        "dEQP-GLES3.functional.shaders.",
        "random.exponential.fragment.52");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021438,
        "dEQP-GLES3.functional.shaders.",
        "random.exponential.fragment.53");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021439,
        "dEQP-GLES3.functional.shaders.",
        "random.exponential.fragment.54");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021440,
        "dEQP-GLES3.functional.shaders.",
        "random.exponential.fragment.55");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021441,
        "dEQP-GLES3.functional.shaders.",
        "random.exponential.fragment.56");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021442,
        "dEQP-GLES3.functional.shaders.",
        "random.exponential.fragment.57");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021443,
        "dEQP-GLES3.functional.shaders.",
        "random.exponential.fragment.58");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021444,
        "dEQP-GLES3.functional.shaders.",
        "random.exponential.fragment.59");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021445,
        "dEQP-GLES3.functional.shaders.",
        "random.exponential.fragment.60");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021446,
        "dEQP-GLES3.functional.shaders.",
        "random.exponential.fragment.61");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021447,
        "dEQP-GLES3.functional.shaders.",
        "random.exponential.fragment.62");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021448,
        "dEQP-GLES3.functional.shaders.",
        "random.exponential.fragment.63");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021449,
        "dEQP-GLES3.functional.shaders.",
        "random.exponential.fragment.64");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021450,
        "dEQP-GLES3.functional.shaders.",
        "random.exponential.fragment.65");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021451,
        "dEQP-GLES3.functional.shaders.",
        "random.exponential.fragment.66");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021452,
        "dEQP-GLES3.functional.shaders.",
        "random.exponential.fragment.67");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021453,
        "dEQP-GLES3.functional.shaders.",
        "random.exponential.fragment.68");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021454,
        "dEQP-GLES3.functional.shaders.",
        "random.exponential.fragment.69");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021455,
        "dEQP-GLES3.functional.shaders.",
        "random.exponential.fragment.70");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021456,
        "dEQP-GLES3.functional.shaders.",
        "random.exponential.fragment.71");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021457,
        "dEQP-GLES3.functional.shaders.",
        "random.exponential.fragment.72");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021458,
        "dEQP-GLES3.functional.shaders.",
        "random.exponential.fragment.73");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021459,
        "dEQP-GLES3.functional.shaders.",
        "random.exponential.fragment.74");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021460,
        "dEQP-GLES3.functional.shaders.",
        "random.exponential.fragment.75");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021461,
        "dEQP-GLES3.functional.shaders.",
        "random.exponential.fragment.76");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021462,
        "dEQP-GLES3.functional.shaders.",
        "random.exponential.fragment.77");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021463,
        "dEQP-GLES3.functional.shaders.",
        "random.exponential.fragment.78");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021464,
        "dEQP-GLES3.functional.shaders.",
        "random.exponential.fragment.79");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021465,
        "dEQP-GLES3.functional.shaders.",
        "random.exponential.fragment.80");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021466,
        "dEQP-GLES3.functional.shaders.",
        "random.exponential.fragment.81");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021467,
        "dEQP-GLES3.functional.shaders.",
        "random.exponential.fragment.82");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021468,
        "dEQP-GLES3.functional.shaders.",
        "random.exponential.fragment.83");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021469,
        "dEQP-GLES3.functional.shaders.",
        "random.exponential.fragment.84");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021470,
        "dEQP-GLES3.functional.shaders.",
        "random.exponential.fragment.85");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021471,
        "dEQP-GLES3.functional.shaders.",
        "random.exponential.fragment.86");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021472,
        "dEQP-GLES3.functional.shaders.",
        "random.exponential.fragment.87");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021473,
        "dEQP-GLES3.functional.shaders.",
        "random.exponential.fragment.88");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021474,
        "dEQP-GLES3.functional.shaders.",
        "random.exponential.fragment.89");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021475,
        "dEQP-GLES3.functional.shaders.",
        "random.exponential.fragment.90");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021476,
        "dEQP-GLES3.functional.shaders.",
        "random.exponential.fragment.91");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021477,
        "dEQP-GLES3.functional.shaders.",
        "random.exponential.fragment.92");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021478,
        "dEQP-GLES3.functional.shaders.",
        "random.exponential.fragment.93");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021479,
        "dEQP-GLES3.functional.shaders.",
        "random.exponential.fragment.94");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021480,
        "dEQP-GLES3.functional.shaders.",
        "random.exponential.fragment.95");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021481,
        "dEQP-GLES3.functional.shaders.",
        "random.exponential.fragment.96");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021482,
        "dEQP-GLES3.functional.shaders.",
        "random.exponential.fragment.97");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021483,
        "dEQP-GLES3.functional.shaders.",
        "random.exponential.fragment.98");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021484,
        "dEQP-GLES3.functional.shaders.",
        "random.exponential.fragment.99");
