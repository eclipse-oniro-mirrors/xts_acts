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

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001627,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.scalar_to_vector.float_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001628,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.scalar_to_vector.float_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001629,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.scalar_to_vector.float_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001630,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.scalar_to_vector.float_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001631,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.scalar_to_vector.float_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001632,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.scalar_to_vector.float_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001633,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.scalar_to_vector.float_to_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001634,
        "dEQP-GLES3.functional.shaders.conversions",
        ".scalar_to_vector.float_to_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001635,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.scalar_to_vector.float_to_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001636,
        "dEQP-GLES3.functional.shaders.conversions",
        ".scalar_to_vector.float_to_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001637,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.scalar_to_vector.float_to_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001638,
        "dEQP-GLES3.functional.shaders.conversions",
        ".scalar_to_vector.float_to_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001639,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.scalar_to_vector.float_to_bvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001640,
        "dEQP-GLES3.functional.shaders.conversions",
        ".scalar_to_vector.float_to_bvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001641,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.scalar_to_vector.float_to_bvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001642,
        "dEQP-GLES3.functional.shaders.conversions",
        ".scalar_to_vector.float_to_bvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001643,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.scalar_to_vector.float_to_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001644,
        "dEQP-GLES3.functional.shaders.conversions",
        ".scalar_to_vector.float_to_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001645,
        "dEQP-GLES3.functional.shaders.conversi",
        "ons.scalar_to_vector.int_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001646,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.scalar_to_vector.int_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001647,
        "dEQP-GLES3.functional.shaders.conversi",
        "ons.scalar_to_vector.int_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001648,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.scalar_to_vector.int_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001649,
        "dEQP-GLES3.functional.shaders.conversi",
        "ons.scalar_to_vector.int_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001650,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.scalar_to_vector.int_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001651,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.scalar_to_vector.int_to_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001652,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.scalar_to_vector.int_to_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001653,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.scalar_to_vector.int_to_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001654,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.scalar_to_vector.int_to_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001655,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.scalar_to_vector.int_to_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001656,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.scalar_to_vector.int_to_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001657,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.scalar_to_vector.int_to_bvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001658,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.scalar_to_vector.int_to_bvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001659,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.scalar_to_vector.int_to_bvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001660,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.scalar_to_vector.int_to_bvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001661,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.scalar_to_vector.int_to_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001662,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.scalar_to_vector.int_to_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001663,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.scalar_to_vector.uint_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001664,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.scalar_to_vector.uint_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001665,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.scalar_to_vector.uint_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001666,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.scalar_to_vector.uint_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001667,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.scalar_to_vector.uint_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001668,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.scalar_to_vector.uint_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001669,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.scalar_to_vector.uint_to_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001670,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.scalar_to_vector.uint_to_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001671,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.scalar_to_vector.uint_to_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001672,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.scalar_to_vector.uint_to_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001673,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.scalar_to_vector.uint_to_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001674,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.scalar_to_vector.uint_to_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001675,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.scalar_to_vector.uint_to_bvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001676,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.scalar_to_vector.uint_to_bvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001677,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.scalar_to_vector.uint_to_bvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001678,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.scalar_to_vector.uint_to_bvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001679,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.scalar_to_vector.uint_to_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001680,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.scalar_to_vector.uint_to_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001681,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.scalar_to_vector.bool_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001682,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.scalar_to_vector.bool_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001683,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.scalar_to_vector.bool_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001684,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.scalar_to_vector.bool_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001685,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.scalar_to_vector.bool_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001686,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.scalar_to_vector.bool_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001687,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.scalar_to_vector.bool_to_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001688,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.scalar_to_vector.bool_to_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001689,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.scalar_to_vector.bool_to_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001690,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.scalar_to_vector.bool_to_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001691,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.scalar_to_vector.bool_to_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001692,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.scalar_to_vector.bool_to_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001693,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.scalar_to_vector.bool_to_bvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001694,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.scalar_to_vector.bool_to_bvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001695,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.scalar_to_vector.bool_to_bvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001696,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.scalar_to_vector.bool_to_bvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001697,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.scalar_to_vector.bool_to_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001698,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.scalar_to_vector.bool_to_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001699,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.scalar_to_vector.float_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001700,
        "dEQP-GLES3.functional.shaders.conversions",
        ".scalar_to_vector.float_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001701,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.scalar_to_vector.float_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001702,
        "dEQP-GLES3.functional.shaders.conversions",
        ".scalar_to_vector.float_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001703,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.scalar_to_vector.float_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001704,
        "dEQP-GLES3.functional.shaders.conversions",
        ".scalar_to_vector.float_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001705,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.scalar_to_vector.int_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001706,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.scalar_to_vector.int_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001707,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.scalar_to_vector.int_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001708,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.scalar_to_vector.int_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001709,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.scalar_to_vector.int_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001710,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.scalar_to_vector.int_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001711,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.scalar_to_vector.uint_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001712,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.scalar_to_vector.uint_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001713,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.scalar_to_vector.uint_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001714,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.scalar_to_vector.uint_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001715,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.scalar_to_vector.uint_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001716,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.scalar_to_vector.uint_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001717,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.scalar_to_vector.bool_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001718,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.scalar_to_vector.bool_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001719,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.scalar_to_vector.bool_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001720,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.scalar_to_vector.bool_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001721,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.scalar_to_vector.bool_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001722,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.scalar_to_vector.bool_to_uvec4_fragment");
