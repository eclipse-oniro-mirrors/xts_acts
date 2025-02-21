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
#include "../Deqpgles2BaseFunc.h"
#include "../ActsDeqpgles20009TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008030,
        "dEQP-GLES2.functional.shaders.constant_express",
        "ions.builtin_functions.common.abs_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008031,
        "dEQP-GLES2.functional.shaders.constant_expressi",
        "ons.builtin_functions.common.abs_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008032,
        "dEQP-GLES2.functional.shaders.constant_expres",
        "sions.builtin_functions.common.abs_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008033,
        "dEQP-GLES2.functional.shaders.constant_express",
        "ions.builtin_functions.common.abs_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008034,
        "dEQP-GLES2.functional.shaders.constant_expres",
        "sions.builtin_functions.common.abs_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008035,
        "dEQP-GLES2.functional.shaders.constant_express",
        "ions.builtin_functions.common.abs_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008036,
        "dEQP-GLES2.functional.shaders.constant_expres",
        "sions.builtin_functions.common.abs_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008037,
        "dEQP-GLES2.functional.shaders.constant_express",
        "ions.builtin_functions.common.abs_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008038,
        "dEQP-GLES2.functional.shaders.constant_express",
        "ions.builtin_functions.common.sign_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008039,
        "dEQP-GLES2.functional.shaders.constant_expressi",
        "ons.builtin_functions.common.sign_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008040,
        "dEQP-GLES2.functional.shaders.constant_express",
        "ions.builtin_functions.common.sign_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008041,
        "dEQP-GLES2.functional.shaders.constant_expressi",
        "ons.builtin_functions.common.sign_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008042,
        "dEQP-GLES2.functional.shaders.constant_express",
        "ions.builtin_functions.common.sign_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008043,
        "dEQP-GLES2.functional.shaders.constant_expressi",
        "ons.builtin_functions.common.sign_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008044,
        "dEQP-GLES2.functional.shaders.constant_express",
        "ions.builtin_functions.common.sign_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008045,
        "dEQP-GLES2.functional.shaders.constant_expressi",
        "ons.builtin_functions.common.sign_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008046,
        "dEQP-GLES2.functional.shaders.constant_expressi",
        "ons.builtin_functions.common.floor_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008047,
        "dEQP-GLES2.functional.shaders.constant_expressio",
        "ns.builtin_functions.common.floor_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008048,
        "dEQP-GLES2.functional.shaders.constant_express",
        "ions.builtin_functions.common.floor_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008049,
        "dEQP-GLES2.functional.shaders.constant_expressi",
        "ons.builtin_functions.common.floor_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008050,
        "dEQP-GLES2.functional.shaders.constant_express",
        "ions.builtin_functions.common.floor_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008051,
        "dEQP-GLES2.functional.shaders.constant_expressi",
        "ons.builtin_functions.common.floor_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008052,
        "dEQP-GLES2.functional.shaders.constant_express",
        "ions.builtin_functions.common.floor_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008053,
        "dEQP-GLES2.functional.shaders.constant_expressi",
        "ons.builtin_functions.common.floor_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008054,
        "dEQP-GLES2.functional.shaders.constant_express",
        "ions.builtin_functions.common.ceil_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008055,
        "dEQP-GLES2.functional.shaders.constant_expressi",
        "ons.builtin_functions.common.ceil_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008056,
        "dEQP-GLES2.functional.shaders.constant_express",
        "ions.builtin_functions.common.ceil_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008057,
        "dEQP-GLES2.functional.shaders.constant_expressi",
        "ons.builtin_functions.common.ceil_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008058,
        "dEQP-GLES2.functional.shaders.constant_express",
        "ions.builtin_functions.common.ceil_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008059,
        "dEQP-GLES2.functional.shaders.constant_expressi",
        "ons.builtin_functions.common.ceil_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008060,
        "dEQP-GLES2.functional.shaders.constant_express",
        "ions.builtin_functions.common.ceil_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008061,
        "dEQP-GLES2.functional.shaders.constant_expressi",
        "ons.builtin_functions.common.ceil_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008062,
        "dEQP-GLES2.functional.shaders.constant_expressi",
        "ons.builtin_functions.common.fract_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008063,
        "dEQP-GLES2.functional.shaders.constant_expressio",
        "ns.builtin_functions.common.fract_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008064,
        "dEQP-GLES2.functional.shaders.constant_express",
        "ions.builtin_functions.common.fract_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008065,
        "dEQP-GLES2.functional.shaders.constant_expressi",
        "ons.builtin_functions.common.fract_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008066,
        "dEQP-GLES2.functional.shaders.constant_express",
        "ions.builtin_functions.common.fract_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008067,
        "dEQP-GLES2.functional.shaders.constant_expressi",
        "ons.builtin_functions.common.fract_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008068,
        "dEQP-GLES2.functional.shaders.constant_express",
        "ions.builtin_functions.common.fract_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008069,
        "dEQP-GLES2.functional.shaders.constant_expressi",
        "ons.builtin_functions.common.fract_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008070,
        "dEQP-GLES2.functional.shaders.constant_express",
        "ions.builtin_functions.common.mod_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008071,
        "dEQP-GLES2.functional.shaders.constant_expressi",
        "ons.builtin_functions.common.mod_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008072,
        "dEQP-GLES2.functional.shaders.constant_expres",
        "sions.builtin_functions.common.mod_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008073,
        "dEQP-GLES2.functional.shaders.constant_express",
        "ions.builtin_functions.common.mod_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008074,
        "dEQP-GLES2.functional.shaders.constant_expressio",
        "ns.builtin_functions.common.mod_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008075,
        "dEQP-GLES2.functional.shaders.constant_expression",
        "s.builtin_functions.common.mod_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008076,
        "dEQP-GLES2.functional.shaders.constant_expres",
        "sions.builtin_functions.common.mod_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008077,
        "dEQP-GLES2.functional.shaders.constant_express",
        "ions.builtin_functions.common.mod_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008078,
        "dEQP-GLES2.functional.shaders.constant_expressio",
        "ns.builtin_functions.common.mod_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008079,
        "dEQP-GLES2.functional.shaders.constant_expression",
        "s.builtin_functions.common.mod_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008080,
        "dEQP-GLES2.functional.shaders.constant_expres",
        "sions.builtin_functions.common.mod_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008081,
        "dEQP-GLES2.functional.shaders.constant_express",
        "ions.builtin_functions.common.mod_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008082,
        "dEQP-GLES2.functional.shaders.constant_expressio",
        "ns.builtin_functions.common.mod_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008083,
        "dEQP-GLES2.functional.shaders.constant_expression",
        "s.builtin_functions.common.mod_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008084,
        "dEQP-GLES2.functional.shaders.constant_express",
        "ions.builtin_functions.common.min_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008085,
        "dEQP-GLES2.functional.shaders.constant_expressi",
        "ons.builtin_functions.common.min_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008086,
        "dEQP-GLES2.functional.shaders.constant_expres",
        "sions.builtin_functions.common.min_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008087,
        "dEQP-GLES2.functional.shaders.constant_express",
        "ions.builtin_functions.common.min_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008088,
        "dEQP-GLES2.functional.shaders.constant_expressio",
        "ns.builtin_functions.common.min_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008089,
        "dEQP-GLES2.functional.shaders.constant_expression",
        "s.builtin_functions.common.min_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008090,
        "dEQP-GLES2.functional.shaders.constant_expres",
        "sions.builtin_functions.common.min_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008091,
        "dEQP-GLES2.functional.shaders.constant_express",
        "ions.builtin_functions.common.min_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008092,
        "dEQP-GLES2.functional.shaders.constant_expressio",
        "ns.builtin_functions.common.min_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008093,
        "dEQP-GLES2.functional.shaders.constant_expression",
        "s.builtin_functions.common.min_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008094,
        "dEQP-GLES2.functional.shaders.constant_expres",
        "sions.builtin_functions.common.min_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008095,
        "dEQP-GLES2.functional.shaders.constant_express",
        "ions.builtin_functions.common.min_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008096,
        "dEQP-GLES2.functional.shaders.constant_expressio",
        "ns.builtin_functions.common.min_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008097,
        "dEQP-GLES2.functional.shaders.constant_expression",
        "s.builtin_functions.common.min_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008098,
        "dEQP-GLES2.functional.shaders.constant_express",
        "ions.builtin_functions.common.max_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008099,
        "dEQP-GLES2.functional.shaders.constant_expressi",
        "ons.builtin_functions.common.max_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008100,
        "dEQP-GLES2.functional.shaders.constant_expres",
        "sions.builtin_functions.common.max_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008101,
        "dEQP-GLES2.functional.shaders.constant_express",
        "ions.builtin_functions.common.max_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008102,
        "dEQP-GLES2.functional.shaders.constant_expressio",
        "ns.builtin_functions.common.max_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008103,
        "dEQP-GLES2.functional.shaders.constant_expression",
        "s.builtin_functions.common.max_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008104,
        "dEQP-GLES2.functional.shaders.constant_expres",
        "sions.builtin_functions.common.max_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008105,
        "dEQP-GLES2.functional.shaders.constant_express",
        "ions.builtin_functions.common.max_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008106,
        "dEQP-GLES2.functional.shaders.constant_expressio",
        "ns.builtin_functions.common.max_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008107,
        "dEQP-GLES2.functional.shaders.constant_expression",
        "s.builtin_functions.common.max_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008108,
        "dEQP-GLES2.functional.shaders.constant_expres",
        "sions.builtin_functions.common.max_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008109,
        "dEQP-GLES2.functional.shaders.constant_express",
        "ions.builtin_functions.common.max_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008110,
        "dEQP-GLES2.functional.shaders.constant_expressio",
        "ns.builtin_functions.common.max_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008111,
        "dEQP-GLES2.functional.shaders.constant_expression",
        "s.builtin_functions.common.max_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008112,
        "dEQP-GLES2.functional.shaders.constant_expressi",
        "ons.builtin_functions.common.clamp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008113,
        "dEQP-GLES2.functional.shaders.constant_expressio",
        "ns.builtin_functions.common.clamp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008114,
        "dEQP-GLES2.functional.shaders.constant_express",
        "ions.builtin_functions.common.clamp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008115,
        "dEQP-GLES2.functional.shaders.constant_expressi",
        "ons.builtin_functions.common.clamp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008116,
        "dEQP-GLES2.functional.shaders.constant_expression",
        "s.builtin_functions.common.clamp_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008117,
        "dEQP-GLES2.functional.shaders.constant_expressions",
        ".builtin_functions.common.clamp_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008118,
        "dEQP-GLES2.functional.shaders.constant_express",
        "ions.builtin_functions.common.clamp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008119,
        "dEQP-GLES2.functional.shaders.constant_expressi",
        "ons.builtin_functions.common.clamp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008120,
        "dEQP-GLES2.functional.shaders.constant_expression",
        "s.builtin_functions.common.clamp_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008121,
        "dEQP-GLES2.functional.shaders.constant_expressions",
        ".builtin_functions.common.clamp_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008122,
        "dEQP-GLES2.functional.shaders.constant_express",
        "ions.builtin_functions.common.clamp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008123,
        "dEQP-GLES2.functional.shaders.constant_expressi",
        "ons.builtin_functions.common.clamp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008124,
        "dEQP-GLES2.functional.shaders.constant_expression",
        "s.builtin_functions.common.clamp_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008125,
        "dEQP-GLES2.functional.shaders.constant_expressions",
        ".builtin_functions.common.clamp_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008126,
        "dEQP-GLES2.functional.shaders.constant_express",
        "ions.builtin_functions.common.mix_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008127,
        "dEQP-GLES2.functional.shaders.constant_expressi",
        "ons.builtin_functions.common.mix_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008128,
        "dEQP-GLES2.functional.shaders.constant_expres",
        "sions.builtin_functions.common.mix_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008129,
        "dEQP-GLES2.functional.shaders.constant_express",
        "ions.builtin_functions.common.mix_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008130,
        "dEQP-GLES2.functional.shaders.constant_expressio",
        "ns.builtin_functions.common.mix_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008131,
        "dEQP-GLES2.functional.shaders.constant_expression",
        "s.builtin_functions.common.mix_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008132,
        "dEQP-GLES2.functional.shaders.constant_expres",
        "sions.builtin_functions.common.mix_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008133,
        "dEQP-GLES2.functional.shaders.constant_express",
        "ions.builtin_functions.common.mix_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008134,
        "dEQP-GLES2.functional.shaders.constant_expressio",
        "ns.builtin_functions.common.mix_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008135,
        "dEQP-GLES2.functional.shaders.constant_expression",
        "s.builtin_functions.common.mix_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008136,
        "dEQP-GLES2.functional.shaders.constant_expres",
        "sions.builtin_functions.common.mix_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008137,
        "dEQP-GLES2.functional.shaders.constant_express",
        "ions.builtin_functions.common.mix_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008138,
        "dEQP-GLES2.functional.shaders.constant_expressio",
        "ns.builtin_functions.common.mix_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008139,
        "dEQP-GLES2.functional.shaders.constant_expression",
        "s.builtin_functions.common.mix_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008140,
        "dEQP-GLES2.functional.shaders.constant_express",
        "ions.builtin_functions.common.step_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008141,
        "dEQP-GLES2.functional.shaders.constant_expressi",
        "ons.builtin_functions.common.step_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008142,
        "dEQP-GLES2.functional.shaders.constant_express",
        "ions.builtin_functions.common.step_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008143,
        "dEQP-GLES2.functional.shaders.constant_expressi",
        "ons.builtin_functions.common.step_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008144,
        "dEQP-GLES2.functional.shaders.constant_expression",
        "s.builtin_functions.common.step_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008145,
        "dEQP-GLES2.functional.shaders.constant_expressions",
        ".builtin_functions.common.step_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008146,
        "dEQP-GLES2.functional.shaders.constant_express",
        "ions.builtin_functions.common.step_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008147,
        "dEQP-GLES2.functional.shaders.constant_expressi",
        "ons.builtin_functions.common.step_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008148,
        "dEQP-GLES2.functional.shaders.constant_expression",
        "s.builtin_functions.common.step_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008149,
        "dEQP-GLES2.functional.shaders.constant_expressions",
        ".builtin_functions.common.step_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008150,
        "dEQP-GLES2.functional.shaders.constant_express",
        "ions.builtin_functions.common.step_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008151,
        "dEQP-GLES2.functional.shaders.constant_expressi",
        "ons.builtin_functions.common.step_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008152,
        "dEQP-GLES2.functional.shaders.constant_expression",
        "s.builtin_functions.common.step_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008153,
        "dEQP-GLES2.functional.shaders.constant_expressions",
        ".builtin_functions.common.step_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008154,
        "dEQP-GLES2.functional.shaders.constant_expression",
        "s.builtin_functions.common.smoothstep_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008155,
        "dEQP-GLES2.functional.shaders.constant_expressions",
        ".builtin_functions.common.smoothstep_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008156,
        "dEQP-GLES2.functional.shaders.constant_expression",
        "s.builtin_functions.common.smoothstep_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008157,
        "dEQP-GLES2.functional.shaders.constant_expressions",
        ".builtin_functions.common.smoothstep_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008158,
        "dEQP-GLES2.functional.shaders.constant_expressions.b",
        "uiltin_functions.common.smoothstep_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008159,
        "dEQP-GLES2.functional.shaders.constant_expressions.bu",
        "iltin_functions.common.smoothstep_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008160,
        "dEQP-GLES2.functional.shaders.constant_expression",
        "s.builtin_functions.common.smoothstep_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008161,
        "dEQP-GLES2.functional.shaders.constant_expressions",
        ".builtin_functions.common.smoothstep_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008162,
        "dEQP-GLES2.functional.shaders.constant_expressions.b",
        "uiltin_functions.common.smoothstep_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008163,
        "dEQP-GLES2.functional.shaders.constant_expressions.bu",
        "iltin_functions.common.smoothstep_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008164,
        "dEQP-GLES2.functional.shaders.constant_expression",
        "s.builtin_functions.common.smoothstep_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008165,
        "dEQP-GLES2.functional.shaders.constant_expressions",
        ".builtin_functions.common.smoothstep_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008166,
        "dEQP-GLES2.functional.shaders.constant_expressions.b",
        "uiltin_functions.common.smoothstep_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008167,
        "dEQP-GLES2.functional.shaders.constant_expressions.bu",
        "iltin_functions.common.smoothstep_vec4_float_fragment");
