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

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005843,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_e",
        "xpressions.literal_before_paren_expr.input_in_parens.int_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005844,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_ex",
        "pressions.literal_before_paren_expr.input_in_parens.int_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005845,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_",
        "expressions.literal_before_paren_expr.input_in_parens.int_to_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005846,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_e",
        "xpressions.literal_before_paren_expr.input_in_parens.int_to_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005847,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_",
        "expressions.literal_before_paren_expr.input_in_parens.int_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005848,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_e",
        "xpressions.literal_before_paren_expr.input_in_parens.int_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005849,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_",
        "expressions.literal_before_paren_expr.input_in_parens.int_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005850,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_e",
        "xpressions.literal_before_paren_expr.input_in_parens.int_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005851,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_",
        "expressions.literal_before_paren_expr.input_in_parens.int_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005852,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_e",
        "xpressions.literal_before_paren_expr.input_in_parens.int_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005853,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_e",
        "xpressions.literal_before_paren_expr.input_in_parens.int_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005854,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_ex",
        "pressions.literal_before_paren_expr.input_in_parens.int_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005855,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_e",
        "xpressions.literal_before_paren_expr.input_in_parens.int_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005856,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_ex",
        "pressions.literal_before_paren_expr.input_in_parens.int_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005857,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_e",
        "xpressions.literal_before_paren_expr.input_in_parens.int_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005858,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_ex",
        "pressions.literal_before_paren_expr.input_in_parens.int_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005859,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_e",
        "xpressions.literal_before_paren_expr.input_in_parens.uint_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005860,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_ex",
        "pressions.literal_before_paren_expr.input_in_parens.uint_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005861,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_e",
        "xpressions.literal_before_paren_expr.input_in_parens.uint_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005862,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_ex",
        "pressions.literal_before_paren_expr.input_in_parens.uint_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005863,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_e",
        "xpressions.literal_before_paren_expr.input_in_parens.uint_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005864,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_ex",
        "pressions.literal_before_paren_expr.input_in_parens.uint_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005865,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_e",
        "xpressions.literal_before_paren_expr.input_in_parens.uint_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005866,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_ex",
        "pressions.literal_before_paren_expr.input_in_parens.uint_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005867,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_ex",
        "pressions.literal_before_paren_expr.input_in_parens.ivec2_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005868,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_exp",
        "ressions.literal_before_paren_expr.input_in_parens.ivec2_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005869,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_e",
        "xpressions.literal_before_paren_expr.input_in_parens.ivec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005870,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_ex",
        "pressions.literal_before_paren_expr.input_in_parens.ivec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005871,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_e",
        "xpressions.literal_before_paren_expr.input_in_parens.uvec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005872,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_ex",
        "pressions.literal_before_paren_expr.input_in_parens.uvec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005873,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_ex",
        "pressions.literal_before_paren_expr.input_in_parens.ivec3_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005874,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_exp",
        "ressions.literal_before_paren_expr.input_in_parens.ivec3_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005875,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_e",
        "xpressions.literal_before_paren_expr.input_in_parens.ivec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005876,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_ex",
        "pressions.literal_before_paren_expr.input_in_parens.ivec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005877,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_e",
        "xpressions.literal_before_paren_expr.input_in_parens.uvec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005878,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_ex",
        "pressions.literal_before_paren_expr.input_in_parens.uvec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005879,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_ex",
        "pressions.literal_before_paren_expr.input_in_parens.ivec4_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005880,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_exp",
        "ressions.literal_before_paren_expr.input_in_parens.ivec4_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005881,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_e",
        "xpressions.literal_before_paren_expr.input_in_parens.ivec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005882,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_ex",
        "pressions.literal_before_paren_expr.input_in_parens.ivec4_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005883,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_e",
        "xpressions.literal_before_paren_expr.input_in_parens.uvec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005884,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es31.parenthesized_ex",
        "pressions.literal_before_paren_expr.input_in_parens.uvec4_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006877,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_e",
        "xpressions.literal_before_paren_expr.input_in_parens.int_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006878,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_ex",
        "pressions.literal_before_paren_expr.input_in_parens.int_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006879,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_",
        "expressions.literal_before_paren_expr.input_in_parens.int_to_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006880,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_e",
        "xpressions.literal_before_paren_expr.input_in_parens.int_to_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006881,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_",
        "expressions.literal_before_paren_expr.input_in_parens.int_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006882,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_e",
        "xpressions.literal_before_paren_expr.input_in_parens.int_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006883,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_",
        "expressions.literal_before_paren_expr.input_in_parens.int_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006884,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_e",
        "xpressions.literal_before_paren_expr.input_in_parens.int_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006885,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_",
        "expressions.literal_before_paren_expr.input_in_parens.int_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006886,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_e",
        "xpressions.literal_before_paren_expr.input_in_parens.int_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006887,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_e",
        "xpressions.literal_before_paren_expr.input_in_parens.int_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006888,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_ex",
        "pressions.literal_before_paren_expr.input_in_parens.int_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006889,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_e",
        "xpressions.literal_before_paren_expr.input_in_parens.int_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006890,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_ex",
        "pressions.literal_before_paren_expr.input_in_parens.int_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006891,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_e",
        "xpressions.literal_before_paren_expr.input_in_parens.int_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006892,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_ex",
        "pressions.literal_before_paren_expr.input_in_parens.int_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006893,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_e",
        "xpressions.literal_before_paren_expr.input_in_parens.uint_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006894,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_ex",
        "pressions.literal_before_paren_expr.input_in_parens.uint_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006895,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_e",
        "xpressions.literal_before_paren_expr.input_in_parens.uint_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006896,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_ex",
        "pressions.literal_before_paren_expr.input_in_parens.uint_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006897,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_e",
        "xpressions.literal_before_paren_expr.input_in_parens.uint_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006898,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_ex",
        "pressions.literal_before_paren_expr.input_in_parens.uint_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006899,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_e",
        "xpressions.literal_before_paren_expr.input_in_parens.uint_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006900,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_ex",
        "pressions.literal_before_paren_expr.input_in_parens.uint_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006901,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_ex",
        "pressions.literal_before_paren_expr.input_in_parens.ivec2_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006902,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_exp",
        "ressions.literal_before_paren_expr.input_in_parens.ivec2_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006903,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_e",
        "xpressions.literal_before_paren_expr.input_in_parens.ivec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006904,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_ex",
        "pressions.literal_before_paren_expr.input_in_parens.ivec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006905,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_e",
        "xpressions.literal_before_paren_expr.input_in_parens.uvec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006906,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_ex",
        "pressions.literal_before_paren_expr.input_in_parens.uvec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006907,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_ex",
        "pressions.literal_before_paren_expr.input_in_parens.ivec3_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006908,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_exp",
        "ressions.literal_before_paren_expr.input_in_parens.ivec3_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006909,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_e",
        "xpressions.literal_before_paren_expr.input_in_parens.ivec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006910,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_ex",
        "pressions.literal_before_paren_expr.input_in_parens.ivec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006911,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_e",
        "xpressions.literal_before_paren_expr.input_in_parens.uvec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006912,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_ex",
        "pressions.literal_before_paren_expr.input_in_parens.uvec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006913,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_ex",
        "pressions.literal_before_paren_expr.input_in_parens.ivec4_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006914,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_exp",
        "ressions.literal_before_paren_expr.input_in_parens.ivec4_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006915,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_e",
        "xpressions.literal_before_paren_expr.input_in_parens.ivec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006916,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_ex",
        "pressions.literal_before_paren_expr.input_in_parens.ivec4_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006917,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_e",
        "xpressions.literal_before_paren_expr.input_in_parens.uvec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_006918,
        "dEQP-GLES31.functional.shaders.implicit_conversions.es32.parenthesized_ex",
        "pressions.literal_before_paren_expr.input_in_parens.uvec4_to_vec4_fragment");
