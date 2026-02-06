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

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001819,
        "dEQP-GLES3.functional.shaders.conversi",
        "ons.vector_illegal.vec2_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001820,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_illegal.vec2_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001821,
        "dEQP-GLES3.functional.shaders.conversi",
        "ons.vector_illegal.vec2_to_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001822,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_illegal.vec2_to_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001823,
        "dEQP-GLES3.functional.shaders.conversi",
        "ons.vector_illegal.vec2_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001824,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_illegal.vec2_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001825,
        "dEQP-GLES3.functional.shaders.conversi",
        "ons.vector_illegal.vec2_to_bvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001826,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_illegal.vec2_to_bvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001827,
        "dEQP-GLES3.functional.shaders.conversi",
        "ons.vector_illegal.vec2_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001828,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_illegal.vec2_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001829,
        "dEQP-GLES3.functional.shaders.conversi",
        "ons.vector_illegal.vec2_to_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001830,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_illegal.vec2_to_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001831,
        "dEQP-GLES3.functional.shaders.conversi",
        "ons.vector_illegal.vec2_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001832,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_illegal.vec2_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001833,
        "dEQP-GLES3.functional.shaders.conversi",
        "ons.vector_illegal.vec2_to_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001834,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_illegal.vec2_to_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001835,
        "dEQP-GLES3.functional.shaders.conversi",
        "ons.vector_illegal.ivec2_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001836,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_illegal.ivec2_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001837,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_illegal.ivec2_to_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001838,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_illegal.ivec2_to_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001839,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_illegal.ivec2_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001840,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_illegal.ivec2_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001841,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_illegal.ivec2_to_bvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001842,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_illegal.ivec2_to_bvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001843,
        "dEQP-GLES3.functional.shaders.conversi",
        "ons.vector_illegal.ivec2_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001844,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_illegal.ivec2_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001845,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_illegal.ivec2_to_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001846,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_illegal.ivec2_to_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001847,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_illegal.ivec2_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001848,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_illegal.ivec2_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001849,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_illegal.ivec2_to_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001850,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_illegal.ivec2_to_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001851,
        "dEQP-GLES3.functional.shaders.conversi",
        "ons.vector_illegal.uvec2_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001852,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_illegal.uvec2_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001853,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_illegal.uvec2_to_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001854,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_illegal.uvec2_to_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001855,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_illegal.uvec2_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001856,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_illegal.uvec2_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001857,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_illegal.uvec2_to_bvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001858,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_illegal.uvec2_to_bvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001859,
        "dEQP-GLES3.functional.shaders.conversi",
        "ons.vector_illegal.uvec2_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001860,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_illegal.uvec2_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001861,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_illegal.uvec2_to_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001862,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_illegal.uvec2_to_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001863,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_illegal.uvec2_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001864,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_illegal.uvec2_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001865,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_illegal.uvec2_to_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001866,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_illegal.uvec2_to_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001867,
        "dEQP-GLES3.functional.shaders.conversi",
        "ons.vector_illegal.bvec2_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001868,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_illegal.bvec2_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001869,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_illegal.bvec2_to_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001870,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_illegal.bvec2_to_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001871,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_illegal.bvec2_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001872,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_illegal.bvec2_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001873,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_illegal.bvec2_to_bvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001874,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_illegal.bvec2_to_bvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001875,
        "dEQP-GLES3.functional.shaders.conversi",
        "ons.vector_illegal.bvec2_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001876,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_illegal.bvec2_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001877,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_illegal.bvec2_to_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001878,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_illegal.bvec2_to_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001879,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_illegal.bvec2_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001880,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_illegal.bvec2_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001881,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_illegal.bvec2_to_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001882,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_illegal.bvec2_to_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001883,
        "dEQP-GLES3.functional.shaders.conversi",
        "ons.vector_illegal.vec3_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001884,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_illegal.vec3_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001885,
        "dEQP-GLES3.functional.shaders.conversi",
        "ons.vector_illegal.vec3_to_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001886,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_illegal.vec3_to_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001887,
        "dEQP-GLES3.functional.shaders.conversi",
        "ons.vector_illegal.vec3_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001888,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_illegal.vec3_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001889,
        "dEQP-GLES3.functional.shaders.conversi",
        "ons.vector_illegal.vec3_to_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001890,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_illegal.vec3_to_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001891,
        "dEQP-GLES3.functional.shaders.conversi",
        "ons.vector_illegal.ivec3_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001892,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_illegal.ivec3_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001893,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_illegal.ivec3_to_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001894,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_illegal.ivec3_to_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001895,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_illegal.ivec3_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001896,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_illegal.ivec3_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001897,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_illegal.ivec3_to_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001898,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_illegal.ivec3_to_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001899,
        "dEQP-GLES3.functional.shaders.conversi",
        "ons.vector_illegal.uvec3_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001900,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_illegal.uvec3_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001901,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_illegal.uvec3_to_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001902,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_illegal.uvec3_to_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001903,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_illegal.uvec3_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001904,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_illegal.uvec3_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001905,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_illegal.uvec3_to_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001906,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_illegal.uvec3_to_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001907,
        "dEQP-GLES3.functional.shaders.conversi",
        "ons.vector_illegal.bvec3_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001908,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_illegal.bvec3_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001909,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_illegal.bvec3_to_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001910,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_illegal.bvec3_to_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001911,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_illegal.bvec3_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001912,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_illegal.bvec3_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001913,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.vector_illegal.bvec3_to_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001914,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.vector_illegal.bvec3_to_bvec4_fragment");
