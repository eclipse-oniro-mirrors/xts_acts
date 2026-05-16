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
#include "../ActsDeqpgles30039TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038323,
        "dEQP-GLES3.functional",
        ".uniform_api.random.0");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038324,
        "dEQP-GLES3.functional",
        ".uniform_api.random.1");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038325,
        "dEQP-GLES3.functional",
        ".uniform_api.random.2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038326,
        "dEQP-GLES3.functional",
        ".uniform_api.random.3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038327,
        "dEQP-GLES3.functional",
        ".uniform_api.random.4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038328,
        "dEQP-GLES3.functional",
        ".uniform_api.random.5");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038329,
        "dEQP-GLES3.functional",
        ".uniform_api.random.6");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038330,
        "dEQP-GLES3.functional",
        ".uniform_api.random.7");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038331,
        "dEQP-GLES3.functional",
        ".uniform_api.random.8");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038332,
        "dEQP-GLES3.functional",
        ".uniform_api.random.9");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038333,
        "dEQP-GLES3.functional",
        ".uniform_api.random.10");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038334,
        "dEQP-GLES3.functional",
        ".uniform_api.random.11");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038335,
        "dEQP-GLES3.functional",
        ".uniform_api.random.12");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038336,
        "dEQP-GLES3.functional",
        ".uniform_api.random.13");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038337,
        "dEQP-GLES3.functional",
        ".uniform_api.random.14");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038338,
        "dEQP-GLES3.functional",
        ".uniform_api.random.15");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038339,
        "dEQP-GLES3.functional",
        ".uniform_api.random.16");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038340,
        "dEQP-GLES3.functional",
        ".uniform_api.random.17");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038341,
        "dEQP-GLES3.functional",
        ".uniform_api.random.18");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038342,
        "dEQP-GLES3.functional",
        ".uniform_api.random.19");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038343,
        "dEQP-GLES3.functional",
        ".uniform_api.random.20");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038344,
        "dEQP-GLES3.functional",
        ".uniform_api.random.21");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038345,
        "dEQP-GLES3.functional",
        ".uniform_api.random.22");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038346,
        "dEQP-GLES3.functional",
        ".uniform_api.random.24");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038347,
        "dEQP-GLES3.functional",
        ".uniform_api.random.25");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038348,
        "dEQP-GLES3.functional",
        ".uniform_api.random.26");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038349,
        "dEQP-GLES3.functional",
        ".uniform_api.random.27");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038350,
        "dEQP-GLES3.functional",
        ".uniform_api.random.28");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038351,
        "dEQP-GLES3.functional",
        ".uniform_api.random.29");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038352,
        "dEQP-GLES3.functional",
        ".uniform_api.random.30");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038353,
        "dEQP-GLES3.functional",
        ".uniform_api.random.31");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038354,
        "dEQP-GLES3.functional",
        ".uniform_api.random.32");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038355,
        "dEQP-GLES3.functional",
        ".uniform_api.random.33");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038356,
        "dEQP-GLES3.functional",
        ".uniform_api.random.34");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038357,
        "dEQP-GLES3.functional",
        ".uniform_api.random.35");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038358,
        "dEQP-GLES3.functional",
        ".uniform_api.random.36");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038359,
        "dEQP-GLES3.functional",
        ".uniform_api.random.37");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038360,
        "dEQP-GLES3.functional",
        ".uniform_api.random.38");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038361,
        "dEQP-GLES3.functional",
        ".uniform_api.random.39");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038362,
        "dEQP-GLES3.functional",
        ".uniform_api.random.40");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038363,
        "dEQP-GLES3.functional",
        ".uniform_api.random.41");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038364,
        "dEQP-GLES3.functional",
        ".uniform_api.random.42");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038365,
        "dEQP-GLES3.functional",
        ".uniform_api.random.43");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038366,
        "dEQP-GLES3.functional",
        ".uniform_api.random.44");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038367,
        "dEQP-GLES3.functional",
        ".uniform_api.random.45");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038368,
        "dEQP-GLES3.functional",
        ".uniform_api.random.46");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038369,
        "dEQP-GLES3.functional",
        ".uniform_api.random.47");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038370,
        "dEQP-GLES3.functional",
        ".uniform_api.random.48");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038371,
        "dEQP-GLES3.functional",
        ".uniform_api.random.49");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038372,
        "dEQP-GLES3.functional",
        ".uniform_api.random.50");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038373,
        "dEQP-GLES3.functional",
        ".uniform_api.random.51");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038374,
        "dEQP-GLES3.functional",
        ".uniform_api.random.52");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038375,
        "dEQP-GLES3.functional",
        ".uniform_api.random.53");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038376,
        "dEQP-GLES3.functional",
        ".uniform_api.random.54");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038377,
        "dEQP-GLES3.functional",
        ".uniform_api.random.55");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038378,
        "dEQP-GLES3.functional",
        ".uniform_api.random.56");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038379,
        "dEQP-GLES3.functional",
        ".uniform_api.random.57");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038380,
        "dEQP-GLES3.functional",
        ".uniform_api.random.58");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038381,
        "dEQP-GLES3.functional",
        ".uniform_api.random.59");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038382,
        "dEQP-GLES3.functional",
        ".uniform_api.random.60");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038383,
        "dEQP-GLES3.functional",
        ".uniform_api.random.61");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038384,
        "dEQP-GLES3.functional",
        ".uniform_api.random.62");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038385,
        "dEQP-GLES3.functional",
        ".uniform_api.random.63");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038386,
        "dEQP-GLES3.functional",
        ".uniform_api.random.64");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038387,
        "dEQP-GLES3.functional",
        ".uniform_api.random.65");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038388,
        "dEQP-GLES3.functional",
        ".uniform_api.random.66");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038389,
        "dEQP-GLES3.functional",
        ".uniform_api.random.67");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038390,
        "dEQP-GLES3.functional",
        ".uniform_api.random.68");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038391,
        "dEQP-GLES3.functional",
        ".uniform_api.random.69");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038392,
        "dEQP-GLES3.functional",
        ".uniform_api.random.70");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038393,
        "dEQP-GLES3.functional",
        ".uniform_api.random.71");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038394,
        "dEQP-GLES3.functional",
        ".uniform_api.random.72");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038395,
        "dEQP-GLES3.functional",
        ".uniform_api.random.73");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038396,
        "dEQP-GLES3.functional",
        ".uniform_api.random.74");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038397,
        "dEQP-GLES3.functional",
        ".uniform_api.random.75");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038398,
        "dEQP-GLES3.functional",
        ".uniform_api.random.76");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038399,
        "dEQP-GLES3.functional",
        ".uniform_api.random.77");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038400,
        "dEQP-GLES3.functional",
        ".uniform_api.random.78");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038401,
        "dEQP-GLES3.functional",
        ".uniform_api.random.79");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038402,
        "dEQP-GLES3.functional",
        ".uniform_api.random.80");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038403,
        "dEQP-GLES3.functional",
        ".uniform_api.random.81");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038404,
        "dEQP-GLES3.functional",
        ".uniform_api.random.82");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038405,
        "dEQP-GLES3.functional",
        ".uniform_api.random.83");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038406,
        "dEQP-GLES3.functional",
        ".uniform_api.random.84");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038407,
        "dEQP-GLES3.functional",
        ".uniform_api.random.85");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038408,
        "dEQP-GLES3.functional",
        ".uniform_api.random.86");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038409,
        "dEQP-GLES3.functional",
        ".uniform_api.random.87");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038410,
        "dEQP-GLES3.functional",
        ".uniform_api.random.88");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038411,
        "dEQP-GLES3.functional",
        ".uniform_api.random.89");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038412,
        "dEQP-GLES3.functional",
        ".uniform_api.random.90");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038413,
        "dEQP-GLES3.functional",
        ".uniform_api.random.91");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038414,
        "dEQP-GLES3.functional",
        ".uniform_api.random.92");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038415,
        "dEQP-GLES3.functional",
        ".uniform_api.random.93");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038416,
        "dEQP-GLES3.functional",
        ".uniform_api.random.94");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038417,
        "dEQP-GLES3.functional",
        ".uniform_api.random.95");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038418,
        "dEQP-GLES3.functional",
        ".uniform_api.random.96");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038419,
        "dEQP-GLES3.functional",
        ".uniform_api.random.97");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038420,
        "dEQP-GLES3.functional",
        ".uniform_api.random.98");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038421,
        "dEQP-GLES3.functional",
        ".uniform_api.random.99");
