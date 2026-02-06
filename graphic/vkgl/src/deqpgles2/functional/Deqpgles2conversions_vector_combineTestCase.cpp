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

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001101,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_combine.vec2_vec2_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001102,
        "dEQP-GLES2.functional.shaders.conversions",
        ".vector_combine.vec2_vec2_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001103,
        "dEQP-GLES2.functional.shaders.conversions",
        ".vector_combine.vec2_vec2_to_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001104,
        "dEQP-GLES2.functional.shaders.conversions.",
        "vector_combine.vec2_vec2_to_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001105,
        "dEQP-GLES2.functional.shaders.conversions",
        ".vector_combine.vec2_vec2_to_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001106,
        "dEQP-GLES2.functional.shaders.conversions.",
        "vector_combine.vec2_vec2_to_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001107,
        "dEQP-GLES2.functional.shaders.conversions",
        ".vector_combine.bvec2_bvec2_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001108,
        "dEQP-GLES2.functional.shaders.conversions.",
        "vector_combine.bvec2_bvec2_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001109,
        "dEQP-GLES2.functional.shaders.conversions.",
        "vector_combine.bvec2_bvec2_to_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001110,
        "dEQP-GLES2.functional.shaders.conversions.v",
        "ector_combine.bvec2_bvec2_to_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001111,
        "dEQP-GLES2.functional.shaders.conversions.",
        "vector_combine.bvec2_bvec2_to_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001112,
        "dEQP-GLES2.functional.shaders.conversions.v",
        "ector_combine.bvec2_bvec2_to_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001113,
        "dEQP-GLES2.functional.shaders.conversions.vecto",
        "r_combine.float_float_float_float_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001114,
        "dEQP-GLES2.functional.shaders.conversions.vector",
        "_combine.float_float_float_float_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001115,
        "dEQP-GLES2.functional.shaders.conversions.vector",
        "_combine.float_float_float_float_to_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001116,
        "dEQP-GLES2.functional.shaders.conversions.vector_",
        "combine.float_float_float_float_to_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001117,
        "dEQP-GLES2.functional.shaders.conversions.vector",
        "_combine.float_float_float_float_to_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001118,
        "dEQP-GLES2.functional.shaders.conversions.vector_",
        "combine.float_float_float_float_to_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001119,
        "dEQP-GLES2.functional.shaders.conversions.v",
        "ector_combine.int_int_int_int_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001120,
        "dEQP-GLES2.functional.shaders.conversions.ve",
        "ctor_combine.int_int_int_int_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001121,
        "dEQP-GLES2.functional.shaders.conversions.ve",
        "ctor_combine.int_int_int_int_to_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001122,
        "dEQP-GLES2.functional.shaders.conversions.vec",
        "tor_combine.int_int_int_int_to_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001123,
        "dEQP-GLES2.functional.shaders.conversions.ve",
        "ctor_combine.int_int_int_int_to_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001124,
        "dEQP-GLES2.functional.shaders.conversions.vec",
        "tor_combine.int_int_int_int_to_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001125,
        "dEQP-GLES2.functional.shaders.conversions.vec",
        "tor_combine.bool_bool_bool_bool_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001126,
        "dEQP-GLES2.functional.shaders.conversions.vect",
        "or_combine.bool_bool_bool_bool_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001127,
        "dEQP-GLES2.functional.shaders.conversions.vect",
        "or_combine.bool_bool_bool_bool_to_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001128,
        "dEQP-GLES2.functional.shaders.conversions.vecto",
        "r_combine.bool_bool_bool_bool_to_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001129,
        "dEQP-GLES2.functional.shaders.conversions.vect",
        "or_combine.bool_bool_bool_bool_to_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001130,
        "dEQP-GLES2.functional.shaders.conversions.vecto",
        "r_combine.bool_bool_bool_bool_to_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001131,
        "dEQP-GLES2.functional.shaders.conversions.vec",
        "tor_combine.bool_float_int_bool_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001132,
        "dEQP-GLES2.functional.shaders.conversions.vect",
        "or_combine.bool_float_int_bool_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001133,
        "dEQP-GLES2.functional.shaders.conversions.vect",
        "or_combine.bool_float_int_bool_to_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001134,
        "dEQP-GLES2.functional.shaders.conversions.vecto",
        "r_combine.bool_float_int_bool_to_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001135,
        "dEQP-GLES2.functional.shaders.conversions.vect",
        "or_combine.bool_float_int_bool_to_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001136,
        "dEQP-GLES2.functional.shaders.conversions.vecto",
        "r_combine.bool_float_int_bool_to_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001137,
        "dEQP-GLES2.functional.shaders.conversions",
        ".vector_combine.vec2_ivec2_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001138,
        "dEQP-GLES2.functional.shaders.conversions.",
        "vector_combine.vec2_ivec2_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001139,
        "dEQP-GLES2.functional.shaders.conversions",
        ".vector_combine.vec2_ivec2_to_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001140,
        "dEQP-GLES2.functional.shaders.conversions.",
        "vector_combine.vec2_ivec2_to_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001141,
        "dEQP-GLES2.functional.shaders.conversions",
        ".vector_combine.vec2_ivec2_to_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001142,
        "dEQP-GLES2.functional.shaders.conversions.",
        "vector_combine.vec2_ivec2_to_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001143,
        "dEQP-GLES2.functional.shaders.conversions",
        ".vector_combine.vec2_bvec2_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001144,
        "dEQP-GLES2.functional.shaders.conversions.",
        "vector_combine.vec2_bvec2_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001145,
        "dEQP-GLES2.functional.shaders.conversions",
        ".vector_combine.vec2_bvec2_to_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001146,
        "dEQP-GLES2.functional.shaders.conversions.",
        "vector_combine.vec2_bvec2_to_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001147,
        "dEQP-GLES2.functional.shaders.conversions",
        ".vector_combine.vec2_bvec2_to_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001148,
        "dEQP-GLES2.functional.shaders.conversions.",
        "vector_combine.vec2_bvec2_to_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001149,
        "dEQP-GLES2.functional.shaders.conversions",
        ".vector_combine.bvec3_float_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001150,
        "dEQP-GLES2.functional.shaders.conversions.",
        "vector_combine.bvec3_float_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001151,
        "dEQP-GLES2.functional.shaders.conversions.",
        "vector_combine.bvec3_float_to_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001152,
        "dEQP-GLES2.functional.shaders.conversions.v",
        "ector_combine.bvec3_float_to_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001153,
        "dEQP-GLES2.functional.shaders.conversions.",
        "vector_combine.bvec3_float_to_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001154,
        "dEQP-GLES2.functional.shaders.conversions.v",
        "ector_combine.bvec3_float_to_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001155,
        "dEQP-GLES2.functional.shaders.conversions",
        ".vector_combine.vec3_float_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001156,
        "dEQP-GLES2.functional.shaders.conversions.",
        "vector_combine.vec3_float_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001157,
        "dEQP-GLES2.functional.shaders.conversions",
        ".vector_combine.vec3_float_to_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001158,
        "dEQP-GLES2.functional.shaders.conversions.",
        "vector_combine.vec3_float_to_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001159,
        "dEQP-GLES2.functional.shaders.conversions",
        ".vector_combine.vec3_float_to_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001160,
        "dEQP-GLES2.functional.shaders.conversions.",
        "vector_combine.vec3_float_to_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001161,
        "dEQP-GLES2.functional.shaders.conversions.",
        "vector_combine.int_ivec2_int_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001162,
        "dEQP-GLES2.functional.shaders.conversions.v",
        "ector_combine.int_ivec2_int_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001163,
        "dEQP-GLES2.functional.shaders.conversions.v",
        "ector_combine.int_ivec2_int_to_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001164,
        "dEQP-GLES2.functional.shaders.conversions.ve",
        "ctor_combine.int_ivec2_int_to_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001165,
        "dEQP-GLES2.functional.shaders.conversions.v",
        "ector_combine.int_ivec2_int_to_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001166,
        "dEQP-GLES2.functional.shaders.conversions.ve",
        "ctor_combine.int_ivec2_int_to_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001167,
        "dEQP-GLES2.functional.shaders.conversions.ve",
        "ctor_combine.bool_float_ivec2_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001168,
        "dEQP-GLES2.functional.shaders.conversions.vec",
        "tor_combine.bool_float_ivec2_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001169,
        "dEQP-GLES2.functional.shaders.conversions.ve",
        "ctor_combine.bool_float_ivec2_to_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001170,
        "dEQP-GLES2.functional.shaders.conversions.vec",
        "tor_combine.bool_float_ivec2_to_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001171,
        "dEQP-GLES2.functional.shaders.conversions.ve",
        "ctor_combine.bool_float_ivec2_to_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001172,
        "dEQP-GLES2.functional.shaders.conversions.vec",
        "tor_combine.bool_float_ivec2_to_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001173,
        "dEQP-GLES2.functional.shaders.conversions.ve",
        "ctor_combine.float_float_float_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001174,
        "dEQP-GLES2.functional.shaders.conversions.vec",
        "tor_combine.float_float_float_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001175,
        "dEQP-GLES2.functional.shaders.conversions.vec",
        "tor_combine.float_float_float_to_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001176,
        "dEQP-GLES2.functional.shaders.conversions.vect",
        "or_combine.float_float_float_to_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001177,
        "dEQP-GLES2.functional.shaders.conversions.vec",
        "tor_combine.float_float_float_to_bvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001178,
        "dEQP-GLES2.functional.shaders.conversions.vect",
        "or_combine.float_float_float_to_bvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001179,
        "dEQP-GLES2.functional.shaders.conversions",
        ".vector_combine.int_int_int_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001180,
        "dEQP-GLES2.functional.shaders.conversions.",
        "vector_combine.int_int_int_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001181,
        "dEQP-GLES2.functional.shaders.conversions.",
        "vector_combine.int_int_int_to_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001182,
        "dEQP-GLES2.functional.shaders.conversions.v",
        "ector_combine.int_int_int_to_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001183,
        "dEQP-GLES2.functional.shaders.conversions.",
        "vector_combine.int_int_int_to_bvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001184,
        "dEQP-GLES2.functional.shaders.conversions.v",
        "ector_combine.int_int_int_to_bvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001185,
        "dEQP-GLES2.functional.shaders.conversions.v",
        "ector_combine.bool_bool_bool_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001186,
        "dEQP-GLES2.functional.shaders.conversions.ve",
        "ctor_combine.bool_bool_bool_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001187,
        "dEQP-GLES2.functional.shaders.conversions.v",
        "ector_combine.bool_bool_bool_to_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001188,
        "dEQP-GLES2.functional.shaders.conversions.ve",
        "ctor_combine.bool_bool_bool_to_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001189,
        "dEQP-GLES2.functional.shaders.conversions.v",
        "ector_combine.bool_bool_bool_to_bvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001190,
        "dEQP-GLES2.functional.shaders.conversions.ve",
        "ctor_combine.bool_bool_bool_to_bvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001191,
        "dEQP-GLES2.functional.shaders.conversions.v",
        "ector_combine.bool_float_int_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001192,
        "dEQP-GLES2.functional.shaders.conversions.ve",
        "ctor_combine.bool_float_int_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001193,
        "dEQP-GLES2.functional.shaders.conversions.v",
        "ector_combine.bool_float_int_to_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001194,
        "dEQP-GLES2.functional.shaders.conversions.ve",
        "ctor_combine.bool_float_int_to_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001195,
        "dEQP-GLES2.functional.shaders.conversions.v",
        "ector_combine.bool_float_int_to_bvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001196,
        "dEQP-GLES2.functional.shaders.conversions.ve",
        "ctor_combine.bool_float_int_to_bvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001197,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_combine.vec2_bool_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001198,
        "dEQP-GLES2.functional.shaders.conversions",
        ".vector_combine.vec2_bool_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001199,
        "dEQP-GLES2.functional.shaders.conversions",
        ".vector_combine.vec2_bool_to_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001200,
        "dEQP-GLES2.functional.shaders.conversions.",
        "vector_combine.vec2_bool_to_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001201,
        "dEQP-GLES2.functional.shaders.conversions",
        ".vector_combine.vec2_bool_to_bvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001202,
        "dEQP-GLES2.functional.shaders.conversions.",
        "vector_combine.vec2_bool_to_bvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001203,
        "dEQP-GLES2.functional.shaders.conversions",
        ".vector_combine.bvec2_float_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001204,
        "dEQP-GLES2.functional.shaders.conversions.",
        "vector_combine.bvec2_float_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001205,
        "dEQP-GLES2.functional.shaders.conversions.",
        "vector_combine.bvec2_float_to_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001206,
        "dEQP-GLES2.functional.shaders.conversions.v",
        "ector_combine.bvec2_float_to_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001207,
        "dEQP-GLES2.functional.shaders.conversions.",
        "vector_combine.bvec2_float_to_bvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001208,
        "dEQP-GLES2.functional.shaders.conversions.v",
        "ector_combine.bvec2_float_to_bvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001209,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_combine.bvec2_int_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001210,
        "dEQP-GLES2.functional.shaders.conversions",
        ".vector_combine.bvec2_int_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001211,
        "dEQP-GLES2.functional.shaders.conversions",
        ".vector_combine.bvec2_int_to_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001212,
        "dEQP-GLES2.functional.shaders.conversions.",
        "vector_combine.bvec2_int_to_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001213,
        "dEQP-GLES2.functional.shaders.conversions",
        ".vector_combine.bvec2_int_to_bvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001214,
        "dEQP-GLES2.functional.shaders.conversions.",
        "vector_combine.bvec2_int_to_bvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001215,
        "dEQP-GLES2.functional.shaders.conversions",
        ".vector_combine.bool_ivec2_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001216,
        "dEQP-GLES2.functional.shaders.conversions.",
        "vector_combine.bool_ivec2_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001217,
        "dEQP-GLES2.functional.shaders.conversions",
        ".vector_combine.bool_ivec2_to_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001218,
        "dEQP-GLES2.functional.shaders.conversions.",
        "vector_combine.bool_ivec2_to_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001219,
        "dEQP-GLES2.functional.shaders.conversions",
        ".vector_combine.bool_ivec2_to_bvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001220,
        "dEQP-GLES2.functional.shaders.conversions.",
        "vector_combine.bool_ivec2_to_bvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001221,
        "dEQP-GLES2.functional.shaders.conversions",
        ".vector_combine.float_float_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001222,
        "dEQP-GLES2.functional.shaders.conversions.",
        "vector_combine.float_float_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001223,
        "dEQP-GLES2.functional.shaders.conversions.",
        "vector_combine.float_float_to_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001224,
        "dEQP-GLES2.functional.shaders.conversions.v",
        "ector_combine.float_float_to_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001225,
        "dEQP-GLES2.functional.shaders.conversions.",
        "vector_combine.float_float_to_bvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001226,
        "dEQP-GLES2.functional.shaders.conversions.v",
        "ector_combine.float_float_to_bvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001227,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.vector_combine.int_int_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001228,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_combine.int_int_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001229,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_combine.int_int_to_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001230,
        "dEQP-GLES2.functional.shaders.conversions",
        ".vector_combine.int_int_to_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001231,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_combine.int_int_to_bvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001232,
        "dEQP-GLES2.functional.shaders.conversions",
        ".vector_combine.int_int_to_bvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001233,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_combine.bool_bool_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001234,
        "dEQP-GLES2.functional.shaders.conversions",
        ".vector_combine.bool_bool_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001235,
        "dEQP-GLES2.functional.shaders.conversions",
        ".vector_combine.bool_bool_to_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001236,
        "dEQP-GLES2.functional.shaders.conversions.",
        "vector_combine.bool_bool_to_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001237,
        "dEQP-GLES2.functional.shaders.conversions",
        ".vector_combine.bool_bool_to_bvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001238,
        "dEQP-GLES2.functional.shaders.conversions.",
        "vector_combine.bool_bool_to_bvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001239,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_combine.float_int_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001240,
        "dEQP-GLES2.functional.shaders.conversions",
        ".vector_combine.float_int_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001241,
        "dEQP-GLES2.functional.shaders.conversions",
        ".vector_combine.float_int_to_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001242,
        "dEQP-GLES2.functional.shaders.conversions.",
        "vector_combine.float_int_to_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001243,
        "dEQP-GLES2.functional.shaders.conversions",
        ".vector_combine.float_int_to_bvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001244,
        "dEQP-GLES2.functional.shaders.conversions.",
        "vector_combine.float_int_to_bvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001245,
        "dEQP-GLES2.functional.shaders.conversions",
        ".vector_combine.float_bool_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001246,
        "dEQP-GLES2.functional.shaders.conversions.",
        "vector_combine.float_bool_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001247,
        "dEQP-GLES2.functional.shaders.conversions",
        ".vector_combine.float_bool_to_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001248,
        "dEQP-GLES2.functional.shaders.conversions.",
        "vector_combine.float_bool_to_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001249,
        "dEQP-GLES2.functional.shaders.conversions",
        ".vector_combine.float_bool_to_bvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001250,
        "dEQP-GLES2.functional.shaders.conversions.",
        "vector_combine.float_bool_to_bvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001251,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_combine.int_bool_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001252,
        "dEQP-GLES2.functional.shaders.conversions",
        ".vector_combine.int_bool_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001253,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_combine.int_bool_to_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001254,
        "dEQP-GLES2.functional.shaders.conversions",
        ".vector_combine.int_bool_to_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001255,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_combine.int_bool_to_bvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20002TestSuite, TestCase_001256,
        "dEQP-GLES2.functional.shaders.conversions",
        ".vector_combine.int_bool_to_bvec2_fragment");
