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
#include "../ActsDeqpgles20004TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003932,
        "dEQP-GLES2.functional.shaders.operator",
        ".unary_operator.plus.lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003933,
        "dEQP-GLES2.functional.shaders.operator.",
        "unary_operator.plus.lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003934,
        "dEQP-GLES2.functional.shaders.operator.",
        "unary_operator.plus.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003935,
        "dEQP-GLES2.functional.shaders.operator.u",
        "nary_operator.plus.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003936,
        "dEQP-GLES2.functional.shaders.operator",
        ".unary_operator.plus.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003937,
        "dEQP-GLES2.functional.shaders.operator.",
        "unary_operator.plus.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003938,
        "dEQP-GLES2.functional.shaders.operato",
        "r.unary_operator.plus.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003939,
        "dEQP-GLES2.functional.shaders.operator",
        ".unary_operator.plus.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003940,
        "dEQP-GLES2.functional.shaders.operator.",
        "unary_operator.plus.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003941,
        "dEQP-GLES2.functional.shaders.operator.u",
        "nary_operator.plus.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003942,
        "dEQP-GLES2.functional.shaders.operator",
        ".unary_operator.plus.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003943,
        "dEQP-GLES2.functional.shaders.operator.",
        "unary_operator.plus.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003944,
        "dEQP-GLES2.functional.shaders.operato",
        "r.unary_operator.plus.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003945,
        "dEQP-GLES2.functional.shaders.operator",
        ".unary_operator.plus.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003946,
        "dEQP-GLES2.functional.shaders.operator.",
        "unary_operator.plus.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003947,
        "dEQP-GLES2.functional.shaders.operator.u",
        "nary_operator.plus.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003948,
        "dEQP-GLES2.functional.shaders.operator",
        ".unary_operator.plus.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003949,
        "dEQP-GLES2.functional.shaders.operator.",
        "unary_operator.plus.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003950,
        "dEQP-GLES2.functional.shaders.operato",
        "r.unary_operator.plus.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003951,
        "dEQP-GLES2.functional.shaders.operator",
        ".unary_operator.plus.lowp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003952,
        "dEQP-GLES2.functional.shaders.operator.",
        "unary_operator.plus.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003953,
        "dEQP-GLES2.functional.shaders.operator.u",
        "nary_operator.plus.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003954,
        "dEQP-GLES2.functional.shaders.operator",
        ".unary_operator.plus.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003955,
        "dEQP-GLES2.functional.shaders.operator.",
        "unary_operator.plus.highp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003956,
        "dEQP-GLES2.functional.shaders.operato",
        "r.unary_operator.plus.lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003957,
        "dEQP-GLES2.functional.shaders.operator",
        ".unary_operator.plus.lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003958,
        "dEQP-GLES2.functional.shaders.operator",
        ".unary_operator.plus.mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003959,
        "dEQP-GLES2.functional.shaders.operator.",
        "unary_operator.plus.mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003960,
        "dEQP-GLES2.functional.shaders.operato",
        "r.unary_operator.plus.highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003961,
        "dEQP-GLES2.functional.shaders.operator",
        ".unary_operator.plus.highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003962,
        "dEQP-GLES2.functional.shaders.operator",
        ".unary_operator.plus.lowp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003963,
        "dEQP-GLES2.functional.shaders.operator.",
        "unary_operator.plus.lowp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003964,
        "dEQP-GLES2.functional.shaders.operator.",
        "unary_operator.plus.mediump_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003965,
        "dEQP-GLES2.functional.shaders.operator.u",
        "nary_operator.plus.mediump_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003966,
        "dEQP-GLES2.functional.shaders.operator",
        ".unary_operator.plus.highp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003967,
        "dEQP-GLES2.functional.shaders.operator.",
        "unary_operator.plus.highp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003968,
        "dEQP-GLES2.functional.shaders.operator",
        ".unary_operator.plus.lowp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003969,
        "dEQP-GLES2.functional.shaders.operator.",
        "unary_operator.plus.lowp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003970,
        "dEQP-GLES2.functional.shaders.operator.",
        "unary_operator.plus.mediump_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003971,
        "dEQP-GLES2.functional.shaders.operator.u",
        "nary_operator.plus.mediump_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003972,
        "dEQP-GLES2.functional.shaders.operator",
        ".unary_operator.plus.highp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003973,
        "dEQP-GLES2.functional.shaders.operator.",
        "unary_operator.plus.highp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003974,
        "dEQP-GLES2.functional.shaders.operator",
        ".unary_operator.plus.lowp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003975,
        "dEQP-GLES2.functional.shaders.operator.",
        "unary_operator.plus.lowp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003976,
        "dEQP-GLES2.functional.shaders.operator.",
        "unary_operator.plus.mediump_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003977,
        "dEQP-GLES2.functional.shaders.operator.u",
        "nary_operator.plus.mediump_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003978,
        "dEQP-GLES2.functional.shaders.operator",
        ".unary_operator.plus.highp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20004TestSuite, TestCase_003979,
        "dEQP-GLES2.functional.shaders.operator.",
        "unary_operator.plus.highp_ivec4_fragment");
