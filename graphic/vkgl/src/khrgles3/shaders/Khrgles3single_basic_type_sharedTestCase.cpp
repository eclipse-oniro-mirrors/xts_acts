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

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001476,
        "KHR-GLES3.shaders.uniform_block.s",
        "ingle_basic_type.shared.lowp_float");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001477,
        "KHR-GLES3.shaders.uniform_block.sin",
        "gle_basic_type.shared.mediump_float");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001478,
        "KHR-GLES3.shaders.uniform_block.si",
        "ngle_basic_type.shared.highp_float");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001479,
        "KHR-GLES3.shaders.uniform_block.s",
        "ingle_basic_type.shared.lowp_vec2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001480,
        "KHR-GLES3.shaders.uniform_block.si",
        "ngle_basic_type.shared.mediump_vec2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001481,
        "KHR-GLES3.shaders.uniform_block.s",
        "ingle_basic_type.shared.highp_vec2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001482,
        "KHR-GLES3.shaders.uniform_block.s",
        "ingle_basic_type.shared.lowp_vec3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001483,
        "KHR-GLES3.shaders.uniform_block.si",
        "ngle_basic_type.shared.mediump_vec3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001484,
        "KHR-GLES3.shaders.uniform_block.s",
        "ingle_basic_type.shared.highp_vec3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001485,
        "KHR-GLES3.shaders.uniform_block.s",
        "ingle_basic_type.shared.lowp_vec4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001486,
        "KHR-GLES3.shaders.uniform_block.si",
        "ngle_basic_type.shared.mediump_vec4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001487,
        "KHR-GLES3.shaders.uniform_block.s",
        "ingle_basic_type.shared.highp_vec4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001488,
        "KHR-GLES3.shaders.uniform_block.",
        "single_basic_type.shared.lowp_int");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001489,
        "KHR-GLES3.shaders.uniform_block.si",
        "ngle_basic_type.shared.mediump_int");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001490,
        "KHR-GLES3.shaders.uniform_block.s",
        "ingle_basic_type.shared.highp_int");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001491,
        "KHR-GLES3.shaders.uniform_block.s",
        "ingle_basic_type.shared.lowp_ivec2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001492,
        "KHR-GLES3.shaders.uniform_block.sin",
        "gle_basic_type.shared.mediump_ivec2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001493,
        "KHR-GLES3.shaders.uniform_block.si",
        "ngle_basic_type.shared.highp_ivec2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001494,
        "KHR-GLES3.shaders.uniform_block.s",
        "ingle_basic_type.shared.lowp_ivec3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001495,
        "KHR-GLES3.shaders.uniform_block.sin",
        "gle_basic_type.shared.mediump_ivec3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001496,
        "KHR-GLES3.shaders.uniform_block.si",
        "ngle_basic_type.shared.highp_ivec3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001497,
        "KHR-GLES3.shaders.uniform_block.s",
        "ingle_basic_type.shared.lowp_ivec4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001498,
        "KHR-GLES3.shaders.uniform_block.sin",
        "gle_basic_type.shared.mediump_ivec4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001499,
        "KHR-GLES3.shaders.uniform_block.si",
        "ngle_basic_type.shared.highp_ivec4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001500,
        "KHR-GLES3.shaders.uniform_block.s",
        "ingle_basic_type.shared.lowp_uint");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001501,
        "KHR-GLES3.shaders.uniform_block.si",
        "ngle_basic_type.shared.mediump_uint");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001502,
        "KHR-GLES3.shaders.uniform_block.s",
        "ingle_basic_type.shared.highp_uint");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001503,
        "KHR-GLES3.shaders.uniform_block.s",
        "ingle_basic_type.shared.lowp_uvec2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001504,
        "KHR-GLES3.shaders.uniform_block.sin",
        "gle_basic_type.shared.mediump_uvec2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001505,
        "KHR-GLES3.shaders.uniform_block.si",
        "ngle_basic_type.shared.highp_uvec2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001506,
        "KHR-GLES3.shaders.uniform_block.s",
        "ingle_basic_type.shared.lowp_uvec3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001507,
        "KHR-GLES3.shaders.uniform_block.sin",
        "gle_basic_type.shared.mediump_uvec3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001508,
        "KHR-GLES3.shaders.uniform_block.si",
        "ngle_basic_type.shared.highp_uvec3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001509,
        "KHR-GLES3.shaders.uniform_block.s",
        "ingle_basic_type.shared.lowp_uvec4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001510,
        "KHR-GLES3.shaders.uniform_block.sin",
        "gle_basic_type.shared.mediump_uvec4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001511,
        "KHR-GLES3.shaders.uniform_block.si",
        "ngle_basic_type.shared.highp_uvec4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001512,
        "KHR-GLES3.shaders.uniform_bloc",
        "k.single_basic_type.shared.bool");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001513,
        "KHR-GLES3.shaders.uniform_block",
        ".single_basic_type.shared.bvec2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001514,
        "KHR-GLES3.shaders.uniform_block",
        ".single_basic_type.shared.bvec3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001515,
        "KHR-GLES3.shaders.uniform_block",
        ".single_basic_type.shared.bvec4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001516,
        "KHR-GLES3.shaders.uniform_block.s",
        "ingle_basic_type.shared.lowp_mat2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001517,
        "KHR-GLES3.shaders.uniform_block.si",
        "ngle_basic_type.shared.mediump_mat2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001518,
        "KHR-GLES3.shaders.uniform_block.s",
        "ingle_basic_type.shared.highp_mat2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001519,
        "KHR-GLES3.shaders.uniform_block.single",
        "_basic_type.shared.row_major_lowp_mat2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001520,
        "KHR-GLES3.shaders.uniform_block.single_",
        "basic_type.shared.row_major_mediump_mat2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001521,
        "KHR-GLES3.shaders.uniform_block.single",
        "_basic_type.shared.row_major_highp_mat2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001522,
        "KHR-GLES3.shaders.uniform_block.single_",
        "basic_type.shared.column_major_lowp_mat2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001523,
        "KHR-GLES3.shaders.uniform_block.single_ba",
        "sic_type.shared.column_major_mediump_mat2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001524,
        "KHR-GLES3.shaders.uniform_block.single_b",
        "asic_type.shared.column_major_highp_mat2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001525,
        "KHR-GLES3.shaders.uniform_block.s",
        "ingle_basic_type.shared.lowp_mat3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001526,
        "KHR-GLES3.shaders.uniform_block.si",
        "ngle_basic_type.shared.mediump_mat3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001527,
        "KHR-GLES3.shaders.uniform_block.s",
        "ingle_basic_type.shared.highp_mat3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001528,
        "KHR-GLES3.shaders.uniform_block.single",
        "_basic_type.shared.row_major_lowp_mat3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001529,
        "KHR-GLES3.shaders.uniform_block.single_",
        "basic_type.shared.row_major_mediump_mat3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001530,
        "KHR-GLES3.shaders.uniform_block.single",
        "_basic_type.shared.row_major_highp_mat3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001531,
        "KHR-GLES3.shaders.uniform_block.single_",
        "basic_type.shared.column_major_lowp_mat3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001532,
        "KHR-GLES3.shaders.uniform_block.single_ba",
        "sic_type.shared.column_major_mediump_mat3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001533,
        "KHR-GLES3.shaders.uniform_block.single_b",
        "asic_type.shared.column_major_highp_mat3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001534,
        "KHR-GLES3.shaders.uniform_block.s",
        "ingle_basic_type.shared.lowp_mat4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001535,
        "KHR-GLES3.shaders.uniform_block.si",
        "ngle_basic_type.shared.mediump_mat4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001536,
        "KHR-GLES3.shaders.uniform_block.s",
        "ingle_basic_type.shared.highp_mat4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001537,
        "KHR-GLES3.shaders.uniform_block.single",
        "_basic_type.shared.row_major_lowp_mat4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001538,
        "KHR-GLES3.shaders.uniform_block.single_",
        "basic_type.shared.row_major_mediump_mat4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001539,
        "KHR-GLES3.shaders.uniform_block.single",
        "_basic_type.shared.row_major_highp_mat4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001540,
        "KHR-GLES3.shaders.uniform_block.single_",
        "basic_type.shared.column_major_lowp_mat4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001541,
        "KHR-GLES3.shaders.uniform_block.single_ba",
        "sic_type.shared.column_major_mediump_mat4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001542,
        "KHR-GLES3.shaders.uniform_block.single_b",
        "asic_type.shared.column_major_highp_mat4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001543,
        "KHR-GLES3.shaders.uniform_block.si",
        "ngle_basic_type.shared.lowp_mat2x3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001544,
        "KHR-GLES3.shaders.uniform_block.sin",
        "gle_basic_type.shared.mediump_mat2x3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001545,
        "KHR-GLES3.shaders.uniform_block.si",
        "ngle_basic_type.shared.highp_mat2x3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001546,
        "KHR-GLES3.shaders.uniform_block.single_",
        "basic_type.shared.row_major_lowp_mat2x3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001547,
        "KHR-GLES3.shaders.uniform_block.single_b",
        "asic_type.shared.row_major_mediump_mat2x3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001548,
        "KHR-GLES3.shaders.uniform_block.single_",
        "basic_type.shared.row_major_highp_mat2x3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001549,
        "KHR-GLES3.shaders.uniform_block.single_b",
        "asic_type.shared.column_major_lowp_mat2x3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001550,
        "KHR-GLES3.shaders.uniform_block.single_bas",
        "ic_type.shared.column_major_mediump_mat2x3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001551,
        "KHR-GLES3.shaders.uniform_block.single_ba",
        "sic_type.shared.column_major_highp_mat2x3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001552,
        "KHR-GLES3.shaders.uniform_block.si",
        "ngle_basic_type.shared.lowp_mat2x4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001553,
        "KHR-GLES3.shaders.uniform_block.sin",
        "gle_basic_type.shared.mediump_mat2x4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001554,
        "KHR-GLES3.shaders.uniform_block.si",
        "ngle_basic_type.shared.highp_mat2x4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001555,
        "KHR-GLES3.shaders.uniform_block.single_",
        "basic_type.shared.row_major_lowp_mat2x4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001556,
        "KHR-GLES3.shaders.uniform_block.single_b",
        "asic_type.shared.row_major_mediump_mat2x4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001557,
        "KHR-GLES3.shaders.uniform_block.single_",
        "basic_type.shared.row_major_highp_mat2x4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001558,
        "KHR-GLES3.shaders.uniform_block.single_b",
        "asic_type.shared.column_major_lowp_mat2x4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001559,
        "KHR-GLES3.shaders.uniform_block.single_bas",
        "ic_type.shared.column_major_mediump_mat2x4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001560,
        "KHR-GLES3.shaders.uniform_block.single_ba",
        "sic_type.shared.column_major_highp_mat2x4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001561,
        "KHR-GLES3.shaders.uniform_block.si",
        "ngle_basic_type.shared.lowp_mat3x2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001562,
        "KHR-GLES3.shaders.uniform_block.sin",
        "gle_basic_type.shared.mediump_mat3x2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001563,
        "KHR-GLES3.shaders.uniform_block.si",
        "ngle_basic_type.shared.highp_mat3x2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001564,
        "KHR-GLES3.shaders.uniform_block.single_",
        "basic_type.shared.row_major_lowp_mat3x2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001565,
        "KHR-GLES3.shaders.uniform_block.single_b",
        "asic_type.shared.row_major_mediump_mat3x2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001566,
        "KHR-GLES3.shaders.uniform_block.single_",
        "basic_type.shared.row_major_highp_mat3x2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001567,
        "KHR-GLES3.shaders.uniform_block.single_b",
        "asic_type.shared.column_major_lowp_mat3x2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001568,
        "KHR-GLES3.shaders.uniform_block.single_bas",
        "ic_type.shared.column_major_mediump_mat3x2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001569,
        "KHR-GLES3.shaders.uniform_block.single_ba",
        "sic_type.shared.column_major_highp_mat3x2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001570,
        "KHR-GLES3.shaders.uniform_block.si",
        "ngle_basic_type.shared.lowp_mat3x4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001571,
        "KHR-GLES3.shaders.uniform_block.sin",
        "gle_basic_type.shared.mediump_mat3x4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001572,
        "KHR-GLES3.shaders.uniform_block.si",
        "ngle_basic_type.shared.highp_mat3x4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001573,
        "KHR-GLES3.shaders.uniform_block.single_",
        "basic_type.shared.row_major_lowp_mat3x4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001574,
        "KHR-GLES3.shaders.uniform_block.single_b",
        "asic_type.shared.row_major_mediump_mat3x4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001575,
        "KHR-GLES3.shaders.uniform_block.single_",
        "basic_type.shared.row_major_highp_mat3x4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001576,
        "KHR-GLES3.shaders.uniform_block.single_b",
        "asic_type.shared.column_major_lowp_mat3x4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001577,
        "KHR-GLES3.shaders.uniform_block.single_bas",
        "ic_type.shared.column_major_mediump_mat3x4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001578,
        "KHR-GLES3.shaders.uniform_block.single_ba",
        "sic_type.shared.column_major_highp_mat3x4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001579,
        "KHR-GLES3.shaders.uniform_block.si",
        "ngle_basic_type.shared.lowp_mat4x2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001580,
        "KHR-GLES3.shaders.uniform_block.sin",
        "gle_basic_type.shared.mediump_mat4x2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001581,
        "KHR-GLES3.shaders.uniform_block.si",
        "ngle_basic_type.shared.highp_mat4x2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001582,
        "KHR-GLES3.shaders.uniform_block.single_",
        "basic_type.shared.row_major_lowp_mat4x2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001583,
        "KHR-GLES3.shaders.uniform_block.single_b",
        "asic_type.shared.row_major_mediump_mat4x2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001584,
        "KHR-GLES3.shaders.uniform_block.single_",
        "basic_type.shared.row_major_highp_mat4x2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001585,
        "KHR-GLES3.shaders.uniform_block.single_b",
        "asic_type.shared.column_major_lowp_mat4x2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001586,
        "KHR-GLES3.shaders.uniform_block.single_bas",
        "ic_type.shared.column_major_mediump_mat4x2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001587,
        "KHR-GLES3.shaders.uniform_block.single_ba",
        "sic_type.shared.column_major_highp_mat4x2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001588,
        "KHR-GLES3.shaders.uniform_block.si",
        "ngle_basic_type.shared.lowp_mat4x3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001589,
        "KHR-GLES3.shaders.uniform_block.sin",
        "gle_basic_type.shared.mediump_mat4x3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001590,
        "KHR-GLES3.shaders.uniform_block.si",
        "ngle_basic_type.shared.highp_mat4x3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001591,
        "KHR-GLES3.shaders.uniform_block.single_",
        "basic_type.shared.row_major_lowp_mat4x3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001592,
        "KHR-GLES3.shaders.uniform_block.single_b",
        "asic_type.shared.row_major_mediump_mat4x3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001593,
        "KHR-GLES3.shaders.uniform_block.single_",
        "basic_type.shared.row_major_highp_mat4x3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001594,
        "KHR-GLES3.shaders.uniform_block.single_b",
        "asic_type.shared.column_major_lowp_mat4x3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001595,
        "KHR-GLES3.shaders.uniform_block.single_bas",
        "ic_type.shared.column_major_mediump_mat4x3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001596,
        "KHR-GLES3.shaders.uniform_block.single_ba",
        "sic_type.shared.column_major_highp_mat4x3");
