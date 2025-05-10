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
#include "../Khrgles31BaseFunc.h"
#include "../ActsKhrgles310003TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002415,
        "KHR-GLES31.core.geometry_shader.renderi",
        "ng.rendering.points_input_points_output");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002416,
        "KHR-GLES31.core.geometry_shader.rendering",
        ".rendering.points_input_line_strip_output");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002417,
        "KHR-GLES31.core.geometry_shader.renderin",
        "g.rendering.points_input_triangles_output");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002418,
        "KHR-GLES31.core.geometry_shader.rendering.rend",
        "ering.lines_input_points_output_lines_drawcall");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002419,
        "KHR-GLES31.core.geometry_shader.rendering.render",
        "ing.lines_input_line_strip_output_lines_drawcall");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002420,
        "KHR-GLES31.core.geometry_shader.rendering.renderin",
        "g.lines_input_triangle_strip_output_lines_drawcall");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002421,
        "KHR-GLES31.core.geometry_shader.rendering.render",
        "ing.lines_input_points_output_line_strip_drawcall");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002422,
        "KHR-GLES31.core.geometry_shader.rendering.renderin",
        "g.lines_input_line_strip_output_line_strip_drawcall");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002423,
        "KHR-GLES31.core.geometry_shader.rendering.rendering.",
        "lines_input_triangle_strip_output_line_strip_drawcall");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002424,
        "KHR-GLES31.core.geometry_shader.rendering.render",
        "ing.lines_input_points_output_line_loop_drawcall");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002425,
        "KHR-GLES31.core.geometry_shader.rendering.renderin",
        "g.lines_input_line_strip_output_line_loop_drawcall");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002426,
        "KHR-GLES31.core.geometry_shader.rendering.rendering.",
        "lines_input_triangle_strip_output_line_loop_drawcall");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002427,
        "KHR-GLES31.core.geometry_shader.rendering.rendering.lines_",
        "with_adjacency_input_points_output_lines_adjacency_drawcall");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002428,
        "KHR-GLES31.core.geometry_shader.rendering.rendering.lines_wi",
        "th_adjacency_input_line_strip_output_lines_adjacency_drawcall");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002429,
        "KHR-GLES31.core.geometry_shader.rendering.rendering.lines_with",
        "_adjacency_input_triangle_strip_output_lines_adjacency_drawcall");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002430,
        "KHR-GLES31.core.geometry_shader.rendering.rendering.line",
        "s_with_adjacency_input_points_output_line_strip_drawcall");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002431,
        "KHR-GLES31.core.geometry_shader.rendering.rendering.lines_",
        "with_adjacency_input_line_strip_output_line_strip_drawcall");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002432,
        "KHR-GLES31.core.geometry_shader.rendering.rendering.lines_wi",
        "th_adjacency_input_triangle_strip_output_line_strip_drawcall");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002433,
        "KHR-GLES31.core.geometry_shader.rendering.renderin",
        "g.triangles_input_points_output_triangles_drawcall");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002434,
        "KHR-GLES31.core.geometry_shader.rendering.rendering.",
        "triangles_input_line_strip_output_triangles_drawcall");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002435,
        "KHR-GLES31.core.geometry_shader.rendering.rendering.tr",
        "iangles_input_triangle_strip_output_triangles_drawcall");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002436,
        "KHR-GLES31.core.geometry_shader.rendering.rendering",
        ".triangles_input_points_output_triangle_fan_drawcall");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002437,
        "KHR-GLES31.core.geometry_shader.rendering.rendering.t",
        "riangles_input_line_strip_output_triangle_fan_drawcall");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002438,
        "KHR-GLES31.core.geometry_shader.rendering.rendering.tri",
        "angles_input_triangle_strip_output_triangle_fan_drawcall");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002439,
        "KHR-GLES31.core.geometry_shader.rendering.rendering.",
        "triangles_input_points_output_triangle_strip_drawcall");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002440,
        "KHR-GLES31.core.geometry_shader.rendering.rendering.tr",
        "iangles_input_line_strip_output_triangle_strip_drawcall");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002441,
        "KHR-GLES31.core.geometry_shader.rendering.rendering.tria",
        "ngles_input_triangle_strip_output_triangle_strip_drawcall");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002442,
        "KHR-GLES31.core.geometry_shader.rendering.rendering.triangles_",
        "with_adjacency_input_points_output_triangles_adjacency_drawcall");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002443,
        "KHR-GLES31.core.geometry_shader.rendering.rendering.triangles_wi",
        "th_adjacency_input_line_strip_output_triangles_adjacency_drawcall");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002444,
        "KHR-GLES31.core.geometry_shader.rendering.rendering.triangles_with",
        "_adjacency_input_triangle_strip_output_triangles_adjacency_drawcall");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002445,
        "KHR-GLES31.core.geometry_shader.rendering.rendering.triangles_wit",
        "h_adjacency_input_points_output_triangle_strip_adjacency_drawcall");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002446,
        "KHR-GLES31.core.geometry_shader.rendering.rendering.triangles_with_",
        "adjacency_input_line_strip_output_triangle_strip_adjacency_drawcall");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002447,
        "KHR-GLES31.core.geometry_shader.rendering.rendering.triangles_with_ad",
        "jacency_input_triangle_strip_output_triangle_strip_adjacency_drawcall");
