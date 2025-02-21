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
#include "../ActsDeqpgles30042TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041700,
        "dEQP-GLES3.functional.transform_feedback.i",
        "nterpolation.flat.lowp_vec4_points_separate");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041701,
        "dEQP-GLES3.functional.transform_feedback.int",
        "erpolation.flat.lowp_vec4_points_interleaved");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041702,
        "dEQP-GLES3.functional.transform_feedback.i",
        "nterpolation.flat.lowp_vec4_lines_separate");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041703,
        "dEQP-GLES3.functional.transform_feedback.in",
        "terpolation.flat.lowp_vec4_lines_interleaved");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041704,
        "dEQP-GLES3.functional.transform_feedback.int",
        "erpolation.flat.lowp_vec4_triangles_separate");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041705,
        "dEQP-GLES3.functional.transform_feedback.inte",
        "rpolation.flat.lowp_vec4_triangles_interleaved");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041706,
        "dEQP-GLES3.functional.transform_feedback.int",
        "erpolation.flat.mediump_vec4_points_separate");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041707,
        "dEQP-GLES3.functional.transform_feedback.inte",
        "rpolation.flat.mediump_vec4_points_interleaved");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041708,
        "dEQP-GLES3.functional.transform_feedback.in",
        "terpolation.flat.mediump_vec4_lines_separate");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041709,
        "dEQP-GLES3.functional.transform_feedback.inte",
        "rpolation.flat.mediump_vec4_lines_interleaved");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041710,
        "dEQP-GLES3.functional.transform_feedback.inte",
        "rpolation.flat.mediump_vec4_triangles_separate");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041711,
        "dEQP-GLES3.functional.transform_feedback.interp",
        "olation.flat.mediump_vec4_triangles_interleaved");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041712,
        "dEQP-GLES3.functional.transform_feedback.in",
        "terpolation.flat.highp_vec4_points_separate");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041713,
        "dEQP-GLES3.functional.transform_feedback.int",
        "erpolation.flat.highp_vec4_points_interleaved");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041714,
        "dEQP-GLES3.functional.transform_feedback.i",
        "nterpolation.flat.highp_vec4_lines_separate");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041715,
        "dEQP-GLES3.functional.transform_feedback.int",
        "erpolation.flat.highp_vec4_lines_interleaved");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041716,
        "dEQP-GLES3.functional.transform_feedback.int",
        "erpolation.flat.highp_vec4_triangles_separate");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041717,
        "dEQP-GLES3.functional.transform_feedback.inter",
        "polation.flat.highp_vec4_triangles_interleaved");
