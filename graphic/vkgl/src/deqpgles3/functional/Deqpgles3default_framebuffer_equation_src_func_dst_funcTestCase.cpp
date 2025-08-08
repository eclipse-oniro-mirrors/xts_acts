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
#include "../ActsDeqpgles30029TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028314,
        "dEQP-GLES3.functional.fragment_ops.blend.default_f",
        "ramebuffer.equation_src_func_dst_func.add_zero_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028315,
        "dEQP-GLES3.functional.fragment_ops.blend.default_f",
        "ramebuffer.equation_src_func_dst_func.add_zero_one");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028316,
        "dEQP-GLES3.functional.fragment_ops.blend.default_fram",
        "ebuffer.equation_src_func_dst_func.add_zero_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028317,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuff",
        "er.equation_src_func_dst_func.add_zero_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028318,
        "dEQP-GLES3.functional.fragment_ops.blend.default_fram",
        "ebuffer.equation_src_func_dst_func.add_zero_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028319,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuff",
        "er.equation_src_func_dst_func.add_zero_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028320,
        "dEQP-GLES3.functional.fragment_ops.blend.default_fram",
        "ebuffer.equation_src_func_dst_func.add_zero_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028321,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuff",
        "er.equation_src_func_dst_func.add_zero_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028322,
        "dEQP-GLES3.functional.fragment_ops.blend.default_fram",
        "ebuffer.equation_src_func_dst_func.add_zero_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028323,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuff",
        "er.equation_src_func_dst_func.add_zero_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028324,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frameb",
        "uffer.equation_src_func_dst_func.add_zero_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028325,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer",
        ".equation_src_func_dst_func.add_zero_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028326,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frameb",
        "uffer.equation_src_func_dst_func.add_zero_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028327,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer",
        ".equation_src_func_dst_func.add_zero_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028328,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.equation_src_func_dst_func.add_zero_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028329,
        "dEQP-GLES3.functional.fragment_ops.blend.default_f",
        "ramebuffer.equation_src_func_dst_func.add_one_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028330,
        "dEQP-GLES3.functional.fragment_ops.blend.default_",
        "framebuffer.equation_src_func_dst_func.add_one_one");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028331,
        "dEQP-GLES3.functional.fragment_ops.blend.default_fra",
        "mebuffer.equation_src_func_dst_func.add_one_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028332,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.equation_src_func_dst_func.add_one_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028333,
        "dEQP-GLES3.functional.fragment_ops.blend.default_fra",
        "mebuffer.equation_src_func_dst_func.add_one_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028334,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.equation_src_func_dst_func.add_one_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028335,
        "dEQP-GLES3.functional.fragment_ops.blend.default_fra",
        "mebuffer.equation_src_func_dst_func.add_one_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028336,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.equation_src_func_dst_func.add_one_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028337,
        "dEQP-GLES3.functional.fragment_ops.blend.default_fra",
        "mebuffer.equation_src_func_dst_func.add_one_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028338,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.equation_src_func_dst_func.add_one_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028339,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frameb",
        "uffer.equation_src_func_dst_func.add_one_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028340,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer",
        ".equation_src_func_dst_func.add_one_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028341,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frameb",
        "uffer.equation_src_func_dst_func.add_one_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028342,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer",
        ".equation_src_func_dst_func.add_one_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028343,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.equation_src_func_dst_func.add_one_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028344,
        "dEQP-GLES3.functional.fragment_ops.blend.default_fram",
        "ebuffer.equation_src_func_dst_func.add_src_color_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028345,
        "dEQP-GLES3.functional.fragment_ops.blend.default_fra",
        "mebuffer.equation_src_func_dst_func.add_src_color_one");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028346,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frameb",
        "uffer.equation_src_func_dst_func.add_src_color_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028347,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer",
        ".equation_src_func_dst_func.add_src_color_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028348,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frameb",
        "uffer.equation_src_func_dst_func.add_src_color_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028349,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer",
        ".equation_src_func_dst_func.add_src_color_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028350,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frameb",
        "uffer.equation_src_func_dst_func.add_src_color_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028351,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer",
        ".equation_src_func_dst_func.add_src_color_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028352,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frameb",
        "uffer.equation_src_func_dst_func.add_src_color_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028353,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer",
        ".equation_src_func_dst_func.add_src_color_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028354,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuff",
        "er.equation_src_func_dst_func.add_src_color_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028355,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.eq",
        "uation_src_func_dst_func.add_src_color_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028356,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuff",
        "er.equation_src_func_dst_func.add_src_color_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028357,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.eq",
        "uation_src_func_dst_func.add_src_color_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028358,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer",
        ".equation_src_func_dst_func.add_src_color_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028359,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuff",
        "er.equation_src_func_dst_func.add_one_minus_src_color_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028360,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.equation_src_func_dst_func.add_one_minus_src_color_one");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028361,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer",
        ".equation_src_func_dst_func.add_one_minus_src_color_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028362,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equa",
        "tion_src_func_dst_func.add_one_minus_src_color_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028363,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer",
        ".equation_src_func_dst_func.add_one_minus_src_color_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028364,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equa",
        "tion_src_func_dst_func.add_one_minus_src_color_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028365,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer",
        ".equation_src_func_dst_func.add_one_minus_src_color_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028366,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equa",
        "tion_src_func_dst_func.add_one_minus_src_color_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028367,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer",
        ".equation_src_func_dst_func.add_one_minus_src_color_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028368,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equa",
        "tion_src_func_dst_func.add_one_minus_src_color_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028369,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.eq",
        "uation_src_func_dst_func.add_one_minus_src_color_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028370,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equatio",
        "n_src_func_dst_func.add_one_minus_src_color_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028371,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.eq",
        "uation_src_func_dst_func.add_one_minus_src_color_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028372,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equatio",
        "n_src_func_dst_func.add_one_minus_src_color_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028373,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equa",
        "tion_src_func_dst_func.add_one_minus_src_color_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028374,
        "dEQP-GLES3.functional.fragment_ops.blend.default_fram",
        "ebuffer.equation_src_func_dst_func.add_dst_color_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028375,
        "dEQP-GLES3.functional.fragment_ops.blend.default_fra",
        "mebuffer.equation_src_func_dst_func.add_dst_color_one");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028376,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frameb",
        "uffer.equation_src_func_dst_func.add_dst_color_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028377,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer",
        ".equation_src_func_dst_func.add_dst_color_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028378,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frameb",
        "uffer.equation_src_func_dst_func.add_dst_color_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028379,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer",
        ".equation_src_func_dst_func.add_dst_color_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028380,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frameb",
        "uffer.equation_src_func_dst_func.add_dst_color_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028381,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer",
        ".equation_src_func_dst_func.add_dst_color_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028382,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frameb",
        "uffer.equation_src_func_dst_func.add_dst_color_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028383,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer",
        ".equation_src_func_dst_func.add_dst_color_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028384,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuff",
        "er.equation_src_func_dst_func.add_dst_color_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028385,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.eq",
        "uation_src_func_dst_func.add_dst_color_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028386,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuff",
        "er.equation_src_func_dst_func.add_dst_color_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028387,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.eq",
        "uation_src_func_dst_func.add_dst_color_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028388,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer",
        ".equation_src_func_dst_func.add_dst_color_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028389,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuff",
        "er.equation_src_func_dst_func.add_one_minus_dst_color_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028390,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.equation_src_func_dst_func.add_one_minus_dst_color_one");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028391,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer",
        ".equation_src_func_dst_func.add_one_minus_dst_color_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028392,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equa",
        "tion_src_func_dst_func.add_one_minus_dst_color_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028393,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer",
        ".equation_src_func_dst_func.add_one_minus_dst_color_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028394,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equa",
        "tion_src_func_dst_func.add_one_minus_dst_color_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028395,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer",
        ".equation_src_func_dst_func.add_one_minus_dst_color_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028396,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equa",
        "tion_src_func_dst_func.add_one_minus_dst_color_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028397,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer",
        ".equation_src_func_dst_func.add_one_minus_dst_color_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028398,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equa",
        "tion_src_func_dst_func.add_one_minus_dst_color_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028399,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.eq",
        "uation_src_func_dst_func.add_one_minus_dst_color_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028400,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equatio",
        "n_src_func_dst_func.add_one_minus_dst_color_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028401,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.eq",
        "uation_src_func_dst_func.add_one_minus_dst_color_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028402,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equatio",
        "n_src_func_dst_func.add_one_minus_dst_color_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028403,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equa",
        "tion_src_func_dst_func.add_one_minus_dst_color_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028404,
        "dEQP-GLES3.functional.fragment_ops.blend.default_fram",
        "ebuffer.equation_src_func_dst_func.add_src_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028405,
        "dEQP-GLES3.functional.fragment_ops.blend.default_fra",
        "mebuffer.equation_src_func_dst_func.add_src_alpha_one");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028406,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frameb",
        "uffer.equation_src_func_dst_func.add_src_alpha_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028407,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer",
        ".equation_src_func_dst_func.add_src_alpha_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028408,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frameb",
        "uffer.equation_src_func_dst_func.add_src_alpha_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028409,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer",
        ".equation_src_func_dst_func.add_src_alpha_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028410,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frameb",
        "uffer.equation_src_func_dst_func.add_src_alpha_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028411,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer",
        ".equation_src_func_dst_func.add_src_alpha_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028412,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frameb",
        "uffer.equation_src_func_dst_func.add_src_alpha_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028413,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer",
        ".equation_src_func_dst_func.add_src_alpha_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028414,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuff",
        "er.equation_src_func_dst_func.add_src_alpha_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028415,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.eq",
        "uation_src_func_dst_func.add_src_alpha_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028416,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuff",
        "er.equation_src_func_dst_func.add_src_alpha_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028417,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.eq",
        "uation_src_func_dst_func.add_src_alpha_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028418,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer",
        ".equation_src_func_dst_func.add_src_alpha_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028419,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuff",
        "er.equation_src_func_dst_func.add_one_minus_src_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028420,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.equation_src_func_dst_func.add_one_minus_src_alpha_one");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028421,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer",
        ".equation_src_func_dst_func.add_one_minus_src_alpha_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028422,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equa",
        "tion_src_func_dst_func.add_one_minus_src_alpha_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028423,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer",
        ".equation_src_func_dst_func.add_one_minus_src_alpha_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028424,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equa",
        "tion_src_func_dst_func.add_one_minus_src_alpha_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028425,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer",
        ".equation_src_func_dst_func.add_one_minus_src_alpha_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028426,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equa",
        "tion_src_func_dst_func.add_one_minus_src_alpha_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028427,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer",
        ".equation_src_func_dst_func.add_one_minus_src_alpha_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028428,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equa",
        "tion_src_func_dst_func.add_one_minus_src_alpha_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028429,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.eq",
        "uation_src_func_dst_func.add_one_minus_src_alpha_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028430,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equatio",
        "n_src_func_dst_func.add_one_minus_src_alpha_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028431,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.eq",
        "uation_src_func_dst_func.add_one_minus_src_alpha_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028432,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equatio",
        "n_src_func_dst_func.add_one_minus_src_alpha_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028433,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equa",
        "tion_src_func_dst_func.add_one_minus_src_alpha_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028434,
        "dEQP-GLES3.functional.fragment_ops.blend.default_fram",
        "ebuffer.equation_src_func_dst_func.add_dst_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028435,
        "dEQP-GLES3.functional.fragment_ops.blend.default_fra",
        "mebuffer.equation_src_func_dst_func.add_dst_alpha_one");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028436,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frameb",
        "uffer.equation_src_func_dst_func.add_dst_alpha_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028437,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer",
        ".equation_src_func_dst_func.add_dst_alpha_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028438,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frameb",
        "uffer.equation_src_func_dst_func.add_dst_alpha_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028439,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer",
        ".equation_src_func_dst_func.add_dst_alpha_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028440,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frameb",
        "uffer.equation_src_func_dst_func.add_dst_alpha_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028441,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer",
        ".equation_src_func_dst_func.add_dst_alpha_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028442,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frameb",
        "uffer.equation_src_func_dst_func.add_dst_alpha_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028443,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer",
        ".equation_src_func_dst_func.add_dst_alpha_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028444,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuff",
        "er.equation_src_func_dst_func.add_dst_alpha_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028445,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.eq",
        "uation_src_func_dst_func.add_dst_alpha_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028446,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuff",
        "er.equation_src_func_dst_func.add_dst_alpha_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028447,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.eq",
        "uation_src_func_dst_func.add_dst_alpha_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028448,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer",
        ".equation_src_func_dst_func.add_dst_alpha_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028449,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuff",
        "er.equation_src_func_dst_func.add_one_minus_dst_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028450,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.equation_src_func_dst_func.add_one_minus_dst_alpha_one");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028451,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer",
        ".equation_src_func_dst_func.add_one_minus_dst_alpha_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028452,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equa",
        "tion_src_func_dst_func.add_one_minus_dst_alpha_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028453,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer",
        ".equation_src_func_dst_func.add_one_minus_dst_alpha_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028454,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equa",
        "tion_src_func_dst_func.add_one_minus_dst_alpha_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028455,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer",
        ".equation_src_func_dst_func.add_one_minus_dst_alpha_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028456,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equa",
        "tion_src_func_dst_func.add_one_minus_dst_alpha_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028457,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer",
        ".equation_src_func_dst_func.add_one_minus_dst_alpha_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028458,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equa",
        "tion_src_func_dst_func.add_one_minus_dst_alpha_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028459,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.eq",
        "uation_src_func_dst_func.add_one_minus_dst_alpha_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028460,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equatio",
        "n_src_func_dst_func.add_one_minus_dst_alpha_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028461,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.eq",
        "uation_src_func_dst_func.add_one_minus_dst_alpha_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028462,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equatio",
        "n_src_func_dst_func.add_one_minus_dst_alpha_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028463,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equa",
        "tion_src_func_dst_func.add_one_minus_dst_alpha_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028464,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frameb",
        "uffer.equation_src_func_dst_func.add_constant_color_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028465,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frameb",
        "uffer.equation_src_func_dst_func.add_constant_color_one");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028466,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuff",
        "er.equation_src_func_dst_func.add_constant_color_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028467,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.eq",
        "uation_src_func_dst_func.add_constant_color_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028468,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuff",
        "er.equation_src_func_dst_func.add_constant_color_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028469,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.eq",
        "uation_src_func_dst_func.add_constant_color_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028470,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuff",
        "er.equation_src_func_dst_func.add_constant_color_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028471,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.eq",
        "uation_src_func_dst_func.add_constant_color_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028472,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuff",
        "er.equation_src_func_dst_func.add_constant_color_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028473,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.eq",
        "uation_src_func_dst_func.add_constant_color_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028474,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer",
        ".equation_src_func_dst_func.add_constant_color_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028475,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equa",
        "tion_src_func_dst_func.add_constant_color_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028476,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer",
        ".equation_src_func_dst_func.add_constant_color_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028477,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equa",
        "tion_src_func_dst_func.add_constant_color_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028478,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.e",
        "quation_src_func_dst_func.add_constant_color_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028479,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer",
        ".equation_src_func_dst_func.add_one_minus_constant_color_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028480,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer",
        ".equation_src_func_dst_func.add_one_minus_constant_color_one");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028481,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.eq",
        "uation_src_func_dst_func.add_one_minus_constant_color_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028482,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equatio",
        "n_src_func_dst_func.add_one_minus_constant_color_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028483,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.eq",
        "uation_src_func_dst_func.add_one_minus_constant_color_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028484,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equatio",
        "n_src_func_dst_func.add_one_minus_constant_color_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028485,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.eq",
        "uation_src_func_dst_func.add_one_minus_constant_color_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028486,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equatio",
        "n_src_func_dst_func.add_one_minus_constant_color_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028487,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.eq",
        "uation_src_func_dst_func.add_one_minus_constant_color_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028488,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equatio",
        "n_src_func_dst_func.add_one_minus_constant_color_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028489,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equa",
        "tion_src_func_dst_func.add_one_minus_constant_color_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028490,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation_",
        "src_func_dst_func.add_one_minus_constant_color_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028491,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equa",
        "tion_src_func_dst_func.add_one_minus_constant_color_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028492,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation_",
        "src_func_dst_func.add_one_minus_constant_color_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028493,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equati",
        "on_src_func_dst_func.add_one_minus_constant_color_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028494,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frameb",
        "uffer.equation_src_func_dst_func.add_constant_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028495,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frameb",
        "uffer.equation_src_func_dst_func.add_constant_alpha_one");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028496,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuff",
        "er.equation_src_func_dst_func.add_constant_alpha_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028497,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.eq",
        "uation_src_func_dst_func.add_constant_alpha_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028498,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuff",
        "er.equation_src_func_dst_func.add_constant_alpha_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028499,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.eq",
        "uation_src_func_dst_func.add_constant_alpha_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028500,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuff",
        "er.equation_src_func_dst_func.add_constant_alpha_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028501,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.eq",
        "uation_src_func_dst_func.add_constant_alpha_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028502,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuff",
        "er.equation_src_func_dst_func.add_constant_alpha_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028503,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.eq",
        "uation_src_func_dst_func.add_constant_alpha_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028504,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer",
        ".equation_src_func_dst_func.add_constant_alpha_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028505,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equa",
        "tion_src_func_dst_func.add_constant_alpha_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028506,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer",
        ".equation_src_func_dst_func.add_constant_alpha_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028507,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equa",
        "tion_src_func_dst_func.add_constant_alpha_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028508,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.e",
        "quation_src_func_dst_func.add_constant_alpha_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028509,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer",
        ".equation_src_func_dst_func.add_one_minus_constant_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028510,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer",
        ".equation_src_func_dst_func.add_one_minus_constant_alpha_one");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028511,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.eq",
        "uation_src_func_dst_func.add_one_minus_constant_alpha_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028512,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equatio",
        "n_src_func_dst_func.add_one_minus_constant_alpha_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028513,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.eq",
        "uation_src_func_dst_func.add_one_minus_constant_alpha_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028514,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equatio",
        "n_src_func_dst_func.add_one_minus_constant_alpha_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028515,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.eq",
        "uation_src_func_dst_func.add_one_minus_constant_alpha_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028516,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equatio",
        "n_src_func_dst_func.add_one_minus_constant_alpha_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028517,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.eq",
        "uation_src_func_dst_func.add_one_minus_constant_alpha_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028518,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equatio",
        "n_src_func_dst_func.add_one_minus_constant_alpha_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028519,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equa",
        "tion_src_func_dst_func.add_one_minus_constant_alpha_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028520,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation_",
        "src_func_dst_func.add_one_minus_constant_alpha_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028521,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equa",
        "tion_src_func_dst_func.add_one_minus_constant_alpha_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028522,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation_",
        "src_func_dst_func.add_one_minus_constant_alpha_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028523,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equati",
        "on_src_func_dst_func.add_one_minus_constant_alpha_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028524,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.equation_src_func_dst_func.add_src_alpha_saturate_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028525,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.equation_src_func_dst_func.add_src_alpha_saturate_one");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028526,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer",
        ".equation_src_func_dst_func.add_src_alpha_saturate_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028527,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equa",
        "tion_src_func_dst_func.add_src_alpha_saturate_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028528,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer",
        ".equation_src_func_dst_func.add_src_alpha_saturate_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028529,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equa",
        "tion_src_func_dst_func.add_src_alpha_saturate_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028530,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer",
        ".equation_src_func_dst_func.add_src_alpha_saturate_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028531,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equa",
        "tion_src_func_dst_func.add_src_alpha_saturate_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028532,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer",
        ".equation_src_func_dst_func.add_src_alpha_saturate_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028533,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equa",
        "tion_src_func_dst_func.add_src_alpha_saturate_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028534,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.e",
        "quation_src_func_dst_func.add_src_alpha_saturate_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028535,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equati",
        "on_src_func_dst_func.add_src_alpha_saturate_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028536,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.e",
        "quation_src_func_dst_func.add_src_alpha_saturate_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028537,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equati",
        "on_src_func_dst_func.add_src_alpha_saturate_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028538,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equ",
        "ation_src_func_dst_func.add_src_alpha_saturate_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028539,
        "dEQP-GLES3.functional.fragment_ops.blend.default_fram",
        "ebuffer.equation_src_func_dst_func.subtract_zero_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028540,
        "dEQP-GLES3.functional.fragment_ops.blend.default_fra",
        "mebuffer.equation_src_func_dst_func.subtract_zero_one");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028541,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frameb",
        "uffer.equation_src_func_dst_func.subtract_zero_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028542,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer",
        ".equation_src_func_dst_func.subtract_zero_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028543,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frameb",
        "uffer.equation_src_func_dst_func.subtract_zero_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028544,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer",
        ".equation_src_func_dst_func.subtract_zero_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028545,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frameb",
        "uffer.equation_src_func_dst_func.subtract_zero_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028546,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer",
        ".equation_src_func_dst_func.subtract_zero_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028547,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frameb",
        "uffer.equation_src_func_dst_func.subtract_zero_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028548,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer",
        ".equation_src_func_dst_func.subtract_zero_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028549,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuff",
        "er.equation_src_func_dst_func.subtract_zero_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028550,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.eq",
        "uation_src_func_dst_func.subtract_zero_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028551,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuff",
        "er.equation_src_func_dst_func.subtract_zero_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028552,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.eq",
        "uation_src_func_dst_func.subtract_zero_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028553,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer",
        ".equation_src_func_dst_func.subtract_zero_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028554,
        "dEQP-GLES3.functional.fragment_ops.blend.default_fra",
        "mebuffer.equation_src_func_dst_func.subtract_one_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028555,
        "dEQP-GLES3.functional.fragment_ops.blend.default_fra",
        "mebuffer.equation_src_func_dst_func.subtract_one_one");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028556,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frameb",
        "uffer.equation_src_func_dst_func.subtract_one_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028557,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer",
        ".equation_src_func_dst_func.subtract_one_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028558,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frameb",
        "uffer.equation_src_func_dst_func.subtract_one_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028559,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer",
        ".equation_src_func_dst_func.subtract_one_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028560,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frameb",
        "uffer.equation_src_func_dst_func.subtract_one_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028561,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer",
        ".equation_src_func_dst_func.subtract_one_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028562,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frameb",
        "uffer.equation_src_func_dst_func.subtract_one_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028563,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer",
        ".equation_src_func_dst_func.subtract_one_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028564,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.equation_src_func_dst_func.subtract_one_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028565,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.e",
        "quation_src_func_dst_func.subtract_one_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028566,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.equation_src_func_dst_func.subtract_one_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028567,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.e",
        "quation_src_func_dst_func.subtract_one_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028568,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffe",
        "r.equation_src_func_dst_func.subtract_one_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028569,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frameb",
        "uffer.equation_src_func_dst_func.subtract_src_color_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028570,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frameb",
        "uffer.equation_src_func_dst_func.subtract_src_color_one");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028571,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuff",
        "er.equation_src_func_dst_func.subtract_src_color_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028572,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.eq",
        "uation_src_func_dst_func.subtract_src_color_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028573,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuff",
        "er.equation_src_func_dst_func.subtract_src_color_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028574,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.eq",
        "uation_src_func_dst_func.subtract_src_color_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028575,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuff",
        "er.equation_src_func_dst_func.subtract_src_color_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028576,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.eq",
        "uation_src_func_dst_func.subtract_src_color_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028577,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuff",
        "er.equation_src_func_dst_func.subtract_src_color_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028578,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.eq",
        "uation_src_func_dst_func.subtract_src_color_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028579,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer",
        ".equation_src_func_dst_func.subtract_src_color_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028580,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equa",
        "tion_src_func_dst_func.subtract_src_color_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028581,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer",
        ".equation_src_func_dst_func.subtract_src_color_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028582,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equa",
        "tion_src_func_dst_func.subtract_src_color_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028583,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.e",
        "quation_src_func_dst_func.subtract_src_color_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028584,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer",
        ".equation_src_func_dst_func.subtract_one_minus_src_color_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028585,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer",
        ".equation_src_func_dst_func.subtract_one_minus_src_color_one");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028586,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.eq",
        "uation_src_func_dst_func.subtract_one_minus_src_color_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028587,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equatio",
        "n_src_func_dst_func.subtract_one_minus_src_color_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028588,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.eq",
        "uation_src_func_dst_func.subtract_one_minus_src_color_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028589,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equatio",
        "n_src_func_dst_func.subtract_one_minus_src_color_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028590,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.eq",
        "uation_src_func_dst_func.subtract_one_minus_src_color_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028591,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equatio",
        "n_src_func_dst_func.subtract_one_minus_src_color_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028592,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.eq",
        "uation_src_func_dst_func.subtract_one_minus_src_color_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028593,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equatio",
        "n_src_func_dst_func.subtract_one_minus_src_color_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028594,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equa",
        "tion_src_func_dst_func.subtract_one_minus_src_color_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028595,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation_",
        "src_func_dst_func.subtract_one_minus_src_color_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028596,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equa",
        "tion_src_func_dst_func.subtract_one_minus_src_color_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028597,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation_",
        "src_func_dst_func.subtract_one_minus_src_color_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028598,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equati",
        "on_src_func_dst_func.subtract_one_minus_src_color_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028599,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frameb",
        "uffer.equation_src_func_dst_func.subtract_dst_color_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028600,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frameb",
        "uffer.equation_src_func_dst_func.subtract_dst_color_one");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028601,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuff",
        "er.equation_src_func_dst_func.subtract_dst_color_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028602,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.eq",
        "uation_src_func_dst_func.subtract_dst_color_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028603,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuff",
        "er.equation_src_func_dst_func.subtract_dst_color_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028604,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.eq",
        "uation_src_func_dst_func.subtract_dst_color_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028605,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuff",
        "er.equation_src_func_dst_func.subtract_dst_color_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028606,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.eq",
        "uation_src_func_dst_func.subtract_dst_color_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028607,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuff",
        "er.equation_src_func_dst_func.subtract_dst_color_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028608,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.eq",
        "uation_src_func_dst_func.subtract_dst_color_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028609,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer",
        ".equation_src_func_dst_func.subtract_dst_color_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028610,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equa",
        "tion_src_func_dst_func.subtract_dst_color_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028611,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer",
        ".equation_src_func_dst_func.subtract_dst_color_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028612,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equa",
        "tion_src_func_dst_func.subtract_dst_color_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028613,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.e",
        "quation_src_func_dst_func.subtract_dst_color_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028614,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer",
        ".equation_src_func_dst_func.subtract_one_minus_dst_color_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028615,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer",
        ".equation_src_func_dst_func.subtract_one_minus_dst_color_one");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028616,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.eq",
        "uation_src_func_dst_func.subtract_one_minus_dst_color_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028617,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equatio",
        "n_src_func_dst_func.subtract_one_minus_dst_color_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028618,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.eq",
        "uation_src_func_dst_func.subtract_one_minus_dst_color_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028619,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equatio",
        "n_src_func_dst_func.subtract_one_minus_dst_color_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028620,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.eq",
        "uation_src_func_dst_func.subtract_one_minus_dst_color_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028621,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equatio",
        "n_src_func_dst_func.subtract_one_minus_dst_color_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028622,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.eq",
        "uation_src_func_dst_func.subtract_one_minus_dst_color_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028623,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equatio",
        "n_src_func_dst_func.subtract_one_minus_dst_color_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028624,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equa",
        "tion_src_func_dst_func.subtract_one_minus_dst_color_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028625,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation_",
        "src_func_dst_func.subtract_one_minus_dst_color_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028626,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equa",
        "tion_src_func_dst_func.subtract_one_minus_dst_color_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028627,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation_",
        "src_func_dst_func.subtract_one_minus_dst_color_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028628,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equati",
        "on_src_func_dst_func.subtract_one_minus_dst_color_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028629,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frameb",
        "uffer.equation_src_func_dst_func.subtract_src_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028630,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frameb",
        "uffer.equation_src_func_dst_func.subtract_src_alpha_one");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028631,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuff",
        "er.equation_src_func_dst_func.subtract_src_alpha_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028632,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.eq",
        "uation_src_func_dst_func.subtract_src_alpha_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028633,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuff",
        "er.equation_src_func_dst_func.subtract_src_alpha_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028634,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.eq",
        "uation_src_func_dst_func.subtract_src_alpha_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028635,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuff",
        "er.equation_src_func_dst_func.subtract_src_alpha_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028636,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.eq",
        "uation_src_func_dst_func.subtract_src_alpha_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028637,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuff",
        "er.equation_src_func_dst_func.subtract_src_alpha_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028638,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.eq",
        "uation_src_func_dst_func.subtract_src_alpha_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028639,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer",
        ".equation_src_func_dst_func.subtract_src_alpha_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028640,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equa",
        "tion_src_func_dst_func.subtract_src_alpha_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028641,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer",
        ".equation_src_func_dst_func.subtract_src_alpha_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028642,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equa",
        "tion_src_func_dst_func.subtract_src_alpha_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028643,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.e",
        "quation_src_func_dst_func.subtract_src_alpha_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028644,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer",
        ".equation_src_func_dst_func.subtract_one_minus_src_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028645,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer",
        ".equation_src_func_dst_func.subtract_one_minus_src_alpha_one");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028646,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.eq",
        "uation_src_func_dst_func.subtract_one_minus_src_alpha_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028647,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equatio",
        "n_src_func_dst_func.subtract_one_minus_src_alpha_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028648,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.eq",
        "uation_src_func_dst_func.subtract_one_minus_src_alpha_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028649,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equatio",
        "n_src_func_dst_func.subtract_one_minus_src_alpha_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028650,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.eq",
        "uation_src_func_dst_func.subtract_one_minus_src_alpha_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028651,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equatio",
        "n_src_func_dst_func.subtract_one_minus_src_alpha_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028652,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.eq",
        "uation_src_func_dst_func.subtract_one_minus_src_alpha_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028653,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equatio",
        "n_src_func_dst_func.subtract_one_minus_src_alpha_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028654,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equa",
        "tion_src_func_dst_func.subtract_one_minus_src_alpha_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028655,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation_",
        "src_func_dst_func.subtract_one_minus_src_alpha_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028656,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equa",
        "tion_src_func_dst_func.subtract_one_minus_src_alpha_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028657,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation_",
        "src_func_dst_func.subtract_one_minus_src_alpha_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028658,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equati",
        "on_src_func_dst_func.subtract_one_minus_src_alpha_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028659,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frameb",
        "uffer.equation_src_func_dst_func.subtract_dst_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028660,
        "dEQP-GLES3.functional.fragment_ops.blend.default_frameb",
        "uffer.equation_src_func_dst_func.subtract_dst_alpha_one");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028661,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuff",
        "er.equation_src_func_dst_func.subtract_dst_alpha_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028662,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.eq",
        "uation_src_func_dst_func.subtract_dst_alpha_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028663,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuff",
        "er.equation_src_func_dst_func.subtract_dst_alpha_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028664,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.eq",
        "uation_src_func_dst_func.subtract_dst_alpha_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028665,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuff",
        "er.equation_src_func_dst_func.subtract_dst_alpha_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028666,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.eq",
        "uation_src_func_dst_func.subtract_dst_alpha_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028667,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuff",
        "er.equation_src_func_dst_func.subtract_dst_alpha_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028668,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.eq",
        "uation_src_func_dst_func.subtract_dst_alpha_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028669,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer",
        ".equation_src_func_dst_func.subtract_dst_alpha_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028670,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equa",
        "tion_src_func_dst_func.subtract_dst_alpha_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028671,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer",
        ".equation_src_func_dst_func.subtract_dst_alpha_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028672,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equa",
        "tion_src_func_dst_func.subtract_dst_alpha_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028673,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.e",
        "quation_src_func_dst_func.subtract_dst_alpha_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028674,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer",
        ".equation_src_func_dst_func.subtract_one_minus_dst_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028675,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer",
        ".equation_src_func_dst_func.subtract_one_minus_dst_alpha_one");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028676,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.eq",
        "uation_src_func_dst_func.subtract_one_minus_dst_alpha_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028677,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equatio",
        "n_src_func_dst_func.subtract_one_minus_dst_alpha_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028678,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.eq",
        "uation_src_func_dst_func.subtract_one_minus_dst_alpha_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028679,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equatio",
        "n_src_func_dst_func.subtract_one_minus_dst_alpha_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028680,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.eq",
        "uation_src_func_dst_func.subtract_one_minus_dst_alpha_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028681,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equatio",
        "n_src_func_dst_func.subtract_one_minus_dst_alpha_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028682,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.eq",
        "uation_src_func_dst_func.subtract_one_minus_dst_alpha_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028683,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equatio",
        "n_src_func_dst_func.subtract_one_minus_dst_alpha_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028684,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equa",
        "tion_src_func_dst_func.subtract_one_minus_dst_alpha_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028685,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation_",
        "src_func_dst_func.subtract_one_minus_dst_alpha_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028686,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equa",
        "tion_src_func_dst_func.subtract_one_minus_dst_alpha_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028687,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation_",
        "src_func_dst_func.subtract_one_minus_dst_alpha_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028688,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equati",
        "on_src_func_dst_func.subtract_one_minus_dst_alpha_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028689,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuff",
        "er.equation_src_func_dst_func.subtract_constant_color_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028690,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.equation_src_func_dst_func.subtract_constant_color_one");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028691,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer",
        ".equation_src_func_dst_func.subtract_constant_color_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028692,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equa",
        "tion_src_func_dst_func.subtract_constant_color_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028693,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer",
        ".equation_src_func_dst_func.subtract_constant_color_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028694,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equa",
        "tion_src_func_dst_func.subtract_constant_color_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028695,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer",
        ".equation_src_func_dst_func.subtract_constant_color_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028696,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equa",
        "tion_src_func_dst_func.subtract_constant_color_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028697,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer",
        ".equation_src_func_dst_func.subtract_constant_color_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028698,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equa",
        "tion_src_func_dst_func.subtract_constant_color_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028699,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.eq",
        "uation_src_func_dst_func.subtract_constant_color_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028700,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equatio",
        "n_src_func_dst_func.subtract_constant_color_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028701,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.eq",
        "uation_src_func_dst_func.subtract_constant_color_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028702,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equatio",
        "n_src_func_dst_func.subtract_constant_color_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028703,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equa",
        "tion_src_func_dst_func.subtract_constant_color_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028704,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.eq",
        "uation_src_func_dst_func.subtract_one_minus_constant_color_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028705,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.e",
        "quation_src_func_dst_func.subtract_one_minus_constant_color_one");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028706,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equa",
        "tion_src_func_dst_func.subtract_one_minus_constant_color_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028707,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation_",
        "src_func_dst_func.subtract_one_minus_constant_color_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028708,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equa",
        "tion_src_func_dst_func.subtract_one_minus_constant_color_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028709,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation_",
        "src_func_dst_func.subtract_one_minus_constant_color_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028710,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equa",
        "tion_src_func_dst_func.subtract_one_minus_constant_color_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028711,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation_",
        "src_func_dst_func.subtract_one_minus_constant_color_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028712,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equa",
        "tion_src_func_dst_func.subtract_one_minus_constant_color_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028713,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation_",
        "src_func_dst_func.subtract_one_minus_constant_color_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028714,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equatio",
        "n_src_func_dst_func.subtract_one_minus_constant_color_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028715,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation_src",
        "_func_dst_func.subtract_one_minus_constant_color_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028716,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equatio",
        "n_src_func_dst_func.subtract_one_minus_constant_color_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028717,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation_src",
        "_func_dst_func.subtract_one_minus_constant_color_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028718,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation_",
        "src_func_dst_func.subtract_one_minus_constant_color_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028719,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuff",
        "er.equation_src_func_dst_func.subtract_constant_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028720,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.equation_src_func_dst_func.subtract_constant_alpha_one");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028721,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer",
        ".equation_src_func_dst_func.subtract_constant_alpha_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028722,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equa",
        "tion_src_func_dst_func.subtract_constant_alpha_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028723,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer",
        ".equation_src_func_dst_func.subtract_constant_alpha_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028724,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equa",
        "tion_src_func_dst_func.subtract_constant_alpha_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028725,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer",
        ".equation_src_func_dst_func.subtract_constant_alpha_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028726,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equa",
        "tion_src_func_dst_func.subtract_constant_alpha_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028727,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer",
        ".equation_src_func_dst_func.subtract_constant_alpha_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028728,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equa",
        "tion_src_func_dst_func.subtract_constant_alpha_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028729,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.eq",
        "uation_src_func_dst_func.subtract_constant_alpha_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028730,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equatio",
        "n_src_func_dst_func.subtract_constant_alpha_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028731,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.eq",
        "uation_src_func_dst_func.subtract_constant_alpha_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028732,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equatio",
        "n_src_func_dst_func.subtract_constant_alpha_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028733,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equa",
        "tion_src_func_dst_func.subtract_constant_alpha_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028734,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.eq",
        "uation_src_func_dst_func.subtract_one_minus_constant_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028735,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.e",
        "quation_src_func_dst_func.subtract_one_minus_constant_alpha_one");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028736,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equa",
        "tion_src_func_dst_func.subtract_one_minus_constant_alpha_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028737,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation_",
        "src_func_dst_func.subtract_one_minus_constant_alpha_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028738,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equa",
        "tion_src_func_dst_func.subtract_one_minus_constant_alpha_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028739,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation_",
        "src_func_dst_func.subtract_one_minus_constant_alpha_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028740,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equa",
        "tion_src_func_dst_func.subtract_one_minus_constant_alpha_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028741,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation_",
        "src_func_dst_func.subtract_one_minus_constant_alpha_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028742,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equa",
        "tion_src_func_dst_func.subtract_one_minus_constant_alpha_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028743,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation_",
        "src_func_dst_func.subtract_one_minus_constant_alpha_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028744,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equatio",
        "n_src_func_dst_func.subtract_one_minus_constant_alpha_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028745,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation_src",
        "_func_dst_func.subtract_one_minus_constant_alpha_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028746,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equatio",
        "n_src_func_dst_func.subtract_one_minus_constant_alpha_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028747,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation_src",
        "_func_dst_func.subtract_one_minus_constant_alpha_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028748,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation_",
        "src_func_dst_func.subtract_one_minus_constant_alpha_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028749,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer",
        ".equation_src_func_dst_func.subtract_src_alpha_saturate_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028750,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffe",
        "r.equation_src_func_dst_func.subtract_src_alpha_saturate_one");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028751,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.e",
        "quation_src_func_dst_func.subtract_src_alpha_saturate_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028752,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equati",
        "on_src_func_dst_func.subtract_src_alpha_saturate_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028753,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.e",
        "quation_src_func_dst_func.subtract_src_alpha_saturate_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028754,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equati",
        "on_src_func_dst_func.subtract_src_alpha_saturate_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028755,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.e",
        "quation_src_func_dst_func.subtract_src_alpha_saturate_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028756,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equati",
        "on_src_func_dst_func.subtract_src_alpha_saturate_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028757,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.e",
        "quation_src_func_dst_func.subtract_src_alpha_saturate_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028758,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equati",
        "on_src_func_dst_func.subtract_src_alpha_saturate_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028759,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equa",
        "tion_src_func_dst_func.subtract_src_alpha_saturate_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028760,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation_",
        "src_func_dst_func.subtract_src_alpha_saturate_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028761,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equa",
        "tion_src_func_dst_func.subtract_src_alpha_saturate_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028762,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation_",
        "src_func_dst_func.subtract_src_alpha_saturate_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028763,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equati",
        "on_src_func_dst_func.subtract_src_alpha_saturate_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028764,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuf",
        "fer.equation_src_func_dst_func.reverse_subtract_zero_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028765,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebu",
        "ffer.equation_src_func_dst_func.reverse_subtract_zero_one");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028766,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffe",
        "r.equation_src_func_dst_func.reverse_subtract_zero_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028767,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equ",
        "ation_src_func_dst_func.reverse_subtract_zero_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028768,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffe",
        "r.equation_src_func_dst_func.reverse_subtract_zero_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028769,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equ",
        "ation_src_func_dst_func.reverse_subtract_zero_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028770,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffe",
        "r.equation_src_func_dst_func.reverse_subtract_zero_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028771,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equ",
        "ation_src_func_dst_func.reverse_subtract_zero_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028772,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffe",
        "r.equation_src_func_dst_func.reverse_subtract_zero_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028773,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equ",
        "ation_src_func_dst_func.reverse_subtract_zero_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028774,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.e",
        "quation_src_func_dst_func.reverse_subtract_zero_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028775,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equati",
        "on_src_func_dst_func.reverse_subtract_zero_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028776,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.e",
        "quation_src_func_dst_func.reverse_subtract_zero_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028777,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equati",
        "on_src_func_dst_func.reverse_subtract_zero_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028778,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equ",
        "ation_src_func_dst_func.reverse_subtract_zero_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028779,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebu",
        "ffer.equation_src_func_dst_func.reverse_subtract_one_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028780,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebu",
        "ffer.equation_src_func_dst_func.reverse_subtract_one_one");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028781,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffe",
        "r.equation_src_func_dst_func.reverse_subtract_one_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028782,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equ",
        "ation_src_func_dst_func.reverse_subtract_one_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028783,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffe",
        "r.equation_src_func_dst_func.reverse_subtract_one_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028784,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equ",
        "ation_src_func_dst_func.reverse_subtract_one_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028785,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffe",
        "r.equation_src_func_dst_func.reverse_subtract_one_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028786,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equ",
        "ation_src_func_dst_func.reverse_subtract_one_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028787,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffe",
        "r.equation_src_func_dst_func.reverse_subtract_one_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028788,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equ",
        "ation_src_func_dst_func.reverse_subtract_one_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028789,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.",
        "equation_src_func_dst_func.reverse_subtract_one_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028790,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equat",
        "ion_src_func_dst_func.reverse_subtract_one_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028791,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.",
        "equation_src_func_dst_func.reverse_subtract_one_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028792,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equat",
        "ion_src_func_dst_func.reverse_subtract_one_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028793,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.eq",
        "uation_src_func_dst_func.reverse_subtract_one_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028794,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffe",
        "r.equation_src_func_dst_func.reverse_subtract_src_color_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028795,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffe",
        "r.equation_src_func_dst_func.reverse_subtract_src_color_one");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028796,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.e",
        "quation_src_func_dst_func.reverse_subtract_src_color_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028797,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equati",
        "on_src_func_dst_func.reverse_subtract_src_color_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028798,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.e",
        "quation_src_func_dst_func.reverse_subtract_src_color_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028799,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equati",
        "on_src_func_dst_func.reverse_subtract_src_color_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028800,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.e",
        "quation_src_func_dst_func.reverse_subtract_src_color_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028801,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equati",
        "on_src_func_dst_func.reverse_subtract_src_color_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028802,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.e",
        "quation_src_func_dst_func.reverse_subtract_src_color_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028803,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equati",
        "on_src_func_dst_func.reverse_subtract_src_color_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028804,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equ",
        "ation_src_func_dst_func.reverse_subtract_src_color_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028805,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation",
        "_src_func_dst_func.reverse_subtract_src_color_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028806,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equ",
        "ation_src_func_dst_func.reverse_subtract_src_color_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028807,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation",
        "_src_func_dst_func.reverse_subtract_src_color_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028808,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equat",
        "ion_src_func_dst_func.reverse_subtract_src_color_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028809,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equ",
        "ation_src_func_dst_func.reverse_subtract_one_minus_src_color_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028810,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equ",
        "ation_src_func_dst_func.reverse_subtract_one_minus_src_color_one");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028811,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equati",
        "on_src_func_dst_func.reverse_subtract_one_minus_src_color_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028812,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation_sr",
        "c_func_dst_func.reverse_subtract_one_minus_src_color_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028813,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equati",
        "on_src_func_dst_func.reverse_subtract_one_minus_src_color_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028814,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation_sr",
        "c_func_dst_func.reverse_subtract_one_minus_src_color_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028815,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equati",
        "on_src_func_dst_func.reverse_subtract_one_minus_src_color_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028816,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation_sr",
        "c_func_dst_func.reverse_subtract_one_minus_src_color_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028817,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equati",
        "on_src_func_dst_func.reverse_subtract_one_minus_src_color_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028818,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation_sr",
        "c_func_dst_func.reverse_subtract_one_minus_src_color_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028819,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation",
        "_src_func_dst_func.reverse_subtract_one_minus_src_color_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028820,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation_src_",
        "func_dst_func.reverse_subtract_one_minus_src_color_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028821,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation",
        "_src_func_dst_func.reverse_subtract_one_minus_src_color_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028822,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation_src_",
        "func_dst_func.reverse_subtract_one_minus_src_color_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028823,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation_s",
        "rc_func_dst_func.reverse_subtract_one_minus_src_color_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028824,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffe",
        "r.equation_src_func_dst_func.reverse_subtract_dst_color_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028825,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffe",
        "r.equation_src_func_dst_func.reverse_subtract_dst_color_one");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028826,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.e",
        "quation_src_func_dst_func.reverse_subtract_dst_color_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028827,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equati",
        "on_src_func_dst_func.reverse_subtract_dst_color_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028828,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.e",
        "quation_src_func_dst_func.reverse_subtract_dst_color_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028829,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equati",
        "on_src_func_dst_func.reverse_subtract_dst_color_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028830,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.e",
        "quation_src_func_dst_func.reverse_subtract_dst_color_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028831,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equati",
        "on_src_func_dst_func.reverse_subtract_dst_color_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028832,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.e",
        "quation_src_func_dst_func.reverse_subtract_dst_color_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028833,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equati",
        "on_src_func_dst_func.reverse_subtract_dst_color_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028834,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equ",
        "ation_src_func_dst_func.reverse_subtract_dst_color_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028835,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation",
        "_src_func_dst_func.reverse_subtract_dst_color_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028836,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equ",
        "ation_src_func_dst_func.reverse_subtract_dst_color_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028837,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation",
        "_src_func_dst_func.reverse_subtract_dst_color_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028838,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equat",
        "ion_src_func_dst_func.reverse_subtract_dst_color_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028839,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equ",
        "ation_src_func_dst_func.reverse_subtract_one_minus_dst_color_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028840,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equ",
        "ation_src_func_dst_func.reverse_subtract_one_minus_dst_color_one");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028841,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equati",
        "on_src_func_dst_func.reverse_subtract_one_minus_dst_color_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028842,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation_sr",
        "c_func_dst_func.reverse_subtract_one_minus_dst_color_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028843,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equati",
        "on_src_func_dst_func.reverse_subtract_one_minus_dst_color_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028844,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation_sr",
        "c_func_dst_func.reverse_subtract_one_minus_dst_color_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028845,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equati",
        "on_src_func_dst_func.reverse_subtract_one_minus_dst_color_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028846,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation_sr",
        "c_func_dst_func.reverse_subtract_one_minus_dst_color_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028847,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equati",
        "on_src_func_dst_func.reverse_subtract_one_minus_dst_color_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028848,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation_sr",
        "c_func_dst_func.reverse_subtract_one_minus_dst_color_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028849,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation",
        "_src_func_dst_func.reverse_subtract_one_minus_dst_color_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028850,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation_src_",
        "func_dst_func.reverse_subtract_one_minus_dst_color_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028851,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation",
        "_src_func_dst_func.reverse_subtract_one_minus_dst_color_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028852,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation_src_",
        "func_dst_func.reverse_subtract_one_minus_dst_color_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028853,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation_s",
        "rc_func_dst_func.reverse_subtract_one_minus_dst_color_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028854,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffe",
        "r.equation_src_func_dst_func.reverse_subtract_src_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028855,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffe",
        "r.equation_src_func_dst_func.reverse_subtract_src_alpha_one");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028856,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.e",
        "quation_src_func_dst_func.reverse_subtract_src_alpha_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028857,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equati",
        "on_src_func_dst_func.reverse_subtract_src_alpha_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028858,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.e",
        "quation_src_func_dst_func.reverse_subtract_src_alpha_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028859,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equati",
        "on_src_func_dst_func.reverse_subtract_src_alpha_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028860,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.e",
        "quation_src_func_dst_func.reverse_subtract_src_alpha_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028861,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equati",
        "on_src_func_dst_func.reverse_subtract_src_alpha_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028862,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.e",
        "quation_src_func_dst_func.reverse_subtract_src_alpha_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028863,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equati",
        "on_src_func_dst_func.reverse_subtract_src_alpha_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028864,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equ",
        "ation_src_func_dst_func.reverse_subtract_src_alpha_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028865,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation",
        "_src_func_dst_func.reverse_subtract_src_alpha_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028866,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equ",
        "ation_src_func_dst_func.reverse_subtract_src_alpha_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028867,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation",
        "_src_func_dst_func.reverse_subtract_src_alpha_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028868,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equat",
        "ion_src_func_dst_func.reverse_subtract_src_alpha_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028869,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equ",
        "ation_src_func_dst_func.reverse_subtract_one_minus_src_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028870,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equ",
        "ation_src_func_dst_func.reverse_subtract_one_minus_src_alpha_one");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028871,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equati",
        "on_src_func_dst_func.reverse_subtract_one_minus_src_alpha_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028872,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation_sr",
        "c_func_dst_func.reverse_subtract_one_minus_src_alpha_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028873,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equati",
        "on_src_func_dst_func.reverse_subtract_one_minus_src_alpha_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028874,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation_sr",
        "c_func_dst_func.reverse_subtract_one_minus_src_alpha_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028875,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equati",
        "on_src_func_dst_func.reverse_subtract_one_minus_src_alpha_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028876,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation_sr",
        "c_func_dst_func.reverse_subtract_one_minus_src_alpha_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028877,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equati",
        "on_src_func_dst_func.reverse_subtract_one_minus_src_alpha_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028878,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation_sr",
        "c_func_dst_func.reverse_subtract_one_minus_src_alpha_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028879,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation",
        "_src_func_dst_func.reverse_subtract_one_minus_src_alpha_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028880,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation_src_",
        "func_dst_func.reverse_subtract_one_minus_src_alpha_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028881,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation",
        "_src_func_dst_func.reverse_subtract_one_minus_src_alpha_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028882,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation_src_",
        "func_dst_func.reverse_subtract_one_minus_src_alpha_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028883,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation_s",
        "rc_func_dst_func.reverse_subtract_one_minus_src_alpha_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028884,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffe",
        "r.equation_src_func_dst_func.reverse_subtract_dst_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028885,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffe",
        "r.equation_src_func_dst_func.reverse_subtract_dst_alpha_one");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028886,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.e",
        "quation_src_func_dst_func.reverse_subtract_dst_alpha_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028887,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equati",
        "on_src_func_dst_func.reverse_subtract_dst_alpha_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028888,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.e",
        "quation_src_func_dst_func.reverse_subtract_dst_alpha_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028889,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equati",
        "on_src_func_dst_func.reverse_subtract_dst_alpha_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028890,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.e",
        "quation_src_func_dst_func.reverse_subtract_dst_alpha_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028891,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equati",
        "on_src_func_dst_func.reverse_subtract_dst_alpha_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028892,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.e",
        "quation_src_func_dst_func.reverse_subtract_dst_alpha_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028893,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equati",
        "on_src_func_dst_func.reverse_subtract_dst_alpha_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028894,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equ",
        "ation_src_func_dst_func.reverse_subtract_dst_alpha_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028895,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation",
        "_src_func_dst_func.reverse_subtract_dst_alpha_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028896,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equ",
        "ation_src_func_dst_func.reverse_subtract_dst_alpha_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028897,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation",
        "_src_func_dst_func.reverse_subtract_dst_alpha_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028898,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equat",
        "ion_src_func_dst_func.reverse_subtract_dst_alpha_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028899,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equ",
        "ation_src_func_dst_func.reverse_subtract_one_minus_dst_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028900,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equ",
        "ation_src_func_dst_func.reverse_subtract_one_minus_dst_alpha_one");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028901,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equati",
        "on_src_func_dst_func.reverse_subtract_one_minus_dst_alpha_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028902,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation_sr",
        "c_func_dst_func.reverse_subtract_one_minus_dst_alpha_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028903,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equati",
        "on_src_func_dst_func.reverse_subtract_one_minus_dst_alpha_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028904,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation_sr",
        "c_func_dst_func.reverse_subtract_one_minus_dst_alpha_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028905,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equati",
        "on_src_func_dst_func.reverse_subtract_one_minus_dst_alpha_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028906,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation_sr",
        "c_func_dst_func.reverse_subtract_one_minus_dst_alpha_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028907,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equati",
        "on_src_func_dst_func.reverse_subtract_one_minus_dst_alpha_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028908,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation_sr",
        "c_func_dst_func.reverse_subtract_one_minus_dst_alpha_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028909,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation",
        "_src_func_dst_func.reverse_subtract_one_minus_dst_alpha_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028910,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation_src_",
        "func_dst_func.reverse_subtract_one_minus_dst_alpha_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028911,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation",
        "_src_func_dst_func.reverse_subtract_one_minus_dst_alpha_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028912,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation_src_",
        "func_dst_func.reverse_subtract_one_minus_dst_alpha_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028913,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation_s",
        "rc_func_dst_func.reverse_subtract_one_minus_dst_alpha_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028914,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.e",
        "quation_src_func_dst_func.reverse_subtract_constant_color_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028915,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.",
        "equation_src_func_dst_func.reverse_subtract_constant_color_one");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028916,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equ",
        "ation_src_func_dst_func.reverse_subtract_constant_color_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028917,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation",
        "_src_func_dst_func.reverse_subtract_constant_color_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028918,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equ",
        "ation_src_func_dst_func.reverse_subtract_constant_color_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028919,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation",
        "_src_func_dst_func.reverse_subtract_constant_color_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028920,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equ",
        "ation_src_func_dst_func.reverse_subtract_constant_color_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028921,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation",
        "_src_func_dst_func.reverse_subtract_constant_color_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028922,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equ",
        "ation_src_func_dst_func.reverse_subtract_constant_color_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028923,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation",
        "_src_func_dst_func.reverse_subtract_constant_color_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028924,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equati",
        "on_src_func_dst_func.reverse_subtract_constant_color_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028925,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation_sr",
        "c_func_dst_func.reverse_subtract_constant_color_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028926,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equati",
        "on_src_func_dst_func.reverse_subtract_constant_color_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028927,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation_sr",
        "c_func_dst_func.reverse_subtract_constant_color_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028928,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation",
        "_src_func_dst_func.reverse_subtract_constant_color_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028929,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equati",
        "on_src_func_dst_func.reverse_subtract_one_minus_constant_color_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028930,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equat",
        "ion_src_func_dst_func.reverse_subtract_one_minus_constant_color_one");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028931,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation",
        "_src_func_dst_func.reverse_subtract_one_minus_constant_color_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028932,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation_src_",
        "func_dst_func.reverse_subtract_one_minus_constant_color_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028933,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation",
        "_src_func_dst_func.reverse_subtract_one_minus_constant_color_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028934,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation_src_",
        "func_dst_func.reverse_subtract_one_minus_constant_color_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028935,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation",
        "_src_func_dst_func.reverse_subtract_one_minus_constant_color_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028936,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation_src_",
        "func_dst_func.reverse_subtract_one_minus_constant_color_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028937,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation",
        "_src_func_dst_func.reverse_subtract_one_minus_constant_color_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028938,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation_src_",
        "func_dst_func.reverse_subtract_one_minus_constant_color_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028939,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation_sr",
        "c_func_dst_func.reverse_subtract_one_minus_constant_color_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028940,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation_src_fun",
        "c_dst_func.reverse_subtract_one_minus_constant_color_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028941,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation_sr",
        "c_func_dst_func.reverse_subtract_one_minus_constant_color_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028942,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation_src_fun",
        "c_dst_func.reverse_subtract_one_minus_constant_color_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028943,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation_src_",
        "func_dst_func.reverse_subtract_one_minus_constant_color_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028944,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.e",
        "quation_src_func_dst_func.reverse_subtract_constant_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028945,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.",
        "equation_src_func_dst_func.reverse_subtract_constant_alpha_one");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028946,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equ",
        "ation_src_func_dst_func.reverse_subtract_constant_alpha_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028947,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation",
        "_src_func_dst_func.reverse_subtract_constant_alpha_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028948,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equ",
        "ation_src_func_dst_func.reverse_subtract_constant_alpha_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028949,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation",
        "_src_func_dst_func.reverse_subtract_constant_alpha_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028950,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equ",
        "ation_src_func_dst_func.reverse_subtract_constant_alpha_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028951,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation",
        "_src_func_dst_func.reverse_subtract_constant_alpha_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028952,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equ",
        "ation_src_func_dst_func.reverse_subtract_constant_alpha_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028953,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation",
        "_src_func_dst_func.reverse_subtract_constant_alpha_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028954,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equati",
        "on_src_func_dst_func.reverse_subtract_constant_alpha_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028955,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation_sr",
        "c_func_dst_func.reverse_subtract_constant_alpha_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028956,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equati",
        "on_src_func_dst_func.reverse_subtract_constant_alpha_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028957,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation_sr",
        "c_func_dst_func.reverse_subtract_constant_alpha_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028958,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation",
        "_src_func_dst_func.reverse_subtract_constant_alpha_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028959,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equati",
        "on_src_func_dst_func.reverse_subtract_one_minus_constant_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028960,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equat",
        "ion_src_func_dst_func.reverse_subtract_one_minus_constant_alpha_one");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028961,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation",
        "_src_func_dst_func.reverse_subtract_one_minus_constant_alpha_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028962,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation_src_",
        "func_dst_func.reverse_subtract_one_minus_constant_alpha_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028963,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation",
        "_src_func_dst_func.reverse_subtract_one_minus_constant_alpha_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028964,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation_src_",
        "func_dst_func.reverse_subtract_one_minus_constant_alpha_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028965,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation",
        "_src_func_dst_func.reverse_subtract_one_minus_constant_alpha_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028966,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation_src_",
        "func_dst_func.reverse_subtract_one_minus_constant_alpha_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028967,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation",
        "_src_func_dst_func.reverse_subtract_one_minus_constant_alpha_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028968,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation_src_",
        "func_dst_func.reverse_subtract_one_minus_constant_alpha_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028969,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation_sr",
        "c_func_dst_func.reverse_subtract_one_minus_constant_alpha_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028970,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation_src_fun",
        "c_dst_func.reverse_subtract_one_minus_constant_alpha_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028971,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation_sr",
        "c_func_dst_func.reverse_subtract_one_minus_constant_alpha_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028972,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation_src_fun",
        "c_dst_func.reverse_subtract_one_minus_constant_alpha_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028973,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation_src_",
        "func_dst_func.reverse_subtract_one_minus_constant_alpha_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028974,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equ",
        "ation_src_func_dst_func.reverse_subtract_src_alpha_saturate_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028975,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.eq",
        "uation_src_func_dst_func.reverse_subtract_src_alpha_saturate_one");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028976,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equat",
        "ion_src_func_dst_func.reverse_subtract_src_alpha_saturate_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028977,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation_s",
        "rc_func_dst_func.reverse_subtract_src_alpha_saturate_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028978,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equat",
        "ion_src_func_dst_func.reverse_subtract_src_alpha_saturate_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028979,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation_s",
        "rc_func_dst_func.reverse_subtract_src_alpha_saturate_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028980,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equat",
        "ion_src_func_dst_func.reverse_subtract_src_alpha_saturate_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028981,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation_s",
        "rc_func_dst_func.reverse_subtract_src_alpha_saturate_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028982,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equat",
        "ion_src_func_dst_func.reverse_subtract_src_alpha_saturate_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028983,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation_s",
        "rc_func_dst_func.reverse_subtract_src_alpha_saturate_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028984,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation",
        "_src_func_dst_func.reverse_subtract_src_alpha_saturate_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028985,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation_src_",
        "func_dst_func.reverse_subtract_src_alpha_saturate_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028986,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation",
        "_src_func_dst_func.reverse_subtract_src_alpha_saturate_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028987,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation_src_",
        "func_dst_func.reverse_subtract_src_alpha_saturate_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028988,
        "dEQP-GLES3.functional.fragment_ops.blend.default_framebuffer.equation_s",
        "rc_func_dst_func.reverse_subtract_src_alpha_saturate_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028989,
        "dEQP-GLES3.functional.fragment_ops.blend.defa",
        "ult_framebuffer.equation_src_func_dst_func.min");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028990,
        "dEQP-GLES3.functional.fragment_ops.blend.defa",
        "ult_framebuffer.equation_src_func_dst_func.max");
