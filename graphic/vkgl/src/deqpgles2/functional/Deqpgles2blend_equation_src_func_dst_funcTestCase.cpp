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
#include "../ActsDeqpgles20012TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011152,
        "dEQP-GLES2.functional.fragment_ops.blend",
        ".equation_src_func_dst_func.add_zero_zero");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011153,
        "dEQP-GLES2.functional.fragment_ops.blend",
        ".equation_src_func_dst_func.add_zero_one");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011154,
        "dEQP-GLES2.functional.fragment_ops.blend.eq",
        "uation_src_func_dst_func.add_zero_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011155,
        "dEQP-GLES2.functional.fragment_ops.blend.equatio",
        "n_src_func_dst_func.add_zero_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011156,
        "dEQP-GLES2.functional.fragment_ops.blend.eq",
        "uation_src_func_dst_func.add_zero_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011157,
        "dEQP-GLES2.functional.fragment_ops.blend.equatio",
        "n_src_func_dst_func.add_zero_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011158,
        "dEQP-GLES2.functional.fragment_ops.blend.eq",
        "uation_src_func_dst_func.add_zero_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011159,
        "dEQP-GLES2.functional.fragment_ops.blend.equatio",
        "n_src_func_dst_func.add_zero_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011160,
        "dEQP-GLES2.functional.fragment_ops.blend.eq",
        "uation_src_func_dst_func.add_zero_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011161,
        "dEQP-GLES2.functional.fragment_ops.blend.equatio",
        "n_src_func_dst_func.add_zero_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011162,
        "dEQP-GLES2.functional.fragment_ops.blend.equa",
        "tion_src_func_dst_func.add_zero_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011163,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_",
        "src_func_dst_func.add_zero_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011164,
        "dEQP-GLES2.functional.fragment_ops.blend.equa",
        "tion_src_func_dst_func.add_zero_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011165,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_",
        "src_func_dst_func.add_zero_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011166,
        "dEQP-GLES2.functional.fragment_ops.blend",
        ".equation_src_func_dst_func.add_one_zero");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011167,
        "dEQP-GLES2.functional.fragment_ops.blen",
        "d.equation_src_func_dst_func.add_one_one");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011168,
        "dEQP-GLES2.functional.fragment_ops.blend.e",
        "quation_src_func_dst_func.add_one_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011169,
        "dEQP-GLES2.functional.fragment_ops.blend.equati",
        "on_src_func_dst_func.add_one_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011170,
        "dEQP-GLES2.functional.fragment_ops.blend.e",
        "quation_src_func_dst_func.add_one_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011171,
        "dEQP-GLES2.functional.fragment_ops.blend.equati",
        "on_src_func_dst_func.add_one_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011172,
        "dEQP-GLES2.functional.fragment_ops.blend.e",
        "quation_src_func_dst_func.add_one_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011173,
        "dEQP-GLES2.functional.fragment_ops.blend.equati",
        "on_src_func_dst_func.add_one_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011174,
        "dEQP-GLES2.functional.fragment_ops.blend.e",
        "quation_src_func_dst_func.add_one_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011175,
        "dEQP-GLES2.functional.fragment_ops.blend.equati",
        "on_src_func_dst_func.add_one_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011176,
        "dEQP-GLES2.functional.fragment_ops.blend.equa",
        "tion_src_func_dst_func.add_one_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011177,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_",
        "src_func_dst_func.add_one_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011178,
        "dEQP-GLES2.functional.fragment_ops.blend.equa",
        "tion_src_func_dst_func.add_one_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011179,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_",
        "src_func_dst_func.add_one_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011180,
        "dEQP-GLES2.functional.fragment_ops.blend.eq",
        "uation_src_func_dst_func.add_src_color_zero");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011181,
        "dEQP-GLES2.functional.fragment_ops.blend.e",
        "quation_src_func_dst_func.add_src_color_one");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011182,
        "dEQP-GLES2.functional.fragment_ops.blend.equa",
        "tion_src_func_dst_func.add_src_color_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011183,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_",
        "src_func_dst_func.add_src_color_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011184,
        "dEQP-GLES2.functional.fragment_ops.blend.equa",
        "tion_src_func_dst_func.add_src_color_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011185,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_",
        "src_func_dst_func.add_src_color_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011186,
        "dEQP-GLES2.functional.fragment_ops.blend.equa",
        "tion_src_func_dst_func.add_src_color_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011187,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_",
        "src_func_dst_func.add_src_color_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011188,
        "dEQP-GLES2.functional.fragment_ops.blend.equa",
        "tion_src_func_dst_func.add_src_color_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011189,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_",
        "src_func_dst_func.add_src_color_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011190,
        "dEQP-GLES2.functional.fragment_ops.blend.equatio",
        "n_src_func_dst_func.add_src_color_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011191,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src",
        "_func_dst_func.add_src_color_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011192,
        "dEQP-GLES2.functional.fragment_ops.blend.equatio",
        "n_src_func_dst_func.add_src_color_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011193,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src",
        "_func_dst_func.add_src_color_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011194,
        "dEQP-GLES2.functional.fragment_ops.blend.equatio",
        "n_src_func_dst_func.add_one_minus_src_color_zero");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011195,
        "dEQP-GLES2.functional.fragment_ops.blend.equati",
        "on_src_func_dst_func.add_one_minus_src_color_one");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011196,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_",
        "src_func_dst_func.add_one_minus_src_color_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011197,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_f",
        "unc_dst_func.add_one_minus_src_color_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011198,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_",
        "src_func_dst_func.add_one_minus_src_color_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011199,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_f",
        "unc_dst_func.add_one_minus_src_color_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011200,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_",
        "src_func_dst_func.add_one_minus_src_color_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011201,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_f",
        "unc_dst_func.add_one_minus_src_color_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011202,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_",
        "src_func_dst_func.add_one_minus_src_color_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011203,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_f",
        "unc_dst_func.add_one_minus_src_color_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011204,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src",
        "_func_dst_func.add_one_minus_src_color_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011205,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func",
        "_dst_func.add_one_minus_src_color_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011206,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src",
        "_func_dst_func.add_one_minus_src_color_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011207,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func",
        "_dst_func.add_one_minus_src_color_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011208,
        "dEQP-GLES2.functional.fragment_ops.blend.eq",
        "uation_src_func_dst_func.add_dst_color_zero");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011209,
        "dEQP-GLES2.functional.fragment_ops.blend.e",
        "quation_src_func_dst_func.add_dst_color_one");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011210,
        "dEQP-GLES2.functional.fragment_ops.blend.equa",
        "tion_src_func_dst_func.add_dst_color_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011211,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_",
        "src_func_dst_func.add_dst_color_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011212,
        "dEQP-GLES2.functional.fragment_ops.blend.equa",
        "tion_src_func_dst_func.add_dst_color_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011213,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_",
        "src_func_dst_func.add_dst_color_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011214,
        "dEQP-GLES2.functional.fragment_ops.blend.equa",
        "tion_src_func_dst_func.add_dst_color_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011215,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_",
        "src_func_dst_func.add_dst_color_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011216,
        "dEQP-GLES2.functional.fragment_ops.blend.equa",
        "tion_src_func_dst_func.add_dst_color_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011217,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_",
        "src_func_dst_func.add_dst_color_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011218,
        "dEQP-GLES2.functional.fragment_ops.blend.equatio",
        "n_src_func_dst_func.add_dst_color_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011219,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src",
        "_func_dst_func.add_dst_color_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011220,
        "dEQP-GLES2.functional.fragment_ops.blend.equatio",
        "n_src_func_dst_func.add_dst_color_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011221,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src",
        "_func_dst_func.add_dst_color_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011222,
        "dEQP-GLES2.functional.fragment_ops.blend.equatio",
        "n_src_func_dst_func.add_one_minus_dst_color_zero");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011223,
        "dEQP-GLES2.functional.fragment_ops.blend.equati",
        "on_src_func_dst_func.add_one_minus_dst_color_one");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011224,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_",
        "src_func_dst_func.add_one_minus_dst_color_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011225,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_f",
        "unc_dst_func.add_one_minus_dst_color_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011226,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_",
        "src_func_dst_func.add_one_minus_dst_color_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011227,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_f",
        "unc_dst_func.add_one_minus_dst_color_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011228,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_",
        "src_func_dst_func.add_one_minus_dst_color_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011229,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_f",
        "unc_dst_func.add_one_minus_dst_color_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011230,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_",
        "src_func_dst_func.add_one_minus_dst_color_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011231,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_f",
        "unc_dst_func.add_one_minus_dst_color_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011232,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src",
        "_func_dst_func.add_one_minus_dst_color_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011233,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func",
        "_dst_func.add_one_minus_dst_color_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011234,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src",
        "_func_dst_func.add_one_minus_dst_color_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011235,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func",
        "_dst_func.add_one_minus_dst_color_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011236,
        "dEQP-GLES2.functional.fragment_ops.blend.eq",
        "uation_src_func_dst_func.add_src_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011237,
        "dEQP-GLES2.functional.fragment_ops.blend.e",
        "quation_src_func_dst_func.add_src_alpha_one");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011238,
        "dEQP-GLES2.functional.fragment_ops.blend.equa",
        "tion_src_func_dst_func.add_src_alpha_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011239,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_",
        "src_func_dst_func.add_src_alpha_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011240,
        "dEQP-GLES2.functional.fragment_ops.blend.equa",
        "tion_src_func_dst_func.add_src_alpha_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011241,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_",
        "src_func_dst_func.add_src_alpha_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011242,
        "dEQP-GLES2.functional.fragment_ops.blend.equa",
        "tion_src_func_dst_func.add_src_alpha_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011243,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_",
        "src_func_dst_func.add_src_alpha_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011244,
        "dEQP-GLES2.functional.fragment_ops.blend.equa",
        "tion_src_func_dst_func.add_src_alpha_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011245,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_",
        "src_func_dst_func.add_src_alpha_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011246,
        "dEQP-GLES2.functional.fragment_ops.blend.equatio",
        "n_src_func_dst_func.add_src_alpha_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011247,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src",
        "_func_dst_func.add_src_alpha_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011248,
        "dEQP-GLES2.functional.fragment_ops.blend.equatio",
        "n_src_func_dst_func.add_src_alpha_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011249,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src",
        "_func_dst_func.add_src_alpha_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011250,
        "dEQP-GLES2.functional.fragment_ops.blend.equatio",
        "n_src_func_dst_func.add_one_minus_src_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011251,
        "dEQP-GLES2.functional.fragment_ops.blend.equati",
        "on_src_func_dst_func.add_one_minus_src_alpha_one");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011252,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_",
        "src_func_dst_func.add_one_minus_src_alpha_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011253,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_f",
        "unc_dst_func.add_one_minus_src_alpha_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011254,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_",
        "src_func_dst_func.add_one_minus_src_alpha_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011255,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_f",
        "unc_dst_func.add_one_minus_src_alpha_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011256,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_",
        "src_func_dst_func.add_one_minus_src_alpha_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011257,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_f",
        "unc_dst_func.add_one_minus_src_alpha_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011258,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_",
        "src_func_dst_func.add_one_minus_src_alpha_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011259,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_f",
        "unc_dst_func.add_one_minus_src_alpha_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011260,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src",
        "_func_dst_func.add_one_minus_src_alpha_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011261,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func",
        "_dst_func.add_one_minus_src_alpha_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011262,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src",
        "_func_dst_func.add_one_minus_src_alpha_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011263,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func",
        "_dst_func.add_one_minus_src_alpha_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011264,
        "dEQP-GLES2.functional.fragment_ops.blend.eq",
        "uation_src_func_dst_func.add_dst_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011265,
        "dEQP-GLES2.functional.fragment_ops.blend.e",
        "quation_src_func_dst_func.add_dst_alpha_one");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011266,
        "dEQP-GLES2.functional.fragment_ops.blend.equa",
        "tion_src_func_dst_func.add_dst_alpha_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011267,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_",
        "src_func_dst_func.add_dst_alpha_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011268,
        "dEQP-GLES2.functional.fragment_ops.blend.equa",
        "tion_src_func_dst_func.add_dst_alpha_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011269,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_",
        "src_func_dst_func.add_dst_alpha_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011270,
        "dEQP-GLES2.functional.fragment_ops.blend.equa",
        "tion_src_func_dst_func.add_dst_alpha_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011271,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_",
        "src_func_dst_func.add_dst_alpha_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011272,
        "dEQP-GLES2.functional.fragment_ops.blend.equa",
        "tion_src_func_dst_func.add_dst_alpha_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011273,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_",
        "src_func_dst_func.add_dst_alpha_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011274,
        "dEQP-GLES2.functional.fragment_ops.blend.equatio",
        "n_src_func_dst_func.add_dst_alpha_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011275,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src",
        "_func_dst_func.add_dst_alpha_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011276,
        "dEQP-GLES2.functional.fragment_ops.blend.equatio",
        "n_src_func_dst_func.add_dst_alpha_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011277,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src",
        "_func_dst_func.add_dst_alpha_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011278,
        "dEQP-GLES2.functional.fragment_ops.blend.equatio",
        "n_src_func_dst_func.add_one_minus_dst_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011279,
        "dEQP-GLES2.functional.fragment_ops.blend.equati",
        "on_src_func_dst_func.add_one_minus_dst_alpha_one");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011280,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_",
        "src_func_dst_func.add_one_minus_dst_alpha_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011281,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_f",
        "unc_dst_func.add_one_minus_dst_alpha_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011282,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_",
        "src_func_dst_func.add_one_minus_dst_alpha_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011283,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_f",
        "unc_dst_func.add_one_minus_dst_alpha_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011284,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_",
        "src_func_dst_func.add_one_minus_dst_alpha_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011285,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_f",
        "unc_dst_func.add_one_minus_dst_alpha_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011286,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_",
        "src_func_dst_func.add_one_minus_dst_alpha_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011287,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_f",
        "unc_dst_func.add_one_minus_dst_alpha_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011288,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src",
        "_func_dst_func.add_one_minus_dst_alpha_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011289,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func",
        "_dst_func.add_one_minus_dst_alpha_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011290,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src",
        "_func_dst_func.add_one_minus_dst_alpha_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011291,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func",
        "_dst_func.add_one_minus_dst_alpha_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011292,
        "dEQP-GLES2.functional.fragment_ops.blend.equa",
        "tion_src_func_dst_func.add_constant_color_zero");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011293,
        "dEQP-GLES2.functional.fragment_ops.blend.equa",
        "tion_src_func_dst_func.add_constant_color_one");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011294,
        "dEQP-GLES2.functional.fragment_ops.blend.equatio",
        "n_src_func_dst_func.add_constant_color_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011295,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src",
        "_func_dst_func.add_constant_color_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011296,
        "dEQP-GLES2.functional.fragment_ops.blend.equatio",
        "n_src_func_dst_func.add_constant_color_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011297,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src",
        "_func_dst_func.add_constant_color_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011298,
        "dEQP-GLES2.functional.fragment_ops.blend.equatio",
        "n_src_func_dst_func.add_constant_color_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011299,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src",
        "_func_dst_func.add_constant_color_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011300,
        "dEQP-GLES2.functional.fragment_ops.blend.equatio",
        "n_src_func_dst_func.add_constant_color_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011301,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src",
        "_func_dst_func.add_constant_color_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011302,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_",
        "src_func_dst_func.add_constant_color_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011303,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_f",
        "unc_dst_func.add_constant_color_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011304,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_",
        "src_func_dst_func.add_constant_color_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011305,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_f",
        "unc_dst_func.add_constant_color_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011306,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_",
        "src_func_dst_func.add_one_minus_constant_color_zero");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011307,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_",
        "src_func_dst_func.add_one_minus_constant_color_one");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011308,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src",
        "_func_dst_func.add_one_minus_constant_color_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011309,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func",
        "_dst_func.add_one_minus_constant_color_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011310,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src",
        "_func_dst_func.add_one_minus_constant_color_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011311,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func",
        "_dst_func.add_one_minus_constant_color_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011312,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src",
        "_func_dst_func.add_one_minus_constant_color_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011313,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func",
        "_dst_func.add_one_minus_constant_color_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011314,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src",
        "_func_dst_func.add_one_minus_constant_color_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011315,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func",
        "_dst_func.add_one_minus_constant_color_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011316,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_f",
        "unc_dst_func.add_one_minus_constant_color_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011317,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_d",
        "st_func.add_one_minus_constant_color_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011318,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_f",
        "unc_dst_func.add_one_minus_constant_color_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011319,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_d",
        "st_func.add_one_minus_constant_color_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011320,
        "dEQP-GLES2.functional.fragment_ops.blend.equa",
        "tion_src_func_dst_func.add_constant_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011321,
        "dEQP-GLES2.functional.fragment_ops.blend.equa",
        "tion_src_func_dst_func.add_constant_alpha_one");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011322,
        "dEQP-GLES2.functional.fragment_ops.blend.equatio",
        "n_src_func_dst_func.add_constant_alpha_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011323,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src",
        "_func_dst_func.add_constant_alpha_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011324,
        "dEQP-GLES2.functional.fragment_ops.blend.equatio",
        "n_src_func_dst_func.add_constant_alpha_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011325,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src",
        "_func_dst_func.add_constant_alpha_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011326,
        "dEQP-GLES2.functional.fragment_ops.blend.equatio",
        "n_src_func_dst_func.add_constant_alpha_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011327,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src",
        "_func_dst_func.add_constant_alpha_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011328,
        "dEQP-GLES2.functional.fragment_ops.blend.equatio",
        "n_src_func_dst_func.add_constant_alpha_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011329,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src",
        "_func_dst_func.add_constant_alpha_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011330,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_",
        "src_func_dst_func.add_constant_alpha_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011331,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_f",
        "unc_dst_func.add_constant_alpha_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011332,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_",
        "src_func_dst_func.add_constant_alpha_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011333,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_f",
        "unc_dst_func.add_constant_alpha_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011334,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_",
        "src_func_dst_func.add_one_minus_constant_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011335,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_",
        "src_func_dst_func.add_one_minus_constant_alpha_one");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011336,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src",
        "_func_dst_func.add_one_minus_constant_alpha_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011337,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func",
        "_dst_func.add_one_minus_constant_alpha_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011338,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src",
        "_func_dst_func.add_one_minus_constant_alpha_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011339,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func",
        "_dst_func.add_one_minus_constant_alpha_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011340,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src",
        "_func_dst_func.add_one_minus_constant_alpha_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011341,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func",
        "_dst_func.add_one_minus_constant_alpha_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011342,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src",
        "_func_dst_func.add_one_minus_constant_alpha_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011343,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func",
        "_dst_func.add_one_minus_constant_alpha_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011344,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_f",
        "unc_dst_func.add_one_minus_constant_alpha_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011345,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_d",
        "st_func.add_one_minus_constant_alpha_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011346,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_f",
        "unc_dst_func.add_one_minus_constant_alpha_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011347,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_d",
        "st_func.add_one_minus_constant_alpha_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011348,
        "dEQP-GLES2.functional.fragment_ops.blend.equati",
        "on_src_func_dst_func.add_src_alpha_saturate_zero");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011349,
        "dEQP-GLES2.functional.fragment_ops.blend.equati",
        "on_src_func_dst_func.add_src_alpha_saturate_one");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011350,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_",
        "src_func_dst_func.add_src_alpha_saturate_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011351,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_f",
        "unc_dst_func.add_src_alpha_saturate_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011352,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_",
        "src_func_dst_func.add_src_alpha_saturate_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011353,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_f",
        "unc_dst_func.add_src_alpha_saturate_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011354,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_",
        "src_func_dst_func.add_src_alpha_saturate_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011355,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_f",
        "unc_dst_func.add_src_alpha_saturate_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011356,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_",
        "src_func_dst_func.add_src_alpha_saturate_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011357,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_f",
        "unc_dst_func.add_src_alpha_saturate_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011358,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_sr",
        "c_func_dst_func.add_src_alpha_saturate_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011359,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_fun",
        "c_dst_func.add_src_alpha_saturate_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011360,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_sr",
        "c_func_dst_func.add_src_alpha_saturate_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011361,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_fun",
        "c_dst_func.add_src_alpha_saturate_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011362,
        "dEQP-GLES2.functional.fragment_ops.blend.eq",
        "uation_src_func_dst_func.subtract_zero_zero");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011363,
        "dEQP-GLES2.functional.fragment_ops.blend.e",
        "quation_src_func_dst_func.subtract_zero_one");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011364,
        "dEQP-GLES2.functional.fragment_ops.blend.equa",
        "tion_src_func_dst_func.subtract_zero_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011365,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_",
        "src_func_dst_func.subtract_zero_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011366,
        "dEQP-GLES2.functional.fragment_ops.blend.equa",
        "tion_src_func_dst_func.subtract_zero_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011367,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_",
        "src_func_dst_func.subtract_zero_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011368,
        "dEQP-GLES2.functional.fragment_ops.blend.equa",
        "tion_src_func_dst_func.subtract_zero_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011369,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_",
        "src_func_dst_func.subtract_zero_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011370,
        "dEQP-GLES2.functional.fragment_ops.blend.equa",
        "tion_src_func_dst_func.subtract_zero_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011371,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_",
        "src_func_dst_func.subtract_zero_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011372,
        "dEQP-GLES2.functional.fragment_ops.blend.equatio",
        "n_src_func_dst_func.subtract_zero_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011373,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src",
        "_func_dst_func.subtract_zero_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011374,
        "dEQP-GLES2.functional.fragment_ops.blend.equatio",
        "n_src_func_dst_func.subtract_zero_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011375,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src",
        "_func_dst_func.subtract_zero_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011376,
        "dEQP-GLES2.functional.fragment_ops.blend.e",
        "quation_src_func_dst_func.subtract_one_zero");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011377,
        "dEQP-GLES2.functional.fragment_ops.blend.e",
        "quation_src_func_dst_func.subtract_one_one");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011378,
        "dEQP-GLES2.functional.fragment_ops.blend.equa",
        "tion_src_func_dst_func.subtract_one_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011379,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_",
        "src_func_dst_func.subtract_one_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011380,
        "dEQP-GLES2.functional.fragment_ops.blend.equa",
        "tion_src_func_dst_func.subtract_one_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011381,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_",
        "src_func_dst_func.subtract_one_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011382,
        "dEQP-GLES2.functional.fragment_ops.blend.equa",
        "tion_src_func_dst_func.subtract_one_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011383,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_",
        "src_func_dst_func.subtract_one_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011384,
        "dEQP-GLES2.functional.fragment_ops.blend.equa",
        "tion_src_func_dst_func.subtract_one_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011385,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_",
        "src_func_dst_func.subtract_one_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011386,
        "dEQP-GLES2.functional.fragment_ops.blend.equati",
        "on_src_func_dst_func.subtract_one_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011387,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_sr",
        "c_func_dst_func.subtract_one_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011388,
        "dEQP-GLES2.functional.fragment_ops.blend.equati",
        "on_src_func_dst_func.subtract_one_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011389,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_sr",
        "c_func_dst_func.subtract_one_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011390,
        "dEQP-GLES2.functional.fragment_ops.blend.equa",
        "tion_src_func_dst_func.subtract_src_color_zero");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011391,
        "dEQP-GLES2.functional.fragment_ops.blend.equa",
        "tion_src_func_dst_func.subtract_src_color_one");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011392,
        "dEQP-GLES2.functional.fragment_ops.blend.equatio",
        "n_src_func_dst_func.subtract_src_color_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011393,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src",
        "_func_dst_func.subtract_src_color_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011394,
        "dEQP-GLES2.functional.fragment_ops.blend.equatio",
        "n_src_func_dst_func.subtract_src_color_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011395,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src",
        "_func_dst_func.subtract_src_color_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011396,
        "dEQP-GLES2.functional.fragment_ops.blend.equatio",
        "n_src_func_dst_func.subtract_src_color_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011397,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src",
        "_func_dst_func.subtract_src_color_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011398,
        "dEQP-GLES2.functional.fragment_ops.blend.equatio",
        "n_src_func_dst_func.subtract_src_color_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011399,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src",
        "_func_dst_func.subtract_src_color_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011400,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_",
        "src_func_dst_func.subtract_src_color_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011401,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_f",
        "unc_dst_func.subtract_src_color_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011402,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_",
        "src_func_dst_func.subtract_src_color_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011403,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_f",
        "unc_dst_func.subtract_src_color_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011404,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_",
        "src_func_dst_func.subtract_one_minus_src_color_zero");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011405,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_",
        "src_func_dst_func.subtract_one_minus_src_color_one");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011406,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src",
        "_func_dst_func.subtract_one_minus_src_color_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011407,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func",
        "_dst_func.subtract_one_minus_src_color_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011408,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src",
        "_func_dst_func.subtract_one_minus_src_color_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011409,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func",
        "_dst_func.subtract_one_minus_src_color_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011410,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src",
        "_func_dst_func.subtract_one_minus_src_color_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011411,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func",
        "_dst_func.subtract_one_minus_src_color_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011412,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src",
        "_func_dst_func.subtract_one_minus_src_color_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011413,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func",
        "_dst_func.subtract_one_minus_src_color_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011414,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_f",
        "unc_dst_func.subtract_one_minus_src_color_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011415,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_d",
        "st_func.subtract_one_minus_src_color_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011416,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_f",
        "unc_dst_func.subtract_one_minus_src_color_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011417,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_d",
        "st_func.subtract_one_minus_src_color_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011418,
        "dEQP-GLES2.functional.fragment_ops.blend.equa",
        "tion_src_func_dst_func.subtract_dst_color_zero");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011419,
        "dEQP-GLES2.functional.fragment_ops.blend.equa",
        "tion_src_func_dst_func.subtract_dst_color_one");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011420,
        "dEQP-GLES2.functional.fragment_ops.blend.equatio",
        "n_src_func_dst_func.subtract_dst_color_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011421,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src",
        "_func_dst_func.subtract_dst_color_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011422,
        "dEQP-GLES2.functional.fragment_ops.blend.equatio",
        "n_src_func_dst_func.subtract_dst_color_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011423,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src",
        "_func_dst_func.subtract_dst_color_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011424,
        "dEQP-GLES2.functional.fragment_ops.blend.equatio",
        "n_src_func_dst_func.subtract_dst_color_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011425,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src",
        "_func_dst_func.subtract_dst_color_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011426,
        "dEQP-GLES2.functional.fragment_ops.blend.equatio",
        "n_src_func_dst_func.subtract_dst_color_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011427,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src",
        "_func_dst_func.subtract_dst_color_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011428,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_",
        "src_func_dst_func.subtract_dst_color_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011429,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_f",
        "unc_dst_func.subtract_dst_color_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011430,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_",
        "src_func_dst_func.subtract_dst_color_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011431,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_f",
        "unc_dst_func.subtract_dst_color_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011432,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_",
        "src_func_dst_func.subtract_one_minus_dst_color_zero");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011433,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_",
        "src_func_dst_func.subtract_one_minus_dst_color_one");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011434,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src",
        "_func_dst_func.subtract_one_minus_dst_color_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011435,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func",
        "_dst_func.subtract_one_minus_dst_color_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011436,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src",
        "_func_dst_func.subtract_one_minus_dst_color_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011437,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func",
        "_dst_func.subtract_one_minus_dst_color_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011438,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src",
        "_func_dst_func.subtract_one_minus_dst_color_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011439,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func",
        "_dst_func.subtract_one_minus_dst_color_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011440,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src",
        "_func_dst_func.subtract_one_minus_dst_color_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011441,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func",
        "_dst_func.subtract_one_minus_dst_color_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011442,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_f",
        "unc_dst_func.subtract_one_minus_dst_color_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011443,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_d",
        "st_func.subtract_one_minus_dst_color_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011444,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_f",
        "unc_dst_func.subtract_one_minus_dst_color_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011445,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_d",
        "st_func.subtract_one_minus_dst_color_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011446,
        "dEQP-GLES2.functional.fragment_ops.blend.equa",
        "tion_src_func_dst_func.subtract_src_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011447,
        "dEQP-GLES2.functional.fragment_ops.blend.equa",
        "tion_src_func_dst_func.subtract_src_alpha_one");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011448,
        "dEQP-GLES2.functional.fragment_ops.blend.equatio",
        "n_src_func_dst_func.subtract_src_alpha_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011449,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src",
        "_func_dst_func.subtract_src_alpha_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011450,
        "dEQP-GLES2.functional.fragment_ops.blend.equatio",
        "n_src_func_dst_func.subtract_src_alpha_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011451,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src",
        "_func_dst_func.subtract_src_alpha_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011452,
        "dEQP-GLES2.functional.fragment_ops.blend.equatio",
        "n_src_func_dst_func.subtract_src_alpha_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011453,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src",
        "_func_dst_func.subtract_src_alpha_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011454,
        "dEQP-GLES2.functional.fragment_ops.blend.equatio",
        "n_src_func_dst_func.subtract_src_alpha_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011455,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src",
        "_func_dst_func.subtract_src_alpha_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011456,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_",
        "src_func_dst_func.subtract_src_alpha_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011457,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_f",
        "unc_dst_func.subtract_src_alpha_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011458,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_",
        "src_func_dst_func.subtract_src_alpha_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011459,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_f",
        "unc_dst_func.subtract_src_alpha_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011460,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_",
        "src_func_dst_func.subtract_one_minus_src_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011461,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_",
        "src_func_dst_func.subtract_one_minus_src_alpha_one");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011462,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src",
        "_func_dst_func.subtract_one_minus_src_alpha_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011463,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func",
        "_dst_func.subtract_one_minus_src_alpha_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011464,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src",
        "_func_dst_func.subtract_one_minus_src_alpha_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011465,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func",
        "_dst_func.subtract_one_minus_src_alpha_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011466,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src",
        "_func_dst_func.subtract_one_minus_src_alpha_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011467,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func",
        "_dst_func.subtract_one_minus_src_alpha_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011468,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src",
        "_func_dst_func.subtract_one_minus_src_alpha_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011469,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func",
        "_dst_func.subtract_one_minus_src_alpha_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011470,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_f",
        "unc_dst_func.subtract_one_minus_src_alpha_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011471,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_d",
        "st_func.subtract_one_minus_src_alpha_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011472,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_f",
        "unc_dst_func.subtract_one_minus_src_alpha_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011473,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_d",
        "st_func.subtract_one_minus_src_alpha_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011474,
        "dEQP-GLES2.functional.fragment_ops.blend.equa",
        "tion_src_func_dst_func.subtract_dst_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011475,
        "dEQP-GLES2.functional.fragment_ops.blend.equa",
        "tion_src_func_dst_func.subtract_dst_alpha_one");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011476,
        "dEQP-GLES2.functional.fragment_ops.blend.equatio",
        "n_src_func_dst_func.subtract_dst_alpha_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011477,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src",
        "_func_dst_func.subtract_dst_alpha_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011478,
        "dEQP-GLES2.functional.fragment_ops.blend.equatio",
        "n_src_func_dst_func.subtract_dst_alpha_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011479,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src",
        "_func_dst_func.subtract_dst_alpha_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011480,
        "dEQP-GLES2.functional.fragment_ops.blend.equatio",
        "n_src_func_dst_func.subtract_dst_alpha_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011481,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src",
        "_func_dst_func.subtract_dst_alpha_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011482,
        "dEQP-GLES2.functional.fragment_ops.blend.equatio",
        "n_src_func_dst_func.subtract_dst_alpha_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011483,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src",
        "_func_dst_func.subtract_dst_alpha_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011484,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_",
        "src_func_dst_func.subtract_dst_alpha_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011485,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_f",
        "unc_dst_func.subtract_dst_alpha_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011486,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_",
        "src_func_dst_func.subtract_dst_alpha_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011487,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_f",
        "unc_dst_func.subtract_dst_alpha_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011488,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_",
        "src_func_dst_func.subtract_one_minus_dst_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011489,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_",
        "src_func_dst_func.subtract_one_minus_dst_alpha_one");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011490,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src",
        "_func_dst_func.subtract_one_minus_dst_alpha_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011491,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func",
        "_dst_func.subtract_one_minus_dst_alpha_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011492,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src",
        "_func_dst_func.subtract_one_minus_dst_alpha_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011493,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func",
        "_dst_func.subtract_one_minus_dst_alpha_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011494,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src",
        "_func_dst_func.subtract_one_minus_dst_alpha_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011495,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func",
        "_dst_func.subtract_one_minus_dst_alpha_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011496,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src",
        "_func_dst_func.subtract_one_minus_dst_alpha_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011497,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func",
        "_dst_func.subtract_one_minus_dst_alpha_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011498,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_f",
        "unc_dst_func.subtract_one_minus_dst_alpha_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011499,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_d",
        "st_func.subtract_one_minus_dst_alpha_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011500,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_f",
        "unc_dst_func.subtract_one_minus_dst_alpha_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011501,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_d",
        "st_func.subtract_one_minus_dst_alpha_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011502,
        "dEQP-GLES2.functional.fragment_ops.blend.equatio",
        "n_src_func_dst_func.subtract_constant_color_zero");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011503,
        "dEQP-GLES2.functional.fragment_ops.blend.equati",
        "on_src_func_dst_func.subtract_constant_color_one");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011504,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_",
        "src_func_dst_func.subtract_constant_color_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011505,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_f",
        "unc_dst_func.subtract_constant_color_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011506,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_",
        "src_func_dst_func.subtract_constant_color_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011507,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_f",
        "unc_dst_func.subtract_constant_color_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011508,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_",
        "src_func_dst_func.subtract_constant_color_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011509,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_f",
        "unc_dst_func.subtract_constant_color_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011510,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_",
        "src_func_dst_func.subtract_constant_color_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011511,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_f",
        "unc_dst_func.subtract_constant_color_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011512,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src",
        "_func_dst_func.subtract_constant_color_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011513,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func",
        "_dst_func.subtract_constant_color_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011514,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src",
        "_func_dst_func.subtract_constant_color_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011515,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func",
        "_dst_func.subtract_constant_color_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011516,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src",
        "_func_dst_func.subtract_one_minus_constant_color_zero");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011517,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_sr",
        "c_func_dst_func.subtract_one_minus_constant_color_one");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011518,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_f",
        "unc_dst_func.subtract_one_minus_constant_color_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011519,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_d",
        "st_func.subtract_one_minus_constant_color_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011520,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_f",
        "unc_dst_func.subtract_one_minus_constant_color_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011521,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_d",
        "st_func.subtract_one_minus_constant_color_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011522,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_f",
        "unc_dst_func.subtract_one_minus_constant_color_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011523,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_d",
        "st_func.subtract_one_minus_constant_color_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011524,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_f",
        "unc_dst_func.subtract_one_minus_constant_color_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011525,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_d",
        "st_func.subtract_one_minus_constant_color_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011526,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func",
        "_dst_func.subtract_one_minus_constant_color_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011527,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_dst_",
        "func.subtract_one_minus_constant_color_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011528,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func",
        "_dst_func.subtract_one_minus_constant_color_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011529,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_dst_",
        "func.subtract_one_minus_constant_color_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011530,
        "dEQP-GLES2.functional.fragment_ops.blend.equatio",
        "n_src_func_dst_func.subtract_constant_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011531,
        "dEQP-GLES2.functional.fragment_ops.blend.equati",
        "on_src_func_dst_func.subtract_constant_alpha_one");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011532,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_",
        "src_func_dst_func.subtract_constant_alpha_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011533,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_f",
        "unc_dst_func.subtract_constant_alpha_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011534,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_",
        "src_func_dst_func.subtract_constant_alpha_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011535,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_f",
        "unc_dst_func.subtract_constant_alpha_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011536,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_",
        "src_func_dst_func.subtract_constant_alpha_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011537,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_f",
        "unc_dst_func.subtract_constant_alpha_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011538,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_",
        "src_func_dst_func.subtract_constant_alpha_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011539,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_f",
        "unc_dst_func.subtract_constant_alpha_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011540,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src",
        "_func_dst_func.subtract_constant_alpha_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011541,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func",
        "_dst_func.subtract_constant_alpha_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011542,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src",
        "_func_dst_func.subtract_constant_alpha_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011543,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func",
        "_dst_func.subtract_constant_alpha_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011544,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src",
        "_func_dst_func.subtract_one_minus_constant_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011545,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_sr",
        "c_func_dst_func.subtract_one_minus_constant_alpha_one");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011546,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_f",
        "unc_dst_func.subtract_one_minus_constant_alpha_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011547,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_d",
        "st_func.subtract_one_minus_constant_alpha_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011548,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_f",
        "unc_dst_func.subtract_one_minus_constant_alpha_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011549,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_d",
        "st_func.subtract_one_minus_constant_alpha_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011550,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_f",
        "unc_dst_func.subtract_one_minus_constant_alpha_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011551,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_d",
        "st_func.subtract_one_minus_constant_alpha_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011552,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_f",
        "unc_dst_func.subtract_one_minus_constant_alpha_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011553,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_d",
        "st_func.subtract_one_minus_constant_alpha_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011554,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func",
        "_dst_func.subtract_one_minus_constant_alpha_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011555,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_dst_",
        "func.subtract_one_minus_constant_alpha_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011556,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func",
        "_dst_func.subtract_one_minus_constant_alpha_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011557,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_dst_",
        "func.subtract_one_minus_constant_alpha_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011558,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_",
        "src_func_dst_func.subtract_src_alpha_saturate_zero");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011559,
        "dEQP-GLES2.functional.fragment_ops.blend.equation",
        "_src_func_dst_func.subtract_src_alpha_saturate_one");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011560,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_sr",
        "c_func_dst_func.subtract_src_alpha_saturate_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011561,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_fun",
        "c_dst_func.subtract_src_alpha_saturate_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011562,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_sr",
        "c_func_dst_func.subtract_src_alpha_saturate_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011563,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_fun",
        "c_dst_func.subtract_src_alpha_saturate_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011564,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_sr",
        "c_func_dst_func.subtract_src_alpha_saturate_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011565,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_fun",
        "c_dst_func.subtract_src_alpha_saturate_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011566,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_sr",
        "c_func_dst_func.subtract_src_alpha_saturate_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011567,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_fun",
        "c_dst_func.subtract_src_alpha_saturate_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011568,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_f",
        "unc_dst_func.subtract_src_alpha_saturate_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011569,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_d",
        "st_func.subtract_src_alpha_saturate_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011570,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_f",
        "unc_dst_func.subtract_src_alpha_saturate_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011571,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_d",
        "st_func.subtract_src_alpha_saturate_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011572,
        "dEQP-GLES2.functional.fragment_ops.blend.equati",
        "on_src_func_dst_func.reverse_subtract_zero_zero");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011573,
        "dEQP-GLES2.functional.fragment_ops.blend.equat",
        "ion_src_func_dst_func.reverse_subtract_zero_one");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011574,
        "dEQP-GLES2.functional.fragment_ops.blend.equation",
        "_src_func_dst_func.reverse_subtract_zero_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011575,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_",
        "func_dst_func.reverse_subtract_zero_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011576,
        "dEQP-GLES2.functional.fragment_ops.blend.equation",
        "_src_func_dst_func.reverse_subtract_zero_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011577,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_",
        "func_dst_func.reverse_subtract_zero_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011578,
        "dEQP-GLES2.functional.fragment_ops.blend.equation",
        "_src_func_dst_func.reverse_subtract_zero_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011579,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_",
        "func_dst_func.reverse_subtract_zero_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011580,
        "dEQP-GLES2.functional.fragment_ops.blend.equation",
        "_src_func_dst_func.reverse_subtract_zero_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011581,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_",
        "func_dst_func.reverse_subtract_zero_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011582,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_sr",
        "c_func_dst_func.reverse_subtract_zero_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011583,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_fun",
        "c_dst_func.reverse_subtract_zero_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011584,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_sr",
        "c_func_dst_func.reverse_subtract_zero_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011585,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_fun",
        "c_dst_func.reverse_subtract_zero_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011586,
        "dEQP-GLES2.functional.fragment_ops.blend.equat",
        "ion_src_func_dst_func.reverse_subtract_one_zero");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011587,
        "dEQP-GLES2.functional.fragment_ops.blend.equat",
        "ion_src_func_dst_func.reverse_subtract_one_one");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011588,
        "dEQP-GLES2.functional.fragment_ops.blend.equation",
        "_src_func_dst_func.reverse_subtract_one_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011589,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_",
        "func_dst_func.reverse_subtract_one_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011590,
        "dEQP-GLES2.functional.fragment_ops.blend.equation",
        "_src_func_dst_func.reverse_subtract_one_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011591,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_",
        "func_dst_func.reverse_subtract_one_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011592,
        "dEQP-GLES2.functional.fragment_ops.blend.equation",
        "_src_func_dst_func.reverse_subtract_one_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011593,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_",
        "func_dst_func.reverse_subtract_one_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011594,
        "dEQP-GLES2.functional.fragment_ops.blend.equation",
        "_src_func_dst_func.reverse_subtract_one_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011595,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_",
        "func_dst_func.reverse_subtract_one_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011596,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_s",
        "rc_func_dst_func.reverse_subtract_one_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011597,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_fu",
        "nc_dst_func.reverse_subtract_one_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011598,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_s",
        "rc_func_dst_func.reverse_subtract_one_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011599,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_fu",
        "nc_dst_func.reverse_subtract_one_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011600,
        "dEQP-GLES2.functional.fragment_ops.blend.equation",
        "_src_func_dst_func.reverse_subtract_src_color_zero");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011601,
        "dEQP-GLES2.functional.fragment_ops.blend.equation",
        "_src_func_dst_func.reverse_subtract_src_color_one");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011602,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_sr",
        "c_func_dst_func.reverse_subtract_src_color_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011603,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_fun",
        "c_dst_func.reverse_subtract_src_color_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011604,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_sr",
        "c_func_dst_func.reverse_subtract_src_color_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011605,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_fun",
        "c_dst_func.reverse_subtract_src_color_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011606,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_sr",
        "c_func_dst_func.reverse_subtract_src_color_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011607,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_fun",
        "c_dst_func.reverse_subtract_src_color_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011608,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_sr",
        "c_func_dst_func.reverse_subtract_src_color_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011609,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_fun",
        "c_dst_func.reverse_subtract_src_color_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011610,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_",
        "func_dst_func.reverse_subtract_src_color_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011611,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_",
        "dst_func.reverse_subtract_src_color_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011612,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_",
        "func_dst_func.reverse_subtract_src_color_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011613,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_",
        "dst_func.reverse_subtract_src_color_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011614,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_",
        "func_dst_func.reverse_subtract_one_minus_src_color_zero");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011615,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_",
        "func_dst_func.reverse_subtract_one_minus_src_color_one");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011616,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_fun",
        "c_dst_func.reverse_subtract_one_minus_src_color_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011617,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_dst",
        "_func.reverse_subtract_one_minus_src_color_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011618,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_fun",
        "c_dst_func.reverse_subtract_one_minus_src_color_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011619,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_dst",
        "_func.reverse_subtract_one_minus_src_color_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011620,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_fun",
        "c_dst_func.reverse_subtract_one_minus_src_color_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011621,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_dst",
        "_func.reverse_subtract_one_minus_src_color_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011622,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_fun",
        "c_dst_func.reverse_subtract_one_minus_src_color_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011623,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_dst",
        "_func.reverse_subtract_one_minus_src_color_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011624,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_",
        "dst_func.reverse_subtract_one_minus_src_color_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011625,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_dst_f",
        "unc.reverse_subtract_one_minus_src_color_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011626,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_",
        "dst_func.reverse_subtract_one_minus_src_color_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011627,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_dst_f",
        "unc.reverse_subtract_one_minus_src_color_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011628,
        "dEQP-GLES2.functional.fragment_ops.blend.equation",
        "_src_func_dst_func.reverse_subtract_dst_color_zero");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011629,
        "dEQP-GLES2.functional.fragment_ops.blend.equation",
        "_src_func_dst_func.reverse_subtract_dst_color_one");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011630,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_sr",
        "c_func_dst_func.reverse_subtract_dst_color_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011631,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_fun",
        "c_dst_func.reverse_subtract_dst_color_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011632,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_sr",
        "c_func_dst_func.reverse_subtract_dst_color_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011633,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_fun",
        "c_dst_func.reverse_subtract_dst_color_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011634,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_sr",
        "c_func_dst_func.reverse_subtract_dst_color_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011635,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_fun",
        "c_dst_func.reverse_subtract_dst_color_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011636,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_sr",
        "c_func_dst_func.reverse_subtract_dst_color_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011637,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_fun",
        "c_dst_func.reverse_subtract_dst_color_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011638,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_",
        "func_dst_func.reverse_subtract_dst_color_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011639,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_",
        "dst_func.reverse_subtract_dst_color_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011640,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_",
        "func_dst_func.reverse_subtract_dst_color_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011641,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_",
        "dst_func.reverse_subtract_dst_color_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011642,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_",
        "func_dst_func.reverse_subtract_one_minus_dst_color_zero");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011643,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_",
        "func_dst_func.reverse_subtract_one_minus_dst_color_one");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011644,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_fun",
        "c_dst_func.reverse_subtract_one_minus_dst_color_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011645,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_dst",
        "_func.reverse_subtract_one_minus_dst_color_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011646,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_fun",
        "c_dst_func.reverse_subtract_one_minus_dst_color_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011647,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_dst",
        "_func.reverse_subtract_one_minus_dst_color_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011648,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_fun",
        "c_dst_func.reverse_subtract_one_minus_dst_color_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011649,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_dst",
        "_func.reverse_subtract_one_minus_dst_color_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011650,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_fun",
        "c_dst_func.reverse_subtract_one_minus_dst_color_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011651,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_dst",
        "_func.reverse_subtract_one_minus_dst_color_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011652,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_",
        "dst_func.reverse_subtract_one_minus_dst_color_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011653,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_dst_f",
        "unc.reverse_subtract_one_minus_dst_color_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011654,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_",
        "dst_func.reverse_subtract_one_minus_dst_color_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011655,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_dst_f",
        "unc.reverse_subtract_one_minus_dst_color_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011656,
        "dEQP-GLES2.functional.fragment_ops.blend.equation",
        "_src_func_dst_func.reverse_subtract_src_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011657,
        "dEQP-GLES2.functional.fragment_ops.blend.equation",
        "_src_func_dst_func.reverse_subtract_src_alpha_one");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011658,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_sr",
        "c_func_dst_func.reverse_subtract_src_alpha_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011659,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_fun",
        "c_dst_func.reverse_subtract_src_alpha_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011660,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_sr",
        "c_func_dst_func.reverse_subtract_src_alpha_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011661,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_fun",
        "c_dst_func.reverse_subtract_src_alpha_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011662,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_sr",
        "c_func_dst_func.reverse_subtract_src_alpha_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011663,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_fun",
        "c_dst_func.reverse_subtract_src_alpha_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011664,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_sr",
        "c_func_dst_func.reverse_subtract_src_alpha_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011665,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_fun",
        "c_dst_func.reverse_subtract_src_alpha_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011666,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_",
        "func_dst_func.reverse_subtract_src_alpha_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011667,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_",
        "dst_func.reverse_subtract_src_alpha_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011668,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_",
        "func_dst_func.reverse_subtract_src_alpha_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011669,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_",
        "dst_func.reverse_subtract_src_alpha_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011670,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_",
        "func_dst_func.reverse_subtract_one_minus_src_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011671,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_",
        "func_dst_func.reverse_subtract_one_minus_src_alpha_one");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011672,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_fun",
        "c_dst_func.reverse_subtract_one_minus_src_alpha_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011673,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_dst",
        "_func.reverse_subtract_one_minus_src_alpha_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011674,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_fun",
        "c_dst_func.reverse_subtract_one_minus_src_alpha_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011675,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_dst",
        "_func.reverse_subtract_one_minus_src_alpha_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011676,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_fun",
        "c_dst_func.reverse_subtract_one_minus_src_alpha_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011677,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_dst",
        "_func.reverse_subtract_one_minus_src_alpha_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011678,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_fun",
        "c_dst_func.reverse_subtract_one_minus_src_alpha_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011679,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_dst",
        "_func.reverse_subtract_one_minus_src_alpha_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011680,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_",
        "dst_func.reverse_subtract_one_minus_src_alpha_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011681,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_dst_f",
        "unc.reverse_subtract_one_minus_src_alpha_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011682,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_",
        "dst_func.reverse_subtract_one_minus_src_alpha_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011683,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_dst_f",
        "unc.reverse_subtract_one_minus_src_alpha_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011684,
        "dEQP-GLES2.functional.fragment_ops.blend.equation",
        "_src_func_dst_func.reverse_subtract_dst_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011685,
        "dEQP-GLES2.functional.fragment_ops.blend.equation",
        "_src_func_dst_func.reverse_subtract_dst_alpha_one");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011686,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_sr",
        "c_func_dst_func.reverse_subtract_dst_alpha_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011687,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_fun",
        "c_dst_func.reverse_subtract_dst_alpha_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011688,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_sr",
        "c_func_dst_func.reverse_subtract_dst_alpha_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011689,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_fun",
        "c_dst_func.reverse_subtract_dst_alpha_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011690,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_sr",
        "c_func_dst_func.reverse_subtract_dst_alpha_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011691,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_fun",
        "c_dst_func.reverse_subtract_dst_alpha_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011692,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_sr",
        "c_func_dst_func.reverse_subtract_dst_alpha_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011693,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_fun",
        "c_dst_func.reverse_subtract_dst_alpha_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011694,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_",
        "func_dst_func.reverse_subtract_dst_alpha_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011695,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_",
        "dst_func.reverse_subtract_dst_alpha_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011696,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_",
        "func_dst_func.reverse_subtract_dst_alpha_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011697,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_",
        "dst_func.reverse_subtract_dst_alpha_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011698,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_",
        "func_dst_func.reverse_subtract_one_minus_dst_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011699,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_",
        "func_dst_func.reverse_subtract_one_minus_dst_alpha_one");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011700,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_fun",
        "c_dst_func.reverse_subtract_one_minus_dst_alpha_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011701,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_dst",
        "_func.reverse_subtract_one_minus_dst_alpha_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011702,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_fun",
        "c_dst_func.reverse_subtract_one_minus_dst_alpha_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011703,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_dst",
        "_func.reverse_subtract_one_minus_dst_alpha_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011704,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_fun",
        "c_dst_func.reverse_subtract_one_minus_dst_alpha_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011705,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_dst",
        "_func.reverse_subtract_one_minus_dst_alpha_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011706,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_fun",
        "c_dst_func.reverse_subtract_one_minus_dst_alpha_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011707,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_dst",
        "_func.reverse_subtract_one_minus_dst_alpha_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011708,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_",
        "dst_func.reverse_subtract_one_minus_dst_alpha_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011709,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_dst_f",
        "unc.reverse_subtract_one_minus_dst_alpha_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011710,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_",
        "dst_func.reverse_subtract_one_minus_dst_alpha_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011711,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_dst_f",
        "unc.reverse_subtract_one_minus_dst_alpha_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011712,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_sr",
        "c_func_dst_func.reverse_subtract_constant_color_zero");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011713,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_s",
        "rc_func_dst_func.reverse_subtract_constant_color_one");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011714,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_",
        "func_dst_func.reverse_subtract_constant_color_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011715,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_",
        "dst_func.reverse_subtract_constant_color_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011716,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_",
        "func_dst_func.reverse_subtract_constant_color_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011717,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_",
        "dst_func.reverse_subtract_constant_color_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011718,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_",
        "func_dst_func.reverse_subtract_constant_color_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011719,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_",
        "dst_func.reverse_subtract_constant_color_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011720,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_",
        "func_dst_func.reverse_subtract_constant_color_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011721,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_",
        "dst_func.reverse_subtract_constant_color_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011722,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_fun",
        "c_dst_func.reverse_subtract_constant_color_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011723,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_dst",
        "_func.reverse_subtract_constant_color_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011724,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_fun",
        "c_dst_func.reverse_subtract_constant_color_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011725,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_dst",
        "_func.reverse_subtract_constant_color_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011726,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_fun",
        "c_dst_func.reverse_subtract_one_minus_constant_color_zero");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011727,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_fu",
        "nc_dst_func.reverse_subtract_one_minus_constant_color_one");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011728,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_",
        "dst_func.reverse_subtract_one_minus_constant_color_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011729,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_dst_f",
        "unc.reverse_subtract_one_minus_constant_color_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011730,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_",
        "dst_func.reverse_subtract_one_minus_constant_color_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011731,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_dst_f",
        "unc.reverse_subtract_one_minus_constant_color_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011732,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_",
        "dst_func.reverse_subtract_one_minus_constant_color_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011733,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_dst_f",
        "unc.reverse_subtract_one_minus_constant_color_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011734,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_",
        "dst_func.reverse_subtract_one_minus_constant_color_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011735,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_dst_f",
        "unc.reverse_subtract_one_minus_constant_color_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011736,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_dst",
        "_func.reverse_subtract_one_minus_constant_color_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011737,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_dst_func",
        ".reverse_subtract_one_minus_constant_color_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011738,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_dst",
        "_func.reverse_subtract_one_minus_constant_color_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011739,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_dst_func",
        ".reverse_subtract_one_minus_constant_color_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011740,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_sr",
        "c_func_dst_func.reverse_subtract_constant_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011741,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_s",
        "rc_func_dst_func.reverse_subtract_constant_alpha_one");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011742,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_",
        "func_dst_func.reverse_subtract_constant_alpha_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011743,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_",
        "dst_func.reverse_subtract_constant_alpha_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011744,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_",
        "func_dst_func.reverse_subtract_constant_alpha_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011745,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_",
        "dst_func.reverse_subtract_constant_alpha_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011746,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_",
        "func_dst_func.reverse_subtract_constant_alpha_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011747,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_",
        "dst_func.reverse_subtract_constant_alpha_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011748,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_",
        "func_dst_func.reverse_subtract_constant_alpha_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011749,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_",
        "dst_func.reverse_subtract_constant_alpha_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011750,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_fun",
        "c_dst_func.reverse_subtract_constant_alpha_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011751,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_dst",
        "_func.reverse_subtract_constant_alpha_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011752,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_fun",
        "c_dst_func.reverse_subtract_constant_alpha_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011753,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_dst",
        "_func.reverse_subtract_constant_alpha_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011754,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_fun",
        "c_dst_func.reverse_subtract_one_minus_constant_alpha_zero");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011755,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_fu",
        "nc_dst_func.reverse_subtract_one_minus_constant_alpha_one");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011756,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_",
        "dst_func.reverse_subtract_one_minus_constant_alpha_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011757,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_dst_f",
        "unc.reverse_subtract_one_minus_constant_alpha_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011758,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_",
        "dst_func.reverse_subtract_one_minus_constant_alpha_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011759,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_dst_f",
        "unc.reverse_subtract_one_minus_constant_alpha_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011760,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_",
        "dst_func.reverse_subtract_one_minus_constant_alpha_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011761,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_dst_f",
        "unc.reverse_subtract_one_minus_constant_alpha_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011762,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_",
        "dst_func.reverse_subtract_one_minus_constant_alpha_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011763,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_dst_f",
        "unc.reverse_subtract_one_minus_constant_alpha_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011764,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_dst",
        "_func.reverse_subtract_one_minus_constant_alpha_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011765,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_dst_func",
        ".reverse_subtract_one_minus_constant_alpha_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011766,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_dst",
        "_func.reverse_subtract_one_minus_constant_alpha_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011767,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_dst_func",
        ".reverse_subtract_one_minus_constant_alpha_one_minus_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011768,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_",
        "func_dst_func.reverse_subtract_src_alpha_saturate_zero");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011769,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src",
        "_func_dst_func.reverse_subtract_src_alpha_saturate_one");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011770,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_fu",
        "nc_dst_func.reverse_subtract_src_alpha_saturate_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011771,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_ds",
        "t_func.reverse_subtract_src_alpha_saturate_one_minus_src_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011772,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_fu",
        "nc_dst_func.reverse_subtract_src_alpha_saturate_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011773,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_ds",
        "t_func.reverse_subtract_src_alpha_saturate_one_minus_dst_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011774,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_fu",
        "nc_dst_func.reverse_subtract_src_alpha_saturate_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011775,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_ds",
        "t_func.reverse_subtract_src_alpha_saturate_one_minus_src_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011776,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_fu",
        "nc_dst_func.reverse_subtract_src_alpha_saturate_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011777,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_ds",
        "t_func.reverse_subtract_src_alpha_saturate_one_minus_dst_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011778,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_",
        "dst_func.reverse_subtract_src_alpha_saturate_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011779,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_dst_f",
        "unc.reverse_subtract_src_alpha_saturate_one_minus_constant_color");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011780,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_",
        "dst_func.reverse_subtract_src_alpha_saturate_constant_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011781,
        "dEQP-GLES2.functional.fragment_ops.blend.equation_src_func_dst_f",
        "unc.reverse_subtract_src_alpha_saturate_one_minus_constant_alpha");
