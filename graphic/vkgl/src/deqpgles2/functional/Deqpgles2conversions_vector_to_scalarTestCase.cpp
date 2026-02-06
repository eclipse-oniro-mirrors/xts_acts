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

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000849,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.vector_to_scalar.vec2_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000850,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_to_scalar.vec2_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000851,
        "dEQP-GLES2.functional.shaders.conversi",
        "ons.vector_to_scalar.vec2_to_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000852,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.vector_to_scalar.vec2_to_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000853,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.vector_to_scalar.vec2_to_bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000854,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_to_scalar.vec2_to_bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000855,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.vector_to_scalar.vec3_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000856,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_to_scalar.vec3_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000857,
        "dEQP-GLES2.functional.shaders.conversi",
        "ons.vector_to_scalar.vec3_to_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000858,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.vector_to_scalar.vec3_to_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000859,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.vector_to_scalar.vec3_to_bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000860,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_to_scalar.vec3_to_bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000861,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.vector_to_scalar.vec4_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000862,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_to_scalar.vec4_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000863,
        "dEQP-GLES2.functional.shaders.conversi",
        "ons.vector_to_scalar.vec4_to_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000864,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.vector_to_scalar.vec4_to_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000865,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.vector_to_scalar.vec4_to_bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000866,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_to_scalar.vec4_to_bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000867,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_to_scalar.ivec2_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000868,
        "dEQP-GLES2.functional.shaders.conversions",
        ".vector_to_scalar.ivec2_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000869,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.vector_to_scalar.ivec2_to_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000870,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_to_scalar.ivec2_to_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000871,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.vector_to_scalar.ivec2_to_bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000872,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_to_scalar.ivec2_to_bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000873,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_to_scalar.ivec3_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000874,
        "dEQP-GLES2.functional.shaders.conversions",
        ".vector_to_scalar.ivec3_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000875,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.vector_to_scalar.ivec3_to_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000876,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_to_scalar.ivec3_to_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000877,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.vector_to_scalar.ivec3_to_bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000878,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_to_scalar.ivec3_to_bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000879,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_to_scalar.ivec4_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000880,
        "dEQP-GLES2.functional.shaders.conversions",
        ".vector_to_scalar.ivec4_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000881,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.vector_to_scalar.ivec4_to_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000882,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_to_scalar.ivec4_to_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000883,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.vector_to_scalar.ivec4_to_bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000884,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_to_scalar.ivec4_to_bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000885,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_to_scalar.bvec2_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000886,
        "dEQP-GLES2.functional.shaders.conversions",
        ".vector_to_scalar.bvec2_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000887,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.vector_to_scalar.bvec2_to_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000888,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_to_scalar.bvec2_to_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000889,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.vector_to_scalar.bvec2_to_bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000890,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_to_scalar.bvec2_to_bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000891,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_to_scalar.bvec3_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000892,
        "dEQP-GLES2.functional.shaders.conversions",
        ".vector_to_scalar.bvec3_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000893,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.vector_to_scalar.bvec3_to_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000894,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_to_scalar.bvec3_to_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000895,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.vector_to_scalar.bvec3_to_bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000896,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_to_scalar.bvec3_to_bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000897,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_to_scalar.bvec4_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000898,
        "dEQP-GLES2.functional.shaders.conversions",
        ".vector_to_scalar.bvec4_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000899,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.vector_to_scalar.bvec4_to_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000900,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_to_scalar.bvec4_to_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000901,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.vector_to_scalar.bvec4_to_bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000902,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_to_scalar.bvec4_to_bool_fragment");
