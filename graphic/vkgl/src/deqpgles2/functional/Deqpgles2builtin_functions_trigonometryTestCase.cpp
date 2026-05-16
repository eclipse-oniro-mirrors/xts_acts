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
#include "../ActsDeqpgles20008TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007902,
        "dEQP-GLES2.functional.shaders.constant_expressions.",
        "builtin_functions.trigonometry.radians_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007903,
        "dEQP-GLES2.functional.shaders.constant_expressions.b",
        "uiltin_functions.trigonometry.radians_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007904,
        "dEQP-GLES2.functional.shaders.constant_expressions",
        ".builtin_functions.trigonometry.radians_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007905,
        "dEQP-GLES2.functional.shaders.constant_expressions.",
        "builtin_functions.trigonometry.radians_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007906,
        "dEQP-GLES2.functional.shaders.constant_expressions",
        ".builtin_functions.trigonometry.radians_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007907,
        "dEQP-GLES2.functional.shaders.constant_expressions.",
        "builtin_functions.trigonometry.radians_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007908,
        "dEQP-GLES2.functional.shaders.constant_expressions",
        ".builtin_functions.trigonometry.radians_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007909,
        "dEQP-GLES2.functional.shaders.constant_expressions.",
        "builtin_functions.trigonometry.radians_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007910,
        "dEQP-GLES2.functional.shaders.constant_expressions.",
        "builtin_functions.trigonometry.degrees_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007911,
        "dEQP-GLES2.functional.shaders.constant_expressions.b",
        "uiltin_functions.trigonometry.degrees_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007912,
        "dEQP-GLES2.functional.shaders.constant_expressions",
        ".builtin_functions.trigonometry.degrees_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007913,
        "dEQP-GLES2.functional.shaders.constant_expressions.",
        "builtin_functions.trigonometry.degrees_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007914,
        "dEQP-GLES2.functional.shaders.constant_expressions",
        ".builtin_functions.trigonometry.degrees_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007915,
        "dEQP-GLES2.functional.shaders.constant_expressions.",
        "builtin_functions.trigonometry.degrees_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007916,
        "dEQP-GLES2.functional.shaders.constant_expressions",
        ".builtin_functions.trigonometry.degrees_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007917,
        "dEQP-GLES2.functional.shaders.constant_expressions.",
        "builtin_functions.trigonometry.degrees_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007918,
        "dEQP-GLES2.functional.shaders.constant_expression",
        "s.builtin_functions.trigonometry.sin_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007919,
        "dEQP-GLES2.functional.shaders.constant_expressions",
        ".builtin_functions.trigonometry.sin_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007920,
        "dEQP-GLES2.functional.shaders.constant_expressio",
        "ns.builtin_functions.trigonometry.sin_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007921,
        "dEQP-GLES2.functional.shaders.constant_expression",
        "s.builtin_functions.trigonometry.sin_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007922,
        "dEQP-GLES2.functional.shaders.constant_expressio",
        "ns.builtin_functions.trigonometry.sin_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007923,
        "dEQP-GLES2.functional.shaders.constant_expression",
        "s.builtin_functions.trigonometry.sin_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007924,
        "dEQP-GLES2.functional.shaders.constant_expressio",
        "ns.builtin_functions.trigonometry.sin_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007925,
        "dEQP-GLES2.functional.shaders.constant_expression",
        "s.builtin_functions.trigonometry.sin_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007926,
        "dEQP-GLES2.functional.shaders.constant_expression",
        "s.builtin_functions.trigonometry.cos_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007927,
        "dEQP-GLES2.functional.shaders.constant_expressions",
        ".builtin_functions.trigonometry.cos_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007928,
        "dEQP-GLES2.functional.shaders.constant_expressio",
        "ns.builtin_functions.trigonometry.cos_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007929,
        "dEQP-GLES2.functional.shaders.constant_expression",
        "s.builtin_functions.trigonometry.cos_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007930,
        "dEQP-GLES2.functional.shaders.constant_expressio",
        "ns.builtin_functions.trigonometry.cos_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007931,
        "dEQP-GLES2.functional.shaders.constant_expression",
        "s.builtin_functions.trigonometry.cos_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007932,
        "dEQP-GLES2.functional.shaders.constant_expressio",
        "ns.builtin_functions.trigonometry.cos_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007933,
        "dEQP-GLES2.functional.shaders.constant_expression",
        "s.builtin_functions.trigonometry.cos_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007934,
        "dEQP-GLES2.functional.shaders.constant_expression",
        "s.builtin_functions.trigonometry.tan_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007935,
        "dEQP-GLES2.functional.shaders.constant_expressions",
        ".builtin_functions.trigonometry.tan_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007936,
        "dEQP-GLES2.functional.shaders.constant_expressio",
        "ns.builtin_functions.trigonometry.tan_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007937,
        "dEQP-GLES2.functional.shaders.constant_expression",
        "s.builtin_functions.trigonometry.tan_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007938,
        "dEQP-GLES2.functional.shaders.constant_expressio",
        "ns.builtin_functions.trigonometry.tan_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007939,
        "dEQP-GLES2.functional.shaders.constant_expression",
        "s.builtin_functions.trigonometry.tan_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007940,
        "dEQP-GLES2.functional.shaders.constant_expressio",
        "ns.builtin_functions.trigonometry.tan_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007941,
        "dEQP-GLES2.functional.shaders.constant_expression",
        "s.builtin_functions.trigonometry.tan_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007942,
        "dEQP-GLES2.functional.shaders.constant_expression",
        "s.builtin_functions.trigonometry.asin_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007943,
        "dEQP-GLES2.functional.shaders.constant_expressions",
        ".builtin_functions.trigonometry.asin_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007944,
        "dEQP-GLES2.functional.shaders.constant_expression",
        "s.builtin_functions.trigonometry.asin_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007945,
        "dEQP-GLES2.functional.shaders.constant_expressions",
        ".builtin_functions.trigonometry.asin_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007946,
        "dEQP-GLES2.functional.shaders.constant_expression",
        "s.builtin_functions.trigonometry.asin_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007947,
        "dEQP-GLES2.functional.shaders.constant_expressions",
        ".builtin_functions.trigonometry.asin_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007948,
        "dEQP-GLES2.functional.shaders.constant_expression",
        "s.builtin_functions.trigonometry.asin_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007949,
        "dEQP-GLES2.functional.shaders.constant_expressions",
        ".builtin_functions.trigonometry.asin_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007950,
        "dEQP-GLES2.functional.shaders.constant_expression",
        "s.builtin_functions.trigonometry.acos_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007951,
        "dEQP-GLES2.functional.shaders.constant_expressions",
        ".builtin_functions.trigonometry.acos_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007952,
        "dEQP-GLES2.functional.shaders.constant_expression",
        "s.builtin_functions.trigonometry.acos_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007953,
        "dEQP-GLES2.functional.shaders.constant_expressions",
        ".builtin_functions.trigonometry.acos_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007954,
        "dEQP-GLES2.functional.shaders.constant_expression",
        "s.builtin_functions.trigonometry.acos_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007955,
        "dEQP-GLES2.functional.shaders.constant_expressions",
        ".builtin_functions.trigonometry.acos_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007956,
        "dEQP-GLES2.functional.shaders.constant_expression",
        "s.builtin_functions.trigonometry.acos_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007957,
        "dEQP-GLES2.functional.shaders.constant_expressions",
        ".builtin_functions.trigonometry.acos_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007958,
        "dEQP-GLES2.functional.shaders.constant_expressions.bui",
        "ltin_functions.trigonometry.atan_separate_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007959,
        "dEQP-GLES2.functional.shaders.constant_expressions.buil",
        "tin_functions.trigonometry.atan_separate_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007960,
        "dEQP-GLES2.functional.shaders.constant_expressions.bu",
        "iltin_functions.trigonometry.atan_separate_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007961,
        "dEQP-GLES2.functional.shaders.constant_expressions.bui",
        "ltin_functions.trigonometry.atan_separate_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007962,
        "dEQP-GLES2.functional.shaders.constant_expressions.bu",
        "iltin_functions.trigonometry.atan_separate_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007963,
        "dEQP-GLES2.functional.shaders.constant_expressions.bui",
        "ltin_functions.trigonometry.atan_separate_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007964,
        "dEQP-GLES2.functional.shaders.constant_expressions.bu",
        "iltin_functions.trigonometry.atan_separate_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007965,
        "dEQP-GLES2.functional.shaders.constant_expressions.bui",
        "ltin_functions.trigonometry.atan_separate_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007966,
        "dEQP-GLES2.functional.shaders.constant_expressions.bui",
        "ltin_functions.trigonometry.atan_combined_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007967,
        "dEQP-GLES2.functional.shaders.constant_expressions.buil",
        "tin_functions.trigonometry.atan_combined_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007968,
        "dEQP-GLES2.functional.shaders.constant_expressions.bu",
        "iltin_functions.trigonometry.atan_combined_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007969,
        "dEQP-GLES2.functional.shaders.constant_expressions.bui",
        "ltin_functions.trigonometry.atan_combined_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007970,
        "dEQP-GLES2.functional.shaders.constant_expressions.bu",
        "iltin_functions.trigonometry.atan_combined_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007971,
        "dEQP-GLES2.functional.shaders.constant_expressions.bui",
        "ltin_functions.trigonometry.atan_combined_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007972,
        "dEQP-GLES2.functional.shaders.constant_expressions.bu",
        "iltin_functions.trigonometry.atan_combined_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007973,
        "dEQP-GLES2.functional.shaders.constant_expressions.bui",
        "ltin_functions.trigonometry.atan_combined_vec4_fragment");
