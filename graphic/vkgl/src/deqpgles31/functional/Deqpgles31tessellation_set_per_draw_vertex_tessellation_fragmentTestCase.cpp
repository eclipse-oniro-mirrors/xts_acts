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

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024994,
        "dEQP-GLES31.functional.primitive_bounding_box.triangles.tessellation_s",
        "et_per_draw.vertex_tessellation_fragment.default_framebuffer_bbox_equal");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024995,
        "dEQP-GLES31.functional.primitive_bounding_box.triangles.tessellation_se",
        "t_per_draw.vertex_tessellation_fragment.default_framebuffer_bbox_larger");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024996,
        "dEQP-GLES31.functional.primitive_bounding_box.triangles.tessellation_se",
        "t_per_draw.vertex_tessellation_fragment.default_framebuffer_bbox_smaller");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024997,
        "dEQP-GLES31.functional.primitive_bounding_box.triangles.tessel",
        "lation_set_per_draw.vertex_tessellation_fragment.fbo_bbox_equal");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024998,
        "dEQP-GLES31.functional.primitive_bounding_box.triangles.tessell",
        "ation_set_per_draw.vertex_tessellation_fragment.fbo_bbox_larger");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024999,
        "dEQP-GLES31.functional.primitive_bounding_box.triangles.tessell",
        "ation_set_per_draw.vertex_tessellation_fragment.fbo_bbox_smaller");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025034,
        "dEQP-GLES31.functional.primitive_bounding_box.lines.tessellation_set",
        "_per_draw.vertex_tessellation_fragment.default_framebuffer_bbox_equal");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025035,
        "dEQP-GLES31.functional.primitive_bounding_box.lines.tessellation_set_",
        "per_draw.vertex_tessellation_fragment.default_framebuffer_bbox_larger");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025036,
        "dEQP-GLES31.functional.primitive_bounding_box.lines.tessellation_set_",
        "per_draw.vertex_tessellation_fragment.default_framebuffer_bbox_smaller");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025037,
        "dEQP-GLES31.functional.primitive_bounding_box.lines.tessella",
        "tion_set_per_draw.vertex_tessellation_fragment.fbo_bbox_equal");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025038,
        "dEQP-GLES31.functional.primitive_bounding_box.lines.tessellat",
        "ion_set_per_draw.vertex_tessellation_fragment.fbo_bbox_larger");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025039,
        "dEQP-GLES31.functional.primitive_bounding_box.lines.tessellat",
        "ion_set_per_draw.vertex_tessellation_fragment.fbo_bbox_smaller");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025074,
        "dEQP-GLES31.functional.primitive_bounding_box.points.tessellation_set",
        "_per_draw.vertex_tessellation_fragment.default_framebuffer_bbox_equal");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025075,
        "dEQP-GLES31.functional.primitive_bounding_box.points.tessellation_set",
        "_per_draw.vertex_tessellation_fragment.default_framebuffer_bbox_larger");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025076,
        "dEQP-GLES31.functional.primitive_bounding_box.points.tessellation_set_",
        "per_draw.vertex_tessellation_fragment.default_framebuffer_bbox_smaller");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025077,
        "dEQP-GLES31.functional.primitive_bounding_box.points.tessella",
        "tion_set_per_draw.vertex_tessellation_fragment.fbo_bbox_equal");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025078,
        "dEQP-GLES31.functional.primitive_bounding_box.points.tessella",
        "tion_set_per_draw.vertex_tessellation_fragment.fbo_bbox_larger");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025079,
        "dEQP-GLES31.functional.primitive_bounding_box.points.tessellat",
        "ion_set_per_draw.vertex_tessellation_fragment.fbo_bbox_smaller");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025114,
        "dEQP-GLES31.functional.primitive_bounding_box.wide_lines.tessellation_s",
        "et_per_draw.vertex_tessellation_fragment.default_framebuffer_bbox_equal");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025115,
        "dEQP-GLES31.functional.primitive_bounding_box.wide_lines.tessellation_s",
        "et_per_draw.vertex_tessellation_fragment.default_framebuffer_bbox_larger");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025116,
        "dEQP-GLES31.functional.primitive_bounding_box.wide_lines.tessellation_se",
        "t_per_draw.vertex_tessellation_fragment.default_framebuffer_bbox_smaller");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025117,
        "dEQP-GLES31.functional.primitive_bounding_box.wide_lines.tessel",
        "lation_set_per_draw.vertex_tessellation_fragment.fbo_bbox_equal");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025118,
        "dEQP-GLES31.functional.primitive_bounding_box.wide_lines.tessel",
        "lation_set_per_draw.vertex_tessellation_fragment.fbo_bbox_larger");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025119,
        "dEQP-GLES31.functional.primitive_bounding_box.wide_lines.tessell",
        "ation_set_per_draw.vertex_tessellation_fragment.fbo_bbox_smaller");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025154,
        "dEQP-GLES31.functional.primitive_bounding_box.wide_points.tessellation_",
        "set_per_draw.vertex_tessellation_fragment.default_framebuffer_bbox_equal");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025155,
        "dEQP-GLES31.functional.primitive_bounding_box.wide_points.tessellation_s",
        "et_per_draw.vertex_tessellation_fragment.default_framebuffer_bbox_larger");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025156,
        "dEQP-GLES31.functional.primitive_bounding_box.wide_points.tessellation_s",
        "et_per_draw.vertex_tessellation_fragment.default_framebuffer_bbox_smaller");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025157,
        "dEQP-GLES31.functional.primitive_bounding_box.wide_points.tesse",
        "llation_set_per_draw.vertex_tessellation_fragment.fbo_bbox_equal");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025158,
        "dEQP-GLES31.functional.primitive_bounding_box.wide_points.tessel",
        "lation_set_per_draw.vertex_tessellation_fragment.fbo_bbox_larger");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025159,
        "dEQP-GLES31.functional.primitive_bounding_box.wide_points.tessel",
        "lation_set_per_draw.vertex_tessellation_fragment.fbo_bbox_smaller");
