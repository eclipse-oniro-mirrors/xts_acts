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
#include "../ActsDeqpgles30006TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005158,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.add_float_int_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005159,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_float_int_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005160,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.add_float_int_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005161,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.add_float_int_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005162,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_float_ivec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005163,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.add_float_ivec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005164,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_float_ivec2_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005165,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.add_float_ivec2_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005166,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_float_ivec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005167,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.add_float_ivec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005168,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_float_ivec3_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005169,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.add_float_ivec3_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005170,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_float_ivec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005171,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.add_float_ivec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005172,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_float_ivec4_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005173,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.add_float_ivec4_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005174,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.add_vec2_int_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005175,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.add_vec2_int_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005176,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversi",
        "ons.invalid_implicit_conversions.add_vec2_int_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005177,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.add_vec2_int_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005178,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.add_vec2_ivec2_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005179,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_vec2_ivec2_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005180,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.add_vec2_ivec2_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005181,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_vec2_ivec2_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005182,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.add_vec2_ivec3_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005183,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_vec2_ivec3_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005184,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.add_vec2_ivec3_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005185,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_vec2_ivec3_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005186,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.add_vec2_ivec4_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005187,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_vec2_ivec4_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005188,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.add_vec2_ivec4_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005189,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_vec2_ivec4_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005190,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.add_vec3_int_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005191,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.add_vec3_int_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005192,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversi",
        "ons.invalid_implicit_conversions.add_vec3_int_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005193,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.add_vec3_int_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005194,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.add_vec3_ivec2_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005195,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_vec3_ivec2_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005196,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.add_vec3_ivec2_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005197,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_vec3_ivec2_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005198,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.add_vec3_ivec3_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005199,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_vec3_ivec3_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005200,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.add_vec3_ivec3_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005201,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_vec3_ivec3_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005202,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.add_vec3_ivec4_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005203,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_vec3_ivec4_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005204,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.add_vec3_ivec4_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005205,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_vec3_ivec4_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005206,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.add_vec4_int_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005207,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.add_vec4_int_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005208,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversi",
        "ons.invalid_implicit_conversions.add_vec4_int_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005209,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.add_vec4_int_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005210,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.add_vec4_ivec2_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005211,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_vec4_ivec2_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005212,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.add_vec4_ivec2_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005213,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_vec4_ivec2_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005214,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.add_vec4_ivec3_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005215,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_vec4_ivec3_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005216,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.add_vec4_ivec3_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005217,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_vec4_ivec3_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005218,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.add_vec4_ivec4_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005219,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_vec4_ivec4_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005220,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.add_vec4_ivec4_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005221,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_vec4_ivec4_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005222,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.add_float_uint_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005223,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_float_uint_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005224,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.add_float_uint_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005225,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_float_uint_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005226,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_float_uvec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005227,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.add_float_uvec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005228,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_float_uvec2_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005229,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.add_float_uvec2_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005230,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_float_uvec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005231,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.add_float_uvec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005232,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_float_uvec3_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005233,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.add_float_uvec3_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005234,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_float_uvec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005235,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.add_float_uvec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005236,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_float_uvec4_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005237,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.add_float_uvec4_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005238,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.add_vec2_uint_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005239,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.add_vec2_uint_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005240,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.add_vec2_uint_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005241,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.add_vec2_uint_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005242,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.add_vec2_uvec2_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005243,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_vec2_uvec2_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005244,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.add_vec2_uvec2_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005245,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_vec2_uvec2_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005246,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.add_vec2_uvec3_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005247,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_vec2_uvec3_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005248,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.add_vec2_uvec3_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005249,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_vec2_uvec3_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005250,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.add_vec2_uvec4_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005251,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_vec2_uvec4_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005252,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.add_vec2_uvec4_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005253,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_vec2_uvec4_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005254,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.add_vec3_uint_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005255,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.add_vec3_uint_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005256,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.add_vec3_uint_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005257,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.add_vec3_uint_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005258,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.add_vec3_uvec2_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005259,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_vec3_uvec2_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005260,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.add_vec3_uvec2_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005261,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_vec3_uvec2_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005262,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.add_vec3_uvec3_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005263,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_vec3_uvec3_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005264,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.add_vec3_uvec3_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005265,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_vec3_uvec3_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005266,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.add_vec3_uvec4_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005267,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_vec3_uvec4_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005268,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.add_vec3_uvec4_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005269,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_vec3_uvec4_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005270,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.add_vec4_uint_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005271,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.add_vec4_uint_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005272,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.add_vec4_uint_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005273,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.add_vec4_uint_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005274,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.add_vec4_uvec2_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005275,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_vec4_uvec2_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005276,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.add_vec4_uvec2_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005277,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_vec4_uvec2_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005278,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.add_vec4_uvec3_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005279,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_vec4_uvec3_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005280,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.add_vec4_uvec3_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005281,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_vec4_uvec3_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005282,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.add_vec4_uvec4_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005283,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_vec4_uvec4_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005284,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.add_vec4_uvec4_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005285,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_vec4_uvec4_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005286,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversi",
        "ons.invalid_implicit_conversions.add_int_uint_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005287,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.add_int_uint_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005288,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.add_int_uint_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005289,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.add_int_uint_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005290,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.add_int_uvec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005291,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.add_int_uvec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005292,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.add_int_uvec2_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005293,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_int_uvec2_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005294,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.add_int_uvec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005295,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.add_int_uvec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005296,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.add_int_uvec3_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005297,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_int_uvec3_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005298,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.add_int_uvec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005299,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.add_int_uvec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005300,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.add_int_uvec4_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005301,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_int_uvec4_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005302,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.add_ivec2_uint_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005303,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_ivec2_uint_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005304,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.add_ivec2_uint_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005305,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_ivec2_uint_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005306,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_ivec2_uvec2_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005307,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.add_ivec2_uvec2_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005308,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_ivec2_uvec2_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005309,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.add_ivec2_uvec2_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005310,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_ivec2_uvec3_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005311,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.add_ivec2_uvec3_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005312,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_ivec2_uvec3_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005313,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.add_ivec2_uvec3_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005314,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_ivec2_uvec4_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005315,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.add_ivec2_uvec4_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005316,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_ivec2_uvec4_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005317,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.add_ivec2_uvec4_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005318,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.add_ivec3_uint_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005319,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_ivec3_uint_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005320,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.add_ivec3_uint_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005321,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_ivec3_uint_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005322,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_ivec3_uvec2_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005323,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.add_ivec3_uvec2_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005324,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_ivec3_uvec2_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005325,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.add_ivec3_uvec2_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005326,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_ivec3_uvec3_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005327,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.add_ivec3_uvec3_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005328,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_ivec3_uvec3_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005329,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.add_ivec3_uvec3_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005330,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_ivec3_uvec4_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005331,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.add_ivec3_uvec4_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005332,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_ivec3_uvec4_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005333,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.add_ivec3_uvec4_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005334,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.add_ivec4_uint_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005335,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_ivec4_uint_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005336,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.add_ivec4_uint_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005337,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_ivec4_uint_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005338,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_ivec4_uvec2_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005339,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.add_ivec4_uvec2_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005340,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_ivec4_uvec2_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005341,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.add_ivec4_uvec2_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005342,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_ivec4_uvec3_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005343,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.add_ivec4_uvec3_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005344,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_ivec4_uvec3_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005345,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.add_ivec4_uvec3_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005346,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_ivec4_uvec4_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005347,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.add_ivec4_uvec4_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005348,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.add_ivec4_uvec4_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005349,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.add_ivec4_uvec4_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005350,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.mul_float_int_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005351,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_float_int_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005352,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.mul_float_int_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005353,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.mul_float_int_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005354,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_float_ivec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005355,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.mul_float_ivec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005356,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_float_ivec2_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005357,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.mul_float_ivec2_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005358,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_float_ivec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005359,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.mul_float_ivec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005360,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_float_ivec3_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005361,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.mul_float_ivec3_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005362,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_float_ivec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005363,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.mul_float_ivec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005364,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_float_ivec4_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005365,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.mul_float_ivec4_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005366,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.mul_vec2_int_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005367,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.mul_vec2_int_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005368,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversi",
        "ons.invalid_implicit_conversions.mul_vec2_int_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005369,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.mul_vec2_int_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005370,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.mul_vec2_ivec2_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005371,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_vec2_ivec2_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005372,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.mul_vec2_ivec2_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005373,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_vec2_ivec2_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005374,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.mul_vec2_ivec3_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005375,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_vec2_ivec3_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005376,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.mul_vec2_ivec3_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005377,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_vec2_ivec3_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005378,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.mul_vec2_ivec4_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005379,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_vec2_ivec4_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005380,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.mul_vec2_ivec4_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005381,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_vec2_ivec4_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005382,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.mul_vec3_int_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005383,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.mul_vec3_int_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005384,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversi",
        "ons.invalid_implicit_conversions.mul_vec3_int_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005385,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.mul_vec3_int_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005386,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.mul_vec3_ivec2_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005387,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_vec3_ivec2_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005388,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.mul_vec3_ivec2_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005389,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_vec3_ivec2_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005390,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.mul_vec3_ivec3_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005391,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_vec3_ivec3_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005392,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.mul_vec3_ivec3_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005393,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_vec3_ivec3_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005394,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.mul_vec3_ivec4_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005395,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_vec3_ivec4_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005396,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.mul_vec3_ivec4_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005397,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_vec3_ivec4_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005398,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.mul_vec4_int_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005399,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.mul_vec4_int_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005400,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversi",
        "ons.invalid_implicit_conversions.mul_vec4_int_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005401,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.mul_vec4_int_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005402,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.mul_vec4_ivec2_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005403,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_vec4_ivec2_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005404,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.mul_vec4_ivec2_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005405,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_vec4_ivec2_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005406,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.mul_vec4_ivec3_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005407,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_vec4_ivec3_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005408,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.mul_vec4_ivec3_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005409,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_vec4_ivec3_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005410,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.mul_vec4_ivec4_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005411,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_vec4_ivec4_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005412,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.mul_vec4_ivec4_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005413,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_vec4_ivec4_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005414,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.mul_float_uint_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005415,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_float_uint_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005416,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.mul_float_uint_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005417,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_float_uint_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005418,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_float_uvec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005419,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.mul_float_uvec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005420,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_float_uvec2_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005421,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.mul_float_uvec2_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005422,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_float_uvec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005423,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.mul_float_uvec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005424,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_float_uvec3_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005425,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.mul_float_uvec3_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005426,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_float_uvec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005427,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.mul_float_uvec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005428,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_float_uvec4_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005429,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.mul_float_uvec4_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005430,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.mul_vec2_uint_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005431,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.mul_vec2_uint_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005432,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.mul_vec2_uint_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005433,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.mul_vec2_uint_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005434,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.mul_vec2_uvec2_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005435,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_vec2_uvec2_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005436,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.mul_vec2_uvec2_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005437,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_vec2_uvec2_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005438,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.mul_vec2_uvec3_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005439,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_vec2_uvec3_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005440,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.mul_vec2_uvec3_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005441,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_vec2_uvec3_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005442,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.mul_vec2_uvec4_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005443,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_vec2_uvec4_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005444,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.mul_vec2_uvec4_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005445,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_vec2_uvec4_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005446,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.mul_vec3_uint_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005447,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.mul_vec3_uint_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005448,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.mul_vec3_uint_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005449,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.mul_vec3_uint_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005450,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.mul_vec3_uvec2_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005451,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_vec3_uvec2_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005452,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.mul_vec3_uvec2_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005453,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_vec3_uvec2_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005454,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.mul_vec3_uvec3_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005455,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_vec3_uvec3_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005456,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.mul_vec3_uvec3_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005457,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_vec3_uvec3_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005458,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.mul_vec3_uvec4_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005459,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_vec3_uvec4_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005460,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.mul_vec3_uvec4_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005461,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_vec3_uvec4_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005462,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.mul_vec4_uint_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005463,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.mul_vec4_uint_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005464,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.mul_vec4_uint_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005465,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.mul_vec4_uint_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005466,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.mul_vec4_uvec2_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005467,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_vec4_uvec2_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005468,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.mul_vec4_uvec2_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005469,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_vec4_uvec2_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005470,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.mul_vec4_uvec3_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005471,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_vec4_uvec3_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005472,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.mul_vec4_uvec3_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005473,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_vec4_uvec3_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005474,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.mul_vec4_uvec4_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005475,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_vec4_uvec4_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005476,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.mul_vec4_uvec4_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005477,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_vec4_uvec4_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005478,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversi",
        "ons.invalid_implicit_conversions.mul_int_uint_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005479,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.mul_int_uint_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005480,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.mul_int_uint_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005481,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.mul_int_uint_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005482,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.mul_int_uvec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005483,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.mul_int_uvec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005484,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.mul_int_uvec2_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005485,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_int_uvec2_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005486,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.mul_int_uvec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005487,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.mul_int_uvec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005488,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.mul_int_uvec3_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005489,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_int_uvec3_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005490,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.mul_int_uvec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005491,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.mul_int_uvec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005492,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.mul_int_uvec4_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005493,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_int_uvec4_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005494,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.mul_ivec2_uint_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005495,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_ivec2_uint_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005496,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.mul_ivec2_uint_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005497,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_ivec2_uint_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005498,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_ivec2_uvec2_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005499,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.mul_ivec2_uvec2_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005500,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_ivec2_uvec2_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005501,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.mul_ivec2_uvec2_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005502,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_ivec2_uvec3_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005503,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.mul_ivec2_uvec3_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005504,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_ivec2_uvec3_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005505,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.mul_ivec2_uvec3_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005506,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_ivec2_uvec4_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005507,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.mul_ivec2_uvec4_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005508,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_ivec2_uvec4_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005509,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.mul_ivec2_uvec4_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005510,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.mul_ivec3_uint_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005511,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_ivec3_uint_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005512,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.mul_ivec3_uint_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005513,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_ivec3_uint_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005514,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_ivec3_uvec2_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005515,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.mul_ivec3_uvec2_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005516,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_ivec3_uvec2_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005517,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.mul_ivec3_uvec2_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005518,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_ivec3_uvec3_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005519,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.mul_ivec3_uvec3_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005520,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_ivec3_uvec3_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005521,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.mul_ivec3_uvec3_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005522,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_ivec3_uvec4_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005523,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.mul_ivec3_uvec4_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005524,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_ivec3_uvec4_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005525,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.mul_ivec3_uvec4_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005526,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.mul_ivec4_uint_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005527,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_ivec4_uint_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005528,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.mul_ivec4_uint_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005529,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_ivec4_uint_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005530,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_ivec4_uvec2_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005531,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.mul_ivec4_uvec2_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005532,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_ivec4_uvec2_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005533,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.mul_ivec4_uvec2_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005534,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_ivec4_uvec3_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005535,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.mul_ivec4_uvec3_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005536,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_ivec4_uvec3_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005537,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.mul_ivec4_uvec3_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005538,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_ivec4_uvec4_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005539,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.mul_ivec4_uvec4_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005540,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.mul_ivec4_uvec4_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005541,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.mul_ivec4_uvec4_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005542,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.sub_float_int_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005543,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_float_int_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005544,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.sub_float_int_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005545,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.sub_float_int_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005546,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_float_ivec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005547,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.sub_float_ivec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005548,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_float_ivec2_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005549,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.sub_float_ivec2_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005550,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_float_ivec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005551,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.sub_float_ivec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005552,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_float_ivec3_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005553,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.sub_float_ivec3_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005554,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_float_ivec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005555,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.sub_float_ivec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005556,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_float_ivec4_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005557,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.sub_float_ivec4_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005558,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.sub_vec2_int_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005559,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.sub_vec2_int_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005560,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversi",
        "ons.invalid_implicit_conversions.sub_vec2_int_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005561,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.sub_vec2_int_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005562,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.sub_vec2_ivec2_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005563,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_vec2_ivec2_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005564,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.sub_vec2_ivec2_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005565,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_vec2_ivec2_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005566,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.sub_vec2_ivec3_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005567,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_vec2_ivec3_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005568,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.sub_vec2_ivec3_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005569,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_vec2_ivec3_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005570,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.sub_vec2_ivec4_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005571,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_vec2_ivec4_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005572,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.sub_vec2_ivec4_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005573,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_vec2_ivec4_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005574,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.sub_vec3_int_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005575,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.sub_vec3_int_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005576,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversi",
        "ons.invalid_implicit_conversions.sub_vec3_int_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005577,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.sub_vec3_int_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005578,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.sub_vec3_ivec2_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005579,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_vec3_ivec2_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005580,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.sub_vec3_ivec2_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005581,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_vec3_ivec2_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005582,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.sub_vec3_ivec3_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005583,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_vec3_ivec3_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005584,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.sub_vec3_ivec3_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005585,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_vec3_ivec3_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005586,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.sub_vec3_ivec4_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005587,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_vec3_ivec4_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005588,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.sub_vec3_ivec4_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005589,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_vec3_ivec4_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005590,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.sub_vec4_int_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005591,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.sub_vec4_int_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005592,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversi",
        "ons.invalid_implicit_conversions.sub_vec4_int_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005593,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.sub_vec4_int_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005594,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.sub_vec4_ivec2_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005595,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_vec4_ivec2_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005596,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.sub_vec4_ivec2_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005597,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_vec4_ivec2_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005598,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.sub_vec4_ivec3_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005599,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_vec4_ivec3_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005600,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.sub_vec4_ivec3_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005601,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_vec4_ivec3_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005602,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.sub_vec4_ivec4_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005603,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_vec4_ivec4_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005604,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.sub_vec4_ivec4_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005605,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_vec4_ivec4_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005606,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.sub_float_uint_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005607,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_float_uint_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005608,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.sub_float_uint_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005609,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_float_uint_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005610,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_float_uvec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005611,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.sub_float_uvec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005612,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_float_uvec2_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005613,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.sub_float_uvec2_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005614,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_float_uvec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005615,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.sub_float_uvec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005616,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_float_uvec3_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005617,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.sub_float_uvec3_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005618,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_float_uvec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005619,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.sub_float_uvec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005620,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_float_uvec4_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005621,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.sub_float_uvec4_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005622,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.sub_vec2_uint_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005623,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.sub_vec2_uint_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005624,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.sub_vec2_uint_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005625,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.sub_vec2_uint_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005626,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.sub_vec2_uvec2_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005627,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_vec2_uvec2_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005628,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.sub_vec2_uvec2_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005629,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_vec2_uvec2_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005630,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.sub_vec2_uvec3_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005631,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_vec2_uvec3_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005632,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.sub_vec2_uvec3_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005633,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_vec2_uvec3_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005634,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.sub_vec2_uvec4_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005635,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_vec2_uvec4_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005636,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.sub_vec2_uvec4_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005637,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_vec2_uvec4_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005638,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.sub_vec3_uint_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005639,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.sub_vec3_uint_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005640,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.sub_vec3_uint_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005641,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.sub_vec3_uint_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005642,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.sub_vec3_uvec2_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005643,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_vec3_uvec2_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005644,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.sub_vec3_uvec2_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005645,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_vec3_uvec2_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005646,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.sub_vec3_uvec3_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005647,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_vec3_uvec3_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005648,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.sub_vec3_uvec3_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005649,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_vec3_uvec3_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005650,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.sub_vec3_uvec4_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005651,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_vec3_uvec4_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005652,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.sub_vec3_uvec4_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005653,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_vec3_uvec4_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005654,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.sub_vec4_uint_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005655,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.sub_vec4_uint_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005656,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.sub_vec4_uint_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005657,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.sub_vec4_uint_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005658,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.sub_vec4_uvec2_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005659,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_vec4_uvec2_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005660,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.sub_vec4_uvec2_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005661,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_vec4_uvec2_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005662,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.sub_vec4_uvec3_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005663,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_vec4_uvec3_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005664,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.sub_vec4_uvec3_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005665,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_vec4_uvec3_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005666,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.sub_vec4_uvec4_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005667,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_vec4_uvec4_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005668,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.sub_vec4_uvec4_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005669,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_vec4_uvec4_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005670,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversi",
        "ons.invalid_implicit_conversions.sub_int_uint_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005671,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.sub_int_uint_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005672,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.sub_int_uint_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005673,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.sub_int_uint_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005674,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.sub_int_uvec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005675,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.sub_int_uvec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005676,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.sub_int_uvec2_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005677,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_int_uvec2_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005678,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.sub_int_uvec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005679,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.sub_int_uvec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005680,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.sub_int_uvec3_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005681,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_int_uvec3_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005682,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.sub_int_uvec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005683,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.sub_int_uvec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005684,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.sub_int_uvec4_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005685,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_int_uvec4_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005686,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.sub_ivec2_uint_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005687,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_ivec2_uint_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005688,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.sub_ivec2_uint_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005689,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_ivec2_uint_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005690,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_ivec2_uvec2_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005691,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.sub_ivec2_uvec2_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005692,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_ivec2_uvec2_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005693,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.sub_ivec2_uvec2_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005694,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_ivec2_uvec3_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005695,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.sub_ivec2_uvec3_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005696,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_ivec2_uvec3_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005697,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.sub_ivec2_uvec3_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005698,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_ivec2_uvec4_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005699,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.sub_ivec2_uvec4_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005700,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_ivec2_uvec4_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005701,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.sub_ivec2_uvec4_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005702,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.sub_ivec3_uint_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005703,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_ivec3_uint_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005704,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.sub_ivec3_uint_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005705,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_ivec3_uint_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005706,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_ivec3_uvec2_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005707,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.sub_ivec3_uvec2_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005708,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_ivec3_uvec2_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005709,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.sub_ivec3_uvec2_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005710,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_ivec3_uvec3_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005711,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.sub_ivec3_uvec3_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005712,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_ivec3_uvec3_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005713,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.sub_ivec3_uvec3_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005714,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_ivec3_uvec4_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005715,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.sub_ivec3_uvec4_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005716,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_ivec3_uvec4_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005717,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.sub_ivec3_uvec4_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005718,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.sub_ivec4_uint_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005719,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_ivec4_uint_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005720,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.sub_ivec4_uint_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005721,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_ivec4_uint_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005722,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_ivec4_uvec2_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005723,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.sub_ivec4_uvec2_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005724,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_ivec4_uvec2_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005725,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.sub_ivec4_uvec2_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005726,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_ivec4_uvec3_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005727,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.sub_ivec4_uvec3_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005728,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_ivec4_uvec3_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005729,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.sub_ivec4_uvec3_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005730,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_ivec4_uvec4_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005731,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.sub_ivec4_uvec4_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005732,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.sub_ivec4_uvec4_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005733,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.sub_ivec4_uvec4_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005734,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.div_float_int_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005735,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_float_int_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005736,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.div_float_int_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005737,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.div_float_int_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005738,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_float_ivec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005739,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.div_float_ivec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005740,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_float_ivec2_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005741,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.div_float_ivec2_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005742,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_float_ivec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005743,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.div_float_ivec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005744,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_float_ivec3_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005745,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.div_float_ivec3_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005746,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_float_ivec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005747,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.div_float_ivec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005748,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_float_ivec4_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005749,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.div_float_ivec4_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005750,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.div_vec2_int_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005751,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.div_vec2_int_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005752,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversi",
        "ons.invalid_implicit_conversions.div_vec2_int_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005753,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.div_vec2_int_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005754,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.div_vec2_ivec2_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005755,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_vec2_ivec2_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005756,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.div_vec2_ivec2_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005757,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_vec2_ivec2_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005758,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.div_vec2_ivec3_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005759,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_vec2_ivec3_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005760,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.div_vec2_ivec3_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005761,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_vec2_ivec3_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005762,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.div_vec2_ivec4_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005763,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_vec2_ivec4_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005764,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.div_vec2_ivec4_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005765,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_vec2_ivec4_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005766,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.div_vec3_int_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005767,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.div_vec3_int_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005768,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversi",
        "ons.invalid_implicit_conversions.div_vec3_int_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005769,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.div_vec3_int_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005770,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.div_vec3_ivec2_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005771,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_vec3_ivec2_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005772,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.div_vec3_ivec2_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005773,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_vec3_ivec2_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005774,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.div_vec3_ivec3_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005775,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_vec3_ivec3_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005776,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.div_vec3_ivec3_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005777,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_vec3_ivec3_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005778,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.div_vec3_ivec4_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005779,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_vec3_ivec4_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005780,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.div_vec3_ivec4_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005781,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_vec3_ivec4_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005782,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.div_vec4_int_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005783,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.div_vec4_int_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005784,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversi",
        "ons.invalid_implicit_conversions.div_vec4_int_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005785,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.div_vec4_int_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005786,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.div_vec4_ivec2_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005787,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_vec4_ivec2_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005788,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.div_vec4_ivec2_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005789,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_vec4_ivec2_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005790,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.div_vec4_ivec3_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005791,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_vec4_ivec3_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005792,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.div_vec4_ivec3_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005793,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_vec4_ivec3_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005794,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.div_vec4_ivec4_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005795,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_vec4_ivec4_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005796,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.div_vec4_ivec4_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005797,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_vec4_ivec4_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005798,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.div_float_uint_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005799,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_float_uint_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005800,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.div_float_uint_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005801,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_float_uint_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005802,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_float_uvec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005803,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.div_float_uvec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005804,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_float_uvec2_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005805,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.div_float_uvec2_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005806,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_float_uvec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005807,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.div_float_uvec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005808,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_float_uvec3_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005809,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.div_float_uvec3_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005810,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_float_uvec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005811,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.div_float_uvec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005812,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_float_uvec4_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005813,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.div_float_uvec4_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005814,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.div_vec2_uint_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005815,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.div_vec2_uint_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005816,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.div_vec2_uint_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005817,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.div_vec2_uint_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005818,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.div_vec2_uvec2_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005819,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_vec2_uvec2_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005820,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.div_vec2_uvec2_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005821,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_vec2_uvec2_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005822,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.div_vec2_uvec3_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005823,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_vec2_uvec3_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005824,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.div_vec2_uvec3_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005825,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_vec2_uvec3_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005826,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.div_vec2_uvec4_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005827,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_vec2_uvec4_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005828,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.div_vec2_uvec4_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005829,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_vec2_uvec4_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005830,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.div_vec3_uint_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005831,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.div_vec3_uint_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005832,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.div_vec3_uint_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005833,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.div_vec3_uint_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005834,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.div_vec3_uvec2_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005835,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_vec3_uvec2_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005836,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.div_vec3_uvec2_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005837,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_vec3_uvec2_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005838,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.div_vec3_uvec3_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005839,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_vec3_uvec3_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005840,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.div_vec3_uvec3_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005841,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_vec3_uvec3_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005842,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.div_vec3_uvec4_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005843,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_vec3_uvec4_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005844,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.div_vec3_uvec4_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005845,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_vec3_uvec4_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005846,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.div_vec4_uint_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005847,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.div_vec4_uint_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005848,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.div_vec4_uint_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005849,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.div_vec4_uint_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005850,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.div_vec4_uvec2_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005851,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_vec4_uvec2_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005852,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.div_vec4_uvec2_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005853,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_vec4_uvec2_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005854,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.div_vec4_uvec3_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005855,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_vec4_uvec3_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005856,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.div_vec4_uvec3_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005857,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_vec4_uvec3_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005858,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.div_vec4_uvec4_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005859,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_vec4_uvec4_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005860,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.div_vec4_uvec4_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005861,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_vec4_uvec4_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005862,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversi",
        "ons.invalid_implicit_conversions.div_int_uint_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005863,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.div_int_uint_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005864,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.div_int_uint_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005865,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.div_int_uint_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005866,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.div_int_uvec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005867,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.div_int_uvec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005868,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.div_int_uvec2_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005869,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_int_uvec2_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005870,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.div_int_uvec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005871,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.div_int_uvec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005872,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.div_int_uvec3_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005873,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_int_uvec3_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005874,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversio",
        "ns.invalid_implicit_conversions.div_int_uvec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005875,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.div_int_uvec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005876,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.div_int_uvec4_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005877,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_int_uvec4_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005878,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.div_ivec2_uint_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005879,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_ivec2_uint_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005880,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.div_ivec2_uint_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005881,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_ivec2_uint_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005882,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_ivec2_uvec2_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005883,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.div_ivec2_uvec2_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005884,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_ivec2_uvec2_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005885,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.div_ivec2_uvec2_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005886,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_ivec2_uvec3_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005887,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.div_ivec2_uvec3_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005888,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_ivec2_uvec3_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005889,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.div_ivec2_uvec3_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005890,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_ivec2_uvec4_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005891,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.div_ivec2_uvec4_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005892,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_ivec2_uvec4_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005893,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.div_ivec2_uvec4_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005894,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.div_ivec3_uint_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005895,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_ivec3_uint_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005896,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.div_ivec3_uint_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005897,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_ivec3_uint_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005898,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_ivec3_uvec2_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005899,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.div_ivec3_uvec2_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005900,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_ivec3_uvec2_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005901,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.div_ivec3_uvec2_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005902,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_ivec3_uvec3_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005903,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.div_ivec3_uvec3_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005904,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_ivec3_uvec3_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005905,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.div_ivec3_uvec3_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005906,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_ivec3_uvec4_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005907,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.div_ivec3_uvec4_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005908,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_ivec3_uvec4_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005909,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.div_ivec3_uvec4_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005910,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.div_ivec4_uint_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005911,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_ivec4_uint_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005912,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversion",
        "s.invalid_implicit_conversions.div_ivec4_uint_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005913,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_ivec4_uint_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005914,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_ivec4_uvec2_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005915,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.div_ivec4_uvec2_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005916,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_ivec4_uvec2_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005917,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.div_ivec4_uvec2_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005918,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_ivec4_uvec3_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005919,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.div_ivec4_uvec3_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005920,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_ivec4_uvec3_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005921,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.div_ivec4_uvec3_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005922,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_ivec4_uvec4_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005923,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.div_ivec4_uvec4_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005924,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions",
        ".invalid_implicit_conversions.div_ivec4_uvec4_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005925,
        "dEQP-GLES3.functional.shaders.invalid_implicit_conversions.",
        "invalid_implicit_conversions.div_ivec4_uvec4_uvec4_fragment");
