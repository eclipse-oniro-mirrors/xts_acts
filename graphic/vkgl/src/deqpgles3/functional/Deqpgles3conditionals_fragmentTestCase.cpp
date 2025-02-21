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

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020894,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.0");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020895,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.1");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020896,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.2");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020897,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.3");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020898,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.4");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020899,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.5");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020900,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.6");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020901,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.7");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020902,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.8");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020903,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.9");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020904,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.10");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020905,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.11");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020906,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.12");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020907,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.13");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020908,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.14");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020909,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.15");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020910,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.16");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020911,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.17");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020912,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.18");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020913,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.19");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020914,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.20");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020915,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.21");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020916,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.22");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020917,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.23");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020918,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.24");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020919,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.25");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020920,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.26");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020921,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.27");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020922,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.28");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020923,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.29");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020924,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.30");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020925,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.31");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020926,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.32");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020927,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.33");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020928,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.34");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020929,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.35");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020930,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.36");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020931,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.37");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020932,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.38");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020933,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.39");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020934,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.40");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020935,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.41");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020936,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.42");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020937,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.43");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020938,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.44");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020939,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.45");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020940,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.46");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020941,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.47");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020942,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.48");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020943,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.49");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020944,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.50");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020945,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.51");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020946,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.52");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020947,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.53");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020948,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.54");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020949,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.55");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020950,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.56");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020951,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.57");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020952,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.58");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020953,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.59");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020954,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.60");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020955,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.61");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020956,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.62");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020957,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.63");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020958,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.64");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020959,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.65");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020960,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.66");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020961,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.67");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020962,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.68");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020963,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.69");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020964,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.70");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020965,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.71");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020966,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.72");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020967,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.73");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020968,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.74");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020969,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.75");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020970,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.76");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020971,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.77");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020972,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.78");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020973,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.79");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020974,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.80");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020975,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.81");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020976,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.82");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020977,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.83");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020978,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.84");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020979,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.85");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020980,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.86");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020981,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.87");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020982,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.88");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020983,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.89");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020984,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.90");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020985,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.91");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020986,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.92");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020987,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.93");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020988,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.94");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020989,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.95");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020990,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.96");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020991,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.97");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020992,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.98");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020993,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.fragment.99");
