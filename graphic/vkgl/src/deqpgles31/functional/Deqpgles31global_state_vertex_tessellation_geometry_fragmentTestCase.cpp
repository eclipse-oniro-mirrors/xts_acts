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

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024988,
        "dEQP-GLES31.functional.primitive_bounding_box.triangles.global_state",
        ".vertex_tessellation_geometry_fragment.default_framebuffer_bbox_equal");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024989,
        "dEQP-GLES31.functional.primitive_bounding_box.triangles.global_state.",
        "vertex_tessellation_geometry_fragment.default_framebuffer_bbox_larger");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024990,
        "dEQP-GLES31.functional.primitive_bounding_box.triangles.global_state.",
        "vertex_tessellation_geometry_fragment.default_framebuffer_bbox_smaller");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024991,
        "dEQP-GLES31.functional.primitive_bounding_box.triangles.glob",
        "al_state.vertex_tessellation_geometry_fragment.fbo_bbox_equal");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024992,
        "dEQP-GLES31.functional.primitive_bounding_box.triangles.globa",
        "l_state.vertex_tessellation_geometry_fragment.fbo_bbox_larger");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024993,
        "dEQP-GLES31.functional.primitive_bounding_box.triangles.globa",
        "l_state.vertex_tessellation_geometry_fragment.fbo_bbox_smaller");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025028,
        "dEQP-GLES31.functional.primitive_bounding_box.lines.global_state.v",
        "ertex_tessellation_geometry_fragment.default_framebuffer_bbox_equal");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025029,
        "dEQP-GLES31.functional.primitive_bounding_box.lines.global_state.ve",
        "rtex_tessellation_geometry_fragment.default_framebuffer_bbox_larger");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025030,
        "dEQP-GLES31.functional.primitive_bounding_box.lines.global_state.ve",
        "rtex_tessellation_geometry_fragment.default_framebuffer_bbox_smaller");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025031,
        "dEQP-GLES31.functional.primitive_bounding_box.lines.global",
        "_state.vertex_tessellation_geometry_fragment.fbo_bbox_equal");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025032,
        "dEQP-GLES31.functional.primitive_bounding_box.lines.global_",
        "state.vertex_tessellation_geometry_fragment.fbo_bbox_larger");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025033,
        "dEQP-GLES31.functional.primitive_bounding_box.lines.global_",
        "state.vertex_tessellation_geometry_fragment.fbo_bbox_smaller");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025068,
        "dEQP-GLES31.functional.primitive_bounding_box.points.global_state.v",
        "ertex_tessellation_geometry_fragment.default_framebuffer_bbox_equal");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025069,
        "dEQP-GLES31.functional.primitive_bounding_box.points.global_state.v",
        "ertex_tessellation_geometry_fragment.default_framebuffer_bbox_larger");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025070,
        "dEQP-GLES31.functional.primitive_bounding_box.points.global_state.ve",
        "rtex_tessellation_geometry_fragment.default_framebuffer_bbox_smaller");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025071,
        "dEQP-GLES31.functional.primitive_bounding_box.points.global",
        "_state.vertex_tessellation_geometry_fragment.fbo_bbox_equal");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025072,
        "dEQP-GLES31.functional.primitive_bounding_box.points.global",
        "_state.vertex_tessellation_geometry_fragment.fbo_bbox_larger");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025073,
        "dEQP-GLES31.functional.primitive_bounding_box.points.global_",
        "state.vertex_tessellation_geometry_fragment.fbo_bbox_smaller");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025108,
        "dEQP-GLES31.functional.primitive_bounding_box.wide_lines.global_state",
        ".vertex_tessellation_geometry_fragment.default_framebuffer_bbox_equal");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025109,
        "dEQP-GLES31.functional.primitive_bounding_box.wide_lines.global_state",
        ".vertex_tessellation_geometry_fragment.default_framebuffer_bbox_larger");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025110,
        "dEQP-GLES31.functional.primitive_bounding_box.wide_lines.global_state.",
        "vertex_tessellation_geometry_fragment.default_framebuffer_bbox_smaller");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025111,
        "dEQP-GLES31.functional.primitive_bounding_box.wide_lines.glob",
        "al_state.vertex_tessellation_geometry_fragment.fbo_bbox_equal");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025112,
        "dEQP-GLES31.functional.primitive_bounding_box.wide_lines.glob",
        "al_state.vertex_tessellation_geometry_fragment.fbo_bbox_larger");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025113,
        "dEQP-GLES31.functional.primitive_bounding_box.wide_lines.globa",
        "l_state.vertex_tessellation_geometry_fragment.fbo_bbox_smaller");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025148,
        "dEQP-GLES31.functional.primitive_bounding_box.wide_points.global_stat",
        "e.vertex_tessellation_geometry_fragment.default_framebuffer_bbox_equal");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025149,
        "dEQP-GLES31.functional.primitive_bounding_box.wide_points.global_state",
        ".vertex_tessellation_geometry_fragment.default_framebuffer_bbox_larger");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025150,
        "dEQP-GLES31.functional.primitive_bounding_box.wide_points.global_state",
        ".vertex_tessellation_geometry_fragment.default_framebuffer_bbox_smaller");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025151,
        "dEQP-GLES31.functional.primitive_bounding_box.wide_points.glo",
        "bal_state.vertex_tessellation_geometry_fragment.fbo_bbox_equal");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025152,
        "dEQP-GLES31.functional.primitive_bounding_box.wide_points.glob",
        "al_state.vertex_tessellation_geometry_fragment.fbo_bbox_larger");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025153,
        "dEQP-GLES31.functional.primitive_bounding_box.wide_points.glob",
        "al_state.vertex_tessellation_geometry_fragment.fbo_bbox_smaller");
