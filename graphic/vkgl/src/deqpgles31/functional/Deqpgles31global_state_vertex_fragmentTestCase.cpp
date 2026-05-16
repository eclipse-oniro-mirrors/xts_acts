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

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024970,
        "dEQP-GLES31.functional.primitive_bounding_box.triangles.g",
        "lobal_state.vertex_fragment.default_framebuffer_bbox_equal");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024971,
        "dEQP-GLES31.functional.primitive_bounding_box.triangles.gl",
        "obal_state.vertex_fragment.default_framebuffer_bbox_larger");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024972,
        "dEQP-GLES31.functional.primitive_bounding_box.triangles.gl",
        "obal_state.vertex_fragment.default_framebuffer_bbox_smaller");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024973,
        "dEQP-GLES31.functional.primitive_bounding_box.tri",
        "angles.global_state.vertex_fragment.fbo_bbox_equal");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024974,
        "dEQP-GLES31.functional.primitive_bounding_box.tria",
        "ngles.global_state.vertex_fragment.fbo_bbox_larger");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024975,
        "dEQP-GLES31.functional.primitive_bounding_box.tria",
        "ngles.global_state.vertex_fragment.fbo_bbox_smaller");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025010,
        "dEQP-GLES31.functional.primitive_bounding_box.lines.glo",
        "bal_state.vertex_fragment.default_framebuffer_bbox_equal");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025011,
        "dEQP-GLES31.functional.primitive_bounding_box.lines.glob",
        "al_state.vertex_fragment.default_framebuffer_bbox_larger");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025012,
        "dEQP-GLES31.functional.primitive_bounding_box.lines.glob",
        "al_state.vertex_fragment.default_framebuffer_bbox_smaller");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025013,
        "dEQP-GLES31.functional.primitive_bounding_box.l",
        "ines.global_state.vertex_fragment.fbo_bbox_equal");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025014,
        "dEQP-GLES31.functional.primitive_bounding_box.li",
        "nes.global_state.vertex_fragment.fbo_bbox_larger");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025015,
        "dEQP-GLES31.functional.primitive_bounding_box.li",
        "nes.global_state.vertex_fragment.fbo_bbox_smaller");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025050,
        "dEQP-GLES31.functional.primitive_bounding_box.points.glo",
        "bal_state.vertex_fragment.default_framebuffer_bbox_equal");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025051,
        "dEQP-GLES31.functional.primitive_bounding_box.points.glo",
        "bal_state.vertex_fragment.default_framebuffer_bbox_larger");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025052,
        "dEQP-GLES31.functional.primitive_bounding_box.points.glob",
        "al_state.vertex_fragment.default_framebuffer_bbox_smaller");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025053,
        "dEQP-GLES31.functional.primitive_bounding_box.po",
        "ints.global_state.vertex_fragment.fbo_bbox_equal");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025054,
        "dEQP-GLES31.functional.primitive_bounding_box.po",
        "ints.global_state.vertex_fragment.fbo_bbox_larger");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025055,
        "dEQP-GLES31.functional.primitive_bounding_box.poi",
        "nts.global_state.vertex_fragment.fbo_bbox_smaller");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025090,
        "dEQP-GLES31.functional.primitive_bounding_box.wide_lines.g",
        "lobal_state.vertex_fragment.default_framebuffer_bbox_equal");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025091,
        "dEQP-GLES31.functional.primitive_bounding_box.wide_lines.g",
        "lobal_state.vertex_fragment.default_framebuffer_bbox_larger");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025092,
        "dEQP-GLES31.functional.primitive_bounding_box.wide_lines.gl",
        "obal_state.vertex_fragment.default_framebuffer_bbox_smaller");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025093,
        "dEQP-GLES31.functional.primitive_bounding_box.wide",
        "_lines.global_state.vertex_fragment.fbo_bbox_equal");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025094,
        "dEQP-GLES31.functional.primitive_bounding_box.wide",
        "_lines.global_state.vertex_fragment.fbo_bbox_larger");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025095,
        "dEQP-GLES31.functional.primitive_bounding_box.wide_",
        "lines.global_state.vertex_fragment.fbo_bbox_smaller");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025130,
        "dEQP-GLES31.functional.primitive_bounding_box.wide_points.",
        "global_state.vertex_fragment.default_framebuffer_bbox_equal");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025131,
        "dEQP-GLES31.functional.primitive_bounding_box.wide_points.g",
        "lobal_state.vertex_fragment.default_framebuffer_bbox_larger");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025132,
        "dEQP-GLES31.functional.primitive_bounding_box.wide_points.g",
        "lobal_state.vertex_fragment.default_framebuffer_bbox_smaller");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025133,
        "dEQP-GLES31.functional.primitive_bounding_box.wide",
        "_points.global_state.vertex_fragment.fbo_bbox_equal");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025134,
        "dEQP-GLES31.functional.primitive_bounding_box.wide_",
        "points.global_state.vertex_fragment.fbo_bbox_larger");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_025135,
        "dEQP-GLES31.functional.primitive_bounding_box.wide_",
        "points.global_state.vertex_fragment.fbo_bbox_smaller");
