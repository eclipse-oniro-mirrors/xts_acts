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
#include "../ActsDeqpgles310026TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025008,
        "dEQP-GLES31.functional.primitive_bounding_box.triangles.tessellation_set",
        "_per_primitive.vertex_tessellation_geometry_fragment.default_framebuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025009,
        "dEQP-GLES31.functional.primitive_bounding_box.triangles.tessella",
        "tion_set_per_primitive.vertex_tessellation_geometry_fragment.fbo");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025048,
        "dEQP-GLES31.functional.primitive_bounding_box.lines.tessellation_set_p",
        "er_primitive.vertex_tessellation_geometry_fragment.default_framebuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025049,
        "dEQP-GLES31.functional.primitive_bounding_box.lines.tessellati",
        "on_set_per_primitive.vertex_tessellation_geometry_fragment.fbo");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025088,
        "dEQP-GLES31.functional.primitive_bounding_box.points.tessellation_set_",
        "per_primitive.vertex_tessellation_geometry_fragment.default_framebuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025089,
        "dEQP-GLES31.functional.primitive_bounding_box.points.tessellat",
        "ion_set_per_primitive.vertex_tessellation_geometry_fragment.fbo");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025128,
        "dEQP-GLES31.functional.primitive_bounding_box.wide_lines.tessellation_se",
        "t_per_primitive.vertex_tessellation_geometry_fragment.default_framebuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025129,
        "dEQP-GLES31.functional.primitive_bounding_box.wide_lines.tessell",
        "ation_set_per_primitive.vertex_tessellation_geometry_fragment.fbo");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025168,
        "dEQP-GLES31.functional.primitive_bounding_box.wide_points.tessellation_se",
        "t_per_primitive.vertex_tessellation_geometry_fragment.default_framebuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025169,
        "dEQP-GLES31.functional.primitive_bounding_box.wide_points.tessell",
        "ation_set_per_primitive.vertex_tessellation_geometry_fragment.fbo");
