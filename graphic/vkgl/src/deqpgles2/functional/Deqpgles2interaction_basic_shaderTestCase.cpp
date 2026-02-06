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
#include "../ActsDeqpgles20013TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012312,
        "dEQP-GLES2.functional.fragment",
        "_ops.interaction.basic_shader.0");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012313,
        "dEQP-GLES2.functional.fragment",
        "_ops.interaction.basic_shader.1");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012314,
        "dEQP-GLES2.functional.fragment",
        "_ops.interaction.basic_shader.2");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012315,
        "dEQP-GLES2.functional.fragment",
        "_ops.interaction.basic_shader.3");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012316,
        "dEQP-GLES2.functional.fragment",
        "_ops.interaction.basic_shader.4");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012317,
        "dEQP-GLES2.functional.fragment",
        "_ops.interaction.basic_shader.5");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012318,
        "dEQP-GLES2.functional.fragment",
        "_ops.interaction.basic_shader.6");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012319,
        "dEQP-GLES2.functional.fragment",
        "_ops.interaction.basic_shader.7");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012320,
        "dEQP-GLES2.functional.fragment",
        "_ops.interaction.basic_shader.8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012321,
        "dEQP-GLES2.functional.fragment",
        "_ops.interaction.basic_shader.9");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012322,
        "dEQP-GLES2.functional.fragment_",
        "ops.interaction.basic_shader.10");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012323,
        "dEQP-GLES2.functional.fragment_",
        "ops.interaction.basic_shader.11");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012324,
        "dEQP-GLES2.functional.fragment_",
        "ops.interaction.basic_shader.12");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012325,
        "dEQP-GLES2.functional.fragment_",
        "ops.interaction.basic_shader.13");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012326,
        "dEQP-GLES2.functional.fragment_",
        "ops.interaction.basic_shader.14");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012327,
        "dEQP-GLES2.functional.fragment_",
        "ops.interaction.basic_shader.15");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012328,
        "dEQP-GLES2.functional.fragment_",
        "ops.interaction.basic_shader.16");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012329,
        "dEQP-GLES2.functional.fragment_",
        "ops.interaction.basic_shader.17");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012330,
        "dEQP-GLES2.functional.fragment_",
        "ops.interaction.basic_shader.18");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012331,
        "dEQP-GLES2.functional.fragment_",
        "ops.interaction.basic_shader.19");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012332,
        "dEQP-GLES2.functional.fragment_",
        "ops.interaction.basic_shader.20");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012333,
        "dEQP-GLES2.functional.fragment_",
        "ops.interaction.basic_shader.21");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012334,
        "dEQP-GLES2.functional.fragment_",
        "ops.interaction.basic_shader.22");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012335,
        "dEQP-GLES2.functional.fragment_",
        "ops.interaction.basic_shader.23");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012336,
        "dEQP-GLES2.functional.fragment_",
        "ops.interaction.basic_shader.24");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012337,
        "dEQP-GLES2.functional.fragment_",
        "ops.interaction.basic_shader.25");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012338,
        "dEQP-GLES2.functional.fragment_",
        "ops.interaction.basic_shader.26");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012339,
        "dEQP-GLES2.functional.fragment_",
        "ops.interaction.basic_shader.27");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012340,
        "dEQP-GLES2.functional.fragment_",
        "ops.interaction.basic_shader.28");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012341,
        "dEQP-GLES2.functional.fragment_",
        "ops.interaction.basic_shader.29");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012342,
        "dEQP-GLES2.functional.fragment_",
        "ops.interaction.basic_shader.30");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012343,
        "dEQP-GLES2.functional.fragment_",
        "ops.interaction.basic_shader.31");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012344,
        "dEQP-GLES2.functional.fragment_",
        "ops.interaction.basic_shader.32");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012345,
        "dEQP-GLES2.functional.fragment_",
        "ops.interaction.basic_shader.33");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012346,
        "dEQP-GLES2.functional.fragment_",
        "ops.interaction.basic_shader.34");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012347,
        "dEQP-GLES2.functional.fragment_",
        "ops.interaction.basic_shader.35");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012348,
        "dEQP-GLES2.functional.fragment_",
        "ops.interaction.basic_shader.36");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012349,
        "dEQP-GLES2.functional.fragment_",
        "ops.interaction.basic_shader.37");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012350,
        "dEQP-GLES2.functional.fragment_",
        "ops.interaction.basic_shader.38");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012351,
        "dEQP-GLES2.functional.fragment_",
        "ops.interaction.basic_shader.39");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012352,
        "dEQP-GLES2.functional.fragment_",
        "ops.interaction.basic_shader.40");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012353,
        "dEQP-GLES2.functional.fragment_",
        "ops.interaction.basic_shader.41");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012354,
        "dEQP-GLES2.functional.fragment_",
        "ops.interaction.basic_shader.42");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012355,
        "dEQP-GLES2.functional.fragment_",
        "ops.interaction.basic_shader.43");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012356,
        "dEQP-GLES2.functional.fragment_",
        "ops.interaction.basic_shader.44");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012357,
        "dEQP-GLES2.functional.fragment_",
        "ops.interaction.basic_shader.45");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012358,
        "dEQP-GLES2.functional.fragment_",
        "ops.interaction.basic_shader.46");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012359,
        "dEQP-GLES2.functional.fragment_",
        "ops.interaction.basic_shader.47");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012360,
        "dEQP-GLES2.functional.fragment_",
        "ops.interaction.basic_shader.48");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012361,
        "dEQP-GLES2.functional.fragment_",
        "ops.interaction.basic_shader.49");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012362,
        "dEQP-GLES2.functional.fragment_",
        "ops.interaction.basic_shader.50");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012363,
        "dEQP-GLES2.functional.fragment_",
        "ops.interaction.basic_shader.51");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012364,
        "dEQP-GLES2.functional.fragment_",
        "ops.interaction.basic_shader.52");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012365,
        "dEQP-GLES2.functional.fragment_",
        "ops.interaction.basic_shader.53");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012366,
        "dEQP-GLES2.functional.fragment_",
        "ops.interaction.basic_shader.54");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012367,
        "dEQP-GLES2.functional.fragment_",
        "ops.interaction.basic_shader.55");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012368,
        "dEQP-GLES2.functional.fragment_",
        "ops.interaction.basic_shader.56");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012369,
        "dEQP-GLES2.functional.fragment_",
        "ops.interaction.basic_shader.57");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012370,
        "dEQP-GLES2.functional.fragment_",
        "ops.interaction.basic_shader.58");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012371,
        "dEQP-GLES2.functional.fragment_",
        "ops.interaction.basic_shader.59");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012372,
        "dEQP-GLES2.functional.fragment_",
        "ops.interaction.basic_shader.60");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012373,
        "dEQP-GLES2.functional.fragment_",
        "ops.interaction.basic_shader.61");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012374,
        "dEQP-GLES2.functional.fragment_",
        "ops.interaction.basic_shader.62");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012375,
        "dEQP-GLES2.functional.fragment_",
        "ops.interaction.basic_shader.63");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012376,
        "dEQP-GLES2.functional.fragment_",
        "ops.interaction.basic_shader.64");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012377,
        "dEQP-GLES2.functional.fragment_",
        "ops.interaction.basic_shader.65");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012378,
        "dEQP-GLES2.functional.fragment_",
        "ops.interaction.basic_shader.66");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012379,
        "dEQP-GLES2.functional.fragment_",
        "ops.interaction.basic_shader.67");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012380,
        "dEQP-GLES2.functional.fragment_",
        "ops.interaction.basic_shader.68");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012381,
        "dEQP-GLES2.functional.fragment_",
        "ops.interaction.basic_shader.69");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012382,
        "dEQP-GLES2.functional.fragment_",
        "ops.interaction.basic_shader.70");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012383,
        "dEQP-GLES2.functional.fragment_",
        "ops.interaction.basic_shader.71");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012384,
        "dEQP-GLES2.functional.fragment_",
        "ops.interaction.basic_shader.72");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012385,
        "dEQP-GLES2.functional.fragment_",
        "ops.interaction.basic_shader.73");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012386,
        "dEQP-GLES2.functional.fragment_",
        "ops.interaction.basic_shader.74");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012387,
        "dEQP-GLES2.functional.fragment_",
        "ops.interaction.basic_shader.75");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012388,
        "dEQP-GLES2.functional.fragment_",
        "ops.interaction.basic_shader.76");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012389,
        "dEQP-GLES2.functional.fragment_",
        "ops.interaction.basic_shader.77");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012390,
        "dEQP-GLES2.functional.fragment_",
        "ops.interaction.basic_shader.78");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012391,
        "dEQP-GLES2.functional.fragment_",
        "ops.interaction.basic_shader.79");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012392,
        "dEQP-GLES2.functional.fragment_",
        "ops.interaction.basic_shader.80");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012393,
        "dEQP-GLES2.functional.fragment_",
        "ops.interaction.basic_shader.81");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012394,
        "dEQP-GLES2.functional.fragment_",
        "ops.interaction.basic_shader.82");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012395,
        "dEQP-GLES2.functional.fragment_",
        "ops.interaction.basic_shader.83");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012396,
        "dEQP-GLES2.functional.fragment_",
        "ops.interaction.basic_shader.84");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012397,
        "dEQP-GLES2.functional.fragment_",
        "ops.interaction.basic_shader.85");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012398,
        "dEQP-GLES2.functional.fragment_",
        "ops.interaction.basic_shader.86");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012399,
        "dEQP-GLES2.functional.fragment_",
        "ops.interaction.basic_shader.87");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012400,
        "dEQP-GLES2.functional.fragment_",
        "ops.interaction.basic_shader.88");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012401,
        "dEQP-GLES2.functional.fragment_",
        "ops.interaction.basic_shader.89");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012402,
        "dEQP-GLES2.functional.fragment_",
        "ops.interaction.basic_shader.90");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012403,
        "dEQP-GLES2.functional.fragment_",
        "ops.interaction.basic_shader.91");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012404,
        "dEQP-GLES2.functional.fragment_",
        "ops.interaction.basic_shader.92");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012405,
        "dEQP-GLES2.functional.fragment_",
        "ops.interaction.basic_shader.93");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012406,
        "dEQP-GLES2.functional.fragment_",
        "ops.interaction.basic_shader.94");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012407,
        "dEQP-GLES2.functional.fragment_",
        "ops.interaction.basic_shader.95");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012408,
        "dEQP-GLES2.functional.fragment_",
        "ops.interaction.basic_shader.96");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012409,
        "dEQP-GLES2.functional.fragment_",
        "ops.interaction.basic_shader.97");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012410,
        "dEQP-GLES2.functional.fragment_",
        "ops.interaction.basic_shader.98");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012411,
        "dEQP-GLES2.functional.fragment_",
        "ops.interaction.basic_shader.99");
