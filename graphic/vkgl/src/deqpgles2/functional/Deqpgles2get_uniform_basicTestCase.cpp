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
#include "../ActsDeqpgles20015TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014149,
        "dEQP-GLES2.functional.uniform_api.value",
        ".initial.get_uniform.basic.float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014150,
        "dEQP-GLES2.functional.uniform_api.value.",
        "initial.get_uniform.basic.float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014151,
        "dEQP-GLES2.functional.uniform_api.valu",
        "e.initial.get_uniform.basic.float_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014152,
        "dEQP-GLES2.functional.uniform_api.valu",
        "e.initial.get_uniform.basic.vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014153,
        "dEQP-GLES2.functional.uniform_api.value",
        ".initial.get_uniform.basic.vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014154,
        "dEQP-GLES2.functional.uniform_api.val",
        "ue.initial.get_uniform.basic.vec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014155,
        "dEQP-GLES2.functional.uniform_api.valu",
        "e.initial.get_uniform.basic.vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014156,
        "dEQP-GLES2.functional.uniform_api.value",
        ".initial.get_uniform.basic.vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014157,
        "dEQP-GLES2.functional.uniform_api.val",
        "ue.initial.get_uniform.basic.vec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014158,
        "dEQP-GLES2.functional.uniform_api.valu",
        "e.initial.get_uniform.basic.vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014159,
        "dEQP-GLES2.functional.uniform_api.value",
        ".initial.get_uniform.basic.vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014160,
        "dEQP-GLES2.functional.uniform_api.val",
        "ue.initial.get_uniform.basic.vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014161,
        "dEQP-GLES2.functional.uniform_api.valu",
        "e.initial.get_uniform.basic.mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014162,
        "dEQP-GLES2.functional.uniform_api.value",
        ".initial.get_uniform.basic.mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014163,
        "dEQP-GLES2.functional.uniform_api.val",
        "ue.initial.get_uniform.basic.mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014164,
        "dEQP-GLES2.functional.uniform_api.valu",
        "e.initial.get_uniform.basic.mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014165,
        "dEQP-GLES2.functional.uniform_api.value",
        ".initial.get_uniform.basic.mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014166,
        "dEQP-GLES2.functional.uniform_api.val",
        "ue.initial.get_uniform.basic.mat3_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014167,
        "dEQP-GLES2.functional.uniform_api.valu",
        "e.initial.get_uniform.basic.mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014168,
        "dEQP-GLES2.functional.uniform_api.value",
        ".initial.get_uniform.basic.mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014169,
        "dEQP-GLES2.functional.uniform_api.val",
        "ue.initial.get_uniform.basic.mat4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014170,
        "dEQP-GLES2.functional.uniform_api.valu",
        "e.initial.get_uniform.basic.int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014171,
        "dEQP-GLES2.functional.uniform_api.value",
        ".initial.get_uniform.basic.int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014172,
        "dEQP-GLES2.functional.uniform_api.val",
        "ue.initial.get_uniform.basic.int_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014173,
        "dEQP-GLES2.functional.uniform_api.value",
        ".initial.get_uniform.basic.ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014174,
        "dEQP-GLES2.functional.uniform_api.value.",
        "initial.get_uniform.basic.ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014175,
        "dEQP-GLES2.functional.uniform_api.valu",
        "e.initial.get_uniform.basic.ivec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014176,
        "dEQP-GLES2.functional.uniform_api.value",
        ".initial.get_uniform.basic.ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014177,
        "dEQP-GLES2.functional.uniform_api.value.",
        "initial.get_uniform.basic.ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014178,
        "dEQP-GLES2.functional.uniform_api.valu",
        "e.initial.get_uniform.basic.ivec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014179,
        "dEQP-GLES2.functional.uniform_api.value",
        ".initial.get_uniform.basic.ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014180,
        "dEQP-GLES2.functional.uniform_api.value.",
        "initial.get_uniform.basic.ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014181,
        "dEQP-GLES2.functional.uniform_api.valu",
        "e.initial.get_uniform.basic.ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014182,
        "dEQP-GLES2.functional.uniform_api.value.ini",
        "tial.get_uniform.basic.bool_api_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014183,
        "dEQP-GLES2.functional.uniform_api.value.init",
        "ial.get_uniform.basic.bool_api_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014184,
        "dEQP-GLES2.functional.uniform_api.value.in",
        "itial.get_uniform.basic.bool_api_float_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014185,
        "dEQP-GLES2.functional.uniform_api.value.in",
        "itial.get_uniform.basic.bool_api_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014186,
        "dEQP-GLES2.functional.uniform_api.value.ini",
        "tial.get_uniform.basic.bool_api_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014187,
        "dEQP-GLES2.functional.uniform_api.value.i",
        "nitial.get_uniform.basic.bool_api_int_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014188,
        "dEQP-GLES2.functional.uniform_api.value.init",
        "ial.get_uniform.basic.bvec2_api_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014189,
        "dEQP-GLES2.functional.uniform_api.value.initi",
        "al.get_uniform.basic.bvec2_api_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014190,
        "dEQP-GLES2.functional.uniform_api.value.ini",
        "tial.get_uniform.basic.bvec2_api_float_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014191,
        "dEQP-GLES2.functional.uniform_api.value.ini",
        "tial.get_uniform.basic.bvec2_api_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014192,
        "dEQP-GLES2.functional.uniform_api.value.init",
        "ial.get_uniform.basic.bvec2_api_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014193,
        "dEQP-GLES2.functional.uniform_api.value.in",
        "itial.get_uniform.basic.bvec2_api_int_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014194,
        "dEQP-GLES2.functional.uniform_api.value.init",
        "ial.get_uniform.basic.bvec3_api_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014195,
        "dEQP-GLES2.functional.uniform_api.value.initi",
        "al.get_uniform.basic.bvec3_api_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014196,
        "dEQP-GLES2.functional.uniform_api.value.ini",
        "tial.get_uniform.basic.bvec3_api_float_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014197,
        "dEQP-GLES2.functional.uniform_api.value.ini",
        "tial.get_uniform.basic.bvec3_api_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014198,
        "dEQP-GLES2.functional.uniform_api.value.init",
        "ial.get_uniform.basic.bvec3_api_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014199,
        "dEQP-GLES2.functional.uniform_api.value.in",
        "itial.get_uniform.basic.bvec3_api_int_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014200,
        "dEQP-GLES2.functional.uniform_api.value.init",
        "ial.get_uniform.basic.bvec4_api_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014201,
        "dEQP-GLES2.functional.uniform_api.value.initi",
        "al.get_uniform.basic.bvec4_api_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014202,
        "dEQP-GLES2.functional.uniform_api.value.ini",
        "tial.get_uniform.basic.bvec4_api_float_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014203,
        "dEQP-GLES2.functional.uniform_api.value.ini",
        "tial.get_uniform.basic.bvec4_api_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014204,
        "dEQP-GLES2.functional.uniform_api.value.init",
        "ial.get_uniform.basic.bvec4_api_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014205,
        "dEQP-GLES2.functional.uniform_api.value.in",
        "itial.get_uniform.basic.bvec4_api_int_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014206,
        "dEQP-GLES2.functional.uniform_api.value.i",
        "nitial.get_uniform.basic.sampler2D_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014207,
        "dEQP-GLES2.functional.uniform_api.value.in",
        "itial.get_uniform.basic.sampler2D_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014208,
        "dEQP-GLES2.functional.uniform_api.value.",
        "initial.get_uniform.basic.sampler2D_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014209,
        "dEQP-GLES2.functional.uniform_api.value.in",
        "itial.get_uniform.basic.samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014210,
        "dEQP-GLES2.functional.uniform_api.value.ini",
        "tial.get_uniform.basic.samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014211,
        "dEQP-GLES2.functional.uniform_api.value.i",
        "nitial.get_uniform.basic.samplerCube_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014439,
        "dEQP-GLES2.functional.uniform_api.value.assig",
        "ned.by_pointer.get_uniform.basic.float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014440,
        "dEQP-GLES2.functional.uniform_api.value.assign",
        "ed.by_pointer.get_uniform.basic.float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014441,
        "dEQP-GLES2.functional.uniform_api.value.assi",
        "gned.by_pointer.get_uniform.basic.float_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014442,
        "dEQP-GLES2.functional.uniform_api.value.assi",
        "gned.by_pointer.get_uniform.basic.vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014443,
        "dEQP-GLES2.functional.uniform_api.value.assig",
        "ned.by_pointer.get_uniform.basic.vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014444,
        "dEQP-GLES2.functional.uniform_api.value.ass",
        "igned.by_pointer.get_uniform.basic.vec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014445,
        "dEQP-GLES2.functional.uniform_api.value.assi",
        "gned.by_pointer.get_uniform.basic.vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014446,
        "dEQP-GLES2.functional.uniform_api.value.assig",
        "ned.by_pointer.get_uniform.basic.vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014447,
        "dEQP-GLES2.functional.uniform_api.value.ass",
        "igned.by_pointer.get_uniform.basic.vec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014448,
        "dEQP-GLES2.functional.uniform_api.value.assi",
        "gned.by_pointer.get_uniform.basic.vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014449,
        "dEQP-GLES2.functional.uniform_api.value.assig",
        "ned.by_pointer.get_uniform.basic.vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014450,
        "dEQP-GLES2.functional.uniform_api.value.ass",
        "igned.by_pointer.get_uniform.basic.vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014451,
        "dEQP-GLES2.functional.uniform_api.value.assi",
        "gned.by_pointer.get_uniform.basic.mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014452,
        "dEQP-GLES2.functional.uniform_api.value.assig",
        "ned.by_pointer.get_uniform.basic.mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014453,
        "dEQP-GLES2.functional.uniform_api.value.ass",
        "igned.by_pointer.get_uniform.basic.mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014454,
        "dEQP-GLES2.functional.uniform_api.value.assi",
        "gned.by_pointer.get_uniform.basic.mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014455,
        "dEQP-GLES2.functional.uniform_api.value.assig",
        "ned.by_pointer.get_uniform.basic.mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014456,
        "dEQP-GLES2.functional.uniform_api.value.ass",
        "igned.by_pointer.get_uniform.basic.mat3_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014457,
        "dEQP-GLES2.functional.uniform_api.value.assi",
        "gned.by_pointer.get_uniform.basic.mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014458,
        "dEQP-GLES2.functional.uniform_api.value.assig",
        "ned.by_pointer.get_uniform.basic.mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014459,
        "dEQP-GLES2.functional.uniform_api.value.ass",
        "igned.by_pointer.get_uniform.basic.mat4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014460,
        "dEQP-GLES2.functional.uniform_api.value.assi",
        "gned.by_pointer.get_uniform.basic.int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014461,
        "dEQP-GLES2.functional.uniform_api.value.assig",
        "ned.by_pointer.get_uniform.basic.int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014462,
        "dEQP-GLES2.functional.uniform_api.value.ass",
        "igned.by_pointer.get_uniform.basic.int_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014463,
        "dEQP-GLES2.functional.uniform_api.value.assig",
        "ned.by_pointer.get_uniform.basic.ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014464,
        "dEQP-GLES2.functional.uniform_api.value.assign",
        "ed.by_pointer.get_uniform.basic.ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014465,
        "dEQP-GLES2.functional.uniform_api.value.assi",
        "gned.by_pointer.get_uniform.basic.ivec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014466,
        "dEQP-GLES2.functional.uniform_api.value.assig",
        "ned.by_pointer.get_uniform.basic.ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014467,
        "dEQP-GLES2.functional.uniform_api.value.assign",
        "ed.by_pointer.get_uniform.basic.ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014468,
        "dEQP-GLES2.functional.uniform_api.value.assi",
        "gned.by_pointer.get_uniform.basic.ivec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014469,
        "dEQP-GLES2.functional.uniform_api.value.assig",
        "ned.by_pointer.get_uniform.basic.ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014470,
        "dEQP-GLES2.functional.uniform_api.value.assign",
        "ed.by_pointer.get_uniform.basic.ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014471,
        "dEQP-GLES2.functional.uniform_api.value.assi",
        "gned.by_pointer.get_uniform.basic.ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014472,
        "dEQP-GLES2.functional.uniform_api.value.assigned.",
        "by_pointer.get_uniform.basic.bool_api_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014473,
        "dEQP-GLES2.functional.uniform_api.value.assigned.b",
        "y_pointer.get_uniform.basic.bool_api_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014474,
        "dEQP-GLES2.functional.uniform_api.value.assigned",
        ".by_pointer.get_uniform.basic.bool_api_float_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014475,
        "dEQP-GLES2.functional.uniform_api.value.assigned",
        ".by_pointer.get_uniform.basic.bool_api_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014476,
        "dEQP-GLES2.functional.uniform_api.value.assigned.",
        "by_pointer.get_uniform.basic.bool_api_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014477,
        "dEQP-GLES2.functional.uniform_api.value.assigne",
        "d.by_pointer.get_uniform.basic.bool_api_int_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014478,
        "dEQP-GLES2.functional.uniform_api.value.assigned.b",
        "y_pointer.get_uniform.basic.bvec2_api_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014479,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by",
        "_pointer.get_uniform.basic.bvec2_api_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014480,
        "dEQP-GLES2.functional.uniform_api.value.assigned.",
        "by_pointer.get_uniform.basic.bvec2_api_float_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014481,
        "dEQP-GLES2.functional.uniform_api.value.assigned.",
        "by_pointer.get_uniform.basic.bvec2_api_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014482,
        "dEQP-GLES2.functional.uniform_api.value.assigned.b",
        "y_pointer.get_uniform.basic.bvec2_api_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014483,
        "dEQP-GLES2.functional.uniform_api.value.assigned",
        ".by_pointer.get_uniform.basic.bvec2_api_int_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014484,
        "dEQP-GLES2.functional.uniform_api.value.assigned.b",
        "y_pointer.get_uniform.basic.bvec3_api_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014485,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by",
        "_pointer.get_uniform.basic.bvec3_api_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014486,
        "dEQP-GLES2.functional.uniform_api.value.assigned.",
        "by_pointer.get_uniform.basic.bvec3_api_float_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014487,
        "dEQP-GLES2.functional.uniform_api.value.assigned.",
        "by_pointer.get_uniform.basic.bvec3_api_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014488,
        "dEQP-GLES2.functional.uniform_api.value.assigned.b",
        "y_pointer.get_uniform.basic.bvec3_api_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014489,
        "dEQP-GLES2.functional.uniform_api.value.assigned",
        ".by_pointer.get_uniform.basic.bvec3_api_int_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014490,
        "dEQP-GLES2.functional.uniform_api.value.assigned.b",
        "y_pointer.get_uniform.basic.bvec4_api_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014491,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by",
        "_pointer.get_uniform.basic.bvec4_api_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014492,
        "dEQP-GLES2.functional.uniform_api.value.assigned.",
        "by_pointer.get_uniform.basic.bvec4_api_float_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014493,
        "dEQP-GLES2.functional.uniform_api.value.assigned.",
        "by_pointer.get_uniform.basic.bvec4_api_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014494,
        "dEQP-GLES2.functional.uniform_api.value.assigned.b",
        "y_pointer.get_uniform.basic.bvec4_api_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014495,
        "dEQP-GLES2.functional.uniform_api.value.assigned",
        ".by_pointer.get_uniform.basic.bvec4_api_int_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014496,
        "dEQP-GLES2.functional.uniform_api.value.assigne",
        "d.by_pointer.get_uniform.basic.sampler2D_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014497,
        "dEQP-GLES2.functional.uniform_api.value.assigned",
        ".by_pointer.get_uniform.basic.sampler2D_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014498,
        "dEQP-GLES2.functional.uniform_api.value.assign",
        "ed.by_pointer.get_uniform.basic.sampler2D_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014499,
        "dEQP-GLES2.functional.uniform_api.value.assigned",
        ".by_pointer.get_uniform.basic.samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014500,
        "dEQP-GLES2.functional.uniform_api.value.assigned.",
        "by_pointer.get_uniform.basic.samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014501,
        "dEQP-GLES2.functional.uniform_api.value.assigne",
        "d.by_pointer.get_uniform.basic.samplerCube_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014771,
        "dEQP-GLES2.functional.uniform_api.value.assi",
        "gned.by_value.get_uniform.basic.float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014772,
        "dEQP-GLES2.functional.uniform_api.value.assig",
        "ned.by_value.get_uniform.basic.float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014773,
        "dEQP-GLES2.functional.uniform_api.value.ass",
        "igned.by_value.get_uniform.basic.float_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014774,
        "dEQP-GLES2.functional.uniform_api.value.ass",
        "igned.by_value.get_uniform.basic.vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014775,
        "dEQP-GLES2.functional.uniform_api.value.assi",
        "gned.by_value.get_uniform.basic.vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014776,
        "dEQP-GLES2.functional.uniform_api.value.as",
        "signed.by_value.get_uniform.basic.vec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014777,
        "dEQP-GLES2.functional.uniform_api.value.ass",
        "igned.by_value.get_uniform.basic.vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014778,
        "dEQP-GLES2.functional.uniform_api.value.assi",
        "gned.by_value.get_uniform.basic.vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014779,
        "dEQP-GLES2.functional.uniform_api.value.as",
        "signed.by_value.get_uniform.basic.vec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014780,
        "dEQP-GLES2.functional.uniform_api.value.ass",
        "igned.by_value.get_uniform.basic.vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014781,
        "dEQP-GLES2.functional.uniform_api.value.assi",
        "gned.by_value.get_uniform.basic.vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014782,
        "dEQP-GLES2.functional.uniform_api.value.as",
        "signed.by_value.get_uniform.basic.vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014783,
        "dEQP-GLES2.functional.uniform_api.value.ass",
        "igned.by_value.get_uniform.basic.int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014784,
        "dEQP-GLES2.functional.uniform_api.value.assi",
        "gned.by_value.get_uniform.basic.int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014785,
        "dEQP-GLES2.functional.uniform_api.value.as",
        "signed.by_value.get_uniform.basic.int_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014786,
        "dEQP-GLES2.functional.uniform_api.value.assi",
        "gned.by_value.get_uniform.basic.ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014787,
        "dEQP-GLES2.functional.uniform_api.value.assig",
        "ned.by_value.get_uniform.basic.ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014788,
        "dEQP-GLES2.functional.uniform_api.value.ass",
        "igned.by_value.get_uniform.basic.ivec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014789,
        "dEQP-GLES2.functional.uniform_api.value.assi",
        "gned.by_value.get_uniform.basic.ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014790,
        "dEQP-GLES2.functional.uniform_api.value.assig",
        "ned.by_value.get_uniform.basic.ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014791,
        "dEQP-GLES2.functional.uniform_api.value.ass",
        "igned.by_value.get_uniform.basic.ivec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014792,
        "dEQP-GLES2.functional.uniform_api.value.assi",
        "gned.by_value.get_uniform.basic.ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014793,
        "dEQP-GLES2.functional.uniform_api.value.assig",
        "ned.by_value.get_uniform.basic.ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014794,
        "dEQP-GLES2.functional.uniform_api.value.ass",
        "igned.by_value.get_uniform.basic.ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014795,
        "dEQP-GLES2.functional.uniform_api.value.assigned",
        ".by_value.get_uniform.basic.bool_api_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014796,
        "dEQP-GLES2.functional.uniform_api.value.assigned.",
        "by_value.get_uniform.basic.bool_api_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014797,
        "dEQP-GLES2.functional.uniform_api.value.assigne",
        "d.by_value.get_uniform.basic.bool_api_float_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014798,
        "dEQP-GLES2.functional.uniform_api.value.assigne",
        "d.by_value.get_uniform.basic.bool_api_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014799,
        "dEQP-GLES2.functional.uniform_api.value.assigned",
        ".by_value.get_uniform.basic.bool_api_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014800,
        "dEQP-GLES2.functional.uniform_api.value.assign",
        "ed.by_value.get_uniform.basic.bool_api_int_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014801,
        "dEQP-GLES2.functional.uniform_api.value.assigned.",
        "by_value.get_uniform.basic.bvec2_api_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014802,
        "dEQP-GLES2.functional.uniform_api.value.assigned.b",
        "y_value.get_uniform.basic.bvec2_api_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014803,
        "dEQP-GLES2.functional.uniform_api.value.assigned",
        ".by_value.get_uniform.basic.bvec2_api_float_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014804,
        "dEQP-GLES2.functional.uniform_api.value.assigned",
        ".by_value.get_uniform.basic.bvec2_api_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014805,
        "dEQP-GLES2.functional.uniform_api.value.assigned.",
        "by_value.get_uniform.basic.bvec2_api_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014806,
        "dEQP-GLES2.functional.uniform_api.value.assigne",
        "d.by_value.get_uniform.basic.bvec2_api_int_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014807,
        "dEQP-GLES2.functional.uniform_api.value.assigned.",
        "by_value.get_uniform.basic.bvec3_api_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014808,
        "dEQP-GLES2.functional.uniform_api.value.assigned.b",
        "y_value.get_uniform.basic.bvec3_api_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014809,
        "dEQP-GLES2.functional.uniform_api.value.assigned",
        ".by_value.get_uniform.basic.bvec3_api_float_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014810,
        "dEQP-GLES2.functional.uniform_api.value.assigned",
        ".by_value.get_uniform.basic.bvec3_api_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014811,
        "dEQP-GLES2.functional.uniform_api.value.assigned.",
        "by_value.get_uniform.basic.bvec3_api_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014812,
        "dEQP-GLES2.functional.uniform_api.value.assigne",
        "d.by_value.get_uniform.basic.bvec3_api_int_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014813,
        "dEQP-GLES2.functional.uniform_api.value.assigned.",
        "by_value.get_uniform.basic.bvec4_api_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014814,
        "dEQP-GLES2.functional.uniform_api.value.assigned.b",
        "y_value.get_uniform.basic.bvec4_api_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014815,
        "dEQP-GLES2.functional.uniform_api.value.assigned",
        ".by_value.get_uniform.basic.bvec4_api_float_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014816,
        "dEQP-GLES2.functional.uniform_api.value.assigned",
        ".by_value.get_uniform.basic.bvec4_api_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014817,
        "dEQP-GLES2.functional.uniform_api.value.assigned.",
        "by_value.get_uniform.basic.bvec4_api_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014818,
        "dEQP-GLES2.functional.uniform_api.value.assigne",
        "d.by_value.get_uniform.basic.bvec4_api_int_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014819,
        "dEQP-GLES2.functional.uniform_api.value.assign",
        "ed.by_value.get_uniform.basic.sampler2D_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014820,
        "dEQP-GLES2.functional.uniform_api.value.assigne",
        "d.by_value.get_uniform.basic.sampler2D_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014821,
        "dEQP-GLES2.functional.uniform_api.value.assig",
        "ned.by_value.get_uniform.basic.sampler2D_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014822,
        "dEQP-GLES2.functional.uniform_api.value.assigne",
        "d.by_value.get_uniform.basic.samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014823,
        "dEQP-GLES2.functional.uniform_api.value.assigned",
        ".by_value.get_uniform.basic.samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014824,
        "dEQP-GLES2.functional.uniform_api.value.assign",
        "ed.by_value.get_uniform.basic.samplerCube_both");
