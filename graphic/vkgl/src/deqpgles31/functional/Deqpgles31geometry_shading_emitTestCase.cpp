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
#include "../Deqpgles31BaseFunc.h"
#include "../ActsDeqpgles310017TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016350,
        "dEQP-GLES31.functional.geometry_",
        "shading.emit.points_emit_0_end_0");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016351,
        "dEQP-GLES31.functional.geometry_",
        "shading.emit.points_emit_0_end_1");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016352,
        "dEQP-GLES31.functional.geometry_",
        "shading.emit.points_emit_1_end_1");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016353,
        "dEQP-GLES31.functional.geometry_",
        "shading.emit.points_emit_0_end_2");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016354,
        "dEQP-GLES31.functional.geometry_",
        "shading.emit.points_emit_1_end_2");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016355,
        "dEQP-GLES31.functional.geometry_sh",
        "ading.emit.line_strip_emit_0_end_0");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016356,
        "dEQP-GLES31.functional.geometry_sh",
        "ading.emit.line_strip_emit_0_end_1");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016357,
        "dEQP-GLES31.functional.geometry_sh",
        "ading.emit.line_strip_emit_1_end_1");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016358,
        "dEQP-GLES31.functional.geometry_sh",
        "ading.emit.line_strip_emit_2_end_1");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016359,
        "dEQP-GLES31.functional.geometry_sh",
        "ading.emit.line_strip_emit_0_end_2");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016360,
        "dEQP-GLES31.functional.geometry_sh",
        "ading.emit.line_strip_emit_1_end_2");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016361,
        "dEQP-GLES31.functional.geometry_sh",
        "ading.emit.line_strip_emit_2_end_2");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016362,
        "dEQP-GLES31.functional.geometry_shading.",
        "emit.line_strip_emit_2_end_2_emit_2_end_0");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016363,
        "dEQP-GLES31.functional.geometry_shad",
        "ing.emit.triangle_strip_emit_0_end_0");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016364,
        "dEQP-GLES31.functional.geometry_shad",
        "ing.emit.triangle_strip_emit_0_end_1");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016365,
        "dEQP-GLES31.functional.geometry_shad",
        "ing.emit.triangle_strip_emit_1_end_1");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016366,
        "dEQP-GLES31.functional.geometry_shad",
        "ing.emit.triangle_strip_emit_2_end_1");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016367,
        "dEQP-GLES31.functional.geometry_shad",
        "ing.emit.triangle_strip_emit_3_end_1");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016368,
        "dEQP-GLES31.functional.geometry_shad",
        "ing.emit.triangle_strip_emit_0_end_2");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016369,
        "dEQP-GLES31.functional.geometry_shad",
        "ing.emit.triangle_strip_emit_1_end_2");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016370,
        "dEQP-GLES31.functional.geometry_shad",
        "ing.emit.triangle_strip_emit_2_end_2");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016371,
        "dEQP-GLES31.functional.geometry_shad",
        "ing.emit.triangle_strip_emit_3_end_2");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016372,
        "dEQP-GLES31.functional.geometry_shading.em",
        "it.triangle_strip_emit_3_end_2_emit_3_end_0");
