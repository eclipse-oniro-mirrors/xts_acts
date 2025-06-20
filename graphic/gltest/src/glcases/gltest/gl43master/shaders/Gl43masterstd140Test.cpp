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
#include "../Gl43masterBaseFunc.h"
#include "../ActsGl43master0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002959,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.lowp_float");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002960,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.mediump_float");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002961,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.highp_float");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002962,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.lowp_vec2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002963,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.mediump_vec2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002964,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.highp_vec2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002965,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.lowp_vec3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002966,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.mediump_vec3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002967,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.highp_vec3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002968,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.lowp_vec4");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002969,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.mediump_vec4");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002970,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.highp_vec4");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002971,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.lowp_int");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002972,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.mediump_int");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002973,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.highp_int");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002974,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.lowp_ivec2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002975,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.mediump_ivec2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002976,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.highp_ivec2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002977,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.lowp_ivec3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002978,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.mediump_ivec3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002979,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.highp_ivec3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002980,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.lowp_ivec4");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002981,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.mediump_ivec4");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002982,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.highp_ivec4");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002983,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.lowp_uint");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002984,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.mediump_uint");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002985,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.highp_uint");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002986,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.lowp_uvec2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002987,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.mediump_uvec2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002988,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.highp_uvec2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002989,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.lowp_uvec3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002990,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.mediump_uvec3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002991,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.highp_uvec3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002992,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.lowp_uvec4");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002993,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.mediump_uvec4");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002994,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.highp_uvec4");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002995,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.bool");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002996,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.bvec2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002997,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.bvec3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002998,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.bvec4");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002999,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.lowp_mat2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003000,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.mediump_mat2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003001,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.highp_mat2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003002,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.row_major_lowp_mat2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003003,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.row_major_mediump_mat2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003004,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.row_major_highp_mat2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003005,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.column_major_lowp_mat2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003006,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.column_major_mediump_mat2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003007,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.column_major_highp_mat2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003008,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.lowp_mat3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003009,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.mediump_mat3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003010,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.highp_mat3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003011,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.row_major_lowp_mat3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003012,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.row_major_mediump_mat3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003013,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.row_major_highp_mat3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003014,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.column_major_lowp_mat3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003015,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.column_major_mediump_mat3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003016,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.column_major_highp_mat3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003017,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.lowp_mat4");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003018,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.mediump_mat4");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003019,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.highp_mat4");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003020,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.row_major_lowp_mat4");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003021,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.row_major_mediump_mat4");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003022,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.row_major_highp_mat4");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003023,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.column_major_lowp_mat4");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003024,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.column_major_mediump_mat4");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003025,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.column_major_highp_mat4");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003026,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.lowp_mat2x3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003027,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.mediump_mat2x3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003028,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.highp_mat2x3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003029,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.row_major_lowp_mat2x3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003030,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.row_major_mediump_mat2x3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003031,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.row_major_highp_mat2x3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003032,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.column_major_lowp_mat2x3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003033,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.column_major_mediump_mat2x3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003034,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.column_major_highp_mat2x3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003035,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.lowp_mat2x4");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003036,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.mediump_mat2x4");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003037,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.highp_mat2x4");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003038,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.row_major_lowp_mat2x4");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003039,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.row_major_mediump_mat2x4");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003040,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.row_major_highp_mat2x4");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003041,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.column_major_lowp_mat2x4");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003042,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.column_major_mediump_mat2x4");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003043,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.column_major_highp_mat2x4");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003044,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.lowp_mat3x2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003045,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.mediump_mat3x2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003046,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.highp_mat3x2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003047,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.row_major_lowp_mat3x2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003048,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.row_major_mediump_mat3x2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003049,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.row_major_highp_mat3x2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003050,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.column_major_lowp_mat3x2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003051,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.column_major_mediump_mat3x2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003052,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.column_major_highp_mat3x2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003053,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.lowp_mat3x4");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003054,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.mediump_mat3x4");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003055,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.highp_mat3x4");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003056,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.row_major_lowp_mat3x4");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003057,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.row_major_mediump_mat3x4");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003058,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.row_major_highp_mat3x4");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003059,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.column_major_lowp_mat3x4");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003060,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.column_major_mediump_mat3x4");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003061,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.column_major_highp_mat3x4");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003062,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.lowp_mat4x2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003063,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.mediump_mat4x2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003064,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.highp_mat4x2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003065,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.row_major_lowp_mat4x2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003066,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.row_major_mediump_mat4x2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003067,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.row_major_highp_mat4x2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003068,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.column_major_lowp_mat4x2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003069,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.column_major_mediump_mat4x2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003070,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.column_major_highp_mat4x2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003071,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.lowp_mat4x3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003072,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.mediump_mat4x3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003073,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.highp_mat4x3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003074,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.row_major_lowp_mat4x3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003075,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.row_major_mediump_mat4x3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003076,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.row_major_highp_mat4x3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003077,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.column_major_lowp_mat4x3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003078,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.column_major_mediump_mat4x3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003079,
    "KHR-GL43.shaders.uniform_block.single_basic_type.std140.column_major_highp_mat4x3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003166,
    "KHR-GL43.shaders.uniform_block.single_basic_array.std140.float");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003167,
    "KHR-GL43.shaders.uniform_block.single_basic_array.std140.vec2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003168,
    "KHR-GL43.shaders.uniform_block.single_basic_array.std140.vec3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003169,
    "KHR-GL43.shaders.uniform_block.single_basic_array.std140.vec4");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003170,
    "KHR-GL43.shaders.uniform_block.single_basic_array.std140.int");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003171,
    "KHR-GL43.shaders.uniform_block.single_basic_array.std140.ivec2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003172,
    "KHR-GL43.shaders.uniform_block.single_basic_array.std140.ivec3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003173,
    "KHR-GL43.shaders.uniform_block.single_basic_array.std140.ivec4");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003174,
    "KHR-GL43.shaders.uniform_block.single_basic_array.std140.uint");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003175,
    "KHR-GL43.shaders.uniform_block.single_basic_array.std140.uvec2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003176,
    "KHR-GL43.shaders.uniform_block.single_basic_array.std140.uvec3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003177,
    "KHR-GL43.shaders.uniform_block.single_basic_array.std140.uvec4");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003178,
    "KHR-GL43.shaders.uniform_block.single_basic_array.std140.bool");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003179,
    "KHR-GL43.shaders.uniform_block.single_basic_array.std140.bvec2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003180,
    "KHR-GL43.shaders.uniform_block.single_basic_array.std140.bvec3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003181,
    "KHR-GL43.shaders.uniform_block.single_basic_array.std140.bvec4");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003182,
    "KHR-GL43.shaders.uniform_block.single_basic_array.std140.mat2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003183,
    "KHR-GL43.shaders.uniform_block.single_basic_array.std140.row_major_mat2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003184,
    "KHR-GL43.shaders.uniform_block.single_basic_array.std140.column_major_mat2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003185,
    "KHR-GL43.shaders.uniform_block.single_basic_array.std140.mat3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003186,
    "KHR-GL43.shaders.uniform_block.single_basic_array.std140.row_major_mat3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003187,
    "KHR-GL43.shaders.uniform_block.single_basic_array.std140.column_major_mat3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003188,
    "KHR-GL43.shaders.uniform_block.single_basic_array.std140.mat4");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003189,
    "KHR-GL43.shaders.uniform_block.single_basic_array.std140.row_major_mat4");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003190,
    "KHR-GL43.shaders.uniform_block.single_basic_array.std140.column_major_mat4");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003191,
    "KHR-GL43.shaders.uniform_block.single_basic_array.std140.mat2x3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003192,
    "KHR-GL43.shaders.uniform_block.single_basic_array.std140.row_major_mat2x3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003193,
    "KHR-GL43.shaders.uniform_block.single_basic_array.std140.column_major_mat2x3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003194,
    "KHR-GL43.shaders.uniform_block.single_basic_array.std140.mat2x4");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003195,
    "KHR-GL43.shaders.uniform_block.single_basic_array.std140.row_major_mat2x4");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003196,
    "KHR-GL43.shaders.uniform_block.single_basic_array.std140.column_major_mat2x4");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003197,
    "KHR-GL43.shaders.uniform_block.single_basic_array.std140.mat3x2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003198,
    "KHR-GL43.shaders.uniform_block.single_basic_array.std140.row_major_mat3x2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003199,
    "KHR-GL43.shaders.uniform_block.single_basic_array.std140.column_major_mat3x2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003200,
    "KHR-GL43.shaders.uniform_block.single_basic_array.std140.mat3x4");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003201,
    "KHR-GL43.shaders.uniform_block.single_basic_array.std140.row_major_mat3x4");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003202,
    "KHR-GL43.shaders.uniform_block.single_basic_array.std140.column_major_mat3x4");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003203,
    "KHR-GL43.shaders.uniform_block.single_basic_array.std140.mat4x2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003204,
    "KHR-GL43.shaders.uniform_block.single_basic_array.std140.row_major_mat4x2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003205,
    "KHR-GL43.shaders.uniform_block.single_basic_array.std140.column_major_mat4x2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003206,
    "KHR-GL43.shaders.uniform_block.single_basic_array.std140.mat4x3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003207,
    "KHR-GL43.shaders.uniform_block.single_basic_array.std140.row_major_mat4x3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003208,
    "KHR-GL43.shaders.uniform_block.single_basic_array.std140.column_major_mat4x3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003331,
    "KHR-GL43.shaders.uniform_block.instance_array_basic_type.std140.float");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003332,
    "KHR-GL43.shaders.uniform_block.instance_array_basic_type.std140.vec2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003333,
    "KHR-GL43.shaders.uniform_block.instance_array_basic_type.std140.vec3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003334,
    "KHR-GL43.shaders.uniform_block.instance_array_basic_type.std140.vec4");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003335,
    "KHR-GL43.shaders.uniform_block.instance_array_basic_type.std140.int");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003336,
    "KHR-GL43.shaders.uniform_block.instance_array_basic_type.std140.ivec2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003337,
    "KHR-GL43.shaders.uniform_block.instance_array_basic_type.std140.ivec3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003338,
    "KHR-GL43.shaders.uniform_block.instance_array_basic_type.std140.ivec4");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003339,
    "KHR-GL43.shaders.uniform_block.instance_array_basic_type.std140.uint");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003340,
    "KHR-GL43.shaders.uniform_block.instance_array_basic_type.std140.uvec2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003341,
    "KHR-GL43.shaders.uniform_block.instance_array_basic_type.std140.uvec3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003342,
    "KHR-GL43.shaders.uniform_block.instance_array_basic_type.std140.uvec4");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003343,
    "KHR-GL43.shaders.uniform_block.instance_array_basic_type.std140.bool");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003344,
    "KHR-GL43.shaders.uniform_block.instance_array_basic_type.std140.bvec2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003345,
    "KHR-GL43.shaders.uniform_block.instance_array_basic_type.std140.bvec3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003346,
    "KHR-GL43.shaders.uniform_block.instance_array_basic_type.std140.bvec4");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003347,
    "KHR-GL43.shaders.uniform_block.instance_array_basic_type.std140.mat2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003348,
    "KHR-GL43.shaders.uniform_block.instance_array_basic_type.std140.row_major_mat2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003349,
    "KHR-GL43.shaders.uniform_block.instance_array_basic_type.std140.column_major_mat2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003350,
    "KHR-GL43.shaders.uniform_block.instance_array_basic_type.std140.mat3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003351,
    "KHR-GL43.shaders.uniform_block.instance_array_basic_type.std140.row_major_mat3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003352,
    "KHR-GL43.shaders.uniform_block.instance_array_basic_type.std140.column_major_mat3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003353,
    "KHR-GL43.shaders.uniform_block.instance_array_basic_type.std140.mat4");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003354,
    "KHR-GL43.shaders.uniform_block.instance_array_basic_type.std140.row_major_mat4");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003355,
    "KHR-GL43.shaders.uniform_block.instance_array_basic_type.std140.column_major_mat4");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003356,
    "KHR-GL43.shaders.uniform_block.instance_array_basic_type.std140.mat2x3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003357,
    "KHR-GL43.shaders.uniform_block.instance_array_basic_type.std140.row_major_mat2x3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003358,
    "KHR-GL43.shaders.uniform_block.instance_array_basic_type.std140.column_major_mat2x3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003359,
    "KHR-GL43.shaders.uniform_block.instance_array_basic_type.std140.mat2x4");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003360,
    "KHR-GL43.shaders.uniform_block.instance_array_basic_type.std140.row_major_mat2x4");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003361,
    "KHR-GL43.shaders.uniform_block.instance_array_basic_type.std140.column_major_mat2x4");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003362,
    "KHR-GL43.shaders.uniform_block.instance_array_basic_type.std140.mat3x2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003363,
    "KHR-GL43.shaders.uniform_block.instance_array_basic_type.std140.row_major_mat3x2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003364,
    "KHR-GL43.shaders.uniform_block.instance_array_basic_type.std140.column_major_mat3x2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003365,
    "KHR-GL43.shaders.uniform_block.instance_array_basic_type.std140.mat3x4");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003366,
    "KHR-GL43.shaders.uniform_block.instance_array_basic_type.std140.row_major_mat3x4");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003367,
    "KHR-GL43.shaders.uniform_block.instance_array_basic_type.std140.column_major_mat3x4");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003368,
    "KHR-GL43.shaders.uniform_block.instance_array_basic_type.std140.mat4x2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003369,
    "KHR-GL43.shaders.uniform_block.instance_array_basic_type.std140.row_major_mat4x2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003370,
    "KHR-GL43.shaders.uniform_block.instance_array_basic_type.std140.column_major_mat4x2");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003371,
    "KHR-GL43.shaders.uniform_block.instance_array_basic_type.std140.mat4x3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003372,
    "KHR-GL43.shaders.uniform_block.instance_array_basic_type.std140.row_major_mat4x3");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003373,
    "KHR-GL43.shaders.uniform_block.instance_array_basic_type.std140.column_major_mat4x3");
