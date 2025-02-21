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

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041718,
        "dEQP-GLES3.functional.transform_feedback.int",
        "erpolation.centroid.lowp_vec4_points_separate");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041719,
        "dEQP-GLES3.functional.transform_feedback.inter",
        "polation.centroid.lowp_vec4_points_interleaved");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041720,
        "dEQP-GLES3.functional.transform_feedback.int",
        "erpolation.centroid.lowp_vec4_lines_separate");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041721,
        "dEQP-GLES3.functional.transform_feedback.inte",
        "rpolation.centroid.lowp_vec4_lines_interleaved");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041722,
        "dEQP-GLES3.functional.transform_feedback.inter",
        "polation.centroid.lowp_vec4_triangles_separate");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041723,
        "dEQP-GLES3.functional.transform_feedback.interp",
        "olation.centroid.lowp_vec4_triangles_interleaved");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041724,
        "dEQP-GLES3.functional.transform_feedback.inter",
        "polation.centroid.mediump_vec4_points_separate");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041725,
        "dEQP-GLES3.functional.transform_feedback.interp",
        "olation.centroid.mediump_vec4_points_interleaved");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041726,
        "dEQP-GLES3.functional.transform_feedback.inte",
        "rpolation.centroid.mediump_vec4_lines_separate");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041727,
        "dEQP-GLES3.functional.transform_feedback.interp",
        "olation.centroid.mediump_vec4_lines_interleaved");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041728,
        "dEQP-GLES3.functional.transform_feedback.interp",
        "olation.centroid.mediump_vec4_triangles_separate");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041729,
        "dEQP-GLES3.functional.transform_feedback.interpol",
        "ation.centroid.mediump_vec4_triangles_interleaved");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041730,
        "dEQP-GLES3.functional.transform_feedback.inte",
        "rpolation.centroid.highp_vec4_points_separate");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041731,
        "dEQP-GLES3.functional.transform_feedback.inter",
        "polation.centroid.highp_vec4_points_interleaved");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041732,
        "dEQP-GLES3.functional.transform_feedback.int",
        "erpolation.centroid.highp_vec4_lines_separate");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041733,
        "dEQP-GLES3.functional.transform_feedback.inter",
        "polation.centroid.highp_vec4_lines_interleaved");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041734,
        "dEQP-GLES3.functional.transform_feedback.inter",
        "polation.centroid.highp_vec4_triangles_separate");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041735,
        "dEQP-GLES3.functional.transform_feedback.interpo",
        "lation.centroid.highp_vec4_triangles_interleaved");
