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

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005227,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.input_before_literal.div.int_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005228,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.input_before_literal.div.int_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005229,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "1.arithmetic.input_before_literal.div.int_to_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005230,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.input_before_literal.div.int_to_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005231,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "1.arithmetic.input_before_literal.div.int_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005232,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.input_before_literal.div.int_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005233,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "1.arithmetic.input_before_literal.div.int_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005234,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.input_before_literal.div.int_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005235,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "1.arithmetic.input_before_literal.div.int_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005236,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.input_before_literal.div.int_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005237,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.input_before_literal.div.int_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005238,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.input_before_literal.div.int_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005239,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.input_before_literal.div.int_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005240,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.input_before_literal.div.int_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005241,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.input_before_literal.div.int_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005242,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.input_before_literal.div.int_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005243,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.input_before_literal.div.uint_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005244,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.input_before_literal.div.uint_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005245,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.input_before_literal.div.uint_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005246,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.input_before_literal.div.uint_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005247,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.input_before_literal.div.uint_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005248,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.input_before_literal.div.uint_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005249,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.input_before_literal.div.uint_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005250,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.input_before_literal.div.uint_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005251,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.input_before_literal.div.ivec2_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005252,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.a",
        "rithmetic.input_before_literal.div.ivec2_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005253,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.input_before_literal.div.ivec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005254,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.input_before_literal.div.ivec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005255,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.input_before_literal.div.uvec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005256,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.input_before_literal.div.uvec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005257,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.input_before_literal.div.ivec3_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005258,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.a",
        "rithmetic.input_before_literal.div.ivec3_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005259,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.input_before_literal.div.ivec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005260,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.input_before_literal.div.ivec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005261,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.input_before_literal.div.uvec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005262,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.input_before_literal.div.uvec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005263,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.input_before_literal.div.ivec4_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005264,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.a",
        "rithmetic.input_before_literal.div.ivec4_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005265,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.input_before_literal.div.ivec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005266,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.input_before_literal.div.ivec4_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005267,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.input_before_literal.div.uvec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005268,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.input_before_literal.div.uvec4_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006261,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.input_before_literal.div.int_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006262,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.input_before_literal.div.int_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006263,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "2.arithmetic.input_before_literal.div.int_to_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006264,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.input_before_literal.div.int_to_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006265,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "2.arithmetic.input_before_literal.div.int_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006266,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.input_before_literal.div.int_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006267,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "2.arithmetic.input_before_literal.div.int_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006268,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.input_before_literal.div.int_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006269,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "2.arithmetic.input_before_literal.div.int_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006270,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.input_before_literal.div.int_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006271,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.input_before_literal.div.int_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006272,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.input_before_literal.div.int_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006273,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.input_before_literal.div.int_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006274,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.input_before_literal.div.int_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006275,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.input_before_literal.div.int_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006276,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.input_before_literal.div.int_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006277,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.input_before_literal.div.uint_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006278,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.input_before_literal.div.uint_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006279,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.input_before_literal.div.uint_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006280,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.input_before_literal.div.uint_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006281,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.input_before_literal.div.uint_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006282,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.input_before_literal.div.uint_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006283,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.input_before_literal.div.uint_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006284,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.input_before_literal.div.uint_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006285,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.input_before_literal.div.ivec2_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006286,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.a",
        "rithmetic.input_before_literal.div.ivec2_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006287,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.input_before_literal.div.ivec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006288,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.input_before_literal.div.ivec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006289,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.input_before_literal.div.uvec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006290,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.input_before_literal.div.uvec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006291,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.input_before_literal.div.ivec3_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006292,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.a",
        "rithmetic.input_before_literal.div.ivec3_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006293,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.input_before_literal.div.ivec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006294,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.input_before_literal.div.ivec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006295,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.input_before_literal.div.uvec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006296,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.input_before_literal.div.uvec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006297,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.input_before_literal.div.ivec4_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006298,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.a",
        "rithmetic.input_before_literal.div.ivec4_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006299,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.input_before_literal.div.ivec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006300,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.input_before_literal.div.ivec4_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006301,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.input_before_literal.div.uvec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006302,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.input_before_literal.div.uvec4_to_vec4_fragment");
