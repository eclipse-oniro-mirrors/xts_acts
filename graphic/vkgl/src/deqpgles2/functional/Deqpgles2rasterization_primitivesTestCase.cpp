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

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013874,
        "dEQP-GLES2.functional.raster",
        "ization.primitives.triangles");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013875,
        "dEQP-GLES2.functional.rasteriz",
        "ation.primitives.triangle_strip");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013876,
        "dEQP-GLES2.functional.rasteri",
        "zation.primitives.triangle_fan");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013877,
        "dEQP-GLES2.functional.rast",
        "erization.primitives.lines");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013878,
        "dEQP-GLES2.functional.raster",
        "ization.primitives.line_strip");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013879,
        "dEQP-GLES2.functional.raster",
        "ization.primitives.line_loop");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013880,
        "dEQP-GLES2.functional.raster",
        "ization.primitives.lines_wide");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013881,
        "dEQP-GLES2.functional.rasteriza",
        "tion.primitives.line_strip_wide");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013882,
        "dEQP-GLES2.functional.rasteriz",
        "ation.primitives.line_loop_wide");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013883,
        "dEQP-GLES2.functional.rast",
        "erization.primitives.points");
