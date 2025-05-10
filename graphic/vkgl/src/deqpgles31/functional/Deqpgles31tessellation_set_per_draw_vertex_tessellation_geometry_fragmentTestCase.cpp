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

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025000,
        "dEQP-GLES31.functional.primitive_bounding_box.triangles.tessellation_set_pe",
        "r_draw.vertex_tessellation_geometry_fragment.default_framebuffer_bbox_equal");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025001,
        "dEQP-GLES31.functional.primitive_bounding_box.triangles.tessellation_set_pe",
        "r_draw.vertex_tessellation_geometry_fragment.default_framebuffer_bbox_larger");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025002,
        "dEQP-GLES31.functional.primitive_bounding_box.triangles.tessellation_set_per",
        "_draw.vertex_tessellation_geometry_fragment.default_framebuffer_bbox_smaller");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025003,
        "dEQP-GLES31.functional.primitive_bounding_box.triangles.tessellatio",
        "n_set_per_draw.vertex_tessellation_geometry_fragment.fbo_bbox_equal");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025004,
        "dEQP-GLES31.functional.primitive_bounding_box.triangles.tessellatio",
        "n_set_per_draw.vertex_tessellation_geometry_fragment.fbo_bbox_larger");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025005,
        "dEQP-GLES31.functional.primitive_bounding_box.triangles.tessellation",
        "_set_per_draw.vertex_tessellation_geometry_fragment.fbo_bbox_smaller");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025040,
        "dEQP-GLES31.functional.primitive_bounding_box.lines.tessellation_set_per_",
        "draw.vertex_tessellation_geometry_fragment.default_framebuffer_bbox_equal");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025041,
        "dEQP-GLES31.functional.primitive_bounding_box.lines.tessellation_set_per_",
        "draw.vertex_tessellation_geometry_fragment.default_framebuffer_bbox_larger");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025042,
        "dEQP-GLES31.functional.primitive_bounding_box.lines.tessellation_set_per_d",
        "raw.vertex_tessellation_geometry_fragment.default_framebuffer_bbox_smaller");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025043,
        "dEQP-GLES31.functional.primitive_bounding_box.lines.tessellation_",
        "set_per_draw.vertex_tessellation_geometry_fragment.fbo_bbox_equal");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025044,
        "dEQP-GLES31.functional.primitive_bounding_box.lines.tessellation_",
        "set_per_draw.vertex_tessellation_geometry_fragment.fbo_bbox_larger");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025045,
        "dEQP-GLES31.functional.primitive_bounding_box.lines.tessellation_s",
        "et_per_draw.vertex_tessellation_geometry_fragment.fbo_bbox_smaller");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025080,
        "dEQP-GLES31.functional.primitive_bounding_box.points.tessellation_set_per",
        "_draw.vertex_tessellation_geometry_fragment.default_framebuffer_bbox_equal");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025081,
        "dEQP-GLES31.functional.primitive_bounding_box.points.tessellation_set_per_",
        "draw.vertex_tessellation_geometry_fragment.default_framebuffer_bbox_larger");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025082,
        "dEQP-GLES31.functional.primitive_bounding_box.points.tessellation_set_per_",
        "draw.vertex_tessellation_geometry_fragment.default_framebuffer_bbox_smaller");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025083,
        "dEQP-GLES31.functional.primitive_bounding_box.points.tessellation",
        "_set_per_draw.vertex_tessellation_geometry_fragment.fbo_bbox_equal");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025084,
        "dEQP-GLES31.functional.primitive_bounding_box.points.tessellation_",
        "set_per_draw.vertex_tessellation_geometry_fragment.fbo_bbox_larger");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025085,
        "dEQP-GLES31.functional.primitive_bounding_box.points.tessellation_",
        "set_per_draw.vertex_tessellation_geometry_fragment.fbo_bbox_smaller");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025120,
        "dEQP-GLES31.functional.primitive_bounding_box.wide_lines.tessellation_set_p",
        "er_draw.vertex_tessellation_geometry_fragment.default_framebuffer_bbox_equal");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025121,
        "dEQP-GLES31.functional.primitive_bounding_box.wide_lines.tessellation_set_pe",
        "r_draw.vertex_tessellation_geometry_fragment.default_framebuffer_bbox_larger");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025122,
        "dEQP-GLES31.functional.primitive_bounding_box.wide_lines.tessellation_set_pe",
        "r_draw.vertex_tessellation_geometry_fragment.default_framebuffer_bbox_smaller");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025123,
        "dEQP-GLES31.functional.primitive_bounding_box.wide_lines.tessellati",
        "on_set_per_draw.vertex_tessellation_geometry_fragment.fbo_bbox_equal");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025124,
        "dEQP-GLES31.functional.primitive_bounding_box.wide_lines.tessellatio",
        "n_set_per_draw.vertex_tessellation_geometry_fragment.fbo_bbox_larger");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025125,
        "dEQP-GLES31.functional.primitive_bounding_box.wide_lines.tessellatio",
        "n_set_per_draw.vertex_tessellation_geometry_fragment.fbo_bbox_smaller");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025160,
        "dEQP-GLES31.functional.primitive_bounding_box.wide_points.tessellation_set_p",
        "er_draw.vertex_tessellation_geometry_fragment.default_framebuffer_bbox_equal");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025161,
        "dEQP-GLES31.functional.primitive_bounding_box.wide_points.tessellation_set_p",
        "er_draw.vertex_tessellation_geometry_fragment.default_framebuffer_bbox_larger");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025162,
        "dEQP-GLES31.functional.primitive_bounding_box.wide_points.tessellation_set_pe",
        "r_draw.vertex_tessellation_geometry_fragment.default_framebuffer_bbox_smaller");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025163,
        "dEQP-GLES31.functional.primitive_bounding_box.wide_points.tessellati",
        "on_set_per_draw.vertex_tessellation_geometry_fragment.fbo_bbox_equal");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025164,
        "dEQP-GLES31.functional.primitive_bounding_box.wide_points.tessellati",
        "on_set_per_draw.vertex_tessellation_geometry_fragment.fbo_bbox_larger");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025165,
        "dEQP-GLES31.functional.primitive_bounding_box.wide_points.tessellatio",
        "n_set_per_draw.vertex_tessellation_geometry_fragment.fbo_bbox_smaller");
