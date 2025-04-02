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

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005447,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.co",
        "mparisons.input_before_literal.not_equal.int_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005448,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.com",
        "parisons.input_before_literal.not_equal.int_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005449,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.co",
        "mparisons.input_before_literal.not_equal.int_to_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005450,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.com",
        "parisons.input_before_literal.not_equal.int_to_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005451,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.com",
        "parisons.input_before_literal.not_equal.uint_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005452,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.comp",
        "arisons.input_before_literal.not_equal.uint_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005453,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.com",
        "parisons.input_before_literal.not_equal.ivec2_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005454,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.comp",
        "arisons.input_before_literal.not_equal.ivec2_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005455,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.com",
        "parisons.input_before_literal.not_equal.ivec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005456,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.comp",
        "arisons.input_before_literal.not_equal.ivec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005457,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.com",
        "parisons.input_before_literal.not_equal.uvec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005458,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.comp",
        "arisons.input_before_literal.not_equal.uvec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005459,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.com",
        "parisons.input_before_literal.not_equal.ivec3_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005460,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.comp",
        "arisons.input_before_literal.not_equal.ivec3_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005461,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.com",
        "parisons.input_before_literal.not_equal.ivec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005462,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.comp",
        "arisons.input_before_literal.not_equal.ivec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005463,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.com",
        "parisons.input_before_literal.not_equal.uvec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005464,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.comp",
        "arisons.input_before_literal.not_equal.uvec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005465,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.com",
        "parisons.input_before_literal.not_equal.ivec4_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005466,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.comp",
        "arisons.input_before_literal.not_equal.ivec4_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005467,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.com",
        "parisons.input_before_literal.not_equal.ivec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005468,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.comp",
        "arisons.input_before_literal.not_equal.ivec4_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005469,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.com",
        "parisons.input_before_literal.not_equal.uvec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005470,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.comp",
        "arisons.input_before_literal.not_equal.uvec4_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006481,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.co",
        "mparisons.input_before_literal.not_equal.int_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006482,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.com",
        "parisons.input_before_literal.not_equal.int_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006483,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.co",
        "mparisons.input_before_literal.not_equal.int_to_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006484,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.com",
        "parisons.input_before_literal.not_equal.int_to_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006485,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.com",
        "parisons.input_before_literal.not_equal.uint_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006486,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.comp",
        "arisons.input_before_literal.not_equal.uint_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006487,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.com",
        "parisons.input_before_literal.not_equal.ivec2_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006488,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.comp",
        "arisons.input_before_literal.not_equal.ivec2_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006489,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.com",
        "parisons.input_before_literal.not_equal.ivec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006490,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.comp",
        "arisons.input_before_literal.not_equal.ivec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006491,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.com",
        "parisons.input_before_literal.not_equal.uvec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006492,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.comp",
        "arisons.input_before_literal.not_equal.uvec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006493,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.com",
        "parisons.input_before_literal.not_equal.ivec3_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006494,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.comp",
        "arisons.input_before_literal.not_equal.ivec3_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006495,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.com",
        "parisons.input_before_literal.not_equal.ivec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006496,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.comp",
        "arisons.input_before_literal.not_equal.ivec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006497,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.com",
        "parisons.input_before_literal.not_equal.uvec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006498,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.comp",
        "arisons.input_before_literal.not_equal.uvec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006499,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.com",
        "parisons.input_before_literal.not_equal.ivec4_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006500,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.comp",
        "arisons.input_before_literal.not_equal.ivec4_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006501,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.com",
        "parisons.input_before_literal.not_equal.ivec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006502,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.comp",
        "arisons.input_before_literal.not_equal.ivec4_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006503,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.com",
        "parisons.input_before_literal.not_equal.uvec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006504,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.comp",
        "arisons.input_before_literal.not_equal.uvec4_to_vec4_fragment");
