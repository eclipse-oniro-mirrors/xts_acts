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
#include "../ActsDeqpgles20001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000559,
        "dEQP-GLES2.functional.shaders.preprocesso",
        "r.operator_precedence.modulo_vs_not_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000560,
        "dEQP-GLES2.functional.shaders.preprocessor",
        ".operator_precedence.modulo_vs_not_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000561,
        "dEQP-GLES2.functional.shaders.preprocess",
        "or.operator_precedence.div_vs_not_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000562,
        "dEQP-GLES2.functional.shaders.preprocesso",
        "r.operator_precedence.div_vs_not_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000563,
        "dEQP-GLES2.functional.shaders.preprocess",
        "or.operator_precedence.mul_vs_not_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000564,
        "dEQP-GLES2.functional.shaders.preprocesso",
        "r.operator_precedence.mul_vs_not_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000565,
        "dEQP-GLES2.functional.shaders.preprocessor.op",
        "erator_precedence.modulo_vs_bit_invert_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000566,
        "dEQP-GLES2.functional.shaders.preprocessor.ope",
        "rator_precedence.modulo_vs_bit_invert_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000567,
        "dEQP-GLES2.functional.shaders.preprocessor",
        ".operator_precedence.modulo_vs_minus_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000568,
        "dEQP-GLES2.functional.shaders.preprocessor.",
        "operator_precedence.modulo_vs_minus_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000569,
        "dEQP-GLES2.functional.shaders.preprocessor",
        ".operator_precedence.modulo_vs_plus_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000570,
        "dEQP-GLES2.functional.shaders.preprocessor.",
        "operator_precedence.modulo_vs_plus_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000571,
        "dEQP-GLES2.functional.shaders.preprocessor.",
        "operator_precedence.div_vs_bit_invert_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000572,
        "dEQP-GLES2.functional.shaders.preprocessor.o",
        "perator_precedence.div_vs_bit_invert_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000573,
        "dEQP-GLES2.functional.shaders.preprocesso",
        "r.operator_precedence.div_vs_minus_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000574,
        "dEQP-GLES2.functional.shaders.preprocessor",
        ".operator_precedence.div_vs_minus_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000575,
        "dEQP-GLES2.functional.shaders.preprocess",
        "or.operator_precedence.div_vs_plus_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000576,
        "dEQP-GLES2.functional.shaders.preprocesso",
        "r.operator_precedence.div_vs_plus_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000577,
        "dEQP-GLES2.functional.shaders.preprocessor.",
        "operator_precedence.mul_vs_bit_invert_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000578,
        "dEQP-GLES2.functional.shaders.preprocessor.o",
        "perator_precedence.mul_vs_bit_invert_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000579,
        "dEQP-GLES2.functional.shaders.preprocesso",
        "r.operator_precedence.mul_vs_minus_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000580,
        "dEQP-GLES2.functional.shaders.preprocessor",
        ".operator_precedence.mul_vs_minus_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000581,
        "dEQP-GLES2.functional.shaders.preprocess",
        "or.operator_precedence.mul_vs_plus_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000582,
        "dEQP-GLES2.functional.shaders.preprocesso",
        "r.operator_precedence.mul_vs_plus_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000583,
        "dEQP-GLES2.functional.shaders.preprocesso",
        "r.operator_precedence.sub_vs_modulo_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000584,
        "dEQP-GLES2.functional.shaders.preprocessor",
        ".operator_precedence.sub_vs_modulo_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000585,
        "dEQP-GLES2.functional.shaders.preprocess",
        "or.operator_precedence.sub_vs_div_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000586,
        "dEQP-GLES2.functional.shaders.preprocesso",
        "r.operator_precedence.sub_vs_div_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000587,
        "dEQP-GLES2.functional.shaders.preprocess",
        "or.operator_precedence.sub_vs_mul_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000588,
        "dEQP-GLES2.functional.shaders.preprocesso",
        "r.operator_precedence.sub_vs_mul_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000589,
        "dEQP-GLES2.functional.shaders.preprocesso",
        "r.operator_precedence.add_vs_modulo_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000590,
        "dEQP-GLES2.functional.shaders.preprocessor",
        ".operator_precedence.add_vs_modulo_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000591,
        "dEQP-GLES2.functional.shaders.preprocess",
        "or.operator_precedence.add_vs_div_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000592,
        "dEQP-GLES2.functional.shaders.preprocesso",
        "r.operator_precedence.add_vs_div_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000593,
        "dEQP-GLES2.functional.shaders.preprocess",
        "or.operator_precedence.add_vs_mul_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000594,
        "dEQP-GLES2.functional.shaders.preprocesso",
        "r.operator_precedence.add_vs_mul_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000595,
        "dEQP-GLES2.functional.shaders.preprocesso",
        "r.operator_precedence.rshift_vs_sub_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000596,
        "dEQP-GLES2.functional.shaders.preprocessor",
        ".operator_precedence.rshift_vs_sub_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000597,
        "dEQP-GLES2.functional.shaders.preprocesso",
        "r.operator_precedence.rshift_vs_add_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000598,
        "dEQP-GLES2.functional.shaders.preprocessor",
        ".operator_precedence.rshift_vs_add_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000599,
        "dEQP-GLES2.functional.shaders.preprocesso",
        "r.operator_precedence.lshift_vs_sub_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000600,
        "dEQP-GLES2.functional.shaders.preprocessor",
        ".operator_precedence.lshift_vs_sub_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000601,
        "dEQP-GLES2.functional.shaders.preprocesso",
        "r.operator_precedence.lshift_vs_add_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000602,
        "dEQP-GLES2.functional.shaders.preprocessor",
        ".operator_precedence.lshift_vs_add_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000603,
        "dEQP-GLES2.functional.shaders.preprocessor.opera",
        "tor_precedence.greater_or_equal_vs_rshift_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000604,
        "dEQP-GLES2.functional.shaders.preprocessor.operat",
        "or_precedence.greater_or_equal_vs_rshift_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000605,
        "dEQP-GLES2.functional.shaders.preprocessor.opera",
        "tor_precedence.greater_or_equal_vs_lshift_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000606,
        "dEQP-GLES2.functional.shaders.preprocessor.operat",
        "or_precedence.greater_or_equal_vs_lshift_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000607,
        "dEQP-GLES2.functional.shaders.preprocessor.ope",
        "rator_precedence.less_or_equal_vs_rshift_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000608,
        "dEQP-GLES2.functional.shaders.preprocessor.oper",
        "ator_precedence.less_or_equal_vs_rshift_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000609,
        "dEQP-GLES2.functional.shaders.preprocessor.ope",
        "rator_precedence.less_or_equal_vs_lshift_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000610,
        "dEQP-GLES2.functional.shaders.preprocessor.oper",
        "ator_precedence.less_or_equal_vs_lshift_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000611,
        "dEQP-GLES2.functional.shaders.preprocessor.",
        "operator_precedence.greater_vs_rshift_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000612,
        "dEQP-GLES2.functional.shaders.preprocessor.o",
        "perator_precedence.greater_vs_rshift_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000613,
        "dEQP-GLES2.functional.shaders.preprocessor.",
        "operator_precedence.greater_vs_lshift_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000614,
        "dEQP-GLES2.functional.shaders.preprocessor.o",
        "perator_precedence.greater_vs_lshift_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000615,
        "dEQP-GLES2.functional.shaders.preprocessor",
        ".operator_precedence.less_vs_rshift_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000616,
        "dEQP-GLES2.functional.shaders.preprocessor.",
        "operator_precedence.less_vs_rshift_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000617,
        "dEQP-GLES2.functional.shaders.preprocessor",
        ".operator_precedence.less_vs_lshift_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000618,
        "dEQP-GLES2.functional.shaders.preprocessor.",
        "operator_precedence.less_vs_lshift_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000619,
        "dEQP-GLES2.functional.shaders.preprocessor.operat",
        "or_precedence.not_equal_vs_greater_or_equal_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000620,
        "dEQP-GLES2.functional.shaders.preprocessor.operato",
        "r_precedence.not_equal_vs_greater_or_equal_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000621,
        "dEQP-GLES2.functional.shaders.preprocessor.opera",
        "tor_precedence.not_equal_vs_less_or_equal_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000622,
        "dEQP-GLES2.functional.shaders.preprocessor.operat",
        "or_precedence.not_equal_vs_less_or_equal_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000623,
        "dEQP-GLES2.functional.shaders.preprocessor.op",
        "erator_precedence.not_equal_vs_greater_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000624,
        "dEQP-GLES2.functional.shaders.preprocessor.ope",
        "rator_precedence.not_equal_vs_greater_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000625,
        "dEQP-GLES2.functional.shaders.preprocessor.",
        "operator_precedence.not_equal_vs_less_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000626,
        "dEQP-GLES2.functional.shaders.preprocessor.o",
        "perator_precedence.not_equal_vs_less_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000627,
        "dEQP-GLES2.functional.shaders.preprocessor.oper",
        "ator_precedence.equal_vs_greater_or_equal_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000628,
        "dEQP-GLES2.functional.shaders.preprocessor.opera",
        "tor_precedence.equal_vs_greater_or_equal_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000629,
        "dEQP-GLES2.functional.shaders.preprocessor.ope",
        "rator_precedence.equal_vs_less_or_equal_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000630,
        "dEQP-GLES2.functional.shaders.preprocessor.oper",
        "ator_precedence.equal_vs_less_or_equal_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000631,
        "dEQP-GLES2.functional.shaders.preprocessor.",
        "operator_precedence.equal_vs_greater_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000632,
        "dEQP-GLES2.functional.shaders.preprocessor.o",
        "perator_precedence.equal_vs_greater_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000633,
        "dEQP-GLES2.functional.shaders.preprocesso",
        "r.operator_precedence.equal_vs_less_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000634,
        "dEQP-GLES2.functional.shaders.preprocessor",
        ".operator_precedence.equal_vs_less_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000635,
        "dEQP-GLES2.functional.shaders.preprocessor.oper",
        "ator_precedence.bitwise_and_vs_not_equal_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000636,
        "dEQP-GLES2.functional.shaders.preprocessor.opera",
        "tor_precedence.bitwise_and_vs_not_equal_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000637,
        "dEQP-GLES2.functional.shaders.preprocessor.op",
        "erator_precedence.bitwise_and_vs_equal_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000638,
        "dEQP-GLES2.functional.shaders.preprocessor.ope",
        "rator_precedence.bitwise_and_vs_equal_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000639,
        "dEQP-GLES2.functional.shaders.preprocessor.o",
        "perator_precedence.xor_vs_bitwise_and_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000640,
        "dEQP-GLES2.functional.shaders.preprocessor.op",
        "erator_precedence.xor_vs_bitwise_and_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000641,
        "dEQP-GLES2.functional.shaders.preprocessor.",
        "operator_precedence.bitwise_or_vs_xor_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000642,
        "dEQP-GLES2.functional.shaders.preprocessor.o",
        "perator_precedence.bitwise_or_vs_xor_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000643,
        "dEQP-GLES2.functional.shaders.preprocessor.oper",
        "ator_precedence.logical_and_vs_bitwise_or_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000644,
        "dEQP-GLES2.functional.shaders.preprocessor.opera",
        "tor_precedence.logical_and_vs_bitwise_or_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000645,
        "dEQP-GLES2.functional.shaders.preprocessor.opera",
        "tor_precedence.logical_and_vs_bitwise_and_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000646,
        "dEQP-GLES2.functional.shaders.preprocessor.operat",
        "or_precedence.logical_and_vs_bitwise_and_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000647,
        "dEQP-GLES2.functional.shaders.preprocessor.oper",
        "ator_precedence.logical_or_vs_logical_and_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000648,
        "dEQP-GLES2.functional.shaders.preprocessor.opera",
        "tor_precedence.logical_or_vs_logical_and_fragment");
