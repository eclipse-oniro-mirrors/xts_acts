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

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039789,
        "dEQP-GLES3.functional.rasterizat",
        "ion.interpolation.basic.triangles");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039790,
        "dEQP-GLES3.functional.rasterization",
        ".interpolation.basic.triangle_strip");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039791,
        "dEQP-GLES3.functional.rasterizatio",
        "n.interpolation.basic.triangle_fan");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039792,
        "dEQP-GLES3.functional.rasteriz",
        "ation.interpolation.basic.lines");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039793,
        "dEQP-GLES3.functional.rasterizati",
        "on.interpolation.basic.line_strip");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039794,
        "dEQP-GLES3.functional.rasterizat",
        "ion.interpolation.basic.line_loop");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039795,
        "dEQP-GLES3.functional.rasterizati",
        "on.interpolation.basic.lines_wide");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039796,
        "dEQP-GLES3.functional.rasterization",
        ".interpolation.basic.line_strip_wide");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039797,
        "dEQP-GLES3.functional.rasterization",
        ".interpolation.basic.line_loop_wide");
