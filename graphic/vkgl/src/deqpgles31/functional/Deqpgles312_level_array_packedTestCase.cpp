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

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009203,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.2_level_array.packed.float");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009204,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.2_level_array.packed.vec2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009205,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.2_level_array.packed.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009206,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.2_level_array.packed.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009207,
        "dEQP-GLES31.functional.ssbo.l",
        "ayout.2_level_array.packed.int");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009208,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.2_level_array.packed.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009209,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.2_level_array.packed.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009210,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.2_level_array.packed.ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009211,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.2_level_array.packed.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009212,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.2_level_array.packed.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009213,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.2_level_array.packed.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009214,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.2_level_array.packed.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009215,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.2_level_array.packed.bool");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009216,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.2_level_array.packed.bvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009217,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.2_level_array.packed.bvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009218,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.2_level_array.packed.bvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009219,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.2_level_array.packed.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009220,
        "dEQP-GLES31.functional.ssbo.layout.",
        "2_level_array.packed.row_major_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009221,
        "dEQP-GLES31.functional.ssbo.layout.2",
        "_level_array.packed.column_major_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009222,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.2_level_array.packed.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009223,
        "dEQP-GLES31.functional.ssbo.layout.",
        "2_level_array.packed.row_major_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009224,
        "dEQP-GLES31.functional.ssbo.layout.2",
        "_level_array.packed.column_major_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009225,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.2_level_array.packed.mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009226,
        "dEQP-GLES31.functional.ssbo.layout.",
        "2_level_array.packed.row_major_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009227,
        "dEQP-GLES31.functional.ssbo.layout.2",
        "_level_array.packed.column_major_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009228,
        "dEQP-GLES31.functional.ssbo.lay",
        "out.2_level_array.packed.mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009229,
        "dEQP-GLES31.functional.ssbo.layout.2",
        "_level_array.packed.row_major_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009230,
        "dEQP-GLES31.functional.ssbo.layout.2_",
        "level_array.packed.column_major_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009231,
        "dEQP-GLES31.functional.ssbo.lay",
        "out.2_level_array.packed.mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009232,
        "dEQP-GLES31.functional.ssbo.layout.2",
        "_level_array.packed.row_major_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009233,
        "dEQP-GLES31.functional.ssbo.layout.2_",
        "level_array.packed.column_major_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009234,
        "dEQP-GLES31.functional.ssbo.lay",
        "out.2_level_array.packed.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009235,
        "dEQP-GLES31.functional.ssbo.layout.2",
        "_level_array.packed.row_major_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009236,
        "dEQP-GLES31.functional.ssbo.layout.2_",
        "level_array.packed.column_major_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009237,
        "dEQP-GLES31.functional.ssbo.lay",
        "out.2_level_array.packed.mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009238,
        "dEQP-GLES31.functional.ssbo.layout.2",
        "_level_array.packed.row_major_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009239,
        "dEQP-GLES31.functional.ssbo.layout.2_",
        "level_array.packed.column_major_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009240,
        "dEQP-GLES31.functional.ssbo.lay",
        "out.2_level_array.packed.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009241,
        "dEQP-GLES31.functional.ssbo.layout.2",
        "_level_array.packed.row_major_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009242,
        "dEQP-GLES31.functional.ssbo.layout.2_",
        "level_array.packed.column_major_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009243,
        "dEQP-GLES31.functional.ssbo.lay",
        "out.2_level_array.packed.mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009244,
        "dEQP-GLES31.functional.ssbo.layout.2",
        "_level_array.packed.row_major_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009245,
        "dEQP-GLES31.functional.ssbo.layout.2_",
        "level_array.packed.column_major_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010522,
        "dEQP-GLES31.functional.ubo.2_l",
        "evel_array.packed.float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010523,
        "dEQP-GLES31.functional.ubo.2_le",
        "vel_array.packed.float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010524,
        "dEQP-GLES31.functional.ubo.2_",
        "level_array.packed.vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010525,
        "dEQP-GLES31.functional.ubo.2_l",
        "evel_array.packed.vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010526,
        "dEQP-GLES31.functional.ubo.2_",
        "level_array.packed.vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010527,
        "dEQP-GLES31.functional.ubo.2_l",
        "evel_array.packed.vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010528,
        "dEQP-GLES31.functional.ubo.2_",
        "level_array.packed.vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010529,
        "dEQP-GLES31.functional.ubo.2_l",
        "evel_array.packed.vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010530,
        "dEQP-GLES31.functional.ubo.2_",
        "level_array.packed.int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010531,
        "dEQP-GLES31.functional.ubo.2_l",
        "evel_array.packed.int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010532,
        "dEQP-GLES31.functional.ubo.2_l",
        "evel_array.packed.ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010533,
        "dEQP-GLES31.functional.ubo.2_le",
        "vel_array.packed.ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010534,
        "dEQP-GLES31.functional.ubo.2_l",
        "evel_array.packed.ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010535,
        "dEQP-GLES31.functional.ubo.2_le",
        "vel_array.packed.ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010536,
        "dEQP-GLES31.functional.ubo.2_l",
        "evel_array.packed.ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010537,
        "dEQP-GLES31.functional.ubo.2_le",
        "vel_array.packed.ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010538,
        "dEQP-GLES31.functional.ubo.2_",
        "level_array.packed.uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010539,
        "dEQP-GLES31.functional.ubo.2_l",
        "evel_array.packed.uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010540,
        "dEQP-GLES31.functional.ubo.2_l",
        "evel_array.packed.uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010541,
        "dEQP-GLES31.functional.ubo.2_le",
        "vel_array.packed.uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010542,
        "dEQP-GLES31.functional.ubo.2_l",
        "evel_array.packed.uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010543,
        "dEQP-GLES31.functional.ubo.2_le",
        "vel_array.packed.uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010544,
        "dEQP-GLES31.functional.ubo.2_l",
        "evel_array.packed.uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010545,
        "dEQP-GLES31.functional.ubo.2_le",
        "vel_array.packed.uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010546,
        "dEQP-GLES31.functional.ubo.2_",
        "level_array.packed.bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010547,
        "dEQP-GLES31.functional.ubo.2_l",
        "evel_array.packed.bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010548,
        "dEQP-GLES31.functional.ubo.2_l",
        "evel_array.packed.bvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010549,
        "dEQP-GLES31.functional.ubo.2_le",
        "vel_array.packed.bvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010550,
        "dEQP-GLES31.functional.ubo.2_l",
        "evel_array.packed.bvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010551,
        "dEQP-GLES31.functional.ubo.2_le",
        "vel_array.packed.bvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010552,
        "dEQP-GLES31.functional.ubo.2_l",
        "evel_array.packed.bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010553,
        "dEQP-GLES31.functional.ubo.2_le",
        "vel_array.packed.bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010554,
        "dEQP-GLES31.functional.ubo.2_",
        "level_array.packed.mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010555,
        "dEQP-GLES31.functional.ubo.2_l",
        "evel_array.packed.mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010556,
        "dEQP-GLES31.functional.ubo.2_level",
        "_array.packed.row_major_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010557,
        "dEQP-GLES31.functional.ubo.2_level_",
        "array.packed.row_major_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010558,
        "dEQP-GLES31.functional.ubo.2_level_a",
        "rray.packed.column_major_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010559,
        "dEQP-GLES31.functional.ubo.2_level_ar",
        "ray.packed.column_major_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010560,
        "dEQP-GLES31.functional.ubo.2_",
        "level_array.packed.mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010561,
        "dEQP-GLES31.functional.ubo.2_l",
        "evel_array.packed.mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010562,
        "dEQP-GLES31.functional.ubo.2_level",
        "_array.packed.row_major_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010563,
        "dEQP-GLES31.functional.ubo.2_level_",
        "array.packed.row_major_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010564,
        "dEQP-GLES31.functional.ubo.2_level_a",
        "rray.packed.column_major_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010565,
        "dEQP-GLES31.functional.ubo.2_level_ar",
        "ray.packed.column_major_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010566,
        "dEQP-GLES31.functional.ubo.2_",
        "level_array.packed.mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010567,
        "dEQP-GLES31.functional.ubo.2_l",
        "evel_array.packed.mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010568,
        "dEQP-GLES31.functional.ubo.2_level",
        "_array.packed.row_major_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010569,
        "dEQP-GLES31.functional.ubo.2_level_",
        "array.packed.row_major_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010570,
        "dEQP-GLES31.functional.ubo.2_level_a",
        "rray.packed.column_major_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010571,
        "dEQP-GLES31.functional.ubo.2_level_ar",
        "ray.packed.column_major_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010572,
        "dEQP-GLES31.functional.ubo.2_l",
        "evel_array.packed.mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010573,
        "dEQP-GLES31.functional.ubo.2_le",
        "vel_array.packed.mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010574,
        "dEQP-GLES31.functional.ubo.2_level_",
        "array.packed.row_major_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010575,
        "dEQP-GLES31.functional.ubo.2_level_a",
        "rray.packed.row_major_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010576,
        "dEQP-GLES31.functional.ubo.2_level_ar",
        "ray.packed.column_major_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010577,
        "dEQP-GLES31.functional.ubo.2_level_arr",
        "ay.packed.column_major_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010578,
        "dEQP-GLES31.functional.ubo.2_l",
        "evel_array.packed.mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010579,
        "dEQP-GLES31.functional.ubo.2_le",
        "vel_array.packed.mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010580,
        "dEQP-GLES31.functional.ubo.2_level_",
        "array.packed.row_major_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010581,
        "dEQP-GLES31.functional.ubo.2_level_a",
        "rray.packed.row_major_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010582,
        "dEQP-GLES31.functional.ubo.2_level_ar",
        "ray.packed.column_major_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010583,
        "dEQP-GLES31.functional.ubo.2_level_arr",
        "ay.packed.column_major_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010584,
        "dEQP-GLES31.functional.ubo.2_l",
        "evel_array.packed.mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010585,
        "dEQP-GLES31.functional.ubo.2_le",
        "vel_array.packed.mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010586,
        "dEQP-GLES31.functional.ubo.2_level_",
        "array.packed.row_major_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010587,
        "dEQP-GLES31.functional.ubo.2_level_a",
        "rray.packed.row_major_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010588,
        "dEQP-GLES31.functional.ubo.2_level_ar",
        "ray.packed.column_major_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010589,
        "dEQP-GLES31.functional.ubo.2_level_arr",
        "ay.packed.column_major_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010590,
        "dEQP-GLES31.functional.ubo.2_l",
        "evel_array.packed.mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010591,
        "dEQP-GLES31.functional.ubo.2_le",
        "vel_array.packed.mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010592,
        "dEQP-GLES31.functional.ubo.2_level_",
        "array.packed.row_major_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010593,
        "dEQP-GLES31.functional.ubo.2_level_a",
        "rray.packed.row_major_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010594,
        "dEQP-GLES31.functional.ubo.2_level_ar",
        "ray.packed.column_major_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010595,
        "dEQP-GLES31.functional.ubo.2_level_arr",
        "ay.packed.column_major_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010596,
        "dEQP-GLES31.functional.ubo.2_l",
        "evel_array.packed.mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010597,
        "dEQP-GLES31.functional.ubo.2_le",
        "vel_array.packed.mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010598,
        "dEQP-GLES31.functional.ubo.2_level_",
        "array.packed.row_major_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010599,
        "dEQP-GLES31.functional.ubo.2_level_a",
        "rray.packed.row_major_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010600,
        "dEQP-GLES31.functional.ubo.2_level_ar",
        "ray.packed.column_major_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010601,
        "dEQP-GLES31.functional.ubo.2_level_arr",
        "ay.packed.column_major_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010602,
        "dEQP-GLES31.functional.ubo.2_l",
        "evel_array.packed.mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010603,
        "dEQP-GLES31.functional.ubo.2_le",
        "vel_array.packed.mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010604,
        "dEQP-GLES31.functional.ubo.2_level_",
        "array.packed.row_major_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010605,
        "dEQP-GLES31.functional.ubo.2_level_a",
        "rray.packed.row_major_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010606,
        "dEQP-GLES31.functional.ubo.2_level_ar",
        "ray.packed.column_major_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010607,
        "dEQP-GLES31.functional.ubo.2_level_arr",
        "ay.packed.column_major_mat4x3_fragment");
