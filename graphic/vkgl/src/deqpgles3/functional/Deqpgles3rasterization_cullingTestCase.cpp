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
#include "../ActsDeqpgles30040TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039771,
        "dEQP-GLES3.functional.rasteri",
        "zation.culling.front_triangles");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039772,
        "dEQP-GLES3.functional.rasterizati",
        "on.culling.front_triangles_reverse");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039773,
        "dEQP-GLES3.functional.rasterizat",
        "ion.culling.front_triangle_strip");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039774,
        "dEQP-GLES3.functional.rasterization.",
        "culling.front_triangle_strip_reverse");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039775,
        "dEQP-GLES3.functional.rasteriza",
        "tion.culling.front_triangle_fan");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039776,
        "dEQP-GLES3.functional.rasterization",
        ".culling.front_triangle_fan_reverse");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039777,
        "dEQP-GLES3.functional.rasteri",
        "zation.culling.back_triangles");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039778,
        "dEQP-GLES3.functional.rasterizati",
        "on.culling.back_triangles_reverse");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039779,
        "dEQP-GLES3.functional.rasteriza",
        "tion.culling.back_triangle_strip");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039780,
        "dEQP-GLES3.functional.rasterization",
        ".culling.back_triangle_strip_reverse");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039781,
        "dEQP-GLES3.functional.rasteriz",
        "ation.culling.back_triangle_fan");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039782,
        "dEQP-GLES3.functional.rasterizatio",
        "n.culling.back_triangle_fan_reverse");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039783,
        "dEQP-GLES3.functional.rasteri",
        "zation.culling.both_triangles");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039784,
        "dEQP-GLES3.functional.rasterizati",
        "on.culling.both_triangles_reverse");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039785,
        "dEQP-GLES3.functional.rasteriza",
        "tion.culling.both_triangle_strip");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039786,
        "dEQP-GLES3.functional.rasterization",
        ".culling.both_triangle_strip_reverse");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039787,
        "dEQP-GLES3.functional.rasteriz",
        "ation.culling.both_triangle_fan");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039788,
        "dEQP-GLES3.functional.rasterizatio",
        "n.culling.both_triangle_fan_reverse");
