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

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005495,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "comparisons.literal_before_input.equal.int_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005496,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.c",
        "omparisons.literal_before_input.equal.int_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005497,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "comparisons.literal_before_input.equal.int_to_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005498,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.c",
        "omparisons.literal_before_input.equal.int_to_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005499,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.c",
        "omparisons.literal_before_input.equal.uint_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005500,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.co",
        "mparisons.literal_before_input.equal.uint_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005501,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.c",
        "omparisons.literal_before_input.equal.ivec2_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005502,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.co",
        "mparisons.literal_before_input.equal.ivec2_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005503,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.c",
        "omparisons.literal_before_input.equal.ivec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005504,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.co",
        "mparisons.literal_before_input.equal.ivec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005505,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.c",
        "omparisons.literal_before_input.equal.uvec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005506,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.co",
        "mparisons.literal_before_input.equal.uvec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005507,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.c",
        "omparisons.literal_before_input.equal.ivec3_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005508,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.co",
        "mparisons.literal_before_input.equal.ivec3_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005509,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.c",
        "omparisons.literal_before_input.equal.ivec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005510,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.co",
        "mparisons.literal_before_input.equal.ivec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005511,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.c",
        "omparisons.literal_before_input.equal.uvec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005512,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.co",
        "mparisons.literal_before_input.equal.uvec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005513,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.c",
        "omparisons.literal_before_input.equal.ivec4_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005514,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.co",
        "mparisons.literal_before_input.equal.ivec4_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005515,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.c",
        "omparisons.literal_before_input.equal.ivec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005516,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.co",
        "mparisons.literal_before_input.equal.ivec4_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005517,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.c",
        "omparisons.literal_before_input.equal.uvec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005518,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.co",
        "mparisons.literal_before_input.equal.uvec4_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006529,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "comparisons.literal_before_input.equal.int_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006530,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.c",
        "omparisons.literal_before_input.equal.int_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006531,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "comparisons.literal_before_input.equal.int_to_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006532,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.c",
        "omparisons.literal_before_input.equal.int_to_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006533,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.c",
        "omparisons.literal_before_input.equal.uint_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006534,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.co",
        "mparisons.literal_before_input.equal.uint_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006535,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.c",
        "omparisons.literal_before_input.equal.ivec2_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006536,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.co",
        "mparisons.literal_before_input.equal.ivec2_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006537,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.c",
        "omparisons.literal_before_input.equal.ivec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006538,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.co",
        "mparisons.literal_before_input.equal.ivec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006539,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.c",
        "omparisons.literal_before_input.equal.uvec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006540,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.co",
        "mparisons.literal_before_input.equal.uvec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006541,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.c",
        "omparisons.literal_before_input.equal.ivec3_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006542,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.co",
        "mparisons.literal_before_input.equal.ivec3_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006543,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.c",
        "omparisons.literal_before_input.equal.ivec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006544,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.co",
        "mparisons.literal_before_input.equal.ivec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006545,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.c",
        "omparisons.literal_before_input.equal.uvec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006546,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.co",
        "mparisons.literal_before_input.equal.uvec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006547,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.c",
        "omparisons.literal_before_input.equal.ivec4_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006548,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.co",
        "mparisons.literal_before_input.equal.ivec4_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006549,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.c",
        "omparisons.literal_before_input.equal.ivec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006550,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.co",
        "mparisons.literal_before_input.equal.ivec4_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006551,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.c",
        "omparisons.literal_before_input.equal.uvec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006552,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.co",
        "mparisons.literal_before_input.equal.uvec4_to_vec4_fragment");
