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

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009160,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.2_level_array.shared.float");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009161,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.2_level_array.shared.vec2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009162,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.2_level_array.shared.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009163,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.2_level_array.shared.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009164,
        "dEQP-GLES31.functional.ssbo.l",
        "ayout.2_level_array.shared.int");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009165,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.2_level_array.shared.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009166,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.2_level_array.shared.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009167,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.2_level_array.shared.ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009168,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.2_level_array.shared.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009169,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.2_level_array.shared.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009170,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.2_level_array.shared.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009171,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.2_level_array.shared.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009172,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.2_level_array.shared.bool");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009173,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.2_level_array.shared.bvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009174,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.2_level_array.shared.bvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009175,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.2_level_array.shared.bvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009176,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.2_level_array.shared.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009177,
        "dEQP-GLES31.functional.ssbo.layout.",
        "2_level_array.shared.row_major_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009178,
        "dEQP-GLES31.functional.ssbo.layout.2",
        "_level_array.shared.column_major_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009179,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.2_level_array.shared.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009180,
        "dEQP-GLES31.functional.ssbo.layout.",
        "2_level_array.shared.row_major_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009181,
        "dEQP-GLES31.functional.ssbo.layout.2",
        "_level_array.shared.column_major_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009182,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.2_level_array.shared.mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009183,
        "dEQP-GLES31.functional.ssbo.layout.",
        "2_level_array.shared.row_major_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009184,
        "dEQP-GLES31.functional.ssbo.layout.2",
        "_level_array.shared.column_major_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009185,
        "dEQP-GLES31.functional.ssbo.lay",
        "out.2_level_array.shared.mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009186,
        "dEQP-GLES31.functional.ssbo.layout.2",
        "_level_array.shared.row_major_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009187,
        "dEQP-GLES31.functional.ssbo.layout.2_",
        "level_array.shared.column_major_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009188,
        "dEQP-GLES31.functional.ssbo.lay",
        "out.2_level_array.shared.mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009189,
        "dEQP-GLES31.functional.ssbo.layout.2",
        "_level_array.shared.row_major_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009190,
        "dEQP-GLES31.functional.ssbo.layout.2_",
        "level_array.shared.column_major_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009191,
        "dEQP-GLES31.functional.ssbo.lay",
        "out.2_level_array.shared.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009192,
        "dEQP-GLES31.functional.ssbo.layout.2",
        "_level_array.shared.row_major_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009193,
        "dEQP-GLES31.functional.ssbo.layout.2_",
        "level_array.shared.column_major_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009194,
        "dEQP-GLES31.functional.ssbo.lay",
        "out.2_level_array.shared.mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009195,
        "dEQP-GLES31.functional.ssbo.layout.2",
        "_level_array.shared.row_major_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009196,
        "dEQP-GLES31.functional.ssbo.layout.2_",
        "level_array.shared.column_major_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009197,
        "dEQP-GLES31.functional.ssbo.lay",
        "out.2_level_array.shared.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009198,
        "dEQP-GLES31.functional.ssbo.layout.2",
        "_level_array.shared.row_major_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009199,
        "dEQP-GLES31.functional.ssbo.layout.2_",
        "level_array.shared.column_major_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009200,
        "dEQP-GLES31.functional.ssbo.lay",
        "out.2_level_array.shared.mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009201,
        "dEQP-GLES31.functional.ssbo.layout.2",
        "_level_array.shared.row_major_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009202,
        "dEQP-GLES31.functional.ssbo.layout.2_",
        "level_array.shared.column_major_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010393,
        "dEQP-GLES31.functional.ubo.2_l",
        "evel_array.shared.float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010394,
        "dEQP-GLES31.functional.ubo.2_le",
        "vel_array.shared.float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010395,
        "dEQP-GLES31.functional.ubo.2_",
        "level_array.shared.float_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010396,
        "dEQP-GLES31.functional.ubo.2_",
        "level_array.shared.vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010397,
        "dEQP-GLES31.functional.ubo.2_l",
        "evel_array.shared.vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010398,
        "dEQP-GLES31.functional.ubo.2",
        "_level_array.shared.vec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010399,
        "dEQP-GLES31.functional.ubo.2_",
        "level_array.shared.vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010400,
        "dEQP-GLES31.functional.ubo.2_l",
        "evel_array.shared.vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010401,
        "dEQP-GLES31.functional.ubo.2",
        "_level_array.shared.vec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010402,
        "dEQP-GLES31.functional.ubo.2_",
        "level_array.shared.vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010403,
        "dEQP-GLES31.functional.ubo.2_l",
        "evel_array.shared.vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010404,
        "dEQP-GLES31.functional.ubo.2",
        "_level_array.shared.vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010405,
        "dEQP-GLES31.functional.ubo.2_",
        "level_array.shared.int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010406,
        "dEQP-GLES31.functional.ubo.2_l",
        "evel_array.shared.int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010407,
        "dEQP-GLES31.functional.ubo.2",
        "_level_array.shared.int_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010408,
        "dEQP-GLES31.functional.ubo.2_l",
        "evel_array.shared.ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010409,
        "dEQP-GLES31.functional.ubo.2_le",
        "vel_array.shared.ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010410,
        "dEQP-GLES31.functional.ubo.2_",
        "level_array.shared.ivec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010411,
        "dEQP-GLES31.functional.ubo.2_l",
        "evel_array.shared.ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010412,
        "dEQP-GLES31.functional.ubo.2_le",
        "vel_array.shared.ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010413,
        "dEQP-GLES31.functional.ubo.2_",
        "level_array.shared.ivec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010414,
        "dEQP-GLES31.functional.ubo.2_l",
        "evel_array.shared.ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010415,
        "dEQP-GLES31.functional.ubo.2_le",
        "vel_array.shared.ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010416,
        "dEQP-GLES31.functional.ubo.2_",
        "level_array.shared.ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010417,
        "dEQP-GLES31.functional.ubo.2_",
        "level_array.shared.uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010418,
        "dEQP-GLES31.functional.ubo.2_l",
        "evel_array.shared.uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010419,
        "dEQP-GLES31.functional.ubo.2",
        "_level_array.shared.uint_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010420,
        "dEQP-GLES31.functional.ubo.2_l",
        "evel_array.shared.uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010421,
        "dEQP-GLES31.functional.ubo.2_le",
        "vel_array.shared.uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010422,
        "dEQP-GLES31.functional.ubo.2_",
        "level_array.shared.uvec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010423,
        "dEQP-GLES31.functional.ubo.2_l",
        "evel_array.shared.uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010424,
        "dEQP-GLES31.functional.ubo.2_le",
        "vel_array.shared.uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010425,
        "dEQP-GLES31.functional.ubo.2_",
        "level_array.shared.uvec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010426,
        "dEQP-GLES31.functional.ubo.2_l",
        "evel_array.shared.uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010427,
        "dEQP-GLES31.functional.ubo.2_le",
        "vel_array.shared.uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010428,
        "dEQP-GLES31.functional.ubo.2_",
        "level_array.shared.uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010429,
        "dEQP-GLES31.functional.ubo.2_",
        "level_array.shared.bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010430,
        "dEQP-GLES31.functional.ubo.2_l",
        "evel_array.shared.bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010431,
        "dEQP-GLES31.functional.ubo.2",
        "_level_array.shared.bool_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010432,
        "dEQP-GLES31.functional.ubo.2_l",
        "evel_array.shared.bvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010433,
        "dEQP-GLES31.functional.ubo.2_le",
        "vel_array.shared.bvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010434,
        "dEQP-GLES31.functional.ubo.2_",
        "level_array.shared.bvec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010435,
        "dEQP-GLES31.functional.ubo.2_l",
        "evel_array.shared.bvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010436,
        "dEQP-GLES31.functional.ubo.2_le",
        "vel_array.shared.bvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010437,
        "dEQP-GLES31.functional.ubo.2_",
        "level_array.shared.bvec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010438,
        "dEQP-GLES31.functional.ubo.2_l",
        "evel_array.shared.bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010439,
        "dEQP-GLES31.functional.ubo.2_le",
        "vel_array.shared.bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010440,
        "dEQP-GLES31.functional.ubo.2_",
        "level_array.shared.bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010441,
        "dEQP-GLES31.functional.ubo.2_",
        "level_array.shared.mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010442,
        "dEQP-GLES31.functional.ubo.2_l",
        "evel_array.shared.mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010443,
        "dEQP-GLES31.functional.ubo.2",
        "_level_array.shared.mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010444,
        "dEQP-GLES31.functional.ubo.2_level",
        "_array.shared.row_major_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010445,
        "dEQP-GLES31.functional.ubo.2_level_",
        "array.shared.row_major_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010446,
        "dEQP-GLES31.functional.ubo.2_leve",
        "l_array.shared.row_major_mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010447,
        "dEQP-GLES31.functional.ubo.2_level_a",
        "rray.shared.column_major_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010448,
        "dEQP-GLES31.functional.ubo.2_level_ar",
        "ray.shared.column_major_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010449,
        "dEQP-GLES31.functional.ubo.2_level_",
        "array.shared.column_major_mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010450,
        "dEQP-GLES31.functional.ubo.2_",
        "level_array.shared.mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010451,
        "dEQP-GLES31.functional.ubo.2_l",
        "evel_array.shared.mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010452,
        "dEQP-GLES31.functional.ubo.2",
        "_level_array.shared.mat3_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010453,
        "dEQP-GLES31.functional.ubo.2_level",
        "_array.shared.row_major_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010454,
        "dEQP-GLES31.functional.ubo.2_level_",
        "array.shared.row_major_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010455,
        "dEQP-GLES31.functional.ubo.2_leve",
        "l_array.shared.row_major_mat3_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010456,
        "dEQP-GLES31.functional.ubo.2_level_a",
        "rray.shared.column_major_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010457,
        "dEQP-GLES31.functional.ubo.2_level_ar",
        "ray.shared.column_major_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010458,
        "dEQP-GLES31.functional.ubo.2_level_",
        "array.shared.column_major_mat3_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010459,
        "dEQP-GLES31.functional.ubo.2_",
        "level_array.shared.mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010460,
        "dEQP-GLES31.functional.ubo.2_l",
        "evel_array.shared.mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010461,
        "dEQP-GLES31.functional.ubo.2",
        "_level_array.shared.mat4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010462,
        "dEQP-GLES31.functional.ubo.2_level",
        "_array.shared.row_major_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010463,
        "dEQP-GLES31.functional.ubo.2_level_",
        "array.shared.row_major_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010464,
        "dEQP-GLES31.functional.ubo.2_leve",
        "l_array.shared.row_major_mat4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010465,
        "dEQP-GLES31.functional.ubo.2_level_a",
        "rray.shared.column_major_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010466,
        "dEQP-GLES31.functional.ubo.2_level_ar",
        "ray.shared.column_major_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010467,
        "dEQP-GLES31.functional.ubo.2_level_",
        "array.shared.column_major_mat4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010468,
        "dEQP-GLES31.functional.ubo.2_l",
        "evel_array.shared.mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010469,
        "dEQP-GLES31.functional.ubo.2_le",
        "vel_array.shared.mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010470,
        "dEQP-GLES31.functional.ubo.2_",
        "level_array.shared.mat2x3_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010471,
        "dEQP-GLES31.functional.ubo.2_level_",
        "array.shared.row_major_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010472,
        "dEQP-GLES31.functional.ubo.2_level_a",
        "rray.shared.row_major_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010473,
        "dEQP-GLES31.functional.ubo.2_level",
        "_array.shared.row_major_mat2x3_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010474,
        "dEQP-GLES31.functional.ubo.2_level_ar",
        "ray.shared.column_major_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010475,
        "dEQP-GLES31.functional.ubo.2_level_arr",
        "ay.shared.column_major_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010476,
        "dEQP-GLES31.functional.ubo.2_level_a",
        "rray.shared.column_major_mat2x3_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010477,
        "dEQP-GLES31.functional.ubo.2_l",
        "evel_array.shared.mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010478,
        "dEQP-GLES31.functional.ubo.2_le",
        "vel_array.shared.mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010479,
        "dEQP-GLES31.functional.ubo.2_",
        "level_array.shared.mat2x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010480,
        "dEQP-GLES31.functional.ubo.2_level_",
        "array.shared.row_major_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010481,
        "dEQP-GLES31.functional.ubo.2_level_a",
        "rray.shared.row_major_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010482,
        "dEQP-GLES31.functional.ubo.2_level",
        "_array.shared.row_major_mat2x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010483,
        "dEQP-GLES31.functional.ubo.2_level_ar",
        "ray.shared.column_major_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010484,
        "dEQP-GLES31.functional.ubo.2_level_arr",
        "ay.shared.column_major_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010485,
        "dEQP-GLES31.functional.ubo.2_level_a",
        "rray.shared.column_major_mat2x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010486,
        "dEQP-GLES31.functional.ubo.2_l",
        "evel_array.shared.mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010487,
        "dEQP-GLES31.functional.ubo.2_le",
        "vel_array.shared.mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010488,
        "dEQP-GLES31.functional.ubo.2_",
        "level_array.shared.mat3x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010489,
        "dEQP-GLES31.functional.ubo.2_level_",
        "array.shared.row_major_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010490,
        "dEQP-GLES31.functional.ubo.2_level_a",
        "rray.shared.row_major_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010491,
        "dEQP-GLES31.functional.ubo.2_level",
        "_array.shared.row_major_mat3x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010492,
        "dEQP-GLES31.functional.ubo.2_level_ar",
        "ray.shared.column_major_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010493,
        "dEQP-GLES31.functional.ubo.2_level_arr",
        "ay.shared.column_major_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010494,
        "dEQP-GLES31.functional.ubo.2_level_a",
        "rray.shared.column_major_mat3x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010495,
        "dEQP-GLES31.functional.ubo.2_l",
        "evel_array.shared.mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010496,
        "dEQP-GLES31.functional.ubo.2_le",
        "vel_array.shared.mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010497,
        "dEQP-GLES31.functional.ubo.2_",
        "level_array.shared.mat3x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010498,
        "dEQP-GLES31.functional.ubo.2_level_",
        "array.shared.row_major_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010499,
        "dEQP-GLES31.functional.ubo.2_level_a",
        "rray.shared.row_major_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010500,
        "dEQP-GLES31.functional.ubo.2_level",
        "_array.shared.row_major_mat3x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010501,
        "dEQP-GLES31.functional.ubo.2_level_ar",
        "ray.shared.column_major_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010502,
        "dEQP-GLES31.functional.ubo.2_level_arr",
        "ay.shared.column_major_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010503,
        "dEQP-GLES31.functional.ubo.2_level_a",
        "rray.shared.column_major_mat3x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010504,
        "dEQP-GLES31.functional.ubo.2_l",
        "evel_array.shared.mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010505,
        "dEQP-GLES31.functional.ubo.2_le",
        "vel_array.shared.mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010506,
        "dEQP-GLES31.functional.ubo.2_",
        "level_array.shared.mat4x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010507,
        "dEQP-GLES31.functional.ubo.2_level_",
        "array.shared.row_major_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010508,
        "dEQP-GLES31.functional.ubo.2_level_a",
        "rray.shared.row_major_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010509,
        "dEQP-GLES31.functional.ubo.2_level",
        "_array.shared.row_major_mat4x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010510,
        "dEQP-GLES31.functional.ubo.2_level_ar",
        "ray.shared.column_major_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010511,
        "dEQP-GLES31.functional.ubo.2_level_arr",
        "ay.shared.column_major_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010512,
        "dEQP-GLES31.functional.ubo.2_level_a",
        "rray.shared.column_major_mat4x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010513,
        "dEQP-GLES31.functional.ubo.2_l",
        "evel_array.shared.mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010514,
        "dEQP-GLES31.functional.ubo.2_le",
        "vel_array.shared.mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010515,
        "dEQP-GLES31.functional.ubo.2_",
        "level_array.shared.mat4x3_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010516,
        "dEQP-GLES31.functional.ubo.2_level_",
        "array.shared.row_major_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010517,
        "dEQP-GLES31.functional.ubo.2_level_a",
        "rray.shared.row_major_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010518,
        "dEQP-GLES31.functional.ubo.2_level",
        "_array.shared.row_major_mat4x3_both");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010519,
        "dEQP-GLES31.functional.ubo.2_level_ar",
        "ray.shared.column_major_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010520,
        "dEQP-GLES31.functional.ubo.2_level_arr",
        "ay.shared.column_major_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_010521,
        "dEQP-GLES31.functional.ubo.2_level_a",
        "rray.shared.column_major_mat4x3_both");
