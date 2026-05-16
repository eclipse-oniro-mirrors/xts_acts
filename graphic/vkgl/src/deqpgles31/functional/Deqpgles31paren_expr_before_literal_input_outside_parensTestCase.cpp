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

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005801,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_exp",
        "ressions.paren_expr_before_literal.input_outside_parens.int_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005802,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_expr",
        "essions.paren_expr_before_literal.input_outside_parens.int_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005803,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_exp",
        "ressions.paren_expr_before_literal.input_outside_parens.int_to_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005804,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_expr",
        "essions.paren_expr_before_literal.input_outside_parens.int_to_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005805,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_exp",
        "ressions.paren_expr_before_literal.input_outside_parens.int_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005806,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_expr",
        "essions.paren_expr_before_literal.input_outside_parens.int_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005807,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_exp",
        "ressions.paren_expr_before_literal.input_outside_parens.int_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005808,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_expr",
        "essions.paren_expr_before_literal.input_outside_parens.int_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005809,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_exp",
        "ressions.paren_expr_before_literal.input_outside_parens.int_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005810,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_expr",
        "essions.paren_expr_before_literal.input_outside_parens.int_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005811,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_exp",
        "ressions.paren_expr_before_literal.input_outside_parens.int_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005812,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_expr",
        "essions.paren_expr_before_literal.input_outside_parens.int_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005813,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_exp",
        "ressions.paren_expr_before_literal.input_outside_parens.int_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005814,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_expr",
        "essions.paren_expr_before_literal.input_outside_parens.int_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005815,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_exp",
        "ressions.paren_expr_before_literal.input_outside_parens.int_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005816,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_expr",
        "essions.paren_expr_before_literal.input_outside_parens.int_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005817,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_expr",
        "essions.paren_expr_before_literal.input_outside_parens.uint_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005818,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_expre",
        "ssions.paren_expr_before_literal.input_outside_parens.uint_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005819,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_exp",
        "ressions.paren_expr_before_literal.input_outside_parens.uint_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005820,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_expr",
        "essions.paren_expr_before_literal.input_outside_parens.uint_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005821,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_exp",
        "ressions.paren_expr_before_literal.input_outside_parens.uint_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005822,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_expr",
        "essions.paren_expr_before_literal.input_outside_parens.uint_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005823,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_exp",
        "ressions.paren_expr_before_literal.input_outside_parens.uint_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005824,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_expr",
        "essions.paren_expr_before_literal.input_outside_parens.uint_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005825,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_expr",
        "essions.paren_expr_before_literal.input_outside_parens.ivec2_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005826,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_expre",
        "ssions.paren_expr_before_literal.input_outside_parens.ivec2_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005827,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_expr",
        "essions.paren_expr_before_literal.input_outside_parens.ivec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005828,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_expre",
        "ssions.paren_expr_before_literal.input_outside_parens.ivec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005829,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_expr",
        "essions.paren_expr_before_literal.input_outside_parens.uvec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005830,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_expre",
        "ssions.paren_expr_before_literal.input_outside_parens.uvec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005831,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_expr",
        "essions.paren_expr_before_literal.input_outside_parens.ivec3_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005832,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_expre",
        "ssions.paren_expr_before_literal.input_outside_parens.ivec3_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005833,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_expr",
        "essions.paren_expr_before_literal.input_outside_parens.ivec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005834,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_expre",
        "ssions.paren_expr_before_literal.input_outside_parens.ivec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005835,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_expr",
        "essions.paren_expr_before_literal.input_outside_parens.uvec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005836,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_expre",
        "ssions.paren_expr_before_literal.input_outside_parens.uvec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005837,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_expr",
        "essions.paren_expr_before_literal.input_outside_parens.ivec4_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005838,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_expre",
        "ssions.paren_expr_before_literal.input_outside_parens.ivec4_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005839,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_expr",
        "essions.paren_expr_before_literal.input_outside_parens.ivec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005840,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_expre",
        "ssions.paren_expr_before_literal.input_outside_parens.ivec4_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005841,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_expr",
        "essions.paren_expr_before_literal.input_outside_parens.uvec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005842,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_expre",
        "ssions.paren_expr_before_literal.input_outside_parens.uvec4_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006835,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_exp",
        "ressions.paren_expr_before_literal.input_outside_parens.int_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006836,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_expr",
        "essions.paren_expr_before_literal.input_outside_parens.int_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006837,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_exp",
        "ressions.paren_expr_before_literal.input_outside_parens.int_to_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006838,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_expr",
        "essions.paren_expr_before_literal.input_outside_parens.int_to_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006839,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_exp",
        "ressions.paren_expr_before_literal.input_outside_parens.int_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006840,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_expr",
        "essions.paren_expr_before_literal.input_outside_parens.int_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006841,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_exp",
        "ressions.paren_expr_before_literal.input_outside_parens.int_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006842,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_expr",
        "essions.paren_expr_before_literal.input_outside_parens.int_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006843,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_exp",
        "ressions.paren_expr_before_literal.input_outside_parens.int_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006844,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_expr",
        "essions.paren_expr_before_literal.input_outside_parens.int_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006845,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_exp",
        "ressions.paren_expr_before_literal.input_outside_parens.int_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006846,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_expr",
        "essions.paren_expr_before_literal.input_outside_parens.int_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006847,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_exp",
        "ressions.paren_expr_before_literal.input_outside_parens.int_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006848,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_expr",
        "essions.paren_expr_before_literal.input_outside_parens.int_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006849,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_exp",
        "ressions.paren_expr_before_literal.input_outside_parens.int_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006850,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_expr",
        "essions.paren_expr_before_literal.input_outside_parens.int_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006851,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_expr",
        "essions.paren_expr_before_literal.input_outside_parens.uint_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006852,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_expre",
        "ssions.paren_expr_before_literal.input_outside_parens.uint_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006853,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_exp",
        "ressions.paren_expr_before_literal.input_outside_parens.uint_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006854,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_expr",
        "essions.paren_expr_before_literal.input_outside_parens.uint_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006855,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_exp",
        "ressions.paren_expr_before_literal.input_outside_parens.uint_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006856,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_expr",
        "essions.paren_expr_before_literal.input_outside_parens.uint_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006857,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_exp",
        "ressions.paren_expr_before_literal.input_outside_parens.uint_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006858,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_expr",
        "essions.paren_expr_before_literal.input_outside_parens.uint_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006859,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_expr",
        "essions.paren_expr_before_literal.input_outside_parens.ivec2_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006860,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_expre",
        "ssions.paren_expr_before_literal.input_outside_parens.ivec2_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006861,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_expr",
        "essions.paren_expr_before_literal.input_outside_parens.ivec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006862,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_expre",
        "ssions.paren_expr_before_literal.input_outside_parens.ivec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006863,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_expr",
        "essions.paren_expr_before_literal.input_outside_parens.uvec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006864,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_expre",
        "ssions.paren_expr_before_literal.input_outside_parens.uvec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006865,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_expr",
        "essions.paren_expr_before_literal.input_outside_parens.ivec3_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006866,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_expre",
        "ssions.paren_expr_before_literal.input_outside_parens.ivec3_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006867,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_expr",
        "essions.paren_expr_before_literal.input_outside_parens.ivec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006868,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_expre",
        "ssions.paren_expr_before_literal.input_outside_parens.ivec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006869,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_expr",
        "essions.paren_expr_before_literal.input_outside_parens.uvec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006870,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_expre",
        "ssions.paren_expr_before_literal.input_outside_parens.uvec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006871,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_expr",
        "essions.paren_expr_before_literal.input_outside_parens.ivec4_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006872,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_expre",
        "ssions.paren_expr_before_literal.input_outside_parens.ivec4_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006873,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_expr",
        "essions.paren_expr_before_literal.input_outside_parens.ivec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006874,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_expre",
        "ssions.paren_expr_before_literal.input_outside_parens.ivec4_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006875,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_expr",
        "essions.paren_expr_before_literal.input_outside_parens.uvec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006876,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_expre",
        "ssions.paren_expr_before_literal.input_outside_parens.uvec4_to_vec4_fragment");
