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
#include "../ActsDeqpgles30002TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001242,
        "dEQP-GLES3.functional.shaders.preprocesso",
        "r.operator_precedence.modulo_vs_not_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001243,
        "dEQP-GLES3.functional.shaders.preprocessor",
        ".operator_precedence.modulo_vs_not_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001244,
        "dEQP-GLES3.functional.shaders.preprocess",
        "or.operator_precedence.div_vs_not_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001245,
        "dEQP-GLES3.functional.shaders.preprocesso",
        "r.operator_precedence.div_vs_not_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001246,
        "dEQP-GLES3.functional.shaders.preprocess",
        "or.operator_precedence.mul_vs_not_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001247,
        "dEQP-GLES3.functional.shaders.preprocesso",
        "r.operator_precedence.mul_vs_not_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001248,
        "dEQP-GLES3.functional.shaders.preprocessor.op",
        "erator_precedence.modulo_vs_bit_invert_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001249,
        "dEQP-GLES3.functional.shaders.preprocessor.ope",
        "rator_precedence.modulo_vs_bit_invert_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001250,
        "dEQP-GLES3.functional.shaders.preprocessor",
        ".operator_precedence.modulo_vs_minus_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001251,
        "dEQP-GLES3.functional.shaders.preprocessor.",
        "operator_precedence.modulo_vs_minus_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001252,
        "dEQP-GLES3.functional.shaders.preprocessor",
        ".operator_precedence.modulo_vs_plus_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001253,
        "dEQP-GLES3.functional.shaders.preprocessor.",
        "operator_precedence.modulo_vs_plus_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001254,
        "dEQP-GLES3.functional.shaders.preprocessor.",
        "operator_precedence.div_vs_bit_invert_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001255,
        "dEQP-GLES3.functional.shaders.preprocessor.o",
        "perator_precedence.div_vs_bit_invert_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001256,
        "dEQP-GLES3.functional.shaders.preprocesso",
        "r.operator_precedence.div_vs_minus_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001257,
        "dEQP-GLES3.functional.shaders.preprocessor",
        ".operator_precedence.div_vs_minus_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001258,
        "dEQP-GLES3.functional.shaders.preprocess",
        "or.operator_precedence.div_vs_plus_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001259,
        "dEQP-GLES3.functional.shaders.preprocesso",
        "r.operator_precedence.div_vs_plus_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001260,
        "dEQP-GLES3.functional.shaders.preprocessor.",
        "operator_precedence.mul_vs_bit_invert_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001261,
        "dEQP-GLES3.functional.shaders.preprocessor.o",
        "perator_precedence.mul_vs_bit_invert_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001262,
        "dEQP-GLES3.functional.shaders.preprocesso",
        "r.operator_precedence.mul_vs_minus_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001263,
        "dEQP-GLES3.functional.shaders.preprocessor",
        ".operator_precedence.mul_vs_minus_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001264,
        "dEQP-GLES3.functional.shaders.preprocess",
        "or.operator_precedence.mul_vs_plus_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001265,
        "dEQP-GLES3.functional.shaders.preprocesso",
        "r.operator_precedence.mul_vs_plus_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001266,
        "dEQP-GLES3.functional.shaders.preprocesso",
        "r.operator_precedence.sub_vs_modulo_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001267,
        "dEQP-GLES3.functional.shaders.preprocessor",
        ".operator_precedence.sub_vs_modulo_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001268,
        "dEQP-GLES3.functional.shaders.preprocess",
        "or.operator_precedence.sub_vs_div_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001269,
        "dEQP-GLES3.functional.shaders.preprocesso",
        "r.operator_precedence.sub_vs_div_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001270,
        "dEQP-GLES3.functional.shaders.preprocess",
        "or.operator_precedence.sub_vs_mul_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001271,
        "dEQP-GLES3.functional.shaders.preprocesso",
        "r.operator_precedence.sub_vs_mul_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001272,
        "dEQP-GLES3.functional.shaders.preprocesso",
        "r.operator_precedence.add_vs_modulo_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001273,
        "dEQP-GLES3.functional.shaders.preprocessor",
        ".operator_precedence.add_vs_modulo_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001274,
        "dEQP-GLES3.functional.shaders.preprocess",
        "or.operator_precedence.add_vs_div_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001275,
        "dEQP-GLES3.functional.shaders.preprocesso",
        "r.operator_precedence.add_vs_div_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001276,
        "dEQP-GLES3.functional.shaders.preprocess",
        "or.operator_precedence.add_vs_mul_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001277,
        "dEQP-GLES3.functional.shaders.preprocesso",
        "r.operator_precedence.add_vs_mul_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001278,
        "dEQP-GLES3.functional.shaders.preprocesso",
        "r.operator_precedence.rshift_vs_sub_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001279,
        "dEQP-GLES3.functional.shaders.preprocessor",
        ".operator_precedence.rshift_vs_sub_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001280,
        "dEQP-GLES3.functional.shaders.preprocesso",
        "r.operator_precedence.rshift_vs_add_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001281,
        "dEQP-GLES3.functional.shaders.preprocessor",
        ".operator_precedence.rshift_vs_add_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001282,
        "dEQP-GLES3.functional.shaders.preprocesso",
        "r.operator_precedence.lshift_vs_sub_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001283,
        "dEQP-GLES3.functional.shaders.preprocessor",
        ".operator_precedence.lshift_vs_sub_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001284,
        "dEQP-GLES3.functional.shaders.preprocesso",
        "r.operator_precedence.lshift_vs_add_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001285,
        "dEQP-GLES3.functional.shaders.preprocessor",
        ".operator_precedence.lshift_vs_add_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001286,
        "dEQP-GLES3.functional.shaders.preprocessor.opera",
        "tor_precedence.greater_or_equal_vs_rshift_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001287,
        "dEQP-GLES3.functional.shaders.preprocessor.operat",
        "or_precedence.greater_or_equal_vs_rshift_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001288,
        "dEQP-GLES3.functional.shaders.preprocessor.opera",
        "tor_precedence.greater_or_equal_vs_lshift_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001289,
        "dEQP-GLES3.functional.shaders.preprocessor.operat",
        "or_precedence.greater_or_equal_vs_lshift_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001290,
        "dEQP-GLES3.functional.shaders.preprocessor.ope",
        "rator_precedence.less_or_equal_vs_rshift_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001291,
        "dEQP-GLES3.functional.shaders.preprocessor.oper",
        "ator_precedence.less_or_equal_vs_rshift_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001292,
        "dEQP-GLES3.functional.shaders.preprocessor.ope",
        "rator_precedence.less_or_equal_vs_lshift_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001293,
        "dEQP-GLES3.functional.shaders.preprocessor.oper",
        "ator_precedence.less_or_equal_vs_lshift_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001294,
        "dEQP-GLES3.functional.shaders.preprocessor.",
        "operator_precedence.greater_vs_rshift_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001295,
        "dEQP-GLES3.functional.shaders.preprocessor.o",
        "perator_precedence.greater_vs_rshift_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001296,
        "dEQP-GLES3.functional.shaders.preprocessor.",
        "operator_precedence.greater_vs_lshift_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001297,
        "dEQP-GLES3.functional.shaders.preprocessor.o",
        "perator_precedence.greater_vs_lshift_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001298,
        "dEQP-GLES3.functional.shaders.preprocessor",
        ".operator_precedence.less_vs_rshift_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001299,
        "dEQP-GLES3.functional.shaders.preprocessor.",
        "operator_precedence.less_vs_rshift_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001300,
        "dEQP-GLES3.functional.shaders.preprocessor",
        ".operator_precedence.less_vs_lshift_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001301,
        "dEQP-GLES3.functional.shaders.preprocessor.",
        "operator_precedence.less_vs_lshift_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001302,
        "dEQP-GLES3.functional.shaders.preprocessor.operat",
        "or_precedence.not_equal_vs_greater_or_equal_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001303,
        "dEQP-GLES3.functional.shaders.preprocessor.operato",
        "r_precedence.not_equal_vs_greater_or_equal_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001304,
        "dEQP-GLES3.functional.shaders.preprocessor.opera",
        "tor_precedence.not_equal_vs_less_or_equal_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001305,
        "dEQP-GLES3.functional.shaders.preprocessor.operat",
        "or_precedence.not_equal_vs_less_or_equal_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001306,
        "dEQP-GLES3.functional.shaders.preprocessor.op",
        "erator_precedence.not_equal_vs_greater_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001307,
        "dEQP-GLES3.functional.shaders.preprocessor.ope",
        "rator_precedence.not_equal_vs_greater_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001308,
        "dEQP-GLES3.functional.shaders.preprocessor.",
        "operator_precedence.not_equal_vs_less_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001309,
        "dEQP-GLES3.functional.shaders.preprocessor.o",
        "perator_precedence.not_equal_vs_less_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001310,
        "dEQP-GLES3.functional.shaders.preprocessor.oper",
        "ator_precedence.equal_vs_greater_or_equal_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001311,
        "dEQP-GLES3.functional.shaders.preprocessor.opera",
        "tor_precedence.equal_vs_greater_or_equal_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001312,
        "dEQP-GLES3.functional.shaders.preprocessor.ope",
        "rator_precedence.equal_vs_less_or_equal_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001313,
        "dEQP-GLES3.functional.shaders.preprocessor.oper",
        "ator_precedence.equal_vs_less_or_equal_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001314,
        "dEQP-GLES3.functional.shaders.preprocessor.",
        "operator_precedence.equal_vs_greater_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001315,
        "dEQP-GLES3.functional.shaders.preprocessor.o",
        "perator_precedence.equal_vs_greater_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001316,
        "dEQP-GLES3.functional.shaders.preprocesso",
        "r.operator_precedence.equal_vs_less_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001317,
        "dEQP-GLES3.functional.shaders.preprocessor",
        ".operator_precedence.equal_vs_less_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001318,
        "dEQP-GLES3.functional.shaders.preprocessor.oper",
        "ator_precedence.bitwise_and_vs_not_equal_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001319,
        "dEQP-GLES3.functional.shaders.preprocessor.opera",
        "tor_precedence.bitwise_and_vs_not_equal_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001320,
        "dEQP-GLES3.functional.shaders.preprocessor.op",
        "erator_precedence.bitwise_and_vs_equal_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001321,
        "dEQP-GLES3.functional.shaders.preprocessor.ope",
        "rator_precedence.bitwise_and_vs_equal_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001322,
        "dEQP-GLES3.functional.shaders.preprocessor.o",
        "perator_precedence.xor_vs_bitwise_and_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001323,
        "dEQP-GLES3.functional.shaders.preprocessor.op",
        "erator_precedence.xor_vs_bitwise_and_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001324,
        "dEQP-GLES3.functional.shaders.preprocessor.",
        "operator_precedence.bitwise_or_vs_xor_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001325,
        "dEQP-GLES3.functional.shaders.preprocessor.o",
        "perator_precedence.bitwise_or_vs_xor_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001326,
        "dEQP-GLES3.functional.shaders.preprocessor.oper",
        "ator_precedence.logical_and_vs_bitwise_or_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001327,
        "dEQP-GLES3.functional.shaders.preprocessor.opera",
        "tor_precedence.logical_and_vs_bitwise_or_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001328,
        "dEQP-GLES3.functional.shaders.preprocessor.opera",
        "tor_precedence.logical_and_vs_bitwise_and_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001329,
        "dEQP-GLES3.functional.shaders.preprocessor.operat",
        "or_precedence.logical_and_vs_bitwise_and_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001330,
        "dEQP-GLES3.functional.shaders.preprocessor.oper",
        "ator_precedence.logical_or_vs_logical_and_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001331,
        "dEQP-GLES3.functional.shaders.preprocessor.opera",
        "tor_precedence.logical_or_vs_logical_and_fragment");
