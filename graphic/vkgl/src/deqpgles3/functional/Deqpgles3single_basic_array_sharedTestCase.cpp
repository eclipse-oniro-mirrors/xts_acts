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

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034852,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_array.shared.float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034853,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_array.shared.float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034854,
        "dEQP-GLES3.functional.ubo.singl",
        "e_basic_array.shared.float_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034855,
        "dEQP-GLES3.functional.ubo.singl",
        "e_basic_array.shared.vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034856,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_array.shared.vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034857,
        "dEQP-GLES3.functional.ubo.sing",
        "le_basic_array.shared.vec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034858,
        "dEQP-GLES3.functional.ubo.singl",
        "e_basic_array.shared.vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034859,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_array.shared.vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034860,
        "dEQP-GLES3.functional.ubo.sing",
        "le_basic_array.shared.vec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034861,
        "dEQP-GLES3.functional.ubo.singl",
        "e_basic_array.shared.vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034862,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_array.shared.vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034863,
        "dEQP-GLES3.functional.ubo.sing",
        "le_basic_array.shared.vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034864,
        "dEQP-GLES3.functional.ubo.singl",
        "e_basic_array.shared.int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034865,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_array.shared.int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034866,
        "dEQP-GLES3.functional.ubo.sing",
        "le_basic_array.shared.int_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034867,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_array.shared.ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034868,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_array.shared.ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034869,
        "dEQP-GLES3.functional.ubo.singl",
        "e_basic_array.shared.ivec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034870,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_array.shared.ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034871,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_array.shared.ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034872,
        "dEQP-GLES3.functional.ubo.singl",
        "e_basic_array.shared.ivec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034873,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_array.shared.ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034874,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_array.shared.ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034875,
        "dEQP-GLES3.functional.ubo.singl",
        "e_basic_array.shared.ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034876,
        "dEQP-GLES3.functional.ubo.singl",
        "e_basic_array.shared.uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034877,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_array.shared.uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034878,
        "dEQP-GLES3.functional.ubo.sing",
        "le_basic_array.shared.uint_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034879,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_array.shared.uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034880,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_array.shared.uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034881,
        "dEQP-GLES3.functional.ubo.singl",
        "e_basic_array.shared.uvec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034882,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_array.shared.uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034883,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_array.shared.uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034884,
        "dEQP-GLES3.functional.ubo.singl",
        "e_basic_array.shared.uvec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034885,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_array.shared.uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034886,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_array.shared.uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034887,
        "dEQP-GLES3.functional.ubo.singl",
        "e_basic_array.shared.uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034888,
        "dEQP-GLES3.functional.ubo.singl",
        "e_basic_array.shared.bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034889,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_array.shared.bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034890,
        "dEQP-GLES3.functional.ubo.sing",
        "le_basic_array.shared.bool_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034891,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_array.shared.bvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034892,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_array.shared.bvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034893,
        "dEQP-GLES3.functional.ubo.singl",
        "e_basic_array.shared.bvec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034894,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_array.shared.bvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034895,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_array.shared.bvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034896,
        "dEQP-GLES3.functional.ubo.singl",
        "e_basic_array.shared.bvec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034897,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_array.shared.bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034898,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_array.shared.bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034899,
        "dEQP-GLES3.functional.ubo.singl",
        "e_basic_array.shared.bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034900,
        "dEQP-GLES3.functional.ubo.singl",
        "e_basic_array.shared.mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034901,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_array.shared.mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034902,
        "dEQP-GLES3.functional.ubo.sing",
        "le_basic_array.shared.mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034903,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_array.shared.row_major_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034904,
        "dEQP-GLES3.functional.ubo.single_basi",
        "c_array.shared.row_major_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034905,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_array.shared.row_major_mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034906,
        "dEQP-GLES3.functional.ubo.single_basic",
        "_array.shared.column_major_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034907,
        "dEQP-GLES3.functional.ubo.single_basic_",
        "array.shared.column_major_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034908,
        "dEQP-GLES3.functional.ubo.single_basi",
        "c_array.shared.column_major_mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034909,
        "dEQP-GLES3.functional.ubo.singl",
        "e_basic_array.shared.mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034910,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_array.shared.mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034911,
        "dEQP-GLES3.functional.ubo.sing",
        "le_basic_array.shared.mat3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034912,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_array.shared.row_major_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034913,
        "dEQP-GLES3.functional.ubo.single_basi",
        "c_array.shared.row_major_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034914,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_array.shared.row_major_mat3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034915,
        "dEQP-GLES3.functional.ubo.single_basic",
        "_array.shared.column_major_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034916,
        "dEQP-GLES3.functional.ubo.single_basic_",
        "array.shared.column_major_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034917,
        "dEQP-GLES3.functional.ubo.single_basi",
        "c_array.shared.column_major_mat3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034918,
        "dEQP-GLES3.functional.ubo.singl",
        "e_basic_array.shared.mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034919,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_array.shared.mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034920,
        "dEQP-GLES3.functional.ubo.sing",
        "le_basic_array.shared.mat4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034921,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_array.shared.row_major_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034922,
        "dEQP-GLES3.functional.ubo.single_basi",
        "c_array.shared.row_major_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034923,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_array.shared.row_major_mat4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034924,
        "dEQP-GLES3.functional.ubo.single_basic",
        "_array.shared.column_major_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034925,
        "dEQP-GLES3.functional.ubo.single_basic_",
        "array.shared.column_major_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034926,
        "dEQP-GLES3.functional.ubo.single_basi",
        "c_array.shared.column_major_mat4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034927,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_array.shared.mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034928,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_array.shared.mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034929,
        "dEQP-GLES3.functional.ubo.singl",
        "e_basic_array.shared.mat2x3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034930,
        "dEQP-GLES3.functional.ubo.single_basi",
        "c_array.shared.row_major_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034931,
        "dEQP-GLES3.functional.ubo.single_basic",
        "_array.shared.row_major_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034932,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_array.shared.row_major_mat2x3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034933,
        "dEQP-GLES3.functional.ubo.single_basic_",
        "array.shared.column_major_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034934,
        "dEQP-GLES3.functional.ubo.single_basic_a",
        "rray.shared.column_major_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034935,
        "dEQP-GLES3.functional.ubo.single_basic",
        "_array.shared.column_major_mat2x3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034936,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_array.shared.mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034937,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_array.shared.mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034938,
        "dEQP-GLES3.functional.ubo.singl",
        "e_basic_array.shared.mat2x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034939,
        "dEQP-GLES3.functional.ubo.single_basi",
        "c_array.shared.row_major_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034940,
        "dEQP-GLES3.functional.ubo.single_basic",
        "_array.shared.row_major_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034941,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_array.shared.row_major_mat2x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034942,
        "dEQP-GLES3.functional.ubo.single_basic_",
        "array.shared.column_major_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034943,
        "dEQP-GLES3.functional.ubo.single_basic_a",
        "rray.shared.column_major_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034944,
        "dEQP-GLES3.functional.ubo.single_basic",
        "_array.shared.column_major_mat2x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034945,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_array.shared.mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034946,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_array.shared.mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034947,
        "dEQP-GLES3.functional.ubo.singl",
        "e_basic_array.shared.mat3x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034948,
        "dEQP-GLES3.functional.ubo.single_basi",
        "c_array.shared.row_major_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034949,
        "dEQP-GLES3.functional.ubo.single_basic",
        "_array.shared.row_major_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034950,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_array.shared.row_major_mat3x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034951,
        "dEQP-GLES3.functional.ubo.single_basic_",
        "array.shared.column_major_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034952,
        "dEQP-GLES3.functional.ubo.single_basic_a",
        "rray.shared.column_major_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034953,
        "dEQP-GLES3.functional.ubo.single_basic",
        "_array.shared.column_major_mat3x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034954,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_array.shared.mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034955,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_array.shared.mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034956,
        "dEQP-GLES3.functional.ubo.singl",
        "e_basic_array.shared.mat3x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034957,
        "dEQP-GLES3.functional.ubo.single_basi",
        "c_array.shared.row_major_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034958,
        "dEQP-GLES3.functional.ubo.single_basic",
        "_array.shared.row_major_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034959,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_array.shared.row_major_mat3x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034960,
        "dEQP-GLES3.functional.ubo.single_basic_",
        "array.shared.column_major_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034961,
        "dEQP-GLES3.functional.ubo.single_basic_a",
        "rray.shared.column_major_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034962,
        "dEQP-GLES3.functional.ubo.single_basic",
        "_array.shared.column_major_mat3x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034963,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_array.shared.mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034964,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_array.shared.mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034965,
        "dEQP-GLES3.functional.ubo.singl",
        "e_basic_array.shared.mat4x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034966,
        "dEQP-GLES3.functional.ubo.single_basi",
        "c_array.shared.row_major_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034967,
        "dEQP-GLES3.functional.ubo.single_basic",
        "_array.shared.row_major_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034968,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_array.shared.row_major_mat4x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034969,
        "dEQP-GLES3.functional.ubo.single_basic_",
        "array.shared.column_major_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034970,
        "dEQP-GLES3.functional.ubo.single_basic_a",
        "rray.shared.column_major_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034971,
        "dEQP-GLES3.functional.ubo.single_basic",
        "_array.shared.column_major_mat4x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034972,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_array.shared.mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034973,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_array.shared.mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034974,
        "dEQP-GLES3.functional.ubo.singl",
        "e_basic_array.shared.mat4x3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034975,
        "dEQP-GLES3.functional.ubo.single_basi",
        "c_array.shared.row_major_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034976,
        "dEQP-GLES3.functional.ubo.single_basic",
        "_array.shared.row_major_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034977,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_array.shared.row_major_mat4x3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034978,
        "dEQP-GLES3.functional.ubo.single_basic_",
        "array.shared.column_major_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034979,
        "dEQP-GLES3.functional.ubo.single_basic_a",
        "rray.shared.column_major_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30035TestSuite, TestCase_034980,
        "dEQP-GLES3.functional.ubo.single_basic",
        "_array.shared.column_major_mat4x3_both");
