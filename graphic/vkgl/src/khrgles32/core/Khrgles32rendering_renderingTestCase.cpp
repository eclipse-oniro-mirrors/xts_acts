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
#include "../Khrgles32BaseFunc.h"
#include "../ActsKhrgles320001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000037,
        "KHR-GLES32.core.geometry_shader.renderi",
        "ng.rendering.points_input_points_output");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000038,
        "KHR-GLES32.core.geometry_shader.rendering",
        ".rendering.points_input_line_strip_output");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000039,
        "KHR-GLES32.core.geometry_shader.renderin",
        "g.rendering.points_input_triangles_output");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000040,
        "KHR-GLES32.core.geometry_shader.rendering.rend",
        "ering.lines_input_points_output_lines_drawcall");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000041,
        "KHR-GLES32.core.geometry_shader.rendering.render",
        "ing.lines_input_line_strip_output_lines_drawcall");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000042,
        "KHR-GLES32.core.geometry_shader.rendering.renderin",
        "g.lines_input_triangle_strip_output_lines_drawcall");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000043,
        "KHR-GLES32.core.geometry_shader.rendering.render",
        "ing.lines_input_points_output_line_strip_drawcall");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000044,
        "KHR-GLES32.core.geometry_shader.rendering.renderin",
        "g.lines_input_line_strip_output_line_strip_drawcall");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000045,
        "KHR-GLES32.core.geometry_shader.rendering.rendering.",
        "lines_input_triangle_strip_output_line_strip_drawcall");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000046,
        "KHR-GLES32.core.geometry_shader.rendering.render",
        "ing.lines_input_points_output_line_loop_drawcall");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000047,
        "KHR-GLES32.core.geometry_shader.rendering.renderin",
        "g.lines_input_line_strip_output_line_loop_drawcall");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000048,
        "KHR-GLES32.core.geometry_shader.rendering.rendering.",
        "lines_input_triangle_strip_output_line_loop_drawcall");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000049,
        "KHR-GLES32.core.geometry_shader.rendering.rendering.lines_",
        "with_adjacency_input_points_output_lines_adjacency_drawcall");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000050,
        "KHR-GLES32.core.geometry_shader.rendering.rendering.lines_wi",
        "th_adjacency_input_line_strip_output_lines_adjacency_drawcall");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000051,
        "KHR-GLES32.core.geometry_shader.rendering.rendering.lines_with",
        "_adjacency_input_triangle_strip_output_lines_adjacency_drawcall");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000052,
        "KHR-GLES32.core.geometry_shader.rendering.rendering.line",
        "s_with_adjacency_input_points_output_line_strip_drawcall");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000053,
        "KHR-GLES32.core.geometry_shader.rendering.rendering.lines_",
        "with_adjacency_input_line_strip_output_line_strip_drawcall");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000054,
        "KHR-GLES32.core.geometry_shader.rendering.rendering.lines_wi",
        "th_adjacency_input_triangle_strip_output_line_strip_drawcall");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000055,
        "KHR-GLES32.core.geometry_shader.rendering.renderin",
        "g.triangles_input_points_output_triangles_drawcall");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000056,
        "KHR-GLES32.core.geometry_shader.rendering.rendering.",
        "triangles_input_line_strip_output_triangles_drawcall");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000057,
        "KHR-GLES32.core.geometry_shader.rendering.rendering.tr",
        "iangles_input_triangle_strip_output_triangles_drawcall");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000058,
        "KHR-GLES32.core.geometry_shader.rendering.rendering",
        ".triangles_input_points_output_triangle_fan_drawcall");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000059,
        "KHR-GLES32.core.geometry_shader.rendering.rendering.t",
        "riangles_input_line_strip_output_triangle_fan_drawcall");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000060,
        "KHR-GLES32.core.geometry_shader.rendering.rendering.tri",
        "angles_input_triangle_strip_output_triangle_fan_drawcall");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000061,
        "KHR-GLES32.core.geometry_shader.rendering.rendering.",
        "triangles_input_points_output_triangle_strip_drawcall");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000062,
        "KHR-GLES32.core.geometry_shader.rendering.rendering.tr",
        "iangles_input_line_strip_output_triangle_strip_drawcall");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000063,
        "KHR-GLES32.core.geometry_shader.rendering.rendering.tria",
        "ngles_input_triangle_strip_output_triangle_strip_drawcall");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000064,
        "KHR-GLES32.core.geometry_shader.rendering.rendering.triangles_",
        "with_adjacency_input_points_output_triangles_adjacency_drawcall");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000065,
        "KHR-GLES32.core.geometry_shader.rendering.rendering.triangles_wi",
        "th_adjacency_input_line_strip_output_triangles_adjacency_drawcall");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000066,
        "KHR-GLES32.core.geometry_shader.rendering.rendering.triangles_with",
        "_adjacency_input_triangle_strip_output_triangles_adjacency_drawcall");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000067,
        "KHR-GLES32.core.geometry_shader.rendering.rendering.triangles_wit",
        "h_adjacency_input_points_output_triangle_strip_adjacency_drawcall");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000068,
        "KHR-GLES32.core.geometry_shader.rendering.rendering.triangles_with_",
        "adjacency_input_line_strip_output_triangle_strip_adjacency_drawcall");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000069,
        "KHR-GLES32.core.geometry_shader.rendering.rendering.triangles_with_ad",
        "jacency_input_triangle_strip_output_triangle_strip_adjacency_drawcall");
