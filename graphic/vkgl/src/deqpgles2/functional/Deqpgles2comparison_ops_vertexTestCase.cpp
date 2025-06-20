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

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009032,
        "dEQP-GLES2.functional.shaders.",
        "random.comparison_ops.vertex.0");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009033,
        "dEQP-GLES2.functional.shaders.",
        "random.comparison_ops.vertex.1");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009034,
        "dEQP-GLES2.functional.shaders.",
        "random.comparison_ops.vertex.2");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009035,
        "dEQP-GLES2.functional.shaders.",
        "random.comparison_ops.vertex.3");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009036,
        "dEQP-GLES2.functional.shaders.",
        "random.comparison_ops.vertex.4");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009037,
        "dEQP-GLES2.functional.shaders.",
        "random.comparison_ops.vertex.5");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009038,
        "dEQP-GLES2.functional.shaders.",
        "random.comparison_ops.vertex.6");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009039,
        "dEQP-GLES2.functional.shaders.",
        "random.comparison_ops.vertex.7");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009040,
        "dEQP-GLES2.functional.shaders.",
        "random.comparison_ops.vertex.8");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009041,
        "dEQP-GLES2.functional.shaders.",
        "random.comparison_ops.vertex.9");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009042,
        "dEQP-GLES2.functional.shaders.",
        "random.comparison_ops.vertex.10");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009043,
        "dEQP-GLES2.functional.shaders.",
        "random.comparison_ops.vertex.11");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009044,
        "dEQP-GLES2.functional.shaders.",
        "random.comparison_ops.vertex.12");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009045,
        "dEQP-GLES2.functional.shaders.",
        "random.comparison_ops.vertex.13");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009046,
        "dEQP-GLES2.functional.shaders.",
        "random.comparison_ops.vertex.14");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009047,
        "dEQP-GLES2.functional.shaders.",
        "random.comparison_ops.vertex.15");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009048,
        "dEQP-GLES2.functional.shaders.",
        "random.comparison_ops.vertex.16");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009049,
        "dEQP-GLES2.functional.shaders.",
        "random.comparison_ops.vertex.17");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009050,
        "dEQP-GLES2.functional.shaders.",
        "random.comparison_ops.vertex.18");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009051,
        "dEQP-GLES2.functional.shaders.",
        "random.comparison_ops.vertex.19");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009052,
        "dEQP-GLES2.functional.shaders.",
        "random.comparison_ops.vertex.20");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009053,
        "dEQP-GLES2.functional.shaders.",
        "random.comparison_ops.vertex.21");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009054,
        "dEQP-GLES2.functional.shaders.",
        "random.comparison_ops.vertex.22");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009055,
        "dEQP-GLES2.functional.shaders.",
        "random.comparison_ops.vertex.23");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009056,
        "dEQP-GLES2.functional.shaders.",
        "random.comparison_ops.vertex.24");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009057,
        "dEQP-GLES2.functional.shaders.",
        "random.comparison_ops.vertex.25");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009058,
        "dEQP-GLES2.functional.shaders.",
        "random.comparison_ops.vertex.26");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009059,
        "dEQP-GLES2.functional.shaders.",
        "random.comparison_ops.vertex.27");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009060,
        "dEQP-GLES2.functional.shaders.",
        "random.comparison_ops.vertex.28");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009061,
        "dEQP-GLES2.functional.shaders.",
        "random.comparison_ops.vertex.29");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009062,
        "dEQP-GLES2.functional.shaders.",
        "random.comparison_ops.vertex.30");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009063,
        "dEQP-GLES2.functional.shaders.",
        "random.comparison_ops.vertex.31");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009064,
        "dEQP-GLES2.functional.shaders.",
        "random.comparison_ops.vertex.32");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009065,
        "dEQP-GLES2.functional.shaders.",
        "random.comparison_ops.vertex.33");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009066,
        "dEQP-GLES2.functional.shaders.",
        "random.comparison_ops.vertex.34");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009067,
        "dEQP-GLES2.functional.shaders.",
        "random.comparison_ops.vertex.35");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009068,
        "dEQP-GLES2.functional.shaders.",
        "random.comparison_ops.vertex.36");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009069,
        "dEQP-GLES2.functional.shaders.",
        "random.comparison_ops.vertex.37");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009070,
        "dEQP-GLES2.functional.shaders.",
        "random.comparison_ops.vertex.38");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009071,
        "dEQP-GLES2.functional.shaders.",
        "random.comparison_ops.vertex.39");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009072,
        "dEQP-GLES2.functional.shaders.",
        "random.comparison_ops.vertex.40");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009073,
        "dEQP-GLES2.functional.shaders.",
        "random.comparison_ops.vertex.41");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009074,
        "dEQP-GLES2.functional.shaders.",
        "random.comparison_ops.vertex.42");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009075,
        "dEQP-GLES2.functional.shaders.",
        "random.comparison_ops.vertex.43");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009076,
        "dEQP-GLES2.functional.shaders.",
        "random.comparison_ops.vertex.44");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009077,
        "dEQP-GLES2.functional.shaders.",
        "random.comparison_ops.vertex.45");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009078,
        "dEQP-GLES2.functional.shaders.",
        "random.comparison_ops.vertex.46");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009079,
        "dEQP-GLES2.functional.shaders.",
        "random.comparison_ops.vertex.47");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009080,
        "dEQP-GLES2.functional.shaders.",
        "random.comparison_ops.vertex.48");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009081,
        "dEQP-GLES2.functional.shaders.",
        "random.comparison_ops.vertex.49");
