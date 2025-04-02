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

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001915,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_to_vector.vec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001916,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.vec4_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001917,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_to_vector.vec4_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001918,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.vec4_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001919,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_to_vector.vec4_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001920,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.vec4_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001921,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_to_vector.vec4_to_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001922,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.vec4_to_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001923,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_to_vector.vec4_to_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001924,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.vec4_to_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001925,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_to_vector.vec4_to_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001926,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.vec4_to_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001927,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_to_vector.vec4_to_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001928,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.vec4_to_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001929,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_to_vector.vec4_to_bvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001930,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.vec4_to_bvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001931,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_to_vector.vec4_to_bvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001932,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.vec4_to_bvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001933,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_to_vector.ivec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001934,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.ivec4_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001935,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_to_vector.ivec4_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001936,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.ivec4_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001937,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_to_vector.ivec4_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001938,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.ivec4_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001939,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.ivec4_to_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001940,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_to_vector.ivec4_to_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001941,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.ivec4_to_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001942,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_to_vector.ivec4_to_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001943,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.ivec4_to_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001944,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_to_vector.ivec4_to_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001945,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.ivec4_to_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001946,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_to_vector.ivec4_to_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001947,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.ivec4_to_bvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001948,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_to_vector.ivec4_to_bvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001949,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.ivec4_to_bvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001950,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_to_vector.ivec4_to_bvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001951,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_to_vector.uvec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001952,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.uvec4_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001953,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_to_vector.uvec4_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001954,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.uvec4_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001955,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_to_vector.uvec4_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001956,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.uvec4_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001957,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.uvec4_to_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001958,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_to_vector.uvec4_to_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001959,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.uvec4_to_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001960,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_to_vector.uvec4_to_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001961,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.uvec4_to_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001962,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_to_vector.uvec4_to_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001963,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.uvec4_to_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001964,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_to_vector.uvec4_to_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001965,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.uvec4_to_bvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001966,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_to_vector.uvec4_to_bvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001967,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.uvec4_to_bvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001968,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_to_vector.uvec4_to_bvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001969,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_to_vector.bvec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001970,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.bvec4_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001971,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_to_vector.bvec4_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001972,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.bvec4_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001973,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_to_vector.bvec4_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001974,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.bvec4_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001975,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.bvec4_to_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001976,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_to_vector.bvec4_to_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001977,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.bvec4_to_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001978,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_to_vector.bvec4_to_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001979,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.bvec4_to_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001980,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_to_vector.bvec4_to_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001981,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.bvec4_to_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001982,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_to_vector.bvec4_to_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001983,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.bvec4_to_bvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001984,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_to_vector.bvec4_to_bvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001985,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.bvec4_to_bvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001986,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_to_vector.bvec4_to_bvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001987,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_to_vector.vec4_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001988,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.vec4_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001989,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_to_vector.vec4_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001990,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.vec4_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001991,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_to_vector.vec4_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001992,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.vec4_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001993,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.ivec4_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001994,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_to_vector.ivec4_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001995,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.ivec4_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001996,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_to_vector.ivec4_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001997,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.ivec4_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001998,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_to_vector.ivec4_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001999,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.uvec4_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002000,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_to_vector.uvec4_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002001,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.uvec4_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002002,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_to_vector.uvec4_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002003,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.uvec4_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002004,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_to_vector.uvec4_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002005,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.bvec4_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002006,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_to_vector.bvec4_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002007,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.bvec4_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002008,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_to_vector.bvec4_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002009,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.bvec4_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002010,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_to_vector.bvec4_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002011,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_to_vector.vec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002012,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.vec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002013,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_to_vector.vec3_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002014,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.vec3_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002015,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_to_vector.vec3_to_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002016,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.vec3_to_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002017,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_to_vector.vec3_to_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002018,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.vec3_to_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002019,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_to_vector.vec3_to_bvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002020,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.vec3_to_bvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002021,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_to_vector.vec3_to_bvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002022,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.vec3_to_bvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002023,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_to_vector.ivec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002024,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.ivec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002025,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_to_vector.ivec3_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002026,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.ivec3_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002027,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.ivec3_to_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002028,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_to_vector.ivec3_to_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002029,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.ivec3_to_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002030,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_to_vector.ivec3_to_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002031,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.ivec3_to_bvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002032,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_to_vector.ivec3_to_bvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002033,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.ivec3_to_bvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002034,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_to_vector.ivec3_to_bvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002035,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_to_vector.uvec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002036,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.uvec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002037,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_to_vector.uvec3_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002038,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.uvec3_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002039,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.uvec3_to_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002040,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_to_vector.uvec3_to_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002041,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.uvec3_to_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002042,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_to_vector.uvec3_to_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002043,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.uvec3_to_bvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002044,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_to_vector.uvec3_to_bvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002045,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.uvec3_to_bvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002046,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_to_vector.uvec3_to_bvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002047,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_to_vector.bvec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002048,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.bvec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002049,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_to_vector.bvec3_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002050,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.bvec3_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002051,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.bvec3_to_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002052,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_to_vector.bvec3_to_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002053,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.bvec3_to_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002054,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_to_vector.bvec3_to_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002055,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.bvec3_to_bvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002056,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_to_vector.bvec3_to_bvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002057,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.bvec3_to_bvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002058,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_to_vector.bvec3_to_bvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002059,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_to_vector.vec3_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002060,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.vec3_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002061,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_to_vector.vec3_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002062,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.vec3_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002063,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.ivec3_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002064,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_to_vector.ivec3_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002065,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.ivec3_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002066,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_to_vector.ivec3_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002067,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.uvec3_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002068,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_to_vector.uvec3_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002069,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.uvec3_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002070,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_to_vector.uvec3_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002071,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.bvec3_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002072,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_to_vector.bvec3_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002073,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.bvec3_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002074,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_to_vector.bvec3_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002075,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_to_vector.vec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002076,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.vec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002077,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_to_vector.vec2_to_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002078,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.vec2_to_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002079,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_to_vector.vec2_to_bvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002080,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.vec2_to_bvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002081,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_to_vector.ivec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002082,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.ivec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002083,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.ivec2_to_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002084,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_to_vector.ivec2_to_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002085,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.ivec2_to_bvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002086,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_to_vector.ivec2_to_bvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002087,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_to_vector.uvec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002088,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.uvec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002089,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.uvec2_to_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002090,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_to_vector.uvec2_to_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002091,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.uvec2_to_bvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002092,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_to_vector.uvec2_to_bvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002093,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_to_vector.bvec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002094,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.bvec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002095,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.bvec2_to_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002096,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_to_vector.bvec2_to_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002097,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.bvec2_to_bvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002098,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_to_vector.bvec2_to_bvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002099,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_to_vector.vec2_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002100,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.vec2_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002101,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.ivec2_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002102,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_to_vector.ivec2_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002103,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.uvec2_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002104,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_to_vector.uvec2_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002105,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_to_vector.bvec2_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_002106,
        "dEQP-GLES3.functional.shaders.conversions",
        ".vector_to_vector.bvec2_to_uvec2_fragment");
