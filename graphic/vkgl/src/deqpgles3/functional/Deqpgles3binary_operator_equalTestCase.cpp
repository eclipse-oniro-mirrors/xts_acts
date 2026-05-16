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
#include "../Deqpgles3BaseFunc.h"
#include "../ActsDeqpgles30012TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011984,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.equal.lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011985,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.equal.lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011986,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.equal.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011987,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.equal.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011988,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.equal.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011989,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.equal.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011990,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.equal.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011991,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.equal.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011992,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.equal.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011993,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.equal.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011994,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.equal.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011995,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.equal.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011996,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.equal.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011997,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.equal.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011998,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.equal.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011999,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.equal.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012000,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.equal.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012001,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.equal.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012002,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.equal.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012003,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.equal.lowp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012004,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.equal.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012005,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.equal.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012006,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.equal.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012007,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.equal.highp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012008,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.equal.lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012009,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.equal.lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012010,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.equal.mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012011,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.equal.mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012012,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.equal.highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012013,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.equal.highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012014,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.equal.lowp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012015,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.equal.lowp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012016,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.equal.mediump_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012017,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.equal.mediump_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012018,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.equal.highp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012019,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.equal.highp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012020,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.equal.lowp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012021,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.equal.lowp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012022,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.equal.mediump_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012023,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.equal.mediump_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012024,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.equal.highp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012025,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.equal.highp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012026,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.equal.lowp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012027,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.equal.lowp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012028,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.equal.mediump_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012029,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.equal.mediump_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012030,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.equal.highp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012031,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.equal.highp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012032,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.equal.lowp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012033,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.equal.lowp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012034,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.equal.mediump_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012035,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.equal.mediump_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012036,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.equal.highp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012037,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.equal.highp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012038,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.equal.lowp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012039,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.equal.lowp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012040,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.equal.mediump_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012041,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.equal.mediump_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012042,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.equal.highp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012043,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.equal.highp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012044,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.equal.lowp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012045,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.equal.lowp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012046,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.equal.mediump_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012047,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.equal.mediump_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012048,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.equal.highp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012049,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.equal.highp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012050,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.equal.lowp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012051,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.equal.lowp_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012052,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.equal.mediump_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012053,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.equal.mediump_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012054,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.equal.highp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012055,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.equal.highp_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012056,
        "dEQP-GLES3.functional.shaders.operat",
        "or.binary_operator.equal.bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012057,
        "dEQP-GLES3.functional.shaders.operato",
        "r.binary_operator.equal.bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012058,
        "dEQP-GLES3.functional.shaders.operat",
        "or.binary_operator.equal.bvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012059,
        "dEQP-GLES3.functional.shaders.operato",
        "r.binary_operator.equal.bvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012060,
        "dEQP-GLES3.functional.shaders.operat",
        "or.binary_operator.equal.bvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012061,
        "dEQP-GLES3.functional.shaders.operato",
        "r.binary_operator.equal.bvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012062,
        "dEQP-GLES3.functional.shaders.operat",
        "or.binary_operator.equal.bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_012063,
        "dEQP-GLES3.functional.shaders.operato",
        "r.binary_operator.equal.bvec4_fragment");
