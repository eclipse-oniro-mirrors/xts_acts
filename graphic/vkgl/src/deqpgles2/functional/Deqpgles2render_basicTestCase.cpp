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

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014309,
        "dEQP-GLES2.functional.uniform_api.va",
        "lue.initial.render.basic.float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014310,
        "dEQP-GLES2.functional.uniform_api.val",
        "ue.initial.render.basic.float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014311,
        "dEQP-GLES2.functional.uniform_api.v",
        "alue.initial.render.basic.float_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014312,
        "dEQP-GLES2.functional.uniform_api.va",
        "lue.initial.render.basic.vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014313,
        "dEQP-GLES2.functional.uniform_api.val",
        "ue.initial.render.basic.vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014314,
        "dEQP-GLES2.functional.uniform_api.v",
        "alue.initial.render.basic.vec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014315,
        "dEQP-GLES2.functional.uniform_api.va",
        "lue.initial.render.basic.vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014316,
        "dEQP-GLES2.functional.uniform_api.val",
        "ue.initial.render.basic.vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014317,
        "dEQP-GLES2.functional.uniform_api.v",
        "alue.initial.render.basic.vec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014318,
        "dEQP-GLES2.functional.uniform_api.va",
        "lue.initial.render.basic.vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014319,
        "dEQP-GLES2.functional.uniform_api.val",
        "ue.initial.render.basic.vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014320,
        "dEQP-GLES2.functional.uniform_api.v",
        "alue.initial.render.basic.vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014321,
        "dEQP-GLES2.functional.uniform_api.va",
        "lue.initial.render.basic.mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014322,
        "dEQP-GLES2.functional.uniform_api.val",
        "ue.initial.render.basic.mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014323,
        "dEQP-GLES2.functional.uniform_api.v",
        "alue.initial.render.basic.mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014324,
        "dEQP-GLES2.functional.uniform_api.va",
        "lue.initial.render.basic.mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014325,
        "dEQP-GLES2.functional.uniform_api.val",
        "ue.initial.render.basic.mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014326,
        "dEQP-GLES2.functional.uniform_api.v",
        "alue.initial.render.basic.mat3_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014327,
        "dEQP-GLES2.functional.uniform_api.va",
        "lue.initial.render.basic.mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014328,
        "dEQP-GLES2.functional.uniform_api.val",
        "ue.initial.render.basic.mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014329,
        "dEQP-GLES2.functional.uniform_api.v",
        "alue.initial.render.basic.mat4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014330,
        "dEQP-GLES2.functional.uniform_api.v",
        "alue.initial.render.basic.int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014331,
        "dEQP-GLES2.functional.uniform_api.va",
        "lue.initial.render.basic.int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014332,
        "dEQP-GLES2.functional.uniform_api.",
        "value.initial.render.basic.int_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014333,
        "dEQP-GLES2.functional.uniform_api.va",
        "lue.initial.render.basic.ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014334,
        "dEQP-GLES2.functional.uniform_api.val",
        "ue.initial.render.basic.ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014335,
        "dEQP-GLES2.functional.uniform_api.v",
        "alue.initial.render.basic.ivec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014336,
        "dEQP-GLES2.functional.uniform_api.va",
        "lue.initial.render.basic.ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014337,
        "dEQP-GLES2.functional.uniform_api.val",
        "ue.initial.render.basic.ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014338,
        "dEQP-GLES2.functional.uniform_api.v",
        "alue.initial.render.basic.ivec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014339,
        "dEQP-GLES2.functional.uniform_api.va",
        "lue.initial.render.basic.ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014340,
        "dEQP-GLES2.functional.uniform_api.val",
        "ue.initial.render.basic.ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014341,
        "dEQP-GLES2.functional.uniform_api.v",
        "alue.initial.render.basic.ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014342,
        "dEQP-GLES2.functional.uniform_api.va",
        "lue.initial.render.basic.bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014343,
        "dEQP-GLES2.functional.uniform_api.val",
        "ue.initial.render.basic.bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014344,
        "dEQP-GLES2.functional.uniform_api.v",
        "alue.initial.render.basic.bool_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014345,
        "dEQP-GLES2.functional.uniform_api.va",
        "lue.initial.render.basic.bvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014346,
        "dEQP-GLES2.functional.uniform_api.val",
        "ue.initial.render.basic.bvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014347,
        "dEQP-GLES2.functional.uniform_api.v",
        "alue.initial.render.basic.bvec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014348,
        "dEQP-GLES2.functional.uniform_api.va",
        "lue.initial.render.basic.bvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014349,
        "dEQP-GLES2.functional.uniform_api.val",
        "ue.initial.render.basic.bvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014350,
        "dEQP-GLES2.functional.uniform_api.v",
        "alue.initial.render.basic.bvec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014351,
        "dEQP-GLES2.functional.uniform_api.va",
        "lue.initial.render.basic.bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014352,
        "dEQP-GLES2.functional.uniform_api.val",
        "ue.initial.render.basic.bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014353,
        "dEQP-GLES2.functional.uniform_api.v",
        "alue.initial.render.basic.bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014354,
        "dEQP-GLES2.functional.uniform_api.valu",
        "e.initial.render.basic.sampler2D_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014355,
        "dEQP-GLES2.functional.uniform_api.value",
        ".initial.render.basic.sampler2D_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014356,
        "dEQP-GLES2.functional.uniform_api.val",
        "ue.initial.render.basic.sampler2D_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014357,
        "dEQP-GLES2.functional.uniform_api.value",
        ".initial.render.basic.samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014358,
        "dEQP-GLES2.functional.uniform_api.value.",
        "initial.render.basic.samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014359,
        "dEQP-GLES2.functional.uniform_api.valu",
        "e.initial.render.basic.samplerCube_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014629,
        "dEQP-GLES2.functional.uniform_api.value.as",
        "signed.by_pointer.render.basic.float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014630,
        "dEQP-GLES2.functional.uniform_api.value.ass",
        "igned.by_pointer.render.basic.float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014631,
        "dEQP-GLES2.functional.uniform_api.value.a",
        "ssigned.by_pointer.render.basic.float_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014632,
        "dEQP-GLES2.functional.uniform_api.value.as",
        "signed.by_pointer.render.basic.vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014633,
        "dEQP-GLES2.functional.uniform_api.value.ass",
        "igned.by_pointer.render.basic.vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014634,
        "dEQP-GLES2.functional.uniform_api.value.a",
        "ssigned.by_pointer.render.basic.vec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014635,
        "dEQP-GLES2.functional.uniform_api.value.as",
        "signed.by_pointer.render.basic.vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014636,
        "dEQP-GLES2.functional.uniform_api.value.ass",
        "igned.by_pointer.render.basic.vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014637,
        "dEQP-GLES2.functional.uniform_api.value.a",
        "ssigned.by_pointer.render.basic.vec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014638,
        "dEQP-GLES2.functional.uniform_api.value.as",
        "signed.by_pointer.render.basic.vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014639,
        "dEQP-GLES2.functional.uniform_api.value.ass",
        "igned.by_pointer.render.basic.vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014640,
        "dEQP-GLES2.functional.uniform_api.value.a",
        "ssigned.by_pointer.render.basic.vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014641,
        "dEQP-GLES2.functional.uniform_api.value.as",
        "signed.by_pointer.render.basic.mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014642,
        "dEQP-GLES2.functional.uniform_api.value.ass",
        "igned.by_pointer.render.basic.mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014643,
        "dEQP-GLES2.functional.uniform_api.value.a",
        "ssigned.by_pointer.render.basic.mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014644,
        "dEQP-GLES2.functional.uniform_api.value.as",
        "signed.by_pointer.render.basic.mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014645,
        "dEQP-GLES2.functional.uniform_api.value.ass",
        "igned.by_pointer.render.basic.mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014646,
        "dEQP-GLES2.functional.uniform_api.value.a",
        "ssigned.by_pointer.render.basic.mat3_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014647,
        "dEQP-GLES2.functional.uniform_api.value.as",
        "signed.by_pointer.render.basic.mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014648,
        "dEQP-GLES2.functional.uniform_api.value.ass",
        "igned.by_pointer.render.basic.mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014649,
        "dEQP-GLES2.functional.uniform_api.value.a",
        "ssigned.by_pointer.render.basic.mat4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014650,
        "dEQP-GLES2.functional.uniform_api.value.a",
        "ssigned.by_pointer.render.basic.int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014651,
        "dEQP-GLES2.functional.uniform_api.value.as",
        "signed.by_pointer.render.basic.int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014652,
        "dEQP-GLES2.functional.uniform_api.value.",
        "assigned.by_pointer.render.basic.int_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014653,
        "dEQP-GLES2.functional.uniform_api.value.as",
        "signed.by_pointer.render.basic.ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014654,
        "dEQP-GLES2.functional.uniform_api.value.ass",
        "igned.by_pointer.render.basic.ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014655,
        "dEQP-GLES2.functional.uniform_api.value.a",
        "ssigned.by_pointer.render.basic.ivec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014656,
        "dEQP-GLES2.functional.uniform_api.value.as",
        "signed.by_pointer.render.basic.ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014657,
        "dEQP-GLES2.functional.uniform_api.value.ass",
        "igned.by_pointer.render.basic.ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014658,
        "dEQP-GLES2.functional.uniform_api.value.a",
        "ssigned.by_pointer.render.basic.ivec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014659,
        "dEQP-GLES2.functional.uniform_api.value.as",
        "signed.by_pointer.render.basic.ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014660,
        "dEQP-GLES2.functional.uniform_api.value.ass",
        "igned.by_pointer.render.basic.ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014661,
        "dEQP-GLES2.functional.uniform_api.value.a",
        "ssigned.by_pointer.render.basic.ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014662,
        "dEQP-GLES2.functional.uniform_api.value.as",
        "signed.by_pointer.render.basic.bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014663,
        "dEQP-GLES2.functional.uniform_api.value.ass",
        "igned.by_pointer.render.basic.bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014664,
        "dEQP-GLES2.functional.uniform_api.value.a",
        "ssigned.by_pointer.render.basic.bool_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014665,
        "dEQP-GLES2.functional.uniform_api.value.as",
        "signed.by_pointer.render.basic.bvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014666,
        "dEQP-GLES2.functional.uniform_api.value.ass",
        "igned.by_pointer.render.basic.bvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014667,
        "dEQP-GLES2.functional.uniform_api.value.a",
        "ssigned.by_pointer.render.basic.bvec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014668,
        "dEQP-GLES2.functional.uniform_api.value.as",
        "signed.by_pointer.render.basic.bvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014669,
        "dEQP-GLES2.functional.uniform_api.value.ass",
        "igned.by_pointer.render.basic.bvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014670,
        "dEQP-GLES2.functional.uniform_api.value.a",
        "ssigned.by_pointer.render.basic.bvec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014671,
        "dEQP-GLES2.functional.uniform_api.value.as",
        "signed.by_pointer.render.basic.bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014672,
        "dEQP-GLES2.functional.uniform_api.value.ass",
        "igned.by_pointer.render.basic.bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014673,
        "dEQP-GLES2.functional.uniform_api.value.a",
        "ssigned.by_pointer.render.basic.bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014674,
        "dEQP-GLES2.functional.uniform_api.value.assi",
        "gned.by_pointer.render.basic.sampler2D_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014675,
        "dEQP-GLES2.functional.uniform_api.value.assig",
        "ned.by_pointer.render.basic.sampler2D_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014676,
        "dEQP-GLES2.functional.uniform_api.value.ass",
        "igned.by_pointer.render.basic.sampler2D_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014677,
        "dEQP-GLES2.functional.uniform_api.value.assig",
        "ned.by_pointer.render.basic.samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014678,
        "dEQP-GLES2.functional.uniform_api.value.assign",
        "ed.by_pointer.render.basic.samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014679,
        "dEQP-GLES2.functional.uniform_api.value.assi",
        "gned.by_pointer.render.basic.samplerCube_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014933,
        "dEQP-GLES2.functional.uniform_api.value.a",
        "ssigned.by_value.render.basic.float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014934,
        "dEQP-GLES2.functional.uniform_api.value.as",
        "signed.by_value.render.basic.float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014935,
        "dEQP-GLES2.functional.uniform_api.value.",
        "assigned.by_value.render.basic.float_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014936,
        "dEQP-GLES2.functional.uniform_api.value.a",
        "ssigned.by_value.render.basic.vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014937,
        "dEQP-GLES2.functional.uniform_api.value.as",
        "signed.by_value.render.basic.vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014938,
        "dEQP-GLES2.functional.uniform_api.value.",
        "assigned.by_value.render.basic.vec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014939,
        "dEQP-GLES2.functional.uniform_api.value.a",
        "ssigned.by_value.render.basic.vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014940,
        "dEQP-GLES2.functional.uniform_api.value.as",
        "signed.by_value.render.basic.vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014941,
        "dEQP-GLES2.functional.uniform_api.value.",
        "assigned.by_value.render.basic.vec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014942,
        "dEQP-GLES2.functional.uniform_api.value.a",
        "ssigned.by_value.render.basic.vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014943,
        "dEQP-GLES2.functional.uniform_api.value.as",
        "signed.by_value.render.basic.vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014944,
        "dEQP-GLES2.functional.uniform_api.value.",
        "assigned.by_value.render.basic.vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014945,
        "dEQP-GLES2.functional.uniform_api.value.",
        "assigned.by_value.render.basic.int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014946,
        "dEQP-GLES2.functional.uniform_api.value.a",
        "ssigned.by_value.render.basic.int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014947,
        "dEQP-GLES2.functional.uniform_api.value",
        ".assigned.by_value.render.basic.int_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014948,
        "dEQP-GLES2.functional.uniform_api.value.a",
        "ssigned.by_value.render.basic.ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014949,
        "dEQP-GLES2.functional.uniform_api.value.as",
        "signed.by_value.render.basic.ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014950,
        "dEQP-GLES2.functional.uniform_api.value.",
        "assigned.by_value.render.basic.ivec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014951,
        "dEQP-GLES2.functional.uniform_api.value.a",
        "ssigned.by_value.render.basic.ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014952,
        "dEQP-GLES2.functional.uniform_api.value.as",
        "signed.by_value.render.basic.ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014953,
        "dEQP-GLES2.functional.uniform_api.value.",
        "assigned.by_value.render.basic.ivec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014954,
        "dEQP-GLES2.functional.uniform_api.value.a",
        "ssigned.by_value.render.basic.ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014955,
        "dEQP-GLES2.functional.uniform_api.value.as",
        "signed.by_value.render.basic.ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014956,
        "dEQP-GLES2.functional.uniform_api.value.",
        "assigned.by_value.render.basic.ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014957,
        "dEQP-GLES2.functional.uniform_api.value.a",
        "ssigned.by_value.render.basic.bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014958,
        "dEQP-GLES2.functional.uniform_api.value.as",
        "signed.by_value.render.basic.bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014959,
        "dEQP-GLES2.functional.uniform_api.value.",
        "assigned.by_value.render.basic.bool_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014960,
        "dEQP-GLES2.functional.uniform_api.value.a",
        "ssigned.by_value.render.basic.bvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014961,
        "dEQP-GLES2.functional.uniform_api.value.as",
        "signed.by_value.render.basic.bvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014962,
        "dEQP-GLES2.functional.uniform_api.value.",
        "assigned.by_value.render.basic.bvec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014963,
        "dEQP-GLES2.functional.uniform_api.value.a",
        "ssigned.by_value.render.basic.bvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014964,
        "dEQP-GLES2.functional.uniform_api.value.as",
        "signed.by_value.render.basic.bvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014965,
        "dEQP-GLES2.functional.uniform_api.value.",
        "assigned.by_value.render.basic.bvec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014966,
        "dEQP-GLES2.functional.uniform_api.value.a",
        "ssigned.by_value.render.basic.bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014967,
        "dEQP-GLES2.functional.uniform_api.value.as",
        "signed.by_value.render.basic.bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014968,
        "dEQP-GLES2.functional.uniform_api.value.",
        "assigned.by_value.render.basic.bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014969,
        "dEQP-GLES2.functional.uniform_api.value.ass",
        "igned.by_value.render.basic.sampler2D_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014970,
        "dEQP-GLES2.functional.uniform_api.value.assi",
        "gned.by_value.render.basic.sampler2D_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014971,
        "dEQP-GLES2.functional.uniform_api.value.as",
        "signed.by_value.render.basic.sampler2D_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014972,
        "dEQP-GLES2.functional.uniform_api.value.assi",
        "gned.by_value.render.basic.samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014973,
        "dEQP-GLES2.functional.uniform_api.value.assig",
        "ned.by_value.render.basic.samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014974,
        "dEQP-GLES2.functional.uniform_api.value.ass",
        "igned.by_value.render.basic.samplerCube_both");
