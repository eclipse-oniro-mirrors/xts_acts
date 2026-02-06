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

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008574,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.std140.lowp_float");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008575,
        "dEQP-GLES31.functional.ssbo.layout.s",
        "ingle_basic_type.std140.mediump_float");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008576,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.std140.highp_float");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008577,
        "dEQP-GLES31.functional.ssbo.layout",
        ".single_basic_type.std140.lowp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008578,
        "dEQP-GLES31.functional.ssbo.layout.s",
        "ingle_basic_type.std140.mediump_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008579,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.std140.highp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008580,
        "dEQP-GLES31.functional.ssbo.layout",
        ".single_basic_type.std140.lowp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008581,
        "dEQP-GLES31.functional.ssbo.layout.s",
        "ingle_basic_type.std140.mediump_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008582,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.std140.highp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008583,
        "dEQP-GLES31.functional.ssbo.layout",
        ".single_basic_type.std140.lowp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008584,
        "dEQP-GLES31.functional.ssbo.layout.s",
        "ingle_basic_type.std140.mediump_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008585,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.std140.highp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008586,
        "dEQP-GLES31.functional.ssbo.layout",
        ".single_basic_type.std140.lowp_int");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008587,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.std140.mediump_int");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008588,
        "dEQP-GLES31.functional.ssbo.layout",
        ".single_basic_type.std140.highp_int");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008589,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.std140.lowp_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008590,
        "dEQP-GLES31.functional.ssbo.layout.s",
        "ingle_basic_type.std140.mediump_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008591,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.std140.highp_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008592,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.std140.lowp_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008593,
        "dEQP-GLES31.functional.ssbo.layout.s",
        "ingle_basic_type.std140.mediump_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008594,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.std140.highp_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008595,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.std140.lowp_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008596,
        "dEQP-GLES31.functional.ssbo.layout.s",
        "ingle_basic_type.std140.mediump_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008597,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.std140.highp_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008598,
        "dEQP-GLES31.functional.ssbo.layout",
        ".single_basic_type.std140.lowp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008599,
        "dEQP-GLES31.functional.ssbo.layout.s",
        "ingle_basic_type.std140.mediump_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008600,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.std140.highp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008601,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.std140.lowp_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008602,
        "dEQP-GLES31.functional.ssbo.layout.s",
        "ingle_basic_type.std140.mediump_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008603,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.std140.highp_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008604,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.std140.lowp_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008605,
        "dEQP-GLES31.functional.ssbo.layout.s",
        "ingle_basic_type.std140.mediump_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008606,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.std140.highp_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008607,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.std140.lowp_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008608,
        "dEQP-GLES31.functional.ssbo.layout.s",
        "ingle_basic_type.std140.mediump_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008609,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.std140.highp_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008610,
        "dEQP-GLES31.functional.ssbo.layo",
        "ut.single_basic_type.std140.bool");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008611,
        "dEQP-GLES31.functional.ssbo.layo",
        "ut.single_basic_type.std140.bvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008612,
        "dEQP-GLES31.functional.ssbo.layo",
        "ut.single_basic_type.std140.bvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008613,
        "dEQP-GLES31.functional.ssbo.layo",
        "ut.single_basic_type.std140.bvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008614,
        "dEQP-GLES31.functional.ssbo.layout",
        ".single_basic_type.std140.lowp_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008615,
        "dEQP-GLES31.functional.ssbo.layout.s",
        "ingle_basic_type.std140.mediump_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008616,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.std140.highp_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008617,
        "dEQP-GLES31.functional.ssbo.layout.sing",
        "le_basic_type.std140.row_major_lowp_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008618,
        "dEQP-GLES31.functional.ssbo.layout.single",
        "_basic_type.std140.row_major_mediump_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008619,
        "dEQP-GLES31.functional.ssbo.layout.singl",
        "e_basic_type.std140.row_major_highp_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008620,
        "dEQP-GLES31.functional.ssbo.layout.single",
        "_basic_type.std140.column_major_lowp_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008621,
        "dEQP-GLES31.functional.ssbo.layout.single_",
        "basic_type.std140.column_major_mediump_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008622,
        "dEQP-GLES31.functional.ssbo.layout.single",
        "_basic_type.std140.column_major_highp_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008623,
        "dEQP-GLES31.functional.ssbo.layout",
        ".single_basic_type.std140.lowp_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008624,
        "dEQP-GLES31.functional.ssbo.layout.s",
        "ingle_basic_type.std140.mediump_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008625,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.std140.highp_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008626,
        "dEQP-GLES31.functional.ssbo.layout.sing",
        "le_basic_type.std140.row_major_lowp_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008627,
        "dEQP-GLES31.functional.ssbo.layout.single",
        "_basic_type.std140.row_major_mediump_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008628,
        "dEQP-GLES31.functional.ssbo.layout.singl",
        "e_basic_type.std140.row_major_highp_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008629,
        "dEQP-GLES31.functional.ssbo.layout.single",
        "_basic_type.std140.column_major_lowp_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008630,
        "dEQP-GLES31.functional.ssbo.layout.single_",
        "basic_type.std140.column_major_mediump_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008631,
        "dEQP-GLES31.functional.ssbo.layout.single",
        "_basic_type.std140.column_major_highp_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008632,
        "dEQP-GLES31.functional.ssbo.layout",
        ".single_basic_type.std140.lowp_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008633,
        "dEQP-GLES31.functional.ssbo.layout.s",
        "ingle_basic_type.std140.mediump_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008634,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.std140.highp_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008635,
        "dEQP-GLES31.functional.ssbo.layout.sing",
        "le_basic_type.std140.row_major_lowp_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008636,
        "dEQP-GLES31.functional.ssbo.layout.single",
        "_basic_type.std140.row_major_mediump_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008637,
        "dEQP-GLES31.functional.ssbo.layout.singl",
        "e_basic_type.std140.row_major_highp_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008638,
        "dEQP-GLES31.functional.ssbo.layout.single",
        "_basic_type.std140.column_major_lowp_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008639,
        "dEQP-GLES31.functional.ssbo.layout.single_",
        "basic_type.std140.column_major_mediump_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008640,
        "dEQP-GLES31.functional.ssbo.layout.single",
        "_basic_type.std140.column_major_highp_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008641,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.std140.lowp_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008642,
        "dEQP-GLES31.functional.ssbo.layout.si",
        "ngle_basic_type.std140.mediump_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008643,
        "dEQP-GLES31.functional.ssbo.layout.s",
        "ingle_basic_type.std140.highp_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008644,
        "dEQP-GLES31.functional.ssbo.layout.singl",
        "e_basic_type.std140.row_major_lowp_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008645,
        "dEQP-GLES31.functional.ssbo.layout.single_",
        "basic_type.std140.row_major_mediump_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008646,
        "dEQP-GLES31.functional.ssbo.layout.single",
        "_basic_type.std140.row_major_highp_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008647,
        "dEQP-GLES31.functional.ssbo.layout.single_",
        "basic_type.std140.column_major_lowp_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008648,
        "dEQP-GLES31.functional.ssbo.layout.single_b",
        "asic_type.std140.column_major_mediump_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008649,
        "dEQP-GLES31.functional.ssbo.layout.single_",
        "basic_type.std140.column_major_highp_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008650,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.std140.lowp_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008651,
        "dEQP-GLES31.functional.ssbo.layout.si",
        "ngle_basic_type.std140.mediump_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008652,
        "dEQP-GLES31.functional.ssbo.layout.s",
        "ingle_basic_type.std140.highp_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008653,
        "dEQP-GLES31.functional.ssbo.layout.singl",
        "e_basic_type.std140.row_major_lowp_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008654,
        "dEQP-GLES31.functional.ssbo.layout.single_",
        "basic_type.std140.row_major_mediump_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008655,
        "dEQP-GLES31.functional.ssbo.layout.single",
        "_basic_type.std140.row_major_highp_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008656,
        "dEQP-GLES31.functional.ssbo.layout.single_",
        "basic_type.std140.column_major_lowp_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008657,
        "dEQP-GLES31.functional.ssbo.layout.single_b",
        "asic_type.std140.column_major_mediump_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008658,
        "dEQP-GLES31.functional.ssbo.layout.single_",
        "basic_type.std140.column_major_highp_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008659,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.std140.lowp_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008660,
        "dEQP-GLES31.functional.ssbo.layout.si",
        "ngle_basic_type.std140.mediump_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008661,
        "dEQP-GLES31.functional.ssbo.layout.s",
        "ingle_basic_type.std140.highp_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008662,
        "dEQP-GLES31.functional.ssbo.layout.singl",
        "e_basic_type.std140.row_major_lowp_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008663,
        "dEQP-GLES31.functional.ssbo.layout.single_",
        "basic_type.std140.row_major_mediump_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008664,
        "dEQP-GLES31.functional.ssbo.layout.single",
        "_basic_type.std140.row_major_highp_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008665,
        "dEQP-GLES31.functional.ssbo.layout.single_",
        "basic_type.std140.column_major_lowp_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008666,
        "dEQP-GLES31.functional.ssbo.layout.single_b",
        "asic_type.std140.column_major_mediump_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008667,
        "dEQP-GLES31.functional.ssbo.layout.single_",
        "basic_type.std140.column_major_highp_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008668,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.std140.lowp_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008669,
        "dEQP-GLES31.functional.ssbo.layout.si",
        "ngle_basic_type.std140.mediump_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008670,
        "dEQP-GLES31.functional.ssbo.layout.s",
        "ingle_basic_type.std140.highp_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008671,
        "dEQP-GLES31.functional.ssbo.layout.singl",
        "e_basic_type.std140.row_major_lowp_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008672,
        "dEQP-GLES31.functional.ssbo.layout.single_",
        "basic_type.std140.row_major_mediump_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008673,
        "dEQP-GLES31.functional.ssbo.layout.single",
        "_basic_type.std140.row_major_highp_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008674,
        "dEQP-GLES31.functional.ssbo.layout.single_",
        "basic_type.std140.column_major_lowp_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008675,
        "dEQP-GLES31.functional.ssbo.layout.single_b",
        "asic_type.std140.column_major_mediump_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008676,
        "dEQP-GLES31.functional.ssbo.layout.single_",
        "basic_type.std140.column_major_highp_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008677,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.std140.lowp_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008678,
        "dEQP-GLES31.functional.ssbo.layout.si",
        "ngle_basic_type.std140.mediump_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008679,
        "dEQP-GLES31.functional.ssbo.layout.s",
        "ingle_basic_type.std140.highp_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008680,
        "dEQP-GLES31.functional.ssbo.layout.singl",
        "e_basic_type.std140.row_major_lowp_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008681,
        "dEQP-GLES31.functional.ssbo.layout.single_",
        "basic_type.std140.row_major_mediump_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008682,
        "dEQP-GLES31.functional.ssbo.layout.single",
        "_basic_type.std140.row_major_highp_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008683,
        "dEQP-GLES31.functional.ssbo.layout.single_",
        "basic_type.std140.column_major_lowp_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008684,
        "dEQP-GLES31.functional.ssbo.layout.single_b",
        "asic_type.std140.column_major_mediump_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008685,
        "dEQP-GLES31.functional.ssbo.layout.single_",
        "basic_type.std140.column_major_highp_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008686,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.std140.lowp_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008687,
        "dEQP-GLES31.functional.ssbo.layout.si",
        "ngle_basic_type.std140.mediump_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008688,
        "dEQP-GLES31.functional.ssbo.layout.s",
        "ingle_basic_type.std140.highp_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008689,
        "dEQP-GLES31.functional.ssbo.layout.singl",
        "e_basic_type.std140.row_major_lowp_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008690,
        "dEQP-GLES31.functional.ssbo.layout.single_",
        "basic_type.std140.row_major_mediump_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008691,
        "dEQP-GLES31.functional.ssbo.layout.single",
        "_basic_type.std140.row_major_highp_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008692,
        "dEQP-GLES31.functional.ssbo.layout.single_",
        "basic_type.std140.column_major_lowp_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008693,
        "dEQP-GLES31.functional.ssbo.layout.single_b",
        "asic_type.std140.column_major_mediump_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008694,
        "dEQP-GLES31.functional.ssbo.layout.single_",
        "basic_type.std140.column_major_highp_mat4x3");
