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

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005759,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_e",
        "xpressions.paren_expr_before_literal.input_in_parens.int_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005760,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_ex",
        "pressions.paren_expr_before_literal.input_in_parens.int_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005761,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_",
        "expressions.paren_expr_before_literal.input_in_parens.int_to_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005762,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_e",
        "xpressions.paren_expr_before_literal.input_in_parens.int_to_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005763,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_",
        "expressions.paren_expr_before_literal.input_in_parens.int_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005764,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_e",
        "xpressions.paren_expr_before_literal.input_in_parens.int_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005765,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_",
        "expressions.paren_expr_before_literal.input_in_parens.int_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005766,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_e",
        "xpressions.paren_expr_before_literal.input_in_parens.int_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005767,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_",
        "expressions.paren_expr_before_literal.input_in_parens.int_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005768,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_e",
        "xpressions.paren_expr_before_literal.input_in_parens.int_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005769,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_e",
        "xpressions.paren_expr_before_literal.input_in_parens.int_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005770,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_ex",
        "pressions.paren_expr_before_literal.input_in_parens.int_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005771,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_e",
        "xpressions.paren_expr_before_literal.input_in_parens.int_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005772,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_ex",
        "pressions.paren_expr_before_literal.input_in_parens.int_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005773,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_e",
        "xpressions.paren_expr_before_literal.input_in_parens.int_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005774,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_ex",
        "pressions.paren_expr_before_literal.input_in_parens.int_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005775,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_e",
        "xpressions.paren_expr_before_literal.input_in_parens.uint_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005776,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_ex",
        "pressions.paren_expr_before_literal.input_in_parens.uint_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005777,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_e",
        "xpressions.paren_expr_before_literal.input_in_parens.uint_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005778,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_ex",
        "pressions.paren_expr_before_literal.input_in_parens.uint_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005779,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_e",
        "xpressions.paren_expr_before_literal.input_in_parens.uint_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005780,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_ex",
        "pressions.paren_expr_before_literal.input_in_parens.uint_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005781,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_e",
        "xpressions.paren_expr_before_literal.input_in_parens.uint_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005782,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_ex",
        "pressions.paren_expr_before_literal.input_in_parens.uint_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005783,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_ex",
        "pressions.paren_expr_before_literal.input_in_parens.ivec2_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005784,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_exp",
        "ressions.paren_expr_before_literal.input_in_parens.ivec2_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005785,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_e",
        "xpressions.paren_expr_before_literal.input_in_parens.ivec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005786,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_ex",
        "pressions.paren_expr_before_literal.input_in_parens.ivec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005787,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_e",
        "xpressions.paren_expr_before_literal.input_in_parens.uvec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005788,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_ex",
        "pressions.paren_expr_before_literal.input_in_parens.uvec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005789,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_ex",
        "pressions.paren_expr_before_literal.input_in_parens.ivec3_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005790,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_exp",
        "ressions.paren_expr_before_literal.input_in_parens.ivec3_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005791,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_e",
        "xpressions.paren_expr_before_literal.input_in_parens.ivec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005792,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_ex",
        "pressions.paren_expr_before_literal.input_in_parens.ivec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005793,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_e",
        "xpressions.paren_expr_before_literal.input_in_parens.uvec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005794,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_ex",
        "pressions.paren_expr_before_literal.input_in_parens.uvec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005795,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_ex",
        "pressions.paren_expr_before_literal.input_in_parens.ivec4_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005796,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_exp",
        "ressions.paren_expr_before_literal.input_in_parens.ivec4_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005797,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_e",
        "xpressions.paren_expr_before_literal.input_in_parens.ivec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005798,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_ex",
        "pressions.paren_expr_before_literal.input_in_parens.ivec4_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005799,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_e",
        "xpressions.paren_expr_before_literal.input_in_parens.uvec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005800,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_ex",
        "pressions.paren_expr_before_literal.input_in_parens.uvec4_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006793,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_e",
        "xpressions.paren_expr_before_literal.input_in_parens.int_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006794,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_ex",
        "pressions.paren_expr_before_literal.input_in_parens.int_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006795,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_",
        "expressions.paren_expr_before_literal.input_in_parens.int_to_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006796,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_e",
        "xpressions.paren_expr_before_literal.input_in_parens.int_to_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006797,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_",
        "expressions.paren_expr_before_literal.input_in_parens.int_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006798,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_e",
        "xpressions.paren_expr_before_literal.input_in_parens.int_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006799,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_",
        "expressions.paren_expr_before_literal.input_in_parens.int_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006800,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_e",
        "xpressions.paren_expr_before_literal.input_in_parens.int_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006801,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_",
        "expressions.paren_expr_before_literal.input_in_parens.int_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006802,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_e",
        "xpressions.paren_expr_before_literal.input_in_parens.int_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006803,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_e",
        "xpressions.paren_expr_before_literal.input_in_parens.int_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006804,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_ex",
        "pressions.paren_expr_before_literal.input_in_parens.int_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006805,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_e",
        "xpressions.paren_expr_before_literal.input_in_parens.int_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006806,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_ex",
        "pressions.paren_expr_before_literal.input_in_parens.int_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006807,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_e",
        "xpressions.paren_expr_before_literal.input_in_parens.int_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006808,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_ex",
        "pressions.paren_expr_before_literal.input_in_parens.int_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006809,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_e",
        "xpressions.paren_expr_before_literal.input_in_parens.uint_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006810,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_ex",
        "pressions.paren_expr_before_literal.input_in_parens.uint_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006811,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_e",
        "xpressions.paren_expr_before_literal.input_in_parens.uint_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006812,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_ex",
        "pressions.paren_expr_before_literal.input_in_parens.uint_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006813,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_e",
        "xpressions.paren_expr_before_literal.input_in_parens.uint_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006814,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_ex",
        "pressions.paren_expr_before_literal.input_in_parens.uint_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006815,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_e",
        "xpressions.paren_expr_before_literal.input_in_parens.uint_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006816,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_ex",
        "pressions.paren_expr_before_literal.input_in_parens.uint_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006817,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_ex",
        "pressions.paren_expr_before_literal.input_in_parens.ivec2_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006818,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_exp",
        "ressions.paren_expr_before_literal.input_in_parens.ivec2_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006819,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_e",
        "xpressions.paren_expr_before_literal.input_in_parens.ivec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006820,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_ex",
        "pressions.paren_expr_before_literal.input_in_parens.ivec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006821,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_e",
        "xpressions.paren_expr_before_literal.input_in_parens.uvec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006822,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_ex",
        "pressions.paren_expr_before_literal.input_in_parens.uvec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006823,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_ex",
        "pressions.paren_expr_before_literal.input_in_parens.ivec3_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006824,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_exp",
        "ressions.paren_expr_before_literal.input_in_parens.ivec3_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006825,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_e",
        "xpressions.paren_expr_before_literal.input_in_parens.ivec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006826,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_ex",
        "pressions.paren_expr_before_literal.input_in_parens.ivec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006827,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_e",
        "xpressions.paren_expr_before_literal.input_in_parens.uvec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006828,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_ex",
        "pressions.paren_expr_before_literal.input_in_parens.uvec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006829,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_ex",
        "pressions.paren_expr_before_literal.input_in_parens.ivec4_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006830,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_exp",
        "ressions.paren_expr_before_literal.input_in_parens.ivec4_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006831,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_e",
        "xpressions.paren_expr_before_literal.input_in_parens.ivec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006832,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_ex",
        "pressions.paren_expr_before_literal.input_in_parens.ivec4_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006833,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_e",
        "xpressions.paren_expr_before_literal.input_in_parens.uvec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006834,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_ex",
        "pressions.paren_expr_before_literal.input_in_parens.uvec4_to_vec4_fragment");
