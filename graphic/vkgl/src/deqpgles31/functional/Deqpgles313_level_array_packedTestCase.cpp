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

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009375,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.3_level_array.packed.float");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009376,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.3_level_array.packed.vec2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009377,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.3_level_array.packed.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009378,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.3_level_array.packed.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009379,
        "dEQP-GLES31.functional.ssbo.l",
        "ayout.3_level_array.packed.int");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009380,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.3_level_array.packed.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009381,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.3_level_array.packed.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009382,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.3_level_array.packed.ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009383,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.3_level_array.packed.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009384,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.3_level_array.packed.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009385,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.3_level_array.packed.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009386,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.3_level_array.packed.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009387,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.3_level_array.packed.bool");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009388,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.3_level_array.packed.bvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009389,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.3_level_array.packed.bvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009390,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.3_level_array.packed.bvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009391,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.3_level_array.packed.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009392,
        "dEQP-GLES31.functional.ssbo.layout.",
        "3_level_array.packed.row_major_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009393,
        "dEQP-GLES31.functional.ssbo.layout.3",
        "_level_array.packed.column_major_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009394,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.3_level_array.packed.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009395,
        "dEQP-GLES31.functional.ssbo.layout.",
        "3_level_array.packed.row_major_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009396,
        "dEQP-GLES31.functional.ssbo.layout.3",
        "_level_array.packed.column_major_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009397,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.3_level_array.packed.mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009398,
        "dEQP-GLES31.functional.ssbo.layout.",
        "3_level_array.packed.row_major_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009399,
        "dEQP-GLES31.functional.ssbo.layout.3",
        "_level_array.packed.column_major_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009400,
        "dEQP-GLES31.functional.ssbo.lay",
        "out.3_level_array.packed.mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009401,
        "dEQP-GLES31.functional.ssbo.layout.3",
        "_level_array.packed.row_major_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009402,
        "dEQP-GLES31.functional.ssbo.layout.3_",
        "level_array.packed.column_major_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009403,
        "dEQP-GLES31.functional.ssbo.lay",
        "out.3_level_array.packed.mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009404,
        "dEQP-GLES31.functional.ssbo.layout.3",
        "_level_array.packed.row_major_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009405,
        "dEQP-GLES31.functional.ssbo.layout.3_",
        "level_array.packed.column_major_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009406,
        "dEQP-GLES31.functional.ssbo.lay",
        "out.3_level_array.packed.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009407,
        "dEQP-GLES31.functional.ssbo.layout.3",
        "_level_array.packed.row_major_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009408,
        "dEQP-GLES31.functional.ssbo.layout.3_",
        "level_array.packed.column_major_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009409,
        "dEQP-GLES31.functional.ssbo.lay",
        "out.3_level_array.packed.mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009410,
        "dEQP-GLES31.functional.ssbo.layout.3",
        "_level_array.packed.row_major_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009411,
        "dEQP-GLES31.functional.ssbo.layout.3_",
        "level_array.packed.column_major_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009412,
        "dEQP-GLES31.functional.ssbo.lay",
        "out.3_level_array.packed.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009413,
        "dEQP-GLES31.functional.ssbo.layout.3",
        "_level_array.packed.row_major_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009414,
        "dEQP-GLES31.functional.ssbo.layout.3_",
        "level_array.packed.column_major_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009415,
        "dEQP-GLES31.functional.ssbo.lay",
        "out.3_level_array.packed.mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009416,
        "dEQP-GLES31.functional.ssbo.layout.3",
        "_level_array.packed.row_major_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009417,
        "dEQP-GLES31.functional.ssbo.layout.3_",
        "level_array.packed.column_major_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010866,
        "dEQP-GLES31.functional.ubo.3_l",
        "evel_array.packed.float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010867,
        "dEQP-GLES31.functional.ubo.3_le",
        "vel_array.packed.float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010868,
        "dEQP-GLES31.functional.ubo.3_",
        "level_array.packed.vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010869,
        "dEQP-GLES31.functional.ubo.3_l",
        "evel_array.packed.vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010870,
        "dEQP-GLES31.functional.ubo.3_",
        "level_array.packed.vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010871,
        "dEQP-GLES31.functional.ubo.3_l",
        "evel_array.packed.vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010872,
        "dEQP-GLES31.functional.ubo.3_",
        "level_array.packed.vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010873,
        "dEQP-GLES31.functional.ubo.3_l",
        "evel_array.packed.vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010874,
        "dEQP-GLES31.functional.ubo.3_",
        "level_array.packed.int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010875,
        "dEQP-GLES31.functional.ubo.3_l",
        "evel_array.packed.int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010876,
        "dEQP-GLES31.functional.ubo.3_l",
        "evel_array.packed.ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010877,
        "dEQP-GLES31.functional.ubo.3_le",
        "vel_array.packed.ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010878,
        "dEQP-GLES31.functional.ubo.3_l",
        "evel_array.packed.ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010879,
        "dEQP-GLES31.functional.ubo.3_le",
        "vel_array.packed.ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010880,
        "dEQP-GLES31.functional.ubo.3_l",
        "evel_array.packed.ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010881,
        "dEQP-GLES31.functional.ubo.3_le",
        "vel_array.packed.ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010882,
        "dEQP-GLES31.functional.ubo.3_",
        "level_array.packed.uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010883,
        "dEQP-GLES31.functional.ubo.3_l",
        "evel_array.packed.uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010884,
        "dEQP-GLES31.functional.ubo.3_l",
        "evel_array.packed.uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010885,
        "dEQP-GLES31.functional.ubo.3_le",
        "vel_array.packed.uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010886,
        "dEQP-GLES31.functional.ubo.3_l",
        "evel_array.packed.uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010887,
        "dEQP-GLES31.functional.ubo.3_le",
        "vel_array.packed.uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010888,
        "dEQP-GLES31.functional.ubo.3_l",
        "evel_array.packed.uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010889,
        "dEQP-GLES31.functional.ubo.3_le",
        "vel_array.packed.uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010890,
        "dEQP-GLES31.functional.ubo.3_",
        "level_array.packed.bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010891,
        "dEQP-GLES31.functional.ubo.3_l",
        "evel_array.packed.bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010892,
        "dEQP-GLES31.functional.ubo.3_l",
        "evel_array.packed.bvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010893,
        "dEQP-GLES31.functional.ubo.3_le",
        "vel_array.packed.bvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010894,
        "dEQP-GLES31.functional.ubo.3_l",
        "evel_array.packed.bvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010895,
        "dEQP-GLES31.functional.ubo.3_le",
        "vel_array.packed.bvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010896,
        "dEQP-GLES31.functional.ubo.3_l",
        "evel_array.packed.bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010897,
        "dEQP-GLES31.functional.ubo.3_le",
        "vel_array.packed.bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010898,
        "dEQP-GLES31.functional.ubo.3_",
        "level_array.packed.mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010899,
        "dEQP-GLES31.functional.ubo.3_l",
        "evel_array.packed.mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010900,
        "dEQP-GLES31.functional.ubo.3_level",
        "_array.packed.row_major_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010901,
        "dEQP-GLES31.functional.ubo.3_level_",
        "array.packed.row_major_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010902,
        "dEQP-GLES31.functional.ubo.3_level_a",
        "rray.packed.column_major_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010903,
        "dEQP-GLES31.functional.ubo.3_level_ar",
        "ray.packed.column_major_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010904,
        "dEQP-GLES31.functional.ubo.3_",
        "level_array.packed.mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010905,
        "dEQP-GLES31.functional.ubo.3_l",
        "evel_array.packed.mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010906,
        "dEQP-GLES31.functional.ubo.3_level",
        "_array.packed.row_major_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010907,
        "dEQP-GLES31.functional.ubo.3_level_",
        "array.packed.row_major_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010908,
        "dEQP-GLES31.functional.ubo.3_level_a",
        "rray.packed.column_major_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010909,
        "dEQP-GLES31.functional.ubo.3_level_ar",
        "ray.packed.column_major_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010910,
        "dEQP-GLES31.functional.ubo.3_",
        "level_array.packed.mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010911,
        "dEQP-GLES31.functional.ubo.3_l",
        "evel_array.packed.mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010912,
        "dEQP-GLES31.functional.ubo.3_level",
        "_array.packed.row_major_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010913,
        "dEQP-GLES31.functional.ubo.3_level_",
        "array.packed.row_major_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010914,
        "dEQP-GLES31.functional.ubo.3_level_a",
        "rray.packed.column_major_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010915,
        "dEQP-GLES31.functional.ubo.3_level_ar",
        "ray.packed.column_major_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010916,
        "dEQP-GLES31.functional.ubo.3_l",
        "evel_array.packed.mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010917,
        "dEQP-GLES31.functional.ubo.3_le",
        "vel_array.packed.mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010918,
        "dEQP-GLES31.functional.ubo.3_level_",
        "array.packed.row_major_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010919,
        "dEQP-GLES31.functional.ubo.3_level_a",
        "rray.packed.row_major_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010920,
        "dEQP-GLES31.functional.ubo.3_level_ar",
        "ray.packed.column_major_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010921,
        "dEQP-GLES31.functional.ubo.3_level_arr",
        "ay.packed.column_major_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010922,
        "dEQP-GLES31.functional.ubo.3_l",
        "evel_array.packed.mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010923,
        "dEQP-GLES31.functional.ubo.3_le",
        "vel_array.packed.mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010924,
        "dEQP-GLES31.functional.ubo.3_level_",
        "array.packed.row_major_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010925,
        "dEQP-GLES31.functional.ubo.3_level_a",
        "rray.packed.row_major_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010926,
        "dEQP-GLES31.functional.ubo.3_level_ar",
        "ray.packed.column_major_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010927,
        "dEQP-GLES31.functional.ubo.3_level_arr",
        "ay.packed.column_major_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010928,
        "dEQP-GLES31.functional.ubo.3_l",
        "evel_array.packed.mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010929,
        "dEQP-GLES31.functional.ubo.3_le",
        "vel_array.packed.mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010930,
        "dEQP-GLES31.functional.ubo.3_level_",
        "array.packed.row_major_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010931,
        "dEQP-GLES31.functional.ubo.3_level_a",
        "rray.packed.row_major_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010932,
        "dEQP-GLES31.functional.ubo.3_level_ar",
        "ray.packed.column_major_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010933,
        "dEQP-GLES31.functional.ubo.3_level_arr",
        "ay.packed.column_major_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010934,
        "dEQP-GLES31.functional.ubo.3_l",
        "evel_array.packed.mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010935,
        "dEQP-GLES31.functional.ubo.3_le",
        "vel_array.packed.mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010936,
        "dEQP-GLES31.functional.ubo.3_level_",
        "array.packed.row_major_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010937,
        "dEQP-GLES31.functional.ubo.3_level_a",
        "rray.packed.row_major_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010938,
        "dEQP-GLES31.functional.ubo.3_level_ar",
        "ray.packed.column_major_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010939,
        "dEQP-GLES31.functional.ubo.3_level_arr",
        "ay.packed.column_major_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010940,
        "dEQP-GLES31.functional.ubo.3_l",
        "evel_array.packed.mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010941,
        "dEQP-GLES31.functional.ubo.3_le",
        "vel_array.packed.mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010942,
        "dEQP-GLES31.functional.ubo.3_level_",
        "array.packed.row_major_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010943,
        "dEQP-GLES31.functional.ubo.3_level_a",
        "rray.packed.row_major_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010944,
        "dEQP-GLES31.functional.ubo.3_level_ar",
        "ray.packed.column_major_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010945,
        "dEQP-GLES31.functional.ubo.3_level_arr",
        "ay.packed.column_major_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010946,
        "dEQP-GLES31.functional.ubo.3_l",
        "evel_array.packed.mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010947,
        "dEQP-GLES31.functional.ubo.3_le",
        "vel_array.packed.mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010948,
        "dEQP-GLES31.functional.ubo.3_level_",
        "array.packed.row_major_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010949,
        "dEQP-GLES31.functional.ubo.3_level_a",
        "rray.packed.row_major_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010950,
        "dEQP-GLES31.functional.ubo.3_level_ar",
        "ray.packed.column_major_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010951,
        "dEQP-GLES31.functional.ubo.3_level_arr",
        "ay.packed.column_major_mat4x3_fragment");
