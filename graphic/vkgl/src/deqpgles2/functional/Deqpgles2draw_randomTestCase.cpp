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
#include "../ActsDeqpgles20017TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016361,
        "dEQP-GLES2.functi",
        "onal.draw.random.0");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016362,
        "dEQP-GLES2.functi",
        "onal.draw.random.1");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016363,
        "dEQP-GLES2.functi",
        "onal.draw.random.2");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016364,
        "dEQP-GLES2.functi",
        "onal.draw.random.3");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016365,
        "dEQP-GLES2.functi",
        "onal.draw.random.6");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016366,
        "dEQP-GLES2.functi",
        "onal.draw.random.8");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016367,
        "dEQP-GLES2.functi",
        "onal.draw.random.9");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016368,
        "dEQP-GLES2.functio",
        "nal.draw.random.10");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016369,
        "dEQP-GLES2.functio",
        "nal.draw.random.12");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016370,
        "dEQP-GLES2.functio",
        "nal.draw.random.14");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016371,
        "dEQP-GLES2.functio",
        "nal.draw.random.16");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016372,
        "dEQP-GLES2.functio",
        "nal.draw.random.17");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016373,
        "dEQP-GLES2.functio",
        "nal.draw.random.18");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016374,
        "dEQP-GLES2.functio",
        "nal.draw.random.20");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016375,
        "dEQP-GLES2.functio",
        "nal.draw.random.21");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016376,
        "dEQP-GLES2.functio",
        "nal.draw.random.25");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016377,
        "dEQP-GLES2.functio",
        "nal.draw.random.26");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016378,
        "dEQP-GLES2.functio",
        "nal.draw.random.28");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016379,
        "dEQP-GLES2.functio",
        "nal.draw.random.30");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016380,
        "dEQP-GLES2.functio",
        "nal.draw.random.31");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016381,
        "dEQP-GLES2.functio",
        "nal.draw.random.32");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016382,
        "dEQP-GLES2.functio",
        "nal.draw.random.33");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016383,
        "dEQP-GLES2.functio",
        "nal.draw.random.34");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016384,
        "dEQP-GLES2.functio",
        "nal.draw.random.36");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016385,
        "dEQP-GLES2.functio",
        "nal.draw.random.37");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016386,
        "dEQP-GLES2.functio",
        "nal.draw.random.38");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016387,
        "dEQP-GLES2.functio",
        "nal.draw.random.39");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016388,
        "dEQP-GLES2.functio",
        "nal.draw.random.40");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016389,
        "dEQP-GLES2.functio",
        "nal.draw.random.41");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016390,
        "dEQP-GLES2.functio",
        "nal.draw.random.42");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016391,
        "dEQP-GLES2.functio",
        "nal.draw.random.43");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016392,
        "dEQP-GLES2.functio",
        "nal.draw.random.44");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016393,
        "dEQP-GLES2.functio",
        "nal.draw.random.45");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016394,
        "dEQP-GLES2.functio",
        "nal.draw.random.46");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016395,
        "dEQP-GLES2.functio",
        "nal.draw.random.47");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016396,
        "dEQP-GLES2.functio",
        "nal.draw.random.48");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016397,
        "dEQP-GLES2.functio",
        "nal.draw.random.49");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016398,
        "dEQP-GLES2.functio",
        "nal.draw.random.50");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016399,
        "dEQP-GLES2.functio",
        "nal.draw.random.51");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016400,
        "dEQP-GLES2.functio",
        "nal.draw.random.52");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016401,
        "dEQP-GLES2.functio",
        "nal.draw.random.56");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016402,
        "dEQP-GLES2.functio",
        "nal.draw.random.58");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016403,
        "dEQP-GLES2.functio",
        "nal.draw.random.59");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016404,
        "dEQP-GLES2.functio",
        "nal.draw.random.61");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016405,
        "dEQP-GLES2.functio",
        "nal.draw.random.62");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016406,
        "dEQP-GLES2.functio",
        "nal.draw.random.63");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016407,
        "dEQP-GLES2.functio",
        "nal.draw.random.65");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016408,
        "dEQP-GLES2.functio",
        "nal.draw.random.67");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016409,
        "dEQP-GLES2.functio",
        "nal.draw.random.69");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016410,
        "dEQP-GLES2.functio",
        "nal.draw.random.70");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016411,
        "dEQP-GLES2.functio",
        "nal.draw.random.71");
