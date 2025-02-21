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
#include "../KhrglesextBaseFunc.h"
#include "../ActsKhrglesext0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000009,
        "KHR-GLESEXT.geometry_shader.rendering",
        ".rendering.points_input_points_output");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000010,
        "KHR-GLESEXT.geometry_shader.rendering.r",
        "endering.points_input_line_strip_output");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000011,
        "KHR-GLESEXT.geometry_shader.rendering.",
        "rendering.points_input_triangles_output");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000012,
        "KHR-GLESEXT.geometry_shader.rendering.render",
        "ing.lines_input_points_output_lines_drawcall");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000013,
        "KHR-GLESEXT.geometry_shader.rendering.renderin",
        "g.lines_input_line_strip_output_lines_drawcall");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000014,
        "KHR-GLESEXT.geometry_shader.rendering.rendering.",
        "lines_input_triangle_strip_output_lines_drawcall");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000015,
        "KHR-GLESEXT.geometry_shader.rendering.renderin",
        "g.lines_input_points_output_line_strip_drawcall");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000016,
        "KHR-GLESEXT.geometry_shader.rendering.rendering.",
        "lines_input_line_strip_output_line_strip_drawcall");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000017,
        "KHR-GLESEXT.geometry_shader.rendering.rendering.li",
        "nes_input_triangle_strip_output_line_strip_drawcall");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000018,
        "KHR-GLESEXT.geometry_shader.rendering.renderin",
        "g.lines_input_points_output_line_loop_drawcall");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000019,
        "KHR-GLESEXT.geometry_shader.rendering.rendering.",
        "lines_input_line_strip_output_line_loop_drawcall");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000020,
        "KHR-GLESEXT.geometry_shader.rendering.rendering.li",
        "nes_input_triangle_strip_output_line_loop_drawcall");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000021,
        "KHR-GLESEXT.geometry_shader.rendering.rendering.lines_wi",
        "th_adjacency_input_points_output_lines_adjacency_drawcall");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000022,
        "KHR-GLESEXT.geometry_shader.rendering.rendering.lines_with",
        "_adjacency_input_line_strip_output_lines_adjacency_drawcall");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000023,
        "KHR-GLESEXT.geometry_shader.rendering.rendering.lines_with_a",
        "djacency_input_triangle_strip_output_lines_adjacency_drawcall");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000024,
        "KHR-GLESEXT.geometry_shader.rendering.rendering.lines_",
        "with_adjacency_input_points_output_line_strip_drawcall");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000025,
        "KHR-GLESEXT.geometry_shader.rendering.rendering.lines_wi",
        "th_adjacency_input_line_strip_output_line_strip_drawcall");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000026,
        "KHR-GLESEXT.geometry_shader.rendering.rendering.lines_with",
        "_adjacency_input_triangle_strip_output_line_strip_drawcall");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000027,
        "KHR-GLESEXT.geometry_shader.rendering.rendering.",
        "triangles_input_points_output_triangles_drawcall");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000028,
        "KHR-GLESEXT.geometry_shader.rendering.rendering.tr",
        "iangles_input_line_strip_output_triangles_drawcall");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000029,
        "KHR-GLESEXT.geometry_shader.rendering.rendering.tria",
        "ngles_input_triangle_strip_output_triangles_drawcall");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000030,
        "KHR-GLESEXT.geometry_shader.rendering.rendering.t",
        "riangles_input_points_output_triangle_fan_drawcall");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000031,
        "KHR-GLESEXT.geometry_shader.rendering.rendering.tri",
        "angles_input_line_strip_output_triangle_fan_drawcall");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000032,
        "KHR-GLESEXT.geometry_shader.rendering.rendering.trian",
        "gles_input_triangle_strip_output_triangle_fan_drawcall");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000033,
        "KHR-GLESEXT.geometry_shader.rendering.rendering.tr",
        "iangles_input_points_output_triangle_strip_drawcall");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000034,
        "KHR-GLESEXT.geometry_shader.rendering.rendering.tria",
        "ngles_input_line_strip_output_triangle_strip_drawcall");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000035,
        "KHR-GLESEXT.geometry_shader.rendering.rendering.triang",
        "les_input_triangle_strip_output_triangle_strip_drawcall");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000036,
        "KHR-GLESEXT.geometry_shader.rendering.rendering.triangles_wi",
        "th_adjacency_input_points_output_triangles_adjacency_drawcall");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000037,
        "KHR-GLESEXT.geometry_shader.rendering.rendering.triangles_with",
        "_adjacency_input_line_strip_output_triangles_adjacency_drawcall");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000038,
        "KHR-GLESEXT.geometry_shader.rendering.rendering.triangles_with_a",
        "djacency_input_triangle_strip_output_triangles_adjacency_drawcall");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000039,
        "KHR-GLESEXT.geometry_shader.rendering.rendering.triangles_with_",
        "adjacency_input_points_output_triangle_strip_adjacency_drawcall");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000040,
        "KHR-GLESEXT.geometry_shader.rendering.rendering.triangles_with_ad",
        "jacency_input_line_strip_output_triangle_strip_adjacency_drawcall");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000041,
        "KHR-GLESEXT.geometry_shader.rendering.rendering.triangles_with_adja",
        "cency_input_triangle_strip_output_triangle_strip_adjacency_drawcall");
