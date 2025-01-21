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

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016428,
        "dEQP-GLES31.functional.geometry_shadin",
        "g.negative.type_points_primitive_lines");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016429,
        "dEQP-GLES31.functional.geometry_shading.",
        "negative.type_points_primitive_line_loop");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016430,
        "dEQP-GLES31.functional.geometry_shading.",
        "negative.type_points_primitive_line_strip");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016431,
        "dEQP-GLES31.functional.geometry_shading.neg",
        "ative.type_points_primitive_lines_adjacency");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016432,
        "dEQP-GLES31.functional.geometry_shading.negat",
        "ive.type_points_primitive_line_strip_adjacency");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016433,
        "dEQP-GLES31.functional.geometry_shading.",
        "negative.type_points_primitive_triangles");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016434,
        "dEQP-GLES31.functional.geometry_shading.ne",
        "gative.type_points_primitive_triangle_strip");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016435,
        "dEQP-GLES31.functional.geometry_shading.n",
        "egative.type_points_primitive_triangle_fan");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016436,
        "dEQP-GLES31.functional.geometry_shading.negat",
        "ive.type_points_primitive_triangles_adjacency");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016437,
        "dEQP-GLES31.functional.geometry_shading.negativ",
        "e.type_points_primitive_triangle_strip_adjacency");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016438,
        "dEQP-GLES31.functional.geometry_shadin",
        "g.negative.type_lines_primitive_points");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016439,
        "dEQP-GLES31.functional.geometry_shading.ne",
        "gative.type_lines_primitive_lines_adjacency");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016440,
        "dEQP-GLES31.functional.geometry_shading.negat",
        "ive.type_lines_primitive_line_strip_adjacency");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016441,
        "dEQP-GLES31.functional.geometry_shading",
        ".negative.type_lines_primitive_triangles");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016442,
        "dEQP-GLES31.functional.geometry_shading.ne",
        "gative.type_lines_primitive_triangle_strip");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016443,
        "dEQP-GLES31.functional.geometry_shading.n",
        "egative.type_lines_primitive_triangle_fan");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016444,
        "dEQP-GLES31.functional.geometry_shading.nega",
        "tive.type_lines_primitive_triangles_adjacency");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016445,
        "dEQP-GLES31.functional.geometry_shading.negativ",
        "e.type_lines_primitive_triangle_strip_adjacency");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016446,
        "dEQP-GLES31.functional.geometry_shading.neg",
        "ative.type_lines_adjacency_primitive_points");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016447,
        "dEQP-GLES31.functional.geometry_shading.ne",
        "gative.type_lines_adjacency_primitive_lines");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016448,
        "dEQP-GLES31.functional.geometry_shading.nega",
        "tive.type_lines_adjacency_primitive_line_loop");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016449,
        "dEQP-GLES31.functional.geometry_shading.negat",
        "ive.type_lines_adjacency_primitive_line_strip");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016450,
        "dEQP-GLES31.functional.geometry_shading.nega",
        "tive.type_lines_adjacency_primitive_triangles");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016451,
        "dEQP-GLES31.functional.geometry_shading.negativ",
        "e.type_lines_adjacency_primitive_triangle_strip");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016452,
        "dEQP-GLES31.functional.geometry_shading.negati",
        "ve.type_lines_adjacency_primitive_triangle_fan");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016453,
        "dEQP-GLES31.functional.geometry_shading.negative.",
        "type_lines_adjacency_primitive_triangles_adjacency");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016454,
        "dEQP-GLES31.functional.geometry_shading.negative.typ",
        "e_lines_adjacency_primitive_triangle_strip_adjacency");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016455,
        "dEQP-GLES31.functional.geometry_shading.",
        "negative.type_triangles_primitive_points");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016456,
        "dEQP-GLES31.functional.geometry_shading",
        ".negative.type_triangles_primitive_lines");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016457,
        "dEQP-GLES31.functional.geometry_shading.n",
        "egative.type_triangles_primitive_line_loop");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016458,
        "dEQP-GLES31.functional.geometry_shading.ne",
        "gative.type_triangles_primitive_line_strip");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016459,
        "dEQP-GLES31.functional.geometry_shading.nega",
        "tive.type_triangles_primitive_lines_adjacency");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016460,
        "dEQP-GLES31.functional.geometry_shading.negativ",
        "e.type_triangles_primitive_line_strip_adjacency");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016461,
        "dEQP-GLES31.functional.geometry_shading.negati",
        "ve.type_triangles_primitive_triangles_adjacency");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016462,
        "dEQP-GLES31.functional.geometry_shading.negative.",
        "type_triangles_primitive_triangle_strip_adjacency");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016463,
        "dEQP-GLES31.functional.geometry_shading.negat",
        "ive.type_triangles_adjacency_primitive_points");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016464,
        "dEQP-GLES31.functional.geometry_shading.nega",
        "tive.type_triangles_adjacency_primitive_lines");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016465,
        "dEQP-GLES31.functional.geometry_shading.negati",
        "ve.type_triangles_adjacency_primitive_line_loop");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016466,
        "dEQP-GLES31.functional.geometry_shading.negativ",
        "e.type_triangles_adjacency_primitive_line_strip");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016467,
        "dEQP-GLES31.functional.geometry_shading.negative.",
        "type_triangles_adjacency_primitive_lines_adjacency");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016468,
        "dEQP-GLES31.functional.geometry_shading.negative.typ",
        "e_triangles_adjacency_primitive_line_strip_adjacency");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016469,
        "dEQP-GLES31.functional.geometry_shading.negati",
        "ve.type_triangles_adjacency_primitive_triangles");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016470,
        "dEQP-GLES31.functional.geometry_shading.negative.",
        "type_triangles_adjacency_primitive_triangle_strip");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016471,
        "dEQP-GLES31.functional.geometry_shading.negative",
        ".type_triangles_adjacency_primitive_triangle_fan");
