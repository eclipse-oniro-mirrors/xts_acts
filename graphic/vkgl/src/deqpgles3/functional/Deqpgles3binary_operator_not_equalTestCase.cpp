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
#include "../ActsDeqpgles30013TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012064,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.not_equal.lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012065,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.not_equal.lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012066,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.not_equal.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012067,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.not_equal.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012068,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.not_equal.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012069,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.not_equal.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012070,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.not_equal.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012071,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.not_equal.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012072,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.not_equal.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012073,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.not_equal.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012074,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.not_equal.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012075,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.not_equal.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012076,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.not_equal.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012077,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.not_equal.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012078,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.not_equal.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012079,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.not_equal.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012080,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.not_equal.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012081,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.not_equal.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012082,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.not_equal.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012083,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.not_equal.lowp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012084,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.not_equal.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012085,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.not_equal.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012086,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.not_equal.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012087,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.not_equal.highp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012088,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.not_equal.lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012089,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.not_equal.lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012090,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.not_equal.mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012091,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.not_equal.mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012092,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.not_equal.highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012093,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.not_equal.highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012094,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.not_equal.lowp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012095,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.not_equal.lowp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012096,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.not_equal.mediump_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012097,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.not_equal.mediump_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012098,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.not_equal.highp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012099,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.not_equal.highp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012100,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.not_equal.lowp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012101,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.not_equal.lowp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012102,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.not_equal.mediump_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012103,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.not_equal.mediump_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012104,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.not_equal.highp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012105,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.not_equal.highp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012106,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.not_equal.lowp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012107,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.not_equal.lowp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012108,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.not_equal.mediump_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012109,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.not_equal.mediump_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012110,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.not_equal.highp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012111,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.not_equal.highp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012112,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.not_equal.lowp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012113,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.not_equal.lowp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012114,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.not_equal.mediump_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012115,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.not_equal.mediump_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012116,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.not_equal.highp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012117,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.not_equal.highp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012118,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.not_equal.lowp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012119,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.not_equal.lowp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012120,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.not_equal.mediump_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012121,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.not_equal.mediump_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012122,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.not_equal.highp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012123,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.not_equal.highp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012124,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.not_equal.lowp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012125,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.not_equal.lowp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012126,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.not_equal.mediump_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012127,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.not_equal.mediump_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012128,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.not_equal.highp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012129,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.not_equal.highp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012130,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.not_equal.lowp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012131,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.not_equal.lowp_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012132,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.not_equal.mediump_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012133,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.not_equal.mediump_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012134,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.not_equal.highp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012135,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.not_equal.highp_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012136,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.not_equal.bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012137,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.not_equal.bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012138,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.not_equal.bvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012139,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.not_equal.bvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012140,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.not_equal.bvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012141,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.not_equal.bvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012142,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.not_equal.bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012143,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.not_equal.bvec4_fragment");
