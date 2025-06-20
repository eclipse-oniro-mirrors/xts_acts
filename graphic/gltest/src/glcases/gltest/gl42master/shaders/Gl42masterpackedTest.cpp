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
#include "../Gl42masterBaseFunc.h"
#include "../ActsGl42master0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002838,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.lowp_float");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002839,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.mediump_float");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002840,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.highp_float");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002841,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.lowp_vec2");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002842,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.mediump_vec2");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002843,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.highp_vec2");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002844,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.lowp_vec3");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002845,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.mediump_vec3");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002846,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.highp_vec3");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002847,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.lowp_vec4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002848,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.mediump_vec4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002849,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.highp_vec4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002850,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.lowp_int");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002851,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.mediump_int");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002852,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.highp_int");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002853,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.lowp_ivec2");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002854,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.mediump_ivec2");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002855,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.highp_ivec2");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002856,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.lowp_ivec3");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002857,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.mediump_ivec3");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002858,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.highp_ivec3");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002859,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.lowp_ivec4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002860,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.mediump_ivec4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002861,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.highp_ivec4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002862,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.lowp_uint");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002863,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.mediump_uint");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002864,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.highp_uint");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002865,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.lowp_uvec2");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002866,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.mediump_uvec2");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002867,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.highp_uvec2");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002868,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.lowp_uvec3");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002869,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.mediump_uvec3");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002870,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.highp_uvec3");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002871,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.lowp_uvec4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002872,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.mediump_uvec4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002873,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.highp_uvec4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002874,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.bool");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002875,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.bvec2");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002876,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.bvec3");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002877,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.bvec4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002878,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.lowp_mat2");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002879,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.mediump_mat2");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002880,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.highp_mat2");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002881,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.row_major_lowp_mat2");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002882,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.row_major_mediump_mat2");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002883,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.row_major_highp_mat2");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002884,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.column_major_lowp_mat2");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002885,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.column_major_mediump_mat2");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002886,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.column_major_highp_mat2");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002887,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.lowp_mat3");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002888,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.mediump_mat3");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002889,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.highp_mat3");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002890,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.row_major_lowp_mat3");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002891,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.row_major_mediump_mat3");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002892,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.row_major_highp_mat3");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002893,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.column_major_lowp_mat3");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002894,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.column_major_mediump_mat3");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002895,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.column_major_highp_mat3");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002896,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.lowp_mat4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002897,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.mediump_mat4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002898,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.highp_mat4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002899,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.row_major_lowp_mat4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002900,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.row_major_mediump_mat4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002901,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.row_major_highp_mat4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002902,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.column_major_lowp_mat4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002903,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.column_major_mediump_mat4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002904,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.column_major_highp_mat4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002905,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.lowp_mat2x3");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002906,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.mediump_mat2x3");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002907,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.highp_mat2x3");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002908,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.row_major_lowp_mat2x3");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002909,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.row_major_mediump_mat2x3");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002910,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.row_major_highp_mat2x3");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002911,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.column_major_lowp_mat2x3");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002912,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.column_major_mediump_mat2x3");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002913,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.column_major_highp_mat2x3");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002914,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.lowp_mat2x4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002915,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.mediump_mat2x4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002916,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.highp_mat2x4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002917,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.row_major_lowp_mat2x4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002918,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.row_major_mediump_mat2x4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002919,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.row_major_highp_mat2x4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002920,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.column_major_lowp_mat2x4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002921,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.column_major_mediump_mat2x4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002922,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.column_major_highp_mat2x4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002923,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.lowp_mat3x2");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002924,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.mediump_mat3x2");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002925,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.highp_mat3x2");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002926,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.row_major_lowp_mat3x2");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002927,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.row_major_mediump_mat3x2");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002928,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.row_major_highp_mat3x2");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002929,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.column_major_lowp_mat3x2");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002930,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.column_major_mediump_mat3x2");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002931,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.column_major_highp_mat3x2");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002932,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.lowp_mat3x4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002933,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.mediump_mat3x4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002934,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.highp_mat3x4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002935,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.row_major_lowp_mat3x4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002936,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.row_major_mediump_mat3x4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002937,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.row_major_highp_mat3x4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002938,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.column_major_lowp_mat3x4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002939,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.column_major_mediump_mat3x4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002940,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.column_major_highp_mat3x4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002941,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.lowp_mat4x2");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002942,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.mediump_mat4x2");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002943,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.highp_mat4x2");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002944,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.row_major_lowp_mat4x2");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002945,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.row_major_mediump_mat4x2");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002946,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.row_major_highp_mat4x2");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002947,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.column_major_lowp_mat4x2");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002948,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.column_major_mediump_mat4x2");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002949,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.column_major_highp_mat4x2");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002950,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.lowp_mat4x3");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002951,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.mediump_mat4x3");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002952,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.highp_mat4x3");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002953,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.row_major_lowp_mat4x3");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002954,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.row_major_mediump_mat4x3");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002955,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.row_major_highp_mat4x3");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002956,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.column_major_lowp_mat4x3");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002957,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.column_major_mediump_mat4x3");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_002958,
    "KHR-GL42.shaders.uniform_block.single_basic_type.packed.column_major_highp_mat4x3");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003123,
    "KHR-GL42.shaders.uniform_block.single_basic_array.packed.float");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003124,
    "KHR-GL42.shaders.uniform_block.single_basic_array.packed.vec2");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003125,
    "KHR-GL42.shaders.uniform_block.single_basic_array.packed.vec3");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003126,
    "KHR-GL42.shaders.uniform_block.single_basic_array.packed.vec4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003127,
    "KHR-GL42.shaders.uniform_block.single_basic_array.packed.int");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003128,
    "KHR-GL42.shaders.uniform_block.single_basic_array.packed.ivec2");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003129,
    "KHR-GL42.shaders.uniform_block.single_basic_array.packed.ivec3");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003130,
    "KHR-GL42.shaders.uniform_block.single_basic_array.packed.ivec4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003131,
    "KHR-GL42.shaders.uniform_block.single_basic_array.packed.uint");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003132,
    "KHR-GL42.shaders.uniform_block.single_basic_array.packed.uvec2");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003133,
    "KHR-GL42.shaders.uniform_block.single_basic_array.packed.uvec3");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003134,
    "KHR-GL42.shaders.uniform_block.single_basic_array.packed.uvec4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003135,
    "KHR-GL42.shaders.uniform_block.single_basic_array.packed.bool");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003136,
    "KHR-GL42.shaders.uniform_block.single_basic_array.packed.bvec2");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003137,
    "KHR-GL42.shaders.uniform_block.single_basic_array.packed.bvec3");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003138,
    "KHR-GL42.shaders.uniform_block.single_basic_array.packed.bvec4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003139,
    "KHR-GL42.shaders.uniform_block.single_basic_array.packed.mat2");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003140,
    "KHR-GL42.shaders.uniform_block.single_basic_array.packed.row_major_mat2");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003141,
    "KHR-GL42.shaders.uniform_block.single_basic_array.packed.column_major_mat2");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003142,
    "KHR-GL42.shaders.uniform_block.single_basic_array.packed.mat3");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003143,
    "KHR-GL42.shaders.uniform_block.single_basic_array.packed.row_major_mat3");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003144,
    "KHR-GL42.shaders.uniform_block.single_basic_array.packed.column_major_mat3");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003145,
    "KHR-GL42.shaders.uniform_block.single_basic_array.packed.mat4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003146,
    "KHR-GL42.shaders.uniform_block.single_basic_array.packed.row_major_mat4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003147,
    "KHR-GL42.shaders.uniform_block.single_basic_array.packed.column_major_mat4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003148,
    "KHR-GL42.shaders.uniform_block.single_basic_array.packed.mat2x3");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003149,
    "KHR-GL42.shaders.uniform_block.single_basic_array.packed.row_major_mat2x3");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003150,
    "KHR-GL42.shaders.uniform_block.single_basic_array.packed.column_major_mat2x3");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003151,
    "KHR-GL42.shaders.uniform_block.single_basic_array.packed.mat2x4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003152,
    "KHR-GL42.shaders.uniform_block.single_basic_array.packed.row_major_mat2x4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003153,
    "KHR-GL42.shaders.uniform_block.single_basic_array.packed.column_major_mat2x4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003154,
    "KHR-GL42.shaders.uniform_block.single_basic_array.packed.mat3x2");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003155,
    "KHR-GL42.shaders.uniform_block.single_basic_array.packed.row_major_mat3x2");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003156,
    "KHR-GL42.shaders.uniform_block.single_basic_array.packed.column_major_mat3x2");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003157,
    "KHR-GL42.shaders.uniform_block.single_basic_array.packed.mat3x4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003158,
    "KHR-GL42.shaders.uniform_block.single_basic_array.packed.row_major_mat3x4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003159,
    "KHR-GL42.shaders.uniform_block.single_basic_array.packed.column_major_mat3x4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003160,
    "KHR-GL42.shaders.uniform_block.single_basic_array.packed.mat4x2");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003161,
    "KHR-GL42.shaders.uniform_block.single_basic_array.packed.row_major_mat4x2");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003162,
    "KHR-GL42.shaders.uniform_block.single_basic_array.packed.column_major_mat4x2");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003163,
    "KHR-GL42.shaders.uniform_block.single_basic_array.packed.mat4x3");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003164,
    "KHR-GL42.shaders.uniform_block.single_basic_array.packed.row_major_mat4x3");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003165,
    "KHR-GL42.shaders.uniform_block.single_basic_array.packed.column_major_mat4x3");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003288,
    "KHR-GL42.shaders.uniform_block.instance_array_basic_type.packed.float");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003289,
    "KHR-GL42.shaders.uniform_block.instance_array_basic_type.packed.vec2");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003290,
    "KHR-GL42.shaders.uniform_block.instance_array_basic_type.packed.vec3");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003291,
    "KHR-GL42.shaders.uniform_block.instance_array_basic_type.packed.vec4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003292,
    "KHR-GL42.shaders.uniform_block.instance_array_basic_type.packed.int");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003293,
    "KHR-GL42.shaders.uniform_block.instance_array_basic_type.packed.ivec2");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003294,
    "KHR-GL42.shaders.uniform_block.instance_array_basic_type.packed.ivec3");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003295,
    "KHR-GL42.shaders.uniform_block.instance_array_basic_type.packed.ivec4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003296,
    "KHR-GL42.shaders.uniform_block.instance_array_basic_type.packed.uint");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003297,
    "KHR-GL42.shaders.uniform_block.instance_array_basic_type.packed.uvec2");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003298,
    "KHR-GL42.shaders.uniform_block.instance_array_basic_type.packed.uvec3");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003299,
    "KHR-GL42.shaders.uniform_block.instance_array_basic_type.packed.uvec4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003300,
    "KHR-GL42.shaders.uniform_block.instance_array_basic_type.packed.bool");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003301,
    "KHR-GL42.shaders.uniform_block.instance_array_basic_type.packed.bvec2");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003302,
    "KHR-GL42.shaders.uniform_block.instance_array_basic_type.packed.bvec3");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003303,
    "KHR-GL42.shaders.uniform_block.instance_array_basic_type.packed.bvec4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003304,
    "KHR-GL42.shaders.uniform_block.instance_array_basic_type.packed.mat2");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003305,
    "KHR-GL42.shaders.uniform_block.instance_array_basic_type.packed.row_major_mat2");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003306,
    "KHR-GL42.shaders.uniform_block.instance_array_basic_type.packed.column_major_mat2");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003307,
    "KHR-GL42.shaders.uniform_block.instance_array_basic_type.packed.mat3");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003308,
    "KHR-GL42.shaders.uniform_block.instance_array_basic_type.packed.row_major_mat3");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003309,
    "KHR-GL42.shaders.uniform_block.instance_array_basic_type.packed.column_major_mat3");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003310,
    "KHR-GL42.shaders.uniform_block.instance_array_basic_type.packed.mat4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003311,
    "KHR-GL42.shaders.uniform_block.instance_array_basic_type.packed.row_major_mat4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003312,
    "KHR-GL42.shaders.uniform_block.instance_array_basic_type.packed.column_major_mat4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003313,
    "KHR-GL42.shaders.uniform_block.instance_array_basic_type.packed.mat2x3");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003314,
    "KHR-GL42.shaders.uniform_block.instance_array_basic_type.packed.row_major_mat2x3");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003315,
    "KHR-GL42.shaders.uniform_block.instance_array_basic_type.packed.column_major_mat2x3");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003316,
    "KHR-GL42.shaders.uniform_block.instance_array_basic_type.packed.mat2x4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003317,
    "KHR-GL42.shaders.uniform_block.instance_array_basic_type.packed.row_major_mat2x4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003318,
    "KHR-GL42.shaders.uniform_block.instance_array_basic_type.packed.column_major_mat2x4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003319,
    "KHR-GL42.shaders.uniform_block.instance_array_basic_type.packed.mat3x2");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003320,
    "KHR-GL42.shaders.uniform_block.instance_array_basic_type.packed.row_major_mat3x2");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003321,
    "KHR-GL42.shaders.uniform_block.instance_array_basic_type.packed.column_major_mat3x2");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003322,
    "KHR-GL42.shaders.uniform_block.instance_array_basic_type.packed.mat3x4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003323,
    "KHR-GL42.shaders.uniform_block.instance_array_basic_type.packed.row_major_mat3x4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003324,
    "KHR-GL42.shaders.uniform_block.instance_array_basic_type.packed.column_major_mat3x4");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003325,
    "KHR-GL42.shaders.uniform_block.instance_array_basic_type.packed.mat4x2");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003326,
    "KHR-GL42.shaders.uniform_block.instance_array_basic_type.packed.row_major_mat4x2");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003327,
    "KHR-GL42.shaders.uniform_block.instance_array_basic_type.packed.column_major_mat4x2");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003328,
    "KHR-GL42.shaders.uniform_block.instance_array_basic_type.packed.mat4x3");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003329,
    "KHR-GL42.shaders.uniform_block.instance_array_basic_type.packed.row_major_mat4x3");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003330,
    "KHR-GL42.shaders.uniform_block.instance_array_basic_type.packed.column_major_mat4x3");
