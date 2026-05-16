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

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039756,
        "dEQP-GLES3.functional.raster",
        "ization.primitives.triangles");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039757,
        "dEQP-GLES3.functional.rasteriz",
        "ation.primitives.triangle_strip");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039758,
        "dEQP-GLES3.functional.rasteri",
        "zation.primitives.triangle_fan");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039759,
        "dEQP-GLES3.functional.rast",
        "erization.primitives.lines");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039760,
        "dEQP-GLES3.functional.raster",
        "ization.primitives.line_strip");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039761,
        "dEQP-GLES3.functional.raster",
        "ization.primitives.line_loop");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039762,
        "dEQP-GLES3.functional.raster",
        "ization.primitives.lines_wide");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039763,
        "dEQP-GLES3.functional.rasteriza",
        "tion.primitives.line_strip_wide");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039764,
        "dEQP-GLES3.functional.rasteriz",
        "ation.primitives.line_loop_wide");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039765,
        "dEQP-GLES3.functional.rast",
        "erization.primitives.points");
