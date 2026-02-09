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
#include "../Deqpgles3BaseFunc.h"
#include "../ActsDeqpgles30035TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034981,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_array.packed.float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034982,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_array.packed.float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034983,
        "dEQP-GLES3.functional.ubo.singl",
        "e_basic_array.packed.vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034984,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_array.packed.vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034985,
        "dEQP-GLES3.functional.ubo.singl",
        "e_basic_array.packed.vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034986,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_array.packed.vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034987,
        "dEQP-GLES3.functional.ubo.singl",
        "e_basic_array.packed.vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034988,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_array.packed.vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034989,
        "dEQP-GLES3.functional.ubo.singl",
        "e_basic_array.packed.int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034990,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_array.packed.int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034991,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_array.packed.ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034992,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_array.packed.ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034993,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_array.packed.ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034994,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_array.packed.ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034995,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_array.packed.ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034996,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_array.packed.ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034997,
        "dEQP-GLES3.functional.ubo.singl",
        "e_basic_array.packed.uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034998,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_array.packed.uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034999,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_array.packed.uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035000,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_array.packed.uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035001,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_array.packed.uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035002,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_array.packed.uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035003,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_array.packed.uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035004,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_array.packed.uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035005,
        "dEQP-GLES3.functional.ubo.singl",
        "e_basic_array.packed.bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035006,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_array.packed.bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035007,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_array.packed.bvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035008,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_array.packed.bvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035009,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_array.packed.bvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035010,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_array.packed.bvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035011,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_array.packed.bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035012,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_array.packed.bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035013,
        "dEQP-GLES3.functional.ubo.singl",
        "e_basic_array.packed.mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035014,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_array.packed.mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035015,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_array.packed.row_major_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035016,
        "dEQP-GLES3.functional.ubo.single_basi",
        "c_array.packed.row_major_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035017,
        "dEQP-GLES3.functional.ubo.single_basic",
        "_array.packed.column_major_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035018,
        "dEQP-GLES3.functional.ubo.single_basic_",
        "array.packed.column_major_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035019,
        "dEQP-GLES3.functional.ubo.singl",
        "e_basic_array.packed.mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035020,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_array.packed.mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035021,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_array.packed.row_major_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035022,
        "dEQP-GLES3.functional.ubo.single_basi",
        "c_array.packed.row_major_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035023,
        "dEQP-GLES3.functional.ubo.single_basic",
        "_array.packed.column_major_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035024,
        "dEQP-GLES3.functional.ubo.single_basic_",
        "array.packed.column_major_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035025,
        "dEQP-GLES3.functional.ubo.singl",
        "e_basic_array.packed.mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035026,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_array.packed.mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035027,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_array.packed.row_major_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035028,
        "dEQP-GLES3.functional.ubo.single_basi",
        "c_array.packed.row_major_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035029,
        "dEQP-GLES3.functional.ubo.single_basic",
        "_array.packed.column_major_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035030,
        "dEQP-GLES3.functional.ubo.single_basic_",
        "array.packed.column_major_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035031,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_array.packed.mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035032,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_array.packed.mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035033,
        "dEQP-GLES3.functional.ubo.single_basi",
        "c_array.packed.row_major_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035034,
        "dEQP-GLES3.functional.ubo.single_basic",
        "_array.packed.row_major_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035035,
        "dEQP-GLES3.functional.ubo.single_basic_",
        "array.packed.column_major_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035036,
        "dEQP-GLES3.functional.ubo.single_basic_a",
        "rray.packed.column_major_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035037,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_array.packed.mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035038,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_array.packed.mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035039,
        "dEQP-GLES3.functional.ubo.single_basi",
        "c_array.packed.row_major_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035040,
        "dEQP-GLES3.functional.ubo.single_basic",
        "_array.packed.row_major_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035041,
        "dEQP-GLES3.functional.ubo.single_basic_",
        "array.packed.column_major_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035042,
        "dEQP-GLES3.functional.ubo.single_basic_a",
        "rray.packed.column_major_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035043,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_array.packed.mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035044,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_array.packed.mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035045,
        "dEQP-GLES3.functional.ubo.single_basi",
        "c_array.packed.row_major_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035046,
        "dEQP-GLES3.functional.ubo.single_basic",
        "_array.packed.row_major_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035047,
        "dEQP-GLES3.functional.ubo.single_basic_",
        "array.packed.column_major_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035048,
        "dEQP-GLES3.functional.ubo.single_basic_a",
        "rray.packed.column_major_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035049,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_array.packed.mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035050,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_array.packed.mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035051,
        "dEQP-GLES3.functional.ubo.single_basi",
        "c_array.packed.row_major_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035052,
        "dEQP-GLES3.functional.ubo.single_basic",
        "_array.packed.row_major_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035053,
        "dEQP-GLES3.functional.ubo.single_basic_",
        "array.packed.column_major_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035054,
        "dEQP-GLES3.functional.ubo.single_basic_a",
        "rray.packed.column_major_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035055,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_array.packed.mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035056,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_array.packed.mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035057,
        "dEQP-GLES3.functional.ubo.single_basi",
        "c_array.packed.row_major_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035058,
        "dEQP-GLES3.functional.ubo.single_basic",
        "_array.packed.row_major_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035059,
        "dEQP-GLES3.functional.ubo.single_basic_",
        "array.packed.column_major_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035060,
        "dEQP-GLES3.functional.ubo.single_basic_a",
        "rray.packed.column_major_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035061,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_array.packed.mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035062,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_array.packed.mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035063,
        "dEQP-GLES3.functional.ubo.single_basi",
        "c_array.packed.row_major_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035064,
        "dEQP-GLES3.functional.ubo.single_basic",
        "_array.packed.row_major_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035065,
        "dEQP-GLES3.functional.ubo.single_basic_",
        "array.packed.column_major_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_035066,
        "dEQP-GLES3.functional.ubo.single_basic_a",
        "rray.packed.column_major_mat4x3_fragment");
