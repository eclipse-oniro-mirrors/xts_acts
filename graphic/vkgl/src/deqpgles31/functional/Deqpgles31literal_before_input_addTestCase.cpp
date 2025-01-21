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

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005269,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.literal_before_input.add.int_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005270,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.literal_before_input.add.int_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005271,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "1.arithmetic.literal_before_input.add.int_to_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005272,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.literal_before_input.add.int_to_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005273,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "1.arithmetic.literal_before_input.add.int_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005274,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.literal_before_input.add.int_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005275,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "1.arithmetic.literal_before_input.add.int_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005276,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.literal_before_input.add.int_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005277,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "1.arithmetic.literal_before_input.add.int_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005278,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.literal_before_input.add.int_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005279,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.literal_before_input.add.int_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005280,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.literal_before_input.add.int_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005281,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.literal_before_input.add.int_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005282,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.literal_before_input.add.int_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005283,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.literal_before_input.add.int_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005284,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.literal_before_input.add.int_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005285,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.literal_before_input.add.uint_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005286,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.literal_before_input.add.uint_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005287,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.literal_before_input.add.uint_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005288,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.literal_before_input.add.uint_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005289,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.literal_before_input.add.uint_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005290,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.literal_before_input.add.uint_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005291,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.literal_before_input.add.uint_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005292,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.literal_before_input.add.uint_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005293,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.literal_before_input.add.ivec2_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005294,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.a",
        "rithmetic.literal_before_input.add.ivec2_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005295,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.literal_before_input.add.ivec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005296,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.literal_before_input.add.ivec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005297,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.literal_before_input.add.uvec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005298,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.literal_before_input.add.uvec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005299,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.literal_before_input.add.ivec3_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005300,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.a",
        "rithmetic.literal_before_input.add.ivec3_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005301,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.literal_before_input.add.ivec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005302,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.literal_before_input.add.ivec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005303,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.literal_before_input.add.uvec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005304,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.literal_before_input.add.uvec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005305,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.literal_before_input.add.ivec4_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005306,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.a",
        "rithmetic.literal_before_input.add.ivec4_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005307,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.literal_before_input.add.ivec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005308,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.literal_before_input.add.ivec4_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005309,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.literal_before_input.add.uvec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005310,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.literal_before_input.add.uvec4_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006303,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.literal_before_input.add.int_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006304,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.literal_before_input.add.int_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006305,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "2.arithmetic.literal_before_input.add.int_to_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006306,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.literal_before_input.add.int_to_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006307,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "2.arithmetic.literal_before_input.add.int_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006308,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.literal_before_input.add.int_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006309,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "2.arithmetic.literal_before_input.add.int_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006310,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.literal_before_input.add.int_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006311,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "2.arithmetic.literal_before_input.add.int_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006312,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.literal_before_input.add.int_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006313,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.literal_before_input.add.int_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006314,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.literal_before_input.add.int_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006315,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.literal_before_input.add.int_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006316,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.literal_before_input.add.int_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006317,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.literal_before_input.add.int_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006318,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.literal_before_input.add.int_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006319,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.literal_before_input.add.uint_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006320,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.literal_before_input.add.uint_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006321,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.literal_before_input.add.uint_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006322,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.literal_before_input.add.uint_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006323,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.literal_before_input.add.uint_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006324,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.literal_before_input.add.uint_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006325,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.literal_before_input.add.uint_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006326,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.literal_before_input.add.uint_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006327,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.literal_before_input.add.ivec2_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006328,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.a",
        "rithmetic.literal_before_input.add.ivec2_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006329,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.literal_before_input.add.ivec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006330,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.literal_before_input.add.ivec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006331,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.literal_before_input.add.uvec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006332,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.literal_before_input.add.uvec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006333,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.literal_before_input.add.ivec3_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006334,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.a",
        "rithmetic.literal_before_input.add.ivec3_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006335,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.literal_before_input.add.ivec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006336,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.literal_before_input.add.ivec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006337,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.literal_before_input.add.uvec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006338,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.literal_before_input.add.uvec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006339,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.literal_before_input.add.ivec4_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006340,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.a",
        "rithmetic.literal_before_input.add.ivec4_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006341,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.literal_before_input.add.ivec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006342,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.literal_before_input.add.ivec4_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006343,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.literal_before_input.add.uvec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006344,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.literal_before_input.add.uvec4_to_vec4_fragment");
