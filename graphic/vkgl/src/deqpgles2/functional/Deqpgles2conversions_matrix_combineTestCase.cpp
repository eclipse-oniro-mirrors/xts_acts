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
#include "../Deqpgles2BaseFunc.h"
#include "../ActsDeqpgles20002TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001257,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.matrix_combine.vec2_vec2_to_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001258,
        "dEQP-GLES2.functional.shaders.conversions",
        ".matrix_combine.vec2_vec2_to_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001259,
        "dEQP-GLES2.functional.shaders.conversions",
        ".matrix_combine.bvec2_bvec2_to_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001260,
        "dEQP-GLES2.functional.shaders.conversions.",
        "matrix_combine.bvec2_bvec2_to_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001261,
        "dEQP-GLES2.functional.shaders.conversions.matri",
        "x_combine.float_float_float_float_to_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001262,
        "dEQP-GLES2.functional.shaders.conversions.matrix",
        "_combine.float_float_float_float_to_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001263,
        "dEQP-GLES2.functional.shaders.conversions.m",
        "atrix_combine.int_int_int_int_to_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001264,
        "dEQP-GLES2.functional.shaders.conversions.ma",
        "trix_combine.int_int_int_int_to_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001265,
        "dEQP-GLES2.functional.shaders.conversions.mat",
        "rix_combine.bool_bool_bool_bool_to_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001266,
        "dEQP-GLES2.functional.shaders.conversions.matr",
        "ix_combine.bool_bool_bool_bool_to_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001267,
        "dEQP-GLES2.functional.shaders.conversions.mat",
        "rix_combine.bool_float_int_bool_to_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001268,
        "dEQP-GLES2.functional.shaders.conversions.matr",
        "ix_combine.bool_float_int_bool_to_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001269,
        "dEQP-GLES2.functional.shaders.conversions",
        ".matrix_combine.vec2_ivec2_to_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001270,
        "dEQP-GLES2.functional.shaders.conversions.",
        "matrix_combine.vec2_ivec2_to_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001271,
        "dEQP-GLES2.functional.shaders.conversions",
        ".matrix_combine.vec2_bvec2_to_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001272,
        "dEQP-GLES2.functional.shaders.conversions.",
        "matrix_combine.vec2_bvec2_to_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001273,
        "dEQP-GLES2.functional.shaders.conversions",
        ".matrix_combine.bvec3_float_to_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001274,
        "dEQP-GLES2.functional.shaders.conversions.",
        "matrix_combine.bvec3_float_to_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001275,
        "dEQP-GLES2.functional.shaders.conversions",
        ".matrix_combine.vec3_float_to_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001276,
        "dEQP-GLES2.functional.shaders.conversions.",
        "matrix_combine.vec3_float_to_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001277,
        "dEQP-GLES2.functional.shaders.conversions.",
        "matrix_combine.int_ivec2_int_to_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001278,
        "dEQP-GLES2.functional.shaders.conversions.m",
        "atrix_combine.int_ivec2_int_to_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001279,
        "dEQP-GLES2.functional.shaders.conversions.ma",
        "trix_combine.bool_float_ivec2_to_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001280,
        "dEQP-GLES2.functional.shaders.conversions.mat",
        "rix_combine.bool_float_ivec2_to_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001281,
        "dEQP-GLES2.functional.shaders.conversions.m",
        "atrix_combine.vec3_vec3_vec3_to_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001282,
        "dEQP-GLES2.functional.shaders.conversions.ma",
        "trix_combine.vec3_vec3_vec3_to_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001283,
        "dEQP-GLES2.functional.shaders.conversions.ma",
        "trix_combine.ivec3_ivec3_ivec3_to_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001284,
        "dEQP-GLES2.functional.shaders.conversions.mat",
        "rix_combine.ivec3_ivec3_ivec3_to_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001285,
        "dEQP-GLES2.functional.shaders.conversions.matrix_combi",
        "ne.vec2_ivec2_float_float_int_bool_bool_to_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001286,
        "dEQP-GLES2.functional.shaders.conversions.matrix_combin",
        "e.vec2_ivec2_float_float_int_bool_bool_to_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001287,
        "dEQP-GLES2.functional.shaders.conversions.matrix_combi",
        "ne.bool_float_int_vec2_bool_bvec2_float_to_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001288,
        "dEQP-GLES2.functional.shaders.conversions.matrix_combin",
        "e.bool_float_int_vec2_bool_bvec2_float_to_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001289,
        "dEQP-GLES2.functional.shaders.conversions.matrix",
        "_combine.bool_bvec2_int_vec4_bool_to_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001290,
        "dEQP-GLES2.functional.shaders.conversions.matrix_",
        "combine.bool_bvec2_int_vec4_bool_to_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001291,
        "dEQP-GLES2.functional.shaders.conversions.matrix_",
        "combine.float_bvec4_ivec2_bool_bool_to_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001292,
        "dEQP-GLES2.functional.shaders.conversions.matrix_c",
        "ombine.float_bvec4_ivec2_bool_bool_to_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001293,
        "dEQP-GLES2.functional.shaders.conversions.mat",
        "rix_combine.vec4_vec4_vec4_vec4_to_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001294,
        "dEQP-GLES2.functional.shaders.conversions.matr",
        "ix_combine.vec4_vec4_vec4_vec4_to_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001295,
        "dEQP-GLES2.functional.shaders.conversions.matri",
        "x_combine.ivec4_ivec4_ivec4_ivec4_to_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001296,
        "dEQP-GLES2.functional.shaders.conversions.matrix",
        "_combine.ivec4_ivec4_ivec4_ivec4_to_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001297,
        "dEQP-GLES2.functional.shaders.conversions.matri",
        "x_combine.bvec4_bvec4_bvec4_bvec4_to_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001298,
        "dEQP-GLES2.functional.shaders.conversions.matrix",
        "_combine.bvec4_bvec4_bvec4_bvec4_to_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001299,
        "dEQP-GLES2.functional.shaders.conversions.matrix_combin",
        "e.float_ivec3_bvec3_vec4_ivec2_float_vec2_to_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001300,
        "dEQP-GLES2.functional.shaders.conversions.matrix_combine",
        ".float_ivec3_bvec3_vec4_ivec2_float_vec2_to_mat4_fragment");
