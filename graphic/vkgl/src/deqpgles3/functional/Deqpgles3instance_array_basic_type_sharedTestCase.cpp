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

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035484,
        "dEQP-GLES3.functional.ubo.instance_",
        "array_basic_type.shared.float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035485,
        "dEQP-GLES3.functional.ubo.instance_a",
        "rray_basic_type.shared.float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035486,
        "dEQP-GLES3.functional.ubo.instance",
        "_array_basic_type.shared.float_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035487,
        "dEQP-GLES3.functional.ubo.instance_",
        "array_basic_type.shared.vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035488,
        "dEQP-GLES3.functional.ubo.instance_a",
        "rray_basic_type.shared.vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035489,
        "dEQP-GLES3.functional.ubo.instance",
        "_array_basic_type.shared.vec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035490,
        "dEQP-GLES3.functional.ubo.instance_",
        "array_basic_type.shared.vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035491,
        "dEQP-GLES3.functional.ubo.instance_a",
        "rray_basic_type.shared.vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035492,
        "dEQP-GLES3.functional.ubo.instance",
        "_array_basic_type.shared.vec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035493,
        "dEQP-GLES3.functional.ubo.instance_",
        "array_basic_type.shared.vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035494,
        "dEQP-GLES3.functional.ubo.instance_a",
        "rray_basic_type.shared.vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035495,
        "dEQP-GLES3.functional.ubo.instance",
        "_array_basic_type.shared.vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035496,
        "dEQP-GLES3.functional.ubo.instance",
        "_array_basic_type.shared.int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035497,
        "dEQP-GLES3.functional.ubo.instance_",
        "array_basic_type.shared.int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035498,
        "dEQP-GLES3.functional.ubo.instanc",
        "e_array_basic_type.shared.int_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035499,
        "dEQP-GLES3.functional.ubo.instance_",
        "array_basic_type.shared.ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035500,
        "dEQP-GLES3.functional.ubo.instance_a",
        "rray_basic_type.shared.ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035501,
        "dEQP-GLES3.functional.ubo.instance",
        "_array_basic_type.shared.ivec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035502,
        "dEQP-GLES3.functional.ubo.instance_",
        "array_basic_type.shared.ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035503,
        "dEQP-GLES3.functional.ubo.instance_a",
        "rray_basic_type.shared.ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035504,
        "dEQP-GLES3.functional.ubo.instance",
        "_array_basic_type.shared.ivec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035505,
        "dEQP-GLES3.functional.ubo.instance_",
        "array_basic_type.shared.ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035506,
        "dEQP-GLES3.functional.ubo.instance_a",
        "rray_basic_type.shared.ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035507,
        "dEQP-GLES3.functional.ubo.instance",
        "_array_basic_type.shared.ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035508,
        "dEQP-GLES3.functional.ubo.instance_",
        "array_basic_type.shared.uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035509,
        "dEQP-GLES3.functional.ubo.instance_a",
        "rray_basic_type.shared.uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035510,
        "dEQP-GLES3.functional.ubo.instance",
        "_array_basic_type.shared.uint_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035511,
        "dEQP-GLES3.functional.ubo.instance_",
        "array_basic_type.shared.uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035512,
        "dEQP-GLES3.functional.ubo.instance_a",
        "rray_basic_type.shared.uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035513,
        "dEQP-GLES3.functional.ubo.instance",
        "_array_basic_type.shared.uvec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035514,
        "dEQP-GLES3.functional.ubo.instance_",
        "array_basic_type.shared.uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035515,
        "dEQP-GLES3.functional.ubo.instance_a",
        "rray_basic_type.shared.uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035516,
        "dEQP-GLES3.functional.ubo.instance",
        "_array_basic_type.shared.uvec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035517,
        "dEQP-GLES3.functional.ubo.instance_",
        "array_basic_type.shared.uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035518,
        "dEQP-GLES3.functional.ubo.instance_a",
        "rray_basic_type.shared.uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035519,
        "dEQP-GLES3.functional.ubo.instance",
        "_array_basic_type.shared.uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035520,
        "dEQP-GLES3.functional.ubo.instance_",
        "array_basic_type.shared.bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035521,
        "dEQP-GLES3.functional.ubo.instance_a",
        "rray_basic_type.shared.bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035522,
        "dEQP-GLES3.functional.ubo.instance",
        "_array_basic_type.shared.bool_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035523,
        "dEQP-GLES3.functional.ubo.instance_",
        "array_basic_type.shared.bvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035524,
        "dEQP-GLES3.functional.ubo.instance_a",
        "rray_basic_type.shared.bvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035525,
        "dEQP-GLES3.functional.ubo.instance",
        "_array_basic_type.shared.bvec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035526,
        "dEQP-GLES3.functional.ubo.instance_",
        "array_basic_type.shared.bvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035527,
        "dEQP-GLES3.functional.ubo.instance_a",
        "rray_basic_type.shared.bvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035528,
        "dEQP-GLES3.functional.ubo.instance",
        "_array_basic_type.shared.bvec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035529,
        "dEQP-GLES3.functional.ubo.instance_",
        "array_basic_type.shared.bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035530,
        "dEQP-GLES3.functional.ubo.instance_a",
        "rray_basic_type.shared.bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035531,
        "dEQP-GLES3.functional.ubo.instance",
        "_array_basic_type.shared.bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035532,
        "dEQP-GLES3.functional.ubo.instance_",
        "array_basic_type.shared.mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035533,
        "dEQP-GLES3.functional.ubo.instance_a",
        "rray_basic_type.shared.mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035534,
        "dEQP-GLES3.functional.ubo.instance",
        "_array_basic_type.shared.mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035535,
        "dEQP-GLES3.functional.ubo.instance_array",
        "_basic_type.shared.row_major_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035536,
        "dEQP-GLES3.functional.ubo.instance_array_",
        "basic_type.shared.row_major_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035537,
        "dEQP-GLES3.functional.ubo.instance_arra",
        "y_basic_type.shared.row_major_mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035538,
        "dEQP-GLES3.functional.ubo.instance_array_",
        "basic_type.shared.column_major_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035539,
        "dEQP-GLES3.functional.ubo.instance_array_b",
        "asic_type.shared.column_major_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035540,
        "dEQP-GLES3.functional.ubo.instance_array",
        "_basic_type.shared.column_major_mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035541,
        "dEQP-GLES3.functional.ubo.instance_",
        "array_basic_type.shared.mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035542,
        "dEQP-GLES3.functional.ubo.instance_a",
        "rray_basic_type.shared.mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035543,
        "dEQP-GLES3.functional.ubo.instance",
        "_array_basic_type.shared.mat3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035544,
        "dEQP-GLES3.functional.ubo.instance_array",
        "_basic_type.shared.row_major_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035545,
        "dEQP-GLES3.functional.ubo.instance_array_",
        "basic_type.shared.row_major_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035546,
        "dEQP-GLES3.functional.ubo.instance_arra",
        "y_basic_type.shared.row_major_mat3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035547,
        "dEQP-GLES3.functional.ubo.instance_array_",
        "basic_type.shared.column_major_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035548,
        "dEQP-GLES3.functional.ubo.instance_array_b",
        "asic_type.shared.column_major_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035549,
        "dEQP-GLES3.functional.ubo.instance_array",
        "_basic_type.shared.column_major_mat3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035550,
        "dEQP-GLES3.functional.ubo.instance_",
        "array_basic_type.shared.mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035551,
        "dEQP-GLES3.functional.ubo.instance_a",
        "rray_basic_type.shared.mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035552,
        "dEQP-GLES3.functional.ubo.instance",
        "_array_basic_type.shared.mat4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035553,
        "dEQP-GLES3.functional.ubo.instance_array",
        "_basic_type.shared.row_major_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035554,
        "dEQP-GLES3.functional.ubo.instance_array_",
        "basic_type.shared.row_major_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035555,
        "dEQP-GLES3.functional.ubo.instance_arra",
        "y_basic_type.shared.row_major_mat4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035556,
        "dEQP-GLES3.functional.ubo.instance_array_",
        "basic_type.shared.column_major_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035557,
        "dEQP-GLES3.functional.ubo.instance_array_b",
        "asic_type.shared.column_major_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035558,
        "dEQP-GLES3.functional.ubo.instance_array",
        "_basic_type.shared.column_major_mat4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035559,
        "dEQP-GLES3.functional.ubo.instance_a",
        "rray_basic_type.shared.mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035560,
        "dEQP-GLES3.functional.ubo.instance_ar",
        "ray_basic_type.shared.mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035561,
        "dEQP-GLES3.functional.ubo.instance_",
        "array_basic_type.shared.mat2x3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035562,
        "dEQP-GLES3.functional.ubo.instance_array_",
        "basic_type.shared.row_major_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035563,
        "dEQP-GLES3.functional.ubo.instance_array_b",
        "asic_type.shared.row_major_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035564,
        "dEQP-GLES3.functional.ubo.instance_array",
        "_basic_type.shared.row_major_mat2x3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035565,
        "dEQP-GLES3.functional.ubo.instance_array_b",
        "asic_type.shared.column_major_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035566,
        "dEQP-GLES3.functional.ubo.instance_array_ba",
        "sic_type.shared.column_major_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035567,
        "dEQP-GLES3.functional.ubo.instance_array_",
        "basic_type.shared.column_major_mat2x3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035568,
        "dEQP-GLES3.functional.ubo.instance_a",
        "rray_basic_type.shared.mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035569,
        "dEQP-GLES3.functional.ubo.instance_ar",
        "ray_basic_type.shared.mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035570,
        "dEQP-GLES3.functional.ubo.instance_",
        "array_basic_type.shared.mat2x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035571,
        "dEQP-GLES3.functional.ubo.instance_array_",
        "basic_type.shared.row_major_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035572,
        "dEQP-GLES3.functional.ubo.instance_array_b",
        "asic_type.shared.row_major_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035573,
        "dEQP-GLES3.functional.ubo.instance_array",
        "_basic_type.shared.row_major_mat2x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035574,
        "dEQP-GLES3.functional.ubo.instance_array_b",
        "asic_type.shared.column_major_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035575,
        "dEQP-GLES3.functional.ubo.instance_array_ba",
        "sic_type.shared.column_major_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035576,
        "dEQP-GLES3.functional.ubo.instance_array_",
        "basic_type.shared.column_major_mat2x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035577,
        "dEQP-GLES3.functional.ubo.instance_a",
        "rray_basic_type.shared.mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035578,
        "dEQP-GLES3.functional.ubo.instance_ar",
        "ray_basic_type.shared.mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035579,
        "dEQP-GLES3.functional.ubo.instance_",
        "array_basic_type.shared.mat3x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035580,
        "dEQP-GLES3.functional.ubo.instance_array_",
        "basic_type.shared.row_major_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035581,
        "dEQP-GLES3.functional.ubo.instance_array_b",
        "asic_type.shared.row_major_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035582,
        "dEQP-GLES3.functional.ubo.instance_array",
        "_basic_type.shared.row_major_mat3x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035583,
        "dEQP-GLES3.functional.ubo.instance_array_b",
        "asic_type.shared.column_major_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035584,
        "dEQP-GLES3.functional.ubo.instance_array_ba",
        "sic_type.shared.column_major_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035585,
        "dEQP-GLES3.functional.ubo.instance_array_",
        "basic_type.shared.column_major_mat3x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035586,
        "dEQP-GLES3.functional.ubo.instance_a",
        "rray_basic_type.shared.mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035587,
        "dEQP-GLES3.functional.ubo.instance_ar",
        "ray_basic_type.shared.mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035588,
        "dEQP-GLES3.functional.ubo.instance_",
        "array_basic_type.shared.mat3x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035589,
        "dEQP-GLES3.functional.ubo.instance_array_",
        "basic_type.shared.row_major_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035590,
        "dEQP-GLES3.functional.ubo.instance_array_b",
        "asic_type.shared.row_major_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035591,
        "dEQP-GLES3.functional.ubo.instance_array",
        "_basic_type.shared.row_major_mat3x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035592,
        "dEQP-GLES3.functional.ubo.instance_array_b",
        "asic_type.shared.column_major_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035593,
        "dEQP-GLES3.functional.ubo.instance_array_ba",
        "sic_type.shared.column_major_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035594,
        "dEQP-GLES3.functional.ubo.instance_array_",
        "basic_type.shared.column_major_mat3x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035595,
        "dEQP-GLES3.functional.ubo.instance_a",
        "rray_basic_type.shared.mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035596,
        "dEQP-GLES3.functional.ubo.instance_ar",
        "ray_basic_type.shared.mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035597,
        "dEQP-GLES3.functional.ubo.instance_",
        "array_basic_type.shared.mat4x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035598,
        "dEQP-GLES3.functional.ubo.instance_array_",
        "basic_type.shared.row_major_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035599,
        "dEQP-GLES3.functional.ubo.instance_array_b",
        "asic_type.shared.row_major_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035600,
        "dEQP-GLES3.functional.ubo.instance_array",
        "_basic_type.shared.row_major_mat4x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035601,
        "dEQP-GLES3.functional.ubo.instance_array_b",
        "asic_type.shared.column_major_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035602,
        "dEQP-GLES3.functional.ubo.instance_array_ba",
        "sic_type.shared.column_major_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035603,
        "dEQP-GLES3.functional.ubo.instance_array_",
        "basic_type.shared.column_major_mat4x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035604,
        "dEQP-GLES3.functional.ubo.instance_a",
        "rray_basic_type.shared.mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035605,
        "dEQP-GLES3.functional.ubo.instance_ar",
        "ray_basic_type.shared.mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035606,
        "dEQP-GLES3.functional.ubo.instance_",
        "array_basic_type.shared.mat4x3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035607,
        "dEQP-GLES3.functional.ubo.instance_array_",
        "basic_type.shared.row_major_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035608,
        "dEQP-GLES3.functional.ubo.instance_array_b",
        "asic_type.shared.row_major_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035609,
        "dEQP-GLES3.functional.ubo.instance_array",
        "_basic_type.shared.row_major_mat4x3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035610,
        "dEQP-GLES3.functional.ubo.instance_array_b",
        "asic_type.shared.column_major_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035611,
        "dEQP-GLES3.functional.ubo.instance_array_ba",
        "sic_type.shared.column_major_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035612,
        "dEQP-GLES3.functional.ubo.instance_array_",
        "basic_type.shared.column_major_mat4x3_both");
