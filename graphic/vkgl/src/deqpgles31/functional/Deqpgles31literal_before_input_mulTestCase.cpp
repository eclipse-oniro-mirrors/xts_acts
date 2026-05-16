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

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005339,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.literal_before_input.mul.int_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005340,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.literal_before_input.mul.int_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005341,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "1.arithmetic.literal_before_input.mul.int_to_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005342,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.literal_before_input.mul.int_to_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005343,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "1.arithmetic.literal_before_input.mul.int_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005344,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.literal_before_input.mul.int_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005345,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "1.arithmetic.literal_before_input.mul.int_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005346,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.literal_before_input.mul.int_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005347,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "1.arithmetic.literal_before_input.mul.int_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005348,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.literal_before_input.mul.int_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005349,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.literal_before_input.mul.int_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005350,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.literal_before_input.mul.int_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005351,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.literal_before_input.mul.int_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005352,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.literal_before_input.mul.int_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005353,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.literal_before_input.mul.int_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005354,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.literal_before_input.mul.int_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005355,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.literal_before_input.mul.uint_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005356,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.literal_before_input.mul.uint_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005357,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.literal_before_input.mul.uint_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005358,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.literal_before_input.mul.uint_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005359,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.literal_before_input.mul.uint_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005360,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.literal_before_input.mul.uint_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005361,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.literal_before_input.mul.uint_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005362,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.literal_before_input.mul.uint_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005363,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.literal_before_input.mul.ivec2_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005364,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.a",
        "rithmetic.literal_before_input.mul.ivec2_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005365,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.literal_before_input.mul.ivec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005366,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.literal_before_input.mul.ivec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005367,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.literal_before_input.mul.uvec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005368,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.literal_before_input.mul.uvec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005369,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.literal_before_input.mul.ivec3_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005370,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.a",
        "rithmetic.literal_before_input.mul.ivec3_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005371,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.literal_before_input.mul.ivec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005372,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.literal_before_input.mul.ivec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005373,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.literal_before_input.mul.uvec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005374,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.literal_before_input.mul.uvec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005375,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.literal_before_input.mul.ivec4_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005376,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.a",
        "rithmetic.literal_before_input.mul.ivec4_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005377,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.literal_before_input.mul.ivec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005378,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.literal_before_input.mul.ivec4_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005379,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.literal_before_input.mul.uvec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005380,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.literal_before_input.mul.uvec4_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006373,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.literal_before_input.mul.int_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006374,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.literal_before_input.mul.int_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006375,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "2.arithmetic.literal_before_input.mul.int_to_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006376,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.literal_before_input.mul.int_to_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006377,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "2.arithmetic.literal_before_input.mul.int_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006378,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.literal_before_input.mul.int_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006379,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "2.arithmetic.literal_before_input.mul.int_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006380,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.literal_before_input.mul.int_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006381,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "2.arithmetic.literal_before_input.mul.int_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006382,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.literal_before_input.mul.int_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006383,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.literal_before_input.mul.int_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006384,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.literal_before_input.mul.int_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006385,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.literal_before_input.mul.int_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006386,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.literal_before_input.mul.int_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006387,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.literal_before_input.mul.int_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006388,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.literal_before_input.mul.int_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006389,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.literal_before_input.mul.uint_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006390,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.literal_before_input.mul.uint_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006391,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.literal_before_input.mul.uint_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006392,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.literal_before_input.mul.uint_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006393,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.literal_before_input.mul.uint_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006394,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.literal_before_input.mul.uint_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006395,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.literal_before_input.mul.uint_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006396,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.literal_before_input.mul.uint_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006397,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.literal_before_input.mul.ivec2_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006398,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.a",
        "rithmetic.literal_before_input.mul.ivec2_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006399,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.literal_before_input.mul.ivec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006400,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.literal_before_input.mul.ivec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006401,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.literal_before_input.mul.uvec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006402,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.literal_before_input.mul.uvec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006403,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.literal_before_input.mul.ivec3_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006404,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.a",
        "rithmetic.literal_before_input.mul.ivec3_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006405,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.literal_before_input.mul.ivec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006406,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.literal_before_input.mul.ivec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006407,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.literal_before_input.mul.uvec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006408,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.literal_before_input.mul.uvec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006409,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.literal_before_input.mul.ivec4_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006410,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.a",
        "rithmetic.literal_before_input.mul.ivec4_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006411,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.literal_before_input.mul.ivec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006412,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.literal_before_input.mul.ivec4_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006413,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.literal_before_input.mul.uvec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006414,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.literal_before_input.mul.uvec4_to_vec4_fragment");
