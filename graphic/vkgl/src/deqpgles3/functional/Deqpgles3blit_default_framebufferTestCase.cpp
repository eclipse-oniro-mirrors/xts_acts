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
#include "../ActsDeqpgles30033TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032569,
        "dEQP-GLES3.functional.fbo.bl",
        "it.default_framebuffer.rgba8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032570,
        "dEQP-GLES3.functional.fbo.blit.default_frame",
        "buffer.rgba8_nearest_scale_blit_from_default");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032571,
        "dEQP-GLES3.functional.fbo.blit.default_fram",
        "ebuffer.rgba8_nearest_scale_blit_to_default");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032572,
        "dEQP-GLES3.functional.fbo.blit.default_fram",
        "ebuffer.rgba8_linear_scale_blit_from_default");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032573,
        "dEQP-GLES3.functional.fbo.blit.default_fra",
        "mebuffer.rgba8_linear_scale_blit_to_default");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032574,
        "dEQP-GLES3.functional.fbo.blit.default_framebuf",
        "fer.rgba8_linear_out_of_bounds_blit_from_default");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032575,
        "dEQP-GLES3.functional.fbo.blit.default_framebu",
        "ffer.rgba8_linear_out_of_bounds_blit_to_default");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032576,
        "dEQP-GLES3.functional.fbo.blit.",
        "default_framebuffer.srgb8_alpha8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032577,
        "dEQP-GLES3.functional.fbo.blit.default_framebuf",
        "fer.srgb8_alpha8_nearest_scale_blit_from_default");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032578,
        "dEQP-GLES3.functional.fbo.blit.default_framebu",
        "ffer.srgb8_alpha8_nearest_scale_blit_to_default");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032579,
        "dEQP-GLES3.functional.fbo.blit.default_framebuf",
        "fer.srgb8_alpha8_linear_scale_blit_from_default");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032580,
        "dEQP-GLES3.functional.fbo.blit.default_framebu",
        "ffer.srgb8_alpha8_linear_scale_blit_to_default");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032581,
        "dEQP-GLES3.functional.fbo.blit.default_framebuffer.",
        "srgb8_alpha8_linear_out_of_bounds_blit_from_default");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032582,
        "dEQP-GLES3.functional.fbo.blit.default_framebuffer",
        ".srgb8_alpha8_linear_out_of_bounds_blit_to_default");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032583,
        "dEQP-GLES3.functional.fbo.bli",
        "t.default_framebuffer.rgb10_a2");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032584,
        "dEQP-GLES3.functional.fbo.blit.default_frameb",
        "uffer.rgb10_a2_nearest_scale_blit_from_default");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032585,
        "dEQP-GLES3.functional.fbo.blit.default_frame",
        "buffer.rgb10_a2_nearest_scale_blit_to_default");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032586,
        "dEQP-GLES3.functional.fbo.blit.default_frameb",
        "uffer.rgb10_a2_linear_scale_blit_from_default");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032587,
        "dEQP-GLES3.functional.fbo.blit.default_frame",
        "buffer.rgb10_a2_linear_scale_blit_to_default");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032588,
        "dEQP-GLES3.functional.fbo.blit.default_framebuffe",
        "r.rgb10_a2_linear_out_of_bounds_blit_from_default");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032589,
        "dEQP-GLES3.functional.fbo.blit.default_framebuff",
        "er.rgb10_a2_linear_out_of_bounds_blit_to_default");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032590,
        "dEQP-GLES3.functional.fbo.bl",
        "it.default_framebuffer.rgba4");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032591,
        "dEQP-GLES3.functional.fbo.blit.default_frame",
        "buffer.rgba4_nearest_scale_blit_from_default");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032592,
        "dEQP-GLES3.functional.fbo.blit.default_fram",
        "ebuffer.rgba4_nearest_scale_blit_to_default");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032593,
        "dEQP-GLES3.functional.fbo.blit.default_fram",
        "ebuffer.rgba4_linear_scale_blit_from_default");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032594,
        "dEQP-GLES3.functional.fbo.blit.default_fra",
        "mebuffer.rgba4_linear_scale_blit_to_default");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032595,
        "dEQP-GLES3.functional.fbo.blit.default_framebuf",
        "fer.rgba4_linear_out_of_bounds_blit_from_default");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032596,
        "dEQP-GLES3.functional.fbo.blit.default_framebu",
        "ffer.rgba4_linear_out_of_bounds_blit_to_default");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032597,
        "dEQP-GLES3.functional.fbo.bli",
        "t.default_framebuffer.rgb5_a1");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032598,
        "dEQP-GLES3.functional.fbo.blit.default_frameb",
        "uffer.rgb5_a1_nearest_scale_blit_from_default");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032599,
        "dEQP-GLES3.functional.fbo.blit.default_frame",
        "buffer.rgb5_a1_nearest_scale_blit_to_default");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032600,
        "dEQP-GLES3.functional.fbo.blit.default_frame",
        "buffer.rgb5_a1_linear_scale_blit_from_default");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032601,
        "dEQP-GLES3.functional.fbo.blit.default_fram",
        "ebuffer.rgb5_a1_linear_scale_blit_to_default");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032602,
        "dEQP-GLES3.functional.fbo.blit.default_framebuff",
        "er.rgb5_a1_linear_out_of_bounds_blit_from_default");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032603,
        "dEQP-GLES3.functional.fbo.blit.default_framebuf",
        "fer.rgb5_a1_linear_out_of_bounds_blit_to_default");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032604,
        "dEQP-GLES3.functional.fbo.b",
        "lit.default_framebuffer.rgb8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032605,
        "dEQP-GLES3.functional.fbo.blit.default_fram",
        "ebuffer.rgb8_nearest_scale_blit_from_default");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032606,
        "dEQP-GLES3.functional.fbo.blit.default_fra",
        "mebuffer.rgb8_nearest_scale_blit_to_default");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032607,
        "dEQP-GLES3.functional.fbo.blit.default_fram",
        "ebuffer.rgb8_linear_scale_blit_from_default");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032608,
        "dEQP-GLES3.functional.fbo.blit.default_fra",
        "mebuffer.rgb8_linear_scale_blit_to_default");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032609,
        "dEQP-GLES3.functional.fbo.blit.default_framebuf",
        "fer.rgb8_linear_out_of_bounds_blit_from_default");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032610,
        "dEQP-GLES3.functional.fbo.blit.default_framebu",
        "ffer.rgb8_linear_out_of_bounds_blit_to_default");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032611,
        "dEQP-GLES3.functional.fbo.bl",
        "it.default_framebuffer.rgb565");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032612,
        "dEQP-GLES3.functional.fbo.blit.default_frame",
        "buffer.rgb565_nearest_scale_blit_from_default");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032613,
        "dEQP-GLES3.functional.fbo.blit.default_fram",
        "ebuffer.rgb565_nearest_scale_blit_to_default");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032614,
        "dEQP-GLES3.functional.fbo.blit.default_frame",
        "buffer.rgb565_linear_scale_blit_from_default");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032615,
        "dEQP-GLES3.functional.fbo.blit.default_fram",
        "ebuffer.rgb565_linear_scale_blit_to_default");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032616,
        "dEQP-GLES3.functional.fbo.blit.default_framebuff",
        "er.rgb565_linear_out_of_bounds_blit_from_default");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032617,
        "dEQP-GLES3.functional.fbo.blit.default_framebuf",
        "fer.rgb565_linear_out_of_bounds_blit_to_default");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032618,
        "dEQP-GLES3.functional.fbo.b",
        "lit.default_framebuffer.rg8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032619,
        "dEQP-GLES3.functional.fbo.blit.default_fram",
        "ebuffer.rg8_nearest_scale_blit_from_default");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032620,
        "dEQP-GLES3.functional.fbo.blit.default_fra",
        "mebuffer.rg8_nearest_scale_blit_to_default");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032621,
        "dEQP-GLES3.functional.fbo.blit.default_fra",
        "mebuffer.rg8_linear_scale_blit_from_default");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032622,
        "dEQP-GLES3.functional.fbo.blit.default_fr",
        "amebuffer.rg8_linear_scale_blit_to_default");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032623,
        "dEQP-GLES3.functional.fbo.blit.default_framebu",
        "ffer.rg8_linear_out_of_bounds_blit_from_default");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032624,
        "dEQP-GLES3.functional.fbo.blit.default_frameb",
        "uffer.rg8_linear_out_of_bounds_blit_to_default");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032625,
        "dEQP-GLES3.functional.fbo.",
        "blit.default_framebuffer.r8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032626,
        "dEQP-GLES3.functional.fbo.blit.default_fra",
        "mebuffer.r8_nearest_scale_blit_from_default");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032627,
        "dEQP-GLES3.functional.fbo.blit.default_fr",
        "amebuffer.r8_nearest_scale_blit_to_default");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032628,
        "dEQP-GLES3.functional.fbo.blit.default_fra",
        "mebuffer.r8_linear_scale_blit_from_default");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032629,
        "dEQP-GLES3.functional.fbo.blit.default_fr",
        "amebuffer.r8_linear_scale_blit_to_default");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032630,
        "dEQP-GLES3.functional.fbo.blit.default_framebu",
        "ffer.r8_linear_out_of_bounds_blit_from_default");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032631,
        "dEQP-GLES3.functional.fbo.blit.default_frameb",
        "uffer.r8_linear_out_of_bounds_blit_to_default");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032632,
        "dEQP-GLES3.functional.fbo.bli",
        "t.default_framebuffer.rgba32f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032633,
        "dEQP-GLES3.functional.fbo.blit.default_frameb",
        "uffer.rgba32f_nearest_scale_blit_from_default");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032634,
        "dEQP-GLES3.functional.fbo.blit.default_frame",
        "buffer.rgba32f_nearest_scale_blit_to_default");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032635,
        "dEQP-GLES3.functional.fbo.blit.default_framebuffe",
        "r.rgba32f_nearest_out_of_bounds_blit_from_default");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032636,
        "dEQP-GLES3.functional.fbo.blit.default_framebuff",
        "er.rgba32f_nearest_out_of_bounds_blit_to_default");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032637,
        "dEQP-GLES3.functional.fbo.bli",
        "t.default_framebuffer.rgba16f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032638,
        "dEQP-GLES3.functional.fbo.blit.default_frameb",
        "uffer.rgba16f_nearest_scale_blit_from_default");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032639,
        "dEQP-GLES3.functional.fbo.blit.default_frame",
        "buffer.rgba16f_nearest_scale_blit_to_default");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032640,
        "dEQP-GLES3.functional.fbo.blit.default_frame",
        "buffer.rgba16f_linear_scale_blit_from_default");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032641,
        "dEQP-GLES3.functional.fbo.blit.default_fram",
        "ebuffer.rgba16f_linear_scale_blit_to_default");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032642,
        "dEQP-GLES3.functional.fbo.blit.default_framebuff",
        "er.rgba16f_linear_out_of_bounds_blit_from_default");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032643,
        "dEQP-GLES3.functional.fbo.blit.default_framebuf",
        "fer.rgba16f_linear_out_of_bounds_blit_to_default");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032644,
        "dEQP-GLES3.functional.fbo.blit.d",
        "efault_framebuffer.r11f_g11f_b10f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032645,
        "dEQP-GLES3.functional.fbo.blit.default_framebuff",
        "er.r11f_g11f_b10f_nearest_scale_blit_from_default");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032646,
        "dEQP-GLES3.functional.fbo.blit.default_framebuf",
        "fer.r11f_g11f_b10f_nearest_scale_blit_to_default");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032647,
        "dEQP-GLES3.functional.fbo.blit.default_framebuff",
        "er.r11f_g11f_b10f_linear_scale_blit_from_default");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032648,
        "dEQP-GLES3.functional.fbo.blit.default_framebuf",
        "fer.r11f_g11f_b10f_linear_scale_blit_to_default");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032649,
        "dEQP-GLES3.functional.fbo.blit.default_framebuffer.r",
        "11f_g11f_b10f_linear_out_of_bounds_blit_from_default");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032650,
        "dEQP-GLES3.functional.fbo.blit.default_framebuffer.",
        "r11f_g11f_b10f_linear_out_of_bounds_blit_to_default");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032651,
        "dEQP-GLES3.functional.fbo.bl",
        "it.default_framebuffer.rg32f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032652,
        "dEQP-GLES3.functional.fbo.blit.default_frame",
        "buffer.rg32f_nearest_scale_blit_from_default");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032653,
        "dEQP-GLES3.functional.fbo.blit.default_fram",
        "ebuffer.rg32f_nearest_scale_blit_to_default");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032654,
        "dEQP-GLES3.functional.fbo.blit.default_framebuff",
        "er.rg32f_nearest_out_of_bounds_blit_from_default");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032655,
        "dEQP-GLES3.functional.fbo.blit.default_framebuf",
        "fer.rg32f_nearest_out_of_bounds_blit_to_default");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032656,
        "dEQP-GLES3.functional.fbo.bl",
        "it.default_framebuffer.rg16f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032657,
        "dEQP-GLES3.functional.fbo.blit.default_frame",
        "buffer.rg16f_nearest_scale_blit_from_default");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032658,
        "dEQP-GLES3.functional.fbo.blit.default_fram",
        "ebuffer.rg16f_nearest_scale_blit_to_default");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032659,
        "dEQP-GLES3.functional.fbo.blit.default_fram",
        "ebuffer.rg16f_linear_scale_blit_from_default");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032660,
        "dEQP-GLES3.functional.fbo.blit.default_fra",
        "mebuffer.rg16f_linear_scale_blit_to_default");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032661,
        "dEQP-GLES3.functional.fbo.blit.default_framebuf",
        "fer.rg16f_linear_out_of_bounds_blit_from_default");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032662,
        "dEQP-GLES3.functional.fbo.blit.default_framebu",
        "ffer.rg16f_linear_out_of_bounds_blit_to_default");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032663,
        "dEQP-GLES3.functional.fbo.b",
        "lit.default_framebuffer.r32f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032664,
        "dEQP-GLES3.functional.fbo.blit.default_fram",
        "ebuffer.r32f_nearest_scale_blit_from_default");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032665,
        "dEQP-GLES3.functional.fbo.blit.default_fra",
        "mebuffer.r32f_nearest_scale_blit_to_default");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032666,
        "dEQP-GLES3.functional.fbo.blit.default_framebuf",
        "fer.r32f_nearest_out_of_bounds_blit_from_default");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032667,
        "dEQP-GLES3.functional.fbo.blit.default_framebu",
        "ffer.r32f_nearest_out_of_bounds_blit_to_default");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032668,
        "dEQP-GLES3.functional.fbo.b",
        "lit.default_framebuffer.r16f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032669,
        "dEQP-GLES3.functional.fbo.blit.default_fram",
        "ebuffer.r16f_nearest_scale_blit_from_default");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032670,
        "dEQP-GLES3.functional.fbo.blit.default_fra",
        "mebuffer.r16f_nearest_scale_blit_to_default");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032671,
        "dEQP-GLES3.functional.fbo.blit.default_fram",
        "ebuffer.r16f_linear_scale_blit_from_default");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032672,
        "dEQP-GLES3.functional.fbo.blit.default_fra",
        "mebuffer.r16f_linear_scale_blit_to_default");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032673,
        "dEQP-GLES3.functional.fbo.blit.default_framebuf",
        "fer.r16f_linear_out_of_bounds_blit_from_default");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032674,
        "dEQP-GLES3.functional.fbo.blit.default_framebu",
        "ffer.r16f_linear_out_of_bounds_blit_to_default");
