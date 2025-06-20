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
#include "../Gl43masterBaseFunc.h"
#include "../ActsGl43master0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002483,
    "KHR-GL43.shaders.preprocessor.expressions.shift_left_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002484,
    "KHR-GL43.shaders.preprocessor.expressions.shift_left_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002485,
    "KHR-GL43.shaders.preprocessor.expressions.shift_right_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002486,
    "KHR-GL43.shaders.preprocessor.expressions.shift_right_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002487,
    "KHR-GL43.shaders.preprocessor.expressions.cmp_less_than_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002488,
    "KHR-GL43.shaders.preprocessor.expressions.cmp_less_than_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002489,
    "KHR-GL43.shaders.preprocessor.expressions.less_or_equal_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002490,
    "KHR-GL43.shaders.preprocessor.expressions.less_or_equal_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002491,
    "KHR-GL43.shaders.preprocessor.expressions.or_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002492,
    "KHR-GL43.shaders.preprocessor.expressions.or_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002493,
    "KHR-GL43.shaders.preprocessor.expressions.and_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002494,
    "KHR-GL43.shaders.preprocessor.expressions.and_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002495,
    "KHR-GL43.shaders.preprocessor.expressions.xor_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002496,
    "KHR-GL43.shaders.preprocessor.expressions.xor_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002497,
    "KHR-GL43.shaders.preprocessor.expressions.mod_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002498,
    "KHR-GL43.shaders.preprocessor.expressions.mod_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002499,
    "KHR-GL43.shaders.preprocessor.expressions.parenthesis_value_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002500,
    "KHR-GL43.shaders.preprocessor.expressions.parenthesis_value_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002501,
    "KHR-GL43.shaders.preprocessor.expressions.parenthesis_tricky_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002502,
    "KHR-GL43.shaders.preprocessor.expressions.parenthesis_tricky_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002503,
    "KHR-GL43.shaders.preprocessor.expressions.parenthesis_if_no_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002504,
    "KHR-GL43.shaders.preprocessor.expressions.parenthesis_if_no_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002505,
    "KHR-GL43.shaders.preprocessor.expressions.parenthesis_if_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002506,
    "KHR-GL43.shaders.preprocessor.expressions.parenthesis_if_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002507,
    "KHR-GL43.shaders.preprocessor.expressions.parenthesis_multi_if_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002508,
    "KHR-GL43.shaders.preprocessor.expressions.parenthesis_multi_if_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002509,
    "KHR-GL43.shaders.preprocessor.expressions.parenthesis_single_if_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002510,
    "KHR-GL43.shaders.preprocessor.expressions.parenthesis_single_if_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002511,
    "KHR-GL43.shaders.preprocessor.expressions.parenthesis_ifelse_true_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002512,
    "KHR-GL43.shaders.preprocessor.expressions.parenthesis_ifelse_true_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002513,
    "KHR-GL43.shaders.preprocessor.expressions.parenthesis_ifelse_false_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002514,
    "KHR-GL43.shaders.preprocessor.expressions.parenthesis_ifelse_false_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002515,
    "KHR-GL43.shaders.preprocessor.expressions.eval_basic_0_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002516,
    "KHR-GL43.shaders.preprocessor.expressions.eval_basic_0_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002517,
    "KHR-GL43.shaders.preprocessor.expressions.eval_basic_1_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002518,
    "KHR-GL43.shaders.preprocessor.expressions.eval_basic_1_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002519,
    "KHR-GL43.shaders.preprocessor.expressions.eval_simple_precedence_0_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002520,
    "KHR-GL43.shaders.preprocessor.expressions.eval_simple_precedence_0_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002521,
    "KHR-GL43.shaders.preprocessor.expressions.eval_simple_precedence_1_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002522,
    "KHR-GL43.shaders.preprocessor.expressions.eval_simple_precedence_1_fragment");
