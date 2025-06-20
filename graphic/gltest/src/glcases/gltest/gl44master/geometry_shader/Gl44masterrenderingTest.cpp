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
#include "../Gl44masterBaseFunc.h"
#include "../ActsGl44master0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008137,
    "KHR-GL44.geometry_shader.rendering.rendering.points_input_points_output");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008138,
    "KHR-GL44.geometry_shader.rendering.rendering.points_input_line_strip_output");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008139,
    "KHR-GL44.geometry_shader.rendering.rendering.points_input_triangles_output");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008140,
    "KHR-GL44.geometry_shader.rendering.rendering.lines_input_points_output_lines_drawcall");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008141,
    "KHR-GL44.geometry_shader.rendering.rendering.lines_input_line_strip_output_lines_drawcall");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008142,
    "KHR-GL44.geometry_shader.rendering.rendering.lines_input_triangle_strip_output_lines_drawcall");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008143,
    "KHR-GL44.geometry_shader.rendering.rendering.lines_input_points_output_line_strip_drawcall");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008144,
    "KHR-GL44.geometry_shader.rendering.rendering.lines_input_line_strip_output_line_strip_drawcall");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008145,
    "KHR-GL44.geometry_shader.rendering.rendering.lines_input_triangle_strip_output_line_strip_drawcall");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008146,
    "KHR-GL44.geometry_shader.rendering.rendering.lines_input_points_output_line_loop_drawcall");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008147,
    "KHR-GL44.geometry_shader.rendering.rendering.lines_input_line_strip_output_line_loop_drawcall");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008148,
    "KHR-GL44.geometry_shader.rendering.rendering.lines_input_triangle_strip_output_line_loop_drawcall");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008149,
    "KHR-GL44.geometry_shader.rendering.rendering.lines_with_adjacency_input_points_output_lines_adjacency_drawcall");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008150,
    "KHR-GL44.geometry_shader.rendering.rendering.lines_with_a"
    "djacency_input_line_strip_output_lines_adjacency_drawcall");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008151,
    "KHR-GL44.geometry_shader.rendering.rendering.lines_with_adj"
    "acency_input_triangle_strip_output_lines_adjacency_drawcall");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008152,
    "KHR-GL44.geometry_shader.rendering.rendering.lines_with_adjacency_input_points_output_line_strip_drawcall");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008153,
    "KHR-GL44.geometry_shader.rendering.rendering.lines_with_adjacency_input_line_strip_output_line_strip_drawcall");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008154,
    "KHR-GL44.geometry_shader.rendering.rendering.lines_with_"
    "adjacency_input_triangle_strip_output_line_strip_drawcall");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008155,
    "KHR-GL44.geometry_shader.rendering.rendering.triangles_input_points_output_triangles_drawcall");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008156,
    "KHR-GL44.geometry_shader.rendering.rendering.triangles_input_line_strip_output_triangles_drawcall");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008157,
    "KHR-GL44.geometry_shader.rendering.rendering.triangles_input_triangle_strip_output_triangles_drawcall");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008158,
    "KHR-GL44.geometry_shader.rendering.rendering.triangles_input_points_output_triangle_fan_drawcall");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008159,
    "KHR-GL44.geometry_shader.rendering.rendering.triangles_input_line_strip_output_triangle_fan_drawcall");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008160,
    "KHR-GL44.geometry_shader.rendering.rendering.triangles_input_triangle_strip_output_triangle_fan_drawcall");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008161,
    "KHR-GL44.geometry_shader.rendering.rendering.triangles_input_points_output_triangle_strip_drawcall");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008162,
    "KHR-GL44.geometry_shader.rendering.rendering.triangles_input_line_strip_output_triangle_strip_drawcall");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008163,
    "KHR-GL44.geometry_shader.rendering.rendering.triangles_input_triangle_strip_output_triangle_strip_drawcall");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008164,
    "KHR-GL44.geometry_shader.rendering.rendering.triangles_with"
    "_adjacency_input_points_output_triangles_adjacency_drawcall");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008165,
    "KHR-GL44.geometry_shader.rendering.rendering.triangles_with_a"
    "djacency_input_line_strip_output_triangles_adjacency_drawcall");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008166,
    "KHR-GL44.geometry_shader.rendering.rendering.triangles_with_adj"
    "acency_input_triangle_strip_output_triangles_adjacency_drawcall");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008167,
    "KHR-GL44.geometry_shader.rendering.rendering.triangles_with_a"
    "djacency_input_points_output_triangle_strip_adjacency_drawcall");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008168,
    "KHR-GL44.geometry_shader.rendering.rendering.triangles_with_adj"
    "acency_input_line_strip_output_triangle_strip_adjacency_drawcall");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_008169,
    "KHR-GL44.geometry_shader.rendering.rendering.triangles_with_adjac"
    "ency_input_triangle_strip_output_triangle_strip_adjacency_drawcall");
