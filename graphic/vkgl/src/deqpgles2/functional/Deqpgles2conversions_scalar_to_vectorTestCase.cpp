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

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000795,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.scalar_to_vector.float_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000796,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.scalar_to_vector.float_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000797,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.scalar_to_vector.float_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000798,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.scalar_to_vector.float_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000799,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.scalar_to_vector.float_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000800,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.scalar_to_vector.float_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000801,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.scalar_to_vector.float_to_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000802,
        "dEQP-GLES2.functional.shaders.conversions",
        ".scalar_to_vector.float_to_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000803,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.scalar_to_vector.float_to_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000804,
        "dEQP-GLES2.functional.shaders.conversions",
        ".scalar_to_vector.float_to_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000805,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.scalar_to_vector.float_to_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000806,
        "dEQP-GLES2.functional.shaders.conversions",
        ".scalar_to_vector.float_to_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000807,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.scalar_to_vector.float_to_bvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000808,
        "dEQP-GLES2.functional.shaders.conversions",
        ".scalar_to_vector.float_to_bvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000809,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.scalar_to_vector.float_to_bvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000810,
        "dEQP-GLES2.functional.shaders.conversions",
        ".scalar_to_vector.float_to_bvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000811,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.scalar_to_vector.float_to_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000812,
        "dEQP-GLES2.functional.shaders.conversions",
        ".scalar_to_vector.float_to_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000813,
        "dEQP-GLES2.functional.shaders.conversi",
        "ons.scalar_to_vector.int_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000814,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.scalar_to_vector.int_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000815,
        "dEQP-GLES2.functional.shaders.conversi",
        "ons.scalar_to_vector.int_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000816,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.scalar_to_vector.int_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000817,
        "dEQP-GLES2.functional.shaders.conversi",
        "ons.scalar_to_vector.int_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000818,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.scalar_to_vector.int_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000819,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.scalar_to_vector.int_to_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000820,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.scalar_to_vector.int_to_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000821,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.scalar_to_vector.int_to_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000822,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.scalar_to_vector.int_to_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000823,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.scalar_to_vector.int_to_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000824,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.scalar_to_vector.int_to_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000825,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.scalar_to_vector.int_to_bvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000826,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.scalar_to_vector.int_to_bvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000827,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.scalar_to_vector.int_to_bvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000828,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.scalar_to_vector.int_to_bvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000829,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.scalar_to_vector.int_to_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000830,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.scalar_to_vector.int_to_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000831,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.scalar_to_vector.bool_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000832,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.scalar_to_vector.bool_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000833,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.scalar_to_vector.bool_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000834,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.scalar_to_vector.bool_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000835,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.scalar_to_vector.bool_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000836,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.scalar_to_vector.bool_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000837,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.scalar_to_vector.bool_to_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000838,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.scalar_to_vector.bool_to_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000839,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.scalar_to_vector.bool_to_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000840,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.scalar_to_vector.bool_to_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000841,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.scalar_to_vector.bool_to_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000842,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.scalar_to_vector.bool_to_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000843,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.scalar_to_vector.bool_to_bvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000844,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.scalar_to_vector.bool_to_bvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000845,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.scalar_to_vector.bool_to_bvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000846,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.scalar_to_vector.bool_to_bvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000847,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.scalar_to_vector.bool_to_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000848,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.scalar_to_vector.bool_to_bvec4_fragment");
