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

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005423,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "comparisons.input_before_literal.equal.int_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005424,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.c",
        "omparisons.input_before_literal.equal.int_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005425,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "comparisons.input_before_literal.equal.int_to_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005426,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.c",
        "omparisons.input_before_literal.equal.int_to_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005427,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.c",
        "omparisons.input_before_literal.equal.uint_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005428,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.co",
        "mparisons.input_before_literal.equal.uint_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005429,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.c",
        "omparisons.input_before_literal.equal.ivec2_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005430,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.co",
        "mparisons.input_before_literal.equal.ivec2_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005431,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.c",
        "omparisons.input_before_literal.equal.ivec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005432,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.co",
        "mparisons.input_before_literal.equal.ivec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005433,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.c",
        "omparisons.input_before_literal.equal.uvec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005434,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.co",
        "mparisons.input_before_literal.equal.uvec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005435,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.c",
        "omparisons.input_before_literal.equal.ivec3_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005436,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.co",
        "mparisons.input_before_literal.equal.ivec3_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005437,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.c",
        "omparisons.input_before_literal.equal.ivec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005438,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.co",
        "mparisons.input_before_literal.equal.ivec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005439,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.c",
        "omparisons.input_before_literal.equal.uvec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005440,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.co",
        "mparisons.input_before_literal.equal.uvec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005441,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.c",
        "omparisons.input_before_literal.equal.ivec4_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005442,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.co",
        "mparisons.input_before_literal.equal.ivec4_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005443,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.c",
        "omparisons.input_before_literal.equal.ivec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005444,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.co",
        "mparisons.input_before_literal.equal.ivec4_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005445,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.c",
        "omparisons.input_before_literal.equal.uvec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005446,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.co",
        "mparisons.input_before_literal.equal.uvec4_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006457,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "comparisons.input_before_literal.equal.int_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006458,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.c",
        "omparisons.input_before_literal.equal.int_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006459,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "comparisons.input_before_literal.equal.int_to_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006460,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.c",
        "omparisons.input_before_literal.equal.int_to_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006461,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.c",
        "omparisons.input_before_literal.equal.uint_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006462,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.co",
        "mparisons.input_before_literal.equal.uint_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006463,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.c",
        "omparisons.input_before_literal.equal.ivec2_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006464,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.co",
        "mparisons.input_before_literal.equal.ivec2_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006465,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.c",
        "omparisons.input_before_literal.equal.ivec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006466,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.co",
        "mparisons.input_before_literal.equal.ivec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006467,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.c",
        "omparisons.input_before_literal.equal.uvec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006468,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.co",
        "mparisons.input_before_literal.equal.uvec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006469,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.c",
        "omparisons.input_before_literal.equal.ivec3_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006470,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.co",
        "mparisons.input_before_literal.equal.ivec3_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006471,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.c",
        "omparisons.input_before_literal.equal.ivec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006472,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.co",
        "mparisons.input_before_literal.equal.ivec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006473,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.c",
        "omparisons.input_before_literal.equal.uvec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006474,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.co",
        "mparisons.input_before_literal.equal.uvec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006475,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.c",
        "omparisons.input_before_literal.equal.ivec4_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006476,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.co",
        "mparisons.input_before_literal.equal.ivec4_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006477,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.c",
        "omparisons.input_before_literal.equal.ivec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006478,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.co",
        "mparisons.input_before_literal.equal.ivec4_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006479,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.c",
        "omparisons.input_before_literal.equal.uvec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006480,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.co",
        "mparisons.input_before_literal.equal.uvec4_to_vec4_fragment");
