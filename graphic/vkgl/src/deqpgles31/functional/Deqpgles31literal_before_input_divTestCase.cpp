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

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005381,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.literal_before_input.div.int_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005382,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.literal_before_input.div.int_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005383,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "1.arithmetic.literal_before_input.div.int_to_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005384,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.literal_before_input.div.int_to_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005385,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "1.arithmetic.literal_before_input.div.int_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005386,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.literal_before_input.div.int_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005387,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "1.arithmetic.literal_before_input.div.int_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005388,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.literal_before_input.div.int_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005389,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "1.arithmetic.literal_before_input.div.int_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005390,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.literal_before_input.div.int_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005391,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.literal_before_input.div.int_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005392,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.literal_before_input.div.int_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005393,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.literal_before_input.div.int_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005394,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.literal_before_input.div.int_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005395,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.literal_before_input.div.int_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005396,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.literal_before_input.div.int_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005397,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.literal_before_input.div.uint_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005398,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.literal_before_input.div.uint_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005399,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.literal_before_input.div.uint_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005400,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.literal_before_input.div.uint_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005401,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.literal_before_input.div.uint_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005402,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.literal_before_input.div.uint_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005403,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.literal_before_input.div.uint_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005404,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.literal_before_input.div.uint_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005405,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.literal_before_input.div.ivec2_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005406,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.a",
        "rithmetic.literal_before_input.div.ivec2_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005407,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.literal_before_input.div.ivec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005408,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.literal_before_input.div.ivec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005409,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.literal_before_input.div.uvec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005410,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.literal_before_input.div.uvec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005411,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.literal_before_input.div.ivec3_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005412,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.a",
        "rithmetic.literal_before_input.div.ivec3_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005413,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.literal_before_input.div.ivec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005414,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.literal_before_input.div.ivec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005415,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.literal_before_input.div.uvec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005416,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.literal_before_input.div.uvec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005417,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.literal_before_input.div.ivec4_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005418,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.a",
        "rithmetic.literal_before_input.div.ivec4_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005419,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.literal_before_input.div.ivec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005420,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.literal_before_input.div.ivec4_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005421,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.literal_before_input.div.uvec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005422,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.literal_before_input.div.uvec4_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006415,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.literal_before_input.div.int_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006416,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.literal_before_input.div.int_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006417,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "2.arithmetic.literal_before_input.div.int_to_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006418,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.literal_before_input.div.int_to_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006419,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "2.arithmetic.literal_before_input.div.int_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006420,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.literal_before_input.div.int_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006421,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "2.arithmetic.literal_before_input.div.int_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006422,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.literal_before_input.div.int_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006423,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "2.arithmetic.literal_before_input.div.int_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006424,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.literal_before_input.div.int_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006425,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.literal_before_input.div.int_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006426,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.literal_before_input.div.int_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006427,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.literal_before_input.div.int_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006428,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.literal_before_input.div.int_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006429,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.literal_before_input.div.int_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006430,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.literal_before_input.div.int_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006431,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.literal_before_input.div.uint_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006432,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.literal_before_input.div.uint_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006433,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.literal_before_input.div.uint_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006434,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.literal_before_input.div.uint_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006435,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.literal_before_input.div.uint_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006436,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.literal_before_input.div.uint_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006437,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.literal_before_input.div.uint_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006438,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.literal_before_input.div.uint_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006439,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.literal_before_input.div.ivec2_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006440,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.a",
        "rithmetic.literal_before_input.div.ivec2_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006441,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.literal_before_input.div.ivec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006442,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.literal_before_input.div.ivec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006443,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.literal_before_input.div.uvec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006444,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.literal_before_input.div.uvec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006445,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.literal_before_input.div.ivec3_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006446,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.a",
        "rithmetic.literal_before_input.div.ivec3_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006447,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.literal_before_input.div.ivec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006448,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.literal_before_input.div.ivec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006449,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.literal_before_input.div.uvec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006450,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.literal_before_input.div.uvec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006451,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.literal_before_input.div.ivec4_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006452,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.a",
        "rithmetic.literal_before_input.div.ivec4_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006453,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.literal_before_input.div.ivec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006454,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.literal_before_input.div.ivec4_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006455,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.literal_before_input.div.uvec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006456,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.literal_before_input.div.uvec4_to_vec4_fragment");
