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
#include "../Gl46masterBaseFunc.h"
#include "../ActsGl46master0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008177,
    "KHR-GL46.geometry_shader.primitive_counter.point_to_point");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008178,
    "KHR-GL46.geometry_shader.primitive_counter.points_to_line_strip");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008179,
    "KHR-GL46.geometry_shader.primitive_counter.points_to_triangle_strip");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008180,
    "KHR-GL46.geometry_shader.primitive_counter.lines_to_points");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008181,
    "KHR-GL46.geometry_shader.primitive_counter.lines_to_line_strip");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008182,
    "KHR-GL46.geometry_shader.primitive_counter.lines_to_triangle_strip");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008183,
    "KHR-GL46.geometry_shader.primitive_counter.triangles_to_points");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008184,
    "KHR-GL46.geometry_shader.primitive_counter.triangles_to_line_strip");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008185,
    "KHR-GL46.geometry_shader.primitive_counter.triangles_to_triangle_strip");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008186,
    "KHR-GL46.geometry_shader.primitive_counter.points_to_points_rp");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008187,
    "KHR-GL46.geometry_shader.primitive_counter.points_to_line_strip_rp");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008188,
    "KHR-GL46.geometry_shader.primitive_counter.points_to_triangle_strip_rp");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008189,
    "KHR-GL46.geometry_shader.primitive_counter.lines_to_points_rp");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008190,
    "KHR-GL46.geometry_shader.primitive_counter.lines_to_line_strip_rp");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008191,
    "KHR-GL46.geometry_shader.primitive_counter.lines_to_triangle_strip_rp");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008192,
    "KHR-GL46.geometry_shader.primitive_counter.triangles_to_points_rp");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008193,
    "KHR-GL46.geometry_shader.primitive_counter.triangles_to_line_strip_rp");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008194,
    "KHR-GL46.geometry_shader.primitive_counter.triangles_to_triangle_strip_rp");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008195,
    "KHR-GL46.geometry_shader.primitive_counter.primitive_id_from_fragment");
