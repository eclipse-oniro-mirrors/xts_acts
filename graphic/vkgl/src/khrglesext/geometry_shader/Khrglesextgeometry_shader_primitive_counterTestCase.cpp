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

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000048,
        "KHR-GLESEXT.geometry_shader.pr",
        "imitive_counter.point_to_point");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000049,
        "KHR-GLESEXT.geometry_shader.primi",
        "tive_counter.points_to_line_strip");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000050,
        "KHR-GLESEXT.geometry_shader.primiti",
        "ve_counter.points_to_triangle_strip");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000051,
        "KHR-GLESEXT.geometry_shader.pr",
        "imitive_counter.lines_to_points");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000052,
        "KHR-GLESEXT.geometry_shader.prim",
        "itive_counter.lines_to_line_strip");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000053,
        "KHR-GLESEXT.geometry_shader.primit",
        "ive_counter.lines_to_triangle_strip");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000054,
        "KHR-GLESEXT.geometry_shader.prim",
        "itive_counter.triangles_to_points");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000055,
        "KHR-GLESEXT.geometry_shader.primit",
        "ive_counter.triangles_to_line_strip");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000056,
        "KHR-GLESEXT.geometry_shader.primitiv",
        "e_counter.triangles_to_triangle_strip");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000057,
        "KHR-GLESEXT.geometry_shader.prim",
        "itive_counter.points_to_points_rp");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000058,
        "KHR-GLESEXT.geometry_shader.primit",
        "ive_counter.points_to_line_strip_rp");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000059,
        "KHR-GLESEXT.geometry_shader.primitiv",
        "e_counter.points_to_triangle_strip_rp");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000060,
        "KHR-GLESEXT.geometry_shader.prim",
        "itive_counter.lines_to_points_rp");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000061,
        "KHR-GLESEXT.geometry_shader.primit",
        "ive_counter.lines_to_line_strip_rp");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000062,
        "KHR-GLESEXT.geometry_shader.primitiv",
        "e_counter.lines_to_triangle_strip_rp");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000063,
        "KHR-GLESEXT.geometry_shader.primit",
        "ive_counter.triangles_to_points_rp");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000064,
        "KHR-GLESEXT.geometry_shader.primitiv",
        "e_counter.triangles_to_line_strip_rp");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000065,
        "KHR-GLESEXT.geometry_shader.primitive_",
        "counter.triangles_to_triangle_strip_rp");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000066,
        "KHR-GLESEXT.geometry_shader.primitiv",
        "e_counter.primitive_id_from_fragment");
