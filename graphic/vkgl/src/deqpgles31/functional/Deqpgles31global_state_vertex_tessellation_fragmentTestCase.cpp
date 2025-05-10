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

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024976,
        "dEQP-GLES31.functional.primitive_bounding_box.triangles.global_s",
        "tate.vertex_tessellation_fragment.default_framebuffer_bbox_equal");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024977,
        "dEQP-GLES31.functional.primitive_bounding_box.triangles.global_s",
        "tate.vertex_tessellation_fragment.default_framebuffer_bbox_larger");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024978,
        "dEQP-GLES31.functional.primitive_bounding_box.triangles.global_st",
        "ate.vertex_tessellation_fragment.default_framebuffer_bbox_smaller");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024979,
        "dEQP-GLES31.functional.primitive_bounding_box.triangles.",
        "global_state.vertex_tessellation_fragment.fbo_bbox_equal");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024980,
        "dEQP-GLES31.functional.primitive_bounding_box.triangles.",
        "global_state.vertex_tessellation_fragment.fbo_bbox_larger");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024981,
        "dEQP-GLES31.functional.primitive_bounding_box.triangles.g",
        "lobal_state.vertex_tessellation_fragment.fbo_bbox_smaller");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025016,
        "dEQP-GLES31.functional.primitive_bounding_box.lines.global_sta",
        "te.vertex_tessellation_fragment.default_framebuffer_bbox_equal");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025017,
        "dEQP-GLES31.functional.primitive_bounding_box.lines.global_sta",
        "te.vertex_tessellation_fragment.default_framebuffer_bbox_larger");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025018,
        "dEQP-GLES31.functional.primitive_bounding_box.lines.global_stat",
        "e.vertex_tessellation_fragment.default_framebuffer_bbox_smaller");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025019,
        "dEQP-GLES31.functional.primitive_bounding_box.lines.gl",
        "obal_state.vertex_tessellation_fragment.fbo_bbox_equal");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025020,
        "dEQP-GLES31.functional.primitive_bounding_box.lines.gl",
        "obal_state.vertex_tessellation_fragment.fbo_bbox_larger");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025021,
        "dEQP-GLES31.functional.primitive_bounding_box.lines.glo",
        "bal_state.vertex_tessellation_fragment.fbo_bbox_smaller");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025056,
        "dEQP-GLES31.functional.primitive_bounding_box.points.global_st",
        "ate.vertex_tessellation_fragment.default_framebuffer_bbox_equal");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025057,
        "dEQP-GLES31.functional.primitive_bounding_box.points.global_sta",
        "te.vertex_tessellation_fragment.default_framebuffer_bbox_larger");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025058,
        "dEQP-GLES31.functional.primitive_bounding_box.points.global_sta",
        "te.vertex_tessellation_fragment.default_framebuffer_bbox_smaller");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025059,
        "dEQP-GLES31.functional.primitive_bounding_box.points.g",
        "lobal_state.vertex_tessellation_fragment.fbo_bbox_equal");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025060,
        "dEQP-GLES31.functional.primitive_bounding_box.points.gl",
        "obal_state.vertex_tessellation_fragment.fbo_bbox_larger");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025061,
        "dEQP-GLES31.functional.primitive_bounding_box.points.gl",
        "obal_state.vertex_tessellation_fragment.fbo_bbox_smaller");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025096,
        "dEQP-GLES31.functional.primitive_bounding_box.wide_lines.global_",
        "state.vertex_tessellation_fragment.default_framebuffer_bbox_equal");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025097,
        "dEQP-GLES31.functional.primitive_bounding_box.wide_lines.global_s",
        "tate.vertex_tessellation_fragment.default_framebuffer_bbox_larger");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025098,
        "dEQP-GLES31.functional.primitive_bounding_box.wide_lines.global_s",
        "tate.vertex_tessellation_fragment.default_framebuffer_bbox_smaller");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025099,
        "dEQP-GLES31.functional.primitive_bounding_box.wide_lines",
        ".global_state.vertex_tessellation_fragment.fbo_bbox_equal");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025100,
        "dEQP-GLES31.functional.primitive_bounding_box.wide_lines.",
        "global_state.vertex_tessellation_fragment.fbo_bbox_larger");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025101,
        "dEQP-GLES31.functional.primitive_bounding_box.wide_lines.",
        "global_state.vertex_tessellation_fragment.fbo_bbox_smaller");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025136,
        "dEQP-GLES31.functional.primitive_bounding_box.wide_points.global_",
        "state.vertex_tessellation_fragment.default_framebuffer_bbox_equal");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025137,
        "dEQP-GLES31.functional.primitive_bounding_box.wide_points.global_",
        "state.vertex_tessellation_fragment.default_framebuffer_bbox_larger");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025138,
        "dEQP-GLES31.functional.primitive_bounding_box.wide_points.global_s",
        "tate.vertex_tessellation_fragment.default_framebuffer_bbox_smaller");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025139,
        "dEQP-GLES31.functional.primitive_bounding_box.wide_points",
        ".global_state.vertex_tessellation_fragment.fbo_bbox_equal");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025140,
        "dEQP-GLES31.functional.primitive_bounding_box.wide_points",
        ".global_state.vertex_tessellation_fragment.fbo_bbox_larger");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025141,
        "dEQP-GLES31.functional.primitive_bounding_box.wide_points.",
        "global_state.vertex_tessellation_fragment.fbo_bbox_smaller");
