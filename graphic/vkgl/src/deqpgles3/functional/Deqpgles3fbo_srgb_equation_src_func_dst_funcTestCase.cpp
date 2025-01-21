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

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029466,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_",
        "srgb.equation_src_func_dst_func.add_zero_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029467,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo",
        "_srgb.equation_src_func_dst_func.add_zero_one");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029468,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_sr",
        "gb.equation_src_func_dst_func.add_zero_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029469,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.eq",
        "uation_src_func_dst_func.add_zero_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029470,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_sr",
        "gb.equation_src_func_dst_func.add_zero_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029471,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.eq",
        "uation_src_func_dst_func.add_zero_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029472,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_sr",
        "gb.equation_src_func_dst_func.add_zero_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029473,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.eq",
        "uation_src_func_dst_func.add_zero_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029474,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_sr",
        "gb.equation_src_func_dst_func.add_zero_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029475,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.eq",
        "uation_src_func_dst_func.add_zero_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029476,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.",
        "equation_src_func_dst_func.add_zero_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029477,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equat",
        "ion_src_func_dst_func.add_zero_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029478,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.",
        "equation_src_func_dst_func.add_zero_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029479,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equat",
        "ion_src_func_dst_func.add_zero_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029480,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.eq",
        "uation_src_func_dst_func.add_zero_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029481,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo",
        "_srgb.equation_src_func_dst_func.add_one_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029482,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo",
        "_srgb.equation_src_func_dst_func.add_one_one");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029483,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_sr",
        "gb.equation_src_func_dst_func.add_one_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029484,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.eq",
        "uation_src_func_dst_func.add_one_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029485,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_sr",
        "gb.equation_src_func_dst_func.add_one_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029486,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.eq",
        "uation_src_func_dst_func.add_one_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029487,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_sr",
        "gb.equation_src_func_dst_func.add_one_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029488,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.eq",
        "uation_src_func_dst_func.add_one_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029489,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_sr",
        "gb.equation_src_func_dst_func.add_one_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029490,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.eq",
        "uation_src_func_dst_func.add_one_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029491,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb",
        ".equation_src_func_dst_func.add_one_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029492,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equa",
        "tion_src_func_dst_func.add_one_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029493,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb",
        ".equation_src_func_dst_func.add_one_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029494,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equa",
        "tion_src_func_dst_func.add_one_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029495,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.e",
        "quation_src_func_dst_func.add_one_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029496,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_sr",
        "gb.equation_src_func_dst_func.add_src_color_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029497,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_sr",
        "gb.equation_src_func_dst_func.add_src_color_one");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029498,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.",
        "equation_src_func_dst_func.add_src_color_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029499,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equat",
        "ion_src_func_dst_func.add_src_color_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029500,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.",
        "equation_src_func_dst_func.add_src_color_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029501,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equat",
        "ion_src_func_dst_func.add_src_color_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029502,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.",
        "equation_src_func_dst_func.add_src_color_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029503,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equat",
        "ion_src_func_dst_func.add_src_color_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029504,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.",
        "equation_src_func_dst_func.add_src_color_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029505,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equat",
        "ion_src_func_dst_func.add_src_color_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029506,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.eq",
        "uation_src_func_dst_func.add_src_color_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029507,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio",
        "n_src_func_dst_func.add_src_color_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029508,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.eq",
        "uation_src_func_dst_func.add_src_color_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029509,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio",
        "n_src_func_dst_func.add_src_color_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029510,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equa",
        "tion_src_func_dst_func.add_src_color_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029511,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.eq",
        "uation_src_func_dst_func.add_one_minus_src_color_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029512,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.eq",
        "uation_src_func_dst_func.add_one_minus_src_color_one");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029513,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equat",
        "ion_src_func_dst_func.add_one_minus_src_color_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029514,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_s",
        "rc_func_dst_func.add_one_minus_src_color_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029515,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equat",
        "ion_src_func_dst_func.add_one_minus_src_color_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029516,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_s",
        "rc_func_dst_func.add_one_minus_src_color_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029517,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equat",
        "ion_src_func_dst_func.add_one_minus_src_color_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029518,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_s",
        "rc_func_dst_func.add_one_minus_src_color_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029519,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equat",
        "ion_src_func_dst_func.add_one_minus_src_color_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029520,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_s",
        "rc_func_dst_func.add_one_minus_src_color_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029521,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio",
        "n_src_func_dst_func.add_one_minus_src_color_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029522,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src",
        "_func_dst_func.add_one_minus_src_color_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029523,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio",
        "n_src_func_dst_func.add_one_minus_src_color_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029524,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src",
        "_func_dst_func.add_one_minus_src_color_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029525,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_",
        "src_func_dst_func.add_one_minus_src_color_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029526,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_sr",
        "gb.equation_src_func_dst_func.add_dst_color_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029527,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_sr",
        "gb.equation_src_func_dst_func.add_dst_color_one");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029528,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.",
        "equation_src_func_dst_func.add_dst_color_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029529,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equat",
        "ion_src_func_dst_func.add_dst_color_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029530,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.",
        "equation_src_func_dst_func.add_dst_color_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029531,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equat",
        "ion_src_func_dst_func.add_dst_color_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029532,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.",
        "equation_src_func_dst_func.add_dst_color_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029533,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equat",
        "ion_src_func_dst_func.add_dst_color_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029534,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.",
        "equation_src_func_dst_func.add_dst_color_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029535,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equat",
        "ion_src_func_dst_func.add_dst_color_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029536,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.eq",
        "uation_src_func_dst_func.add_dst_color_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029537,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio",
        "n_src_func_dst_func.add_dst_color_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029538,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.eq",
        "uation_src_func_dst_func.add_dst_color_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029539,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio",
        "n_src_func_dst_func.add_dst_color_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029540,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equa",
        "tion_src_func_dst_func.add_dst_color_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029541,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.eq",
        "uation_src_func_dst_func.add_one_minus_dst_color_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029542,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.eq",
        "uation_src_func_dst_func.add_one_minus_dst_color_one");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029543,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equat",
        "ion_src_func_dst_func.add_one_minus_dst_color_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029544,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_s",
        "rc_func_dst_func.add_one_minus_dst_color_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029545,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equat",
        "ion_src_func_dst_func.add_one_minus_dst_color_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029546,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_s",
        "rc_func_dst_func.add_one_minus_dst_color_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029547,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equat",
        "ion_src_func_dst_func.add_one_minus_dst_color_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029548,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_s",
        "rc_func_dst_func.add_one_minus_dst_color_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029549,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equat",
        "ion_src_func_dst_func.add_one_minus_dst_color_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029550,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_s",
        "rc_func_dst_func.add_one_minus_dst_color_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029551,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio",
        "n_src_func_dst_func.add_one_minus_dst_color_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029552,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src",
        "_func_dst_func.add_one_minus_dst_color_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029553,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio",
        "n_src_func_dst_func.add_one_minus_dst_color_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029554,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src",
        "_func_dst_func.add_one_minus_dst_color_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029555,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_",
        "src_func_dst_func.add_one_minus_dst_color_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029556,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_sr",
        "gb.equation_src_func_dst_func.add_src_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029557,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_sr",
        "gb.equation_src_func_dst_func.add_src_alpha_one");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029558,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.",
        "equation_src_func_dst_func.add_src_alpha_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029559,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equat",
        "ion_src_func_dst_func.add_src_alpha_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029560,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.",
        "equation_src_func_dst_func.add_src_alpha_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029561,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equat",
        "ion_src_func_dst_func.add_src_alpha_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029562,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.",
        "equation_src_func_dst_func.add_src_alpha_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029563,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equat",
        "ion_src_func_dst_func.add_src_alpha_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029564,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.",
        "equation_src_func_dst_func.add_src_alpha_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029565,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equat",
        "ion_src_func_dst_func.add_src_alpha_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029566,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.eq",
        "uation_src_func_dst_func.add_src_alpha_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029567,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio",
        "n_src_func_dst_func.add_src_alpha_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029568,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.eq",
        "uation_src_func_dst_func.add_src_alpha_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029569,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio",
        "n_src_func_dst_func.add_src_alpha_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029570,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equa",
        "tion_src_func_dst_func.add_src_alpha_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029571,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.eq",
        "uation_src_func_dst_func.add_one_minus_src_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029572,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.eq",
        "uation_src_func_dst_func.add_one_minus_src_alpha_one");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029573,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equat",
        "ion_src_func_dst_func.add_one_minus_src_alpha_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029574,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_s",
        "rc_func_dst_func.add_one_minus_src_alpha_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029575,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equat",
        "ion_src_func_dst_func.add_one_minus_src_alpha_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029576,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_s",
        "rc_func_dst_func.add_one_minus_src_alpha_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029577,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equat",
        "ion_src_func_dst_func.add_one_minus_src_alpha_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029578,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_s",
        "rc_func_dst_func.add_one_minus_src_alpha_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029579,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equat",
        "ion_src_func_dst_func.add_one_minus_src_alpha_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029580,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_s",
        "rc_func_dst_func.add_one_minus_src_alpha_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029581,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio",
        "n_src_func_dst_func.add_one_minus_src_alpha_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029582,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src",
        "_func_dst_func.add_one_minus_src_alpha_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029583,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio",
        "n_src_func_dst_func.add_one_minus_src_alpha_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029584,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src",
        "_func_dst_func.add_one_minus_src_alpha_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029585,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_",
        "src_func_dst_func.add_one_minus_src_alpha_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029586,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_sr",
        "gb.equation_src_func_dst_func.add_dst_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029587,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_sr",
        "gb.equation_src_func_dst_func.add_dst_alpha_one");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029588,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.",
        "equation_src_func_dst_func.add_dst_alpha_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029589,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equat",
        "ion_src_func_dst_func.add_dst_alpha_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029590,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.",
        "equation_src_func_dst_func.add_dst_alpha_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029591,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equat",
        "ion_src_func_dst_func.add_dst_alpha_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029592,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.",
        "equation_src_func_dst_func.add_dst_alpha_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029593,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equat",
        "ion_src_func_dst_func.add_dst_alpha_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029594,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.",
        "equation_src_func_dst_func.add_dst_alpha_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029595,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equat",
        "ion_src_func_dst_func.add_dst_alpha_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029596,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.eq",
        "uation_src_func_dst_func.add_dst_alpha_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029597,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio",
        "n_src_func_dst_func.add_dst_alpha_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029598,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.eq",
        "uation_src_func_dst_func.add_dst_alpha_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029599,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio",
        "n_src_func_dst_func.add_dst_alpha_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029600,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equa",
        "tion_src_func_dst_func.add_dst_alpha_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029601,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.eq",
        "uation_src_func_dst_func.add_one_minus_dst_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029602,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.eq",
        "uation_src_func_dst_func.add_one_minus_dst_alpha_one");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029603,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equat",
        "ion_src_func_dst_func.add_one_minus_dst_alpha_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029604,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_s",
        "rc_func_dst_func.add_one_minus_dst_alpha_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029605,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equat",
        "ion_src_func_dst_func.add_one_minus_dst_alpha_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029606,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_s",
        "rc_func_dst_func.add_one_minus_dst_alpha_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029607,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equat",
        "ion_src_func_dst_func.add_one_minus_dst_alpha_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029608,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_s",
        "rc_func_dst_func.add_one_minus_dst_alpha_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029609,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equat",
        "ion_src_func_dst_func.add_one_minus_dst_alpha_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029610,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_s",
        "rc_func_dst_func.add_one_minus_dst_alpha_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029611,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio",
        "n_src_func_dst_func.add_one_minus_dst_alpha_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029612,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src",
        "_func_dst_func.add_one_minus_dst_alpha_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029613,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio",
        "n_src_func_dst_func.add_one_minus_dst_alpha_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029614,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src",
        "_func_dst_func.add_one_minus_dst_alpha_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029615,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_",
        "src_func_dst_func.add_one_minus_dst_alpha_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029616,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.",
        "equation_src_func_dst_func.add_constant_color_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029617,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb",
        ".equation_src_func_dst_func.add_constant_color_one");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029618,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.eq",
        "uation_src_func_dst_func.add_constant_color_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029619,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio",
        "n_src_func_dst_func.add_constant_color_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029620,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.eq",
        "uation_src_func_dst_func.add_constant_color_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029621,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio",
        "n_src_func_dst_func.add_constant_color_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029622,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.eq",
        "uation_src_func_dst_func.add_constant_color_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029623,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio",
        "n_src_func_dst_func.add_constant_color_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029624,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.eq",
        "uation_src_func_dst_func.add_constant_color_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029625,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio",
        "n_src_func_dst_func.add_constant_color_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029626,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equat",
        "ion_src_func_dst_func.add_constant_color_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029627,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_s",
        "rc_func_dst_func.add_constant_color_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029628,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equat",
        "ion_src_func_dst_func.add_constant_color_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029629,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_s",
        "rc_func_dst_func.add_constant_color_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029630,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio",
        "n_src_func_dst_func.add_constant_color_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029631,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equat",
        "ion_src_func_dst_func.add_one_minus_constant_color_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029632,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equa",
        "tion_src_func_dst_func.add_one_minus_constant_color_one");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029633,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio",
        "n_src_func_dst_func.add_one_minus_constant_color_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029634,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src",
        "_func_dst_func.add_one_minus_constant_color_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029635,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio",
        "n_src_func_dst_func.add_one_minus_constant_color_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029636,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src",
        "_func_dst_func.add_one_minus_constant_color_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029637,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio",
        "n_src_func_dst_func.add_one_minus_constant_color_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029638,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src",
        "_func_dst_func.add_one_minus_constant_color_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029639,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio",
        "n_src_func_dst_func.add_one_minus_constant_color_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029640,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src",
        "_func_dst_func.add_one_minus_constant_color_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029641,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_s",
        "rc_func_dst_func.add_one_minus_constant_color_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029642,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_fu",
        "nc_dst_func.add_one_minus_constant_color_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029643,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_s",
        "rc_func_dst_func.add_one_minus_constant_color_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029644,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_fu",
        "nc_dst_func.add_one_minus_constant_color_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029645,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src",
        "_func_dst_func.add_one_minus_constant_color_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029646,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.",
        "equation_src_func_dst_func.add_constant_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029647,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb",
        ".equation_src_func_dst_func.add_constant_alpha_one");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029648,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.eq",
        "uation_src_func_dst_func.add_constant_alpha_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029649,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio",
        "n_src_func_dst_func.add_constant_alpha_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029650,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.eq",
        "uation_src_func_dst_func.add_constant_alpha_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029651,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio",
        "n_src_func_dst_func.add_constant_alpha_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029652,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.eq",
        "uation_src_func_dst_func.add_constant_alpha_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029653,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio",
        "n_src_func_dst_func.add_constant_alpha_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029654,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.eq",
        "uation_src_func_dst_func.add_constant_alpha_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029655,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio",
        "n_src_func_dst_func.add_constant_alpha_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029656,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equat",
        "ion_src_func_dst_func.add_constant_alpha_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029657,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_s",
        "rc_func_dst_func.add_constant_alpha_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029658,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equat",
        "ion_src_func_dst_func.add_constant_alpha_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029659,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_s",
        "rc_func_dst_func.add_constant_alpha_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029660,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio",
        "n_src_func_dst_func.add_constant_alpha_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029661,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equat",
        "ion_src_func_dst_func.add_one_minus_constant_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029662,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equa",
        "tion_src_func_dst_func.add_one_minus_constant_alpha_one");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029663,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio",
        "n_src_func_dst_func.add_one_minus_constant_alpha_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029664,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src",
        "_func_dst_func.add_one_minus_constant_alpha_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029665,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio",
        "n_src_func_dst_func.add_one_minus_constant_alpha_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029666,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src",
        "_func_dst_func.add_one_minus_constant_alpha_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029667,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio",
        "n_src_func_dst_func.add_one_minus_constant_alpha_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029668,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src",
        "_func_dst_func.add_one_minus_constant_alpha_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029669,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio",
        "n_src_func_dst_func.add_one_minus_constant_alpha_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029670,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src",
        "_func_dst_func.add_one_minus_constant_alpha_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029671,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_s",
        "rc_func_dst_func.add_one_minus_constant_alpha_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029672,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_fu",
        "nc_dst_func.add_one_minus_constant_alpha_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029673,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_s",
        "rc_func_dst_func.add_one_minus_constant_alpha_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029674,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_fu",
        "nc_dst_func.add_one_minus_constant_alpha_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029675,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src",
        "_func_dst_func.add_one_minus_constant_alpha_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029676,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.eq",
        "uation_src_func_dst_func.add_src_alpha_saturate_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029677,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.e",
        "quation_src_func_dst_func.add_src_alpha_saturate_one");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029678,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equa",
        "tion_src_func_dst_func.add_src_alpha_saturate_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029679,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_",
        "src_func_dst_func.add_src_alpha_saturate_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029680,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equa",
        "tion_src_func_dst_func.add_src_alpha_saturate_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029681,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_",
        "src_func_dst_func.add_src_alpha_saturate_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029682,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equa",
        "tion_src_func_dst_func.add_src_alpha_saturate_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029683,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_",
        "src_func_dst_func.add_src_alpha_saturate_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029684,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equa",
        "tion_src_func_dst_func.add_src_alpha_saturate_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029685,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_",
        "src_func_dst_func.add_src_alpha_saturate_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029686,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio",
        "n_src_func_dst_func.add_src_alpha_saturate_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029687,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src",
        "_func_dst_func.add_src_alpha_saturate_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029688,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio",
        "n_src_func_dst_func.add_src_alpha_saturate_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029689,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src",
        "_func_dst_func.add_src_alpha_saturate_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029690,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_",
        "src_func_dst_func.add_src_alpha_saturate_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029691,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_sr",
        "gb.equation_src_func_dst_func.subtract_zero_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029692,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_sr",
        "gb.equation_src_func_dst_func.subtract_zero_one");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029693,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.",
        "equation_src_func_dst_func.subtract_zero_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029694,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equat",
        "ion_src_func_dst_func.subtract_zero_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029695,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.",
        "equation_src_func_dst_func.subtract_zero_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029696,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equat",
        "ion_src_func_dst_func.subtract_zero_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029697,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.",
        "equation_src_func_dst_func.subtract_zero_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029698,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equat",
        "ion_src_func_dst_func.subtract_zero_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029699,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.",
        "equation_src_func_dst_func.subtract_zero_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029700,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equat",
        "ion_src_func_dst_func.subtract_zero_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029701,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.eq",
        "uation_src_func_dst_func.subtract_zero_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029702,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio",
        "n_src_func_dst_func.subtract_zero_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029703,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.eq",
        "uation_src_func_dst_func.subtract_zero_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029704,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio",
        "n_src_func_dst_func.subtract_zero_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029705,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equa",
        "tion_src_func_dst_func.subtract_zero_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029706,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_sr",
        "gb.equation_src_func_dst_func.subtract_one_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029707,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_s",
        "rgb.equation_src_func_dst_func.subtract_one_one");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029708,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb",
        ".equation_src_func_dst_func.subtract_one_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029709,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equa",
        "tion_src_func_dst_func.subtract_one_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029710,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb",
        ".equation_src_func_dst_func.subtract_one_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029711,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equa",
        "tion_src_func_dst_func.subtract_one_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029712,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb",
        ".equation_src_func_dst_func.subtract_one_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029713,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equa",
        "tion_src_func_dst_func.subtract_one_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029714,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb",
        ".equation_src_func_dst_func.subtract_one_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029715,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equa",
        "tion_src_func_dst_func.subtract_one_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029716,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.eq",
        "uation_src_func_dst_func.subtract_one_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029717,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio",
        "n_src_func_dst_func.subtract_one_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029718,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.eq",
        "uation_src_func_dst_func.subtract_one_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029719,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio",
        "n_src_func_dst_func.subtract_one_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029720,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equa",
        "tion_src_func_dst_func.subtract_one_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029721,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.",
        "equation_src_func_dst_func.subtract_src_color_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029722,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb",
        ".equation_src_func_dst_func.subtract_src_color_one");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029723,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.eq",
        "uation_src_func_dst_func.subtract_src_color_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029724,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio",
        "n_src_func_dst_func.subtract_src_color_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029725,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.eq",
        "uation_src_func_dst_func.subtract_src_color_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029726,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio",
        "n_src_func_dst_func.subtract_src_color_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029727,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.eq",
        "uation_src_func_dst_func.subtract_src_color_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029728,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio",
        "n_src_func_dst_func.subtract_src_color_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029729,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.eq",
        "uation_src_func_dst_func.subtract_src_color_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029730,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio",
        "n_src_func_dst_func.subtract_src_color_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029731,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equat",
        "ion_src_func_dst_func.subtract_src_color_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029732,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_s",
        "rc_func_dst_func.subtract_src_color_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029733,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equat",
        "ion_src_func_dst_func.subtract_src_color_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029734,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_s",
        "rc_func_dst_func.subtract_src_color_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029735,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio",
        "n_src_func_dst_func.subtract_src_color_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029736,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equat",
        "ion_src_func_dst_func.subtract_one_minus_src_color_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029737,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equa",
        "tion_src_func_dst_func.subtract_one_minus_src_color_one");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029738,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio",
        "n_src_func_dst_func.subtract_one_minus_src_color_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029739,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src",
        "_func_dst_func.subtract_one_minus_src_color_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029740,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio",
        "n_src_func_dst_func.subtract_one_minus_src_color_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029741,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src",
        "_func_dst_func.subtract_one_minus_src_color_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029742,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio",
        "n_src_func_dst_func.subtract_one_minus_src_color_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029743,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src",
        "_func_dst_func.subtract_one_minus_src_color_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029744,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio",
        "n_src_func_dst_func.subtract_one_minus_src_color_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029745,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src",
        "_func_dst_func.subtract_one_minus_src_color_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029746,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_s",
        "rc_func_dst_func.subtract_one_minus_src_color_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029747,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_fu",
        "nc_dst_func.subtract_one_minus_src_color_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029748,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_s",
        "rc_func_dst_func.subtract_one_minus_src_color_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029749,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_fu",
        "nc_dst_func.subtract_one_minus_src_color_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029750,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src",
        "_func_dst_func.subtract_one_minus_src_color_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029751,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.",
        "equation_src_func_dst_func.subtract_dst_color_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029752,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb",
        ".equation_src_func_dst_func.subtract_dst_color_one");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029753,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.eq",
        "uation_src_func_dst_func.subtract_dst_color_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029754,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio",
        "n_src_func_dst_func.subtract_dst_color_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029755,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.eq",
        "uation_src_func_dst_func.subtract_dst_color_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029756,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio",
        "n_src_func_dst_func.subtract_dst_color_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029757,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.eq",
        "uation_src_func_dst_func.subtract_dst_color_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029758,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio",
        "n_src_func_dst_func.subtract_dst_color_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029759,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.eq",
        "uation_src_func_dst_func.subtract_dst_color_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029760,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio",
        "n_src_func_dst_func.subtract_dst_color_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029761,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equat",
        "ion_src_func_dst_func.subtract_dst_color_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029762,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_s",
        "rc_func_dst_func.subtract_dst_color_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029763,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equat",
        "ion_src_func_dst_func.subtract_dst_color_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029764,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_s",
        "rc_func_dst_func.subtract_dst_color_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029765,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio",
        "n_src_func_dst_func.subtract_dst_color_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029766,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equat",
        "ion_src_func_dst_func.subtract_one_minus_dst_color_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029767,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equa",
        "tion_src_func_dst_func.subtract_one_minus_dst_color_one");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029768,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio",
        "n_src_func_dst_func.subtract_one_minus_dst_color_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029769,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src",
        "_func_dst_func.subtract_one_minus_dst_color_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029770,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio",
        "n_src_func_dst_func.subtract_one_minus_dst_color_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029771,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src",
        "_func_dst_func.subtract_one_minus_dst_color_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029772,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio",
        "n_src_func_dst_func.subtract_one_minus_dst_color_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029773,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src",
        "_func_dst_func.subtract_one_minus_dst_color_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029774,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio",
        "n_src_func_dst_func.subtract_one_minus_dst_color_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029775,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src",
        "_func_dst_func.subtract_one_minus_dst_color_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029776,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_s",
        "rc_func_dst_func.subtract_one_minus_dst_color_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029777,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_fu",
        "nc_dst_func.subtract_one_minus_dst_color_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029778,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_s",
        "rc_func_dst_func.subtract_one_minus_dst_color_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029779,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_fu",
        "nc_dst_func.subtract_one_minus_dst_color_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029780,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src",
        "_func_dst_func.subtract_one_minus_dst_color_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029781,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.",
        "equation_src_func_dst_func.subtract_src_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029782,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb",
        ".equation_src_func_dst_func.subtract_src_alpha_one");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029783,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.eq",
        "uation_src_func_dst_func.subtract_src_alpha_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029784,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio",
        "n_src_func_dst_func.subtract_src_alpha_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029785,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.eq",
        "uation_src_func_dst_func.subtract_src_alpha_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029786,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio",
        "n_src_func_dst_func.subtract_src_alpha_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029787,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.eq",
        "uation_src_func_dst_func.subtract_src_alpha_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029788,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio",
        "n_src_func_dst_func.subtract_src_alpha_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029789,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.eq",
        "uation_src_func_dst_func.subtract_src_alpha_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029790,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio",
        "n_src_func_dst_func.subtract_src_alpha_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029791,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equat",
        "ion_src_func_dst_func.subtract_src_alpha_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029792,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_s",
        "rc_func_dst_func.subtract_src_alpha_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029793,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equat",
        "ion_src_func_dst_func.subtract_src_alpha_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029794,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_s",
        "rc_func_dst_func.subtract_src_alpha_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029795,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio",
        "n_src_func_dst_func.subtract_src_alpha_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029796,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equat",
        "ion_src_func_dst_func.subtract_one_minus_src_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029797,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equa",
        "tion_src_func_dst_func.subtract_one_minus_src_alpha_one");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029798,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio",
        "n_src_func_dst_func.subtract_one_minus_src_alpha_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029799,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src",
        "_func_dst_func.subtract_one_minus_src_alpha_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029800,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio",
        "n_src_func_dst_func.subtract_one_minus_src_alpha_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029801,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src",
        "_func_dst_func.subtract_one_minus_src_alpha_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029802,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio",
        "n_src_func_dst_func.subtract_one_minus_src_alpha_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029803,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src",
        "_func_dst_func.subtract_one_minus_src_alpha_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029804,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio",
        "n_src_func_dst_func.subtract_one_minus_src_alpha_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029805,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src",
        "_func_dst_func.subtract_one_minus_src_alpha_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029806,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_s",
        "rc_func_dst_func.subtract_one_minus_src_alpha_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029807,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_fu",
        "nc_dst_func.subtract_one_minus_src_alpha_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029808,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_s",
        "rc_func_dst_func.subtract_one_minus_src_alpha_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029809,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_fu",
        "nc_dst_func.subtract_one_minus_src_alpha_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029810,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src",
        "_func_dst_func.subtract_one_minus_src_alpha_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029811,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.",
        "equation_src_func_dst_func.subtract_dst_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029812,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb",
        ".equation_src_func_dst_func.subtract_dst_alpha_one");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029813,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.eq",
        "uation_src_func_dst_func.subtract_dst_alpha_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029814,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio",
        "n_src_func_dst_func.subtract_dst_alpha_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029815,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.eq",
        "uation_src_func_dst_func.subtract_dst_alpha_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029816,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio",
        "n_src_func_dst_func.subtract_dst_alpha_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029817,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.eq",
        "uation_src_func_dst_func.subtract_dst_alpha_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029818,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio",
        "n_src_func_dst_func.subtract_dst_alpha_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029819,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.eq",
        "uation_src_func_dst_func.subtract_dst_alpha_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029820,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio",
        "n_src_func_dst_func.subtract_dst_alpha_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029821,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equat",
        "ion_src_func_dst_func.subtract_dst_alpha_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029822,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_s",
        "rc_func_dst_func.subtract_dst_alpha_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029823,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equat",
        "ion_src_func_dst_func.subtract_dst_alpha_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029824,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_s",
        "rc_func_dst_func.subtract_dst_alpha_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029825,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio",
        "n_src_func_dst_func.subtract_dst_alpha_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029826,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equat",
        "ion_src_func_dst_func.subtract_one_minus_dst_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029827,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equa",
        "tion_src_func_dst_func.subtract_one_minus_dst_alpha_one");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029828,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio",
        "n_src_func_dst_func.subtract_one_minus_dst_alpha_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029829,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src",
        "_func_dst_func.subtract_one_minus_dst_alpha_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029830,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio",
        "n_src_func_dst_func.subtract_one_minus_dst_alpha_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029831,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src",
        "_func_dst_func.subtract_one_minus_dst_alpha_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029832,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio",
        "n_src_func_dst_func.subtract_one_minus_dst_alpha_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029833,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src",
        "_func_dst_func.subtract_one_minus_dst_alpha_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029834,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio",
        "n_src_func_dst_func.subtract_one_minus_dst_alpha_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029835,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src",
        "_func_dst_func.subtract_one_minus_dst_alpha_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029836,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_s",
        "rc_func_dst_func.subtract_one_minus_dst_alpha_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029837,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_fu",
        "nc_dst_func.subtract_one_minus_dst_alpha_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029838,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_s",
        "rc_func_dst_func.subtract_one_minus_dst_alpha_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029839,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_fu",
        "nc_dst_func.subtract_one_minus_dst_alpha_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029840,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src",
        "_func_dst_func.subtract_one_minus_dst_alpha_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029841,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.eq",
        "uation_src_func_dst_func.subtract_constant_color_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029842,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.eq",
        "uation_src_func_dst_func.subtract_constant_color_one");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029843,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equat",
        "ion_src_func_dst_func.subtract_constant_color_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029844,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_s",
        "rc_func_dst_func.subtract_constant_color_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029845,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equat",
        "ion_src_func_dst_func.subtract_constant_color_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029846,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_s",
        "rc_func_dst_func.subtract_constant_color_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029847,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equat",
        "ion_src_func_dst_func.subtract_constant_color_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029848,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_s",
        "rc_func_dst_func.subtract_constant_color_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029849,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equat",
        "ion_src_func_dst_func.subtract_constant_color_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029850,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_s",
        "rc_func_dst_func.subtract_constant_color_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029851,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio",
        "n_src_func_dst_func.subtract_constant_color_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029852,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src",
        "_func_dst_func.subtract_constant_color_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029853,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio",
        "n_src_func_dst_func.subtract_constant_color_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029854,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src",
        "_func_dst_func.subtract_constant_color_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029855,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_",
        "src_func_dst_func.subtract_constant_color_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029856,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio",
        "n_src_func_dst_func.subtract_one_minus_constant_color_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029857,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio",
        "n_src_func_dst_func.subtract_one_minus_constant_color_one");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029858,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_s",
        "rc_func_dst_func.subtract_one_minus_constant_color_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029859,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_fu",
        "nc_dst_func.subtract_one_minus_constant_color_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029860,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_s",
        "rc_func_dst_func.subtract_one_minus_constant_color_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029861,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_fu",
        "nc_dst_func.subtract_one_minus_constant_color_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029862,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_s",
        "rc_func_dst_func.subtract_one_minus_constant_color_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029863,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_fu",
        "nc_dst_func.subtract_one_minus_constant_color_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029864,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_s",
        "rc_func_dst_func.subtract_one_minus_constant_color_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029865,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_fu",
        "nc_dst_func.subtract_one_minus_constant_color_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029866,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src",
        "_func_dst_func.subtract_one_minus_constant_color_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029867,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_func",
        "_dst_func.subtract_one_minus_constant_color_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029868,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src",
        "_func_dst_func.subtract_one_minus_constant_color_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029869,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_func",
        "_dst_func.subtract_one_minus_constant_color_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029870,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_f",
        "unc_dst_func.subtract_one_minus_constant_color_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029871,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.eq",
        "uation_src_func_dst_func.subtract_constant_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029872,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.eq",
        "uation_src_func_dst_func.subtract_constant_alpha_one");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029873,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equat",
        "ion_src_func_dst_func.subtract_constant_alpha_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029874,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_s",
        "rc_func_dst_func.subtract_constant_alpha_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029875,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equat",
        "ion_src_func_dst_func.subtract_constant_alpha_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029876,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_s",
        "rc_func_dst_func.subtract_constant_alpha_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029877,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equat",
        "ion_src_func_dst_func.subtract_constant_alpha_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029878,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_s",
        "rc_func_dst_func.subtract_constant_alpha_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029879,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equat",
        "ion_src_func_dst_func.subtract_constant_alpha_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029880,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_s",
        "rc_func_dst_func.subtract_constant_alpha_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029881,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio",
        "n_src_func_dst_func.subtract_constant_alpha_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029882,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src",
        "_func_dst_func.subtract_constant_alpha_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029883,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio",
        "n_src_func_dst_func.subtract_constant_alpha_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029884,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src",
        "_func_dst_func.subtract_constant_alpha_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029885,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_",
        "src_func_dst_func.subtract_constant_alpha_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029886,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio",
        "n_src_func_dst_func.subtract_one_minus_constant_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029887,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio",
        "n_src_func_dst_func.subtract_one_minus_constant_alpha_one");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029888,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_s",
        "rc_func_dst_func.subtract_one_minus_constant_alpha_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029889,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_fu",
        "nc_dst_func.subtract_one_minus_constant_alpha_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029890,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_s",
        "rc_func_dst_func.subtract_one_minus_constant_alpha_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029891,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_fu",
        "nc_dst_func.subtract_one_minus_constant_alpha_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029892,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_s",
        "rc_func_dst_func.subtract_one_minus_constant_alpha_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029893,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_fu",
        "nc_dst_func.subtract_one_minus_constant_alpha_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029894,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_s",
        "rc_func_dst_func.subtract_one_minus_constant_alpha_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029895,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_fu",
        "nc_dst_func.subtract_one_minus_constant_alpha_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029896,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src",
        "_func_dst_func.subtract_one_minus_constant_alpha_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029897,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_func",
        "_dst_func.subtract_one_minus_constant_alpha_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029898,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src",
        "_func_dst_func.subtract_one_minus_constant_alpha_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029899,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_func",
        "_dst_func.subtract_one_minus_constant_alpha_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029900,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_f",
        "unc_dst_func.subtract_one_minus_constant_alpha_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029901,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equa",
        "tion_src_func_dst_func.subtract_src_alpha_saturate_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029902,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equa",
        "tion_src_func_dst_func.subtract_src_alpha_saturate_one");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029903,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio",
        "n_src_func_dst_func.subtract_src_alpha_saturate_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029904,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src",
        "_func_dst_func.subtract_src_alpha_saturate_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029905,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio",
        "n_src_func_dst_func.subtract_src_alpha_saturate_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029906,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src",
        "_func_dst_func.subtract_src_alpha_saturate_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029907,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio",
        "n_src_func_dst_func.subtract_src_alpha_saturate_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029908,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src",
        "_func_dst_func.subtract_src_alpha_saturate_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029909,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equatio",
        "n_src_func_dst_func.subtract_src_alpha_saturate_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029910,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src",
        "_func_dst_func.subtract_src_alpha_saturate_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029911,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_",
        "src_func_dst_func.subtract_src_alpha_saturate_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029912,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_f",
        "unc_dst_func.subtract_src_alpha_saturate_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029913,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_",
        "src_func_dst_func.subtract_src_alpha_saturate_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029914,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_f",
        "unc_dst_func.subtract_src_alpha_saturate_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029915,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_sr",
        "c_func_dst_func.subtract_src_alpha_saturate_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029916,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.e",
        "quation_src_func_dst_func.reverse_subtract_zero_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029917,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.e",
        "quation_src_func_dst_func.reverse_subtract_zero_one");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029918,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equa",
        "tion_src_func_dst_func.reverse_subtract_zero_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029919,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_",
        "src_func_dst_func.reverse_subtract_zero_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029920,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equa",
        "tion_src_func_dst_func.reverse_subtract_zero_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029921,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_",
        "src_func_dst_func.reverse_subtract_zero_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029922,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equa",
        "tion_src_func_dst_func.reverse_subtract_zero_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029923,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_",
        "src_func_dst_func.reverse_subtract_zero_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029924,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equa",
        "tion_src_func_dst_func.reverse_subtract_zero_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029925,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_",
        "src_func_dst_func.reverse_subtract_zero_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029926,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equati",
        "on_src_func_dst_func.reverse_subtract_zero_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029927,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_sr",
        "c_func_dst_func.reverse_subtract_zero_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029928,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equati",
        "on_src_func_dst_func.reverse_subtract_zero_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029929,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_sr",
        "c_func_dst_func.reverse_subtract_zero_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029930,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation",
        "_src_func_dst_func.reverse_subtract_zero_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029931,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.e",
        "quation_src_func_dst_func.reverse_subtract_one_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029932,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.",
        "equation_src_func_dst_func.reverse_subtract_one_one");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029933,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equ",
        "ation_src_func_dst_func.reverse_subtract_one_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029934,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation",
        "_src_func_dst_func.reverse_subtract_one_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029935,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equ",
        "ation_src_func_dst_func.reverse_subtract_one_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029936,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation",
        "_src_func_dst_func.reverse_subtract_one_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029937,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equ",
        "ation_src_func_dst_func.reverse_subtract_one_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029938,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation",
        "_src_func_dst_func.reverse_subtract_one_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029939,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equ",
        "ation_src_func_dst_func.reverse_subtract_one_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029940,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation",
        "_src_func_dst_func.reverse_subtract_one_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029941,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equati",
        "on_src_func_dst_func.reverse_subtract_one_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029942,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_sr",
        "c_func_dst_func.reverse_subtract_one_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029943,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equati",
        "on_src_func_dst_func.reverse_subtract_one_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029944,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_sr",
        "c_func_dst_func.reverse_subtract_one_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029945,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation",
        "_src_func_dst_func.reverse_subtract_one_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029946,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equa",
        "tion_src_func_dst_func.reverse_subtract_src_color_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029947,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equ",
        "ation_src_func_dst_func.reverse_subtract_src_color_one");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029948,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equati",
        "on_src_func_dst_func.reverse_subtract_src_color_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029949,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_sr",
        "c_func_dst_func.reverse_subtract_src_color_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029950,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equati",
        "on_src_func_dst_func.reverse_subtract_src_color_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029951,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_sr",
        "c_func_dst_func.reverse_subtract_src_color_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029952,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equati",
        "on_src_func_dst_func.reverse_subtract_src_color_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029953,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_sr",
        "c_func_dst_func.reverse_subtract_src_color_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029954,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equati",
        "on_src_func_dst_func.reverse_subtract_src_color_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029955,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_sr",
        "c_func_dst_func.reverse_subtract_src_color_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029956,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_",
        "src_func_dst_func.reverse_subtract_src_color_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029957,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_f",
        "unc_dst_func.reverse_subtract_src_color_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029958,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_",
        "src_func_dst_func.reverse_subtract_src_color_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029959,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_f",
        "unc_dst_func.reverse_subtract_src_color_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029960,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_sr",
        "c_func_dst_func.reverse_subtract_src_color_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029961,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_",
        "src_func_dst_func.reverse_subtract_one_minus_src_color_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029962,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation",
        "_src_func_dst_func.reverse_subtract_one_minus_src_color_one");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029963,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_sr",
        "c_func_dst_func.reverse_subtract_one_minus_src_color_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029964,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_fun",
        "c_dst_func.reverse_subtract_one_minus_src_color_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029965,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_sr",
        "c_func_dst_func.reverse_subtract_one_minus_src_color_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029966,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_fun",
        "c_dst_func.reverse_subtract_one_minus_src_color_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029967,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_sr",
        "c_func_dst_func.reverse_subtract_one_minus_src_color_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029968,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_fun",
        "c_dst_func.reverse_subtract_one_minus_src_color_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029969,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_sr",
        "c_func_dst_func.reverse_subtract_one_minus_src_color_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029970,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_fun",
        "c_dst_func.reverse_subtract_one_minus_src_color_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029971,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_f",
        "unc_dst_func.reverse_subtract_one_minus_src_color_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029972,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_func_d",
        "st_func.reverse_subtract_one_minus_src_color_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029973,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_f",
        "unc_dst_func.reverse_subtract_one_minus_src_color_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029974,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_func_d",
        "st_func.reverse_subtract_one_minus_src_color_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029975,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_fun",
        "c_dst_func.reverse_subtract_one_minus_src_color_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029976,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equa",
        "tion_src_func_dst_func.reverse_subtract_dst_color_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029977,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equ",
        "ation_src_func_dst_func.reverse_subtract_dst_color_one");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029978,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equati",
        "on_src_func_dst_func.reverse_subtract_dst_color_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029979,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_sr",
        "c_func_dst_func.reverse_subtract_dst_color_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029980,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equati",
        "on_src_func_dst_func.reverse_subtract_dst_color_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029981,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_sr",
        "c_func_dst_func.reverse_subtract_dst_color_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029982,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equati",
        "on_src_func_dst_func.reverse_subtract_dst_color_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029983,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_sr",
        "c_func_dst_func.reverse_subtract_dst_color_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029984,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equati",
        "on_src_func_dst_func.reverse_subtract_dst_color_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029985,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_sr",
        "c_func_dst_func.reverse_subtract_dst_color_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029986,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_",
        "src_func_dst_func.reverse_subtract_dst_color_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029987,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_f",
        "unc_dst_func.reverse_subtract_dst_color_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029988,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_",
        "src_func_dst_func.reverse_subtract_dst_color_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029989,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_f",
        "unc_dst_func.reverse_subtract_dst_color_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029990,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_sr",
        "c_func_dst_func.reverse_subtract_dst_color_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029991,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_",
        "src_func_dst_func.reverse_subtract_one_minus_dst_color_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029992,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation",
        "_src_func_dst_func.reverse_subtract_one_minus_dst_color_one");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029993,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_sr",
        "c_func_dst_func.reverse_subtract_one_minus_dst_color_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029994,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_fun",
        "c_dst_func.reverse_subtract_one_minus_dst_color_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029995,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_sr",
        "c_func_dst_func.reverse_subtract_one_minus_dst_color_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029996,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_fun",
        "c_dst_func.reverse_subtract_one_minus_dst_color_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029997,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_sr",
        "c_func_dst_func.reverse_subtract_one_minus_dst_color_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029998,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_fun",
        "c_dst_func.reverse_subtract_one_minus_dst_color_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_029999,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_sr",
        "c_func_dst_func.reverse_subtract_one_minus_dst_color_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030000,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_fun",
        "c_dst_func.reverse_subtract_one_minus_dst_color_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030001,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_f",
        "unc_dst_func.reverse_subtract_one_minus_dst_color_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030002,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_func_d",
        "st_func.reverse_subtract_one_minus_dst_color_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030003,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_f",
        "unc_dst_func.reverse_subtract_one_minus_dst_color_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030004,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_func_d",
        "st_func.reverse_subtract_one_minus_dst_color_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030005,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_fun",
        "c_dst_func.reverse_subtract_one_minus_dst_color_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030006,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equa",
        "tion_src_func_dst_func.reverse_subtract_src_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030007,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equ",
        "ation_src_func_dst_func.reverse_subtract_src_alpha_one");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030008,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equati",
        "on_src_func_dst_func.reverse_subtract_src_alpha_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030009,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_sr",
        "c_func_dst_func.reverse_subtract_src_alpha_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030010,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equati",
        "on_src_func_dst_func.reverse_subtract_src_alpha_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030011,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_sr",
        "c_func_dst_func.reverse_subtract_src_alpha_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030012,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equati",
        "on_src_func_dst_func.reverse_subtract_src_alpha_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030013,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_sr",
        "c_func_dst_func.reverse_subtract_src_alpha_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030014,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equati",
        "on_src_func_dst_func.reverse_subtract_src_alpha_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030015,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_sr",
        "c_func_dst_func.reverse_subtract_src_alpha_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030016,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_",
        "src_func_dst_func.reverse_subtract_src_alpha_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030017,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_f",
        "unc_dst_func.reverse_subtract_src_alpha_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030018,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_",
        "src_func_dst_func.reverse_subtract_src_alpha_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030019,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_f",
        "unc_dst_func.reverse_subtract_src_alpha_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030020,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_sr",
        "c_func_dst_func.reverse_subtract_src_alpha_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030021,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_",
        "src_func_dst_func.reverse_subtract_one_minus_src_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030022,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation",
        "_src_func_dst_func.reverse_subtract_one_minus_src_alpha_one");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030023,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_sr",
        "c_func_dst_func.reverse_subtract_one_minus_src_alpha_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030024,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_fun",
        "c_dst_func.reverse_subtract_one_minus_src_alpha_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030025,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_sr",
        "c_func_dst_func.reverse_subtract_one_minus_src_alpha_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030026,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_fun",
        "c_dst_func.reverse_subtract_one_minus_src_alpha_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030027,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_sr",
        "c_func_dst_func.reverse_subtract_one_minus_src_alpha_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030028,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_fun",
        "c_dst_func.reverse_subtract_one_minus_src_alpha_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030029,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_sr",
        "c_func_dst_func.reverse_subtract_one_minus_src_alpha_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030030,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_fun",
        "c_dst_func.reverse_subtract_one_minus_src_alpha_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030031,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_f",
        "unc_dst_func.reverse_subtract_one_minus_src_alpha_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030032,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_func_d",
        "st_func.reverse_subtract_one_minus_src_alpha_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030033,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_f",
        "unc_dst_func.reverse_subtract_one_minus_src_alpha_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030034,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_func_d",
        "st_func.reverse_subtract_one_minus_src_alpha_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030035,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_fun",
        "c_dst_func.reverse_subtract_one_minus_src_alpha_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030036,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equa",
        "tion_src_func_dst_func.reverse_subtract_dst_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030037,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equ",
        "ation_src_func_dst_func.reverse_subtract_dst_alpha_one");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030038,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equati",
        "on_src_func_dst_func.reverse_subtract_dst_alpha_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030039,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_sr",
        "c_func_dst_func.reverse_subtract_dst_alpha_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030040,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equati",
        "on_src_func_dst_func.reverse_subtract_dst_alpha_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030041,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_sr",
        "c_func_dst_func.reverse_subtract_dst_alpha_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030042,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equati",
        "on_src_func_dst_func.reverse_subtract_dst_alpha_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030043,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_sr",
        "c_func_dst_func.reverse_subtract_dst_alpha_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030044,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equati",
        "on_src_func_dst_func.reverse_subtract_dst_alpha_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030045,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_sr",
        "c_func_dst_func.reverse_subtract_dst_alpha_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030046,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_",
        "src_func_dst_func.reverse_subtract_dst_alpha_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030047,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_f",
        "unc_dst_func.reverse_subtract_dst_alpha_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030048,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_",
        "src_func_dst_func.reverse_subtract_dst_alpha_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030049,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_f",
        "unc_dst_func.reverse_subtract_dst_alpha_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030050,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_sr",
        "c_func_dst_func.reverse_subtract_dst_alpha_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030051,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_",
        "src_func_dst_func.reverse_subtract_one_minus_dst_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030052,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation",
        "_src_func_dst_func.reverse_subtract_one_minus_dst_alpha_one");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030053,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_sr",
        "c_func_dst_func.reverse_subtract_one_minus_dst_alpha_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030054,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_fun",
        "c_dst_func.reverse_subtract_one_minus_dst_alpha_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030055,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_sr",
        "c_func_dst_func.reverse_subtract_one_minus_dst_alpha_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030056,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_fun",
        "c_dst_func.reverse_subtract_one_minus_dst_alpha_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030057,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_sr",
        "c_func_dst_func.reverse_subtract_one_minus_dst_alpha_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030058,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_fun",
        "c_dst_func.reverse_subtract_one_minus_dst_alpha_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030059,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_sr",
        "c_func_dst_func.reverse_subtract_one_minus_dst_alpha_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030060,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_fun",
        "c_dst_func.reverse_subtract_one_minus_dst_alpha_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030061,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_f",
        "unc_dst_func.reverse_subtract_one_minus_dst_alpha_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030062,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_func_d",
        "st_func.reverse_subtract_one_minus_dst_alpha_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030063,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_f",
        "unc_dst_func.reverse_subtract_one_minus_dst_alpha_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030064,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_func_d",
        "st_func.reverse_subtract_one_minus_dst_alpha_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030065,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_fun",
        "c_dst_func.reverse_subtract_one_minus_dst_alpha_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030066,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equati",
        "on_src_func_dst_func.reverse_subtract_constant_color_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030067,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equati",
        "on_src_func_dst_func.reverse_subtract_constant_color_one");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030068,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_",
        "src_func_dst_func.reverse_subtract_constant_color_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030069,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_f",
        "unc_dst_func.reverse_subtract_constant_color_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030070,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_",
        "src_func_dst_func.reverse_subtract_constant_color_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030071,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_f",
        "unc_dst_func.reverse_subtract_constant_color_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030072,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_",
        "src_func_dst_func.reverse_subtract_constant_color_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030073,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_f",
        "unc_dst_func.reverse_subtract_constant_color_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030074,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_",
        "src_func_dst_func.reverse_subtract_constant_color_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030075,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_f",
        "unc_dst_func.reverse_subtract_constant_color_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030076,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_sr",
        "c_func_dst_func.reverse_subtract_constant_color_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030077,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_fun",
        "c_dst_func.reverse_subtract_constant_color_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030078,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_sr",
        "c_func_dst_func.reverse_subtract_constant_color_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030079,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_fun",
        "c_dst_func.reverse_subtract_constant_color_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030080,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_",
        "func_dst_func.reverse_subtract_constant_color_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030081,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_sr",
        "c_func_dst_func.reverse_subtract_one_minus_constant_color_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030082,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_sr",
        "c_func_dst_func.reverse_subtract_one_minus_constant_color_one");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030083,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_f",
        "unc_dst_func.reverse_subtract_one_minus_constant_color_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030084,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_func_d",
        "st_func.reverse_subtract_one_minus_constant_color_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030085,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_f",
        "unc_dst_func.reverse_subtract_one_minus_constant_color_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030086,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_func_d",
        "st_func.reverse_subtract_one_minus_constant_color_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030087,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_f",
        "unc_dst_func.reverse_subtract_one_minus_constant_color_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030088,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_func_d",
        "st_func.reverse_subtract_one_minus_constant_color_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030089,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_f",
        "unc_dst_func.reverse_subtract_one_minus_constant_color_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030090,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_func_d",
        "st_func.reverse_subtract_one_minus_constant_color_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030091,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_fun",
        "c_dst_func.reverse_subtract_one_minus_constant_color_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030092,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_func_dst",
        "_func.reverse_subtract_one_minus_constant_color_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030093,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_fun",
        "c_dst_func.reverse_subtract_one_minus_constant_color_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030094,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_func_dst",
        "_func.reverse_subtract_one_minus_constant_color_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030095,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_func_",
        "dst_func.reverse_subtract_one_minus_constant_color_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030096,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equati",
        "on_src_func_dst_func.reverse_subtract_constant_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030097,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equati",
        "on_src_func_dst_func.reverse_subtract_constant_alpha_one");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030098,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_",
        "src_func_dst_func.reverse_subtract_constant_alpha_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030099,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_f",
        "unc_dst_func.reverse_subtract_constant_alpha_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030100,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_",
        "src_func_dst_func.reverse_subtract_constant_alpha_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030101,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_f",
        "unc_dst_func.reverse_subtract_constant_alpha_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030102,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_",
        "src_func_dst_func.reverse_subtract_constant_alpha_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030103,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_f",
        "unc_dst_func.reverse_subtract_constant_alpha_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030104,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_",
        "src_func_dst_func.reverse_subtract_constant_alpha_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030105,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_f",
        "unc_dst_func.reverse_subtract_constant_alpha_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030106,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_sr",
        "c_func_dst_func.reverse_subtract_constant_alpha_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030107,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_fun",
        "c_dst_func.reverse_subtract_constant_alpha_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030108,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_sr",
        "c_func_dst_func.reverse_subtract_constant_alpha_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030109,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_fun",
        "c_dst_func.reverse_subtract_constant_alpha_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030110,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_",
        "func_dst_func.reverse_subtract_constant_alpha_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030111,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_sr",
        "c_func_dst_func.reverse_subtract_one_minus_constant_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030112,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_sr",
        "c_func_dst_func.reverse_subtract_one_minus_constant_alpha_one");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030113,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_f",
        "unc_dst_func.reverse_subtract_one_minus_constant_alpha_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030114,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_func_d",
        "st_func.reverse_subtract_one_minus_constant_alpha_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030115,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_f",
        "unc_dst_func.reverse_subtract_one_minus_constant_alpha_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030116,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_func_d",
        "st_func.reverse_subtract_one_minus_constant_alpha_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030117,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_f",
        "unc_dst_func.reverse_subtract_one_minus_constant_alpha_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030118,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_func_d",
        "st_func.reverse_subtract_one_minus_constant_alpha_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030119,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_f",
        "unc_dst_func.reverse_subtract_one_minus_constant_alpha_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030120,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_func_d",
        "st_func.reverse_subtract_one_minus_constant_alpha_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030121,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_fun",
        "c_dst_func.reverse_subtract_one_minus_constant_alpha_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030122,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_func_dst",
        "_func.reverse_subtract_one_minus_constant_alpha_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030123,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_fun",
        "c_dst_func.reverse_subtract_one_minus_constant_alpha_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030124,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_func_dst",
        "_func.reverse_subtract_one_minus_constant_alpha_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030125,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_func_",
        "dst_func.reverse_subtract_one_minus_constant_alpha_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030126,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation",
        "_src_func_dst_func.reverse_subtract_src_alpha_saturate_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030127,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation",
        "_src_func_dst_func.reverse_subtract_src_alpha_saturate_one");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030128,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_sr",
        "c_func_dst_func.reverse_subtract_src_alpha_saturate_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030129,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_fun",
        "c_dst_func.reverse_subtract_src_alpha_saturate_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030130,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_sr",
        "c_func_dst_func.reverse_subtract_src_alpha_saturate_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030131,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_fun",
        "c_dst_func.reverse_subtract_src_alpha_saturate_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030132,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_sr",
        "c_func_dst_func.reverse_subtract_src_alpha_saturate_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030133,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_fun",
        "c_dst_func.reverse_subtract_src_alpha_saturate_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030134,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_sr",
        "c_func_dst_func.reverse_subtract_src_alpha_saturate_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030135,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_fun",
        "c_dst_func.reverse_subtract_src_alpha_saturate_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030136,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_",
        "func_dst_func.reverse_subtract_src_alpha_saturate_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030137,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_func_",
        "dst_func.reverse_subtract_src_alpha_saturate_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030138,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_",
        "func_dst_func.reverse_subtract_src_alpha_saturate_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030139,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_func_",
        "dst_func.reverse_subtract_src_alpha_saturate_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030140,
        "dEQP-GLES3.functional.fragment_ops.blend.fbo_srgb.equation_src_fu",
        "nc_dst_func.reverse_subtract_src_alpha_saturate_src_alpha_saturate");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030141,
        "dEQP-GLES3.functional.fragment_ops.blend",
        ".fbo_srgb.equation_src_func_dst_func.min");

static SHRINK_HWTEST_F(ActsDeqpgles30030TestSuite, TestCase_030142,
        "dEQP-GLES3.functional.fragment_ops.blend",
        ".fbo_srgb.equation_src_func_dst_func.max");
