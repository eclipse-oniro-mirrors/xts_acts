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

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005885,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_exp",
        "ressions.literal_before_paren_expr.input_outside_parens.int_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005886,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_expr",
        "essions.literal_before_paren_expr.input_outside_parens.int_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005887,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_exp",
        "ressions.literal_before_paren_expr.input_outside_parens.int_to_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005888,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_expr",
        "essions.literal_before_paren_expr.input_outside_parens.int_to_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005889,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_exp",
        "ressions.literal_before_paren_expr.input_outside_parens.int_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005890,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_expr",
        "essions.literal_before_paren_expr.input_outside_parens.int_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005891,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_exp",
        "ressions.literal_before_paren_expr.input_outside_parens.int_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005892,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_expr",
        "essions.literal_before_paren_expr.input_outside_parens.int_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005893,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_exp",
        "ressions.literal_before_paren_expr.input_outside_parens.int_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005894,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_expr",
        "essions.literal_before_paren_expr.input_outside_parens.int_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005895,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_exp",
        "ressions.literal_before_paren_expr.input_outside_parens.int_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005896,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_expr",
        "essions.literal_before_paren_expr.input_outside_parens.int_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005897,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_exp",
        "ressions.literal_before_paren_expr.input_outside_parens.int_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005898,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_expr",
        "essions.literal_before_paren_expr.input_outside_parens.int_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005899,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_exp",
        "ressions.literal_before_paren_expr.input_outside_parens.int_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005900,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_expr",
        "essions.literal_before_paren_expr.input_outside_parens.int_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005901,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_expr",
        "essions.literal_before_paren_expr.input_outside_parens.uint_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005902,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_expre",
        "ssions.literal_before_paren_expr.input_outside_parens.uint_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005903,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_exp",
        "ressions.literal_before_paren_expr.input_outside_parens.uint_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005904,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_expr",
        "essions.literal_before_paren_expr.input_outside_parens.uint_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005905,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_exp",
        "ressions.literal_before_paren_expr.input_outside_parens.uint_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005906,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_expr",
        "essions.literal_before_paren_expr.input_outside_parens.uint_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005907,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_exp",
        "ressions.literal_before_paren_expr.input_outside_parens.uint_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005908,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_expr",
        "essions.literal_before_paren_expr.input_outside_parens.uint_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005909,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_expr",
        "essions.literal_before_paren_expr.input_outside_parens.ivec2_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005910,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_expre",
        "ssions.literal_before_paren_expr.input_outside_parens.ivec2_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005911,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_expr",
        "essions.literal_before_paren_expr.input_outside_parens.ivec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005912,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_expre",
        "ssions.literal_before_paren_expr.input_outside_parens.ivec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005913,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_expr",
        "essions.literal_before_paren_expr.input_outside_parens.uvec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005914,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_expre",
        "ssions.literal_before_paren_expr.input_outside_parens.uvec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005915,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_expr",
        "essions.literal_before_paren_expr.input_outside_parens.ivec3_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005916,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_expre",
        "ssions.literal_before_paren_expr.input_outside_parens.ivec3_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005917,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_expr",
        "essions.literal_before_paren_expr.input_outside_parens.ivec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005918,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_expre",
        "ssions.literal_before_paren_expr.input_outside_parens.ivec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005919,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_expr",
        "essions.literal_before_paren_expr.input_outside_parens.uvec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005920,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_expre",
        "ssions.literal_before_paren_expr.input_outside_parens.uvec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005921,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_expr",
        "essions.literal_before_paren_expr.input_outside_parens.ivec4_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005922,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_expre",
        "ssions.literal_before_paren_expr.input_outside_parens.ivec4_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005923,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_expr",
        "essions.literal_before_paren_expr.input_outside_parens.ivec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005924,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_expre",
        "ssions.literal_before_paren_expr.input_outside_parens.ivec4_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005925,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_expr",
        "essions.literal_before_paren_expr.input_outside_parens.uvec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005926,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_expre",
        "ssions.literal_before_paren_expr.input_outside_parens.uvec4_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006919,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_exp",
        "ressions.literal_before_paren_expr.input_outside_parens.int_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006920,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_expr",
        "essions.literal_before_paren_expr.input_outside_parens.int_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006921,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_exp",
        "ressions.literal_before_paren_expr.input_outside_parens.int_to_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006922,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_expr",
        "essions.literal_before_paren_expr.input_outside_parens.int_to_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006923,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_exp",
        "ressions.literal_before_paren_expr.input_outside_parens.int_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006924,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_expr",
        "essions.literal_before_paren_expr.input_outside_parens.int_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006925,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_exp",
        "ressions.literal_before_paren_expr.input_outside_parens.int_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006926,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_expr",
        "essions.literal_before_paren_expr.input_outside_parens.int_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006927,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_exp",
        "ressions.literal_before_paren_expr.input_outside_parens.int_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006928,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_expr",
        "essions.literal_before_paren_expr.input_outside_parens.int_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006929,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_exp",
        "ressions.literal_before_paren_expr.input_outside_parens.int_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006930,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_expr",
        "essions.literal_before_paren_expr.input_outside_parens.int_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006931,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_exp",
        "ressions.literal_before_paren_expr.input_outside_parens.int_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006932,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_expr",
        "essions.literal_before_paren_expr.input_outside_parens.int_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006933,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_exp",
        "ressions.literal_before_paren_expr.input_outside_parens.int_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006934,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_expr",
        "essions.literal_before_paren_expr.input_outside_parens.int_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006935,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_expr",
        "essions.literal_before_paren_expr.input_outside_parens.uint_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006936,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_expre",
        "ssions.literal_before_paren_expr.input_outside_parens.uint_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006937,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_exp",
        "ressions.literal_before_paren_expr.input_outside_parens.uint_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006938,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_expr",
        "essions.literal_before_paren_expr.input_outside_parens.uint_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006939,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_exp",
        "ressions.literal_before_paren_expr.input_outside_parens.uint_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006940,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_expr",
        "essions.literal_before_paren_expr.input_outside_parens.uint_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006941,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_exp",
        "ressions.literal_before_paren_expr.input_outside_parens.uint_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006942,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_expr",
        "essions.literal_before_paren_expr.input_outside_parens.uint_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006943,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_expr",
        "essions.literal_before_paren_expr.input_outside_parens.ivec2_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006944,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_expre",
        "ssions.literal_before_paren_expr.input_outside_parens.ivec2_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006945,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_expr",
        "essions.literal_before_paren_expr.input_outside_parens.ivec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006946,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_expre",
        "ssions.literal_before_paren_expr.input_outside_parens.ivec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006947,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_expr",
        "essions.literal_before_paren_expr.input_outside_parens.uvec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006948,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_expre",
        "ssions.literal_before_paren_expr.input_outside_parens.uvec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006949,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_expr",
        "essions.literal_before_paren_expr.input_outside_parens.ivec3_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006950,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_expre",
        "ssions.literal_before_paren_expr.input_outside_parens.ivec3_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006951,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_expr",
        "essions.literal_before_paren_expr.input_outside_parens.ivec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006952,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_expre",
        "ssions.literal_before_paren_expr.input_outside_parens.ivec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006953,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_expr",
        "essions.literal_before_paren_expr.input_outside_parens.uvec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006954,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_expre",
        "ssions.literal_before_paren_expr.input_outside_parens.uvec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006955,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_expr",
        "essions.literal_before_paren_expr.input_outside_parens.ivec4_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006956,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_expre",
        "ssions.literal_before_paren_expr.input_outside_parens.ivec4_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006957,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_expr",
        "essions.literal_before_paren_expr.input_outside_parens.ivec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006958,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_expre",
        "ssions.literal_before_paren_expr.input_outside_parens.ivec4_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006959,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_expr",
        "essions.literal_before_paren_expr.input_outside_parens.uvec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006960,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_expre",
        "ssions.literal_before_paren_expr.input_outside_parens.uvec4_to_vec4_fragment");
