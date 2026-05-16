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
#include "../Khrgles3BaseFunc.h"
#include "../ActsKhrgles30002TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001298,
        "KHR-GLES3.shaders.preprocessor.oper",
        "ator_precedence.modulo_vs_not_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001299,
        "KHR-GLES3.shaders.preprocessor.opera",
        "tor_precedence.modulo_vs_not_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001300,
        "KHR-GLES3.shaders.preprocessor.ope",
        "rator_precedence.div_vs_not_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001301,
        "KHR-GLES3.shaders.preprocessor.oper",
        "ator_precedence.div_vs_not_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001302,
        "KHR-GLES3.shaders.preprocessor.ope",
        "rator_precedence.mul_vs_not_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001303,
        "KHR-GLES3.shaders.preprocessor.oper",
        "ator_precedence.mul_vs_not_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001304,
        "KHR-GLES3.shaders.preprocessor.operator",
        "_precedence.modulo_vs_bit_invert_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001305,
        "KHR-GLES3.shaders.preprocessor.operator_",
        "precedence.modulo_vs_bit_invert_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001306,
        "KHR-GLES3.shaders.preprocessor.opera",
        "tor_precedence.modulo_vs_minus_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001307,
        "KHR-GLES3.shaders.preprocessor.operat",
        "or_precedence.modulo_vs_minus_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001308,
        "KHR-GLES3.shaders.preprocessor.opera",
        "tor_precedence.modulo_vs_plus_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001309,
        "KHR-GLES3.shaders.preprocessor.operat",
        "or_precedence.modulo_vs_plus_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001310,
        "KHR-GLES3.shaders.preprocessor.operat",
        "or_precedence.div_vs_bit_invert_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001311,
        "KHR-GLES3.shaders.preprocessor.operato",
        "r_precedence.div_vs_bit_invert_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001312,
        "KHR-GLES3.shaders.preprocessor.oper",
        "ator_precedence.div_vs_minus_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001313,
        "KHR-GLES3.shaders.preprocessor.opera",
        "tor_precedence.div_vs_minus_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001314,
        "KHR-GLES3.shaders.preprocessor.ope",
        "rator_precedence.div_vs_plus_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001315,
        "KHR-GLES3.shaders.preprocessor.oper",
        "ator_precedence.div_vs_plus_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001316,
        "KHR-GLES3.shaders.preprocessor.operat",
        "or_precedence.mul_vs_bit_invert_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001317,
        "KHR-GLES3.shaders.preprocessor.operato",
        "r_precedence.mul_vs_bit_invert_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001318,
        "KHR-GLES3.shaders.preprocessor.oper",
        "ator_precedence.mul_vs_minus_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001319,
        "KHR-GLES3.shaders.preprocessor.opera",
        "tor_precedence.mul_vs_minus_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001320,
        "KHR-GLES3.shaders.preprocessor.ope",
        "rator_precedence.mul_vs_plus_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001321,
        "KHR-GLES3.shaders.preprocessor.oper",
        "ator_precedence.mul_vs_plus_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001322,
        "KHR-GLES3.shaders.preprocessor.oper",
        "ator_precedence.sub_vs_modulo_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001323,
        "KHR-GLES3.shaders.preprocessor.opera",
        "tor_precedence.sub_vs_modulo_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001324,
        "KHR-GLES3.shaders.preprocessor.ope",
        "rator_precedence.sub_vs_div_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001325,
        "KHR-GLES3.shaders.preprocessor.oper",
        "ator_precedence.sub_vs_div_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001326,
        "KHR-GLES3.shaders.preprocessor.ope",
        "rator_precedence.sub_vs_mul_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001327,
        "KHR-GLES3.shaders.preprocessor.oper",
        "ator_precedence.sub_vs_mul_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001328,
        "KHR-GLES3.shaders.preprocessor.oper",
        "ator_precedence.add_vs_modulo_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001329,
        "KHR-GLES3.shaders.preprocessor.opera",
        "tor_precedence.add_vs_modulo_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001330,
        "KHR-GLES3.shaders.preprocessor.ope",
        "rator_precedence.add_vs_div_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001331,
        "KHR-GLES3.shaders.preprocessor.oper",
        "ator_precedence.add_vs_div_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001332,
        "KHR-GLES3.shaders.preprocessor.ope",
        "rator_precedence.add_vs_mul_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001333,
        "KHR-GLES3.shaders.preprocessor.oper",
        "ator_precedence.add_vs_mul_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001334,
        "KHR-GLES3.shaders.preprocessor.oper",
        "ator_precedence.rshift_vs_sub_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001335,
        "KHR-GLES3.shaders.preprocessor.opera",
        "tor_precedence.rshift_vs_sub_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001336,
        "KHR-GLES3.shaders.preprocessor.oper",
        "ator_precedence.rshift_vs_add_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001337,
        "KHR-GLES3.shaders.preprocessor.opera",
        "tor_precedence.rshift_vs_add_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001338,
        "KHR-GLES3.shaders.preprocessor.oper",
        "ator_precedence.lshift_vs_sub_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001339,
        "KHR-GLES3.shaders.preprocessor.opera",
        "tor_precedence.lshift_vs_sub_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001340,
        "KHR-GLES3.shaders.preprocessor.oper",
        "ator_precedence.lshift_vs_add_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001341,
        "KHR-GLES3.shaders.preprocessor.opera",
        "tor_precedence.lshift_vs_add_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001342,
        "KHR-GLES3.shaders.preprocessor.operator_pr",
        "ecedence.greater_or_equal_vs_rshift_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001343,
        "KHR-GLES3.shaders.preprocessor.operator_pre",
        "cedence.greater_or_equal_vs_rshift_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001344,
        "KHR-GLES3.shaders.preprocessor.operator_pr",
        "ecedence.greater_or_equal_vs_lshift_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001345,
        "KHR-GLES3.shaders.preprocessor.operator_pre",
        "cedence.greater_or_equal_vs_lshift_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001346,
        "KHR-GLES3.shaders.preprocessor.operator_",
        "precedence.less_or_equal_vs_rshift_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001347,
        "KHR-GLES3.shaders.preprocessor.operator_p",
        "recedence.less_or_equal_vs_rshift_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001348,
        "KHR-GLES3.shaders.preprocessor.operator_",
        "precedence.less_or_equal_vs_lshift_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001349,
        "KHR-GLES3.shaders.preprocessor.operator_p",
        "recedence.less_or_equal_vs_lshift_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001350,
        "KHR-GLES3.shaders.preprocessor.operat",
        "or_precedence.greater_vs_rshift_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001351,
        "KHR-GLES3.shaders.preprocessor.operato",
        "r_precedence.greater_vs_rshift_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001352,
        "KHR-GLES3.shaders.preprocessor.operat",
        "or_precedence.greater_vs_lshift_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001353,
        "KHR-GLES3.shaders.preprocessor.operato",
        "r_precedence.greater_vs_lshift_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001354,
        "KHR-GLES3.shaders.preprocessor.opera",
        "tor_precedence.less_vs_rshift_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001355,
        "KHR-GLES3.shaders.preprocessor.operat",
        "or_precedence.less_vs_rshift_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001356,
        "KHR-GLES3.shaders.preprocessor.opera",
        "tor_precedence.less_vs_lshift_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001357,
        "KHR-GLES3.shaders.preprocessor.operat",
        "or_precedence.less_vs_lshift_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001358,
        "KHR-GLES3.shaders.preprocessor.operator_pre",
        "cedence.not_equal_vs_greater_or_equal_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001359,
        "KHR-GLES3.shaders.preprocessor.operator_prec",
        "edence.not_equal_vs_greater_or_equal_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001360,
        "KHR-GLES3.shaders.preprocessor.operator_pr",
        "ecedence.not_equal_vs_less_or_equal_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001361,
        "KHR-GLES3.shaders.preprocessor.operator_pre",
        "cedence.not_equal_vs_less_or_equal_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001362,
        "KHR-GLES3.shaders.preprocessor.operator",
        "_precedence.not_equal_vs_greater_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001363,
        "KHR-GLES3.shaders.preprocessor.operator_",
        "precedence.not_equal_vs_greater_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001364,
        "KHR-GLES3.shaders.preprocessor.operat",
        "or_precedence.not_equal_vs_less_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001365,
        "KHR-GLES3.shaders.preprocessor.operato",
        "r_precedence.not_equal_vs_less_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001366,
        "KHR-GLES3.shaders.preprocessor.operator_p",
        "recedence.equal_vs_greater_or_equal_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001367,
        "KHR-GLES3.shaders.preprocessor.operator_pr",
        "ecedence.equal_vs_greater_or_equal_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001368,
        "KHR-GLES3.shaders.preprocessor.operator_",
        "precedence.equal_vs_less_or_equal_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001369,
        "KHR-GLES3.shaders.preprocessor.operator_p",
        "recedence.equal_vs_less_or_equal_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001370,
        "KHR-GLES3.shaders.preprocessor.operat",
        "or_precedence.equal_vs_greater_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001371,
        "KHR-GLES3.shaders.preprocessor.operato",
        "r_precedence.equal_vs_greater_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001372,
        "KHR-GLES3.shaders.preprocessor.oper",
        "ator_precedence.equal_vs_less_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001373,
        "KHR-GLES3.shaders.preprocessor.opera",
        "tor_precedence.equal_vs_less_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001374,
        "KHR-GLES3.shaders.preprocessor.operator_p",
        "recedence.bitwise_and_vs_not_equal_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001375,
        "KHR-GLES3.shaders.preprocessor.operator_pr",
        "ecedence.bitwise_and_vs_not_equal_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001376,
        "KHR-GLES3.shaders.preprocessor.operator",
        "_precedence.bitwise_and_vs_equal_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001377,
        "KHR-GLES3.shaders.preprocessor.operator_",
        "precedence.bitwise_and_vs_equal_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001378,
        "KHR-GLES3.shaders.preprocessor.operato",
        "r_precedence.xor_vs_bitwise_and_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001379,
        "KHR-GLES3.shaders.preprocessor.operator",
        "_precedence.xor_vs_bitwise_and_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001380,
        "KHR-GLES3.shaders.preprocessor.operat",
        "or_precedence.bitwise_or_vs_xor_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001381,
        "KHR-GLES3.shaders.preprocessor.operato",
        "r_precedence.bitwise_or_vs_xor_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001382,
        "KHR-GLES3.shaders.preprocessor.operator_p",
        "recedence.logical_and_vs_bitwise_or_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001383,
        "KHR-GLES3.shaders.preprocessor.operator_pr",
        "ecedence.logical_and_vs_bitwise_or_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001384,
        "KHR-GLES3.shaders.preprocessor.operator_pr",
        "ecedence.logical_and_vs_bitwise_and_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001385,
        "KHR-GLES3.shaders.preprocessor.operator_pre",
        "cedence.logical_and_vs_bitwise_and_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001386,
        "KHR-GLES3.shaders.preprocessor.operator_p",
        "recedence.logical_or_vs_logical_and_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001387,
        "KHR-GLES3.shaders.preprocessor.operator_pr",
        "ecedence.logical_or_vs_logical_and_fragment");
