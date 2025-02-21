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

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041682,
        "dEQP-GLES3.functional.transform_feedback.in",
        "terpolation.smooth.lowp_vec4_points_separate");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041683,
        "dEQP-GLES3.functional.transform_feedback.inte",
        "rpolation.smooth.lowp_vec4_points_interleaved");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041684,
        "dEQP-GLES3.functional.transform_feedback.in",
        "terpolation.smooth.lowp_vec4_lines_separate");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041685,
        "dEQP-GLES3.functional.transform_feedback.int",
        "erpolation.smooth.lowp_vec4_lines_interleaved");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041686,
        "dEQP-GLES3.functional.transform_feedback.inte",
        "rpolation.smooth.lowp_vec4_triangles_separate");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041687,
        "dEQP-GLES3.functional.transform_feedback.inter",
        "polation.smooth.lowp_vec4_triangles_interleaved");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041688,
        "dEQP-GLES3.functional.transform_feedback.inte",
        "rpolation.smooth.mediump_vec4_points_separate");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041689,
        "dEQP-GLES3.functional.transform_feedback.inter",
        "polation.smooth.mediump_vec4_points_interleaved");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041690,
        "dEQP-GLES3.functional.transform_feedback.int",
        "erpolation.smooth.mediump_vec4_lines_separate");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041691,
        "dEQP-GLES3.functional.transform_feedback.inter",
        "polation.smooth.mediump_vec4_lines_interleaved");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041692,
        "dEQP-GLES3.functional.transform_feedback.inter",
        "polation.smooth.mediump_vec4_triangles_separate");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041693,
        "dEQP-GLES3.functional.transform_feedback.interpo",
        "lation.smooth.mediump_vec4_triangles_interleaved");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041694,
        "dEQP-GLES3.functional.transform_feedback.int",
        "erpolation.smooth.highp_vec4_points_separate");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041695,
        "dEQP-GLES3.functional.transform_feedback.inte",
        "rpolation.smooth.highp_vec4_points_interleaved");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041696,
        "dEQP-GLES3.functional.transform_feedback.in",
        "terpolation.smooth.highp_vec4_lines_separate");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041697,
        "dEQP-GLES3.functional.transform_feedback.inte",
        "rpolation.smooth.highp_vec4_lines_interleaved");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041698,
        "dEQP-GLES3.functional.transform_feedback.inte",
        "rpolation.smooth.highp_vec4_triangles_separate");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041699,
        "dEQP-GLES3.functional.transform_feedback.interp",
        "olation.smooth.highp_vec4_triangles_interleaved");
