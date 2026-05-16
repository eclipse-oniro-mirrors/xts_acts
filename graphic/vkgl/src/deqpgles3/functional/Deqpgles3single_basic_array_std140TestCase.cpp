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
#include "../ActsDeqpgles30036TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035067,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_array.std140.float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035068,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_array.std140.float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035069,
        "dEQP-GLES3.functional.ubo.singl",
        "e_basic_array.std140.float_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035070,
        "dEQP-GLES3.functional.ubo.singl",
        "e_basic_array.std140.vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035071,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_array.std140.vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035072,
        "dEQP-GLES3.functional.ubo.sing",
        "le_basic_array.std140.vec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035073,
        "dEQP-GLES3.functional.ubo.singl",
        "e_basic_array.std140.vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035074,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_array.std140.vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035075,
        "dEQP-GLES3.functional.ubo.sing",
        "le_basic_array.std140.vec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035076,
        "dEQP-GLES3.functional.ubo.singl",
        "e_basic_array.std140.vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035077,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_array.std140.vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035078,
        "dEQP-GLES3.functional.ubo.sing",
        "le_basic_array.std140.vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035079,
        "dEQP-GLES3.functional.ubo.singl",
        "e_basic_array.std140.int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035080,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_array.std140.int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035081,
        "dEQP-GLES3.functional.ubo.sing",
        "le_basic_array.std140.int_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035082,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_array.std140.ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035083,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_array.std140.ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035084,
        "dEQP-GLES3.functional.ubo.singl",
        "e_basic_array.std140.ivec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035085,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_array.std140.ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035086,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_array.std140.ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035087,
        "dEQP-GLES3.functional.ubo.singl",
        "e_basic_array.std140.ivec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035088,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_array.std140.ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035089,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_array.std140.ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035090,
        "dEQP-GLES3.functional.ubo.singl",
        "e_basic_array.std140.ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035091,
        "dEQP-GLES3.functional.ubo.singl",
        "e_basic_array.std140.uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035092,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_array.std140.uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035093,
        "dEQP-GLES3.functional.ubo.sing",
        "le_basic_array.std140.uint_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035094,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_array.std140.uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035095,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_array.std140.uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035096,
        "dEQP-GLES3.functional.ubo.singl",
        "e_basic_array.std140.uvec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035097,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_array.std140.uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035098,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_array.std140.uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035099,
        "dEQP-GLES3.functional.ubo.singl",
        "e_basic_array.std140.uvec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035100,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_array.std140.uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035101,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_array.std140.uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035102,
        "dEQP-GLES3.functional.ubo.singl",
        "e_basic_array.std140.uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035103,
        "dEQP-GLES3.functional.ubo.singl",
        "e_basic_array.std140.bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035104,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_array.std140.bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035105,
        "dEQP-GLES3.functional.ubo.sing",
        "le_basic_array.std140.bool_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035106,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_array.std140.bvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035107,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_array.std140.bvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035108,
        "dEQP-GLES3.functional.ubo.singl",
        "e_basic_array.std140.bvec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035109,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_array.std140.bvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035110,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_array.std140.bvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035111,
        "dEQP-GLES3.functional.ubo.singl",
        "e_basic_array.std140.bvec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035112,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_array.std140.bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035113,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_array.std140.bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035114,
        "dEQP-GLES3.functional.ubo.singl",
        "e_basic_array.std140.bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035115,
        "dEQP-GLES3.functional.ubo.singl",
        "e_basic_array.std140.mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035116,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_array.std140.mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035117,
        "dEQP-GLES3.functional.ubo.sing",
        "le_basic_array.std140.mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035118,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_array.std140.row_major_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035119,
        "dEQP-GLES3.functional.ubo.single_basi",
        "c_array.std140.row_major_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035120,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_array.std140.row_major_mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035121,
        "dEQP-GLES3.functional.ubo.single_basic",
        "_array.std140.column_major_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035122,
        "dEQP-GLES3.functional.ubo.single_basic_",
        "array.std140.column_major_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035123,
        "dEQP-GLES3.functional.ubo.single_basi",
        "c_array.std140.column_major_mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035124,
        "dEQP-GLES3.functional.ubo.singl",
        "e_basic_array.std140.mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035125,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_array.std140.mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035126,
        "dEQP-GLES3.functional.ubo.sing",
        "le_basic_array.std140.mat3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035127,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_array.std140.row_major_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035128,
        "dEQP-GLES3.functional.ubo.single_basi",
        "c_array.std140.row_major_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035129,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_array.std140.row_major_mat3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035130,
        "dEQP-GLES3.functional.ubo.single_basic",
        "_array.std140.column_major_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035131,
        "dEQP-GLES3.functional.ubo.single_basic_",
        "array.std140.column_major_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035132,
        "dEQP-GLES3.functional.ubo.single_basi",
        "c_array.std140.column_major_mat3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035133,
        "dEQP-GLES3.functional.ubo.singl",
        "e_basic_array.std140.mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035134,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_array.std140.mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035135,
        "dEQP-GLES3.functional.ubo.sing",
        "le_basic_array.std140.mat4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035136,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_array.std140.row_major_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035137,
        "dEQP-GLES3.functional.ubo.single_basi",
        "c_array.std140.row_major_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035138,
        "dEQP-GLES3.functional.ubo.single_ba",
        "sic_array.std140.row_major_mat4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035139,
        "dEQP-GLES3.functional.ubo.single_basic",
        "_array.std140.column_major_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035140,
        "dEQP-GLES3.functional.ubo.single_basic_",
        "array.std140.column_major_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035141,
        "dEQP-GLES3.functional.ubo.single_basi",
        "c_array.std140.column_major_mat4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035142,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_array.std140.mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035143,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_array.std140.mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035144,
        "dEQP-GLES3.functional.ubo.singl",
        "e_basic_array.std140.mat2x3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035145,
        "dEQP-GLES3.functional.ubo.single_basi",
        "c_array.std140.row_major_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035146,
        "dEQP-GLES3.functional.ubo.single_basic",
        "_array.std140.row_major_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035147,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_array.std140.row_major_mat2x3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035148,
        "dEQP-GLES3.functional.ubo.single_basic_",
        "array.std140.column_major_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035149,
        "dEQP-GLES3.functional.ubo.single_basic_a",
        "rray.std140.column_major_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035150,
        "dEQP-GLES3.functional.ubo.single_basic",
        "_array.std140.column_major_mat2x3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035151,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_array.std140.mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035152,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_array.std140.mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035153,
        "dEQP-GLES3.functional.ubo.singl",
        "e_basic_array.std140.mat2x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035154,
        "dEQP-GLES3.functional.ubo.single_basi",
        "c_array.std140.row_major_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035155,
        "dEQP-GLES3.functional.ubo.single_basic",
        "_array.std140.row_major_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035156,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_array.std140.row_major_mat2x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035157,
        "dEQP-GLES3.functional.ubo.single_basic_",
        "array.std140.column_major_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035158,
        "dEQP-GLES3.functional.ubo.single_basic_a",
        "rray.std140.column_major_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035159,
        "dEQP-GLES3.functional.ubo.single_basic",
        "_array.std140.column_major_mat2x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035160,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_array.std140.mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035161,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_array.std140.mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035162,
        "dEQP-GLES3.functional.ubo.singl",
        "e_basic_array.std140.mat3x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035163,
        "dEQP-GLES3.functional.ubo.single_basi",
        "c_array.std140.row_major_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035164,
        "dEQP-GLES3.functional.ubo.single_basic",
        "_array.std140.row_major_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035165,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_array.std140.row_major_mat3x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035166,
        "dEQP-GLES3.functional.ubo.single_basic_",
        "array.std140.column_major_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035167,
        "dEQP-GLES3.functional.ubo.single_basic_a",
        "rray.std140.column_major_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035168,
        "dEQP-GLES3.functional.ubo.single_basic",
        "_array.std140.column_major_mat3x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035169,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_array.std140.mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035170,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_array.std140.mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035171,
        "dEQP-GLES3.functional.ubo.singl",
        "e_basic_array.std140.mat3x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035172,
        "dEQP-GLES3.functional.ubo.single_basi",
        "c_array.std140.row_major_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035173,
        "dEQP-GLES3.functional.ubo.single_basic",
        "_array.std140.row_major_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035174,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_array.std140.row_major_mat3x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035175,
        "dEQP-GLES3.functional.ubo.single_basic_",
        "array.std140.column_major_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035176,
        "dEQP-GLES3.functional.ubo.single_basic_a",
        "rray.std140.column_major_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035177,
        "dEQP-GLES3.functional.ubo.single_basic",
        "_array.std140.column_major_mat3x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035178,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_array.std140.mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035179,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_array.std140.mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035180,
        "dEQP-GLES3.functional.ubo.singl",
        "e_basic_array.std140.mat4x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035181,
        "dEQP-GLES3.functional.ubo.single_basi",
        "c_array.std140.row_major_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035182,
        "dEQP-GLES3.functional.ubo.single_basic",
        "_array.std140.row_major_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035183,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_array.std140.row_major_mat4x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035184,
        "dEQP-GLES3.functional.ubo.single_basic_",
        "array.std140.column_major_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035185,
        "dEQP-GLES3.functional.ubo.single_basic_a",
        "rray.std140.column_major_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035186,
        "dEQP-GLES3.functional.ubo.single_basic",
        "_array.std140.column_major_mat4x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035187,
        "dEQP-GLES3.functional.ubo.single",
        "_basic_array.std140.mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035188,
        "dEQP-GLES3.functional.ubo.single_",
        "basic_array.std140.mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035189,
        "dEQP-GLES3.functional.ubo.singl",
        "e_basic_array.std140.mat4x3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035190,
        "dEQP-GLES3.functional.ubo.single_basi",
        "c_array.std140.row_major_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035191,
        "dEQP-GLES3.functional.ubo.single_basic",
        "_array.std140.row_major_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035192,
        "dEQP-GLES3.functional.ubo.single_bas",
        "ic_array.std140.row_major_mat4x3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035193,
        "dEQP-GLES3.functional.ubo.single_basic_",
        "array.std140.column_major_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035194,
        "dEQP-GLES3.functional.ubo.single_basic_a",
        "rray.std140.column_major_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035195,
        "dEQP-GLES3.functional.ubo.single_basic",
        "_array.std140.column_major_mat4x3_both");
