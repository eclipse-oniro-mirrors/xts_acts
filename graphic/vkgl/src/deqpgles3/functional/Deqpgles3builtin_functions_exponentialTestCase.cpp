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
#include "../ActsDeqpgles30020TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019718,
        "dEQP-GLES3.functional.shaders.constant_expressio",
        "ns.builtin_functions.exponential.pow_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019719,
        "dEQP-GLES3.functional.shaders.constant_expression",
        "s.builtin_functions.exponential.pow_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019720,
        "dEQP-GLES3.functional.shaders.constant_expressio",
        "ns.builtin_functions.exponential.pow_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019721,
        "dEQP-GLES3.functional.shaders.constant_expression",
        "s.builtin_functions.exponential.pow_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019722,
        "dEQP-GLES3.functional.shaders.constant_expressio",
        "ns.builtin_functions.exponential.pow_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019723,
        "dEQP-GLES3.functional.shaders.constant_expression",
        "s.builtin_functions.exponential.pow_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019724,
        "dEQP-GLES3.functional.shaders.constant_expressio",
        "ns.builtin_functions.exponential.pow_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019725,
        "dEQP-GLES3.functional.shaders.constant_expression",
        "s.builtin_functions.exponential.pow_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019726,
        "dEQP-GLES3.functional.shaders.constant_expressio",
        "ns.builtin_functions.exponential.exp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019727,
        "dEQP-GLES3.functional.shaders.constant_expression",
        "s.builtin_functions.exponential.exp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019728,
        "dEQP-GLES3.functional.shaders.constant_expressio",
        "ns.builtin_functions.exponential.exp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019729,
        "dEQP-GLES3.functional.shaders.constant_expression",
        "s.builtin_functions.exponential.exp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019730,
        "dEQP-GLES3.functional.shaders.constant_expressio",
        "ns.builtin_functions.exponential.exp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019731,
        "dEQP-GLES3.functional.shaders.constant_expression",
        "s.builtin_functions.exponential.exp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019732,
        "dEQP-GLES3.functional.shaders.constant_expressio",
        "ns.builtin_functions.exponential.exp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019733,
        "dEQP-GLES3.functional.shaders.constant_expression",
        "s.builtin_functions.exponential.exp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019734,
        "dEQP-GLES3.functional.shaders.constant_expressio",
        "ns.builtin_functions.exponential.log_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019735,
        "dEQP-GLES3.functional.shaders.constant_expression",
        "s.builtin_functions.exponential.log_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019736,
        "dEQP-GLES3.functional.shaders.constant_expressio",
        "ns.builtin_functions.exponential.log_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019737,
        "dEQP-GLES3.functional.shaders.constant_expression",
        "s.builtin_functions.exponential.log_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019738,
        "dEQP-GLES3.functional.shaders.constant_expressio",
        "ns.builtin_functions.exponential.log_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019739,
        "dEQP-GLES3.functional.shaders.constant_expression",
        "s.builtin_functions.exponential.log_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019740,
        "dEQP-GLES3.functional.shaders.constant_expressio",
        "ns.builtin_functions.exponential.log_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019741,
        "dEQP-GLES3.functional.shaders.constant_expression",
        "s.builtin_functions.exponential.log_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019742,
        "dEQP-GLES3.functional.shaders.constant_expression",
        "s.builtin_functions.exponential.exp2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019743,
        "dEQP-GLES3.functional.shaders.constant_expressions",
        ".builtin_functions.exponential.exp2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019744,
        "dEQP-GLES3.functional.shaders.constant_expressio",
        "ns.builtin_functions.exponential.exp2_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019745,
        "dEQP-GLES3.functional.shaders.constant_expression",
        "s.builtin_functions.exponential.exp2_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019746,
        "dEQP-GLES3.functional.shaders.constant_expressio",
        "ns.builtin_functions.exponential.exp2_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019747,
        "dEQP-GLES3.functional.shaders.constant_expression",
        "s.builtin_functions.exponential.exp2_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019748,
        "dEQP-GLES3.functional.shaders.constant_expressio",
        "ns.builtin_functions.exponential.exp2_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019749,
        "dEQP-GLES3.functional.shaders.constant_expression",
        "s.builtin_functions.exponential.exp2_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019750,
        "dEQP-GLES3.functional.shaders.constant_expression",
        "s.builtin_functions.exponential.log2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019751,
        "dEQP-GLES3.functional.shaders.constant_expressions",
        ".builtin_functions.exponential.log2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019752,
        "dEQP-GLES3.functional.shaders.constant_expressio",
        "ns.builtin_functions.exponential.log2_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019753,
        "dEQP-GLES3.functional.shaders.constant_expression",
        "s.builtin_functions.exponential.log2_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019754,
        "dEQP-GLES3.functional.shaders.constant_expressio",
        "ns.builtin_functions.exponential.log2_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019755,
        "dEQP-GLES3.functional.shaders.constant_expression",
        "s.builtin_functions.exponential.log2_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019756,
        "dEQP-GLES3.functional.shaders.constant_expressio",
        "ns.builtin_functions.exponential.log2_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019757,
        "dEQP-GLES3.functional.shaders.constant_expression",
        "s.builtin_functions.exponential.log2_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019758,
        "dEQP-GLES3.functional.shaders.constant_expression",
        "s.builtin_functions.exponential.sqrt_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019759,
        "dEQP-GLES3.functional.shaders.constant_expressions",
        ".builtin_functions.exponential.sqrt_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019760,
        "dEQP-GLES3.functional.shaders.constant_expressio",
        "ns.builtin_functions.exponential.sqrt_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019761,
        "dEQP-GLES3.functional.shaders.constant_expression",
        "s.builtin_functions.exponential.sqrt_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019762,
        "dEQP-GLES3.functional.shaders.constant_expressio",
        "ns.builtin_functions.exponential.sqrt_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019763,
        "dEQP-GLES3.functional.shaders.constant_expression",
        "s.builtin_functions.exponential.sqrt_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019764,
        "dEQP-GLES3.functional.shaders.constant_expressio",
        "ns.builtin_functions.exponential.sqrt_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019765,
        "dEQP-GLES3.functional.shaders.constant_expression",
        "s.builtin_functions.exponential.sqrt_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019766,
        "dEQP-GLES3.functional.shaders.constant_expressions.b",
        "uiltin_functions.exponential.inversesqrt_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019767,
        "dEQP-GLES3.functional.shaders.constant_expressions.bu",
        "iltin_functions.exponential.inversesqrt_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019768,
        "dEQP-GLES3.functional.shaders.constant_expressions.b",
        "uiltin_functions.exponential.inversesqrt_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019769,
        "dEQP-GLES3.functional.shaders.constant_expressions.bu",
        "iltin_functions.exponential.inversesqrt_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019770,
        "dEQP-GLES3.functional.shaders.constant_expressions.b",
        "uiltin_functions.exponential.inversesqrt_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019771,
        "dEQP-GLES3.functional.shaders.constant_expressions.bu",
        "iltin_functions.exponential.inversesqrt_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019772,
        "dEQP-GLES3.functional.shaders.constant_expressions.b",
        "uiltin_functions.exponential.inversesqrt_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019773,
        "dEQP-GLES3.functional.shaders.constant_expressions.bu",
        "iltin_functions.exponential.inversesqrt_vec4_fragment");
