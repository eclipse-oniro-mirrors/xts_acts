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
#include "../Deqpgles31BaseFunc.h"
#include "../ActsDeqpgles310006TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005185,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.input_before_literal.mul.int_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005186,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.input_before_literal.mul.int_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005187,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "1.arithmetic.input_before_literal.mul.int_to_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005188,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.input_before_literal.mul.int_to_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005189,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "1.arithmetic.input_before_literal.mul.int_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005190,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.input_before_literal.mul.int_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005191,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "1.arithmetic.input_before_literal.mul.int_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005192,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.input_before_literal.mul.int_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005193,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "1.arithmetic.input_before_literal.mul.int_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005194,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.input_before_literal.mul.int_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005195,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.input_before_literal.mul.int_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005196,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.input_before_literal.mul.int_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005197,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.input_before_literal.mul.int_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005198,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.input_before_literal.mul.int_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005199,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.input_before_literal.mul.int_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005200,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.input_before_literal.mul.int_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005201,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.input_before_literal.mul.uint_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005202,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.input_before_literal.mul.uint_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005203,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.input_before_literal.mul.uint_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005204,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.input_before_literal.mul.uint_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005205,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.input_before_literal.mul.uint_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005206,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.input_before_literal.mul.uint_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005207,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.input_before_literal.mul.uint_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005208,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.input_before_literal.mul.uint_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005209,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.input_before_literal.mul.ivec2_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005210,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.a",
        "rithmetic.input_before_literal.mul.ivec2_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005211,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.input_before_literal.mul.ivec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005212,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.input_before_literal.mul.ivec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005213,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.input_before_literal.mul.uvec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005214,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.input_before_literal.mul.uvec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005215,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.input_before_literal.mul.ivec3_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005216,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.a",
        "rithmetic.input_before_literal.mul.ivec3_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005217,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.input_before_literal.mul.ivec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005218,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.input_before_literal.mul.ivec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005219,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.input_before_literal.mul.uvec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005220,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.input_before_literal.mul.uvec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005221,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.input_before_literal.mul.ivec4_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005222,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.a",
        "rithmetic.input_before_literal.mul.ivec4_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005223,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.input_before_literal.mul.ivec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005224,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.input_before_literal.mul.ivec4_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005225,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.input_before_literal.mul.uvec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005226,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.input_before_literal.mul.uvec4_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006219,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.input_before_literal.mul.int_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006220,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.input_before_literal.mul.int_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006221,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "2.arithmetic.input_before_literal.mul.int_to_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006222,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.input_before_literal.mul.int_to_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006223,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "2.arithmetic.input_before_literal.mul.int_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006224,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.input_before_literal.mul.int_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006225,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "2.arithmetic.input_before_literal.mul.int_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006226,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.input_before_literal.mul.int_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006227,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "2.arithmetic.input_before_literal.mul.int_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006228,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.input_before_literal.mul.int_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006229,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.input_before_literal.mul.int_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006230,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.input_before_literal.mul.int_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006231,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.input_before_literal.mul.int_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006232,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.input_before_literal.mul.int_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006233,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.input_before_literal.mul.int_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006234,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.input_before_literal.mul.int_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006235,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.input_before_literal.mul.uint_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006236,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.input_before_literal.mul.uint_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006237,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.input_before_literal.mul.uint_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006238,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.input_before_literal.mul.uint_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006239,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.input_before_literal.mul.uint_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006240,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.input_before_literal.mul.uint_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006241,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.input_before_literal.mul.uint_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006242,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.input_before_literal.mul.uint_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006243,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.input_before_literal.mul.ivec2_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006244,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.a",
        "rithmetic.input_before_literal.mul.ivec2_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006245,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.input_before_literal.mul.ivec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006246,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.input_before_literal.mul.ivec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006247,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.input_before_literal.mul.uvec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006248,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.input_before_literal.mul.uvec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006249,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.input_before_literal.mul.ivec3_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006250,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.a",
        "rithmetic.input_before_literal.mul.ivec3_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006251,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.input_before_literal.mul.ivec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006252,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.input_before_literal.mul.ivec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006253,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.input_before_literal.mul.uvec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006254,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.input_before_literal.mul.uvec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006255,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.input_before_literal.mul.ivec4_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006256,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.a",
        "rithmetic.input_before_literal.mul.ivec4_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006257,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.input_before_literal.mul.ivec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006258,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.input_before_literal.mul.ivec4_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006259,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.input_before_literal.mul.uvec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006260,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.input_before_literal.mul.uvec4_to_vec4_fragment");
