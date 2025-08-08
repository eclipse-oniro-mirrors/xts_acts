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
#include "../ActsDeqpgles20003TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002481,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.add_float_int_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002482,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_float_int_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002483,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.add_float_int_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002484,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.add_float_int_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002485,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_float_ivec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002486,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.add_float_ivec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002487,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_float_ivec2_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002488,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.add_float_ivec2_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002489,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_float_ivec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002490,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.add_float_ivec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002491,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_float_ivec3_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002492,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.add_float_ivec3_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002493,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_float_ivec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002494,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.add_float_ivec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002495,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_float_ivec4_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002496,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.add_float_ivec4_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002497,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.add_vec2_int_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002498,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.add_vec2_int_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002499,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversi",
        "ons.invalid_implicit_conversions.add_vec2_int_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002500,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.add_vec2_int_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002501,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.add_vec2_ivec2_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002502,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_vec2_ivec2_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002503,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.add_vec2_ivec2_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002504,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_vec2_ivec2_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002505,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.add_vec2_ivec3_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002506,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_vec2_ivec3_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002507,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.add_vec2_ivec3_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002508,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_vec2_ivec3_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002509,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.add_vec2_ivec4_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002510,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_vec2_ivec4_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002511,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.add_vec2_ivec4_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002512,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_vec2_ivec4_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002513,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.add_vec3_int_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002514,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.add_vec3_int_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002515,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversi",
        "ons.invalid_implicit_conversions.add_vec3_int_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002516,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.add_vec3_int_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002517,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.add_vec3_ivec2_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002518,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_vec3_ivec2_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002519,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.add_vec3_ivec2_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002520,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_vec3_ivec2_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002521,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.add_vec3_ivec3_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002522,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_vec3_ivec3_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002523,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.add_vec3_ivec3_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002524,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_vec3_ivec3_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002525,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.add_vec3_ivec4_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002526,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_vec3_ivec4_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002527,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.add_vec3_ivec4_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002528,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_vec3_ivec4_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002529,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.add_vec4_int_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002530,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.add_vec4_int_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002531,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversi",
        "ons.invalid_implicit_conversions.add_vec4_int_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002532,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.add_vec4_int_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002533,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.add_vec4_ivec2_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002534,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_vec4_ivec2_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002535,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.add_vec4_ivec2_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002536,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_vec4_ivec2_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002537,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.add_vec4_ivec3_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002538,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_vec4_ivec3_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002539,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.add_vec4_ivec3_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002540,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_vec4_ivec3_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002541,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.add_vec4_ivec4_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002542,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_vec4_ivec4_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002543,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.add_vec4_ivec4_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002544,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_vec4_ivec4_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002545,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.mul_float_int_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002546,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_float_int_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002547,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.mul_float_int_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002548,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.mul_float_int_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002549,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_float_ivec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002550,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.mul_float_ivec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002551,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_float_ivec2_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002552,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.mul_float_ivec2_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002553,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_float_ivec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002554,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.mul_float_ivec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002555,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_float_ivec3_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002556,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.mul_float_ivec3_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002557,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_float_ivec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002558,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.mul_float_ivec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002559,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_float_ivec4_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002560,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.mul_float_ivec4_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002561,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.mul_vec2_int_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002562,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.mul_vec2_int_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002563,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversi",
        "ons.invalid_implicit_conversions.mul_vec2_int_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002564,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.mul_vec2_int_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002565,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.mul_vec2_ivec2_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002566,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_vec2_ivec2_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002567,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.mul_vec2_ivec2_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002568,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_vec2_ivec2_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002569,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.mul_vec2_ivec3_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002570,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_vec2_ivec3_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002571,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.mul_vec2_ivec3_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002572,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_vec2_ivec3_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002573,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.mul_vec2_ivec4_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002574,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_vec2_ivec4_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002575,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.mul_vec2_ivec4_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002576,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_vec2_ivec4_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002577,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.mul_vec3_int_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002578,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.mul_vec3_int_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002579,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversi",
        "ons.invalid_implicit_conversions.mul_vec3_int_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002580,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.mul_vec3_int_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002581,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.mul_vec3_ivec2_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002582,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_vec3_ivec2_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002583,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.mul_vec3_ivec2_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002584,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_vec3_ivec2_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002585,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.mul_vec3_ivec3_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002586,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_vec3_ivec3_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002587,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.mul_vec3_ivec3_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002588,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_vec3_ivec3_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002589,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.mul_vec3_ivec4_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002590,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_vec3_ivec4_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002591,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.mul_vec3_ivec4_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002592,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_vec3_ivec4_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002593,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.mul_vec4_int_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002594,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.mul_vec4_int_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002595,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversi",
        "ons.invalid_implicit_conversions.mul_vec4_int_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002596,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.mul_vec4_int_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002597,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.mul_vec4_ivec2_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002598,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_vec4_ivec2_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002599,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.mul_vec4_ivec2_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002600,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_vec4_ivec2_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002601,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.mul_vec4_ivec3_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002602,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_vec4_ivec3_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002603,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.mul_vec4_ivec3_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002604,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_vec4_ivec3_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002605,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.mul_vec4_ivec4_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002606,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_vec4_ivec4_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002607,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.mul_vec4_ivec4_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002608,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_vec4_ivec4_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002609,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.sub_float_int_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002610,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_float_int_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002611,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.sub_float_int_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002612,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.sub_float_int_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002613,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_float_ivec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002614,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.sub_float_ivec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002615,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_float_ivec2_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002616,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.sub_float_ivec2_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002617,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_float_ivec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002618,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.sub_float_ivec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002619,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_float_ivec3_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002620,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.sub_float_ivec3_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002621,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_float_ivec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002622,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.sub_float_ivec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002623,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_float_ivec4_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002624,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.sub_float_ivec4_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002625,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.sub_vec2_int_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002626,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.sub_vec2_int_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002627,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversi",
        "ons.invalid_implicit_conversions.sub_vec2_int_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002628,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.sub_vec2_int_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002629,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.sub_vec2_ivec2_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002630,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_vec2_ivec2_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002631,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.sub_vec2_ivec2_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002632,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_vec2_ivec2_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002633,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.sub_vec2_ivec3_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002634,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_vec2_ivec3_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002635,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.sub_vec2_ivec3_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002636,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_vec2_ivec3_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002637,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.sub_vec2_ivec4_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002638,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_vec2_ivec4_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002639,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.sub_vec2_ivec4_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002640,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_vec2_ivec4_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002641,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.sub_vec3_int_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002642,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.sub_vec3_int_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002643,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversi",
        "ons.invalid_implicit_conversions.sub_vec3_int_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002644,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.sub_vec3_int_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002645,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.sub_vec3_ivec2_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002646,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_vec3_ivec2_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002647,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.sub_vec3_ivec2_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002648,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_vec3_ivec2_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002649,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.sub_vec3_ivec3_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002650,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_vec3_ivec3_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002651,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.sub_vec3_ivec3_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002652,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_vec3_ivec3_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002653,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.sub_vec3_ivec4_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002654,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_vec3_ivec4_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002655,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.sub_vec3_ivec4_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002656,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_vec3_ivec4_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002657,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.sub_vec4_int_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002658,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.sub_vec4_int_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002659,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversi",
        "ons.invalid_implicit_conversions.sub_vec4_int_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002660,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.sub_vec4_int_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002661,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.sub_vec4_ivec2_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002662,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_vec4_ivec2_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002663,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.sub_vec4_ivec2_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002664,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_vec4_ivec2_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002665,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.sub_vec4_ivec3_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002666,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_vec4_ivec3_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002667,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.sub_vec4_ivec3_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002668,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_vec4_ivec3_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002669,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.sub_vec4_ivec4_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002670,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_vec4_ivec4_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002671,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.sub_vec4_ivec4_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002672,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_vec4_ivec4_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002673,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.div_float_int_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002674,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_float_int_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002675,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.div_float_int_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002676,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.div_float_int_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002677,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_float_ivec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002678,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.div_float_ivec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002679,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_float_ivec2_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002680,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.div_float_ivec2_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002681,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_float_ivec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002682,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.div_float_ivec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002683,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_float_ivec3_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002684,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.div_float_ivec3_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002685,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_float_ivec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002686,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.div_float_ivec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002687,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_float_ivec4_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002688,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.div_float_ivec4_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002689,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.div_vec2_int_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002690,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.div_vec2_int_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002691,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversi",
        "ons.invalid_implicit_conversions.div_vec2_int_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002692,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.div_vec2_int_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002693,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.div_vec2_ivec2_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002694,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_vec2_ivec2_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002695,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.div_vec2_ivec2_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002696,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_vec2_ivec2_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002697,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.div_vec2_ivec3_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002698,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_vec2_ivec3_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002699,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.div_vec2_ivec3_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002700,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_vec2_ivec3_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002701,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.div_vec2_ivec4_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002702,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_vec2_ivec4_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002703,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.div_vec2_ivec4_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002704,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_vec2_ivec4_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002705,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.div_vec3_int_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002706,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.div_vec3_int_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002707,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversi",
        "ons.invalid_implicit_conversions.div_vec3_int_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002708,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.div_vec3_int_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002709,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.div_vec3_ivec2_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002710,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_vec3_ivec2_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002711,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.div_vec3_ivec2_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002712,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_vec3_ivec2_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002713,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.div_vec3_ivec3_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002714,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_vec3_ivec3_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002715,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.div_vec3_ivec3_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002716,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_vec3_ivec3_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002717,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.div_vec3_ivec4_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002718,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_vec3_ivec4_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002719,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.div_vec3_ivec4_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002720,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_vec3_ivec4_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002721,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.div_vec4_int_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002722,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.div_vec4_int_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002723,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversi",
        "ons.invalid_implicit_conversions.div_vec4_int_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002724,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.div_vec4_int_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002725,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.div_vec4_ivec2_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002726,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_vec4_ivec2_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002727,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.div_vec4_ivec2_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002728,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_vec4_ivec2_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002729,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.div_vec4_ivec3_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002730,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_vec4_ivec3_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002731,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.div_vec4_ivec3_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002732,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_vec4_ivec3_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002733,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.div_vec4_ivec4_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002734,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_vec4_ivec4_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002735,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.div_vec4_ivec4_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002736,
        "dEQP-GLES2.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_vec4_ivec4_ivec4_fragment");
