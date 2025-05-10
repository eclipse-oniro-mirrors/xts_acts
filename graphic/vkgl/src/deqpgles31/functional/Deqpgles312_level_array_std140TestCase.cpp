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

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009246,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.2_level_array.std140.float");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009247,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.2_level_array.std140.vec2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009248,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.2_level_array.std140.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009249,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.2_level_array.std140.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009250,
        "dEQP-GLES31.functional.ssbo.l",
        "ayout.2_level_array.std140.int");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009251,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.2_level_array.std140.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009252,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.2_level_array.std140.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009253,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.2_level_array.std140.ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009254,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.2_level_array.std140.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009255,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.2_level_array.std140.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009256,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.2_level_array.std140.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009257,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.2_level_array.std140.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009258,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.2_level_array.std140.bool");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009259,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.2_level_array.std140.bvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009260,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.2_level_array.std140.bvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009261,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.2_level_array.std140.bvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009262,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.2_level_array.std140.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009263,
        "dEQP-GLES31.functional.ssbo.layout.",
        "2_level_array.std140.row_major_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009264,
        "dEQP-GLES31.functional.ssbo.layout.2",
        "_level_array.std140.column_major_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009265,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.2_level_array.std140.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009266,
        "dEQP-GLES31.functional.ssbo.layout.",
        "2_level_array.std140.row_major_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009267,
        "dEQP-GLES31.functional.ssbo.layout.2",
        "_level_array.std140.column_major_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009268,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.2_level_array.std140.mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009269,
        "dEQP-GLES31.functional.ssbo.layout.",
        "2_level_array.std140.row_major_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009270,
        "dEQP-GLES31.functional.ssbo.layout.2",
        "_level_array.std140.column_major_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009271,
        "dEQP-GLES31.functional.ssbo.lay",
        "out.2_level_array.std140.mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009272,
        "dEQP-GLES31.functional.ssbo.layout.2",
        "_level_array.std140.row_major_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009273,
        "dEQP-GLES31.functional.ssbo.layout.2_",
        "level_array.std140.column_major_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009274,
        "dEQP-GLES31.functional.ssbo.lay",
        "out.2_level_array.std140.mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009275,
        "dEQP-GLES31.functional.ssbo.layout.2",
        "_level_array.std140.row_major_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009276,
        "dEQP-GLES31.functional.ssbo.layout.2_",
        "level_array.std140.column_major_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009277,
        "dEQP-GLES31.functional.ssbo.lay",
        "out.2_level_array.std140.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009278,
        "dEQP-GLES31.functional.ssbo.layout.2",
        "_level_array.std140.row_major_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009279,
        "dEQP-GLES31.functional.ssbo.layout.2_",
        "level_array.std140.column_major_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009280,
        "dEQP-GLES31.functional.ssbo.lay",
        "out.2_level_array.std140.mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009281,
        "dEQP-GLES31.functional.ssbo.layout.2",
        "_level_array.std140.row_major_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009282,
        "dEQP-GLES31.functional.ssbo.layout.2_",
        "level_array.std140.column_major_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009283,
        "dEQP-GLES31.functional.ssbo.lay",
        "out.2_level_array.std140.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009284,
        "dEQP-GLES31.functional.ssbo.layout.2",
        "_level_array.std140.row_major_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009285,
        "dEQP-GLES31.functional.ssbo.layout.2_",
        "level_array.std140.column_major_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009286,
        "dEQP-GLES31.functional.ssbo.lay",
        "out.2_level_array.std140.mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009287,
        "dEQP-GLES31.functional.ssbo.layout.2",
        "_level_array.std140.row_major_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009288,
        "dEQP-GLES31.functional.ssbo.layout.2_",
        "level_array.std140.column_major_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010608,
        "dEQP-GLES31.functional.ubo.2_l",
        "evel_array.std140.float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010609,
        "dEQP-GLES31.functional.ubo.2_le",
        "vel_array.std140.float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010610,
        "dEQP-GLES31.functional.ubo.2_",
        "level_array.std140.float_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010611,
        "dEQP-GLES31.functional.ubo.2_",
        "level_array.std140.vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010612,
        "dEQP-GLES31.functional.ubo.2_l",
        "evel_array.std140.vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010613,
        "dEQP-GLES31.functional.ubo.2",
        "_level_array.std140.vec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010614,
        "dEQP-GLES31.functional.ubo.2_",
        "level_array.std140.vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010615,
        "dEQP-GLES31.functional.ubo.2_l",
        "evel_array.std140.vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010616,
        "dEQP-GLES31.functional.ubo.2",
        "_level_array.std140.vec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010617,
        "dEQP-GLES31.functional.ubo.2_",
        "level_array.std140.vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010618,
        "dEQP-GLES31.functional.ubo.2_l",
        "evel_array.std140.vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010619,
        "dEQP-GLES31.functional.ubo.2",
        "_level_array.std140.vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010620,
        "dEQP-GLES31.functional.ubo.2_",
        "level_array.std140.int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010621,
        "dEQP-GLES31.functional.ubo.2_l",
        "evel_array.std140.int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010622,
        "dEQP-GLES31.functional.ubo.2",
        "_level_array.std140.int_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010623,
        "dEQP-GLES31.functional.ubo.2_l",
        "evel_array.std140.ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010624,
        "dEQP-GLES31.functional.ubo.2_le",
        "vel_array.std140.ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010625,
        "dEQP-GLES31.functional.ubo.2_",
        "level_array.std140.ivec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010626,
        "dEQP-GLES31.functional.ubo.2_l",
        "evel_array.std140.ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010627,
        "dEQP-GLES31.functional.ubo.2_le",
        "vel_array.std140.ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010628,
        "dEQP-GLES31.functional.ubo.2_",
        "level_array.std140.ivec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010629,
        "dEQP-GLES31.functional.ubo.2_l",
        "evel_array.std140.ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010630,
        "dEQP-GLES31.functional.ubo.2_le",
        "vel_array.std140.ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010631,
        "dEQP-GLES31.functional.ubo.2_",
        "level_array.std140.ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010632,
        "dEQP-GLES31.functional.ubo.2_",
        "level_array.std140.uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010633,
        "dEQP-GLES31.functional.ubo.2_l",
        "evel_array.std140.uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010634,
        "dEQP-GLES31.functional.ubo.2",
        "_level_array.std140.uint_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010635,
        "dEQP-GLES31.functional.ubo.2_l",
        "evel_array.std140.uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010636,
        "dEQP-GLES31.functional.ubo.2_le",
        "vel_array.std140.uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010637,
        "dEQP-GLES31.functional.ubo.2_",
        "level_array.std140.uvec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010638,
        "dEQP-GLES31.functional.ubo.2_l",
        "evel_array.std140.uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010639,
        "dEQP-GLES31.functional.ubo.2_le",
        "vel_array.std140.uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010640,
        "dEQP-GLES31.functional.ubo.2_",
        "level_array.std140.uvec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010641,
        "dEQP-GLES31.functional.ubo.2_l",
        "evel_array.std140.uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010642,
        "dEQP-GLES31.functional.ubo.2_le",
        "vel_array.std140.uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010643,
        "dEQP-GLES31.functional.ubo.2_",
        "level_array.std140.uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010644,
        "dEQP-GLES31.functional.ubo.2_",
        "level_array.std140.bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010645,
        "dEQP-GLES31.functional.ubo.2_l",
        "evel_array.std140.bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010646,
        "dEQP-GLES31.functional.ubo.2",
        "_level_array.std140.bool_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010647,
        "dEQP-GLES31.functional.ubo.2_l",
        "evel_array.std140.bvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010648,
        "dEQP-GLES31.functional.ubo.2_le",
        "vel_array.std140.bvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010649,
        "dEQP-GLES31.functional.ubo.2_",
        "level_array.std140.bvec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010650,
        "dEQP-GLES31.functional.ubo.2_l",
        "evel_array.std140.bvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010651,
        "dEQP-GLES31.functional.ubo.2_le",
        "vel_array.std140.bvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010652,
        "dEQP-GLES31.functional.ubo.2_",
        "level_array.std140.bvec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010653,
        "dEQP-GLES31.functional.ubo.2_l",
        "evel_array.std140.bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010654,
        "dEQP-GLES31.functional.ubo.2_le",
        "vel_array.std140.bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010655,
        "dEQP-GLES31.functional.ubo.2_",
        "level_array.std140.bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010656,
        "dEQP-GLES31.functional.ubo.2_",
        "level_array.std140.mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010657,
        "dEQP-GLES31.functional.ubo.2_l",
        "evel_array.std140.mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010658,
        "dEQP-GLES31.functional.ubo.2",
        "_level_array.std140.mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010659,
        "dEQP-GLES31.functional.ubo.2_level",
        "_array.std140.row_major_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010660,
        "dEQP-GLES31.functional.ubo.2_level_",
        "array.std140.row_major_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010661,
        "dEQP-GLES31.functional.ubo.2_leve",
        "l_array.std140.row_major_mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010662,
        "dEQP-GLES31.functional.ubo.2_level_a",
        "rray.std140.column_major_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010663,
        "dEQP-GLES31.functional.ubo.2_level_ar",
        "ray.std140.column_major_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010664,
        "dEQP-GLES31.functional.ubo.2_level_",
        "array.std140.column_major_mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010665,
        "dEQP-GLES31.functional.ubo.2_",
        "level_array.std140.mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010666,
        "dEQP-GLES31.functional.ubo.2_l",
        "evel_array.std140.mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010667,
        "dEQP-GLES31.functional.ubo.2",
        "_level_array.std140.mat3_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010668,
        "dEQP-GLES31.functional.ubo.2_level",
        "_array.std140.row_major_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010669,
        "dEQP-GLES31.functional.ubo.2_level_",
        "array.std140.row_major_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010670,
        "dEQP-GLES31.functional.ubo.2_leve",
        "l_array.std140.row_major_mat3_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010671,
        "dEQP-GLES31.functional.ubo.2_level_a",
        "rray.std140.column_major_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010672,
        "dEQP-GLES31.functional.ubo.2_level_ar",
        "ray.std140.column_major_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010673,
        "dEQP-GLES31.functional.ubo.2_level_",
        "array.std140.column_major_mat3_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010674,
        "dEQP-GLES31.functional.ubo.2_",
        "level_array.std140.mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010675,
        "dEQP-GLES31.functional.ubo.2_l",
        "evel_array.std140.mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010676,
        "dEQP-GLES31.functional.ubo.2",
        "_level_array.std140.mat4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010677,
        "dEQP-GLES31.functional.ubo.2_level",
        "_array.std140.row_major_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010678,
        "dEQP-GLES31.functional.ubo.2_level_",
        "array.std140.row_major_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010679,
        "dEQP-GLES31.functional.ubo.2_leve",
        "l_array.std140.row_major_mat4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010680,
        "dEQP-GLES31.functional.ubo.2_level_a",
        "rray.std140.column_major_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010681,
        "dEQP-GLES31.functional.ubo.2_level_ar",
        "ray.std140.column_major_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010682,
        "dEQP-GLES31.functional.ubo.2_level_",
        "array.std140.column_major_mat4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010683,
        "dEQP-GLES31.functional.ubo.2_l",
        "evel_array.std140.mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010684,
        "dEQP-GLES31.functional.ubo.2_le",
        "vel_array.std140.mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010685,
        "dEQP-GLES31.functional.ubo.2_",
        "level_array.std140.mat2x3_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010686,
        "dEQP-GLES31.functional.ubo.2_level_",
        "array.std140.row_major_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010687,
        "dEQP-GLES31.functional.ubo.2_level_a",
        "rray.std140.row_major_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010688,
        "dEQP-GLES31.functional.ubo.2_level",
        "_array.std140.row_major_mat2x3_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010689,
        "dEQP-GLES31.functional.ubo.2_level_ar",
        "ray.std140.column_major_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010690,
        "dEQP-GLES31.functional.ubo.2_level_arr",
        "ay.std140.column_major_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010691,
        "dEQP-GLES31.functional.ubo.2_level_a",
        "rray.std140.column_major_mat2x3_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010692,
        "dEQP-GLES31.functional.ubo.2_l",
        "evel_array.std140.mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010693,
        "dEQP-GLES31.functional.ubo.2_le",
        "vel_array.std140.mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010694,
        "dEQP-GLES31.functional.ubo.2_",
        "level_array.std140.mat2x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010695,
        "dEQP-GLES31.functional.ubo.2_level_",
        "array.std140.row_major_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010696,
        "dEQP-GLES31.functional.ubo.2_level_a",
        "rray.std140.row_major_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010697,
        "dEQP-GLES31.functional.ubo.2_level",
        "_array.std140.row_major_mat2x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010698,
        "dEQP-GLES31.functional.ubo.2_level_ar",
        "ray.std140.column_major_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010699,
        "dEQP-GLES31.functional.ubo.2_level_arr",
        "ay.std140.column_major_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010700,
        "dEQP-GLES31.functional.ubo.2_level_a",
        "rray.std140.column_major_mat2x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010701,
        "dEQP-GLES31.functional.ubo.2_l",
        "evel_array.std140.mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010702,
        "dEQP-GLES31.functional.ubo.2_le",
        "vel_array.std140.mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010703,
        "dEQP-GLES31.functional.ubo.2_",
        "level_array.std140.mat3x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010704,
        "dEQP-GLES31.functional.ubo.2_level_",
        "array.std140.row_major_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010705,
        "dEQP-GLES31.functional.ubo.2_level_a",
        "rray.std140.row_major_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010706,
        "dEQP-GLES31.functional.ubo.2_level",
        "_array.std140.row_major_mat3x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010707,
        "dEQP-GLES31.functional.ubo.2_level_ar",
        "ray.std140.column_major_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010708,
        "dEQP-GLES31.functional.ubo.2_level_arr",
        "ay.std140.column_major_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010709,
        "dEQP-GLES31.functional.ubo.2_level_a",
        "rray.std140.column_major_mat3x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010710,
        "dEQP-GLES31.functional.ubo.2_l",
        "evel_array.std140.mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010711,
        "dEQP-GLES31.functional.ubo.2_le",
        "vel_array.std140.mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010712,
        "dEQP-GLES31.functional.ubo.2_",
        "level_array.std140.mat3x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010713,
        "dEQP-GLES31.functional.ubo.2_level_",
        "array.std140.row_major_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010714,
        "dEQP-GLES31.functional.ubo.2_level_a",
        "rray.std140.row_major_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010715,
        "dEQP-GLES31.functional.ubo.2_level",
        "_array.std140.row_major_mat3x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010716,
        "dEQP-GLES31.functional.ubo.2_level_ar",
        "ray.std140.column_major_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010717,
        "dEQP-GLES31.functional.ubo.2_level_arr",
        "ay.std140.column_major_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010718,
        "dEQP-GLES31.functional.ubo.2_level_a",
        "rray.std140.column_major_mat3x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010719,
        "dEQP-GLES31.functional.ubo.2_l",
        "evel_array.std140.mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010720,
        "dEQP-GLES31.functional.ubo.2_le",
        "vel_array.std140.mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010721,
        "dEQP-GLES31.functional.ubo.2_",
        "level_array.std140.mat4x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010722,
        "dEQP-GLES31.functional.ubo.2_level_",
        "array.std140.row_major_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010723,
        "dEQP-GLES31.functional.ubo.2_level_a",
        "rray.std140.row_major_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010724,
        "dEQP-GLES31.functional.ubo.2_level",
        "_array.std140.row_major_mat4x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010725,
        "dEQP-GLES31.functional.ubo.2_level_ar",
        "ray.std140.column_major_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010726,
        "dEQP-GLES31.functional.ubo.2_level_arr",
        "ay.std140.column_major_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010727,
        "dEQP-GLES31.functional.ubo.2_level_a",
        "rray.std140.column_major_mat4x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010728,
        "dEQP-GLES31.functional.ubo.2_l",
        "evel_array.std140.mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010729,
        "dEQP-GLES31.functional.ubo.2_le",
        "vel_array.std140.mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010730,
        "dEQP-GLES31.functional.ubo.2_",
        "level_array.std140.mat4x3_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010731,
        "dEQP-GLES31.functional.ubo.2_level_",
        "array.std140.row_major_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010732,
        "dEQP-GLES31.functional.ubo.2_level_a",
        "rray.std140.row_major_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010733,
        "dEQP-GLES31.functional.ubo.2_level",
        "_array.std140.row_major_mat4x3_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010734,
        "dEQP-GLES31.functional.ubo.2_level_ar",
        "ray.std140.column_major_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010735,
        "dEQP-GLES31.functional.ubo.2_level_arr",
        "ay.std140.column_major_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010736,
        "dEQP-GLES31.functional.ubo.2_level_a",
        "rray.std140.column_major_mat4x3_both");
