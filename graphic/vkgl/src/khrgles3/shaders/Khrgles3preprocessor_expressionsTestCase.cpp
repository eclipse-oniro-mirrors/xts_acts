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

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001242,
        "KHR-GLES3.shaders.preprocessor",
        ".expressions.shift_left_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001243,
        "KHR-GLES3.shaders.preprocessor.",
        "expressions.shift_left_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001244,
        "KHR-GLES3.shaders.preprocessor",
        ".expressions.shift_right_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001245,
        "KHR-GLES3.shaders.preprocessor.",
        "expressions.shift_right_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001246,
        "KHR-GLES3.shaders.preprocessor.",
        "expressions.cmp_less_than_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001247,
        "KHR-GLES3.shaders.preprocessor.e",
        "xpressions.cmp_less_than_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001248,
        "KHR-GLES3.shaders.preprocessor.",
        "expressions.less_or_equal_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001249,
        "KHR-GLES3.shaders.preprocessor.e",
        "xpressions.less_or_equal_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001250,
        "KHR-GLES3.shaders.preproce",
        "ssor.expressions.or_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001251,
        "KHR-GLES3.shaders.preproces",
        "sor.expressions.or_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001252,
        "KHR-GLES3.shaders.preproce",
        "ssor.expressions.and_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001253,
        "KHR-GLES3.shaders.preproces",
        "sor.expressions.and_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001254,
        "KHR-GLES3.shaders.preproce",
        "ssor.expressions.xor_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001255,
        "KHR-GLES3.shaders.preproces",
        "sor.expressions.xor_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001256,
        "KHR-GLES3.shaders.preproce",
        "ssor.expressions.mod_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001257,
        "KHR-GLES3.shaders.preproces",
        "sor.expressions.mod_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001258,
        "KHR-GLES3.shaders.preprocessor.ex",
        "pressions.parenthesis_value_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001259,
        "KHR-GLES3.shaders.preprocessor.exp",
        "ressions.parenthesis_value_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001260,
        "KHR-GLES3.shaders.preprocessor.exp",
        "ressions.parenthesis_tricky_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001261,
        "KHR-GLES3.shaders.preprocessor.expr",
        "essions.parenthesis_tricky_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001262,
        "KHR-GLES3.shaders.preprocessor.ex",
        "pressions.parenthesis_if_no_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001263,
        "KHR-GLES3.shaders.preprocessor.exp",
        "ressions.parenthesis_if_no_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001264,
        "KHR-GLES3.shaders.preprocessor.e",
        "xpressions.parenthesis_if_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001265,
        "KHR-GLES3.shaders.preprocessor.ex",
        "pressions.parenthesis_if_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001266,
        "KHR-GLES3.shaders.preprocessor.expr",
        "essions.parenthesis_multi_if_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001267,
        "KHR-GLES3.shaders.preprocessor.expre",
        "ssions.parenthesis_multi_if_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001268,
        "KHR-GLES3.shaders.preprocessor.expr",
        "essions.parenthesis_single_if_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001269,
        "KHR-GLES3.shaders.preprocessor.expre",
        "ssions.parenthesis_single_if_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001270,
        "KHR-GLES3.shaders.preprocessor.expre",
        "ssions.parenthesis_ifelse_true_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001271,
        "KHR-GLES3.shaders.preprocessor.expres",
        "sions.parenthesis_ifelse_true_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001272,
        "KHR-GLES3.shaders.preprocessor.expres",
        "sions.parenthesis_ifelse_false_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001273,
        "KHR-GLES3.shaders.preprocessor.express",
        "ions.parenthesis_ifelse_false_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001274,
        "KHR-GLES3.shaders.preprocessor.",
        "expressions.eval_basic_0_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001275,
        "KHR-GLES3.shaders.preprocessor.e",
        "xpressions.eval_basic_0_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001276,
        "KHR-GLES3.shaders.preprocessor.",
        "expressions.eval_basic_1_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001277,
        "KHR-GLES3.shaders.preprocessor.e",
        "xpressions.eval_basic_1_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001278,
        "KHR-GLES3.shaders.preprocessor.expres",
        "sions.eval_simple_precedence_0_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001279,
        "KHR-GLES3.shaders.preprocessor.express",
        "ions.eval_simple_precedence_0_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001280,
        "KHR-GLES3.shaders.preprocessor.expres",
        "sions.eval_simple_precedence_1_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001281,
        "KHR-GLES3.shaders.preprocessor.express",
        "ions.eval_simple_precedence_1_fragment");
