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

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002539,
    "KHR-GL43.shaders.preprocessor.operator_precedence.modulo_vs_not_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002540,
    "KHR-GL43.shaders.preprocessor.operator_precedence.modulo_vs_not_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002541,
    "KHR-GL43.shaders.preprocessor.operator_precedence.div_vs_not_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002542,
    "KHR-GL43.shaders.preprocessor.operator_precedence.div_vs_not_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002543,
    "KHR-GL43.shaders.preprocessor.operator_precedence.mul_vs_not_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002544,
    "KHR-GL43.shaders.preprocessor.operator_precedence.mul_vs_not_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002545,
    "KHR-GL43.shaders.preprocessor.operator_precedence.modulo_vs_bit_invert_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002546,
    "KHR-GL43.shaders.preprocessor.operator_precedence.modulo_vs_bit_invert_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002547,
    "KHR-GL43.shaders.preprocessor.operator_precedence.modulo_vs_minus_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002548,
    "KHR-GL43.shaders.preprocessor.operator_precedence.modulo_vs_minus_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002549,
    "KHR-GL43.shaders.preprocessor.operator_precedence.modulo_vs_plus_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002550,
    "KHR-GL43.shaders.preprocessor.operator_precedence.modulo_vs_plus_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002551,
    "KHR-GL43.shaders.preprocessor.operator_precedence.div_vs_bit_invert_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002552,
    "KHR-GL43.shaders.preprocessor.operator_precedence.div_vs_bit_invert_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002553,
    "KHR-GL43.shaders.preprocessor.operator_precedence.div_vs_minus_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002554,
    "KHR-GL43.shaders.preprocessor.operator_precedence.div_vs_minus_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002555,
    "KHR-GL43.shaders.preprocessor.operator_precedence.div_vs_plus_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002556,
    "KHR-GL43.shaders.preprocessor.operator_precedence.div_vs_plus_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002557,
    "KHR-GL43.shaders.preprocessor.operator_precedence.mul_vs_bit_invert_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002558,
    "KHR-GL43.shaders.preprocessor.operator_precedence.mul_vs_bit_invert_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002559,
    "KHR-GL43.shaders.preprocessor.operator_precedence.mul_vs_minus_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002560,
    "KHR-GL43.shaders.preprocessor.operator_precedence.mul_vs_minus_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002561,
    "KHR-GL43.shaders.preprocessor.operator_precedence.mul_vs_plus_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002562,
    "KHR-GL43.shaders.preprocessor.operator_precedence.mul_vs_plus_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002563,
    "KHR-GL43.shaders.preprocessor.operator_precedence.sub_vs_modulo_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002564,
    "KHR-GL43.shaders.preprocessor.operator_precedence.sub_vs_modulo_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002565,
    "KHR-GL43.shaders.preprocessor.operator_precedence.sub_vs_div_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002566,
    "KHR-GL43.shaders.preprocessor.operator_precedence.sub_vs_div_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002567,
    "KHR-GL43.shaders.preprocessor.operator_precedence.sub_vs_mul_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002568,
    "KHR-GL43.shaders.preprocessor.operator_precedence.sub_vs_mul_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002569,
    "KHR-GL43.shaders.preprocessor.operator_precedence.add_vs_modulo_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002570,
    "KHR-GL43.shaders.preprocessor.operator_precedence.add_vs_modulo_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002571,
    "KHR-GL43.shaders.preprocessor.operator_precedence.add_vs_div_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002572,
    "KHR-GL43.shaders.preprocessor.operator_precedence.add_vs_div_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002573,
    "KHR-GL43.shaders.preprocessor.operator_precedence.add_vs_mul_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002574,
    "KHR-GL43.shaders.preprocessor.operator_precedence.add_vs_mul_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002575,
    "KHR-GL43.shaders.preprocessor.operator_precedence.rshift_vs_sub_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002576,
    "KHR-GL43.shaders.preprocessor.operator_precedence.rshift_vs_sub_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002577,
    "KHR-GL43.shaders.preprocessor.operator_precedence.rshift_vs_add_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002578,
    "KHR-GL43.shaders.preprocessor.operator_precedence.rshift_vs_add_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002579,
    "KHR-GL43.shaders.preprocessor.operator_precedence.lshift_vs_sub_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002580,
    "KHR-GL43.shaders.preprocessor.operator_precedence.lshift_vs_sub_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002581,
    "KHR-GL43.shaders.preprocessor.operator_precedence.lshift_vs_add_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002582,
    "KHR-GL43.shaders.preprocessor.operator_precedence.lshift_vs_add_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002583,
    "KHR-GL43.shaders.preprocessor.operator_precedence.greater_or_equal_vs_rshift_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002584,
    "KHR-GL43.shaders.preprocessor.operator_precedence.greater_or_equal_vs_rshift_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002585,
    "KHR-GL43.shaders.preprocessor.operator_precedence.greater_or_equal_vs_lshift_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002586,
    "KHR-GL43.shaders.preprocessor.operator_precedence.greater_or_equal_vs_lshift_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002587,
    "KHR-GL43.shaders.preprocessor.operator_precedence.less_or_equal_vs_rshift_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002588,
    "KHR-GL43.shaders.preprocessor.operator_precedence.less_or_equal_vs_rshift_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002589,
    "KHR-GL43.shaders.preprocessor.operator_precedence.less_or_equal_vs_lshift_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002590,
    "KHR-GL43.shaders.preprocessor.operator_precedence.less_or_equal_vs_lshift_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002591,
    "KHR-GL43.shaders.preprocessor.operator_precedence.greater_vs_rshift_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002592,
    "KHR-GL43.shaders.preprocessor.operator_precedence.greater_vs_rshift_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002593,
    "KHR-GL43.shaders.preprocessor.operator_precedence.greater_vs_lshift_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002594,
    "KHR-GL43.shaders.preprocessor.operator_precedence.greater_vs_lshift_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002595,
    "KHR-GL43.shaders.preprocessor.operator_precedence.less_vs_rshift_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002596,
    "KHR-GL43.shaders.preprocessor.operator_precedence.less_vs_rshift_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002597,
    "KHR-GL43.shaders.preprocessor.operator_precedence.less_vs_lshift_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002598,
    "KHR-GL43.shaders.preprocessor.operator_precedence.less_vs_lshift_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002599,
    "KHR-GL43.shaders.preprocessor.operator_precedence.not_equal_vs_greater_or_equal_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002600,
    "KHR-GL43.shaders.preprocessor.operator_precedence.not_equal_vs_greater_or_equal_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002601,
    "KHR-GL43.shaders.preprocessor.operator_precedence.not_equal_vs_less_or_equal_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002602,
    "KHR-GL43.shaders.preprocessor.operator_precedence.not_equal_vs_less_or_equal_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002603,
    "KHR-GL43.shaders.preprocessor.operator_precedence.not_equal_vs_greater_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002604,
    "KHR-GL43.shaders.preprocessor.operator_precedence.not_equal_vs_greater_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002605,
    "KHR-GL43.shaders.preprocessor.operator_precedence.not_equal_vs_less_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002606,
    "KHR-GL43.shaders.preprocessor.operator_precedence.not_equal_vs_less_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002607,
    "KHR-GL43.shaders.preprocessor.operator_precedence.equal_vs_greater_or_equal_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002608,
    "KHR-GL43.shaders.preprocessor.operator_precedence.equal_vs_greater_or_equal_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002609,
    "KHR-GL43.shaders.preprocessor.operator_precedence.equal_vs_less_or_equal_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002610,
    "KHR-GL43.shaders.preprocessor.operator_precedence.equal_vs_less_or_equal_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002611,
    "KHR-GL43.shaders.preprocessor.operator_precedence.equal_vs_greater_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002612,
    "KHR-GL43.shaders.preprocessor.operator_precedence.equal_vs_greater_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002613,
    "KHR-GL43.shaders.preprocessor.operator_precedence.equal_vs_less_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002614,
    "KHR-GL43.shaders.preprocessor.operator_precedence.equal_vs_less_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002615,
    "KHR-GL43.shaders.preprocessor.operator_precedence.bitwise_and_vs_not_equal_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002616,
    "KHR-GL43.shaders.preprocessor.operator_precedence.bitwise_and_vs_not_equal_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002617,
    "KHR-GL43.shaders.preprocessor.operator_precedence.bitwise_and_vs_equal_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002618,
    "KHR-GL43.shaders.preprocessor.operator_precedence.bitwise_and_vs_equal_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002619,
    "KHR-GL43.shaders.preprocessor.operator_precedence.xor_vs_bitwise_and_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002620,
    "KHR-GL43.shaders.preprocessor.operator_precedence.xor_vs_bitwise_and_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002621,
    "KHR-GL43.shaders.preprocessor.operator_precedence.bitwise_or_vs_xor_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002622,
    "KHR-GL43.shaders.preprocessor.operator_precedence.bitwise_or_vs_xor_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002623,
    "KHR-GL43.shaders.preprocessor.operator_precedence.logical_and_vs_bitwise_or_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002624,
    "KHR-GL43.shaders.preprocessor.operator_precedence.logical_and_vs_bitwise_or_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002625,
    "KHR-GL43.shaders.preprocessor.operator_precedence.logical_and_vs_bitwise_and_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002626,
    "KHR-GL43.shaders.preprocessor.operator_precedence.logical_and_vs_bitwise_and_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002627,
    "KHR-GL43.shaders.preprocessor.operator_precedence.logical_or_vs_logical_and_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002628,
    "KHR-GL43.shaders.preprocessor.operator_precedence.logical_or_vs_logical_and_fragment");
