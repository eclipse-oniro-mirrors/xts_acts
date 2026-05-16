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

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005115,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.input_before_literal.add.int_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005116,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.input_before_literal.add.int_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005117,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "1.arithmetic.input_before_literal.add.int_to_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005118,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.input_before_literal.add.int_to_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005119,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "1.arithmetic.input_before_literal.add.int_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005120,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.input_before_literal.add.int_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005121,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "1.arithmetic.input_before_literal.add.int_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005122,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.input_before_literal.add.int_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005123,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "1.arithmetic.input_before_literal.add.int_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005124,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.input_before_literal.add.int_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005125,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.input_before_literal.add.int_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005126,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.input_before_literal.add.int_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005127,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.input_before_literal.add.int_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005128,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.input_before_literal.add.int_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005129,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.input_before_literal.add.int_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005130,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.input_before_literal.add.int_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005131,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.input_before_literal.add.uint_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005132,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.input_before_literal.add.uint_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005133,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.input_before_literal.add.uint_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005134,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.input_before_literal.add.uint_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005135,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.input_before_literal.add.uint_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005136,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.input_before_literal.add.uint_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005137,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.input_before_literal.add.uint_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005138,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.input_before_literal.add.uint_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005139,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.input_before_literal.add.ivec2_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005140,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.a",
        "rithmetic.input_before_literal.add.ivec2_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005141,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.input_before_literal.add.ivec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005142,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.input_before_literal.add.ivec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005143,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.input_before_literal.add.uvec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005144,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.input_before_literal.add.uvec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005145,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.input_before_literal.add.ivec3_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005146,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.a",
        "rithmetic.input_before_literal.add.ivec3_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005147,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.input_before_literal.add.ivec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005148,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.input_before_literal.add.ivec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005149,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.input_before_literal.add.uvec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005150,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.input_before_literal.add.uvec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005151,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.input_before_literal.add.ivec4_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005152,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.a",
        "rithmetic.input_before_literal.add.ivec4_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005153,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.input_before_literal.add.ivec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005154,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.input_before_literal.add.ivec4_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005155,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31",
        ".arithmetic.input_before_literal.add.uvec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005156,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.",
        "arithmetic.input_before_literal.add.uvec4_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006149,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.input_before_literal.add.int_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006150,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.input_before_literal.add.int_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006151,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "2.arithmetic.input_before_literal.add.int_to_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006152,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.input_before_literal.add.int_to_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006153,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "2.arithmetic.input_before_literal.add.int_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006154,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.input_before_literal.add.int_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006155,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "2.arithmetic.input_before_literal.add.int_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006156,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.input_before_literal.add.int_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006157,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es3",
        "2.arithmetic.input_before_literal.add.int_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006158,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.input_before_literal.add.int_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006159,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.input_before_literal.add.int_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006160,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.input_before_literal.add.int_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006161,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.input_before_literal.add.int_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006162,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.input_before_literal.add.int_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006163,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.input_before_literal.add.int_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006164,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.input_before_literal.add.int_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006165,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.input_before_literal.add.uint_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006166,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.input_before_literal.add.uint_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006167,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.input_before_literal.add.uint_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006168,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.input_before_literal.add.uint_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006169,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.input_before_literal.add.uint_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006170,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.input_before_literal.add.uint_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006171,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.input_before_literal.add.uint_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006172,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.input_before_literal.add.uint_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006173,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.input_before_literal.add.ivec2_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006174,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.a",
        "rithmetic.input_before_literal.add.ivec2_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006175,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.input_before_literal.add.ivec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006176,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.input_before_literal.add.ivec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006177,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.input_before_literal.add.uvec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006178,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.input_before_literal.add.uvec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006179,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.input_before_literal.add.ivec3_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006180,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.a",
        "rithmetic.input_before_literal.add.ivec3_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006181,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.input_before_literal.add.ivec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006182,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.input_before_literal.add.ivec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006183,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.input_before_literal.add.uvec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006184,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.input_before_literal.add.uvec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006185,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.input_before_literal.add.ivec4_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006186,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.a",
        "rithmetic.input_before_literal.add.ivec4_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006187,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.input_before_literal.add.ivec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006188,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.input_before_literal.add.ivec4_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006189,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32",
        ".arithmetic.input_before_literal.add.uvec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006190,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.",
        "arithmetic.input_before_literal.add.uvec4_to_vec4_fragment");
