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
#include "../Gl46masterBaseFunc.h"
#include "../ActsGl46master0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002717,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.lowp_float");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002718,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.mediump_float");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002719,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.highp_float");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002720,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.lowp_vec2");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002721,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.mediump_vec2");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002722,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.highp_vec2");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002723,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.lowp_vec3");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002724,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.mediump_vec3");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002725,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.highp_vec3");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002726,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.lowp_vec4");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002727,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.mediump_vec4");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002728,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.highp_vec4");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002729,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.lowp_int");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002730,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.mediump_int");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002731,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.highp_int");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002732,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.lowp_ivec2");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002733,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.mediump_ivec2");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002734,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.highp_ivec2");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002735,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.lowp_ivec3");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002736,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.mediump_ivec3");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002737,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.highp_ivec3");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002738,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.lowp_ivec4");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002739,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.mediump_ivec4");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002740,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.highp_ivec4");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002741,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.lowp_uint");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002742,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.mediump_uint");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002743,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.highp_uint");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002744,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.lowp_uvec2");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002745,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.mediump_uvec2");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002746,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.highp_uvec2");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002747,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.lowp_uvec3");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002748,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.mediump_uvec3");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002749,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.highp_uvec3");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002750,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.lowp_uvec4");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002751,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.mediump_uvec4");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002752,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.highp_uvec4");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002753,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.bool");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002754,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.bvec2");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002755,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.bvec3");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002756,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.bvec4");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002757,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.lowp_mat2");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002758,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.mediump_mat2");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002759,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.highp_mat2");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002760,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.row_major_lowp_mat2");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002761,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.row_major_mediump_mat2");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002762,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.row_major_highp_mat2");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002763,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.column_major_lowp_mat2");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002764,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.column_major_mediump_mat2");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002765,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.column_major_highp_mat2");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002766,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.lowp_mat3");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002767,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.mediump_mat3");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002768,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.highp_mat3");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002769,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.row_major_lowp_mat3");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002770,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.row_major_mediump_mat3");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002771,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.row_major_highp_mat3");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002772,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.column_major_lowp_mat3");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002773,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.column_major_mediump_mat3");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002774,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.column_major_highp_mat3");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002775,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.lowp_mat4");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002776,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.mediump_mat4");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002777,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.highp_mat4");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002778,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.row_major_lowp_mat4");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002779,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.row_major_mediump_mat4");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002780,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.row_major_highp_mat4");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002781,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.column_major_lowp_mat4");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002782,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.column_major_mediump_mat4");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002783,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.column_major_highp_mat4");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002784,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.lowp_mat2x3");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002785,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.mediump_mat2x3");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002786,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.highp_mat2x3");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002787,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.row_major_lowp_mat2x3");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002788,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.row_major_mediump_mat2x3");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002789,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.row_major_highp_mat2x3");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002790,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.column_major_lowp_mat2x3");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002791,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.column_major_mediump_mat2x3");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002792,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.column_major_highp_mat2x3");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002793,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.lowp_mat2x4");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002794,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.mediump_mat2x4");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002795,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.highp_mat2x4");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002796,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.row_major_lowp_mat2x4");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002797,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.row_major_mediump_mat2x4");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002798,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.row_major_highp_mat2x4");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002799,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.column_major_lowp_mat2x4");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002800,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.column_major_mediump_mat2x4");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002801,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.column_major_highp_mat2x4");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002802,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.lowp_mat3x2");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002803,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.mediump_mat3x2");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002804,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.highp_mat3x2");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002805,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.row_major_lowp_mat3x2");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002806,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.row_major_mediump_mat3x2");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002807,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.row_major_highp_mat3x2");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002808,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.column_major_lowp_mat3x2");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002809,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.column_major_mediump_mat3x2");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002810,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.column_major_highp_mat3x2");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002811,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.lowp_mat3x4");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002812,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.mediump_mat3x4");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002813,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.highp_mat3x4");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002814,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.row_major_lowp_mat3x4");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002815,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.row_major_mediump_mat3x4");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002816,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.row_major_highp_mat3x4");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002817,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.column_major_lowp_mat3x4");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002818,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.column_major_mediump_mat3x4");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002819,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.column_major_highp_mat3x4");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002820,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.lowp_mat4x2");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002821,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.mediump_mat4x2");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002822,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.highp_mat4x2");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002823,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.row_major_lowp_mat4x2");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002824,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.row_major_mediump_mat4x2");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002825,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.row_major_highp_mat4x2");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002826,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.column_major_lowp_mat4x2");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002827,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.column_major_mediump_mat4x2");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002828,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.column_major_highp_mat4x2");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002829,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.lowp_mat4x3");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002830,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.mediump_mat4x3");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002831,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.highp_mat4x3");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002832,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.row_major_lowp_mat4x3");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002833,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.row_major_mediump_mat4x3");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002834,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.row_major_highp_mat4x3");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002835,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.column_major_lowp_mat4x3");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002836,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.column_major_mediump_mat4x3");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_002837,
    "KHR-GL46.shaders.uniform_block.single_basic_type.shared.column_major_highp_mat4x3");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_003080,
    "KHR-GL46.shaders.uniform_block.single_basic_array.shared.float");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_003081,
    "KHR-GL46.shaders.uniform_block.single_basic_array.shared.vec2");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_003082,
    "KHR-GL46.shaders.uniform_block.single_basic_array.shared.vec3");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_003083,
    "KHR-GL46.shaders.uniform_block.single_basic_array.shared.vec4");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_003084,
    "KHR-GL46.shaders.uniform_block.single_basic_array.shared.int");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_003085,
    "KHR-GL46.shaders.uniform_block.single_basic_array.shared.ivec2");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_003086,
    "KHR-GL46.shaders.uniform_block.single_basic_array.shared.ivec3");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_003087,
    "KHR-GL46.shaders.uniform_block.single_basic_array.shared.ivec4");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_003088,
    "KHR-GL46.shaders.uniform_block.single_basic_array.shared.uint");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_003089,
    "KHR-GL46.shaders.uniform_block.single_basic_array.shared.uvec2");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_003090,
    "KHR-GL46.shaders.uniform_block.single_basic_array.shared.uvec3");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_003091,
    "KHR-GL46.shaders.uniform_block.single_basic_array.shared.uvec4");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_003092,
    "KHR-GL46.shaders.uniform_block.single_basic_array.shared.bool");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_003093,
    "KHR-GL46.shaders.uniform_block.single_basic_array.shared.bvec2");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_003094,
    "KHR-GL46.shaders.uniform_block.single_basic_array.shared.bvec3");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_003095,
    "KHR-GL46.shaders.uniform_block.single_basic_array.shared.bvec4");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_003096,
    "KHR-GL46.shaders.uniform_block.single_basic_array.shared.mat2");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_003097,
    "KHR-GL46.shaders.uniform_block.single_basic_array.shared.row_major_mat2");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_003098,
    "KHR-GL46.shaders.uniform_block.single_basic_array.shared.column_major_mat2");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_003099,
    "KHR-GL46.shaders.uniform_block.single_basic_array.shared.mat3");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_003100,
    "KHR-GL46.shaders.uniform_block.single_basic_array.shared.row_major_mat3");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_003101,
    "KHR-GL46.shaders.uniform_block.single_basic_array.shared.column_major_mat3");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_003102,
    "KHR-GL46.shaders.uniform_block.single_basic_array.shared.mat4");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_003103,
    "KHR-GL46.shaders.uniform_block.single_basic_array.shared.row_major_mat4");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_003104,
    "KHR-GL46.shaders.uniform_block.single_basic_array.shared.column_major_mat4");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_003105,
    "KHR-GL46.shaders.uniform_block.single_basic_array.shared.mat2x3");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_003106,
    "KHR-GL46.shaders.uniform_block.single_basic_array.shared.row_major_mat2x3");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_003107,
    "KHR-GL46.shaders.uniform_block.single_basic_array.shared.column_major_mat2x3");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_003108,
    "KHR-GL46.shaders.uniform_block.single_basic_array.shared.mat2x4");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_003109,
    "KHR-GL46.shaders.uniform_block.single_basic_array.shared.row_major_mat2x4");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_003110,
    "KHR-GL46.shaders.uniform_block.single_basic_array.shared.column_major_mat2x4");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_003111,
    "KHR-GL46.shaders.uniform_block.single_basic_array.shared.mat3x2");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_003112,
    "KHR-GL46.shaders.uniform_block.single_basic_array.shared.row_major_mat3x2");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_003113,
    "KHR-GL46.shaders.uniform_block.single_basic_array.shared.column_major_mat3x2");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_003114,
    "KHR-GL46.shaders.uniform_block.single_basic_array.shared.mat3x4");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_003115,
    "KHR-GL46.shaders.uniform_block.single_basic_array.shared.row_major_mat3x4");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_003116,
    "KHR-GL46.shaders.uniform_block.single_basic_array.shared.column_major_mat3x4");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_003117,
    "KHR-GL46.shaders.uniform_block.single_basic_array.shared.mat4x2");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_003118,
    "KHR-GL46.shaders.uniform_block.single_basic_array.shared.row_major_mat4x2");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_003119,
    "KHR-GL46.shaders.uniform_block.single_basic_array.shared.column_major_mat4x2");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_003120,
    "KHR-GL46.shaders.uniform_block.single_basic_array.shared.mat4x3");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_003121,
    "KHR-GL46.shaders.uniform_block.single_basic_array.shared.row_major_mat4x3");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_003122,
    "KHR-GL46.shaders.uniform_block.single_basic_array.shared.column_major_mat4x3");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_003245,
    "KHR-GL46.shaders.uniform_block.instance_array_basic_type.shared.float");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_003246,
    "KHR-GL46.shaders.uniform_block.instance_array_basic_type.shared.vec2");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_003247,
    "KHR-GL46.shaders.uniform_block.instance_array_basic_type.shared.vec3");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_003248,
    "KHR-GL46.shaders.uniform_block.instance_array_basic_type.shared.vec4");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_003249,
    "KHR-GL46.shaders.uniform_block.instance_array_basic_type.shared.int");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_003250,
    "KHR-GL46.shaders.uniform_block.instance_array_basic_type.shared.ivec2");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_003251,
    "KHR-GL46.shaders.uniform_block.instance_array_basic_type.shared.ivec3");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_003252,
    "KHR-GL46.shaders.uniform_block.instance_array_basic_type.shared.ivec4");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_003253,
    "KHR-GL46.shaders.uniform_block.instance_array_basic_type.shared.uint");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_003254,
    "KHR-GL46.shaders.uniform_block.instance_array_basic_type.shared.uvec2");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_003255,
    "KHR-GL46.shaders.uniform_block.instance_array_basic_type.shared.uvec3");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_003256,
    "KHR-GL46.shaders.uniform_block.instance_array_basic_type.shared.uvec4");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_003257,
    "KHR-GL46.shaders.uniform_block.instance_array_basic_type.shared.bool");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_003258,
    "KHR-GL46.shaders.uniform_block.instance_array_basic_type.shared.bvec2");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_003259,
    "KHR-GL46.shaders.uniform_block.instance_array_basic_type.shared.bvec3");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_003260,
    "KHR-GL46.shaders.uniform_block.instance_array_basic_type.shared.bvec4");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_003261,
    "KHR-GL46.shaders.uniform_block.instance_array_basic_type.shared.mat2");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_003262,
    "KHR-GL46.shaders.uniform_block.instance_array_basic_type.shared.row_major_mat2");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_003263,
    "KHR-GL46.shaders.uniform_block.instance_array_basic_type.shared.column_major_mat2");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_003264,
    "KHR-GL46.shaders.uniform_block.instance_array_basic_type.shared.mat3");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_003265,
    "KHR-GL46.shaders.uniform_block.instance_array_basic_type.shared.row_major_mat3");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_003266,
    "KHR-GL46.shaders.uniform_block.instance_array_basic_type.shared.column_major_mat3");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_003267,
    "KHR-GL46.shaders.uniform_block.instance_array_basic_type.shared.mat4");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_003268,
    "KHR-GL46.shaders.uniform_block.instance_array_basic_type.shared.row_major_mat4");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_003269,
    "KHR-GL46.shaders.uniform_block.instance_array_basic_type.shared.column_major_mat4");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_003270,
    "KHR-GL46.shaders.uniform_block.instance_array_basic_type.shared.mat2x3");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_003271,
    "KHR-GL46.shaders.uniform_block.instance_array_basic_type.shared.row_major_mat2x3");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_003272,
    "KHR-GL46.shaders.uniform_block.instance_array_basic_type.shared.column_major_mat2x3");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_003273,
    "KHR-GL46.shaders.uniform_block.instance_array_basic_type.shared.mat2x4");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_003274,
    "KHR-GL46.shaders.uniform_block.instance_array_basic_type.shared.row_major_mat2x4");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_003275,
    "KHR-GL46.shaders.uniform_block.instance_array_basic_type.shared.column_major_mat2x4");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_003276,
    "KHR-GL46.shaders.uniform_block.instance_array_basic_type.shared.mat3x2");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_003277,
    "KHR-GL46.shaders.uniform_block.instance_array_basic_type.shared.row_major_mat3x2");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_003278,
    "KHR-GL46.shaders.uniform_block.instance_array_basic_type.shared.column_major_mat3x2");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_003279,
    "KHR-GL46.shaders.uniform_block.instance_array_basic_type.shared.mat3x4");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_003280,
    "KHR-GL46.shaders.uniform_block.instance_array_basic_type.shared.row_major_mat3x4");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_003281,
    "KHR-GL46.shaders.uniform_block.instance_array_basic_type.shared.column_major_mat3x4");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_003282,
    "KHR-GL46.shaders.uniform_block.instance_array_basic_type.shared.mat4x2");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_003283,
    "KHR-GL46.shaders.uniform_block.instance_array_basic_type.shared.row_major_mat4x2");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_003284,
    "KHR-GL46.shaders.uniform_block.instance_array_basic_type.shared.column_major_mat4x2");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_003285,
    "KHR-GL46.shaders.uniform_block.instance_array_basic_type.shared.mat4x3");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_003286,
    "KHR-GL46.shaders.uniform_block.instance_array_basic_type.shared.row_major_mat4x3");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_003287,
    "KHR-GL46.shaders.uniform_block.instance_array_basic_type.shared.column_major_mat4x3");
