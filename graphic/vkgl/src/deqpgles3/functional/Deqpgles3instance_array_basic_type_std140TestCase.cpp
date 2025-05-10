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

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035699,
        "dEQP-GLES3.functional.ubo.instance_",
        "array_basic_type.std140.float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035700,
        "dEQP-GLES3.functional.ubo.instance_a",
        "rray_basic_type.std140.float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035701,
        "dEQP-GLES3.functional.ubo.instance",
        "_array_basic_type.std140.float_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035702,
        "dEQP-GLES3.functional.ubo.instance_",
        "array_basic_type.std140.vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035703,
        "dEQP-GLES3.functional.ubo.instance_a",
        "rray_basic_type.std140.vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035704,
        "dEQP-GLES3.functional.ubo.instance",
        "_array_basic_type.std140.vec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035705,
        "dEQP-GLES3.functional.ubo.instance_",
        "array_basic_type.std140.vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035706,
        "dEQP-GLES3.functional.ubo.instance_a",
        "rray_basic_type.std140.vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035707,
        "dEQP-GLES3.functional.ubo.instance",
        "_array_basic_type.std140.vec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035708,
        "dEQP-GLES3.functional.ubo.instance_",
        "array_basic_type.std140.vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035709,
        "dEQP-GLES3.functional.ubo.instance_a",
        "rray_basic_type.std140.vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035710,
        "dEQP-GLES3.functional.ubo.instance",
        "_array_basic_type.std140.vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035711,
        "dEQP-GLES3.functional.ubo.instance",
        "_array_basic_type.std140.int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035712,
        "dEQP-GLES3.functional.ubo.instance_",
        "array_basic_type.std140.int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035713,
        "dEQP-GLES3.functional.ubo.instanc",
        "e_array_basic_type.std140.int_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035714,
        "dEQP-GLES3.functional.ubo.instance_",
        "array_basic_type.std140.ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035715,
        "dEQP-GLES3.functional.ubo.instance_a",
        "rray_basic_type.std140.ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035716,
        "dEQP-GLES3.functional.ubo.instance",
        "_array_basic_type.std140.ivec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035717,
        "dEQP-GLES3.functional.ubo.instance_",
        "array_basic_type.std140.ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035718,
        "dEQP-GLES3.functional.ubo.instance_a",
        "rray_basic_type.std140.ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035719,
        "dEQP-GLES3.functional.ubo.instance",
        "_array_basic_type.std140.ivec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035720,
        "dEQP-GLES3.functional.ubo.instance_",
        "array_basic_type.std140.ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035721,
        "dEQP-GLES3.functional.ubo.instance_a",
        "rray_basic_type.std140.ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035722,
        "dEQP-GLES3.functional.ubo.instance",
        "_array_basic_type.std140.ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035723,
        "dEQP-GLES3.functional.ubo.instance_",
        "array_basic_type.std140.uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035724,
        "dEQP-GLES3.functional.ubo.instance_a",
        "rray_basic_type.std140.uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035725,
        "dEQP-GLES3.functional.ubo.instance",
        "_array_basic_type.std140.uint_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035726,
        "dEQP-GLES3.functional.ubo.instance_",
        "array_basic_type.std140.uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035727,
        "dEQP-GLES3.functional.ubo.instance_a",
        "rray_basic_type.std140.uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035728,
        "dEQP-GLES3.functional.ubo.instance",
        "_array_basic_type.std140.uvec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035729,
        "dEQP-GLES3.functional.ubo.instance_",
        "array_basic_type.std140.uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035730,
        "dEQP-GLES3.functional.ubo.instance_a",
        "rray_basic_type.std140.uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035731,
        "dEQP-GLES3.functional.ubo.instance",
        "_array_basic_type.std140.uvec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035732,
        "dEQP-GLES3.functional.ubo.instance_",
        "array_basic_type.std140.uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035733,
        "dEQP-GLES3.functional.ubo.instance_a",
        "rray_basic_type.std140.uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035734,
        "dEQP-GLES3.functional.ubo.instance",
        "_array_basic_type.std140.uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035735,
        "dEQP-GLES3.functional.ubo.instance_",
        "array_basic_type.std140.bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035736,
        "dEQP-GLES3.functional.ubo.instance_a",
        "rray_basic_type.std140.bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035737,
        "dEQP-GLES3.functional.ubo.instance",
        "_array_basic_type.std140.bool_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035738,
        "dEQP-GLES3.functional.ubo.instance_",
        "array_basic_type.std140.bvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035739,
        "dEQP-GLES3.functional.ubo.instance_a",
        "rray_basic_type.std140.bvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035740,
        "dEQP-GLES3.functional.ubo.instance",
        "_array_basic_type.std140.bvec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035741,
        "dEQP-GLES3.functional.ubo.instance_",
        "array_basic_type.std140.bvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035742,
        "dEQP-GLES3.functional.ubo.instance_a",
        "rray_basic_type.std140.bvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035743,
        "dEQP-GLES3.functional.ubo.instance",
        "_array_basic_type.std140.bvec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035744,
        "dEQP-GLES3.functional.ubo.instance_",
        "array_basic_type.std140.bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035745,
        "dEQP-GLES3.functional.ubo.instance_a",
        "rray_basic_type.std140.bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035746,
        "dEQP-GLES3.functional.ubo.instance",
        "_array_basic_type.std140.bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035747,
        "dEQP-GLES3.functional.ubo.instance_",
        "array_basic_type.std140.mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035748,
        "dEQP-GLES3.functional.ubo.instance_a",
        "rray_basic_type.std140.mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035749,
        "dEQP-GLES3.functional.ubo.instance",
        "_array_basic_type.std140.mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035750,
        "dEQP-GLES3.functional.ubo.instance_array",
        "_basic_type.std140.row_major_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035751,
        "dEQP-GLES3.functional.ubo.instance_array_",
        "basic_type.std140.row_major_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035752,
        "dEQP-GLES3.functional.ubo.instance_arra",
        "y_basic_type.std140.row_major_mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035753,
        "dEQP-GLES3.functional.ubo.instance_array_",
        "basic_type.std140.column_major_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035754,
        "dEQP-GLES3.functional.ubo.instance_array_b",
        "asic_type.std140.column_major_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035755,
        "dEQP-GLES3.functional.ubo.instance_array",
        "_basic_type.std140.column_major_mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035756,
        "dEQP-GLES3.functional.ubo.instance_",
        "array_basic_type.std140.mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035757,
        "dEQP-GLES3.functional.ubo.instance_a",
        "rray_basic_type.std140.mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035758,
        "dEQP-GLES3.functional.ubo.instance",
        "_array_basic_type.std140.mat3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035759,
        "dEQP-GLES3.functional.ubo.instance_array",
        "_basic_type.std140.row_major_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035760,
        "dEQP-GLES3.functional.ubo.instance_array_",
        "basic_type.std140.row_major_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035761,
        "dEQP-GLES3.functional.ubo.instance_arra",
        "y_basic_type.std140.row_major_mat3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035762,
        "dEQP-GLES3.functional.ubo.instance_array_",
        "basic_type.std140.column_major_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035763,
        "dEQP-GLES3.functional.ubo.instance_array_b",
        "asic_type.std140.column_major_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035764,
        "dEQP-GLES3.functional.ubo.instance_array",
        "_basic_type.std140.column_major_mat3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035765,
        "dEQP-GLES3.functional.ubo.instance_",
        "array_basic_type.std140.mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035766,
        "dEQP-GLES3.functional.ubo.instance_a",
        "rray_basic_type.std140.mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035767,
        "dEQP-GLES3.functional.ubo.instance",
        "_array_basic_type.std140.mat4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035768,
        "dEQP-GLES3.functional.ubo.instance_array",
        "_basic_type.std140.row_major_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035769,
        "dEQP-GLES3.functional.ubo.instance_array_",
        "basic_type.std140.row_major_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035770,
        "dEQP-GLES3.functional.ubo.instance_arra",
        "y_basic_type.std140.row_major_mat4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035771,
        "dEQP-GLES3.functional.ubo.instance_array_",
        "basic_type.std140.column_major_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035772,
        "dEQP-GLES3.functional.ubo.instance_array_b",
        "asic_type.std140.column_major_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035773,
        "dEQP-GLES3.functional.ubo.instance_array",
        "_basic_type.std140.column_major_mat4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035774,
        "dEQP-GLES3.functional.ubo.instance_a",
        "rray_basic_type.std140.mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035775,
        "dEQP-GLES3.functional.ubo.instance_ar",
        "ray_basic_type.std140.mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035776,
        "dEQP-GLES3.functional.ubo.instance_",
        "array_basic_type.std140.mat2x3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035777,
        "dEQP-GLES3.functional.ubo.instance_array_",
        "basic_type.std140.row_major_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035778,
        "dEQP-GLES3.functional.ubo.instance_array_b",
        "asic_type.std140.row_major_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035779,
        "dEQP-GLES3.functional.ubo.instance_array",
        "_basic_type.std140.row_major_mat2x3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035780,
        "dEQP-GLES3.functional.ubo.instance_array_b",
        "asic_type.std140.column_major_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035781,
        "dEQP-GLES3.functional.ubo.instance_array_ba",
        "sic_type.std140.column_major_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035782,
        "dEQP-GLES3.functional.ubo.instance_array_",
        "basic_type.std140.column_major_mat2x3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035783,
        "dEQP-GLES3.functional.ubo.instance_a",
        "rray_basic_type.std140.mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035784,
        "dEQP-GLES3.functional.ubo.instance_ar",
        "ray_basic_type.std140.mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035785,
        "dEQP-GLES3.functional.ubo.instance_",
        "array_basic_type.std140.mat2x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035786,
        "dEQP-GLES3.functional.ubo.instance_array_",
        "basic_type.std140.row_major_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035787,
        "dEQP-GLES3.functional.ubo.instance_array_b",
        "asic_type.std140.row_major_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035788,
        "dEQP-GLES3.functional.ubo.instance_array",
        "_basic_type.std140.row_major_mat2x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035789,
        "dEQP-GLES3.functional.ubo.instance_array_b",
        "asic_type.std140.column_major_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035790,
        "dEQP-GLES3.functional.ubo.instance_array_ba",
        "sic_type.std140.column_major_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035791,
        "dEQP-GLES3.functional.ubo.instance_array_",
        "basic_type.std140.column_major_mat2x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035792,
        "dEQP-GLES3.functional.ubo.instance_a",
        "rray_basic_type.std140.mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035793,
        "dEQP-GLES3.functional.ubo.instance_ar",
        "ray_basic_type.std140.mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035794,
        "dEQP-GLES3.functional.ubo.instance_",
        "array_basic_type.std140.mat3x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035795,
        "dEQP-GLES3.functional.ubo.instance_array_",
        "basic_type.std140.row_major_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035796,
        "dEQP-GLES3.functional.ubo.instance_array_b",
        "asic_type.std140.row_major_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035797,
        "dEQP-GLES3.functional.ubo.instance_array",
        "_basic_type.std140.row_major_mat3x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035798,
        "dEQP-GLES3.functional.ubo.instance_array_b",
        "asic_type.std140.column_major_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035799,
        "dEQP-GLES3.functional.ubo.instance_array_ba",
        "sic_type.std140.column_major_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035800,
        "dEQP-GLES3.functional.ubo.instance_array_",
        "basic_type.std140.column_major_mat3x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035801,
        "dEQP-GLES3.functional.ubo.instance_a",
        "rray_basic_type.std140.mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035802,
        "dEQP-GLES3.functional.ubo.instance_ar",
        "ray_basic_type.std140.mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035803,
        "dEQP-GLES3.functional.ubo.instance_",
        "array_basic_type.std140.mat3x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035804,
        "dEQP-GLES3.functional.ubo.instance_array_",
        "basic_type.std140.row_major_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035805,
        "dEQP-GLES3.functional.ubo.instance_array_b",
        "asic_type.std140.row_major_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035806,
        "dEQP-GLES3.functional.ubo.instance_array",
        "_basic_type.std140.row_major_mat3x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035807,
        "dEQP-GLES3.functional.ubo.instance_array_b",
        "asic_type.std140.column_major_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035808,
        "dEQP-GLES3.functional.ubo.instance_array_ba",
        "sic_type.std140.column_major_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035809,
        "dEQP-GLES3.functional.ubo.instance_array_",
        "basic_type.std140.column_major_mat3x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035810,
        "dEQP-GLES3.functional.ubo.instance_a",
        "rray_basic_type.std140.mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035811,
        "dEQP-GLES3.functional.ubo.instance_ar",
        "ray_basic_type.std140.mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035812,
        "dEQP-GLES3.functional.ubo.instance_",
        "array_basic_type.std140.mat4x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035813,
        "dEQP-GLES3.functional.ubo.instance_array_",
        "basic_type.std140.row_major_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035814,
        "dEQP-GLES3.functional.ubo.instance_array_b",
        "asic_type.std140.row_major_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035815,
        "dEQP-GLES3.functional.ubo.instance_array",
        "_basic_type.std140.row_major_mat4x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035816,
        "dEQP-GLES3.functional.ubo.instance_array_b",
        "asic_type.std140.column_major_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035817,
        "dEQP-GLES3.functional.ubo.instance_array_ba",
        "sic_type.std140.column_major_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035818,
        "dEQP-GLES3.functional.ubo.instance_array_",
        "basic_type.std140.column_major_mat4x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035819,
        "dEQP-GLES3.functional.ubo.instance_a",
        "rray_basic_type.std140.mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035820,
        "dEQP-GLES3.functional.ubo.instance_ar",
        "ray_basic_type.std140.mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035821,
        "dEQP-GLES3.functional.ubo.instance_",
        "array_basic_type.std140.mat4x3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035822,
        "dEQP-GLES3.functional.ubo.instance_array_",
        "basic_type.std140.row_major_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035823,
        "dEQP-GLES3.functional.ubo.instance_array_b",
        "asic_type.std140.row_major_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035824,
        "dEQP-GLES3.functional.ubo.instance_array",
        "_basic_type.std140.row_major_mat4x3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035825,
        "dEQP-GLES3.functional.ubo.instance_array_b",
        "asic_type.std140.column_major_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035826,
        "dEQP-GLES3.functional.ubo.instance_array_ba",
        "sic_type.std140.column_major_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30036TestSuite, TestCase_035827,
        "dEQP-GLES3.functional.ubo.instance_array_",
        "basic_type.std140.column_major_mat4x3_both");
