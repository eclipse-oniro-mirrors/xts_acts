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

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031557,
        "dEQP-GLES3.functional.fbo.",
        "render.resize.tex2d_rgba32f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031558,
        "dEQP-GLES3.functional.fbo",
        ".render.resize.rbo_rgba32f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031559,
        "dEQP-GLES3.functional.fbo.",
        "render.resize.tex2d_rgba32i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031560,
        "dEQP-GLES3.functional.fbo",
        ".render.resize.rbo_rgba32i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031561,
        "dEQP-GLES3.functional.fbo.r",
        "ender.resize.tex2d_rgba32ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031562,
        "dEQP-GLES3.functional.fbo.",
        "render.resize.rbo_rgba32ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031563,
        "dEQP-GLES3.functional.fbo.",
        "render.resize.tex2d_rgba16f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031564,
        "dEQP-GLES3.functional.fbo",
        ".render.resize.rbo_rgba16f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031565,
        "dEQP-GLES3.functional.fbo.render.resize.te",
        "x2d_rgba16f_depth_tex2d_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031566,
        "dEQP-GLES3.functional.fbo.render.resize.t",
        "ex2d_rgba16f_depth_rbo_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031567,
        "dEQP-GLES3.functional.fbo.render.resize.t",
        "ex2d_rgba16f_depth_tex2d_depth_component24");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031568,
        "dEQP-GLES3.functional.fbo.render.resize.",
        "tex2d_rgba16f_depth_rbo_depth_component24");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031569,
        "dEQP-GLES3.functional.fbo.render.resize.t",
        "ex2d_rgba16f_depth_tex2d_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031570,
        "dEQP-GLES3.functional.fbo.render.resize.",
        "tex2d_rgba16f_depth_rbo_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031571,
        "dEQP-GLES3.functional.fbo.render.resize.tex2d",
        "_rgba16f_depth_stencil_tex2d_depth32f_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031572,
        "dEQP-GLES3.functional.fbo.render.resize.tex2",
        "d_rgba16f_depth_stencil_rbo_depth32f_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031573,
        "dEQP-GLES3.functional.fbo.render.resize.tex2d",
        "_rgba16f_depth_stencil_tex2d_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031574,
        "dEQP-GLES3.functional.fbo.render.resize.tex2",
        "d_rgba16f_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031575,
        "dEQP-GLES3.functional.fbo.render.resize.",
        "tex2d_rgba16f_stencil_rbo_stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031576,
        "dEQP-GLES3.functional.fbo.",
        "render.resize.tex2d_rgba16i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031577,
        "dEQP-GLES3.functional.fbo",
        ".render.resize.rbo_rgba16i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031578,
        "dEQP-GLES3.functional.fbo.r",
        "ender.resize.tex2d_rgba16ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031579,
        "dEQP-GLES3.functional.fbo.",
        "render.resize.rbo_rgba16ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031580,
        "dEQP-GLES3.functional.fbo.",
        "render.resize.tex2d_rgb16f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031581,
        "dEQP-GLES3.functional.fbo",
        ".render.resize.rbo_rgb16f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031582,
        "dEQP-GLES3.functional.fbo",
        ".render.resize.tex2d_rgba8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031583,
        "dEQP-GLES3.functional.fb",
        "o.render.resize.rbo_rgba8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031584,
        "dEQP-GLES3.functional.fbo.render.resize.t",
        "ex2d_rgba8_depth_tex2d_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031585,
        "dEQP-GLES3.functional.fbo.render.resize.",
        "tex2d_rgba8_depth_rbo_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031586,
        "dEQP-GLES3.functional.fbo.render.resize.",
        "tex2d_rgba8_depth_tex2d_depth_component24");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031587,
        "dEQP-GLES3.functional.fbo.render.resize",
        ".tex2d_rgba8_depth_rbo_depth_component24");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031588,
        "dEQP-GLES3.functional.fbo.render.resize.",
        "tex2d_rgba8_depth_tex2d_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031589,
        "dEQP-GLES3.functional.fbo.render.resize",
        ".tex2d_rgba8_depth_rbo_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031590,
        "dEQP-GLES3.functional.fbo.render.resize.tex2",
        "d_rgba8_depth_stencil_tex2d_depth32f_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031591,
        "dEQP-GLES3.functional.fbo.render.resize.tex",
        "2d_rgba8_depth_stencil_rbo_depth32f_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031592,
        "dEQP-GLES3.functional.fbo.render.resize.tex2",
        "d_rgba8_depth_stencil_tex2d_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031593,
        "dEQP-GLES3.functional.fbo.render.resize.tex",
        "2d_rgba8_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031594,
        "dEQP-GLES3.functional.fbo.render.resize",
        ".tex2d_rgba8_stencil_rbo_stencil_index8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031595,
        "dEQP-GLES3.functional.fbo.",
        "render.resize.tex2d_rgba8i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031596,
        "dEQP-GLES3.functional.fbo",
        ".render.resize.rbo_rgba8i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031597,
        "dEQP-GLES3.functional.fbo.",
        "render.resize.tex2d_rgba8ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031598,
        "dEQP-GLES3.functional.fbo",
        ".render.resize.rbo_rgba8ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031599,
        "dEQP-GLES3.functional.fbo.ren",
        "der.resize.tex2d_srgb8_alpha8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031600,
        "dEQP-GLES3.functional.fbo.re",
        "nder.resize.rbo_srgb8_alpha8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031601,
        "dEQP-GLES3.functional.fbo.r",
        "ender.resize.tex2d_rgb10_a2");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031602,
        "dEQP-GLES3.functional.fbo.",
        "render.resize.rbo_rgb10_a2");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031603,
        "dEQP-GLES3.functional.fbo.re",
        "nder.resize.tex2d_rgb10_a2ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031604,
        "dEQP-GLES3.functional.fbo.r",
        "ender.resize.rbo_rgb10_a2ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031605,
        "dEQP-GLES3.functional.fbo",
        ".render.resize.tex2d_rgba4");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031606,
        "dEQP-GLES3.functional.fb",
        "o.render.resize.rbo_rgba4");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031607,
        "dEQP-GLES3.functional.fbo.",
        "render.resize.tex2d_rgb5_a1");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031608,
        "dEQP-GLES3.functional.fbo",
        ".render.resize.rbo_rgb5_a1");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031609,
        "dEQP-GLES3.functional.fbo",
        ".render.resize.tex2d_rgb8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031610,
        "dEQP-GLES3.functional.fb",
        "o.render.resize.rbo_rgb8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031611,
        "dEQP-GLES3.functional.fbo.",
        "render.resize.tex2d_rgb565");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031612,
        "dEQP-GLES3.functional.fbo",
        ".render.resize.rbo_rgb565");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031613,
        "dEQP-GLES3.functional.fbo.rend",
        "er.resize.tex2d_r11f_g11f_b10f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031614,
        "dEQP-GLES3.functional.fbo.ren",
        "der.resize.rbo_r11f_g11f_b10f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031615,
        "dEQP-GLES3.functional.fbo",
        ".render.resize.tex2d_rg32f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031616,
        "dEQP-GLES3.functional.fb",
        "o.render.resize.rbo_rg32f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031617,
        "dEQP-GLES3.functional.fbo",
        ".render.resize.tex2d_rg32i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031618,
        "dEQP-GLES3.functional.fb",
        "o.render.resize.rbo_rg32i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031619,
        "dEQP-GLES3.functional.fbo.",
        "render.resize.tex2d_rg32ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031620,
        "dEQP-GLES3.functional.fbo",
        ".render.resize.rbo_rg32ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031621,
        "dEQP-GLES3.functional.fbo",
        ".render.resize.tex2d_rg16f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031622,
        "dEQP-GLES3.functional.fb",
        "o.render.resize.rbo_rg16f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031623,
        "dEQP-GLES3.functional.fbo",
        ".render.resize.tex2d_rg16i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031624,
        "dEQP-GLES3.functional.fb",
        "o.render.resize.rbo_rg16i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031625,
        "dEQP-GLES3.functional.fbo.",
        "render.resize.tex2d_rg16ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031626,
        "dEQP-GLES3.functional.fbo",
        ".render.resize.rbo_rg16ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031627,
        "dEQP-GLES3.functional.fb",
        "o.render.resize.tex2d_rg8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031628,
        "dEQP-GLES3.functional.f",
        "bo.render.resize.rbo_rg8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031629,
        "dEQP-GLES3.functional.fbo",
        ".render.resize.tex2d_rg8i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031630,
        "dEQP-GLES3.functional.fb",
        "o.render.resize.rbo_rg8i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031631,
        "dEQP-GLES3.functional.fbo",
        ".render.resize.tex2d_rg8ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031632,
        "dEQP-GLES3.functional.fb",
        "o.render.resize.rbo_rg8ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031633,
        "dEQP-GLES3.functional.fbo",
        ".render.resize.tex2d_r32f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031634,
        "dEQP-GLES3.functional.fb",
        "o.render.resize.rbo_r32f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031635,
        "dEQP-GLES3.functional.fbo",
        ".render.resize.tex2d_r32i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031636,
        "dEQP-GLES3.functional.fb",
        "o.render.resize.rbo_r32i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031637,
        "dEQP-GLES3.functional.fbo",
        ".render.resize.tex2d_r32ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031638,
        "dEQP-GLES3.functional.fb",
        "o.render.resize.rbo_r32ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031639,
        "dEQP-GLES3.functional.fbo",
        ".render.resize.tex2d_r16f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031640,
        "dEQP-GLES3.functional.fb",
        "o.render.resize.rbo_r16f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031641,
        "dEQP-GLES3.functional.fbo",
        ".render.resize.tex2d_r16i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031642,
        "dEQP-GLES3.functional.fb",
        "o.render.resize.rbo_r16i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031643,
        "dEQP-GLES3.functional.fbo",
        ".render.resize.tex2d_r16ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031644,
        "dEQP-GLES3.functional.fb",
        "o.render.resize.rbo_r16ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031645,
        "dEQP-GLES3.functional.fb",
        "o.render.resize.tex2d_r8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031646,
        "dEQP-GLES3.functional.f",
        "bo.render.resize.rbo_r8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031647,
        "dEQP-GLES3.functional.fb",
        "o.render.resize.tex2d_r8i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031648,
        "dEQP-GLES3.functional.f",
        "bo.render.resize.rbo_r8i");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031649,
        "dEQP-GLES3.functional.fbo",
        ".render.resize.tex2d_r8ui");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031650,
        "dEQP-GLES3.functional.fb",
        "o.render.resize.rbo_r8ui");
