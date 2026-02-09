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
#include "../Khrgles3BaseFunc.h"
#include "../ActsKhrgles30002TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001597,
        "KHR-GLES3.shaders.uniform_block.s",
        "ingle_basic_type.packed.lowp_float");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001598,
        "KHR-GLES3.shaders.uniform_block.sin",
        "gle_basic_type.packed.mediump_float");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001599,
        "KHR-GLES3.shaders.uniform_block.si",
        "ngle_basic_type.packed.highp_float");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001600,
        "KHR-GLES3.shaders.uniform_block.s",
        "ingle_basic_type.packed.lowp_vec2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001601,
        "KHR-GLES3.shaders.uniform_block.si",
        "ngle_basic_type.packed.mediump_vec2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001602,
        "KHR-GLES3.shaders.uniform_block.s",
        "ingle_basic_type.packed.highp_vec2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001603,
        "KHR-GLES3.shaders.uniform_block.s",
        "ingle_basic_type.packed.lowp_vec3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001604,
        "KHR-GLES3.shaders.uniform_block.si",
        "ngle_basic_type.packed.mediump_vec3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001605,
        "KHR-GLES3.shaders.uniform_block.s",
        "ingle_basic_type.packed.highp_vec3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001606,
        "KHR-GLES3.shaders.uniform_block.s",
        "ingle_basic_type.packed.lowp_vec4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001607,
        "KHR-GLES3.shaders.uniform_block.si",
        "ngle_basic_type.packed.mediump_vec4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001608,
        "KHR-GLES3.shaders.uniform_block.s",
        "ingle_basic_type.packed.highp_vec4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001609,
        "KHR-GLES3.shaders.uniform_block.",
        "single_basic_type.packed.lowp_int");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001610,
        "KHR-GLES3.shaders.uniform_block.si",
        "ngle_basic_type.packed.mediump_int");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001611,
        "KHR-GLES3.shaders.uniform_block.s",
        "ingle_basic_type.packed.highp_int");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001612,
        "KHR-GLES3.shaders.uniform_block.s",
        "ingle_basic_type.packed.lowp_ivec2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001613,
        "KHR-GLES3.shaders.uniform_block.sin",
        "gle_basic_type.packed.mediump_ivec2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001614,
        "KHR-GLES3.shaders.uniform_block.si",
        "ngle_basic_type.packed.highp_ivec2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001615,
        "KHR-GLES3.shaders.uniform_block.s",
        "ingle_basic_type.packed.lowp_ivec3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001616,
        "KHR-GLES3.shaders.uniform_block.sin",
        "gle_basic_type.packed.mediump_ivec3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001617,
        "KHR-GLES3.shaders.uniform_block.si",
        "ngle_basic_type.packed.highp_ivec3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001618,
        "KHR-GLES3.shaders.uniform_block.s",
        "ingle_basic_type.packed.lowp_ivec4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001619,
        "KHR-GLES3.shaders.uniform_block.sin",
        "gle_basic_type.packed.mediump_ivec4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001620,
        "KHR-GLES3.shaders.uniform_block.si",
        "ngle_basic_type.packed.highp_ivec4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001621,
        "KHR-GLES3.shaders.uniform_block.s",
        "ingle_basic_type.packed.lowp_uint");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001622,
        "KHR-GLES3.shaders.uniform_block.si",
        "ngle_basic_type.packed.mediump_uint");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001623,
        "KHR-GLES3.shaders.uniform_block.s",
        "ingle_basic_type.packed.highp_uint");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001624,
        "KHR-GLES3.shaders.uniform_block.s",
        "ingle_basic_type.packed.lowp_uvec2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001625,
        "KHR-GLES3.shaders.uniform_block.sin",
        "gle_basic_type.packed.mediump_uvec2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001626,
        "KHR-GLES3.shaders.uniform_block.si",
        "ngle_basic_type.packed.highp_uvec2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001627,
        "KHR-GLES3.shaders.uniform_block.s",
        "ingle_basic_type.packed.lowp_uvec3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001628,
        "KHR-GLES3.shaders.uniform_block.sin",
        "gle_basic_type.packed.mediump_uvec3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001629,
        "KHR-GLES3.shaders.uniform_block.si",
        "ngle_basic_type.packed.highp_uvec3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001630,
        "KHR-GLES3.shaders.uniform_block.s",
        "ingle_basic_type.packed.lowp_uvec4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001631,
        "KHR-GLES3.shaders.uniform_block.sin",
        "gle_basic_type.packed.mediump_uvec4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001632,
        "KHR-GLES3.shaders.uniform_block.si",
        "ngle_basic_type.packed.highp_uvec4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001633,
        "KHR-GLES3.shaders.uniform_bloc",
        "k.single_basic_type.packed.bool");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001634,
        "KHR-GLES3.shaders.uniform_block",
        ".single_basic_type.packed.bvec2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001635,
        "KHR-GLES3.shaders.uniform_block",
        ".single_basic_type.packed.bvec3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001636,
        "KHR-GLES3.shaders.uniform_block",
        ".single_basic_type.packed.bvec4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001637,
        "KHR-GLES3.shaders.uniform_block.s",
        "ingle_basic_type.packed.lowp_mat2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001638,
        "KHR-GLES3.shaders.uniform_block.si",
        "ngle_basic_type.packed.mediump_mat2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001639,
        "KHR-GLES3.shaders.uniform_block.s",
        "ingle_basic_type.packed.highp_mat2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001640,
        "KHR-GLES3.shaders.uniform_block.single",
        "_basic_type.packed.row_major_lowp_mat2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001641,
        "KHR-GLES3.shaders.uniform_block.single_",
        "basic_type.packed.row_major_mediump_mat2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001642,
        "KHR-GLES3.shaders.uniform_block.single",
        "_basic_type.packed.row_major_highp_mat2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001643,
        "KHR-GLES3.shaders.uniform_block.single_",
        "basic_type.packed.column_major_lowp_mat2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001644,
        "KHR-GLES3.shaders.uniform_block.single_ba",
        "sic_type.packed.column_major_mediump_mat2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001645,
        "KHR-GLES3.shaders.uniform_block.single_b",
        "asic_type.packed.column_major_highp_mat2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001646,
        "KHR-GLES3.shaders.uniform_block.s",
        "ingle_basic_type.packed.lowp_mat3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001647,
        "KHR-GLES3.shaders.uniform_block.si",
        "ngle_basic_type.packed.mediump_mat3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001648,
        "KHR-GLES3.shaders.uniform_block.s",
        "ingle_basic_type.packed.highp_mat3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001649,
        "KHR-GLES3.shaders.uniform_block.single",
        "_basic_type.packed.row_major_lowp_mat3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001650,
        "KHR-GLES3.shaders.uniform_block.single_",
        "basic_type.packed.row_major_mediump_mat3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001651,
        "KHR-GLES3.shaders.uniform_block.single",
        "_basic_type.packed.row_major_highp_mat3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001652,
        "KHR-GLES3.shaders.uniform_block.single_",
        "basic_type.packed.column_major_lowp_mat3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001653,
        "KHR-GLES3.shaders.uniform_block.single_ba",
        "sic_type.packed.column_major_mediump_mat3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001654,
        "KHR-GLES3.shaders.uniform_block.single_b",
        "asic_type.packed.column_major_highp_mat3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001655,
        "KHR-GLES3.shaders.uniform_block.s",
        "ingle_basic_type.packed.lowp_mat4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001656,
        "KHR-GLES3.shaders.uniform_block.si",
        "ngle_basic_type.packed.mediump_mat4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001657,
        "KHR-GLES3.shaders.uniform_block.s",
        "ingle_basic_type.packed.highp_mat4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001658,
        "KHR-GLES3.shaders.uniform_block.single",
        "_basic_type.packed.row_major_lowp_mat4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001659,
        "KHR-GLES3.shaders.uniform_block.single_",
        "basic_type.packed.row_major_mediump_mat4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001660,
        "KHR-GLES3.shaders.uniform_block.single",
        "_basic_type.packed.row_major_highp_mat4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001661,
        "KHR-GLES3.shaders.uniform_block.single_",
        "basic_type.packed.column_major_lowp_mat4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001662,
        "KHR-GLES3.shaders.uniform_block.single_ba",
        "sic_type.packed.column_major_mediump_mat4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001663,
        "KHR-GLES3.shaders.uniform_block.single_b",
        "asic_type.packed.column_major_highp_mat4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001664,
        "KHR-GLES3.shaders.uniform_block.si",
        "ngle_basic_type.packed.lowp_mat2x3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001665,
        "KHR-GLES3.shaders.uniform_block.sin",
        "gle_basic_type.packed.mediump_mat2x3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001666,
        "KHR-GLES3.shaders.uniform_block.si",
        "ngle_basic_type.packed.highp_mat2x3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001667,
        "KHR-GLES3.shaders.uniform_block.single_",
        "basic_type.packed.row_major_lowp_mat2x3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001668,
        "KHR-GLES3.shaders.uniform_block.single_b",
        "asic_type.packed.row_major_mediump_mat2x3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001669,
        "KHR-GLES3.shaders.uniform_block.single_",
        "basic_type.packed.row_major_highp_mat2x3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001670,
        "KHR-GLES3.shaders.uniform_block.single_b",
        "asic_type.packed.column_major_lowp_mat2x3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001671,
        "KHR-GLES3.shaders.uniform_block.single_bas",
        "ic_type.packed.column_major_mediump_mat2x3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001672,
        "KHR-GLES3.shaders.uniform_block.single_ba",
        "sic_type.packed.column_major_highp_mat2x3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001673,
        "KHR-GLES3.shaders.uniform_block.si",
        "ngle_basic_type.packed.lowp_mat2x4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001674,
        "KHR-GLES3.shaders.uniform_block.sin",
        "gle_basic_type.packed.mediump_mat2x4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001675,
        "KHR-GLES3.shaders.uniform_block.si",
        "ngle_basic_type.packed.highp_mat2x4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001676,
        "KHR-GLES3.shaders.uniform_block.single_",
        "basic_type.packed.row_major_lowp_mat2x4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001677,
        "KHR-GLES3.shaders.uniform_block.single_b",
        "asic_type.packed.row_major_mediump_mat2x4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001678,
        "KHR-GLES3.shaders.uniform_block.single_",
        "basic_type.packed.row_major_highp_mat2x4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001679,
        "KHR-GLES3.shaders.uniform_block.single_b",
        "asic_type.packed.column_major_lowp_mat2x4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001680,
        "KHR-GLES3.shaders.uniform_block.single_bas",
        "ic_type.packed.column_major_mediump_mat2x4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001681,
        "KHR-GLES3.shaders.uniform_block.single_ba",
        "sic_type.packed.column_major_highp_mat2x4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001682,
        "KHR-GLES3.shaders.uniform_block.si",
        "ngle_basic_type.packed.lowp_mat3x2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001683,
        "KHR-GLES3.shaders.uniform_block.sin",
        "gle_basic_type.packed.mediump_mat3x2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001684,
        "KHR-GLES3.shaders.uniform_block.si",
        "ngle_basic_type.packed.highp_mat3x2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001685,
        "KHR-GLES3.shaders.uniform_block.single_",
        "basic_type.packed.row_major_lowp_mat3x2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001686,
        "KHR-GLES3.shaders.uniform_block.single_b",
        "asic_type.packed.row_major_mediump_mat3x2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001687,
        "KHR-GLES3.shaders.uniform_block.single_",
        "basic_type.packed.row_major_highp_mat3x2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001688,
        "KHR-GLES3.shaders.uniform_block.single_b",
        "asic_type.packed.column_major_lowp_mat3x2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001689,
        "KHR-GLES3.shaders.uniform_block.single_bas",
        "ic_type.packed.column_major_mediump_mat3x2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001690,
        "KHR-GLES3.shaders.uniform_block.single_ba",
        "sic_type.packed.column_major_highp_mat3x2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001691,
        "KHR-GLES3.shaders.uniform_block.si",
        "ngle_basic_type.packed.lowp_mat3x4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001692,
        "KHR-GLES3.shaders.uniform_block.sin",
        "gle_basic_type.packed.mediump_mat3x4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001693,
        "KHR-GLES3.shaders.uniform_block.si",
        "ngle_basic_type.packed.highp_mat3x4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001694,
        "KHR-GLES3.shaders.uniform_block.single_",
        "basic_type.packed.row_major_lowp_mat3x4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001695,
        "KHR-GLES3.shaders.uniform_block.single_b",
        "asic_type.packed.row_major_mediump_mat3x4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001696,
        "KHR-GLES3.shaders.uniform_block.single_",
        "basic_type.packed.row_major_highp_mat3x4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001697,
        "KHR-GLES3.shaders.uniform_block.single_b",
        "asic_type.packed.column_major_lowp_mat3x4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001698,
        "KHR-GLES3.shaders.uniform_block.single_bas",
        "ic_type.packed.column_major_mediump_mat3x4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001699,
        "KHR-GLES3.shaders.uniform_block.single_ba",
        "sic_type.packed.column_major_highp_mat3x4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001700,
        "KHR-GLES3.shaders.uniform_block.si",
        "ngle_basic_type.packed.lowp_mat4x2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001701,
        "KHR-GLES3.shaders.uniform_block.sin",
        "gle_basic_type.packed.mediump_mat4x2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001702,
        "KHR-GLES3.shaders.uniform_block.si",
        "ngle_basic_type.packed.highp_mat4x2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001703,
        "KHR-GLES3.shaders.uniform_block.single_",
        "basic_type.packed.row_major_lowp_mat4x2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001704,
        "KHR-GLES3.shaders.uniform_block.single_b",
        "asic_type.packed.row_major_mediump_mat4x2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001705,
        "KHR-GLES3.shaders.uniform_block.single_",
        "basic_type.packed.row_major_highp_mat4x2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001706,
        "KHR-GLES3.shaders.uniform_block.single_b",
        "asic_type.packed.column_major_lowp_mat4x2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001707,
        "KHR-GLES3.shaders.uniform_block.single_bas",
        "ic_type.packed.column_major_mediump_mat4x2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001708,
        "KHR-GLES3.shaders.uniform_block.single_ba",
        "sic_type.packed.column_major_highp_mat4x2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001709,
        "KHR-GLES3.shaders.uniform_block.si",
        "ngle_basic_type.packed.lowp_mat4x3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001710,
        "KHR-GLES3.shaders.uniform_block.sin",
        "gle_basic_type.packed.mediump_mat4x3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001711,
        "KHR-GLES3.shaders.uniform_block.si",
        "ngle_basic_type.packed.highp_mat4x3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001712,
        "KHR-GLES3.shaders.uniform_block.single_",
        "basic_type.packed.row_major_lowp_mat4x3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001713,
        "KHR-GLES3.shaders.uniform_block.single_b",
        "asic_type.packed.row_major_mediump_mat4x3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001714,
        "KHR-GLES3.shaders.uniform_block.single_",
        "basic_type.packed.row_major_highp_mat4x3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001715,
        "KHR-GLES3.shaders.uniform_block.single_b",
        "asic_type.packed.column_major_lowp_mat4x3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001716,
        "KHR-GLES3.shaders.uniform_block.single_bas",
        "ic_type.packed.column_major_mediump_mat4x3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001717,
        "KHR-GLES3.shaders.uniform_block.single_ba",
        "sic_type.packed.column_major_highp_mat4x3");
