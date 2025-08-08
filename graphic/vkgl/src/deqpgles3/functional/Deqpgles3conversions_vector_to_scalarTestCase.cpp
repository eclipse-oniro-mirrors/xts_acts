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
#include "../ActsDeqpgles30002TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001723,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_to_scalar.vec2_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001724,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_scalar.vec2_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001725,
        "dEQP-GLES3.functional.shaders.conversi",
        "ons.vector_to_scalar.vec2_to_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001726,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_to_scalar.vec2_to_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001727,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_to_scalar.vec2_to_bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001728,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_scalar.vec2_to_bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001729,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_to_scalar.vec3_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001730,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_scalar.vec3_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001731,
        "dEQP-GLES3.functional.shaders.conversi",
        "ons.vector_to_scalar.vec3_to_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001732,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_to_scalar.vec3_to_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001733,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_to_scalar.vec3_to_bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001734,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_scalar.vec3_to_bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001735,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_to_scalar.vec4_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001736,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_scalar.vec4_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001737,
        "dEQP-GLES3.functional.shaders.conversi",
        "ons.vector_to_scalar.vec4_to_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001738,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_to_scalar.vec4_to_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001739,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_to_scalar.vec4_to_bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001740,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_scalar.vec4_to_bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001741,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_scalar.ivec2_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001742,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_to_scalar.ivec2_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001743,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_to_scalar.ivec2_to_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001744,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_scalar.ivec2_to_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001745,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_to_scalar.ivec2_to_bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001746,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_scalar.ivec2_to_bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001747,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_scalar.ivec3_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001748,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_to_scalar.ivec3_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001749,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_to_scalar.ivec3_to_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001750,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_scalar.ivec3_to_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001751,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_to_scalar.ivec3_to_bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001752,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_scalar.ivec3_to_bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001753,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_scalar.ivec4_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001754,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_to_scalar.ivec4_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001755,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_to_scalar.ivec4_to_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001756,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_scalar.ivec4_to_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001757,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_to_scalar.ivec4_to_bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001758,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_scalar.ivec4_to_bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001759,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_scalar.uvec2_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001760,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_to_scalar.uvec2_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001761,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_to_scalar.uvec2_to_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001762,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_scalar.uvec2_to_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001763,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_to_scalar.uvec2_to_bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001764,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_scalar.uvec2_to_bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001765,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_scalar.uvec3_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001766,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_to_scalar.uvec3_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001767,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_to_scalar.uvec3_to_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001768,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_scalar.uvec3_to_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001769,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_to_scalar.uvec3_to_bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001770,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_scalar.uvec3_to_bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001771,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_scalar.uvec4_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001772,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_to_scalar.uvec4_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001773,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_to_scalar.uvec4_to_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001774,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_scalar.uvec4_to_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001775,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_to_scalar.uvec4_to_bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001776,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_scalar.uvec4_to_bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001777,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_scalar.bvec2_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001778,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_to_scalar.bvec2_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001779,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_to_scalar.bvec2_to_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001780,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_scalar.bvec2_to_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001781,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_to_scalar.bvec2_to_bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001782,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_scalar.bvec2_to_bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001783,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_scalar.bvec3_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001784,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_to_scalar.bvec3_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001785,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_to_scalar.bvec3_to_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001786,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_scalar.bvec3_to_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001787,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_to_scalar.bvec3_to_bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001788,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_scalar.bvec3_to_bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001789,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_scalar.bvec4_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001790,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_to_scalar.bvec4_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001791,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_to_scalar.bvec4_to_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001792,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_scalar.bvec4_to_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001793,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_to_scalar.bvec4_to_bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001794,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_scalar.bvec4_to_bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001795,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_to_scalar.vec2_to_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001796,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_scalar.vec2_to_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001797,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_to_scalar.vec3_to_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001798,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_scalar.vec3_to_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001799,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_to_scalar.vec4_to_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001800,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_scalar.vec4_to_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001801,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_to_scalar.ivec2_to_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001802,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_scalar.ivec2_to_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001803,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_to_scalar.ivec3_to_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001804,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_scalar.ivec3_to_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001805,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_to_scalar.ivec4_to_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001806,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_scalar.ivec4_to_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001807,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_to_scalar.uvec2_to_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001808,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_scalar.uvec2_to_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001809,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_to_scalar.uvec3_to_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001810,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_scalar.uvec3_to_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001811,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_to_scalar.uvec4_to_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001812,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_scalar.uvec4_to_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001813,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_to_scalar.bvec2_to_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001814,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_scalar.bvec2_to_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001815,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_to_scalar.bvec3_to_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001816,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_scalar.bvec3_to_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001817,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_to_scalar.bvec4_to_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001818,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_scalar.bvec4_to_uint_fragment");
