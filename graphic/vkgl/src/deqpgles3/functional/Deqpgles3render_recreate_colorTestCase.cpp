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
#include "../Deqpgles3BaseFunc.h"
#include "../ActsDeqpgles30032TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031651,
        "dEQP-GLES3.functional.fbo.render.recreate_color.",
        "tex2d_rgba32f_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031652,
        "dEQP-GLES3.functional.fbo.render.recreate_color",
        ".rbo_rgba32f_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031653,
        "dEQP-GLES3.functional.fbo.render.recreate_color.",
        "tex2d_rgba32i_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031654,
        "dEQP-GLES3.functional.fbo.render.recreate_color",
        ".rbo_rgba32i_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031655,
        "dEQP-GLES3.functional.fbo.render.recreate_color.",
        "tex2d_rgba32ui_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031656,
        "dEQP-GLES3.functional.fbo.render.recreate_color",
        ".rbo_rgba32ui_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031657,
        "dEQP-GLES3.functional.fbo.render.recreate_color.",
        "tex2d_rgba16f_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031658,
        "dEQP-GLES3.functional.fbo.render.recreate_color",
        ".rbo_rgba16f_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031659,
        "dEQP-GLES3.functional.fbo.render.recreate_color.",
        "tex2d_rgba16i_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031660,
        "dEQP-GLES3.functional.fbo.render.recreate_color",
        ".rbo_rgba16i_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031661,
        "dEQP-GLES3.functional.fbo.render.recreate_color.",
        "tex2d_rgba16ui_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031662,
        "dEQP-GLES3.functional.fbo.render.recreate_color",
        ".rbo_rgba16ui_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031663,
        "dEQP-GLES3.functional.fbo.render.recreate_color",
        ".tex2d_rgb16f_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031664,
        "dEQP-GLES3.functional.fbo.render.recreate_colo",
        "r.rbo_rgb16f_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031665,
        "dEQP-GLES3.functional.fbo.render.recreate_color",
        ".tex2d_rgba8_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031666,
        "dEQP-GLES3.functional.fbo.render.recreate_colo",
        "r.rbo_rgba8_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031667,
        "dEQP-GLES3.functional.fbo.render.recreate_color",
        ".tex2d_rgba8i_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031668,
        "dEQP-GLES3.functional.fbo.render.recreate_colo",
        "r.rbo_rgba8i_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031669,
        "dEQP-GLES3.functional.fbo.render.recreate_color.",
        "tex2d_rgba8ui_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031670,
        "dEQP-GLES3.functional.fbo.render.recreate_color",
        ".rbo_rgba8ui_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031671,
        "dEQP-GLES3.functional.fbo.render.recreate_color.te",
        "x2d_srgb8_alpha8_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031672,
        "dEQP-GLES3.functional.fbo.render.recreate_color.r",
        "bo_srgb8_alpha8_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031673,
        "dEQP-GLES3.functional.fbo.render.recreate_color.",
        "tex2d_rgb10_a2_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031674,
        "dEQP-GLES3.functional.fbo.render.recreate_color",
        ".rbo_rgb10_a2_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031675,
        "dEQP-GLES3.functional.fbo.render.recreate_color.t",
        "ex2d_rgb10_a2ui_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031676,
        "dEQP-GLES3.functional.fbo.render.recreate_color.",
        "rbo_rgb10_a2ui_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031677,
        "dEQP-GLES3.functional.fbo.render.recreate_color",
        ".tex2d_rgba4_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031678,
        "dEQP-GLES3.functional.fbo.render.recreate_colo",
        "r.rbo_rgba4_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031679,
        "dEQP-GLES3.functional.fbo.render.recreate_color.",
        "tex2d_rgb5_a1_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031680,
        "dEQP-GLES3.functional.fbo.render.recreate_color",
        ".rbo_rgb5_a1_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031681,
        "dEQP-GLES3.functional.fbo.render.recreate_colo",
        "r.tex2d_rgb8_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031682,
        "dEQP-GLES3.functional.fbo.render.recreate_col",
        "or.rbo_rgb8_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031683,
        "dEQP-GLES3.functional.fbo.render.recreate_color",
        ".tex2d_rgb565_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031684,
        "dEQP-GLES3.functional.fbo.render.recreate_colo",
        "r.rbo_rgb565_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031685,
        "dEQP-GLES3.functional.fbo.render.recreate_color.tex",
        "2d_r11f_g11f_b10f_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031686,
        "dEQP-GLES3.functional.fbo.render.recreate_color.rb",
        "o_r11f_g11f_b10f_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031687,
        "dEQP-GLES3.functional.fbo.render.recreate_color",
        ".tex2d_rg32f_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031688,
        "dEQP-GLES3.functional.fbo.render.recreate_colo",
        "r.rbo_rg32f_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031689,
        "dEQP-GLES3.functional.fbo.render.recreate_color",
        ".tex2d_rg32i_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031690,
        "dEQP-GLES3.functional.fbo.render.recreate_colo",
        "r.rbo_rg32i_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031691,
        "dEQP-GLES3.functional.fbo.render.recreate_color",
        ".tex2d_rg32ui_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031692,
        "dEQP-GLES3.functional.fbo.render.recreate_colo",
        "r.rbo_rg32ui_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031693,
        "dEQP-GLES3.functional.fbo.render.recreate_color",
        ".tex2d_rg16f_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031694,
        "dEQP-GLES3.functional.fbo.render.recreate_colo",
        "r.rbo_rg16f_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031695,
        "dEQP-GLES3.functional.fbo.render.recreate_color",
        ".tex2d_rg16i_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031696,
        "dEQP-GLES3.functional.fbo.render.recreate_colo",
        "r.rbo_rg16i_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031697,
        "dEQP-GLES3.functional.fbo.render.recreate_color",
        ".tex2d_rg16ui_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031698,
        "dEQP-GLES3.functional.fbo.render.recreate_colo",
        "r.rbo_rg16ui_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031699,
        "dEQP-GLES3.functional.fbo.render.recreate_colo",
        "r.tex2d_rg8_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031700,
        "dEQP-GLES3.functional.fbo.render.recreate_col",
        "or.rbo_rg8_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031701,
        "dEQP-GLES3.functional.fbo.render.recreate_colo",
        "r.tex2d_rg8i_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031702,
        "dEQP-GLES3.functional.fbo.render.recreate_col",
        "or.rbo_rg8i_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031703,
        "dEQP-GLES3.functional.fbo.render.recreate_color",
        ".tex2d_rg8ui_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031704,
        "dEQP-GLES3.functional.fbo.render.recreate_colo",
        "r.rbo_rg8ui_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031705,
        "dEQP-GLES3.functional.fbo.render.recreate_colo",
        "r.tex2d_r32f_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031706,
        "dEQP-GLES3.functional.fbo.render.recreate_col",
        "or.rbo_r32f_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031707,
        "dEQP-GLES3.functional.fbo.render.recreate_colo",
        "r.tex2d_r32i_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031708,
        "dEQP-GLES3.functional.fbo.render.recreate_col",
        "or.rbo_r32i_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031709,
        "dEQP-GLES3.functional.fbo.render.recreate_color",
        ".tex2d_r32ui_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031710,
        "dEQP-GLES3.functional.fbo.render.recreate_colo",
        "r.rbo_r32ui_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031711,
        "dEQP-GLES3.functional.fbo.render.recreate_colo",
        "r.tex2d_r16f_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031712,
        "dEQP-GLES3.functional.fbo.render.recreate_col",
        "or.rbo_r16f_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031713,
        "dEQP-GLES3.functional.fbo.render.recreate_colo",
        "r.tex2d_r16i_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031714,
        "dEQP-GLES3.functional.fbo.render.recreate_col",
        "or.rbo_r16i_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031715,
        "dEQP-GLES3.functional.fbo.render.recreate_color",
        ".tex2d_r16ui_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031716,
        "dEQP-GLES3.functional.fbo.render.recreate_colo",
        "r.rbo_r16ui_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031717,
        "dEQP-GLES3.functional.fbo.render.recreate_col",
        "or.tex2d_r8_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031718,
        "dEQP-GLES3.functional.fbo.render.recreate_co",
        "lor.rbo_r8_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031719,
        "dEQP-GLES3.functional.fbo.render.recreate_colo",
        "r.tex2d_r8i_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031720,
        "dEQP-GLES3.functional.fbo.render.recreate_col",
        "or.rbo_r8i_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031721,
        "dEQP-GLES3.functional.fbo.render.recreate_colo",
        "r.tex2d_r8ui_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031722,
        "dEQP-GLES3.functional.fbo.render.recreate_col",
        "or.rbo_r8ui_depth_stencil_rbo_depth24_stencil8");
