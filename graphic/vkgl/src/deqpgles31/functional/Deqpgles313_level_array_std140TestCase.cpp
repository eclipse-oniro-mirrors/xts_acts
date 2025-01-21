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

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009418,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.3_level_array.std140.float");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009419,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.3_level_array.std140.vec2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009420,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.3_level_array.std140.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009421,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.3_level_array.std140.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009422,
        "dEQP-GLES31.functional.ssbo.l",
        "ayout.3_level_array.std140.int");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009423,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.3_level_array.std140.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009424,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.3_level_array.std140.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009425,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.3_level_array.std140.ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009426,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.3_level_array.std140.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009427,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.3_level_array.std140.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009428,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.3_level_array.std140.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009429,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.3_level_array.std140.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009430,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.3_level_array.std140.bool");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009431,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.3_level_array.std140.bvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009432,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.3_level_array.std140.bvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009433,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.3_level_array.std140.bvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009434,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.3_level_array.std140.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009435,
        "dEQP-GLES31.functional.ssbo.layout.",
        "3_level_array.std140.row_major_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009436,
        "dEQP-GLES31.functional.ssbo.layout.3",
        "_level_array.std140.column_major_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009437,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.3_level_array.std140.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009438,
        "dEQP-GLES31.functional.ssbo.layout.",
        "3_level_array.std140.row_major_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009439,
        "dEQP-GLES31.functional.ssbo.layout.3",
        "_level_array.std140.column_major_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009440,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.3_level_array.std140.mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009441,
        "dEQP-GLES31.functional.ssbo.layout.",
        "3_level_array.std140.row_major_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009442,
        "dEQP-GLES31.functional.ssbo.layout.3",
        "_level_array.std140.column_major_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009443,
        "dEQP-GLES31.functional.ssbo.lay",
        "out.3_level_array.std140.mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009444,
        "dEQP-GLES31.functional.ssbo.layout.3",
        "_level_array.std140.row_major_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009445,
        "dEQP-GLES31.functional.ssbo.layout.3_",
        "level_array.std140.column_major_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009446,
        "dEQP-GLES31.functional.ssbo.lay",
        "out.3_level_array.std140.mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009447,
        "dEQP-GLES31.functional.ssbo.layout.3",
        "_level_array.std140.row_major_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009448,
        "dEQP-GLES31.functional.ssbo.layout.3_",
        "level_array.std140.column_major_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009449,
        "dEQP-GLES31.functional.ssbo.lay",
        "out.3_level_array.std140.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009450,
        "dEQP-GLES31.functional.ssbo.layout.3",
        "_level_array.std140.row_major_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009451,
        "dEQP-GLES31.functional.ssbo.layout.3_",
        "level_array.std140.column_major_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009452,
        "dEQP-GLES31.functional.ssbo.lay",
        "out.3_level_array.std140.mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009453,
        "dEQP-GLES31.functional.ssbo.layout.3",
        "_level_array.std140.row_major_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009454,
        "dEQP-GLES31.functional.ssbo.layout.3_",
        "level_array.std140.column_major_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009455,
        "dEQP-GLES31.functional.ssbo.lay",
        "out.3_level_array.std140.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009456,
        "dEQP-GLES31.functional.ssbo.layout.3",
        "_level_array.std140.row_major_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009457,
        "dEQP-GLES31.functional.ssbo.layout.3_",
        "level_array.std140.column_major_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009458,
        "dEQP-GLES31.functional.ssbo.lay",
        "out.3_level_array.std140.mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009459,
        "dEQP-GLES31.functional.ssbo.layout.3",
        "_level_array.std140.row_major_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009460,
        "dEQP-GLES31.functional.ssbo.layout.3_",
        "level_array.std140.column_major_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010952,
        "dEQP-GLES31.functional.ubo.3_l",
        "evel_array.std140.float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010953,
        "dEQP-GLES31.functional.ubo.3_le",
        "vel_array.std140.float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010954,
        "dEQP-GLES31.functional.ubo.3_",
        "level_array.std140.float_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010955,
        "dEQP-GLES31.functional.ubo.3_",
        "level_array.std140.vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010956,
        "dEQP-GLES31.functional.ubo.3_l",
        "evel_array.std140.vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010957,
        "dEQP-GLES31.functional.ubo.3",
        "_level_array.std140.vec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010958,
        "dEQP-GLES31.functional.ubo.3_",
        "level_array.std140.vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010959,
        "dEQP-GLES31.functional.ubo.3_l",
        "evel_array.std140.vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010960,
        "dEQP-GLES31.functional.ubo.3",
        "_level_array.std140.vec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010961,
        "dEQP-GLES31.functional.ubo.3_",
        "level_array.std140.vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010962,
        "dEQP-GLES31.functional.ubo.3_l",
        "evel_array.std140.vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010963,
        "dEQP-GLES31.functional.ubo.3",
        "_level_array.std140.vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010964,
        "dEQP-GLES31.functional.ubo.3_",
        "level_array.std140.int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010965,
        "dEQP-GLES31.functional.ubo.3_l",
        "evel_array.std140.int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010966,
        "dEQP-GLES31.functional.ubo.3",
        "_level_array.std140.int_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010967,
        "dEQP-GLES31.functional.ubo.3_l",
        "evel_array.std140.ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010968,
        "dEQP-GLES31.functional.ubo.3_le",
        "vel_array.std140.ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010969,
        "dEQP-GLES31.functional.ubo.3_",
        "level_array.std140.ivec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010970,
        "dEQP-GLES31.functional.ubo.3_l",
        "evel_array.std140.ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010971,
        "dEQP-GLES31.functional.ubo.3_le",
        "vel_array.std140.ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010972,
        "dEQP-GLES31.functional.ubo.3_",
        "level_array.std140.ivec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010973,
        "dEQP-GLES31.functional.ubo.3_l",
        "evel_array.std140.ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010974,
        "dEQP-GLES31.functional.ubo.3_le",
        "vel_array.std140.ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010975,
        "dEQP-GLES31.functional.ubo.3_",
        "level_array.std140.ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010976,
        "dEQP-GLES31.functional.ubo.3_",
        "level_array.std140.uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010977,
        "dEQP-GLES31.functional.ubo.3_l",
        "evel_array.std140.uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010978,
        "dEQP-GLES31.functional.ubo.3",
        "_level_array.std140.uint_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010979,
        "dEQP-GLES31.functional.ubo.3_l",
        "evel_array.std140.uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010980,
        "dEQP-GLES31.functional.ubo.3_le",
        "vel_array.std140.uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010981,
        "dEQP-GLES31.functional.ubo.3_",
        "level_array.std140.uvec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010982,
        "dEQP-GLES31.functional.ubo.3_l",
        "evel_array.std140.uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010983,
        "dEQP-GLES31.functional.ubo.3_le",
        "vel_array.std140.uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010984,
        "dEQP-GLES31.functional.ubo.3_",
        "level_array.std140.uvec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010985,
        "dEQP-GLES31.functional.ubo.3_l",
        "evel_array.std140.uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010986,
        "dEQP-GLES31.functional.ubo.3_le",
        "vel_array.std140.uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010987,
        "dEQP-GLES31.functional.ubo.3_",
        "level_array.std140.uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010988,
        "dEQP-GLES31.functional.ubo.3_",
        "level_array.std140.bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010989,
        "dEQP-GLES31.functional.ubo.3_l",
        "evel_array.std140.bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010990,
        "dEQP-GLES31.functional.ubo.3",
        "_level_array.std140.bool_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010991,
        "dEQP-GLES31.functional.ubo.3_l",
        "evel_array.std140.bvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010992,
        "dEQP-GLES31.functional.ubo.3_le",
        "vel_array.std140.bvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010993,
        "dEQP-GLES31.functional.ubo.3_",
        "level_array.std140.bvec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010994,
        "dEQP-GLES31.functional.ubo.3_l",
        "evel_array.std140.bvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010995,
        "dEQP-GLES31.functional.ubo.3_le",
        "vel_array.std140.bvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010996,
        "dEQP-GLES31.functional.ubo.3_",
        "level_array.std140.bvec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010997,
        "dEQP-GLES31.functional.ubo.3_l",
        "evel_array.std140.bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010998,
        "dEQP-GLES31.functional.ubo.3_le",
        "vel_array.std140.bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010999,
        "dEQP-GLES31.functional.ubo.3_",
        "level_array.std140.bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_011000,
        "dEQP-GLES31.functional.ubo.3_",
        "level_array.std140.mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_011001,
        "dEQP-GLES31.functional.ubo.3_l",
        "evel_array.std140.mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_011002,
        "dEQP-GLES31.functional.ubo.3",
        "_level_array.std140.mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_011003,
        "dEQP-GLES31.functional.ubo.3_level",
        "_array.std140.row_major_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_011004,
        "dEQP-GLES31.functional.ubo.3_level_",
        "array.std140.row_major_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_011005,
        "dEQP-GLES31.functional.ubo.3_leve",
        "l_array.std140.row_major_mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_011006,
        "dEQP-GLES31.functional.ubo.3_level_a",
        "rray.std140.column_major_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_011007,
        "dEQP-GLES31.functional.ubo.3_level_ar",
        "ray.std140.column_major_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_011008,
        "dEQP-GLES31.functional.ubo.3_level_",
        "array.std140.column_major_mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_011009,
        "dEQP-GLES31.functional.ubo.3_",
        "level_array.std140.mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_011010,
        "dEQP-GLES31.functional.ubo.3_l",
        "evel_array.std140.mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_011011,
        "dEQP-GLES31.functional.ubo.3",
        "_level_array.std140.mat3_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_011012,
        "dEQP-GLES31.functional.ubo.3_level",
        "_array.std140.row_major_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_011013,
        "dEQP-GLES31.functional.ubo.3_level_",
        "array.std140.row_major_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_011014,
        "dEQP-GLES31.functional.ubo.3_leve",
        "l_array.std140.row_major_mat3_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_011015,
        "dEQP-GLES31.functional.ubo.3_level_a",
        "rray.std140.column_major_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_011016,
        "dEQP-GLES31.functional.ubo.3_level_ar",
        "ray.std140.column_major_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_011017,
        "dEQP-GLES31.functional.ubo.3_level_",
        "array.std140.column_major_mat3_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_011018,
        "dEQP-GLES31.functional.ubo.3_",
        "level_array.std140.mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_011019,
        "dEQP-GLES31.functional.ubo.3_l",
        "evel_array.std140.mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_011020,
        "dEQP-GLES31.functional.ubo.3",
        "_level_array.std140.mat4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_011021,
        "dEQP-GLES31.functional.ubo.3_level",
        "_array.std140.row_major_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_011022,
        "dEQP-GLES31.functional.ubo.3_level_",
        "array.std140.row_major_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_011023,
        "dEQP-GLES31.functional.ubo.3_leve",
        "l_array.std140.row_major_mat4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_011024,
        "dEQP-GLES31.functional.ubo.3_level_a",
        "rray.std140.column_major_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_011025,
        "dEQP-GLES31.functional.ubo.3_level_ar",
        "ray.std140.column_major_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_011026,
        "dEQP-GLES31.functional.ubo.3_level_",
        "array.std140.column_major_mat4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_011027,
        "dEQP-GLES31.functional.ubo.3_l",
        "evel_array.std140.mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_011028,
        "dEQP-GLES31.functional.ubo.3_le",
        "vel_array.std140.mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_011029,
        "dEQP-GLES31.functional.ubo.3_",
        "level_array.std140.mat2x3_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_011030,
        "dEQP-GLES31.functional.ubo.3_level_",
        "array.std140.row_major_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_011031,
        "dEQP-GLES31.functional.ubo.3_level_a",
        "rray.std140.row_major_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_011032,
        "dEQP-GLES31.functional.ubo.3_level",
        "_array.std140.row_major_mat2x3_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_011033,
        "dEQP-GLES31.functional.ubo.3_level_ar",
        "ray.std140.column_major_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_011034,
        "dEQP-GLES31.functional.ubo.3_level_arr",
        "ay.std140.column_major_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_011035,
        "dEQP-GLES31.functional.ubo.3_level_a",
        "rray.std140.column_major_mat2x3_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_011036,
        "dEQP-GLES31.functional.ubo.3_l",
        "evel_array.std140.mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_011037,
        "dEQP-GLES31.functional.ubo.3_le",
        "vel_array.std140.mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_011038,
        "dEQP-GLES31.functional.ubo.3_",
        "level_array.std140.mat2x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_011039,
        "dEQP-GLES31.functional.ubo.3_level_",
        "array.std140.row_major_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_011040,
        "dEQP-GLES31.functional.ubo.3_level_a",
        "rray.std140.row_major_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_011041,
        "dEQP-GLES31.functional.ubo.3_level",
        "_array.std140.row_major_mat2x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_011042,
        "dEQP-GLES31.functional.ubo.3_level_ar",
        "ray.std140.column_major_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_011043,
        "dEQP-GLES31.functional.ubo.3_level_arr",
        "ay.std140.column_major_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_011044,
        "dEQP-GLES31.functional.ubo.3_level_a",
        "rray.std140.column_major_mat2x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_011045,
        "dEQP-GLES31.functional.ubo.3_l",
        "evel_array.std140.mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_011046,
        "dEQP-GLES31.functional.ubo.3_le",
        "vel_array.std140.mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_011047,
        "dEQP-GLES31.functional.ubo.3_",
        "level_array.std140.mat3x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_011048,
        "dEQP-GLES31.functional.ubo.3_level_",
        "array.std140.row_major_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_011049,
        "dEQP-GLES31.functional.ubo.3_level_a",
        "rray.std140.row_major_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_011050,
        "dEQP-GLES31.functional.ubo.3_level",
        "_array.std140.row_major_mat3x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_011051,
        "dEQP-GLES31.functional.ubo.3_level_ar",
        "ray.std140.column_major_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_011052,
        "dEQP-GLES31.functional.ubo.3_level_arr",
        "ay.std140.column_major_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_011053,
        "dEQP-GLES31.functional.ubo.3_level_a",
        "rray.std140.column_major_mat3x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_011054,
        "dEQP-GLES31.functional.ubo.3_l",
        "evel_array.std140.mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_011055,
        "dEQP-GLES31.functional.ubo.3_le",
        "vel_array.std140.mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_011056,
        "dEQP-GLES31.functional.ubo.3_",
        "level_array.std140.mat3x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_011057,
        "dEQP-GLES31.functional.ubo.3_level_",
        "array.std140.row_major_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_011058,
        "dEQP-GLES31.functional.ubo.3_level_a",
        "rray.std140.row_major_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_011059,
        "dEQP-GLES31.functional.ubo.3_level",
        "_array.std140.row_major_mat3x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_011060,
        "dEQP-GLES31.functional.ubo.3_level_ar",
        "ray.std140.column_major_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_011061,
        "dEQP-GLES31.functional.ubo.3_level_arr",
        "ay.std140.column_major_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_011062,
        "dEQP-GLES31.functional.ubo.3_level_a",
        "rray.std140.column_major_mat3x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_011063,
        "dEQP-GLES31.functional.ubo.3_l",
        "evel_array.std140.mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_011064,
        "dEQP-GLES31.functional.ubo.3_le",
        "vel_array.std140.mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_011065,
        "dEQP-GLES31.functional.ubo.3_",
        "level_array.std140.mat4x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_011066,
        "dEQP-GLES31.functional.ubo.3_level_",
        "array.std140.row_major_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_011067,
        "dEQP-GLES31.functional.ubo.3_level_a",
        "rray.std140.row_major_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_011068,
        "dEQP-GLES31.functional.ubo.3_level",
        "_array.std140.row_major_mat4x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_011069,
        "dEQP-GLES31.functional.ubo.3_level_ar",
        "ray.std140.column_major_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_011070,
        "dEQP-GLES31.functional.ubo.3_level_arr",
        "ay.std140.column_major_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_011071,
        "dEQP-GLES31.functional.ubo.3_level_a",
        "rray.std140.column_major_mat4x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_011072,
        "dEQP-GLES31.functional.ubo.3_l",
        "evel_array.std140.mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_011073,
        "dEQP-GLES31.functional.ubo.3_le",
        "vel_array.std140.mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_011074,
        "dEQP-GLES31.functional.ubo.3_",
        "level_array.std140.mat4x3_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_011075,
        "dEQP-GLES31.functional.ubo.3_level_",
        "array.std140.row_major_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_011076,
        "dEQP-GLES31.functional.ubo.3_level_a",
        "rray.std140.row_major_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_011077,
        "dEQP-GLES31.functional.ubo.3_level",
        "_array.std140.row_major_mat4x3_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_011078,
        "dEQP-GLES31.functional.ubo.3_level_ar",
        "ray.std140.column_major_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_011079,
        "dEQP-GLES31.functional.ubo.3_level_arr",
        "ay.std140.column_major_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_011080,
        "dEQP-GLES31.functional.ubo.3_level_a",
        "rray.std140.column_major_mat4x3_both");
