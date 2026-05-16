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
#include "../ActsDeqpgles20014TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013890,
        "dEQP-GLES2.functional.rasteri",
        "zation.culling.front_triangles");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013891,
        "dEQP-GLES2.functional.rasterizati",
        "on.culling.front_triangles_reverse");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013892,
        "dEQP-GLES2.functional.rasterizat",
        "ion.culling.front_triangle_strip");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013893,
        "dEQP-GLES2.functional.rasterization.",
        "culling.front_triangle_strip_reverse");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013894,
        "dEQP-GLES2.functional.rasteriza",
        "tion.culling.front_triangle_fan");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013895,
        "dEQP-GLES2.functional.rasterization",
        ".culling.front_triangle_fan_reverse");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013896,
        "dEQP-GLES2.functional.rasteri",
        "zation.culling.back_triangles");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013897,
        "dEQP-GLES2.functional.rasterizati",
        "on.culling.back_triangles_reverse");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013898,
        "dEQP-GLES2.functional.rasteriza",
        "tion.culling.back_triangle_strip");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013899,
        "dEQP-GLES2.functional.rasterization",
        ".culling.back_triangle_strip_reverse");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013900,
        "dEQP-GLES2.functional.rasteriz",
        "ation.culling.back_triangle_fan");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013901,
        "dEQP-GLES2.functional.rasterizatio",
        "n.culling.back_triangle_fan_reverse");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013902,
        "dEQP-GLES2.functional.rasteri",
        "zation.culling.both_triangles");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013903,
        "dEQP-GLES2.functional.rasterizati",
        "on.culling.both_triangles_reverse");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013904,
        "dEQP-GLES2.functional.rasteriza",
        "tion.culling.both_triangle_strip");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013905,
        "dEQP-GLES2.functional.rasterization",
        ".culling.both_triangle_strip_reverse");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013906,
        "dEQP-GLES2.functional.rasteriz",
        "ation.culling.both_triangle_fan");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013907,
        "dEQP-GLES2.functional.rasterizatio",
        "n.culling.both_triangle_fan_reverse");
