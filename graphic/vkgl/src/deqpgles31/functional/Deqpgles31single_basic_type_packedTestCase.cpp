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
#include "../ActsDeqpgles310009TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008453,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.packed.lowp_float");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008454,
        "dEQP-GLES31.functional.ssbo.layout.s",
        "ingle_basic_type.packed.mediump_float");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008455,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.packed.highp_float");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008456,
        "dEQP-GLES31.functional.ssbo.layout",
        ".single_basic_type.packed.lowp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008457,
        "dEQP-GLES31.functional.ssbo.layout.s",
        "ingle_basic_type.packed.mediump_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008458,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.packed.highp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008459,
        "dEQP-GLES31.functional.ssbo.layout",
        ".single_basic_type.packed.lowp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008460,
        "dEQP-GLES31.functional.ssbo.layout.s",
        "ingle_basic_type.packed.mediump_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008461,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.packed.highp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008462,
        "dEQP-GLES31.functional.ssbo.layout",
        ".single_basic_type.packed.lowp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008463,
        "dEQP-GLES31.functional.ssbo.layout.s",
        "ingle_basic_type.packed.mediump_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008464,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.packed.highp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008465,
        "dEQP-GLES31.functional.ssbo.layout",
        ".single_basic_type.packed.lowp_int");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008466,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.packed.mediump_int");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008467,
        "dEQP-GLES31.functional.ssbo.layout",
        ".single_basic_type.packed.highp_int");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008468,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.packed.lowp_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008469,
        "dEQP-GLES31.functional.ssbo.layout.s",
        "ingle_basic_type.packed.mediump_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008470,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.packed.highp_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008471,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.packed.lowp_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008472,
        "dEQP-GLES31.functional.ssbo.layout.s",
        "ingle_basic_type.packed.mediump_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008473,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.packed.highp_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008474,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.packed.lowp_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008475,
        "dEQP-GLES31.functional.ssbo.layout.s",
        "ingle_basic_type.packed.mediump_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008476,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.packed.highp_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008477,
        "dEQP-GLES31.functional.ssbo.layout",
        ".single_basic_type.packed.lowp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008478,
        "dEQP-GLES31.functional.ssbo.layout.s",
        "ingle_basic_type.packed.mediump_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008479,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.packed.highp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008480,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.packed.lowp_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008481,
        "dEQP-GLES31.functional.ssbo.layout.s",
        "ingle_basic_type.packed.mediump_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008482,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.packed.highp_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008483,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.packed.lowp_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008484,
        "dEQP-GLES31.functional.ssbo.layout.s",
        "ingle_basic_type.packed.mediump_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008485,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.packed.highp_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008486,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.packed.lowp_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008487,
        "dEQP-GLES31.functional.ssbo.layout.s",
        "ingle_basic_type.packed.mediump_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008488,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.packed.highp_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008489,
        "dEQP-GLES31.functional.ssbo.layo",
        "ut.single_basic_type.packed.bool");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008490,
        "dEQP-GLES31.functional.ssbo.layo",
        "ut.single_basic_type.packed.bvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008491,
        "dEQP-GLES31.functional.ssbo.layo",
        "ut.single_basic_type.packed.bvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008492,
        "dEQP-GLES31.functional.ssbo.layo",
        "ut.single_basic_type.packed.bvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008493,
        "dEQP-GLES31.functional.ssbo.layout",
        ".single_basic_type.packed.lowp_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008494,
        "dEQP-GLES31.functional.ssbo.layout.s",
        "ingle_basic_type.packed.mediump_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008495,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.packed.highp_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008496,
        "dEQP-GLES31.functional.ssbo.layout.sing",
        "le_basic_type.packed.row_major_lowp_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008497,
        "dEQP-GLES31.functional.ssbo.layout.single",
        "_basic_type.packed.row_major_mediump_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008498,
        "dEQP-GLES31.functional.ssbo.layout.singl",
        "e_basic_type.packed.row_major_highp_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008499,
        "dEQP-GLES31.functional.ssbo.layout.single",
        "_basic_type.packed.column_major_lowp_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008500,
        "dEQP-GLES31.functional.ssbo.layout.single_",
        "basic_type.packed.column_major_mediump_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008501,
        "dEQP-GLES31.functional.ssbo.layout.single",
        "_basic_type.packed.column_major_highp_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008502,
        "dEQP-GLES31.functional.ssbo.layout",
        ".single_basic_type.packed.lowp_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008503,
        "dEQP-GLES31.functional.ssbo.layout.s",
        "ingle_basic_type.packed.mediump_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008504,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.packed.highp_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008505,
        "dEQP-GLES31.functional.ssbo.layout.sing",
        "le_basic_type.packed.row_major_lowp_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008506,
        "dEQP-GLES31.functional.ssbo.layout.single",
        "_basic_type.packed.row_major_mediump_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008507,
        "dEQP-GLES31.functional.ssbo.layout.singl",
        "e_basic_type.packed.row_major_highp_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008508,
        "dEQP-GLES31.functional.ssbo.layout.single",
        "_basic_type.packed.column_major_lowp_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008509,
        "dEQP-GLES31.functional.ssbo.layout.single_",
        "basic_type.packed.column_major_mediump_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008510,
        "dEQP-GLES31.functional.ssbo.layout.single",
        "_basic_type.packed.column_major_highp_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008511,
        "dEQP-GLES31.functional.ssbo.layout",
        ".single_basic_type.packed.lowp_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008512,
        "dEQP-GLES31.functional.ssbo.layout.s",
        "ingle_basic_type.packed.mediump_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008513,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.packed.highp_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008514,
        "dEQP-GLES31.functional.ssbo.layout.sing",
        "le_basic_type.packed.row_major_lowp_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008515,
        "dEQP-GLES31.functional.ssbo.layout.single",
        "_basic_type.packed.row_major_mediump_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008516,
        "dEQP-GLES31.functional.ssbo.layout.singl",
        "e_basic_type.packed.row_major_highp_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008517,
        "dEQP-GLES31.functional.ssbo.layout.single",
        "_basic_type.packed.column_major_lowp_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008518,
        "dEQP-GLES31.functional.ssbo.layout.single_",
        "basic_type.packed.column_major_mediump_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008519,
        "dEQP-GLES31.functional.ssbo.layout.single",
        "_basic_type.packed.column_major_highp_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008520,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.packed.lowp_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008521,
        "dEQP-GLES31.functional.ssbo.layout.si",
        "ngle_basic_type.packed.mediump_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008522,
        "dEQP-GLES31.functional.ssbo.layout.s",
        "ingle_basic_type.packed.highp_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008523,
        "dEQP-GLES31.functional.ssbo.layout.singl",
        "e_basic_type.packed.row_major_lowp_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008524,
        "dEQP-GLES31.functional.ssbo.layout.single_",
        "basic_type.packed.row_major_mediump_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008525,
        "dEQP-GLES31.functional.ssbo.layout.single",
        "_basic_type.packed.row_major_highp_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008526,
        "dEQP-GLES31.functional.ssbo.layout.single_",
        "basic_type.packed.column_major_lowp_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008527,
        "dEQP-GLES31.functional.ssbo.layout.single_b",
        "asic_type.packed.column_major_mediump_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008528,
        "dEQP-GLES31.functional.ssbo.layout.single_",
        "basic_type.packed.column_major_highp_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008529,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.packed.lowp_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008530,
        "dEQP-GLES31.functional.ssbo.layout.si",
        "ngle_basic_type.packed.mediump_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008531,
        "dEQP-GLES31.functional.ssbo.layout.s",
        "ingle_basic_type.packed.highp_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008532,
        "dEQP-GLES31.functional.ssbo.layout.singl",
        "e_basic_type.packed.row_major_lowp_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008533,
        "dEQP-GLES31.functional.ssbo.layout.single_",
        "basic_type.packed.row_major_mediump_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008534,
        "dEQP-GLES31.functional.ssbo.layout.single",
        "_basic_type.packed.row_major_highp_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008535,
        "dEQP-GLES31.functional.ssbo.layout.single_",
        "basic_type.packed.column_major_lowp_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008536,
        "dEQP-GLES31.functional.ssbo.layout.single_b",
        "asic_type.packed.column_major_mediump_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008537,
        "dEQP-GLES31.functional.ssbo.layout.single_",
        "basic_type.packed.column_major_highp_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008538,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.packed.lowp_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008539,
        "dEQP-GLES31.functional.ssbo.layout.si",
        "ngle_basic_type.packed.mediump_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008540,
        "dEQP-GLES31.functional.ssbo.layout.s",
        "ingle_basic_type.packed.highp_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008541,
        "dEQP-GLES31.functional.ssbo.layout.singl",
        "e_basic_type.packed.row_major_lowp_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008542,
        "dEQP-GLES31.functional.ssbo.layout.single_",
        "basic_type.packed.row_major_mediump_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008543,
        "dEQP-GLES31.functional.ssbo.layout.single",
        "_basic_type.packed.row_major_highp_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008544,
        "dEQP-GLES31.functional.ssbo.layout.single_",
        "basic_type.packed.column_major_lowp_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008545,
        "dEQP-GLES31.functional.ssbo.layout.single_b",
        "asic_type.packed.column_major_mediump_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008546,
        "dEQP-GLES31.functional.ssbo.layout.single_",
        "basic_type.packed.column_major_highp_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008547,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.packed.lowp_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008548,
        "dEQP-GLES31.functional.ssbo.layout.si",
        "ngle_basic_type.packed.mediump_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008549,
        "dEQP-GLES31.functional.ssbo.layout.s",
        "ingle_basic_type.packed.highp_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008550,
        "dEQP-GLES31.functional.ssbo.layout.singl",
        "e_basic_type.packed.row_major_lowp_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008551,
        "dEQP-GLES31.functional.ssbo.layout.single_",
        "basic_type.packed.row_major_mediump_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008552,
        "dEQP-GLES31.functional.ssbo.layout.single",
        "_basic_type.packed.row_major_highp_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008553,
        "dEQP-GLES31.functional.ssbo.layout.single_",
        "basic_type.packed.column_major_lowp_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008554,
        "dEQP-GLES31.functional.ssbo.layout.single_b",
        "asic_type.packed.column_major_mediump_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008555,
        "dEQP-GLES31.functional.ssbo.layout.single_",
        "basic_type.packed.column_major_highp_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008556,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.packed.lowp_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008557,
        "dEQP-GLES31.functional.ssbo.layout.si",
        "ngle_basic_type.packed.mediump_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008558,
        "dEQP-GLES31.functional.ssbo.layout.s",
        "ingle_basic_type.packed.highp_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008559,
        "dEQP-GLES31.functional.ssbo.layout.singl",
        "e_basic_type.packed.row_major_lowp_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008560,
        "dEQP-GLES31.functional.ssbo.layout.single_",
        "basic_type.packed.row_major_mediump_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008561,
        "dEQP-GLES31.functional.ssbo.layout.single",
        "_basic_type.packed.row_major_highp_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008562,
        "dEQP-GLES31.functional.ssbo.layout.single_",
        "basic_type.packed.column_major_lowp_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008563,
        "dEQP-GLES31.functional.ssbo.layout.single_b",
        "asic_type.packed.column_major_mediump_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008564,
        "dEQP-GLES31.functional.ssbo.layout.single_",
        "basic_type.packed.column_major_highp_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008565,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.packed.lowp_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008566,
        "dEQP-GLES31.functional.ssbo.layout.si",
        "ngle_basic_type.packed.mediump_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008567,
        "dEQP-GLES31.functional.ssbo.layout.s",
        "ingle_basic_type.packed.highp_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008568,
        "dEQP-GLES31.functional.ssbo.layout.singl",
        "e_basic_type.packed.row_major_lowp_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008569,
        "dEQP-GLES31.functional.ssbo.layout.single_",
        "basic_type.packed.row_major_mediump_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008570,
        "dEQP-GLES31.functional.ssbo.layout.single",
        "_basic_type.packed.row_major_highp_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008571,
        "dEQP-GLES31.functional.ssbo.layout.single_",
        "basic_type.packed.column_major_lowp_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008572,
        "dEQP-GLES31.functional.ssbo.layout.single_b",
        "asic_type.packed.column_major_mediump_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008573,
        "dEQP-GLES31.functional.ssbo.layout.single_",
        "basic_type.packed.column_major_highp_mat4x3");
