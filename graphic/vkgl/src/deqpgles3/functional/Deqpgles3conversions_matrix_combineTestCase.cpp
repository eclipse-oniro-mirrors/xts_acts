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
#include "../ActsDeqpgles30003TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002613,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.matrix_combine.vec2_vec2_to_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002614,
        "dEQP-GLES3.functional.shaders.conversions",
        ".matrix_combine.vec2_vec2_to_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002615,
        "dEQP-GLES3.functional.shaders.conversions",
        ".matrix_combine.bvec2_bvec2_to_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002616,
        "dEQP-GLES3.functional.shaders.conversions.",
        "matrix_combine.bvec2_bvec2_to_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002617,
        "dEQP-GLES3.functional.shaders.conversions.matri",
        "x_combine.float_float_float_float_to_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002618,
        "dEQP-GLES3.functional.shaders.conversions.matrix",
        "_combine.float_float_float_float_to_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002619,
        "dEQP-GLES3.functional.shaders.conversions.m",
        "atrix_combine.int_int_int_int_to_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002620,
        "dEQP-GLES3.functional.shaders.conversions.ma",
        "trix_combine.int_int_int_int_to_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002621,
        "dEQP-GLES3.functional.shaders.conversions.mat",
        "rix_combine.uint_uint_uint_uint_to_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002622,
        "dEQP-GLES3.functional.shaders.conversions.matr",
        "ix_combine.uint_uint_uint_uint_to_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002623,
        "dEQP-GLES3.functional.shaders.conversions.mat",
        "rix_combine.bool_bool_bool_bool_to_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002624,
        "dEQP-GLES3.functional.shaders.conversions.matr",
        "ix_combine.bool_bool_bool_bool_to_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002625,
        "dEQP-GLES3.functional.shaders.conversions.mat",
        "rix_combine.bool_float_int_bool_to_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002626,
        "dEQP-GLES3.functional.shaders.conversions.matr",
        "ix_combine.bool_float_int_bool_to_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002627,
        "dEQP-GLES3.functional.shaders.conversions",
        ".matrix_combine.vec2_ivec2_to_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002628,
        "dEQP-GLES3.functional.shaders.conversions.",
        "matrix_combine.vec2_ivec2_to_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002629,
        "dEQP-GLES3.functional.shaders.conversions",
        ".matrix_combine.vec2_bvec2_to_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002630,
        "dEQP-GLES3.functional.shaders.conversions.",
        "matrix_combine.vec2_bvec2_to_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002631,
        "dEQP-GLES3.functional.shaders.conversions",
        ".matrix_combine.bvec3_float_to_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002632,
        "dEQP-GLES3.functional.shaders.conversions.",
        "matrix_combine.bvec3_float_to_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002633,
        "dEQP-GLES3.functional.shaders.conversions",
        ".matrix_combine.vec3_float_to_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002634,
        "dEQP-GLES3.functional.shaders.conversions.",
        "matrix_combine.vec3_float_to_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002635,
        "dEQP-GLES3.functional.shaders.conversions.",
        "matrix_combine.int_ivec2_int_to_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002636,
        "dEQP-GLES3.functional.shaders.conversions.m",
        "atrix_combine.int_ivec2_int_to_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002637,
        "dEQP-GLES3.functional.shaders.conversions.ma",
        "trix_combine.bool_float_ivec2_to_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002638,
        "dEQP-GLES3.functional.shaders.conversions.mat",
        "rix_combine.bool_float_ivec2_to_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002639,
        "dEQP-GLES3.functional.shaders.conversions",
        ".matrix_combine.float_uvec3_to_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002640,
        "dEQP-GLES3.functional.shaders.conversions.",
        "matrix_combine.float_uvec3_to_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002641,
        "dEQP-GLES3.functional.shaders.conversions.m",
        "atrix_combine.int_uvec2_bool_to_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002642,
        "dEQP-GLES3.functional.shaders.conversions.ma",
        "trix_combine.int_uvec2_bool_to_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002643,
        "dEQP-GLES3.functional.shaders.conversions",
        ".matrix_combine.vec3_vec3_to_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002644,
        "dEQP-GLES3.functional.shaders.conversions.",
        "matrix_combine.vec3_vec3_to_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002645,
        "dEQP-GLES3.functional.shaders.conversions.",
        "matrix_combine.bvec3_bvec3_to_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002646,
        "dEQP-GLES3.functional.shaders.conversions.m",
        "atrix_combine.bvec3_bvec3_to_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002647,
        "dEQP-GLES3.functional.shaders.conversions.matrix_combi",
        "ne.float_float_float_float_float_float_to_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002648,
        "dEQP-GLES3.functional.shaders.conversions.matrix_combin",
        "e.float_float_float_float_float_float_to_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002649,
        "dEQP-GLES3.functional.shaders.conversions.matrix",
        "_combine.int_int_int_int_int_int_to_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002650,
        "dEQP-GLES3.functional.shaders.conversions.matrix_",
        "combine.int_int_int_int_int_int_to_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002651,
        "dEQP-GLES3.functional.shaders.conversions.matrix_co",
        "mbine.bool_bool_bool_bool_bool_bool_to_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002652,
        "dEQP-GLES3.functional.shaders.conversions.matrix_com",
        "bine.bool_bool_bool_bool_bool_bool_to_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002653,
        "dEQP-GLES3.functional.shaders.conversions.matrix_co",
        "mbine.bool_float_int_bool_float_int_to_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002654,
        "dEQP-GLES3.functional.shaders.conversions.matrix_com",
        "bine.bool_float_int_bool_float_int_to_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002655,
        "dEQP-GLES3.functional.shaders.conversions.",
        "matrix_combine.vec3_ivec3_to_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002656,
        "dEQP-GLES3.functional.shaders.conversions.m",
        "atrix_combine.vec3_ivec3_to_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002657,
        "dEQP-GLES3.functional.shaders.conversions.",
        "matrix_combine.vec2_bvec4_to_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002658,
        "dEQP-GLES3.functional.shaders.conversions.m",
        "atrix_combine.vec2_bvec4_to_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002659,
        "dEQP-GLES3.functional.shaders.conversions.mat",
        "rix_combine.bvec3_float_ivec2_to_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002660,
        "dEQP-GLES3.functional.shaders.conversions.matr",
        "ix_combine.bvec3_float_ivec2_to_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002661,
        "dEQP-GLES3.functional.shaders.conversions.mat",
        "rix_combine.vec3_float_bvec2_to_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002662,
        "dEQP-GLES3.functional.shaders.conversions.matr",
        "ix_combine.vec3_float_bvec2_to_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002663,
        "dEQP-GLES3.functional.shaders.conversions.ma",
        "trix_combine.vec3_vec3_vec2_to_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002664,
        "dEQP-GLES3.functional.shaders.conversions.mat",
        "rix_combine.vec3_vec3_vec2_to_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002665,
        "dEQP-GLES3.functional.shaders.conversions.mat",
        "rix_combine.ivec3_ivec3_ivec2_to_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002666,
        "dEQP-GLES3.functional.shaders.conversions.matr",
        "ix_combine.ivec3_ivec3_ivec2_to_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002667,
        "dEQP-GLES3.functional.shaders.conversions.matrix_com",
        "bine.vec2_ivec2_float_float_int_bool_to_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002668,
        "dEQP-GLES3.functional.shaders.conversions.matrix_comb",
        "ine.vec2_ivec2_float_float_int_bool_to_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002669,
        "dEQP-GLES3.functional.shaders.conversions.matrix_com",
        "bine.bool_float_int_vec2_bool_bvec2_to_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002670,
        "dEQP-GLES3.functional.shaders.conversions.matrix_comb",
        "ine.bool_float_int_vec2_bool_bvec2_to_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002671,
        "dEQP-GLES3.functional.shaders.conversions.matr",
        "ix_combine.bool_bvec2_int_vec4_to_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002672,
        "dEQP-GLES3.functional.shaders.conversions.matri",
        "x_combine.bool_bvec2_int_vec4_to_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002673,
        "dEQP-GLES3.functional.shaders.conversions.matrix",
        "_combine.float_bvec4_ivec2_bool_to_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002674,
        "dEQP-GLES3.functional.shaders.conversions.matrix_",
        "combine.float_bvec4_ivec2_bool_to_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002675,
        "dEQP-GLES3.functional.shaders.conversions",
        ".matrix_combine.vec3_vec3_to_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002676,
        "dEQP-GLES3.functional.shaders.conversions.",
        "matrix_combine.vec3_vec3_to_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002677,
        "dEQP-GLES3.functional.shaders.conversions.",
        "matrix_combine.bvec3_bvec3_to_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002678,
        "dEQP-GLES3.functional.shaders.conversions.m",
        "atrix_combine.bvec3_bvec3_to_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002679,
        "dEQP-GLES3.functional.shaders.conversions.matrix_combi",
        "ne.float_float_float_float_float_float_to_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002680,
        "dEQP-GLES3.functional.shaders.conversions.matrix_combin",
        "e.float_float_float_float_float_float_to_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002681,
        "dEQP-GLES3.functional.shaders.conversions.matrix",
        "_combine.int_int_int_int_int_int_to_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002682,
        "dEQP-GLES3.functional.shaders.conversions.matrix_",
        "combine.int_int_int_int_int_int_to_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002683,
        "dEQP-GLES3.functional.shaders.conversions.matrix_co",
        "mbine.bool_bool_bool_bool_bool_bool_to_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002684,
        "dEQP-GLES3.functional.shaders.conversions.matrix_com",
        "bine.bool_bool_bool_bool_bool_bool_to_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002685,
        "dEQP-GLES3.functional.shaders.conversions.matrix_co",
        "mbine.bool_float_int_bool_float_int_to_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002686,
        "dEQP-GLES3.functional.shaders.conversions.matrix_com",
        "bine.bool_float_int_bool_float_int_to_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002687,
        "dEQP-GLES3.functional.shaders.conversions.",
        "matrix_combine.vec3_ivec3_to_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002688,
        "dEQP-GLES3.functional.shaders.conversions.m",
        "atrix_combine.vec3_ivec3_to_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002689,
        "dEQP-GLES3.functional.shaders.conversions.",
        "matrix_combine.vec2_bvec4_to_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002690,
        "dEQP-GLES3.functional.shaders.conversions.m",
        "atrix_combine.vec2_bvec4_to_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002691,
        "dEQP-GLES3.functional.shaders.conversions.mat",
        "rix_combine.bvec3_float_ivec2_to_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002692,
        "dEQP-GLES3.functional.shaders.conversions.matr",
        "ix_combine.bvec3_float_ivec2_to_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002693,
        "dEQP-GLES3.functional.shaders.conversions.mat",
        "rix_combine.vec3_float_bvec2_to_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002694,
        "dEQP-GLES3.functional.shaders.conversions.matr",
        "ix_combine.vec3_float_bvec2_to_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002695,
        "dEQP-GLES3.functional.shaders.conversions.m",
        "atrix_combine.vec3_vec3_vec3_to_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002696,
        "dEQP-GLES3.functional.shaders.conversions.ma",
        "trix_combine.vec3_vec3_vec3_to_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002697,
        "dEQP-GLES3.functional.shaders.conversions.ma",
        "trix_combine.ivec3_ivec3_ivec3_to_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002698,
        "dEQP-GLES3.functional.shaders.conversions.mat",
        "rix_combine.ivec3_ivec3_ivec3_to_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002699,
        "dEQP-GLES3.functional.shaders.conversions.matrix_combi",
        "ne.vec2_ivec2_float_float_int_bool_bool_to_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002700,
        "dEQP-GLES3.functional.shaders.conversions.matrix_combin",
        "e.vec2_ivec2_float_float_int_bool_bool_to_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002701,
        "dEQP-GLES3.functional.shaders.conversions.matrix_combi",
        "ne.bool_float_int_vec2_bool_bvec2_float_to_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002702,
        "dEQP-GLES3.functional.shaders.conversions.matrix_combin",
        "e.bool_float_int_vec2_bool_bvec2_float_to_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002703,
        "dEQP-GLES3.functional.shaders.conversions.matrix",
        "_combine.bool_bvec2_int_vec4_bool_to_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002704,
        "dEQP-GLES3.functional.shaders.conversions.matrix_",
        "combine.bool_bvec2_int_vec4_bool_to_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002705,
        "dEQP-GLES3.functional.shaders.conversions.matrix_",
        "combine.float_bvec4_ivec2_bool_bool_to_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002706,
        "dEQP-GLES3.functional.shaders.conversions.matrix_c",
        "ombine.float_bvec4_ivec2_bool_bool_to_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002707,
        "dEQP-GLES3.functional.shaders.conversions.ma",
        "trix_combine.vec4_vec4_vec4_to_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002708,
        "dEQP-GLES3.functional.shaders.conversions.mat",
        "rix_combine.vec4_vec4_vec4_to_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002709,
        "dEQP-GLES3.functional.shaders.conversions.mat",
        "rix_combine.ivec4_ivec4_ivec4_to_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002710,
        "dEQP-GLES3.functional.shaders.conversions.matr",
        "ix_combine.ivec4_ivec4_ivec4_to_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002711,
        "dEQP-GLES3.functional.shaders.conversions.matrix_combine.vec2_",
        "ivec2_float_float_float_int_int_bool_bool_bool_to_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002712,
        "dEQP-GLES3.functional.shaders.conversions.matrix_combine.vec2_i",
        "vec2_float_float_float_int_int_bool_bool_bool_to_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002713,
        "dEQP-GLES3.functional.shaders.conversions.matrix_combine.",
        "bool_float_int_vec3_bool_bvec3_float_bool_to_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002714,
        "dEQP-GLES3.functional.shaders.conversions.matrix_combine.b",
        "ool_float_int_vec3_bool_bvec3_float_bool_to_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002715,
        "dEQP-GLES3.functional.shaders.conversions.matrix_com",
        "bine.bool_bvec4_int_vec4_bool_float_to_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002716,
        "dEQP-GLES3.functional.shaders.conversions.matrix_comb",
        "ine.bool_bvec4_int_vec4_bool_float_to_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002717,
        "dEQP-GLES3.functional.shaders.conversions.matrix_com",
        "bine.float_bvec4_ivec4_bool_bool_int_to_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002718,
        "dEQP-GLES3.functional.shaders.conversions.matrix_comb",
        "ine.float_bvec4_ivec4_bool_bool_int_to_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002719,
        "dEQP-GLES3.functional.shaders.conversions.ma",
        "trix_combine.vec3_vec3_vec2_to_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002720,
        "dEQP-GLES3.functional.shaders.conversions.mat",
        "rix_combine.vec3_vec3_vec2_to_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002721,
        "dEQP-GLES3.functional.shaders.conversions.mat",
        "rix_combine.ivec3_ivec3_ivec2_to_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002722,
        "dEQP-GLES3.functional.shaders.conversions.matr",
        "ix_combine.ivec3_ivec3_ivec2_to_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002723,
        "dEQP-GLES3.functional.shaders.conversions.matrix_com",
        "bine.vec2_ivec2_float_float_int_bool_to_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002724,
        "dEQP-GLES3.functional.shaders.conversions.matrix_comb",
        "ine.vec2_ivec2_float_float_int_bool_to_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002725,
        "dEQP-GLES3.functional.shaders.conversions.matrix_com",
        "bine.bool_float_int_vec2_bool_bvec2_to_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002726,
        "dEQP-GLES3.functional.shaders.conversions.matrix_comb",
        "ine.bool_float_int_vec2_bool_bvec2_to_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002727,
        "dEQP-GLES3.functional.shaders.conversions.matr",
        "ix_combine.bool_bvec2_int_vec4_to_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002728,
        "dEQP-GLES3.functional.shaders.conversions.matri",
        "x_combine.bool_bvec2_int_vec4_to_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002729,
        "dEQP-GLES3.functional.shaders.conversions.matrix",
        "_combine.float_bvec4_ivec2_bool_to_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002730,
        "dEQP-GLES3.functional.shaders.conversions.matrix_",
        "combine.float_bvec4_ivec2_bool_to_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002731,
        "dEQP-GLES3.functional.shaders.conversions.ma",
        "trix_combine.vec4_vec4_vec4_to_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002732,
        "dEQP-GLES3.functional.shaders.conversions.mat",
        "rix_combine.vec4_vec4_vec4_to_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002733,
        "dEQP-GLES3.functional.shaders.conversions.mat",
        "rix_combine.ivec4_ivec4_ivec4_to_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002734,
        "dEQP-GLES3.functional.shaders.conversions.matr",
        "ix_combine.ivec4_ivec4_ivec4_to_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002735,
        "dEQP-GLES3.functional.shaders.conversions.matrix_combine.vec2_",
        "ivec2_float_float_float_int_int_bool_bool_bool_to_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002736,
        "dEQP-GLES3.functional.shaders.conversions.matrix_combine.vec2_i",
        "vec2_float_float_float_int_int_bool_bool_bool_to_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002737,
        "dEQP-GLES3.functional.shaders.conversions.matrix_combine.",
        "bool_float_int_vec3_bool_bvec3_float_bool_to_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002738,
        "dEQP-GLES3.functional.shaders.conversions.matrix_combine.b",
        "ool_float_int_vec3_bool_bvec3_float_bool_to_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002739,
        "dEQP-GLES3.functional.shaders.conversions.matrix_com",
        "bine.bool_bvec4_int_vec4_bool_float_to_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002740,
        "dEQP-GLES3.functional.shaders.conversions.matrix_comb",
        "ine.bool_bvec4_int_vec4_bool_float_to_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002741,
        "dEQP-GLES3.functional.shaders.conversions.matrix_com",
        "bine.float_bvec4_ivec4_bool_bool_int_to_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002742,
        "dEQP-GLES3.functional.shaders.conversions.matrix_comb",
        "ine.float_bvec4_ivec4_bool_bool_int_to_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002743,
        "dEQP-GLES3.functional.shaders.conversions.mat",
        "rix_combine.vec4_vec4_vec4_vec4_to_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002744,
        "dEQP-GLES3.functional.shaders.conversions.matr",
        "ix_combine.vec4_vec4_vec4_vec4_to_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002745,
        "dEQP-GLES3.functional.shaders.conversions.matri",
        "x_combine.ivec4_ivec4_ivec4_ivec4_to_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002746,
        "dEQP-GLES3.functional.shaders.conversions.matrix",
        "_combine.ivec4_ivec4_ivec4_ivec4_to_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002747,
        "dEQP-GLES3.functional.shaders.conversions.matri",
        "x_combine.bvec4_bvec4_bvec4_bvec4_to_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002748,
        "dEQP-GLES3.functional.shaders.conversions.matrix",
        "_combine.bvec4_bvec4_bvec4_bvec4_to_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002749,
        "dEQP-GLES3.functional.shaders.conversions.matrix_combin",
        "e.float_ivec3_bvec3_vec4_ivec2_float_vec2_to_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002750,
        "dEQP-GLES3.functional.shaders.conversions.matrix_combine",
        ".float_ivec3_bvec3_vec4_ivec2_float_vec2_to_mat4_fragment");
