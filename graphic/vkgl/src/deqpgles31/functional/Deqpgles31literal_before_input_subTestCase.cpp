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

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005311,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.literal_before_input.sub.int_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005312,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.literal_before_input.sub.int_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005313,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "1.arithmetic.literal_before_input.sub.int_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005314,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.literal_before_input.sub.int_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005315,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "1.arithmetic.literal_before_input.sub.int_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005316,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.literal_before_input.sub.int_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005317,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "1.arithmetic.literal_before_input.sub.int_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005318,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.literal_before_input.sub.int_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005319,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.literal_before_input.sub.uint_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005320,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.literal_before_input.sub.uint_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005321,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.literal_before_input.sub.uint_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005322,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.literal_before_input.sub.uint_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005323,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.literal_before_input.sub.uint_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005324,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.literal_before_input.sub.uint_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005325,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.literal_before_input.sub.uint_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005326,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.literal_before_input.sub.uint_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005327,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.literal_before_input.sub.ivec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005328,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.literal_before_input.sub.ivec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005329,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.literal_before_input.sub.uvec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005330,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.literal_before_input.sub.uvec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005331,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.literal_before_input.sub.ivec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005332,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.literal_before_input.sub.ivec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005333,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.literal_before_input.sub.uvec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005334,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.literal_before_input.sub.uvec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005335,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.literal_before_input.sub.ivec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005336,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.literal_before_input.sub.ivec4_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005337,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.literal_before_input.sub.uvec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005338,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.literal_before_input.sub.uvec4_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006345,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.literal_before_input.sub.int_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006346,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.literal_before_input.sub.int_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006347,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "2.arithmetic.literal_before_input.sub.int_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006348,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.literal_before_input.sub.int_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006349,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "2.arithmetic.literal_before_input.sub.int_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006350,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.literal_before_input.sub.int_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006351,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "2.arithmetic.literal_before_input.sub.int_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006352,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.literal_before_input.sub.int_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006353,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.literal_before_input.sub.uint_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006354,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.literal_before_input.sub.uint_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006355,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.literal_before_input.sub.uint_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006356,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.literal_before_input.sub.uint_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006357,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.literal_before_input.sub.uint_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006358,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.literal_before_input.sub.uint_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006359,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.literal_before_input.sub.uint_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006360,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.literal_before_input.sub.uint_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006361,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.literal_before_input.sub.ivec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006362,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.literal_before_input.sub.ivec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006363,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.literal_before_input.sub.uvec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006364,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.literal_before_input.sub.uvec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006365,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.literal_before_input.sub.ivec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006366,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.literal_before_input.sub.ivec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006367,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.literal_before_input.sub.uvec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006368,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.literal_before_input.sub.uvec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006369,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.literal_before_input.sub.ivec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006370,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.literal_before_input.sub.ivec4_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006371,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.literal_before_input.sub.uvec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006372,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.literal_before_input.sub.uvec4_to_vec4_fragment");
