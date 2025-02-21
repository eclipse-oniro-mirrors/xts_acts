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
#include "../Deqpgles2BaseFunc.h"
#include "../ActsDeqpgles20013TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012462,
        "dEQP-GLES2.functional.fbo.",
        "render.color.mix_tex2d_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012463,
        "dEQP-GLES2.functional.fbo.render.co",
        "lor.mix_tex2d_rgb_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012464,
        "dEQP-GLES2.functional.fbo.",
        "render.color.mix_tex2d_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012465,
        "dEQP-GLES2.functional.fbo.render.co",
        "lor.mix_tex2d_rgba_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012466,
        "dEQP-GLES2.functional.fbo.re",
        "nder.color.mix_npot_tex2d_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012467,
        "dEQP-GLES2.functional.fbo.render.colo",
        "r.mix_npot_tex2d_rgb_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012468,
        "dEQP-GLES2.functional.fbo.ren",
        "der.color.mix_npot_tex2d_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012469,
        "dEQP-GLES2.functional.fbo.render.color",
        ".mix_npot_tex2d_rgba_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012470,
        "dEQP-GLES2.functional.fbo.r",
        "ender.color.blend_tex2d_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012471,
        "dEQP-GLES2.functional.fbo.render.col",
        "or.blend_tex2d_rgb_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012472,
        "dEQP-GLES2.functional.fbo.r",
        "ender.color.blend_tex2d_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012473,
        "dEQP-GLES2.functional.fbo.render.col",
        "or.blend_tex2d_rgba_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012474,
        "dEQP-GLES2.functional.fbo.r",
        "ender.color.blend_rbo_rgb565");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012475,
        "dEQP-GLES2.functional.fbo.render.col",
        "or.blend_rbo_rgb565_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012476,
        "dEQP-GLES2.functional.fbo.re",
        "nder.color.blend_rbo_rgb5_a1");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012477,
        "dEQP-GLES2.functional.fbo.render.colo",
        "r.blend_rbo_rgb5_a1_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012478,
        "dEQP-GLES2.functional.fbo.r",
        "ender.color.blend_rbo_rgba4");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012479,
        "dEQP-GLES2.functional.fbo.render.col",
        "or.blend_rbo_rgba4_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012480,
        "dEQP-GLES2.functional.fbo.ren",
        "der.color.blend_npot_tex2d_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012481,
        "dEQP-GLES2.functional.fbo.render.color",
        ".blend_npot_tex2d_rgb_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012482,
        "dEQP-GLES2.functional.fbo.rend",
        "er.color.blend_npot_tex2d_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012483,
        "dEQP-GLES2.functional.fbo.render.color.",
        "blend_npot_tex2d_rgba_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012484,
        "dEQP-GLES2.functional.fbo.rend",
        "er.color.blend_npot_rbo_rgb565");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012485,
        "dEQP-GLES2.functional.fbo.render.color.",
        "blend_npot_rbo_rgb565_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012486,
        "dEQP-GLES2.functional.fbo.rend",
        "er.color.blend_npot_rbo_rgb5_a1");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012487,
        "dEQP-GLES2.functional.fbo.render.color.",
        "blend_npot_rbo_rgb5_a1_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012488,
        "dEQP-GLES2.functional.fbo.ren",
        "der.color.blend_npot_rbo_rgba4");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012489,
        "dEQP-GLES2.functional.fbo.render.color",
        ".blend_npot_rbo_rgba4_depth_component16");
