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

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002341,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_combine.vec2_vec2_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002342,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_combine.vec2_vec2_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002343,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_combine.vec2_vec2_to_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002344,
        "dEQP-GLES3.functional.shaders.conversions.",
        "vector_combine.vec2_vec2_to_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002345,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_combine.vec2_vec2_to_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002346,
        "dEQP-GLES3.functional.shaders.conversions.",
        "vector_combine.vec2_vec2_to_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002347,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_combine.bvec2_bvec2_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002348,
        "dEQP-GLES3.functional.shaders.conversions.",
        "vector_combine.bvec2_bvec2_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002349,
        "dEQP-GLES3.functional.shaders.conversions.",
        "vector_combine.bvec2_bvec2_to_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002350,
        "dEQP-GLES3.functional.shaders.conversions.v",
        "ector_combine.bvec2_bvec2_to_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002351,
        "dEQP-GLES3.functional.shaders.conversions.",
        "vector_combine.bvec2_bvec2_to_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002352,
        "dEQP-GLES3.functional.shaders.conversions.v",
        "ector_combine.bvec2_bvec2_to_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002353,
        "dEQP-GLES3.functional.shaders.conversions.vecto",
        "r_combine.float_float_float_float_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002354,
        "dEQP-GLES3.functional.shaders.conversions.vector",
        "_combine.float_float_float_float_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002355,
        "dEQP-GLES3.functional.shaders.conversions.vector",
        "_combine.float_float_float_float_to_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002356,
        "dEQP-GLES3.functional.shaders.conversions.vector_",
        "combine.float_float_float_float_to_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002357,
        "dEQP-GLES3.functional.shaders.conversions.vector",
        "_combine.float_float_float_float_to_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002358,
        "dEQP-GLES3.functional.shaders.conversions.vector_",
        "combine.float_float_float_float_to_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002359,
        "dEQP-GLES3.functional.shaders.conversions.v",
        "ector_combine.int_int_int_int_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002360,
        "dEQP-GLES3.functional.shaders.conversions.ve",
        "ctor_combine.int_int_int_int_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002361,
        "dEQP-GLES3.functional.shaders.conversions.ve",
        "ctor_combine.int_int_int_int_to_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002362,
        "dEQP-GLES3.functional.shaders.conversions.vec",
        "tor_combine.int_int_int_int_to_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002363,
        "dEQP-GLES3.functional.shaders.conversions.ve",
        "ctor_combine.int_int_int_int_to_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002364,
        "dEQP-GLES3.functional.shaders.conversions.vec",
        "tor_combine.int_int_int_int_to_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002365,
        "dEQP-GLES3.functional.shaders.conversions.vec",
        "tor_combine.uint_uint_uint_uint_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002366,
        "dEQP-GLES3.functional.shaders.conversions.vect",
        "or_combine.uint_uint_uint_uint_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002367,
        "dEQP-GLES3.functional.shaders.conversions.vect",
        "or_combine.uint_uint_uint_uint_to_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002368,
        "dEQP-GLES3.functional.shaders.conversions.vecto",
        "r_combine.uint_uint_uint_uint_to_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002369,
        "dEQP-GLES3.functional.shaders.conversions.vect",
        "or_combine.uint_uint_uint_uint_to_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002370,
        "dEQP-GLES3.functional.shaders.conversions.vecto",
        "r_combine.uint_uint_uint_uint_to_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002371,
        "dEQP-GLES3.functional.shaders.conversions.vec",
        "tor_combine.bool_bool_bool_bool_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002372,
        "dEQP-GLES3.functional.shaders.conversions.vect",
        "or_combine.bool_bool_bool_bool_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002373,
        "dEQP-GLES3.functional.shaders.conversions.vect",
        "or_combine.bool_bool_bool_bool_to_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002374,
        "dEQP-GLES3.functional.shaders.conversions.vecto",
        "r_combine.bool_bool_bool_bool_to_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002375,
        "dEQP-GLES3.functional.shaders.conversions.vect",
        "or_combine.bool_bool_bool_bool_to_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002376,
        "dEQP-GLES3.functional.shaders.conversions.vecto",
        "r_combine.bool_bool_bool_bool_to_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002377,
        "dEQP-GLES3.functional.shaders.conversions.vec",
        "tor_combine.bool_float_int_bool_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002378,
        "dEQP-GLES3.functional.shaders.conversions.vect",
        "or_combine.bool_float_int_bool_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002379,
        "dEQP-GLES3.functional.shaders.conversions.vect",
        "or_combine.bool_float_int_bool_to_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002380,
        "dEQP-GLES3.functional.shaders.conversions.vecto",
        "r_combine.bool_float_int_bool_to_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002381,
        "dEQP-GLES3.functional.shaders.conversions.vect",
        "or_combine.bool_float_int_bool_to_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002382,
        "dEQP-GLES3.functional.shaders.conversions.vecto",
        "r_combine.bool_float_int_bool_to_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002383,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_combine.vec2_ivec2_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002384,
        "dEQP-GLES3.functional.shaders.conversions.",
        "vector_combine.vec2_ivec2_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002385,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_combine.vec2_ivec2_to_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002386,
        "dEQP-GLES3.functional.shaders.conversions.",
        "vector_combine.vec2_ivec2_to_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002387,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_combine.vec2_ivec2_to_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002388,
        "dEQP-GLES3.functional.shaders.conversions.",
        "vector_combine.vec2_ivec2_to_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002389,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_combine.vec2_bvec2_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002390,
        "dEQP-GLES3.functional.shaders.conversions.",
        "vector_combine.vec2_bvec2_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002391,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_combine.vec2_bvec2_to_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002392,
        "dEQP-GLES3.functional.shaders.conversions.",
        "vector_combine.vec2_bvec2_to_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002393,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_combine.vec2_bvec2_to_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002394,
        "dEQP-GLES3.functional.shaders.conversions.",
        "vector_combine.vec2_bvec2_to_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002395,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_combine.bvec3_float_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002396,
        "dEQP-GLES3.functional.shaders.conversions.",
        "vector_combine.bvec3_float_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002397,
        "dEQP-GLES3.functional.shaders.conversions.",
        "vector_combine.bvec3_float_to_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002398,
        "dEQP-GLES3.functional.shaders.conversions.v",
        "ector_combine.bvec3_float_to_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002399,
        "dEQP-GLES3.functional.shaders.conversions.",
        "vector_combine.bvec3_float_to_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002400,
        "dEQP-GLES3.functional.shaders.conversions.v",
        "ector_combine.bvec3_float_to_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002401,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_combine.vec3_float_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002402,
        "dEQP-GLES3.functional.shaders.conversions.",
        "vector_combine.vec3_float_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002403,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_combine.vec3_float_to_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002404,
        "dEQP-GLES3.functional.shaders.conversions.",
        "vector_combine.vec3_float_to_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002405,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_combine.vec3_float_to_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002406,
        "dEQP-GLES3.functional.shaders.conversions.",
        "vector_combine.vec3_float_to_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002407,
        "dEQP-GLES3.functional.shaders.conversions.",
        "vector_combine.int_ivec2_int_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002408,
        "dEQP-GLES3.functional.shaders.conversions.v",
        "ector_combine.int_ivec2_int_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002409,
        "dEQP-GLES3.functional.shaders.conversions.v",
        "ector_combine.int_ivec2_int_to_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002410,
        "dEQP-GLES3.functional.shaders.conversions.ve",
        "ctor_combine.int_ivec2_int_to_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002411,
        "dEQP-GLES3.functional.shaders.conversions.v",
        "ector_combine.int_ivec2_int_to_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002412,
        "dEQP-GLES3.functional.shaders.conversions.ve",
        "ctor_combine.int_ivec2_int_to_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002413,
        "dEQP-GLES3.functional.shaders.conversions.ve",
        "ctor_combine.bool_float_ivec2_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002414,
        "dEQP-GLES3.functional.shaders.conversions.vec",
        "tor_combine.bool_float_ivec2_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002415,
        "dEQP-GLES3.functional.shaders.conversions.ve",
        "ctor_combine.bool_float_ivec2_to_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002416,
        "dEQP-GLES3.functional.shaders.conversions.vec",
        "tor_combine.bool_float_ivec2_to_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002417,
        "dEQP-GLES3.functional.shaders.conversions.ve",
        "ctor_combine.bool_float_ivec2_to_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002418,
        "dEQP-GLES3.functional.shaders.conversions.vec",
        "tor_combine.bool_float_ivec2_to_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002419,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_combine.float_uvec3_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002420,
        "dEQP-GLES3.functional.shaders.conversions.",
        "vector_combine.float_uvec3_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002421,
        "dEQP-GLES3.functional.shaders.conversions.",
        "vector_combine.float_uvec3_to_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002422,
        "dEQP-GLES3.functional.shaders.conversions.v",
        "ector_combine.float_uvec3_to_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002423,
        "dEQP-GLES3.functional.shaders.conversions.",
        "vector_combine.float_uvec3_to_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002424,
        "dEQP-GLES3.functional.shaders.conversions.v",
        "ector_combine.float_uvec3_to_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002425,
        "dEQP-GLES3.functional.shaders.conversions.v",
        "ector_combine.int_uvec2_bool_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002426,
        "dEQP-GLES3.functional.shaders.conversions.ve",
        "ctor_combine.int_uvec2_bool_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002427,
        "dEQP-GLES3.functional.shaders.conversions.v",
        "ector_combine.int_uvec2_bool_to_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002428,
        "dEQP-GLES3.functional.shaders.conversions.ve",
        "ctor_combine.int_uvec2_bool_to_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002429,
        "dEQP-GLES3.functional.shaders.conversions.v",
        "ector_combine.int_uvec2_bool_to_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002430,
        "dEQP-GLES3.functional.shaders.conversions.ve",
        "ctor_combine.int_uvec2_bool_to_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002431,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_combine.vec2_vec2_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002432,
        "dEQP-GLES3.functional.shaders.conversions.",
        "vector_combine.vec2_vec2_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002433,
        "dEQP-GLES3.functional.shaders.conversions.",
        "vector_combine.bvec2_bvec2_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002434,
        "dEQP-GLES3.functional.shaders.conversions.v",
        "ector_combine.bvec2_bvec2_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002435,
        "dEQP-GLES3.functional.shaders.conversions.vector",
        "_combine.float_float_float_float_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002436,
        "dEQP-GLES3.functional.shaders.conversions.vector_",
        "combine.float_float_float_float_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002437,
        "dEQP-GLES3.functional.shaders.conversions.ve",
        "ctor_combine.int_int_int_int_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002438,
        "dEQP-GLES3.functional.shaders.conversions.vec",
        "tor_combine.int_int_int_int_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002439,
        "dEQP-GLES3.functional.shaders.conversions.vect",
        "or_combine.uint_uint_uint_uint_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002440,
        "dEQP-GLES3.functional.shaders.conversions.vecto",
        "r_combine.uint_uint_uint_uint_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002441,
        "dEQP-GLES3.functional.shaders.conversions.vect",
        "or_combine.bool_bool_bool_bool_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002442,
        "dEQP-GLES3.functional.shaders.conversions.vecto",
        "r_combine.bool_bool_bool_bool_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002443,
        "dEQP-GLES3.functional.shaders.conversions.vect",
        "or_combine.bool_float_int_bool_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002444,
        "dEQP-GLES3.functional.shaders.conversions.vecto",
        "r_combine.bool_float_int_bool_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002445,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_combine.vec2_ivec2_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002446,
        "dEQP-GLES3.functional.shaders.conversions.",
        "vector_combine.vec2_ivec2_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002447,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_combine.vec2_bvec2_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002448,
        "dEQP-GLES3.functional.shaders.conversions.",
        "vector_combine.vec2_bvec2_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002449,
        "dEQP-GLES3.functional.shaders.conversions.",
        "vector_combine.bvec3_float_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002450,
        "dEQP-GLES3.functional.shaders.conversions.v",
        "ector_combine.bvec3_float_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002451,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_combine.vec3_float_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002452,
        "dEQP-GLES3.functional.shaders.conversions.",
        "vector_combine.vec3_float_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002453,
        "dEQP-GLES3.functional.shaders.conversions.v",
        "ector_combine.int_ivec2_int_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002454,
        "dEQP-GLES3.functional.shaders.conversions.ve",
        "ctor_combine.int_ivec2_int_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002455,
        "dEQP-GLES3.functional.shaders.conversions.ve",
        "ctor_combine.bool_float_ivec2_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002456,
        "dEQP-GLES3.functional.shaders.conversions.vec",
        "tor_combine.bool_float_ivec2_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002457,
        "dEQP-GLES3.functional.shaders.conversions.",
        "vector_combine.float_uvec3_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002458,
        "dEQP-GLES3.functional.shaders.conversions.v",
        "ector_combine.float_uvec3_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002459,
        "dEQP-GLES3.functional.shaders.conversions.v",
        "ector_combine.int_uvec2_bool_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002460,
        "dEQP-GLES3.functional.shaders.conversions.ve",
        "ctor_combine.int_uvec2_bool_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002461,
        "dEQP-GLES3.functional.shaders.conversions.ve",
        "ctor_combine.float_float_float_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002462,
        "dEQP-GLES3.functional.shaders.conversions.vec",
        "tor_combine.float_float_float_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002463,
        "dEQP-GLES3.functional.shaders.conversions.vec",
        "tor_combine.float_float_float_to_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002464,
        "dEQP-GLES3.functional.shaders.conversions.vect",
        "or_combine.float_float_float_to_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002465,
        "dEQP-GLES3.functional.shaders.conversions.vec",
        "tor_combine.float_float_float_to_bvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002466,
        "dEQP-GLES3.functional.shaders.conversions.vect",
        "or_combine.float_float_float_to_bvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002467,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_combine.int_int_int_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002468,
        "dEQP-GLES3.functional.shaders.conversions.",
        "vector_combine.int_int_int_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002469,
        "dEQP-GLES3.functional.shaders.conversions.",
        "vector_combine.int_int_int_to_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002470,
        "dEQP-GLES3.functional.shaders.conversions.v",
        "ector_combine.int_int_int_to_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002471,
        "dEQP-GLES3.functional.shaders.conversions.",
        "vector_combine.int_int_int_to_bvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002472,
        "dEQP-GLES3.functional.shaders.conversions.v",
        "ector_combine.int_int_int_to_bvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002473,
        "dEQP-GLES3.functional.shaders.conversions.v",
        "ector_combine.uint_uint_uint_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002474,
        "dEQP-GLES3.functional.shaders.conversions.ve",
        "ctor_combine.uint_uint_uint_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002475,
        "dEQP-GLES3.functional.shaders.conversions.v",
        "ector_combine.uint_uint_uint_to_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002476,
        "dEQP-GLES3.functional.shaders.conversions.ve",
        "ctor_combine.uint_uint_uint_to_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002477,
        "dEQP-GLES3.functional.shaders.conversions.v",
        "ector_combine.uint_uint_uint_to_bvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002478,
        "dEQP-GLES3.functional.shaders.conversions.ve",
        "ctor_combine.uint_uint_uint_to_bvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002479,
        "dEQP-GLES3.functional.shaders.conversions.v",
        "ector_combine.bool_bool_bool_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002480,
        "dEQP-GLES3.functional.shaders.conversions.ve",
        "ctor_combine.bool_bool_bool_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002481,
        "dEQP-GLES3.functional.shaders.conversions.v",
        "ector_combine.bool_bool_bool_to_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002482,
        "dEQP-GLES3.functional.shaders.conversions.ve",
        "ctor_combine.bool_bool_bool_to_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002483,
        "dEQP-GLES3.functional.shaders.conversions.v",
        "ector_combine.bool_bool_bool_to_bvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002484,
        "dEQP-GLES3.functional.shaders.conversions.ve",
        "ctor_combine.bool_bool_bool_to_bvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002485,
        "dEQP-GLES3.functional.shaders.conversions.v",
        "ector_combine.bool_float_int_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002486,
        "dEQP-GLES3.functional.shaders.conversions.ve",
        "ctor_combine.bool_float_int_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002487,
        "dEQP-GLES3.functional.shaders.conversions.v",
        "ector_combine.bool_float_int_to_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002488,
        "dEQP-GLES3.functional.shaders.conversions.ve",
        "ctor_combine.bool_float_int_to_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002489,
        "dEQP-GLES3.functional.shaders.conversions.v",
        "ector_combine.bool_float_int_to_bvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002490,
        "dEQP-GLES3.functional.shaders.conversions.ve",
        "ctor_combine.bool_float_int_to_bvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002491,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_combine.vec2_bool_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002492,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_combine.vec2_bool_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002493,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_combine.vec2_bool_to_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002494,
        "dEQP-GLES3.functional.shaders.conversions.",
        "vector_combine.vec2_bool_to_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002495,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_combine.vec2_bool_to_bvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002496,
        "dEQP-GLES3.functional.shaders.conversions.",
        "vector_combine.vec2_bool_to_bvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002497,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_combine.bvec2_float_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002498,
        "dEQP-GLES3.functional.shaders.conversions.",
        "vector_combine.bvec2_float_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002499,
        "dEQP-GLES3.functional.shaders.conversions.",
        "vector_combine.bvec2_float_to_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002500,
        "dEQP-GLES3.functional.shaders.conversions.v",
        "ector_combine.bvec2_float_to_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002501,
        "dEQP-GLES3.functional.shaders.conversions.",
        "vector_combine.bvec2_float_to_bvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002502,
        "dEQP-GLES3.functional.shaders.conversions.v",
        "ector_combine.bvec2_float_to_bvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002503,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_combine.bvec2_int_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002504,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_combine.bvec2_int_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002505,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_combine.bvec2_int_to_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002506,
        "dEQP-GLES3.functional.shaders.conversions.",
        "vector_combine.bvec2_int_to_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002507,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_combine.bvec2_int_to_bvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002508,
        "dEQP-GLES3.functional.shaders.conversions.",
        "vector_combine.bvec2_int_to_bvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002509,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_combine.bool_ivec2_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002510,
        "dEQP-GLES3.functional.shaders.conversions.",
        "vector_combine.bool_ivec2_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002511,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_combine.bool_ivec2_to_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002512,
        "dEQP-GLES3.functional.shaders.conversions.",
        "vector_combine.bool_ivec2_to_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002513,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_combine.bool_ivec2_to_bvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002514,
        "dEQP-GLES3.functional.shaders.conversions.",
        "vector_combine.bool_ivec2_to_bvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002515,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_combine.float_uvec2_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002516,
        "dEQP-GLES3.functional.shaders.conversions.",
        "vector_combine.float_uvec2_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002517,
        "dEQP-GLES3.functional.shaders.conversions.",
        "vector_combine.float_uvec2_to_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002518,
        "dEQP-GLES3.functional.shaders.conversions.v",
        "ector_combine.float_uvec2_to_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002519,
        "dEQP-GLES3.functional.shaders.conversions.",
        "vector_combine.float_uvec2_to_bvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002520,
        "dEQP-GLES3.functional.shaders.conversions.v",
        "ector_combine.float_uvec2_to_bvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002521,
        "dEQP-GLES3.functional.shaders.conversions.vec",
        "tor_combine.float_float_float_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002522,
        "dEQP-GLES3.functional.shaders.conversions.vect",
        "or_combine.float_float_float_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002523,
        "dEQP-GLES3.functional.shaders.conversions.",
        "vector_combine.int_int_int_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002524,
        "dEQP-GLES3.functional.shaders.conversions.v",
        "ector_combine.int_int_int_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002525,
        "dEQP-GLES3.functional.shaders.conversions.v",
        "ector_combine.uint_uint_uint_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002526,
        "dEQP-GLES3.functional.shaders.conversions.ve",
        "ctor_combine.uint_uint_uint_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002527,
        "dEQP-GLES3.functional.shaders.conversions.v",
        "ector_combine.bool_bool_bool_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002528,
        "dEQP-GLES3.functional.shaders.conversions.ve",
        "ctor_combine.bool_bool_bool_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002529,
        "dEQP-GLES3.functional.shaders.conversions.v",
        "ector_combine.bool_float_int_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002530,
        "dEQP-GLES3.functional.shaders.conversions.ve",
        "ctor_combine.bool_float_int_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002531,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_combine.vec2_bool_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002532,
        "dEQP-GLES3.functional.shaders.conversions.",
        "vector_combine.vec2_bool_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002533,
        "dEQP-GLES3.functional.shaders.conversions.",
        "vector_combine.bvec2_float_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002534,
        "dEQP-GLES3.functional.shaders.conversions.v",
        "ector_combine.bvec2_float_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002535,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_combine.bvec2_int_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002536,
        "dEQP-GLES3.functional.shaders.conversions.",
        "vector_combine.bvec2_int_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002537,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_combine.bool_ivec2_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002538,
        "dEQP-GLES3.functional.shaders.conversions.",
        "vector_combine.bool_ivec2_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002539,
        "dEQP-GLES3.functional.shaders.conversions.",
        "vector_combine.float_uvec2_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002540,
        "dEQP-GLES3.functional.shaders.conversions.v",
        "ector_combine.float_uvec2_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002541,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_combine.float_float_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002542,
        "dEQP-GLES3.functional.shaders.conversions.",
        "vector_combine.float_float_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002543,
        "dEQP-GLES3.functional.shaders.conversions.",
        "vector_combine.float_float_to_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002544,
        "dEQP-GLES3.functional.shaders.conversions.v",
        "ector_combine.float_float_to_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002545,
        "dEQP-GLES3.functional.shaders.conversions.",
        "vector_combine.float_float_to_bvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002546,
        "dEQP-GLES3.functional.shaders.conversions.v",
        "ector_combine.float_float_to_bvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002547,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_combine.int_int_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002548,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_combine.int_int_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002549,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_combine.int_int_to_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002550,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_combine.int_int_to_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002551,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_combine.int_int_to_bvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002552,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_combine.int_int_to_bvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002553,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_combine.uint_uint_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002554,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_combine.uint_uint_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002555,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_combine.uint_uint_to_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002556,
        "dEQP-GLES3.functional.shaders.conversions.",
        "vector_combine.uint_uint_to_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002557,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_combine.uint_uint_to_bvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002558,
        "dEQP-GLES3.functional.shaders.conversions.",
        "vector_combine.uint_uint_to_bvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002559,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_combine.bool_bool_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002560,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_combine.bool_bool_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002561,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_combine.bool_bool_to_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002562,
        "dEQP-GLES3.functional.shaders.conversions.",
        "vector_combine.bool_bool_to_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002563,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_combine.bool_bool_to_bvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002564,
        "dEQP-GLES3.functional.shaders.conversions.",
        "vector_combine.bool_bool_to_bvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002565,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_combine.float_int_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002566,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_combine.float_int_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002567,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_combine.float_int_to_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002568,
        "dEQP-GLES3.functional.shaders.conversions.",
        "vector_combine.float_int_to_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002569,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_combine.float_int_to_bvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002570,
        "dEQP-GLES3.functional.shaders.conversions.",
        "vector_combine.float_int_to_bvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002571,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_combine.float_bool_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002572,
        "dEQP-GLES3.functional.shaders.conversions.",
        "vector_combine.float_bool_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002573,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_combine.float_bool_to_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002574,
        "dEQP-GLES3.functional.shaders.conversions.",
        "vector_combine.float_bool_to_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002575,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_combine.float_bool_to_bvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002576,
        "dEQP-GLES3.functional.shaders.conversions.",
        "vector_combine.float_bool_to_bvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002577,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_combine.int_bool_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002578,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_combine.int_bool_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002579,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_combine.int_bool_to_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002580,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_combine.int_bool_to_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002581,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_combine.int_bool_to_bvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002582,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_combine.int_bool_to_bvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002583,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_combine.int_uint_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002584,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_combine.int_uint_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002585,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_combine.int_uint_to_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002586,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_combine.int_uint_to_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002587,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_combine.int_uint_to_bvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002588,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_combine.int_uint_to_bvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002589,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_combine.uint_float_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002590,
        "dEQP-GLES3.functional.shaders.conversions.",
        "vector_combine.uint_float_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002591,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_combine.uint_float_to_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002592,
        "dEQP-GLES3.functional.shaders.conversions.",
        "vector_combine.uint_float_to_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002593,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_combine.uint_float_to_bvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002594,
        "dEQP-GLES3.functional.shaders.conversions.",
        "vector_combine.uint_float_to_bvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002595,
        "dEQP-GLES3.functional.shaders.conversions.",
        "vector_combine.float_float_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002596,
        "dEQP-GLES3.functional.shaders.conversions.v",
        "ector_combine.float_float_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002597,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_combine.int_int_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002598,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_combine.int_int_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002599,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_combine.uint_uint_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002600,
        "dEQP-GLES3.functional.shaders.conversions.",
        "vector_combine.uint_uint_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002601,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_combine.bool_bool_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002602,
        "dEQP-GLES3.functional.shaders.conversions.",
        "vector_combine.bool_bool_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002603,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_combine.float_int_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002604,
        "dEQP-GLES3.functional.shaders.conversions.",
        "vector_combine.float_int_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002605,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_combine.float_bool_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002606,
        "dEQP-GLES3.functional.shaders.conversions.",
        "vector_combine.float_bool_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002607,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_combine.int_bool_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002608,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_combine.int_bool_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002609,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_combine.int_uint_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002610,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_combine.int_uint_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002611,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_combine.uint_float_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30003TestSuite, TestCase_002612,
        "dEQP-GLES3.functional.shaders.conversions.",
        "vector_combine.uint_float_to_uvec2_fragment");
