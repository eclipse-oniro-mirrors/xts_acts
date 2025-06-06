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

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002454,
        "KHR-GLES31.core.geometry_shader.",
        "primitive_counter.point_to_point");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002455,
        "KHR-GLES31.core.geometry_shader.pri",
        "mitive_counter.points_to_line_strip");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002456,
        "KHR-GLES31.core.geometry_shader.primi",
        "tive_counter.points_to_triangle_strip");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002457,
        "KHR-GLES31.core.geometry_shader.",
        "primitive_counter.lines_to_points");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002458,
        "KHR-GLES31.core.geometry_shader.pr",
        "imitive_counter.lines_to_line_strip");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002459,
        "KHR-GLES31.core.geometry_shader.prim",
        "itive_counter.lines_to_triangle_strip");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002460,
        "KHR-GLES31.core.geometry_shader.pr",
        "imitive_counter.triangles_to_points");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002461,
        "KHR-GLES31.core.geometry_shader.prim",
        "itive_counter.triangles_to_line_strip");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002462,
        "KHR-GLES31.core.geometry_shader.primit",
        "ive_counter.triangles_to_triangle_strip");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002463,
        "KHR-GLES31.core.geometry_shader.pr",
        "imitive_counter.points_to_points_rp");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002464,
        "KHR-GLES31.core.geometry_shader.prim",
        "itive_counter.points_to_line_strip_rp");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002465,
        "KHR-GLES31.core.geometry_shader.primit",
        "ive_counter.points_to_triangle_strip_rp");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002466,
        "KHR-GLES31.core.geometry_shader.pr",
        "imitive_counter.lines_to_points_rp");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002467,
        "KHR-GLES31.core.geometry_shader.prim",
        "itive_counter.lines_to_line_strip_rp");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002468,
        "KHR-GLES31.core.geometry_shader.primit",
        "ive_counter.lines_to_triangle_strip_rp");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002469,
        "KHR-GLES31.core.geometry_shader.prim",
        "itive_counter.triangles_to_points_rp");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002470,
        "KHR-GLES31.core.geometry_shader.primit",
        "ive_counter.triangles_to_line_strip_rp");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002471,
        "KHR-GLES31.core.geometry_shader.primitiv",
        "e_counter.triangles_to_triangle_strip_rp");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002472,
        "KHR-GLES31.core.geometry_shader.primit",
        "ive_counter.primitive_id_from_fragment");
