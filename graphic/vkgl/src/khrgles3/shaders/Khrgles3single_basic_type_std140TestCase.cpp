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

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001718,
        "KHR-GLES3.shaders.uniform_block.s",
        "ingle_basic_type.std140.lowp_float");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001719,
        "KHR-GLES3.shaders.uniform_block.sin",
        "gle_basic_type.std140.mediump_float");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001720,
        "KHR-GLES3.shaders.uniform_block.si",
        "ngle_basic_type.std140.highp_float");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001721,
        "KHR-GLES3.shaders.uniform_block.s",
        "ingle_basic_type.std140.lowp_vec2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001722,
        "KHR-GLES3.shaders.uniform_block.si",
        "ngle_basic_type.std140.mediump_vec2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001723,
        "KHR-GLES3.shaders.uniform_block.s",
        "ingle_basic_type.std140.highp_vec2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001724,
        "KHR-GLES3.shaders.uniform_block.s",
        "ingle_basic_type.std140.lowp_vec3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001725,
        "KHR-GLES3.shaders.uniform_block.si",
        "ngle_basic_type.std140.mediump_vec3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001726,
        "KHR-GLES3.shaders.uniform_block.s",
        "ingle_basic_type.std140.highp_vec3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001727,
        "KHR-GLES3.shaders.uniform_block.s",
        "ingle_basic_type.std140.lowp_vec4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001728,
        "KHR-GLES3.shaders.uniform_block.si",
        "ngle_basic_type.std140.mediump_vec4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001729,
        "KHR-GLES3.shaders.uniform_block.s",
        "ingle_basic_type.std140.highp_vec4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001730,
        "KHR-GLES3.shaders.uniform_block.",
        "single_basic_type.std140.lowp_int");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001731,
        "KHR-GLES3.shaders.uniform_block.si",
        "ngle_basic_type.std140.mediump_int");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001732,
        "KHR-GLES3.shaders.uniform_block.s",
        "ingle_basic_type.std140.highp_int");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001733,
        "KHR-GLES3.shaders.uniform_block.s",
        "ingle_basic_type.std140.lowp_ivec2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001734,
        "KHR-GLES3.shaders.uniform_block.sin",
        "gle_basic_type.std140.mediump_ivec2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001735,
        "KHR-GLES3.shaders.uniform_block.si",
        "ngle_basic_type.std140.highp_ivec2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001736,
        "KHR-GLES3.shaders.uniform_block.s",
        "ingle_basic_type.std140.lowp_ivec3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001737,
        "KHR-GLES3.shaders.uniform_block.sin",
        "gle_basic_type.std140.mediump_ivec3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001738,
        "KHR-GLES3.shaders.uniform_block.si",
        "ngle_basic_type.std140.highp_ivec3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001739,
        "KHR-GLES3.shaders.uniform_block.s",
        "ingle_basic_type.std140.lowp_ivec4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001740,
        "KHR-GLES3.shaders.uniform_block.sin",
        "gle_basic_type.std140.mediump_ivec4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001741,
        "KHR-GLES3.shaders.uniform_block.si",
        "ngle_basic_type.std140.highp_ivec4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001742,
        "KHR-GLES3.shaders.uniform_block.s",
        "ingle_basic_type.std140.lowp_uint");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001743,
        "KHR-GLES3.shaders.uniform_block.si",
        "ngle_basic_type.std140.mediump_uint");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001744,
        "KHR-GLES3.shaders.uniform_block.s",
        "ingle_basic_type.std140.highp_uint");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001745,
        "KHR-GLES3.shaders.uniform_block.s",
        "ingle_basic_type.std140.lowp_uvec2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001746,
        "KHR-GLES3.shaders.uniform_block.sin",
        "gle_basic_type.std140.mediump_uvec2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001747,
        "KHR-GLES3.shaders.uniform_block.si",
        "ngle_basic_type.std140.highp_uvec2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001748,
        "KHR-GLES3.shaders.uniform_block.s",
        "ingle_basic_type.std140.lowp_uvec3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001749,
        "KHR-GLES3.shaders.uniform_block.sin",
        "gle_basic_type.std140.mediump_uvec3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001750,
        "KHR-GLES3.shaders.uniform_block.si",
        "ngle_basic_type.std140.highp_uvec3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001751,
        "KHR-GLES3.shaders.uniform_block.s",
        "ingle_basic_type.std140.lowp_uvec4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001752,
        "KHR-GLES3.shaders.uniform_block.sin",
        "gle_basic_type.std140.mediump_uvec4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001753,
        "KHR-GLES3.shaders.uniform_block.si",
        "ngle_basic_type.std140.highp_uvec4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001754,
        "KHR-GLES3.shaders.uniform_bloc",
        "k.single_basic_type.std140.bool");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001755,
        "KHR-GLES3.shaders.uniform_block",
        ".single_basic_type.std140.bvec2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001756,
        "KHR-GLES3.shaders.uniform_block",
        ".single_basic_type.std140.bvec3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001757,
        "KHR-GLES3.shaders.uniform_block",
        ".single_basic_type.std140.bvec4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001758,
        "KHR-GLES3.shaders.uniform_block.s",
        "ingle_basic_type.std140.lowp_mat2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001759,
        "KHR-GLES3.shaders.uniform_block.si",
        "ngle_basic_type.std140.mediump_mat2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001760,
        "KHR-GLES3.shaders.uniform_block.s",
        "ingle_basic_type.std140.highp_mat2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001761,
        "KHR-GLES3.shaders.uniform_block.single",
        "_basic_type.std140.row_major_lowp_mat2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001762,
        "KHR-GLES3.shaders.uniform_block.single_",
        "basic_type.std140.row_major_mediump_mat2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001763,
        "KHR-GLES3.shaders.uniform_block.single",
        "_basic_type.std140.row_major_highp_mat2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001764,
        "KHR-GLES3.shaders.uniform_block.single_",
        "basic_type.std140.column_major_lowp_mat2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001765,
        "KHR-GLES3.shaders.uniform_block.single_ba",
        "sic_type.std140.column_major_mediump_mat2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001766,
        "KHR-GLES3.shaders.uniform_block.single_b",
        "asic_type.std140.column_major_highp_mat2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001767,
        "KHR-GLES3.shaders.uniform_block.s",
        "ingle_basic_type.std140.lowp_mat3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001768,
        "KHR-GLES3.shaders.uniform_block.si",
        "ngle_basic_type.std140.mediump_mat3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001769,
        "KHR-GLES3.shaders.uniform_block.s",
        "ingle_basic_type.std140.highp_mat3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001770,
        "KHR-GLES3.shaders.uniform_block.single",
        "_basic_type.std140.row_major_lowp_mat3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001771,
        "KHR-GLES3.shaders.uniform_block.single_",
        "basic_type.std140.row_major_mediump_mat3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001772,
        "KHR-GLES3.shaders.uniform_block.single",
        "_basic_type.std140.row_major_highp_mat3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001773,
        "KHR-GLES3.shaders.uniform_block.single_",
        "basic_type.std140.column_major_lowp_mat3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001774,
        "KHR-GLES3.shaders.uniform_block.single_ba",
        "sic_type.std140.column_major_mediump_mat3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001775,
        "KHR-GLES3.shaders.uniform_block.single_b",
        "asic_type.std140.column_major_highp_mat3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001776,
        "KHR-GLES3.shaders.uniform_block.s",
        "ingle_basic_type.std140.lowp_mat4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001777,
        "KHR-GLES3.shaders.uniform_block.si",
        "ngle_basic_type.std140.mediump_mat4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001778,
        "KHR-GLES3.shaders.uniform_block.s",
        "ingle_basic_type.std140.highp_mat4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001779,
        "KHR-GLES3.shaders.uniform_block.single",
        "_basic_type.std140.row_major_lowp_mat4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001780,
        "KHR-GLES3.shaders.uniform_block.single_",
        "basic_type.std140.row_major_mediump_mat4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001781,
        "KHR-GLES3.shaders.uniform_block.single",
        "_basic_type.std140.row_major_highp_mat4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001782,
        "KHR-GLES3.shaders.uniform_block.single_",
        "basic_type.std140.column_major_lowp_mat4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001783,
        "KHR-GLES3.shaders.uniform_block.single_ba",
        "sic_type.std140.column_major_mediump_mat4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001784,
        "KHR-GLES3.shaders.uniform_block.single_b",
        "asic_type.std140.column_major_highp_mat4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001785,
        "KHR-GLES3.shaders.uniform_block.si",
        "ngle_basic_type.std140.lowp_mat2x3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001786,
        "KHR-GLES3.shaders.uniform_block.sin",
        "gle_basic_type.std140.mediump_mat2x3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001787,
        "KHR-GLES3.shaders.uniform_block.si",
        "ngle_basic_type.std140.highp_mat2x3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001788,
        "KHR-GLES3.shaders.uniform_block.single_",
        "basic_type.std140.row_major_lowp_mat2x3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001789,
        "KHR-GLES3.shaders.uniform_block.single_b",
        "asic_type.std140.row_major_mediump_mat2x3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001790,
        "KHR-GLES3.shaders.uniform_block.single_",
        "basic_type.std140.row_major_highp_mat2x3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001791,
        "KHR-GLES3.shaders.uniform_block.single_b",
        "asic_type.std140.column_major_lowp_mat2x3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001792,
        "KHR-GLES3.shaders.uniform_block.single_bas",
        "ic_type.std140.column_major_mediump_mat2x3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001793,
        "KHR-GLES3.shaders.uniform_block.single_ba",
        "sic_type.std140.column_major_highp_mat2x3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001794,
        "KHR-GLES3.shaders.uniform_block.si",
        "ngle_basic_type.std140.lowp_mat2x4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001795,
        "KHR-GLES3.shaders.uniform_block.sin",
        "gle_basic_type.std140.mediump_mat2x4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001796,
        "KHR-GLES3.shaders.uniform_block.si",
        "ngle_basic_type.std140.highp_mat2x4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001797,
        "KHR-GLES3.shaders.uniform_block.single_",
        "basic_type.std140.row_major_lowp_mat2x4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001798,
        "KHR-GLES3.shaders.uniform_block.single_b",
        "asic_type.std140.row_major_mediump_mat2x4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001799,
        "KHR-GLES3.shaders.uniform_block.single_",
        "basic_type.std140.row_major_highp_mat2x4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001800,
        "KHR-GLES3.shaders.uniform_block.single_b",
        "asic_type.std140.column_major_lowp_mat2x4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001801,
        "KHR-GLES3.shaders.uniform_block.single_bas",
        "ic_type.std140.column_major_mediump_mat2x4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001802,
        "KHR-GLES3.shaders.uniform_block.single_ba",
        "sic_type.std140.column_major_highp_mat2x4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001803,
        "KHR-GLES3.shaders.uniform_block.si",
        "ngle_basic_type.std140.lowp_mat3x2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001804,
        "KHR-GLES3.shaders.uniform_block.sin",
        "gle_basic_type.std140.mediump_mat3x2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001805,
        "KHR-GLES3.shaders.uniform_block.si",
        "ngle_basic_type.std140.highp_mat3x2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001806,
        "KHR-GLES3.shaders.uniform_block.single_",
        "basic_type.std140.row_major_lowp_mat3x2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001807,
        "KHR-GLES3.shaders.uniform_block.single_b",
        "asic_type.std140.row_major_mediump_mat3x2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001808,
        "KHR-GLES3.shaders.uniform_block.single_",
        "basic_type.std140.row_major_highp_mat3x2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001809,
        "KHR-GLES3.shaders.uniform_block.single_b",
        "asic_type.std140.column_major_lowp_mat3x2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001810,
        "KHR-GLES3.shaders.uniform_block.single_bas",
        "ic_type.std140.column_major_mediump_mat3x2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001811,
        "KHR-GLES3.shaders.uniform_block.single_ba",
        "sic_type.std140.column_major_highp_mat3x2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001812,
        "KHR-GLES3.shaders.uniform_block.si",
        "ngle_basic_type.std140.lowp_mat3x4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001813,
        "KHR-GLES3.shaders.uniform_block.sin",
        "gle_basic_type.std140.mediump_mat3x4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001814,
        "KHR-GLES3.shaders.uniform_block.si",
        "ngle_basic_type.std140.highp_mat3x4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001815,
        "KHR-GLES3.shaders.uniform_block.single_",
        "basic_type.std140.row_major_lowp_mat3x4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001816,
        "KHR-GLES3.shaders.uniform_block.single_b",
        "asic_type.std140.row_major_mediump_mat3x4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001817,
        "KHR-GLES3.shaders.uniform_block.single_",
        "basic_type.std140.row_major_highp_mat3x4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001818,
        "KHR-GLES3.shaders.uniform_block.single_b",
        "asic_type.std140.column_major_lowp_mat3x4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001819,
        "KHR-GLES3.shaders.uniform_block.single_bas",
        "ic_type.std140.column_major_mediump_mat3x4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001820,
        "KHR-GLES3.shaders.uniform_block.single_ba",
        "sic_type.std140.column_major_highp_mat3x4");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001821,
        "KHR-GLES3.shaders.uniform_block.si",
        "ngle_basic_type.std140.lowp_mat4x2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001822,
        "KHR-GLES3.shaders.uniform_block.sin",
        "gle_basic_type.std140.mediump_mat4x2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001823,
        "KHR-GLES3.shaders.uniform_block.si",
        "ngle_basic_type.std140.highp_mat4x2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001824,
        "KHR-GLES3.shaders.uniform_block.single_",
        "basic_type.std140.row_major_lowp_mat4x2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001825,
        "KHR-GLES3.shaders.uniform_block.single_b",
        "asic_type.std140.row_major_mediump_mat4x2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001826,
        "KHR-GLES3.shaders.uniform_block.single_",
        "basic_type.std140.row_major_highp_mat4x2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001827,
        "KHR-GLES3.shaders.uniform_block.single_b",
        "asic_type.std140.column_major_lowp_mat4x2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001828,
        "KHR-GLES3.shaders.uniform_block.single_bas",
        "ic_type.std140.column_major_mediump_mat4x2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001829,
        "KHR-GLES3.shaders.uniform_block.single_ba",
        "sic_type.std140.column_major_highp_mat4x2");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001830,
        "KHR-GLES3.shaders.uniform_block.si",
        "ngle_basic_type.std140.lowp_mat4x3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001831,
        "KHR-GLES3.shaders.uniform_block.sin",
        "gle_basic_type.std140.mediump_mat4x3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001832,
        "KHR-GLES3.shaders.uniform_block.si",
        "ngle_basic_type.std140.highp_mat4x3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001833,
        "KHR-GLES3.shaders.uniform_block.single_",
        "basic_type.std140.row_major_lowp_mat4x3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001834,
        "KHR-GLES3.shaders.uniform_block.single_b",
        "asic_type.std140.row_major_mediump_mat4x3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001835,
        "KHR-GLES3.shaders.uniform_block.single_",
        "basic_type.std140.row_major_highp_mat4x3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001836,
        "KHR-GLES3.shaders.uniform_block.single_b",
        "asic_type.std140.column_major_lowp_mat4x3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001837,
        "KHR-GLES3.shaders.uniform_block.single_bas",
        "ic_type.std140.column_major_mediump_mat4x3");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001838,
        "KHR-GLES3.shaders.uniform_block.single_ba",
        "sic_type.std140.column_major_highp_mat4x3");
