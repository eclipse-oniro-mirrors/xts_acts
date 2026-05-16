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

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013917,
        "dEQP-GLES2.functional.rasterizatio",
        "n.interpolation.projected.triangles");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013918,
        "dEQP-GLES2.functional.rasterization.i",
        "nterpolation.projected.triangle_strip");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013919,
        "dEQP-GLES2.functional.rasterization.",
        "interpolation.projected.triangle_fan");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013920,
        "dEQP-GLES2.functional.rasterizat",
        "ion.interpolation.projected.lines");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013921,
        "dEQP-GLES2.functional.rasterization",
        ".interpolation.projected.line_strip");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013922,
        "dEQP-GLES2.functional.rasterizatio",
        "n.interpolation.projected.line_loop");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013923,
        "dEQP-GLES2.functional.rasterization",
        ".interpolation.projected.lines_wide");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013924,
        "dEQP-GLES2.functional.rasterization.i",
        "nterpolation.projected.line_strip_wide");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013925,
        "dEQP-GLES2.functional.rasterization.i",
        "nterpolation.projected.line_loop_wide");
