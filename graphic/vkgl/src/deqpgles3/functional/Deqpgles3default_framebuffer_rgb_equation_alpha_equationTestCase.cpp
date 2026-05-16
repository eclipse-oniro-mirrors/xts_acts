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
#include "../ActsDeqpgles30030TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029441,
        "dEQP-GLES3.functional.fragment_ops.blend.default",
        "_framebuffer.rgb_equation_alpha_equation.add_add");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029442,
        "dEQP-GLES3.functional.fragment_ops.blend.default_f",
        "ramebuffer.rgb_equation_alpha_equation.add_subtract");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029443,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frame",
        "buffer.rgb_equation_alpha_equation.add_reverse_subtract");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029444,
        "dEQP-GLES3.functional.fragment_ops.blend.default",
        "_framebuffer.rgb_equation_alpha_equation.add_min");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029445,
        "dEQP-GLES3.functional.fragment_ops.blend.default",
        "_framebuffer.rgb_equation_alpha_equation.add_max");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029446,
        "dEQP-GLES3.functional.fragment_ops.blend.default_f",
        "ramebuffer.rgb_equation_alpha_equation.subtract_add");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029447,
        "dEQP-GLES3.functional.fragment_ops.blend.default_fram",
        "ebuffer.rgb_equation_alpha_equation.subtract_subtract");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029448,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.rgb_equation_alpha_equation.subtract_reverse_subtract");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029449,
        "dEQP-GLES3.functional.fragment_ops.blend.default_f",
        "ramebuffer.rgb_equation_alpha_equation.subtract_min");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029450,
        "dEQP-GLES3.functional.fragment_ops.blend.default_f",
        "ramebuffer.rgb_equation_alpha_equation.subtract_max");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029451,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frame",
        "buffer.rgb_equation_alpha_equation.reverse_subtract_add");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029452,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.rgb_equation_alpha_equation.reverse_subtract_subtract");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029453,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.",
        "rgb_equation_alpha_equation.reverse_subtract_reverse_subtract");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029454,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frame",
        "buffer.rgb_equation_alpha_equation.reverse_subtract_min");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029455,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frame",
        "buffer.rgb_equation_alpha_equation.reverse_subtract_max");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029456,
        "dEQP-GLES3.functional.fragment_ops.blend.default",
        "_framebuffer.rgb_equation_alpha_equation.min_add");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029457,
        "dEQP-GLES3.functional.fragment_ops.blend.default_f",
        "ramebuffer.rgb_equation_alpha_equation.min_subtract");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029458,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frame",
        "buffer.rgb_equation_alpha_equation.min_reverse_subtract");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029459,
        "dEQP-GLES3.functional.fragment_ops.blend.default",
        "_framebuffer.rgb_equation_alpha_equation.min_min");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029460,
        "dEQP-GLES3.functional.fragment_ops.blend.default",
        "_framebuffer.rgb_equation_alpha_equation.min_max");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029461,
        "dEQP-GLES3.functional.fragment_ops.blend.default",
        "_framebuffer.rgb_equation_alpha_equation.max_add");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029462,
        "dEQP-GLES3.functional.fragment_ops.blend.default_f",
        "ramebuffer.rgb_equation_alpha_equation.max_subtract");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029463,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frame",
        "buffer.rgb_equation_alpha_equation.max_reverse_subtract");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029464,
        "dEQP-GLES3.functional.fragment_ops.blend.default",
        "_framebuffer.rgb_equation_alpha_equation.max_min");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029465,
        "dEQP-GLES3.functional.fragment_ops.blend.default",
        "_framebuffer.rgb_equation_alpha_equation.max_max");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030375,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb",
        ".rgb_func_alpha_func.dst.zero_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030376,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo",
        "_srgb.rgb_func_alpha_func.dst.zero_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030377,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb",
        ".rgb_func_alpha_func.dst.zero_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030378,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_s",
        "rgb.rgb_func_alpha_func.dst.zero_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030379,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.dst.zero_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030380,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_s",
        "rgb.rgb_func_alpha_func.dst.zero_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030381,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.dst.zero_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030382,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srg",
        "b.rgb_func_alpha_func.dst.zero_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030383,
        "dEQP-GLES3.functional.fragment_ops.blend.",
        "fbo_srgb.rgb_func_alpha_func.dst.one_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030384,
        "dEQP-GLES3.functional.fragment_ops.blend",
        ".fbo_srgb.rgb_func_alpha_func.dst.one_one");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030385,
        "dEQP-GLES3.functional.fragment_ops.blend.fb",
        "o_srgb.rgb_func_alpha_func.dst.one_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030386,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srg",
        "b.rgb_func_alpha_func.dst.one_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030387,
        "dEQP-GLES3.functional.fragment_ops.blend.fb",
        "o_srgb.rgb_func_alpha_func.dst.one_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030388,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srg",
        "b.rgb_func_alpha_func.dst.one_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030389,
        "dEQP-GLES3.functional.fragment_ops.blend.fb",
        "o_srgb.rgb_func_alpha_func.dst.one_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030390,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srg",
        "b.rgb_func_alpha_func.dst.one_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030391,
        "dEQP-GLES3.functional.fragment_ops.blend.fb",
        "o_srgb.rgb_func_alpha_func.dst.one_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030392,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srg",
        "b.rgb_func_alpha_func.dst.one_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030393,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_s",
        "rgb.rgb_func_alpha_func.dst.one_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030394,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.dst.one_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030395,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_s",
        "rgb.rgb_func_alpha_func.dst.one_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030396,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.dst.one_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030397,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srg",
        "b.rgb_func_alpha_func.dst.one_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030398,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo",
        "_srgb.rgb_func_alpha_func.dst.src_color_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030399,
        "dEQP-GLES3.functional.fragment_ops.blend.fb",
        "o_srgb.rgb_func_alpha_func.dst.src_color_one");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030400,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_s",
        "rgb.rgb_func_alpha_func.dst.src_color_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030401,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.dst.src_color_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030402,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_s",
        "rgb.rgb_func_alpha_func.dst.src_color_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030403,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.dst.src_color_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030404,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_s",
        "rgb.rgb_func_alpha_func.dst.src_color_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030405,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.dst.src_color_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030406,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_s",
        "rgb.rgb_func_alpha_func.dst.src_color_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030407,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.dst.src_color_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030408,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb",
        ".rgb_func_alpha_func.dst.src_color_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030409,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_",
        "func_alpha_func.dst.src_color_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030410,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb",
        ".rgb_func_alpha_func.dst.src_color_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030411,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_",
        "func_alpha_func.dst.src_color_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030412,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.dst.src_color_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030413,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb",
        ".rgb_func_alpha_func.dst.one_minus_src_color_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030414,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srg",
        "b.rgb_func_alpha_func.dst.one_minus_src_color_one");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030415,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.dst.one_minus_src_color_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030416,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_fu",
        "nc_alpha_func.dst.one_minus_src_color_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030417,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.dst.one_minus_src_color_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030418,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_fu",
        "nc_alpha_func.dst.one_minus_src_color_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030419,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.dst.one_minus_src_color_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030420,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_fu",
        "nc_alpha_func.dst.one_minus_src_color_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030421,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.dst.one_minus_src_color_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030422,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_fu",
        "nc_alpha_func.dst.one_minus_src_color_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030423,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_",
        "func_alpha_func.dst.one_minus_src_color_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030424,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_func_",
        "alpha_func.dst.one_minus_src_color_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030425,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_",
        "func_alpha_func.dst.one_minus_src_color_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030426,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_func_",
        "alpha_func.dst.one_minus_src_color_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030427,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_fu",
        "nc_alpha_func.dst.one_minus_src_color_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030428,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo",
        "_srgb.rgb_func_alpha_func.dst.dst_color_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030429,
        "dEQP-GLES3.functional.fragment_ops.blend.fb",
        "o_srgb.rgb_func_alpha_func.dst.dst_color_one");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030430,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_s",
        "rgb.rgb_func_alpha_func.dst.dst_color_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030431,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.dst.dst_color_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030432,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_s",
        "rgb.rgb_func_alpha_func.dst.dst_color_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030433,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.dst.dst_color_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030434,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_s",
        "rgb.rgb_func_alpha_func.dst.dst_color_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030435,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.dst.dst_color_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030436,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_s",
        "rgb.rgb_func_alpha_func.dst.dst_color_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030437,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.dst.dst_color_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030438,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb",
        ".rgb_func_alpha_func.dst.dst_color_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030439,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_",
        "func_alpha_func.dst.dst_color_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030440,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb",
        ".rgb_func_alpha_func.dst.dst_color_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030441,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_",
        "func_alpha_func.dst.dst_color_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030442,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.dst.dst_color_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030443,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb",
        ".rgb_func_alpha_func.dst.one_minus_dst_color_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030444,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srg",
        "b.rgb_func_alpha_func.dst.one_minus_dst_color_one");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030445,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.dst.one_minus_dst_color_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030446,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_fu",
        "nc_alpha_func.dst.one_minus_dst_color_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030447,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.dst.one_minus_dst_color_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030448,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_fu",
        "nc_alpha_func.dst.one_minus_dst_color_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030449,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.dst.one_minus_dst_color_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030450,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_fu",
        "nc_alpha_func.dst.one_minus_dst_color_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030451,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.dst.one_minus_dst_color_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030452,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_fu",
        "nc_alpha_func.dst.one_minus_dst_color_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030453,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_",
        "func_alpha_func.dst.one_minus_dst_color_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030454,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_func_",
        "alpha_func.dst.one_minus_dst_color_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030455,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_",
        "func_alpha_func.dst.one_minus_dst_color_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030456,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_func_",
        "alpha_func.dst.one_minus_dst_color_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030457,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_fu",
        "nc_alpha_func.dst.one_minus_dst_color_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030458,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo",
        "_srgb.rgb_func_alpha_func.dst.src_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030459,
        "dEQP-GLES3.functional.fragment_ops.blend.fb",
        "o_srgb.rgb_func_alpha_func.dst.src_alpha_one");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030460,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_s",
        "rgb.rgb_func_alpha_func.dst.src_alpha_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030461,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.dst.src_alpha_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030462,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_s",
        "rgb.rgb_func_alpha_func.dst.src_alpha_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030463,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.dst.src_alpha_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030464,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_s",
        "rgb.rgb_func_alpha_func.dst.src_alpha_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030465,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.dst.src_alpha_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030466,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_s",
        "rgb.rgb_func_alpha_func.dst.src_alpha_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030467,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.dst.src_alpha_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030468,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb",
        ".rgb_func_alpha_func.dst.src_alpha_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030469,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_",
        "func_alpha_func.dst.src_alpha_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030470,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb",
        ".rgb_func_alpha_func.dst.src_alpha_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030471,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_",
        "func_alpha_func.dst.src_alpha_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030472,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.dst.src_alpha_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030473,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb",
        ".rgb_func_alpha_func.dst.one_minus_src_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030474,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srg",
        "b.rgb_func_alpha_func.dst.one_minus_src_alpha_one");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030475,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.dst.one_minus_src_alpha_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030476,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_fu",
        "nc_alpha_func.dst.one_minus_src_alpha_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030477,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.dst.one_minus_src_alpha_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030478,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_fu",
        "nc_alpha_func.dst.one_minus_src_alpha_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030479,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.dst.one_minus_src_alpha_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030480,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_fu",
        "nc_alpha_func.dst.one_minus_src_alpha_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030481,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.dst.one_minus_src_alpha_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030482,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_fu",
        "nc_alpha_func.dst.one_minus_src_alpha_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030483,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_",
        "func_alpha_func.dst.one_minus_src_alpha_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030484,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_func_",
        "alpha_func.dst.one_minus_src_alpha_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030485,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_",
        "func_alpha_func.dst.one_minus_src_alpha_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030486,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_func_",
        "alpha_func.dst.one_minus_src_alpha_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030487,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_fu",
        "nc_alpha_func.dst.one_minus_src_alpha_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030488,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo",
        "_srgb.rgb_func_alpha_func.dst.dst_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030489,
        "dEQP-GLES3.functional.fragment_ops.blend.fb",
        "o_srgb.rgb_func_alpha_func.dst.dst_alpha_one");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030490,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_s",
        "rgb.rgb_func_alpha_func.dst.dst_alpha_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030491,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.dst.dst_alpha_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030492,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_s",
        "rgb.rgb_func_alpha_func.dst.dst_alpha_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030493,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.dst.dst_alpha_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030494,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_s",
        "rgb.rgb_func_alpha_func.dst.dst_alpha_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030495,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.dst.dst_alpha_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030496,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_s",
        "rgb.rgb_func_alpha_func.dst.dst_alpha_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030497,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.dst.dst_alpha_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030498,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb",
        ".rgb_func_alpha_func.dst.dst_alpha_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030499,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_",
        "func_alpha_func.dst.dst_alpha_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030500,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb",
        ".rgb_func_alpha_func.dst.dst_alpha_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030501,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_",
        "func_alpha_func.dst.dst_alpha_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030502,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.dst.dst_alpha_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030503,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb",
        ".rgb_func_alpha_func.dst.one_minus_dst_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030504,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srg",
        "b.rgb_func_alpha_func.dst.one_minus_dst_alpha_one");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030505,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.dst.one_minus_dst_alpha_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030506,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_fu",
        "nc_alpha_func.dst.one_minus_dst_alpha_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030507,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.dst.one_minus_dst_alpha_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030508,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_fu",
        "nc_alpha_func.dst.one_minus_dst_alpha_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030509,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.dst.one_minus_dst_alpha_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030510,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_fu",
        "nc_alpha_func.dst.one_minus_dst_alpha_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030511,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.dst.one_minus_dst_alpha_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030512,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_fu",
        "nc_alpha_func.dst.one_minus_dst_alpha_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030513,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_",
        "func_alpha_func.dst.one_minus_dst_alpha_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030514,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_func_",
        "alpha_func.dst.one_minus_dst_alpha_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030515,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_",
        "func_alpha_func.dst.one_minus_dst_alpha_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030516,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_func_",
        "alpha_func.dst.one_minus_dst_alpha_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030517,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_fu",
        "nc_alpha_func.dst.one_minus_dst_alpha_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030518,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_s",
        "rgb.rgb_func_alpha_func.dst.constant_color_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030519,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_s",
        "rgb.rgb_func_alpha_func.dst.constant_color_one");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030520,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb",
        ".rgb_func_alpha_func.dst.constant_color_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030521,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_",
        "func_alpha_func.dst.constant_color_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030522,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb",
        ".rgb_func_alpha_func.dst.constant_color_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030523,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_",
        "func_alpha_func.dst.constant_color_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030524,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb",
        ".rgb_func_alpha_func.dst.constant_color_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030525,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_",
        "func_alpha_func.dst.constant_color_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030526,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb",
        ".rgb_func_alpha_func.dst.constant_color_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030527,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_",
        "func_alpha_func.dst.constant_color_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030528,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.dst.constant_color_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030529,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_fu",
        "nc_alpha_func.dst.constant_color_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030530,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.dst.constant_color_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030531,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_fu",
        "nc_alpha_func.dst.constant_color_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030532,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb",
        "_func_alpha_func.dst.constant_color_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030533,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.dst.one_minus_constant_color_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030534,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.dst.one_minus_constant_color_one");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030535,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_",
        "func_alpha_func.dst.one_minus_constant_color_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030536,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_func_",
        "alpha_func.dst.one_minus_constant_color_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030537,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_",
        "func_alpha_func.dst.one_minus_constant_color_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030538,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_func_",
        "alpha_func.dst.one_minus_constant_color_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030539,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_",
        "func_alpha_func.dst.one_minus_constant_color_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030540,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_func_",
        "alpha_func.dst.one_minus_constant_color_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030541,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_",
        "func_alpha_func.dst.one_minus_constant_color_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030542,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_func_",
        "alpha_func.dst.one_minus_constant_color_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030543,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_fu",
        "nc_alpha_func.dst.one_minus_constant_color_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030544,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_func_al",
        "pha_func.dst.one_minus_constant_color_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030545,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_fu",
        "nc_alpha_func.dst.one_minus_constant_color_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030546,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_func_al",
        "pha_func.dst.one_minus_constant_color_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030547,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_func",
        "_alpha_func.dst.one_minus_constant_color_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030548,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_s",
        "rgb.rgb_func_alpha_func.dst.constant_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030549,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_s",
        "rgb.rgb_func_alpha_func.dst.constant_alpha_one");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030550,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb",
        ".rgb_func_alpha_func.dst.constant_alpha_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030551,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_",
        "func_alpha_func.dst.constant_alpha_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030552,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb",
        ".rgb_func_alpha_func.dst.constant_alpha_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030553,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_",
        "func_alpha_func.dst.constant_alpha_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030554,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb",
        ".rgb_func_alpha_func.dst.constant_alpha_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030555,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_",
        "func_alpha_func.dst.constant_alpha_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030556,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb",
        ".rgb_func_alpha_func.dst.constant_alpha_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030557,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_",
        "func_alpha_func.dst.constant_alpha_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030558,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.dst.constant_alpha_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030559,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_fu",
        "nc_alpha_func.dst.constant_alpha_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030560,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.dst.constant_alpha_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030561,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_fu",
        "nc_alpha_func.dst.constant_alpha_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030562,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb",
        "_func_alpha_func.dst.constant_alpha_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030563,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.dst.one_minus_constant_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030564,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.dst.one_minus_constant_alpha_one");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030565,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_",
        "func_alpha_func.dst.one_minus_constant_alpha_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030566,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_func_",
        "alpha_func.dst.one_minus_constant_alpha_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030567,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_",
        "func_alpha_func.dst.one_minus_constant_alpha_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030568,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_func_",
        "alpha_func.dst.one_minus_constant_alpha_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030569,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_",
        "func_alpha_func.dst.one_minus_constant_alpha_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030570,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_func_",
        "alpha_func.dst.one_minus_constant_alpha_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030571,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_",
        "func_alpha_func.dst.one_minus_constant_alpha_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030572,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_func_",
        "alpha_func.dst.one_minus_constant_alpha_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030573,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_fu",
        "nc_alpha_func.dst.one_minus_constant_alpha_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030574,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_func_al",
        "pha_func.dst.one_minus_constant_alpha_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030575,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_fu",
        "nc_alpha_func.dst.one_minus_constant_alpha_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030576,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_func_al",
        "pha_func.dst.one_minus_constant_alpha_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030577,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_func",
        "_alpha_func.dst.one_minus_constant_alpha_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030578,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srg",
        "b.rgb_func_alpha_func.dst.src_alpha_saturate_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030579,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srg",
        "b.rgb_func_alpha_func.dst.src_alpha_saturate_one");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030580,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.dst.src_alpha_saturate_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030581,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_fu",
        "nc_alpha_func.dst.src_alpha_saturate_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030582,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.dst.src_alpha_saturate_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030583,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_fu",
        "nc_alpha_func.dst.src_alpha_saturate_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030584,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.dst.src_alpha_saturate_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030585,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_fu",
        "nc_alpha_func.dst.src_alpha_saturate_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030586,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.r",
        "gb_func_alpha_func.dst.src_alpha_saturate_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030587,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_fu",
        "nc_alpha_func.dst.src_alpha_saturate_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030588,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb",
        "_func_alpha_func.dst.src_alpha_saturate_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030589,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_func",
        "_alpha_func.dst.src_alpha_saturate_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030590,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb",
        "_func_alpha_func.dst.src_alpha_saturate_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030591,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_func",
        "_alpha_func.dst.src_alpha_saturate_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030592,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.rgb_f",
        "unc_alpha_func.dst.src_alpha_saturate_src_alpha_saturate");
