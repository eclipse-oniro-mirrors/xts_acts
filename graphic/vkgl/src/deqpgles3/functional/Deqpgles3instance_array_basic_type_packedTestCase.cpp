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

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035613,
        "dEQP-GLES3.functional.ubo.instance_",
        "array_basic_type.packed.float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035614,
        "dEQP-GLES3.functional.ubo.instance_a",
        "rray_basic_type.packed.float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035615,
        "dEQP-GLES3.functional.ubo.instance_",
        "array_basic_type.packed.vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035616,
        "dEQP-GLES3.functional.ubo.instance_a",
        "rray_basic_type.packed.vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035617,
        "dEQP-GLES3.functional.ubo.instance_",
        "array_basic_type.packed.vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035618,
        "dEQP-GLES3.functional.ubo.instance_a",
        "rray_basic_type.packed.vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035619,
        "dEQP-GLES3.functional.ubo.instance_",
        "array_basic_type.packed.vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035620,
        "dEQP-GLES3.functional.ubo.instance_a",
        "rray_basic_type.packed.vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035621,
        "dEQP-GLES3.functional.ubo.instance",
        "_array_basic_type.packed.int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035622,
        "dEQP-GLES3.functional.ubo.instance_",
        "array_basic_type.packed.int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035623,
        "dEQP-GLES3.functional.ubo.instance_",
        "array_basic_type.packed.ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035624,
        "dEQP-GLES3.functional.ubo.instance_a",
        "rray_basic_type.packed.ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035625,
        "dEQP-GLES3.functional.ubo.instance_",
        "array_basic_type.packed.ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035626,
        "dEQP-GLES3.functional.ubo.instance_a",
        "rray_basic_type.packed.ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035627,
        "dEQP-GLES3.functional.ubo.instance_",
        "array_basic_type.packed.ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035628,
        "dEQP-GLES3.functional.ubo.instance_a",
        "rray_basic_type.packed.ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035629,
        "dEQP-GLES3.functional.ubo.instance_",
        "array_basic_type.packed.uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035630,
        "dEQP-GLES3.functional.ubo.instance_a",
        "rray_basic_type.packed.uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035631,
        "dEQP-GLES3.functional.ubo.instance_",
        "array_basic_type.packed.uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035632,
        "dEQP-GLES3.functional.ubo.instance_a",
        "rray_basic_type.packed.uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035633,
        "dEQP-GLES3.functional.ubo.instance_",
        "array_basic_type.packed.uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035634,
        "dEQP-GLES3.functional.ubo.instance_a",
        "rray_basic_type.packed.uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035635,
        "dEQP-GLES3.functional.ubo.instance_",
        "array_basic_type.packed.uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035636,
        "dEQP-GLES3.functional.ubo.instance_a",
        "rray_basic_type.packed.uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035637,
        "dEQP-GLES3.functional.ubo.instance_",
        "array_basic_type.packed.bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035638,
        "dEQP-GLES3.functional.ubo.instance_a",
        "rray_basic_type.packed.bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035639,
        "dEQP-GLES3.functional.ubo.instance_",
        "array_basic_type.packed.bvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035640,
        "dEQP-GLES3.functional.ubo.instance_a",
        "rray_basic_type.packed.bvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035641,
        "dEQP-GLES3.functional.ubo.instance_",
        "array_basic_type.packed.bvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035642,
        "dEQP-GLES3.functional.ubo.instance_a",
        "rray_basic_type.packed.bvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035643,
        "dEQP-GLES3.functional.ubo.instance_",
        "array_basic_type.packed.bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035644,
        "dEQP-GLES3.functional.ubo.instance_a",
        "rray_basic_type.packed.bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035645,
        "dEQP-GLES3.functional.ubo.instance_",
        "array_basic_type.packed.mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035646,
        "dEQP-GLES3.functional.ubo.instance_a",
        "rray_basic_type.packed.mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035647,
        "dEQP-GLES3.functional.ubo.instance_array",
        "_basic_type.packed.row_major_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035648,
        "dEQP-GLES3.functional.ubo.instance_array_",
        "basic_type.packed.row_major_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035649,
        "dEQP-GLES3.functional.ubo.instance_array_",
        "basic_type.packed.column_major_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035650,
        "dEQP-GLES3.functional.ubo.instance_array_b",
        "asic_type.packed.column_major_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035651,
        "dEQP-GLES3.functional.ubo.instance_",
        "array_basic_type.packed.mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035652,
        "dEQP-GLES3.functional.ubo.instance_a",
        "rray_basic_type.packed.mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035653,
        "dEQP-GLES3.functional.ubo.instance_array",
        "_basic_type.packed.row_major_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035654,
        "dEQP-GLES3.functional.ubo.instance_array_",
        "basic_type.packed.row_major_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035655,
        "dEQP-GLES3.functional.ubo.instance_array_",
        "basic_type.packed.column_major_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035656,
        "dEQP-GLES3.functional.ubo.instance_array_b",
        "asic_type.packed.column_major_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035657,
        "dEQP-GLES3.functional.ubo.instance_",
        "array_basic_type.packed.mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035658,
        "dEQP-GLES3.functional.ubo.instance_a",
        "rray_basic_type.packed.mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035659,
        "dEQP-GLES3.functional.ubo.instance_array",
        "_basic_type.packed.row_major_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035660,
        "dEQP-GLES3.functional.ubo.instance_array_",
        "basic_type.packed.row_major_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035661,
        "dEQP-GLES3.functional.ubo.instance_array_",
        "basic_type.packed.column_major_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035662,
        "dEQP-GLES3.functional.ubo.instance_array_b",
        "asic_type.packed.column_major_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035663,
        "dEQP-GLES3.functional.ubo.instance_a",
        "rray_basic_type.packed.mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035664,
        "dEQP-GLES3.functional.ubo.instance_ar",
        "ray_basic_type.packed.mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035665,
        "dEQP-GLES3.functional.ubo.instance_array_",
        "basic_type.packed.row_major_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035666,
        "dEQP-GLES3.functional.ubo.instance_array_b",
        "asic_type.packed.row_major_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035667,
        "dEQP-GLES3.functional.ubo.instance_array_b",
        "asic_type.packed.column_major_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035668,
        "dEQP-GLES3.functional.ubo.instance_array_ba",
        "sic_type.packed.column_major_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035669,
        "dEQP-GLES3.functional.ubo.instance_a",
        "rray_basic_type.packed.mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035670,
        "dEQP-GLES3.functional.ubo.instance_ar",
        "ray_basic_type.packed.mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035671,
        "dEQP-GLES3.functional.ubo.instance_array_",
        "basic_type.packed.row_major_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035672,
        "dEQP-GLES3.functional.ubo.instance_array_b",
        "asic_type.packed.row_major_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035673,
        "dEQP-GLES3.functional.ubo.instance_array_b",
        "asic_type.packed.column_major_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035674,
        "dEQP-GLES3.functional.ubo.instance_array_ba",
        "sic_type.packed.column_major_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035675,
        "dEQP-GLES3.functional.ubo.instance_a",
        "rray_basic_type.packed.mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035676,
        "dEQP-GLES3.functional.ubo.instance_ar",
        "ray_basic_type.packed.mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035677,
        "dEQP-GLES3.functional.ubo.instance_array_",
        "basic_type.packed.row_major_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035678,
        "dEQP-GLES3.functional.ubo.instance_array_b",
        "asic_type.packed.row_major_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035679,
        "dEQP-GLES3.functional.ubo.instance_array_b",
        "asic_type.packed.column_major_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035680,
        "dEQP-GLES3.functional.ubo.instance_array_ba",
        "sic_type.packed.column_major_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035681,
        "dEQP-GLES3.functional.ubo.instance_a",
        "rray_basic_type.packed.mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035682,
        "dEQP-GLES3.functional.ubo.instance_ar",
        "ray_basic_type.packed.mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035683,
        "dEQP-GLES3.functional.ubo.instance_array_",
        "basic_type.packed.row_major_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035684,
        "dEQP-GLES3.functional.ubo.instance_array_b",
        "asic_type.packed.row_major_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035685,
        "dEQP-GLES3.functional.ubo.instance_array_b",
        "asic_type.packed.column_major_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035686,
        "dEQP-GLES3.functional.ubo.instance_array_ba",
        "sic_type.packed.column_major_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035687,
        "dEQP-GLES3.functional.ubo.instance_a",
        "rray_basic_type.packed.mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035688,
        "dEQP-GLES3.functional.ubo.instance_ar",
        "ray_basic_type.packed.mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035689,
        "dEQP-GLES3.functional.ubo.instance_array_",
        "basic_type.packed.row_major_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035690,
        "dEQP-GLES3.functional.ubo.instance_array_b",
        "asic_type.packed.row_major_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035691,
        "dEQP-GLES3.functional.ubo.instance_array_b",
        "asic_type.packed.column_major_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035692,
        "dEQP-GLES3.functional.ubo.instance_array_ba",
        "sic_type.packed.column_major_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035693,
        "dEQP-GLES3.functional.ubo.instance_a",
        "rray_basic_type.packed.mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035694,
        "dEQP-GLES3.functional.ubo.instance_ar",
        "ray_basic_type.packed.mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035695,
        "dEQP-GLES3.functional.ubo.instance_array_",
        "basic_type.packed.row_major_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035696,
        "dEQP-GLES3.functional.ubo.instance_array_b",
        "asic_type.packed.row_major_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035697,
        "dEQP-GLES3.functional.ubo.instance_array_b",
        "asic_type.packed.column_major_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035698,
        "dEQP-GLES3.functional.ubo.instance_array_ba",
        "sic_type.packed.column_major_mat4x3_fragment");
