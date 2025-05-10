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

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005157,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.input_before_literal.sub.int_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005158,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.input_before_literal.sub.int_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005159,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "1.arithmetic.input_before_literal.sub.int_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005160,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.input_before_literal.sub.int_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005161,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "1.arithmetic.input_before_literal.sub.int_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005162,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.input_before_literal.sub.int_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005163,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "1.arithmetic.input_before_literal.sub.int_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005164,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.input_before_literal.sub.int_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005165,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.input_before_literal.sub.uint_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005166,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.input_before_literal.sub.uint_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005167,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.input_before_literal.sub.uint_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005168,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.input_before_literal.sub.uint_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005169,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.input_before_literal.sub.uint_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005170,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.input_before_literal.sub.uint_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005171,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.input_before_literal.sub.uint_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005172,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.input_before_literal.sub.uint_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005173,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.input_before_literal.sub.ivec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005174,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.input_before_literal.sub.ivec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005175,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.input_before_literal.sub.uvec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005176,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.input_before_literal.sub.uvec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005177,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.input_before_literal.sub.ivec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005178,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.input_before_literal.sub.ivec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005179,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.input_before_literal.sub.uvec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005180,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.input_before_literal.sub.uvec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005181,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.input_before_literal.sub.ivec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005182,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.input_before_literal.sub.ivec4_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005183,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.input_before_literal.sub.uvec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005184,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.input_before_literal.sub.uvec4_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006191,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.input_before_literal.sub.int_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006192,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.input_before_literal.sub.int_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006193,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "2.arithmetic.input_before_literal.sub.int_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006194,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.input_before_literal.sub.int_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006195,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "2.arithmetic.input_before_literal.sub.int_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006196,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.input_before_literal.sub.int_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006197,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "2.arithmetic.input_before_literal.sub.int_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006198,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.input_before_literal.sub.int_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006199,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.input_before_literal.sub.uint_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006200,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.input_before_literal.sub.uint_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006201,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.input_before_literal.sub.uint_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006202,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.input_before_literal.sub.uint_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006203,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.input_before_literal.sub.uint_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006204,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.input_before_literal.sub.uint_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006205,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.input_before_literal.sub.uint_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006206,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.input_before_literal.sub.uint_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006207,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.input_before_literal.sub.ivec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006208,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.input_before_literal.sub.ivec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006209,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.input_before_literal.sub.uvec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006210,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.input_before_literal.sub.uvec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006211,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.input_before_literal.sub.ivec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006212,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.input_before_literal.sub.ivec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006213,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.input_before_literal.sub.uvec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006214,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.input_before_literal.sub.uvec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006215,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.input_before_literal.sub.ivec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006216,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.input_before_literal.sub.ivec4_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006217,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.input_before_literal.sub.uvec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006218,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.input_before_literal.sub.uvec4_to_vec4_fragment");
