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

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009832,
        "dEQP-GLES2.functional.shad",
        "ers.random.texture.vertex.0");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009833,
        "dEQP-GLES2.functional.shad",
        "ers.random.texture.vertex.1");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009834,
        "dEQP-GLES2.functional.shad",
        "ers.random.texture.vertex.2");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009835,
        "dEQP-GLES2.functional.shad",
        "ers.random.texture.vertex.3");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009836,
        "dEQP-GLES2.functional.shad",
        "ers.random.texture.vertex.4");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009837,
        "dEQP-GLES2.functional.shad",
        "ers.random.texture.vertex.5");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009838,
        "dEQP-GLES2.functional.shad",
        "ers.random.texture.vertex.6");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009839,
        "dEQP-GLES2.functional.shad",
        "ers.random.texture.vertex.7");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009840,
        "dEQP-GLES2.functional.shad",
        "ers.random.texture.vertex.8");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009841,
        "dEQP-GLES2.functional.shad",
        "ers.random.texture.vertex.9");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009842,
        "dEQP-GLES2.functional.shade",
        "rs.random.texture.vertex.10");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009843,
        "dEQP-GLES2.functional.shade",
        "rs.random.texture.vertex.11");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009844,
        "dEQP-GLES2.functional.shade",
        "rs.random.texture.vertex.12");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009845,
        "dEQP-GLES2.functional.shade",
        "rs.random.texture.vertex.13");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009846,
        "dEQP-GLES2.functional.shade",
        "rs.random.texture.vertex.14");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009847,
        "dEQP-GLES2.functional.shade",
        "rs.random.texture.vertex.15");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009848,
        "dEQP-GLES2.functional.shade",
        "rs.random.texture.vertex.16");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009849,
        "dEQP-GLES2.functional.shade",
        "rs.random.texture.vertex.17");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009850,
        "dEQP-GLES2.functional.shade",
        "rs.random.texture.vertex.18");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009851,
        "dEQP-GLES2.functional.shade",
        "rs.random.texture.vertex.19");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009852,
        "dEQP-GLES2.functional.shade",
        "rs.random.texture.vertex.20");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009853,
        "dEQP-GLES2.functional.shade",
        "rs.random.texture.vertex.21");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009854,
        "dEQP-GLES2.functional.shade",
        "rs.random.texture.vertex.22");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009855,
        "dEQP-GLES2.functional.shade",
        "rs.random.texture.vertex.23");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009856,
        "dEQP-GLES2.functional.shade",
        "rs.random.texture.vertex.24");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009857,
        "dEQP-GLES2.functional.shade",
        "rs.random.texture.vertex.25");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009858,
        "dEQP-GLES2.functional.shade",
        "rs.random.texture.vertex.26");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009859,
        "dEQP-GLES2.functional.shade",
        "rs.random.texture.vertex.27");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009860,
        "dEQP-GLES2.functional.shade",
        "rs.random.texture.vertex.28");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009861,
        "dEQP-GLES2.functional.shade",
        "rs.random.texture.vertex.29");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009862,
        "dEQP-GLES2.functional.shade",
        "rs.random.texture.vertex.30");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009863,
        "dEQP-GLES2.functional.shade",
        "rs.random.texture.vertex.31");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009864,
        "dEQP-GLES2.functional.shade",
        "rs.random.texture.vertex.32");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009865,
        "dEQP-GLES2.functional.shade",
        "rs.random.texture.vertex.33");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009866,
        "dEQP-GLES2.functional.shade",
        "rs.random.texture.vertex.34");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009867,
        "dEQP-GLES2.functional.shade",
        "rs.random.texture.vertex.35");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009868,
        "dEQP-GLES2.functional.shade",
        "rs.random.texture.vertex.36");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009869,
        "dEQP-GLES2.functional.shade",
        "rs.random.texture.vertex.37");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009870,
        "dEQP-GLES2.functional.shade",
        "rs.random.texture.vertex.38");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009871,
        "dEQP-GLES2.functional.shade",
        "rs.random.texture.vertex.39");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009872,
        "dEQP-GLES2.functional.shade",
        "rs.random.texture.vertex.40");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009873,
        "dEQP-GLES2.functional.shade",
        "rs.random.texture.vertex.41");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009874,
        "dEQP-GLES2.functional.shade",
        "rs.random.texture.vertex.42");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009875,
        "dEQP-GLES2.functional.shade",
        "rs.random.texture.vertex.43");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009876,
        "dEQP-GLES2.functional.shade",
        "rs.random.texture.vertex.44");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009877,
        "dEQP-GLES2.functional.shade",
        "rs.random.texture.vertex.45");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009878,
        "dEQP-GLES2.functional.shade",
        "rs.random.texture.vertex.46");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009879,
        "dEQP-GLES2.functional.shade",
        "rs.random.texture.vertex.47");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009880,
        "dEQP-GLES2.functional.shade",
        "rs.random.texture.vertex.48");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009881,
        "dEQP-GLES2.functional.shade",
        "rs.random.texture.vertex.49");
