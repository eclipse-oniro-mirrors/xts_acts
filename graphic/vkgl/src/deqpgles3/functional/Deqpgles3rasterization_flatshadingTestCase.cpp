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

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039807,
        "dEQP-GLES3.functional.raster",
        "ization.flatshading.triangles");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039808,
        "dEQP-GLES3.functional.rasteriza",
        "tion.flatshading.triangle_strip");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039809,
        "dEQP-GLES3.functional.rasteriz",
        "ation.flatshading.triangle_fan");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039810,
        "dEQP-GLES3.functional.rast",
        "erization.flatshading.lines");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039811,
        "dEQP-GLES3.functional.rasteri",
        "zation.flatshading.line_strip");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039812,
        "dEQP-GLES3.functional.raster",
        "ization.flatshading.line_loop");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039813,
        "dEQP-GLES3.functional.rasteri",
        "zation.flatshading.lines_wide");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039814,
        "dEQP-GLES3.functional.rasteriza",
        "tion.flatshading.line_strip_wide");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039815,
        "dEQP-GLES3.functional.rasteriza",
        "tion.flatshading.line_loop_wide");
