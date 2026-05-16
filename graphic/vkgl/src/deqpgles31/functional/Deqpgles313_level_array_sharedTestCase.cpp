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
#include "../ActsDeqpgles310010TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009332,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.3_level_array.shared.float");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009333,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.3_level_array.shared.vec2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009334,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.3_level_array.shared.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009335,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.3_level_array.shared.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009336,
        "dEQP-GLES31.functional.ssbo.l",
        "ayout.3_level_array.shared.int");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009337,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.3_level_array.shared.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009338,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.3_level_array.shared.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009339,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.3_level_array.shared.ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009340,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.3_level_array.shared.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009341,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.3_level_array.shared.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009342,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.3_level_array.shared.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009343,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.3_level_array.shared.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009344,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.3_level_array.shared.bool");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009345,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.3_level_array.shared.bvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009346,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.3_level_array.shared.bvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009347,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.3_level_array.shared.bvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009348,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.3_level_array.shared.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009349,
        "dEQP-GLES31.functional.ssbo.layout.",
        "3_level_array.shared.row_major_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009350,
        "dEQP-GLES31.functional.ssbo.layout.3",
        "_level_array.shared.column_major_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009351,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.3_level_array.shared.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009352,
        "dEQP-GLES31.functional.ssbo.layout.",
        "3_level_array.shared.row_major_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009353,
        "dEQP-GLES31.functional.ssbo.layout.3",
        "_level_array.shared.column_major_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009354,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.3_level_array.shared.mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009355,
        "dEQP-GLES31.functional.ssbo.layout.",
        "3_level_array.shared.row_major_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009356,
        "dEQP-GLES31.functional.ssbo.layout.3",
        "_level_array.shared.column_major_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009357,
        "dEQP-GLES31.functional.ssbo.lay",
        "out.3_level_array.shared.mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009358,
        "dEQP-GLES31.functional.ssbo.layout.3",
        "_level_array.shared.row_major_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009359,
        "dEQP-GLES31.functional.ssbo.layout.3_",
        "level_array.shared.column_major_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009360,
        "dEQP-GLES31.functional.ssbo.lay",
        "out.3_level_array.shared.mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009361,
        "dEQP-GLES31.functional.ssbo.layout.3",
        "_level_array.shared.row_major_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009362,
        "dEQP-GLES31.functional.ssbo.layout.3_",
        "level_array.shared.column_major_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009363,
        "dEQP-GLES31.functional.ssbo.lay",
        "out.3_level_array.shared.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009364,
        "dEQP-GLES31.functional.ssbo.layout.3",
        "_level_array.shared.row_major_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009365,
        "dEQP-GLES31.functional.ssbo.layout.3_",
        "level_array.shared.column_major_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009366,
        "dEQP-GLES31.functional.ssbo.lay",
        "out.3_level_array.shared.mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009367,
        "dEQP-GLES31.functional.ssbo.layout.3",
        "_level_array.shared.row_major_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009368,
        "dEQP-GLES31.functional.ssbo.layout.3_",
        "level_array.shared.column_major_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009369,
        "dEQP-GLES31.functional.ssbo.lay",
        "out.3_level_array.shared.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009370,
        "dEQP-GLES31.functional.ssbo.layout.3",
        "_level_array.shared.row_major_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009371,
        "dEQP-GLES31.functional.ssbo.layout.3_",
        "level_array.shared.column_major_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009372,
        "dEQP-GLES31.functional.ssbo.lay",
        "out.3_level_array.shared.mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009373,
        "dEQP-GLES31.functional.ssbo.layout.3",
        "_level_array.shared.row_major_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009374,
        "dEQP-GLES31.functional.ssbo.layout.3_",
        "level_array.shared.column_major_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010737,
        "dEQP-GLES31.functional.ubo.3_l",
        "evel_array.shared.float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010738,
        "dEQP-GLES31.functional.ubo.3_le",
        "vel_array.shared.float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010739,
        "dEQP-GLES31.functional.ubo.3_",
        "level_array.shared.float_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010740,
        "dEQP-GLES31.functional.ubo.3_",
        "level_array.shared.vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010741,
        "dEQP-GLES31.functional.ubo.3_l",
        "evel_array.shared.vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010742,
        "dEQP-GLES31.functional.ubo.3",
        "_level_array.shared.vec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010743,
        "dEQP-GLES31.functional.ubo.3_",
        "level_array.shared.vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010744,
        "dEQP-GLES31.functional.ubo.3_l",
        "evel_array.shared.vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010745,
        "dEQP-GLES31.functional.ubo.3",
        "_level_array.shared.vec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010746,
        "dEQP-GLES31.functional.ubo.3_",
        "level_array.shared.vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010747,
        "dEQP-GLES31.functional.ubo.3_l",
        "evel_array.shared.vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010748,
        "dEQP-GLES31.functional.ubo.3",
        "_level_array.shared.vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010749,
        "dEQP-GLES31.functional.ubo.3_",
        "level_array.shared.int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010750,
        "dEQP-GLES31.functional.ubo.3_l",
        "evel_array.shared.int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010751,
        "dEQP-GLES31.functional.ubo.3",
        "_level_array.shared.int_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010752,
        "dEQP-GLES31.functional.ubo.3_l",
        "evel_array.shared.ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010753,
        "dEQP-GLES31.functional.ubo.3_le",
        "vel_array.shared.ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010754,
        "dEQP-GLES31.functional.ubo.3_",
        "level_array.shared.ivec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010755,
        "dEQP-GLES31.functional.ubo.3_l",
        "evel_array.shared.ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010756,
        "dEQP-GLES31.functional.ubo.3_le",
        "vel_array.shared.ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010757,
        "dEQP-GLES31.functional.ubo.3_",
        "level_array.shared.ivec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010758,
        "dEQP-GLES31.functional.ubo.3_l",
        "evel_array.shared.ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010759,
        "dEQP-GLES31.functional.ubo.3_le",
        "vel_array.shared.ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010760,
        "dEQP-GLES31.functional.ubo.3_",
        "level_array.shared.ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010761,
        "dEQP-GLES31.functional.ubo.3_",
        "level_array.shared.uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010762,
        "dEQP-GLES31.functional.ubo.3_l",
        "evel_array.shared.uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010763,
        "dEQP-GLES31.functional.ubo.3",
        "_level_array.shared.uint_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010764,
        "dEQP-GLES31.functional.ubo.3_l",
        "evel_array.shared.uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010765,
        "dEQP-GLES31.functional.ubo.3_le",
        "vel_array.shared.uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010766,
        "dEQP-GLES31.functional.ubo.3_",
        "level_array.shared.uvec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010767,
        "dEQP-GLES31.functional.ubo.3_l",
        "evel_array.shared.uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010768,
        "dEQP-GLES31.functional.ubo.3_le",
        "vel_array.shared.uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010769,
        "dEQP-GLES31.functional.ubo.3_",
        "level_array.shared.uvec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010770,
        "dEQP-GLES31.functional.ubo.3_l",
        "evel_array.shared.uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010771,
        "dEQP-GLES31.functional.ubo.3_le",
        "vel_array.shared.uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010772,
        "dEQP-GLES31.functional.ubo.3_",
        "level_array.shared.uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010773,
        "dEQP-GLES31.functional.ubo.3_",
        "level_array.shared.bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010774,
        "dEQP-GLES31.functional.ubo.3_l",
        "evel_array.shared.bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010775,
        "dEQP-GLES31.functional.ubo.3",
        "_level_array.shared.bool_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010776,
        "dEQP-GLES31.functional.ubo.3_l",
        "evel_array.shared.bvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010777,
        "dEQP-GLES31.functional.ubo.3_le",
        "vel_array.shared.bvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010778,
        "dEQP-GLES31.functional.ubo.3_",
        "level_array.shared.bvec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010779,
        "dEQP-GLES31.functional.ubo.3_l",
        "evel_array.shared.bvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010780,
        "dEQP-GLES31.functional.ubo.3_le",
        "vel_array.shared.bvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010781,
        "dEQP-GLES31.functional.ubo.3_",
        "level_array.shared.bvec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010782,
        "dEQP-GLES31.functional.ubo.3_l",
        "evel_array.shared.bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010783,
        "dEQP-GLES31.functional.ubo.3_le",
        "vel_array.shared.bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010784,
        "dEQP-GLES31.functional.ubo.3_",
        "level_array.shared.bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010785,
        "dEQP-GLES31.functional.ubo.3_",
        "level_array.shared.mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010786,
        "dEQP-GLES31.functional.ubo.3_l",
        "evel_array.shared.mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010787,
        "dEQP-GLES31.functional.ubo.3",
        "_level_array.shared.mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010788,
        "dEQP-GLES31.functional.ubo.3_level",
        "_array.shared.row_major_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010789,
        "dEQP-GLES31.functional.ubo.3_level_",
        "array.shared.row_major_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010790,
        "dEQP-GLES31.functional.ubo.3_leve",
        "l_array.shared.row_major_mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010791,
        "dEQP-GLES31.functional.ubo.3_level_a",
        "rray.shared.column_major_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010792,
        "dEQP-GLES31.functional.ubo.3_level_ar",
        "ray.shared.column_major_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010793,
        "dEQP-GLES31.functional.ubo.3_level_",
        "array.shared.column_major_mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010794,
        "dEQP-GLES31.functional.ubo.3_",
        "level_array.shared.mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010795,
        "dEQP-GLES31.functional.ubo.3_l",
        "evel_array.shared.mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010796,
        "dEQP-GLES31.functional.ubo.3",
        "_level_array.shared.mat3_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010797,
        "dEQP-GLES31.functional.ubo.3_level",
        "_array.shared.row_major_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010798,
        "dEQP-GLES31.functional.ubo.3_level_",
        "array.shared.row_major_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010799,
        "dEQP-GLES31.functional.ubo.3_leve",
        "l_array.shared.row_major_mat3_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010800,
        "dEQP-GLES31.functional.ubo.3_level_a",
        "rray.shared.column_major_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010801,
        "dEQP-GLES31.functional.ubo.3_level_ar",
        "ray.shared.column_major_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010802,
        "dEQP-GLES31.functional.ubo.3_level_",
        "array.shared.column_major_mat3_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010803,
        "dEQP-GLES31.functional.ubo.3_",
        "level_array.shared.mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010804,
        "dEQP-GLES31.functional.ubo.3_l",
        "evel_array.shared.mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010805,
        "dEQP-GLES31.functional.ubo.3",
        "_level_array.shared.mat4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010806,
        "dEQP-GLES31.functional.ubo.3_level",
        "_array.shared.row_major_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010807,
        "dEQP-GLES31.functional.ubo.3_level_",
        "array.shared.row_major_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010808,
        "dEQP-GLES31.functional.ubo.3_leve",
        "l_array.shared.row_major_mat4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010809,
        "dEQP-GLES31.functional.ubo.3_level_a",
        "rray.shared.column_major_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010810,
        "dEQP-GLES31.functional.ubo.3_level_ar",
        "ray.shared.column_major_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010811,
        "dEQP-GLES31.functional.ubo.3_level_",
        "array.shared.column_major_mat4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010812,
        "dEQP-GLES31.functional.ubo.3_l",
        "evel_array.shared.mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010813,
        "dEQP-GLES31.functional.ubo.3_le",
        "vel_array.shared.mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010814,
        "dEQP-GLES31.functional.ubo.3_",
        "level_array.shared.mat2x3_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010815,
        "dEQP-GLES31.functional.ubo.3_level_",
        "array.shared.row_major_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010816,
        "dEQP-GLES31.functional.ubo.3_level_a",
        "rray.shared.row_major_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010817,
        "dEQP-GLES31.functional.ubo.3_level",
        "_array.shared.row_major_mat2x3_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010818,
        "dEQP-GLES31.functional.ubo.3_level_ar",
        "ray.shared.column_major_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010819,
        "dEQP-GLES31.functional.ubo.3_level_arr",
        "ay.shared.column_major_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010820,
        "dEQP-GLES31.functional.ubo.3_level_a",
        "rray.shared.column_major_mat2x3_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010821,
        "dEQP-GLES31.functional.ubo.3_l",
        "evel_array.shared.mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010822,
        "dEQP-GLES31.functional.ubo.3_le",
        "vel_array.shared.mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010823,
        "dEQP-GLES31.functional.ubo.3_",
        "level_array.shared.mat2x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010824,
        "dEQP-GLES31.functional.ubo.3_level_",
        "array.shared.row_major_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010825,
        "dEQP-GLES31.functional.ubo.3_level_a",
        "rray.shared.row_major_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010826,
        "dEQP-GLES31.functional.ubo.3_level",
        "_array.shared.row_major_mat2x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010827,
        "dEQP-GLES31.functional.ubo.3_level_ar",
        "ray.shared.column_major_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010828,
        "dEQP-GLES31.functional.ubo.3_level_arr",
        "ay.shared.column_major_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010829,
        "dEQP-GLES31.functional.ubo.3_level_a",
        "rray.shared.column_major_mat2x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010830,
        "dEQP-GLES31.functional.ubo.3_l",
        "evel_array.shared.mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010831,
        "dEQP-GLES31.functional.ubo.3_le",
        "vel_array.shared.mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010832,
        "dEQP-GLES31.functional.ubo.3_",
        "level_array.shared.mat3x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010833,
        "dEQP-GLES31.functional.ubo.3_level_",
        "array.shared.row_major_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010834,
        "dEQP-GLES31.functional.ubo.3_level_a",
        "rray.shared.row_major_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010835,
        "dEQP-GLES31.functional.ubo.3_level",
        "_array.shared.row_major_mat3x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010836,
        "dEQP-GLES31.functional.ubo.3_level_ar",
        "ray.shared.column_major_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010837,
        "dEQP-GLES31.functional.ubo.3_level_arr",
        "ay.shared.column_major_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010838,
        "dEQP-GLES31.functional.ubo.3_level_a",
        "rray.shared.column_major_mat3x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010839,
        "dEQP-GLES31.functional.ubo.3_l",
        "evel_array.shared.mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010840,
        "dEQP-GLES31.functional.ubo.3_le",
        "vel_array.shared.mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010841,
        "dEQP-GLES31.functional.ubo.3_",
        "level_array.shared.mat3x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010842,
        "dEQP-GLES31.functional.ubo.3_level_",
        "array.shared.row_major_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010843,
        "dEQP-GLES31.functional.ubo.3_level_a",
        "rray.shared.row_major_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010844,
        "dEQP-GLES31.functional.ubo.3_level",
        "_array.shared.row_major_mat3x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010845,
        "dEQP-GLES31.functional.ubo.3_level_ar",
        "ray.shared.column_major_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010846,
        "dEQP-GLES31.functional.ubo.3_level_arr",
        "ay.shared.column_major_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010847,
        "dEQP-GLES31.functional.ubo.3_level_a",
        "rray.shared.column_major_mat3x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010848,
        "dEQP-GLES31.functional.ubo.3_l",
        "evel_array.shared.mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010849,
        "dEQP-GLES31.functional.ubo.3_le",
        "vel_array.shared.mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010850,
        "dEQP-GLES31.functional.ubo.3_",
        "level_array.shared.mat4x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010851,
        "dEQP-GLES31.functional.ubo.3_level_",
        "array.shared.row_major_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010852,
        "dEQP-GLES31.functional.ubo.3_level_a",
        "rray.shared.row_major_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010853,
        "dEQP-GLES31.functional.ubo.3_level",
        "_array.shared.row_major_mat4x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010854,
        "dEQP-GLES31.functional.ubo.3_level_ar",
        "ray.shared.column_major_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010855,
        "dEQP-GLES31.functional.ubo.3_level_arr",
        "ay.shared.column_major_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010856,
        "dEQP-GLES31.functional.ubo.3_level_a",
        "rray.shared.column_major_mat4x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010857,
        "dEQP-GLES31.functional.ubo.3_l",
        "evel_array.shared.mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010858,
        "dEQP-GLES31.functional.ubo.3_le",
        "vel_array.shared.mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010859,
        "dEQP-GLES31.functional.ubo.3_",
        "level_array.shared.mat4x3_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010860,
        "dEQP-GLES31.functional.ubo.3_level_",
        "array.shared.row_major_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010861,
        "dEQP-GLES31.functional.ubo.3_level_a",
        "rray.shared.row_major_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010862,
        "dEQP-GLES31.functional.ubo.3_level",
        "_array.shared.row_major_mat4x3_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010863,
        "dEQP-GLES31.functional.ubo.3_level_ar",
        "ray.shared.column_major_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010864,
        "dEQP-GLES31.functional.ubo.3_level_arr",
        "ay.shared.column_major_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010865,
        "dEQP-GLES31.functional.ubo.3_level_a",
        "rray.shared.column_major_mat4x3_both");
