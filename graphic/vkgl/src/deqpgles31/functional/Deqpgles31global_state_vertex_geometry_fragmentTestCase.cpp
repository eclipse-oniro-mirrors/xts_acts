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
#include "../ActsDeqpgles310025TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024982,
        "dEQP-GLES31.functional.primitive_bounding_box.triangles.global",
        "_state.vertex_geometry_fragment.default_framebuffer_bbox_equal");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024983,
        "dEQP-GLES31.functional.primitive_bounding_box.triangles.global",
        "_state.vertex_geometry_fragment.default_framebuffer_bbox_larger");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024984,
        "dEQP-GLES31.functional.primitive_bounding_box.triangles.global_",
        "state.vertex_geometry_fragment.default_framebuffer_bbox_smaller");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024985,
        "dEQP-GLES31.functional.primitive_bounding_box.triangle",
        "s.global_state.vertex_geometry_fragment.fbo_bbox_equal");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024986,
        "dEQP-GLES31.functional.primitive_bounding_box.triangle",
        "s.global_state.vertex_geometry_fragment.fbo_bbox_larger");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024987,
        "dEQP-GLES31.functional.primitive_bounding_box.triangles",
        ".global_state.vertex_geometry_fragment.fbo_bbox_smaller");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025022,
        "dEQP-GLES31.functional.primitive_bounding_box.lines.global_s",
        "tate.vertex_geometry_fragment.default_framebuffer_bbox_equal");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025023,
        "dEQP-GLES31.functional.primitive_bounding_box.lines.global_s",
        "tate.vertex_geometry_fragment.default_framebuffer_bbox_larger");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025024,
        "dEQP-GLES31.functional.primitive_bounding_box.lines.global_st",
        "ate.vertex_geometry_fragment.default_framebuffer_bbox_smaller");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025025,
        "dEQP-GLES31.functional.primitive_bounding_box.lines.",
        "global_state.vertex_geometry_fragment.fbo_bbox_equal");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025026,
        "dEQP-GLES31.functional.primitive_bounding_box.lines.",
        "global_state.vertex_geometry_fragment.fbo_bbox_larger");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025027,
        "dEQP-GLES31.functional.primitive_bounding_box.lines.g",
        "lobal_state.vertex_geometry_fragment.fbo_bbox_smaller");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025062,
        "dEQP-GLES31.functional.primitive_bounding_box.points.global_",
        "state.vertex_geometry_fragment.default_framebuffer_bbox_equal");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025063,
        "dEQP-GLES31.functional.primitive_bounding_box.points.global_s",
        "tate.vertex_geometry_fragment.default_framebuffer_bbox_larger");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025064,
        "dEQP-GLES31.functional.primitive_bounding_box.points.global_s",
        "tate.vertex_geometry_fragment.default_framebuffer_bbox_smaller");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025065,
        "dEQP-GLES31.functional.primitive_bounding_box.points",
        ".global_state.vertex_geometry_fragment.fbo_bbox_equal");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025066,
        "dEQP-GLES31.functional.primitive_bounding_box.points.",
        "global_state.vertex_geometry_fragment.fbo_bbox_larger");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025067,
        "dEQP-GLES31.functional.primitive_bounding_box.points.",
        "global_state.vertex_geometry_fragment.fbo_bbox_smaller");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025102,
        "dEQP-GLES31.functional.primitive_bounding_box.wide_lines.globa",
        "l_state.vertex_geometry_fragment.default_framebuffer_bbox_equal");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025103,
        "dEQP-GLES31.functional.primitive_bounding_box.wide_lines.global",
        "_state.vertex_geometry_fragment.default_framebuffer_bbox_larger");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025104,
        "dEQP-GLES31.functional.primitive_bounding_box.wide_lines.global",
        "_state.vertex_geometry_fragment.default_framebuffer_bbox_smaller");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025105,
        "dEQP-GLES31.functional.primitive_bounding_box.wide_lin",
        "es.global_state.vertex_geometry_fragment.fbo_bbox_equal");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025106,
        "dEQP-GLES31.functional.primitive_bounding_box.wide_line",
        "s.global_state.vertex_geometry_fragment.fbo_bbox_larger");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025107,
        "dEQP-GLES31.functional.primitive_bounding_box.wide_line",
        "s.global_state.vertex_geometry_fragment.fbo_bbox_smaller");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025142,
        "dEQP-GLES31.functional.primitive_bounding_box.wide_points.globa",
        "l_state.vertex_geometry_fragment.default_framebuffer_bbox_equal");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025143,
        "dEQP-GLES31.functional.primitive_bounding_box.wide_points.globa",
        "l_state.vertex_geometry_fragment.default_framebuffer_bbox_larger");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025144,
        "dEQP-GLES31.functional.primitive_bounding_box.wide_points.global",
        "_state.vertex_geometry_fragment.default_framebuffer_bbox_smaller");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025145,
        "dEQP-GLES31.functional.primitive_bounding_box.wide_poin",
        "ts.global_state.vertex_geometry_fragment.fbo_bbox_equal");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025146,
        "dEQP-GLES31.functional.primitive_bounding_box.wide_poin",
        "ts.global_state.vertex_geometry_fragment.fbo_bbox_larger");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025147,
        "dEQP-GLES31.functional.primitive_bounding_box.wide_point",
        "s.global_state.vertex_geometry_fragment.fbo_bbox_smaller");
