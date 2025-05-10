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
#include "../ActsDeqpgles20001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000957,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.vector_to_vector.vec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000958,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_to_vector.vec4_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000959,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.vector_to_vector.vec4_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000960,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_to_vector.vec4_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000961,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.vector_to_vector.vec4_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000962,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_to_vector.vec4_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000963,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.vector_to_vector.vec4_to_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000964,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_to_vector.vec4_to_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000965,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.vector_to_vector.vec4_to_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000966,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_to_vector.vec4_to_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000967,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.vector_to_vector.vec4_to_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000968,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_to_vector.vec4_to_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000969,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.vector_to_vector.vec4_to_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000970,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_to_vector.vec4_to_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000971,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.vector_to_vector.vec4_to_bvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000972,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_to_vector.vec4_to_bvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000973,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.vector_to_vector.vec4_to_bvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000974,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_to_vector.vec4_to_bvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000975,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.vector_to_vector.ivec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000976,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_to_vector.ivec4_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000977,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.vector_to_vector.ivec4_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000978,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_to_vector.ivec4_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000979,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.vector_to_vector.ivec4_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000980,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_to_vector.ivec4_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000981,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_to_vector.ivec4_to_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000982,
        "dEQP-GLES2.functional.shaders.conversions",
        ".vector_to_vector.ivec4_to_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000983,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_to_vector.ivec4_to_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000984,
        "dEQP-GLES2.functional.shaders.conversions",
        ".vector_to_vector.ivec4_to_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000985,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_to_vector.ivec4_to_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000986,
        "dEQP-GLES2.functional.shaders.conversions",
        ".vector_to_vector.ivec4_to_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000987,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_to_vector.ivec4_to_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000988,
        "dEQP-GLES2.functional.shaders.conversions",
        ".vector_to_vector.ivec4_to_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000989,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_to_vector.ivec4_to_bvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000990,
        "dEQP-GLES2.functional.shaders.conversions",
        ".vector_to_vector.ivec4_to_bvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000991,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_to_vector.ivec4_to_bvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000992,
        "dEQP-GLES2.functional.shaders.conversions",
        ".vector_to_vector.ivec4_to_bvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000993,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.vector_to_vector.bvec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000994,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_to_vector.bvec4_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000995,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.vector_to_vector.bvec4_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000996,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_to_vector.bvec4_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000997,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.vector_to_vector.bvec4_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000998,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_to_vector.bvec4_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000999,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_to_vector.bvec4_to_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_001000,
        "dEQP-GLES2.functional.shaders.conversions",
        ".vector_to_vector.bvec4_to_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_001001,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_to_vector.bvec4_to_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_001002,
        "dEQP-GLES2.functional.shaders.conversions",
        ".vector_to_vector.bvec4_to_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_001003,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_to_vector.bvec4_to_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_001004,
        "dEQP-GLES2.functional.shaders.conversions",
        ".vector_to_vector.bvec4_to_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_001005,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_to_vector.bvec4_to_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_001006,
        "dEQP-GLES2.functional.shaders.conversions",
        ".vector_to_vector.bvec4_to_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_001007,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_to_vector.bvec4_to_bvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_001008,
        "dEQP-GLES2.functional.shaders.conversions",
        ".vector_to_vector.bvec4_to_bvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_001009,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_to_vector.bvec4_to_bvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_001010,
        "dEQP-GLES2.functional.shaders.conversions",
        ".vector_to_vector.bvec4_to_bvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_001011,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.vector_to_vector.vec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_001012,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_to_vector.vec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_001013,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.vector_to_vector.vec3_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_001014,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_to_vector.vec3_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_001015,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.vector_to_vector.vec3_to_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_001016,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_to_vector.vec3_to_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_001017,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.vector_to_vector.vec3_to_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_001018,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_to_vector.vec3_to_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_001019,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.vector_to_vector.vec3_to_bvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_001020,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_to_vector.vec3_to_bvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_001021,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.vector_to_vector.vec3_to_bvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_001022,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_to_vector.vec3_to_bvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_001023,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.vector_to_vector.ivec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_001024,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_to_vector.ivec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_001025,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.vector_to_vector.ivec3_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_001026,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_to_vector.ivec3_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_001027,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_to_vector.ivec3_to_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_001028,
        "dEQP-GLES2.functional.shaders.conversions",
        ".vector_to_vector.ivec3_to_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_001029,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_to_vector.ivec3_to_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_001030,
        "dEQP-GLES2.functional.shaders.conversions",
        ".vector_to_vector.ivec3_to_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_001031,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_to_vector.ivec3_to_bvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_001032,
        "dEQP-GLES2.functional.shaders.conversions",
        ".vector_to_vector.ivec3_to_bvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_001033,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_to_vector.ivec3_to_bvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_001034,
        "dEQP-GLES2.functional.shaders.conversions",
        ".vector_to_vector.ivec3_to_bvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_001035,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.vector_to_vector.bvec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_001036,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_to_vector.bvec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_001037,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.vector_to_vector.bvec3_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_001038,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_to_vector.bvec3_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_001039,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_to_vector.bvec3_to_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_001040,
        "dEQP-GLES2.functional.shaders.conversions",
        ".vector_to_vector.bvec3_to_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_001041,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_to_vector.bvec3_to_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_001042,
        "dEQP-GLES2.functional.shaders.conversions",
        ".vector_to_vector.bvec3_to_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_001043,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_to_vector.bvec3_to_bvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_001044,
        "dEQP-GLES2.functional.shaders.conversions",
        ".vector_to_vector.bvec3_to_bvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_001045,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_to_vector.bvec3_to_bvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_001046,
        "dEQP-GLES2.functional.shaders.conversions",
        ".vector_to_vector.bvec3_to_bvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_001047,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.vector_to_vector.vec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_001048,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_to_vector.vec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_001049,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.vector_to_vector.vec2_to_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_001050,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_to_vector.vec2_to_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_001051,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.vector_to_vector.vec2_to_bvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_001052,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_to_vector.vec2_to_bvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_001053,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.vector_to_vector.ivec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_001054,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_to_vector.ivec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_001055,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_to_vector.ivec2_to_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_001056,
        "dEQP-GLES2.functional.shaders.conversions",
        ".vector_to_vector.ivec2_to_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_001057,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_to_vector.ivec2_to_bvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_001058,
        "dEQP-GLES2.functional.shaders.conversions",
        ".vector_to_vector.ivec2_to_bvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_001059,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.vector_to_vector.bvec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_001060,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_to_vector.bvec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_001061,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_to_vector.bvec2_to_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_001062,
        "dEQP-GLES2.functional.shaders.conversions",
        ".vector_to_vector.bvec2_to_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_001063,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_to_vector.bvec2_to_bvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_001064,
        "dEQP-GLES2.functional.shaders.conversions",
        ".vector_to_vector.bvec2_to_bvec2_fragment");
