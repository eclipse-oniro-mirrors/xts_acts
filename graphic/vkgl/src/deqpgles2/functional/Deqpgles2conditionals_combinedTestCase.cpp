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

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009332,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.0");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009333,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.1");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009334,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.2");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009335,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.3");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009336,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.4");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009337,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.5");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009338,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.6");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009339,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.7");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009340,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.8");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009341,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.9");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009342,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.10");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009343,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.11");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009344,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.12");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009345,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.13");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009346,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.14");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009347,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.15");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009348,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.16");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009349,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.17");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009350,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.18");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009351,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.19");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009352,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.20");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009353,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.21");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009354,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.22");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009355,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.23");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009356,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.24");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009357,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.25");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009358,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.26");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009359,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.27");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009360,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.28");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009361,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.29");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009362,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.30");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009363,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.31");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009364,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.32");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009365,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.33");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009366,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.34");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009367,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.35");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009368,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.36");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009369,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.37");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009370,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.38");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009371,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.39");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009372,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.40");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009373,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.41");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009374,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.42");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009375,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.43");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009376,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.44");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009377,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.45");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009378,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.46");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009379,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.47");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009380,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.48");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009381,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.49");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009382,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.50");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009383,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.51");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009384,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.52");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009385,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.53");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009386,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.54");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009387,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.55");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009388,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.56");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009389,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.57");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009390,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.58");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009391,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.59");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009392,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.60");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009393,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.61");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009394,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.62");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009395,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.63");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009396,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.64");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009397,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.65");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009398,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.66");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009399,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.67");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009400,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.68");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009401,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.69");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009402,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.70");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009403,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.71");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009404,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.72");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009405,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.73");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009406,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.74");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009407,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.75");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009408,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.76");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009409,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.77");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009410,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.78");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009411,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.79");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009412,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.80");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009413,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.81");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009414,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.82");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009415,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.83");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009416,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.84");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009417,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.85");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009418,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.86");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009419,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.87");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009420,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.88");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009421,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.89");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009422,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.90");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009423,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.91");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009424,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.92");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009425,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.93");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009426,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.94");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009427,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.95");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009428,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.96");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009429,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.97");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009430,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.98");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009431,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.combined.99");
