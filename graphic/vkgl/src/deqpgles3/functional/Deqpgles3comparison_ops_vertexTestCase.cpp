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

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020694,
        "dEQP-GLES3.functional.shaders.",
        "random.comparison_ops.vertex.0");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020695,
        "dEQP-GLES3.functional.shaders.",
        "random.comparison_ops.vertex.1");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020696,
        "dEQP-GLES3.functional.shaders.",
        "random.comparison_ops.vertex.2");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020697,
        "dEQP-GLES3.functional.shaders.",
        "random.comparison_ops.vertex.3");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020698,
        "dEQP-GLES3.functional.shaders.",
        "random.comparison_ops.vertex.4");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020699,
        "dEQP-GLES3.functional.shaders.",
        "random.comparison_ops.vertex.5");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020700,
        "dEQP-GLES3.functional.shaders.",
        "random.comparison_ops.vertex.6");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020701,
        "dEQP-GLES3.functional.shaders.",
        "random.comparison_ops.vertex.7");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020702,
        "dEQP-GLES3.functional.shaders.",
        "random.comparison_ops.vertex.8");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020703,
        "dEQP-GLES3.functional.shaders.",
        "random.comparison_ops.vertex.9");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020704,
        "dEQP-GLES3.functional.shaders.",
        "random.comparison_ops.vertex.10");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020705,
        "dEQP-GLES3.functional.shaders.",
        "random.comparison_ops.vertex.11");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020706,
        "dEQP-GLES3.functional.shaders.",
        "random.comparison_ops.vertex.12");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020707,
        "dEQP-GLES3.functional.shaders.",
        "random.comparison_ops.vertex.13");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020708,
        "dEQP-GLES3.functional.shaders.",
        "random.comparison_ops.vertex.14");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020709,
        "dEQP-GLES3.functional.shaders.",
        "random.comparison_ops.vertex.15");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020710,
        "dEQP-GLES3.functional.shaders.",
        "random.comparison_ops.vertex.16");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020711,
        "dEQP-GLES3.functional.shaders.",
        "random.comparison_ops.vertex.17");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020712,
        "dEQP-GLES3.functional.shaders.",
        "random.comparison_ops.vertex.18");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020713,
        "dEQP-GLES3.functional.shaders.",
        "random.comparison_ops.vertex.19");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020714,
        "dEQP-GLES3.functional.shaders.",
        "random.comparison_ops.vertex.20");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020715,
        "dEQP-GLES3.functional.shaders.",
        "random.comparison_ops.vertex.21");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020716,
        "dEQP-GLES3.functional.shaders.",
        "random.comparison_ops.vertex.22");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020717,
        "dEQP-GLES3.functional.shaders.",
        "random.comparison_ops.vertex.23");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020718,
        "dEQP-GLES3.functional.shaders.",
        "random.comparison_ops.vertex.24");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020719,
        "dEQP-GLES3.functional.shaders.",
        "random.comparison_ops.vertex.25");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020720,
        "dEQP-GLES3.functional.shaders.",
        "random.comparison_ops.vertex.26");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020721,
        "dEQP-GLES3.functional.shaders.",
        "random.comparison_ops.vertex.27");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020722,
        "dEQP-GLES3.functional.shaders.",
        "random.comparison_ops.vertex.28");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020723,
        "dEQP-GLES3.functional.shaders.",
        "random.comparison_ops.vertex.29");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020724,
        "dEQP-GLES3.functional.shaders.",
        "random.comparison_ops.vertex.30");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020725,
        "dEQP-GLES3.functional.shaders.",
        "random.comparison_ops.vertex.31");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020726,
        "dEQP-GLES3.functional.shaders.",
        "random.comparison_ops.vertex.32");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020727,
        "dEQP-GLES3.functional.shaders.",
        "random.comparison_ops.vertex.33");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020728,
        "dEQP-GLES3.functional.shaders.",
        "random.comparison_ops.vertex.34");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020729,
        "dEQP-GLES3.functional.shaders.",
        "random.comparison_ops.vertex.35");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020730,
        "dEQP-GLES3.functional.shaders.",
        "random.comparison_ops.vertex.36");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020731,
        "dEQP-GLES3.functional.shaders.",
        "random.comparison_ops.vertex.37");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020732,
        "dEQP-GLES3.functional.shaders.",
        "random.comparison_ops.vertex.38");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020733,
        "dEQP-GLES3.functional.shaders.",
        "random.comparison_ops.vertex.39");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020734,
        "dEQP-GLES3.functional.shaders.",
        "random.comparison_ops.vertex.40");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020735,
        "dEQP-GLES3.functional.shaders.",
        "random.comparison_ops.vertex.41");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020736,
        "dEQP-GLES3.functional.shaders.",
        "random.comparison_ops.vertex.42");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020737,
        "dEQP-GLES3.functional.shaders.",
        "random.comparison_ops.vertex.43");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020738,
        "dEQP-GLES3.functional.shaders.",
        "random.comparison_ops.vertex.44");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020739,
        "dEQP-GLES3.functional.shaders.",
        "random.comparison_ops.vertex.45");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020740,
        "dEQP-GLES3.functional.shaders.",
        "random.comparison_ops.vertex.46");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020741,
        "dEQP-GLES3.functional.shaders.",
        "random.comparison_ops.vertex.47");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020742,
        "dEQP-GLES3.functional.shaders.",
        "random.comparison_ops.vertex.48");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020743,
        "dEQP-GLES3.functional.shaders.",
        "random.comparison_ops.vertex.49");
