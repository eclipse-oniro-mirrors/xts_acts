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

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001174,
        "dEQP-GLES3.functional.shaders.prepro",
        "cessor.expressions.shift_left_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001175,
        "dEQP-GLES3.functional.shaders.preproc",
        "essor.expressions.shift_left_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001176,
        "dEQP-GLES3.functional.shaders.prepro",
        "cessor.expressions.shift_right_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001177,
        "dEQP-GLES3.functional.shaders.preproc",
        "essor.expressions.shift_right_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001178,
        "dEQP-GLES3.functional.shaders.preproc",
        "essor.expressions.cmp_less_than_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001179,
        "dEQP-GLES3.functional.shaders.preproce",
        "ssor.expressions.cmp_less_than_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001180,
        "dEQP-GLES3.functional.shaders.preproc",
        "essor.expressions.less_or_equal_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001181,
        "dEQP-GLES3.functional.shaders.preproce",
        "ssor.expressions.less_or_equal_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001182,
        "dEQP-GLES3.functional.shaders.pr",
        "eprocessor.expressions.or_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001183,
        "dEQP-GLES3.functional.shaders.pre",
        "processor.expressions.or_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001184,
        "dEQP-GLES3.functional.shaders.pr",
        "eprocessor.expressions.and_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001185,
        "dEQP-GLES3.functional.shaders.pre",
        "processor.expressions.and_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001186,
        "dEQP-GLES3.functional.shaders.pr",
        "eprocessor.expressions.xor_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001187,
        "dEQP-GLES3.functional.shaders.pre",
        "processor.expressions.xor_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001188,
        "dEQP-GLES3.functional.shaders.pr",
        "eprocessor.expressions.mod_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001189,
        "dEQP-GLES3.functional.shaders.pre",
        "processor.expressions.mod_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001190,
        "dEQP-GLES3.functional.shaders.preproces",
        "sor.expressions.parenthesis_value_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001191,
        "dEQP-GLES3.functional.shaders.preprocess",
        "or.expressions.parenthesis_value_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001192,
        "dEQP-GLES3.functional.shaders.preprocess",
        "or.expressions.parenthesis_tricky_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001193,
        "dEQP-GLES3.functional.shaders.preprocesso",
        "r.expressions.parenthesis_tricky_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001194,
        "dEQP-GLES3.functional.shaders.preproces",
        "sor.expressions.parenthesis_if_no_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001195,
        "dEQP-GLES3.functional.shaders.preprocess",
        "or.expressions.parenthesis_if_no_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001196,
        "dEQP-GLES3.functional.shaders.preproce",
        "ssor.expressions.parenthesis_if_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001197,
        "dEQP-GLES3.functional.shaders.preproces",
        "sor.expressions.parenthesis_if_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001198,
        "dEQP-GLES3.functional.shaders.preprocesso",
        "r.expressions.parenthesis_multi_if_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001199,
        "dEQP-GLES3.functional.shaders.preprocessor",
        ".expressions.parenthesis_multi_if_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001200,
        "dEQP-GLES3.functional.shaders.preprocesso",
        "r.expressions.parenthesis_single_if_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001201,
        "dEQP-GLES3.functional.shaders.preprocessor",
        ".expressions.parenthesis_single_if_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001202,
        "dEQP-GLES3.functional.shaders.preprocessor",
        ".expressions.parenthesis_ifelse_true_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001203,
        "dEQP-GLES3.functional.shaders.preprocessor.",
        "expressions.parenthesis_ifelse_true_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001204,
        "dEQP-GLES3.functional.shaders.preprocessor.",
        "expressions.parenthesis_ifelse_false_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001205,
        "dEQP-GLES3.functional.shaders.preprocessor.e",
        "xpressions.parenthesis_ifelse_false_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001206,
        "dEQP-GLES3.functional.shaders.preproc",
        "essor.expressions.eval_basic_0_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001207,
        "dEQP-GLES3.functional.shaders.preproce",
        "ssor.expressions.eval_basic_0_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001208,
        "dEQP-GLES3.functional.shaders.preproc",
        "essor.expressions.eval_basic_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001209,
        "dEQP-GLES3.functional.shaders.preproce",
        "ssor.expressions.eval_basic_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001210,
        "dEQP-GLES3.functional.shaders.preprocessor.",
        "expressions.eval_simple_precedence_0_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001211,
        "dEQP-GLES3.functional.shaders.preprocessor.e",
        "xpressions.eval_simple_precedence_0_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001212,
        "dEQP-GLES3.functional.shaders.preprocessor.",
        "expressions.eval_simple_precedence_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001213,
        "dEQP-GLES3.functional.shaders.preprocessor.e",
        "xpressions.eval_simple_precedence_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001214,
        "dEQP-GLES3.functional.shaders.prepr",
        "ocessor.expressions.defined_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001215,
        "dEQP-GLES3.functional.shaders.prepro",
        "cessor.expressions.defined_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001216,
        "dEQP-GLES3.functional.shaders.prepr",
        "ocessor.expressions.defined_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001217,
        "dEQP-GLES3.functional.shaders.prepro",
        "cessor.expressions.defined_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001218,
        "dEQP-GLES3.functional.shaders.prepr",
        "ocessor.expressions.defined_3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001219,
        "dEQP-GLES3.functional.shaders.prepro",
        "cessor.expressions.defined_3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001220,
        "dEQP-GLES3.functional.shaders.prepr",
        "ocessor.expressions.defined_4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001221,
        "dEQP-GLES3.functional.shaders.prepro",
        "cessor.expressions.defined_4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001222,
        "dEQP-GLES3.functional.shaders.prepr",
        "ocessor.expressions.defined_5_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001223,
        "dEQP-GLES3.functional.shaders.prepro",
        "cessor.expressions.defined_5_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001224,
        "dEQP-GLES3.functional.shaders.prepr",
        "ocessor.expressions.defined_6_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001225,
        "dEQP-GLES3.functional.shaders.prepro",
        "cessor.expressions.defined_6_fragment");
