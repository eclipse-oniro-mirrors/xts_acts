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

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000491,
        "dEQP-GLES2.functional.shaders.prepro",
        "cessor.expressions.shift_left_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000492,
        "dEQP-GLES2.functional.shaders.preproc",
        "essor.expressions.shift_left_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000493,
        "dEQP-GLES2.functional.shaders.prepro",
        "cessor.expressions.shift_right_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000494,
        "dEQP-GLES2.functional.shaders.preproc",
        "essor.expressions.shift_right_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000495,
        "dEQP-GLES2.functional.shaders.preproc",
        "essor.expressions.cmp_less_than_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000496,
        "dEQP-GLES2.functional.shaders.preproce",
        "ssor.expressions.cmp_less_than_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000497,
        "dEQP-GLES2.functional.shaders.preproc",
        "essor.expressions.less_or_equal_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000498,
        "dEQP-GLES2.functional.shaders.preproce",
        "ssor.expressions.less_or_equal_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000499,
        "dEQP-GLES2.functional.shaders.pr",
        "eprocessor.expressions.or_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000500,
        "dEQP-GLES2.functional.shaders.pre",
        "processor.expressions.or_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000501,
        "dEQP-GLES2.functional.shaders.pr",
        "eprocessor.expressions.and_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000502,
        "dEQP-GLES2.functional.shaders.pre",
        "processor.expressions.and_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000503,
        "dEQP-GLES2.functional.shaders.pr",
        "eprocessor.expressions.xor_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000504,
        "dEQP-GLES2.functional.shaders.pre",
        "processor.expressions.xor_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000505,
        "dEQP-GLES2.functional.shaders.pr",
        "eprocessor.expressions.mod_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000506,
        "dEQP-GLES2.functional.shaders.pre",
        "processor.expressions.mod_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000507,
        "dEQP-GLES2.functional.shaders.preproces",
        "sor.expressions.parenthesis_value_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000508,
        "dEQP-GLES2.functional.shaders.preprocess",
        "or.expressions.parenthesis_value_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000509,
        "dEQP-GLES2.functional.shaders.preprocess",
        "or.expressions.parenthesis_tricky_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000510,
        "dEQP-GLES2.functional.shaders.preprocesso",
        "r.expressions.parenthesis_tricky_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000511,
        "dEQP-GLES2.functional.shaders.preproces",
        "sor.expressions.parenthesis_if_no_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000512,
        "dEQP-GLES2.functional.shaders.preprocess",
        "or.expressions.parenthesis_if_no_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000513,
        "dEQP-GLES2.functional.shaders.preproce",
        "ssor.expressions.parenthesis_if_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000514,
        "dEQP-GLES2.functional.shaders.preproces",
        "sor.expressions.parenthesis_if_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000515,
        "dEQP-GLES2.functional.shaders.preprocesso",
        "r.expressions.parenthesis_multi_if_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000516,
        "dEQP-GLES2.functional.shaders.preprocessor",
        ".expressions.parenthesis_multi_if_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000517,
        "dEQP-GLES2.functional.shaders.preprocesso",
        "r.expressions.parenthesis_single_if_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000518,
        "dEQP-GLES2.functional.shaders.preprocessor",
        ".expressions.parenthesis_single_if_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000519,
        "dEQP-GLES2.functional.shaders.preprocessor",
        ".expressions.parenthesis_ifelse_true_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000520,
        "dEQP-GLES2.functional.shaders.preprocessor.",
        "expressions.parenthesis_ifelse_true_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000521,
        "dEQP-GLES2.functional.shaders.preprocessor.",
        "expressions.parenthesis_ifelse_false_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000522,
        "dEQP-GLES2.functional.shaders.preprocessor.e",
        "xpressions.parenthesis_ifelse_false_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000523,
        "dEQP-GLES2.functional.shaders.preproc",
        "essor.expressions.eval_basic_0_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000524,
        "dEQP-GLES2.functional.shaders.preproce",
        "ssor.expressions.eval_basic_0_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000525,
        "dEQP-GLES2.functional.shaders.preproc",
        "essor.expressions.eval_basic_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000526,
        "dEQP-GLES2.functional.shaders.preproce",
        "ssor.expressions.eval_basic_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000527,
        "dEQP-GLES2.functional.shaders.preprocessor.",
        "expressions.eval_simple_precedence_0_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000528,
        "dEQP-GLES2.functional.shaders.preprocessor.e",
        "xpressions.eval_simple_precedence_0_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000529,
        "dEQP-GLES2.functional.shaders.preprocessor.",
        "expressions.eval_simple_precedence_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000530,
        "dEQP-GLES2.functional.shaders.preprocessor.e",
        "xpressions.eval_simple_precedence_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000531,
        "dEQP-GLES2.functional.shaders.prepr",
        "ocessor.expressions.defined_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000532,
        "dEQP-GLES2.functional.shaders.prepro",
        "cessor.expressions.defined_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000533,
        "dEQP-GLES2.functional.shaders.prepr",
        "ocessor.expressions.defined_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000534,
        "dEQP-GLES2.functional.shaders.prepro",
        "cessor.expressions.defined_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000535,
        "dEQP-GLES2.functional.shaders.prepr",
        "ocessor.expressions.defined_3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000536,
        "dEQP-GLES2.functional.shaders.prepro",
        "cessor.expressions.defined_3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000537,
        "dEQP-GLES2.functional.shaders.prepr",
        "ocessor.expressions.defined_4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000538,
        "dEQP-GLES2.functional.shaders.prepro",
        "cessor.expressions.defined_4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000539,
        "dEQP-GLES2.functional.shaders.prepr",
        "ocessor.expressions.defined_5_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000540,
        "dEQP-GLES2.functional.shaders.prepro",
        "cessor.expressions.defined_5_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000541,
        "dEQP-GLES2.functional.shaders.prepr",
        "ocessor.expressions.defined_6_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000542,
        "dEQP-GLES2.functional.shaders.prepro",
        "cessor.expressions.defined_6_fragment");
