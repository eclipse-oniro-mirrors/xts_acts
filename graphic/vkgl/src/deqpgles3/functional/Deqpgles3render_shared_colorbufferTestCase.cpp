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

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031463,
        "dEQP-GLES3.functional.fbo.render",
        ".shared_colorbuffer.tex2d_rgba16f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031464,
        "dEQP-GLES3.functional.fbo.render.shared_colorb",
        "uffer.tex2d_rgba16f_depth_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031465,
        "dEQP-GLES3.functional.fbo.render.shared_colorbuffe",
        "r.tex2d_rgba16f_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031466,
        "dEQP-GLES3.functional.fbo.rende",
        "r.shared_colorbuffer.rbo_rgba16f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031467,
        "dEQP-GLES3.functional.fbo.render.shared_color",
        "buffer.rbo_rgba16f_depth_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031468,
        "dEQP-GLES3.functional.fbo.render.shared_colorbuff",
        "er.rbo_rgba16f_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031469,
        "dEQP-GLES3.functional.fbo.render",
        ".shared_colorbuffer.tex2d_rgb16f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031470,
        "dEQP-GLES3.functional.fbo.render.shared_color",
        "buffer.tex2d_rgb16f_depth_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031471,
        "dEQP-GLES3.functional.fbo.render.shared_colorbuff",
        "er.tex2d_rgb16f_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031472,
        "dEQP-GLES3.functional.fbo.rende",
        "r.shared_colorbuffer.rbo_rgb16f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031473,
        "dEQP-GLES3.functional.fbo.render.shared_colo",
        "rbuffer.rbo_rgb16f_depth_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031474,
        "dEQP-GLES3.functional.fbo.render.shared_colorbuf",
        "fer.rbo_rgb16f_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031475,
        "dEQP-GLES3.functional.fbo.rende",
        "r.shared_colorbuffer.tex2d_rgba8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031476,
        "dEQP-GLES3.functional.fbo.render.shared_color",
        "buffer.tex2d_rgba8_depth_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031477,
        "dEQP-GLES3.functional.fbo.render.shared_colorbuff",
        "er.tex2d_rgba8_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031478,
        "dEQP-GLES3.functional.fbo.rend",
        "er.shared_colorbuffer.rbo_rgba8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031479,
        "dEQP-GLES3.functional.fbo.render.shared_colo",
        "rbuffer.rbo_rgba8_depth_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031480,
        "dEQP-GLES3.functional.fbo.render.shared_colorbuf",
        "fer.rbo_rgba8_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031481,
        "dEQP-GLES3.functional.fbo.render.sh",
        "ared_colorbuffer.tex2d_srgb8_alpha8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031482,
        "dEQP-GLES3.functional.fbo.render.shared_colorbuf",
        "fer.tex2d_srgb8_alpha8_depth_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031483,
        "dEQP-GLES3.functional.fbo.render.shared_colorbuffer.",
        "tex2d_srgb8_alpha8_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031484,
        "dEQP-GLES3.functional.fbo.render.s",
        "hared_colorbuffer.rbo_srgb8_alpha8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031485,
        "dEQP-GLES3.functional.fbo.render.shared_colorbu",
        "ffer.rbo_srgb8_alpha8_depth_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031486,
        "dEQP-GLES3.functional.fbo.render.shared_colorbuffer",
        ".rbo_srgb8_alpha8_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031487,
        "dEQP-GLES3.functional.fbo.render.",
        "shared_colorbuffer.tex2d_rgb10_a2");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031488,
        "dEQP-GLES3.functional.fbo.render.shared_colorb",
        "uffer.tex2d_rgb10_a2_depth_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031489,
        "dEQP-GLES3.functional.fbo.render.shared_colorbuffe",
        "r.tex2d_rgb10_a2_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031490,
        "dEQP-GLES3.functional.fbo.render",
        ".shared_colorbuffer.rbo_rgb10_a2");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031491,
        "dEQP-GLES3.functional.fbo.render.shared_color",
        "buffer.rbo_rgb10_a2_depth_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031492,
        "dEQP-GLES3.functional.fbo.render.shared_colorbuff",
        "er.rbo_rgb10_a2_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031493,
        "dEQP-GLES3.functional.fbo.rende",
        "r.shared_colorbuffer.tex2d_rgba4");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031494,
        "dEQP-GLES3.functional.fbo.render.shared_color",
        "buffer.tex2d_rgba4_depth_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031495,
        "dEQP-GLES3.functional.fbo.render.shared_colorbuff",
        "er.tex2d_rgba4_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031496,
        "dEQP-GLES3.functional.fbo.rend",
        "er.shared_colorbuffer.rbo_rgba4");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031497,
        "dEQP-GLES3.functional.fbo.render.shared_colo",
        "rbuffer.rbo_rgba4_depth_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031498,
        "dEQP-GLES3.functional.fbo.render.shared_colorbuf",
        "fer.rbo_rgba4_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031499,
        "dEQP-GLES3.functional.fbo.render",
        ".shared_colorbuffer.tex2d_rgb5_a1");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031500,
        "dEQP-GLES3.functional.fbo.render.shared_colorb",
        "uffer.tex2d_rgb5_a1_depth_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031501,
        "dEQP-GLES3.functional.fbo.render.shared_colorbuffe",
        "r.tex2d_rgb5_a1_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031502,
        "dEQP-GLES3.functional.fbo.rende",
        "r.shared_colorbuffer.rbo_rgb5_a1");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031503,
        "dEQP-GLES3.functional.fbo.render.shared_color",
        "buffer.rbo_rgb5_a1_depth_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031504,
        "dEQP-GLES3.functional.fbo.render.shared_colorbuff",
        "er.rbo_rgb5_a1_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031505,
        "dEQP-GLES3.functional.fbo.rende",
        "r.shared_colorbuffer.tex2d_rgb8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031506,
        "dEQP-GLES3.functional.fbo.render.shared_colo",
        "rbuffer.tex2d_rgb8_depth_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031507,
        "dEQP-GLES3.functional.fbo.render.shared_colorbuf",
        "fer.tex2d_rgb8_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031508,
        "dEQP-GLES3.functional.fbo.rend",
        "er.shared_colorbuffer.rbo_rgb8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031509,
        "dEQP-GLES3.functional.fbo.render.shared_col",
        "orbuffer.rbo_rgb8_depth_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031510,
        "dEQP-GLES3.functional.fbo.render.shared_colorbu",
        "ffer.rbo_rgb8_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031511,
        "dEQP-GLES3.functional.fbo.render",
        ".shared_colorbuffer.tex2d_rgb565");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031512,
        "dEQP-GLES3.functional.fbo.render.shared_color",
        "buffer.tex2d_rgb565_depth_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031513,
        "dEQP-GLES3.functional.fbo.render.shared_colorbuff",
        "er.tex2d_rgb565_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031514,
        "dEQP-GLES3.functional.fbo.rende",
        "r.shared_colorbuffer.rbo_rgb565");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031515,
        "dEQP-GLES3.functional.fbo.render.shared_colo",
        "rbuffer.rbo_rgb565_depth_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031516,
        "dEQP-GLES3.functional.fbo.render.shared_colorbuf",
        "fer.rbo_rgb565_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031517,
        "dEQP-GLES3.functional.fbo.render.sha",
        "red_colorbuffer.tex2d_r11f_g11f_b10f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031518,
        "dEQP-GLES3.functional.fbo.render.shared_colorbuff",
        "er.tex2d_r11f_g11f_b10f_depth_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031519,
        "dEQP-GLES3.functional.fbo.render.shared_colorbuffer.t",
        "ex2d_r11f_g11f_b10f_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031520,
        "dEQP-GLES3.functional.fbo.render.sh",
        "ared_colorbuffer.rbo_r11f_g11f_b10f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031521,
        "dEQP-GLES3.functional.fbo.render.shared_colorbuf",
        "fer.rbo_r11f_g11f_b10f_depth_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031522,
        "dEQP-GLES3.functional.fbo.render.shared_colorbuffer.",
        "rbo_r11f_g11f_b10f_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031523,
        "dEQP-GLES3.functional.fbo.rende",
        "r.shared_colorbuffer.tex2d_rg16f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031524,
        "dEQP-GLES3.functional.fbo.render.shared_color",
        "buffer.tex2d_rg16f_depth_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031525,
        "dEQP-GLES3.functional.fbo.render.shared_colorbuff",
        "er.tex2d_rg16f_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031526,
        "dEQP-GLES3.functional.fbo.rend",
        "er.shared_colorbuffer.rbo_rg16f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031527,
        "dEQP-GLES3.functional.fbo.render.shared_colo",
        "rbuffer.rbo_rg16f_depth_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031528,
        "dEQP-GLES3.functional.fbo.render.shared_colorbuf",
        "fer.rbo_rg16f_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031529,
        "dEQP-GLES3.functional.fbo.rend",
        "er.shared_colorbuffer.tex2d_rg8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031530,
        "dEQP-GLES3.functional.fbo.render.shared_colo",
        "rbuffer.tex2d_rg8_depth_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031531,
        "dEQP-GLES3.functional.fbo.render.shared_colorbuf",
        "fer.tex2d_rg8_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031532,
        "dEQP-GLES3.functional.fbo.ren",
        "der.shared_colorbuffer.rbo_rg8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031533,
        "dEQP-GLES3.functional.fbo.render.shared_col",
        "orbuffer.rbo_rg8_depth_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031534,
        "dEQP-GLES3.functional.fbo.render.shared_colorbu",
        "ffer.rbo_rg8_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031535,
        "dEQP-GLES3.functional.fbo.rende",
        "r.shared_colorbuffer.tex2d_r16f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031536,
        "dEQP-GLES3.functional.fbo.render.shared_colo",
        "rbuffer.tex2d_r16f_depth_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031537,
        "dEQP-GLES3.functional.fbo.render.shared_colorbuf",
        "fer.tex2d_r16f_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031538,
        "dEQP-GLES3.functional.fbo.rend",
        "er.shared_colorbuffer.rbo_r16f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031539,
        "dEQP-GLES3.functional.fbo.render.shared_col",
        "orbuffer.rbo_r16f_depth_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031540,
        "dEQP-GLES3.functional.fbo.render.shared_colorbu",
        "ffer.rbo_r16f_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031541,
        "dEQP-GLES3.functional.fbo.rend",
        "er.shared_colorbuffer.tex2d_r8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031542,
        "dEQP-GLES3.functional.fbo.render.shared_col",
        "orbuffer.tex2d_r8_depth_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031543,
        "dEQP-GLES3.functional.fbo.render.shared_colorbu",
        "ffer.tex2d_r8_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031544,
        "dEQP-GLES3.functional.fbo.ren",
        "der.shared_colorbuffer.rbo_r8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031545,
        "dEQP-GLES3.functional.fbo.render.shared_co",
        "lorbuffer.rbo_r8_depth_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031546,
        "dEQP-GLES3.functional.fbo.render.shared_colorb",
        "uffer.rbo_r8_depth_stencil_rbo_depth24_stencil8");
