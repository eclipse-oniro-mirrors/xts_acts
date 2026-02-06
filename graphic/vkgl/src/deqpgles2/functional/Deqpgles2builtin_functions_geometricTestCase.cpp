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

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008168,
        "dEQP-GLES2.functional.shaders.constant_expression",
        "s.builtin_functions.geometric.length_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008169,
        "dEQP-GLES2.functional.shaders.constant_expressions",
        ".builtin_functions.geometric.length_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008170,
        "dEQP-GLES2.functional.shaders.constant_expressio",
        "ns.builtin_functions.geometric.length_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008171,
        "dEQP-GLES2.functional.shaders.constant_expression",
        "s.builtin_functions.geometric.length_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008172,
        "dEQP-GLES2.functional.shaders.constant_expressio",
        "ns.builtin_functions.geometric.length_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008173,
        "dEQP-GLES2.functional.shaders.constant_expression",
        "s.builtin_functions.geometric.length_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008174,
        "dEQP-GLES2.functional.shaders.constant_expressio",
        "ns.builtin_functions.geometric.length_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008175,
        "dEQP-GLES2.functional.shaders.constant_expression",
        "s.builtin_functions.geometric.length_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008176,
        "dEQP-GLES2.functional.shaders.constant_expressions",
        ".builtin_functions.geometric.distance_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008177,
        "dEQP-GLES2.functional.shaders.constant_expressions.",
        "builtin_functions.geometric.distance_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008178,
        "dEQP-GLES2.functional.shaders.constant_expression",
        "s.builtin_functions.geometric.distance_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008179,
        "dEQP-GLES2.functional.shaders.constant_expressions",
        ".builtin_functions.geometric.distance_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008180,
        "dEQP-GLES2.functional.shaders.constant_expression",
        "s.builtin_functions.geometric.distance_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008181,
        "dEQP-GLES2.functional.shaders.constant_expressions",
        ".builtin_functions.geometric.distance_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008182,
        "dEQP-GLES2.functional.shaders.constant_expression",
        "s.builtin_functions.geometric.distance_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008183,
        "dEQP-GLES2.functional.shaders.constant_expressions",
        ".builtin_functions.geometric.distance_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008184,
        "dEQP-GLES2.functional.shaders.constant_expressi",
        "ons.builtin_functions.geometric.dot_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008185,
        "dEQP-GLES2.functional.shaders.constant_expressio",
        "ns.builtin_functions.geometric.dot_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008186,
        "dEQP-GLES2.functional.shaders.constant_expressi",
        "ons.builtin_functions.geometric.dot_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008187,
        "dEQP-GLES2.functional.shaders.constant_expressio",
        "ns.builtin_functions.geometric.dot_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008188,
        "dEQP-GLES2.functional.shaders.constant_expressi",
        "ons.builtin_functions.geometric.dot_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008189,
        "dEQP-GLES2.functional.shaders.constant_expressio",
        "ns.builtin_functions.geometric.dot_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008190,
        "dEQP-GLES2.functional.shaders.constant_expressi",
        "ons.builtin_functions.geometric.dot_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008191,
        "dEQP-GLES2.functional.shaders.constant_expressio",
        "ns.builtin_functions.geometric.dot_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008192,
        "dEQP-GLES2.functional.shaders.constant_expressions",
        ".builtin_functions.geometric.normalize_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008193,
        "dEQP-GLES2.functional.shaders.constant_expressions.",
        "builtin_functions.geometric.normalize_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008194,
        "dEQP-GLES2.functional.shaders.constant_expressions",
        ".builtin_functions.geometric.normalize_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008195,
        "dEQP-GLES2.functional.shaders.constant_expressions.",
        "builtin_functions.geometric.normalize_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008196,
        "dEQP-GLES2.functional.shaders.constant_expressions",
        ".builtin_functions.geometric.normalize_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008197,
        "dEQP-GLES2.functional.shaders.constant_expressions.",
        "builtin_functions.geometric.normalize_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008198,
        "dEQP-GLES2.functional.shaders.constant_expressions",
        ".builtin_functions.geometric.normalize_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008199,
        "dEQP-GLES2.functional.shaders.constant_expressions.",
        "builtin_functions.geometric.normalize_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008200,
        "dEQP-GLES2.functional.shaders.constant_expressions.",
        "builtin_functions.geometric.faceforward_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008201,
        "dEQP-GLES2.functional.shaders.constant_expressions.b",
        "uiltin_functions.geometric.faceforward_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008202,
        "dEQP-GLES2.functional.shaders.constant_expressions.",
        "builtin_functions.geometric.faceforward_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008203,
        "dEQP-GLES2.functional.shaders.constant_expressions.b",
        "uiltin_functions.geometric.faceforward_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008204,
        "dEQP-GLES2.functional.shaders.constant_expressions.",
        "builtin_functions.geometric.faceforward_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008205,
        "dEQP-GLES2.functional.shaders.constant_expressions.b",
        "uiltin_functions.geometric.faceforward_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008206,
        "dEQP-GLES2.functional.shaders.constant_expressions.",
        "builtin_functions.geometric.faceforward_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008207,
        "dEQP-GLES2.functional.shaders.constant_expressions.b",
        "uiltin_functions.geometric.faceforward_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008208,
        "dEQP-GLES2.functional.shaders.constant_expression",
        "s.builtin_functions.geometric.reflect_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008209,
        "dEQP-GLES2.functional.shaders.constant_expressions",
        ".builtin_functions.geometric.reflect_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008210,
        "dEQP-GLES2.functional.shaders.constant_expression",
        "s.builtin_functions.geometric.reflect_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008211,
        "dEQP-GLES2.functional.shaders.constant_expressions",
        ".builtin_functions.geometric.reflect_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008212,
        "dEQP-GLES2.functional.shaders.constant_expression",
        "s.builtin_functions.geometric.reflect_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008213,
        "dEQP-GLES2.functional.shaders.constant_expressions",
        ".builtin_functions.geometric.reflect_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008214,
        "dEQP-GLES2.functional.shaders.constant_expression",
        "s.builtin_functions.geometric.reflect_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008215,
        "dEQP-GLES2.functional.shaders.constant_expressions",
        ".builtin_functions.geometric.reflect_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008216,
        "dEQP-GLES2.functional.shaders.constant_expression",
        "s.builtin_functions.geometric.refract_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008217,
        "dEQP-GLES2.functional.shaders.constant_expressions",
        ".builtin_functions.geometric.refract_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008218,
        "dEQP-GLES2.functional.shaders.constant_expression",
        "s.builtin_functions.geometric.refract_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008219,
        "dEQP-GLES2.functional.shaders.constant_expressions",
        ".builtin_functions.geometric.refract_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008220,
        "dEQP-GLES2.functional.shaders.constant_expression",
        "s.builtin_functions.geometric.refract_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008221,
        "dEQP-GLES2.functional.shaders.constant_expressions",
        ".builtin_functions.geometric.refract_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008222,
        "dEQP-GLES2.functional.shaders.constant_expression",
        "s.builtin_functions.geometric.refract_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008223,
        "dEQP-GLES2.functional.shaders.constant_expressions",
        ".builtin_functions.geometric.refract_vec4_fragment");
