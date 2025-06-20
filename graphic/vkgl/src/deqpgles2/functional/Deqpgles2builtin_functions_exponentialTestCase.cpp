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
#include "../ActsDeqpgles20008TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007974,
        "dEQP-GLES2.functional.shaders.constant_expressio",
        "ns.builtin_functions.exponential.pow_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007975,
        "dEQP-GLES2.functional.shaders.constant_expression",
        "s.builtin_functions.exponential.pow_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007976,
        "dEQP-GLES2.functional.shaders.constant_expressio",
        "ns.builtin_functions.exponential.pow_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007977,
        "dEQP-GLES2.functional.shaders.constant_expression",
        "s.builtin_functions.exponential.pow_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007978,
        "dEQP-GLES2.functional.shaders.constant_expressio",
        "ns.builtin_functions.exponential.pow_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007979,
        "dEQP-GLES2.functional.shaders.constant_expression",
        "s.builtin_functions.exponential.pow_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007980,
        "dEQP-GLES2.functional.shaders.constant_expressio",
        "ns.builtin_functions.exponential.pow_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007981,
        "dEQP-GLES2.functional.shaders.constant_expression",
        "s.builtin_functions.exponential.pow_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007982,
        "dEQP-GLES2.functional.shaders.constant_expressio",
        "ns.builtin_functions.exponential.exp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007983,
        "dEQP-GLES2.functional.shaders.constant_expression",
        "s.builtin_functions.exponential.exp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007984,
        "dEQP-GLES2.functional.shaders.constant_expressio",
        "ns.builtin_functions.exponential.exp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007985,
        "dEQP-GLES2.functional.shaders.constant_expression",
        "s.builtin_functions.exponential.exp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007986,
        "dEQP-GLES2.functional.shaders.constant_expressio",
        "ns.builtin_functions.exponential.exp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007987,
        "dEQP-GLES2.functional.shaders.constant_expression",
        "s.builtin_functions.exponential.exp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007988,
        "dEQP-GLES2.functional.shaders.constant_expressio",
        "ns.builtin_functions.exponential.exp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007989,
        "dEQP-GLES2.functional.shaders.constant_expression",
        "s.builtin_functions.exponential.exp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007990,
        "dEQP-GLES2.functional.shaders.constant_expressio",
        "ns.builtin_functions.exponential.log_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007991,
        "dEQP-GLES2.functional.shaders.constant_expression",
        "s.builtin_functions.exponential.log_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007992,
        "dEQP-GLES2.functional.shaders.constant_expressio",
        "ns.builtin_functions.exponential.log_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007993,
        "dEQP-GLES2.functional.shaders.constant_expression",
        "s.builtin_functions.exponential.log_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007994,
        "dEQP-GLES2.functional.shaders.constant_expressio",
        "ns.builtin_functions.exponential.log_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007995,
        "dEQP-GLES2.functional.shaders.constant_expression",
        "s.builtin_functions.exponential.log_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007996,
        "dEQP-GLES2.functional.shaders.constant_expressio",
        "ns.builtin_functions.exponential.log_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007997,
        "dEQP-GLES2.functional.shaders.constant_expression",
        "s.builtin_functions.exponential.log_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007998,
        "dEQP-GLES2.functional.shaders.constant_expression",
        "s.builtin_functions.exponential.exp2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007999,
        "dEQP-GLES2.functional.shaders.constant_expressions",
        ".builtin_functions.exponential.exp2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_008000,
        "dEQP-GLES2.functional.shaders.constant_expressio",
        "ns.builtin_functions.exponential.exp2_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_008001,
        "dEQP-GLES2.functional.shaders.constant_expression",
        "s.builtin_functions.exponential.exp2_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_008002,
        "dEQP-GLES2.functional.shaders.constant_expressio",
        "ns.builtin_functions.exponential.exp2_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_008003,
        "dEQP-GLES2.functional.shaders.constant_expression",
        "s.builtin_functions.exponential.exp2_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_008004,
        "dEQP-GLES2.functional.shaders.constant_expressio",
        "ns.builtin_functions.exponential.exp2_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_008005,
        "dEQP-GLES2.functional.shaders.constant_expression",
        "s.builtin_functions.exponential.exp2_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_008006,
        "dEQP-GLES2.functional.shaders.constant_expression",
        "s.builtin_functions.exponential.log2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_008007,
        "dEQP-GLES2.functional.shaders.constant_expressions",
        ".builtin_functions.exponential.log2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_008008,
        "dEQP-GLES2.functional.shaders.constant_expressio",
        "ns.builtin_functions.exponential.log2_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_008009,
        "dEQP-GLES2.functional.shaders.constant_expression",
        "s.builtin_functions.exponential.log2_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_008010,
        "dEQP-GLES2.functional.shaders.constant_expressio",
        "ns.builtin_functions.exponential.log2_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_008011,
        "dEQP-GLES2.functional.shaders.constant_expression",
        "s.builtin_functions.exponential.log2_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_008012,
        "dEQP-GLES2.functional.shaders.constant_expressio",
        "ns.builtin_functions.exponential.log2_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_008013,
        "dEQP-GLES2.functional.shaders.constant_expression",
        "s.builtin_functions.exponential.log2_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_008014,
        "dEQP-GLES2.functional.shaders.constant_expression",
        "s.builtin_functions.exponential.sqrt_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_008015,
        "dEQP-GLES2.functional.shaders.constant_expressions",
        ".builtin_functions.exponential.sqrt_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_008016,
        "dEQP-GLES2.functional.shaders.constant_expressio",
        "ns.builtin_functions.exponential.sqrt_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_008017,
        "dEQP-GLES2.functional.shaders.constant_expression",
        "s.builtin_functions.exponential.sqrt_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_008018,
        "dEQP-GLES2.functional.shaders.constant_expressio",
        "ns.builtin_functions.exponential.sqrt_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_008019,
        "dEQP-GLES2.functional.shaders.constant_expression",
        "s.builtin_functions.exponential.sqrt_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_008020,
        "dEQP-GLES2.functional.shaders.constant_expressio",
        "ns.builtin_functions.exponential.sqrt_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_008021,
        "dEQP-GLES2.functional.shaders.constant_expression",
        "s.builtin_functions.exponential.sqrt_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_008022,
        "dEQP-GLES2.functional.shaders.constant_expressions.b",
        "uiltin_functions.exponential.inversesqrt_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_008023,
        "dEQP-GLES2.functional.shaders.constant_expressions.bu",
        "iltin_functions.exponential.inversesqrt_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_008024,
        "dEQP-GLES2.functional.shaders.constant_expressions.b",
        "uiltin_functions.exponential.inversesqrt_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_008025,
        "dEQP-GLES2.functional.shaders.constant_expressions.bu",
        "iltin_functions.exponential.inversesqrt_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_008026,
        "dEQP-GLES2.functional.shaders.constant_expressions.b",
        "uiltin_functions.exponential.inversesqrt_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_008027,
        "dEQP-GLES2.functional.shaders.constant_expressions.bu",
        "iltin_functions.exponential.inversesqrt_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_008028,
        "dEQP-GLES2.functional.shaders.constant_expressions.b",
        "uiltin_functions.exponential.inversesqrt_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_008029,
        "dEQP-GLES2.functional.shaders.constant_expressions.bu",
        "iltin_functions.exponential.inversesqrt_vec4_fragment");
