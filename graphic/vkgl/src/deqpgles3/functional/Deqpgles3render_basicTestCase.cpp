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
#include "../ActsDeqpgles30038TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037129,
        "dEQP-GLES3.functional.uniform_api.va",
        "lue.initial.render.basic.float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037130,
        "dEQP-GLES3.functional.uniform_api.val",
        "ue.initial.render.basic.float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037131,
        "dEQP-GLES3.functional.uniform_api.v",
        "alue.initial.render.basic.float_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037132,
        "dEQP-GLES3.functional.uniform_api.va",
        "lue.initial.render.basic.vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037133,
        "dEQP-GLES3.functional.uniform_api.val",
        "ue.initial.render.basic.vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037134,
        "dEQP-GLES3.functional.uniform_api.v",
        "alue.initial.render.basic.vec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037135,
        "dEQP-GLES3.functional.uniform_api.va",
        "lue.initial.render.basic.vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037136,
        "dEQP-GLES3.functional.uniform_api.val",
        "ue.initial.render.basic.vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037137,
        "dEQP-GLES3.functional.uniform_api.v",
        "alue.initial.render.basic.vec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037138,
        "dEQP-GLES3.functional.uniform_api.va",
        "lue.initial.render.basic.vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037139,
        "dEQP-GLES3.functional.uniform_api.val",
        "ue.initial.render.basic.vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037140,
        "dEQP-GLES3.functional.uniform_api.v",
        "alue.initial.render.basic.vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037141,
        "dEQP-GLES3.functional.uniform_api.va",
        "lue.initial.render.basic.mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037142,
        "dEQP-GLES3.functional.uniform_api.val",
        "ue.initial.render.basic.mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037143,
        "dEQP-GLES3.functional.uniform_api.v",
        "alue.initial.render.basic.mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037144,
        "dEQP-GLES3.functional.uniform_api.val",
        "ue.initial.render.basic.mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037145,
        "dEQP-GLES3.functional.uniform_api.valu",
        "e.initial.render.basic.mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037146,
        "dEQP-GLES3.functional.uniform_api.va",
        "lue.initial.render.basic.mat2x3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037147,
        "dEQP-GLES3.functional.uniform_api.val",
        "ue.initial.render.basic.mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037148,
        "dEQP-GLES3.functional.uniform_api.valu",
        "e.initial.render.basic.mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037149,
        "dEQP-GLES3.functional.uniform_api.va",
        "lue.initial.render.basic.mat2x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037150,
        "dEQP-GLES3.functional.uniform_api.val",
        "ue.initial.render.basic.mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037151,
        "dEQP-GLES3.functional.uniform_api.valu",
        "e.initial.render.basic.mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037152,
        "dEQP-GLES3.functional.uniform_api.va",
        "lue.initial.render.basic.mat3x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037153,
        "dEQP-GLES3.functional.uniform_api.va",
        "lue.initial.render.basic.mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037154,
        "dEQP-GLES3.functional.uniform_api.val",
        "ue.initial.render.basic.mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037155,
        "dEQP-GLES3.functional.uniform_api.v",
        "alue.initial.render.basic.mat3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037156,
        "dEQP-GLES3.functional.uniform_api.val",
        "ue.initial.render.basic.mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037157,
        "dEQP-GLES3.functional.uniform_api.valu",
        "e.initial.render.basic.mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037158,
        "dEQP-GLES3.functional.uniform_api.va",
        "lue.initial.render.basic.mat3x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037159,
        "dEQP-GLES3.functional.uniform_api.val",
        "ue.initial.render.basic.mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037160,
        "dEQP-GLES3.functional.uniform_api.valu",
        "e.initial.render.basic.mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037161,
        "dEQP-GLES3.functional.uniform_api.va",
        "lue.initial.render.basic.mat4x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037162,
        "dEQP-GLES3.functional.uniform_api.val",
        "ue.initial.render.basic.mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037163,
        "dEQP-GLES3.functional.uniform_api.valu",
        "e.initial.render.basic.mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037164,
        "dEQP-GLES3.functional.uniform_api.va",
        "lue.initial.render.basic.mat4x3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037165,
        "dEQP-GLES3.functional.uniform_api.va",
        "lue.initial.render.basic.mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037166,
        "dEQP-GLES3.functional.uniform_api.val",
        "ue.initial.render.basic.mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037167,
        "dEQP-GLES3.functional.uniform_api.v",
        "alue.initial.render.basic.mat4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037168,
        "dEQP-GLES3.functional.uniform_api.v",
        "alue.initial.render.basic.int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037169,
        "dEQP-GLES3.functional.uniform_api.va",
        "lue.initial.render.basic.int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037170,
        "dEQP-GLES3.functional.uniform_api.",
        "value.initial.render.basic.int_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037171,
        "dEQP-GLES3.functional.uniform_api.va",
        "lue.initial.render.basic.ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037172,
        "dEQP-GLES3.functional.uniform_api.val",
        "ue.initial.render.basic.ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037173,
        "dEQP-GLES3.functional.uniform_api.v",
        "alue.initial.render.basic.ivec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037174,
        "dEQP-GLES3.functional.uniform_api.va",
        "lue.initial.render.basic.ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037175,
        "dEQP-GLES3.functional.uniform_api.val",
        "ue.initial.render.basic.ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037176,
        "dEQP-GLES3.functional.uniform_api.v",
        "alue.initial.render.basic.ivec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037177,
        "dEQP-GLES3.functional.uniform_api.va",
        "lue.initial.render.basic.ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037178,
        "dEQP-GLES3.functional.uniform_api.val",
        "ue.initial.render.basic.ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037179,
        "dEQP-GLES3.functional.uniform_api.v",
        "alue.initial.render.basic.ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037180,
        "dEQP-GLES3.functional.uniform_api.va",
        "lue.initial.render.basic.uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037181,
        "dEQP-GLES3.functional.uniform_api.val",
        "ue.initial.render.basic.uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037182,
        "dEQP-GLES3.functional.uniform_api.v",
        "alue.initial.render.basic.uint_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037183,
        "dEQP-GLES3.functional.uniform_api.va",
        "lue.initial.render.basic.uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037184,
        "dEQP-GLES3.functional.uniform_api.val",
        "ue.initial.render.basic.uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037185,
        "dEQP-GLES3.functional.uniform_api.v",
        "alue.initial.render.basic.uvec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037186,
        "dEQP-GLES3.functional.uniform_api.va",
        "lue.initial.render.basic.uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037187,
        "dEQP-GLES3.functional.uniform_api.val",
        "ue.initial.render.basic.uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037188,
        "dEQP-GLES3.functional.uniform_api.v",
        "alue.initial.render.basic.uvec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037189,
        "dEQP-GLES3.functional.uniform_api.va",
        "lue.initial.render.basic.uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037190,
        "dEQP-GLES3.functional.uniform_api.val",
        "ue.initial.render.basic.uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037191,
        "dEQP-GLES3.functional.uniform_api.v",
        "alue.initial.render.basic.uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037192,
        "dEQP-GLES3.functional.uniform_api.va",
        "lue.initial.render.basic.bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037193,
        "dEQP-GLES3.functional.uniform_api.val",
        "ue.initial.render.basic.bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037194,
        "dEQP-GLES3.functional.uniform_api.v",
        "alue.initial.render.basic.bool_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037195,
        "dEQP-GLES3.functional.uniform_api.va",
        "lue.initial.render.basic.bvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037196,
        "dEQP-GLES3.functional.uniform_api.val",
        "ue.initial.render.basic.bvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037197,
        "dEQP-GLES3.functional.uniform_api.v",
        "alue.initial.render.basic.bvec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037198,
        "dEQP-GLES3.functional.uniform_api.va",
        "lue.initial.render.basic.bvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037199,
        "dEQP-GLES3.functional.uniform_api.val",
        "ue.initial.render.basic.bvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037200,
        "dEQP-GLES3.functional.uniform_api.v",
        "alue.initial.render.basic.bvec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037201,
        "dEQP-GLES3.functional.uniform_api.va",
        "lue.initial.render.basic.bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037202,
        "dEQP-GLES3.functional.uniform_api.val",
        "ue.initial.render.basic.bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037203,
        "dEQP-GLES3.functional.uniform_api.v",
        "alue.initial.render.basic.bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037204,
        "dEQP-GLES3.functional.uniform_api.valu",
        "e.initial.render.basic.sampler2D_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037205,
        "dEQP-GLES3.functional.uniform_api.value",
        ".initial.render.basic.sampler2D_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037206,
        "dEQP-GLES3.functional.uniform_api.val",
        "ue.initial.render.basic.sampler2D_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037207,
        "dEQP-GLES3.functional.uniform_api.value",
        ".initial.render.basic.samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037208,
        "dEQP-GLES3.functional.uniform_api.value.",
        "initial.render.basic.samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037209,
        "dEQP-GLES3.functional.uniform_api.valu",
        "e.initial.render.basic.samplerCube_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037612,
        "dEQP-GLES3.functional.uniform_api.value.as",
        "signed.by_pointer.render.basic.float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037613,
        "dEQP-GLES3.functional.uniform_api.value.ass",
        "igned.by_pointer.render.basic.float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037614,
        "dEQP-GLES3.functional.uniform_api.value.a",
        "ssigned.by_pointer.render.basic.float_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037615,
        "dEQP-GLES3.functional.uniform_api.value.as",
        "signed.by_pointer.render.basic.vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037616,
        "dEQP-GLES3.functional.uniform_api.value.ass",
        "igned.by_pointer.render.basic.vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037617,
        "dEQP-GLES3.functional.uniform_api.value.a",
        "ssigned.by_pointer.render.basic.vec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037618,
        "dEQP-GLES3.functional.uniform_api.value.as",
        "signed.by_pointer.render.basic.vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037619,
        "dEQP-GLES3.functional.uniform_api.value.ass",
        "igned.by_pointer.render.basic.vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037620,
        "dEQP-GLES3.functional.uniform_api.value.a",
        "ssigned.by_pointer.render.basic.vec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037621,
        "dEQP-GLES3.functional.uniform_api.value.as",
        "signed.by_pointer.render.basic.vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037622,
        "dEQP-GLES3.functional.uniform_api.value.ass",
        "igned.by_pointer.render.basic.vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037623,
        "dEQP-GLES3.functional.uniform_api.value.a",
        "ssigned.by_pointer.render.basic.vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037624,
        "dEQP-GLES3.functional.uniform_api.value.as",
        "signed.by_pointer.render.basic.mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037625,
        "dEQP-GLES3.functional.uniform_api.value.ass",
        "igned.by_pointer.render.basic.mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037626,
        "dEQP-GLES3.functional.uniform_api.value.a",
        "ssigned.by_pointer.render.basic.mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037627,
        "dEQP-GLES3.functional.uniform_api.value.assigne",
        "d.by_pointer.render.basic.mat2_row_major_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037628,
        "dEQP-GLES3.functional.uniform_api.value.assigned",
        ".by_pointer.render.basic.mat2_row_major_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037629,
        "dEQP-GLES3.functional.uniform_api.value.assign",
        "ed.by_pointer.render.basic.mat2_row_major_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037630,
        "dEQP-GLES3.functional.uniform_api.value.ass",
        "igned.by_pointer.render.basic.mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037631,
        "dEQP-GLES3.functional.uniform_api.value.assi",
        "gned.by_pointer.render.basic.mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037632,
        "dEQP-GLES3.functional.uniform_api.value.as",
        "signed.by_pointer.render.basic.mat2x3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037633,
        "dEQP-GLES3.functional.uniform_api.value.assigned",
        ".by_pointer.render.basic.mat2x3_row_major_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037634,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "by_pointer.render.basic.mat2x3_row_major_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037635,
        "dEQP-GLES3.functional.uniform_api.value.assigne",
        "d.by_pointer.render.basic.mat2x3_row_major_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037636,
        "dEQP-GLES3.functional.uniform_api.value.ass",
        "igned.by_pointer.render.basic.mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037637,
        "dEQP-GLES3.functional.uniform_api.value.assi",
        "gned.by_pointer.render.basic.mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037638,
        "dEQP-GLES3.functional.uniform_api.value.as",
        "signed.by_pointer.render.basic.mat2x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037639,
        "dEQP-GLES3.functional.uniform_api.value.assigned",
        ".by_pointer.render.basic.mat2x4_row_major_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037640,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "by_pointer.render.basic.mat2x4_row_major_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037641,
        "dEQP-GLES3.functional.uniform_api.value.assigne",
        "d.by_pointer.render.basic.mat2x4_row_major_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037642,
        "dEQP-GLES3.functional.uniform_api.value.ass",
        "igned.by_pointer.render.basic.mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037643,
        "dEQP-GLES3.functional.uniform_api.value.assi",
        "gned.by_pointer.render.basic.mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037644,
        "dEQP-GLES3.functional.uniform_api.value.as",
        "signed.by_pointer.render.basic.mat3x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037645,
        "dEQP-GLES3.functional.uniform_api.value.assigned",
        ".by_pointer.render.basic.mat3x2_row_major_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037646,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "by_pointer.render.basic.mat3x2_row_major_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037647,
        "dEQP-GLES3.functional.uniform_api.value.assigne",
        "d.by_pointer.render.basic.mat3x2_row_major_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037648,
        "dEQP-GLES3.functional.uniform_api.value.as",
        "signed.by_pointer.render.basic.mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037649,
        "dEQP-GLES3.functional.uniform_api.value.ass",
        "igned.by_pointer.render.basic.mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037650,
        "dEQP-GLES3.functional.uniform_api.value.a",
        "ssigned.by_pointer.render.basic.mat3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037651,
        "dEQP-GLES3.functional.uniform_api.value.assigne",
        "d.by_pointer.render.basic.mat3_row_major_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037652,
        "dEQP-GLES3.functional.uniform_api.value.assigned",
        ".by_pointer.render.basic.mat3_row_major_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037653,
        "dEQP-GLES3.functional.uniform_api.value.assign",
        "ed.by_pointer.render.basic.mat3_row_major_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037654,
        "dEQP-GLES3.functional.uniform_api.value.ass",
        "igned.by_pointer.render.basic.mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037655,
        "dEQP-GLES3.functional.uniform_api.value.assi",
        "gned.by_pointer.render.basic.mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037656,
        "dEQP-GLES3.functional.uniform_api.value.as",
        "signed.by_pointer.render.basic.mat3x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037657,
        "dEQP-GLES3.functional.uniform_api.value.assigned",
        ".by_pointer.render.basic.mat3x4_row_major_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037658,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "by_pointer.render.basic.mat3x4_row_major_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037659,
        "dEQP-GLES3.functional.uniform_api.value.assigne",
        "d.by_pointer.render.basic.mat3x4_row_major_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037660,
        "dEQP-GLES3.functional.uniform_api.value.ass",
        "igned.by_pointer.render.basic.mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037661,
        "dEQP-GLES3.functional.uniform_api.value.assi",
        "gned.by_pointer.render.basic.mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037662,
        "dEQP-GLES3.functional.uniform_api.value.as",
        "signed.by_pointer.render.basic.mat4x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037663,
        "dEQP-GLES3.functional.uniform_api.value.assigned",
        ".by_pointer.render.basic.mat4x2_row_major_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037664,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "by_pointer.render.basic.mat4x2_row_major_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037665,
        "dEQP-GLES3.functional.uniform_api.value.assigne",
        "d.by_pointer.render.basic.mat4x2_row_major_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037666,
        "dEQP-GLES3.functional.uniform_api.value.ass",
        "igned.by_pointer.render.basic.mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037667,
        "dEQP-GLES3.functional.uniform_api.value.assi",
        "gned.by_pointer.render.basic.mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037668,
        "dEQP-GLES3.functional.uniform_api.value.as",
        "signed.by_pointer.render.basic.mat4x3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037669,
        "dEQP-GLES3.functional.uniform_api.value.assigned",
        ".by_pointer.render.basic.mat4x3_row_major_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037670,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "by_pointer.render.basic.mat4x3_row_major_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037671,
        "dEQP-GLES3.functional.uniform_api.value.assigne",
        "d.by_pointer.render.basic.mat4x3_row_major_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037672,
        "dEQP-GLES3.functional.uniform_api.value.as",
        "signed.by_pointer.render.basic.mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037673,
        "dEQP-GLES3.functional.uniform_api.value.ass",
        "igned.by_pointer.render.basic.mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037674,
        "dEQP-GLES3.functional.uniform_api.value.a",
        "ssigned.by_pointer.render.basic.mat4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037675,
        "dEQP-GLES3.functional.uniform_api.value.assigne",
        "d.by_pointer.render.basic.mat4_row_major_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037676,
        "dEQP-GLES3.functional.uniform_api.value.assigned",
        ".by_pointer.render.basic.mat4_row_major_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037677,
        "dEQP-GLES3.functional.uniform_api.value.assign",
        "ed.by_pointer.render.basic.mat4_row_major_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037678,
        "dEQP-GLES3.functional.uniform_api.value.a",
        "ssigned.by_pointer.render.basic.int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037679,
        "dEQP-GLES3.functional.uniform_api.value.as",
        "signed.by_pointer.render.basic.int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037680,
        "dEQP-GLES3.functional.uniform_api.value.",
        "assigned.by_pointer.render.basic.int_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037681,
        "dEQP-GLES3.functional.uniform_api.value.as",
        "signed.by_pointer.render.basic.ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037682,
        "dEQP-GLES3.functional.uniform_api.value.ass",
        "igned.by_pointer.render.basic.ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037683,
        "dEQP-GLES3.functional.uniform_api.value.a",
        "ssigned.by_pointer.render.basic.ivec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037684,
        "dEQP-GLES3.functional.uniform_api.value.as",
        "signed.by_pointer.render.basic.ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037685,
        "dEQP-GLES3.functional.uniform_api.value.ass",
        "igned.by_pointer.render.basic.ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037686,
        "dEQP-GLES3.functional.uniform_api.value.a",
        "ssigned.by_pointer.render.basic.ivec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037687,
        "dEQP-GLES3.functional.uniform_api.value.as",
        "signed.by_pointer.render.basic.ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037688,
        "dEQP-GLES3.functional.uniform_api.value.ass",
        "igned.by_pointer.render.basic.ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037689,
        "dEQP-GLES3.functional.uniform_api.value.a",
        "ssigned.by_pointer.render.basic.ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037690,
        "dEQP-GLES3.functional.uniform_api.value.as",
        "signed.by_pointer.render.basic.uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037691,
        "dEQP-GLES3.functional.uniform_api.value.ass",
        "igned.by_pointer.render.basic.uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037692,
        "dEQP-GLES3.functional.uniform_api.value.a",
        "ssigned.by_pointer.render.basic.uint_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037693,
        "dEQP-GLES3.functional.uniform_api.value.as",
        "signed.by_pointer.render.basic.uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037694,
        "dEQP-GLES3.functional.uniform_api.value.ass",
        "igned.by_pointer.render.basic.uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037695,
        "dEQP-GLES3.functional.uniform_api.value.a",
        "ssigned.by_pointer.render.basic.uvec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037696,
        "dEQP-GLES3.functional.uniform_api.value.as",
        "signed.by_pointer.render.basic.uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037697,
        "dEQP-GLES3.functional.uniform_api.value.ass",
        "igned.by_pointer.render.basic.uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037698,
        "dEQP-GLES3.functional.uniform_api.value.a",
        "ssigned.by_pointer.render.basic.uvec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037699,
        "dEQP-GLES3.functional.uniform_api.value.as",
        "signed.by_pointer.render.basic.uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037700,
        "dEQP-GLES3.functional.uniform_api.value.ass",
        "igned.by_pointer.render.basic.uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037701,
        "dEQP-GLES3.functional.uniform_api.value.a",
        "ssigned.by_pointer.render.basic.uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037702,
        "dEQP-GLES3.functional.uniform_api.value.as",
        "signed.by_pointer.render.basic.bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037703,
        "dEQP-GLES3.functional.uniform_api.value.ass",
        "igned.by_pointer.render.basic.bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037704,
        "dEQP-GLES3.functional.uniform_api.value.a",
        "ssigned.by_pointer.render.basic.bool_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037705,
        "dEQP-GLES3.functional.uniform_api.value.as",
        "signed.by_pointer.render.basic.bvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037706,
        "dEQP-GLES3.functional.uniform_api.value.ass",
        "igned.by_pointer.render.basic.bvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037707,
        "dEQP-GLES3.functional.uniform_api.value.a",
        "ssigned.by_pointer.render.basic.bvec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037708,
        "dEQP-GLES3.functional.uniform_api.value.as",
        "signed.by_pointer.render.basic.bvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037709,
        "dEQP-GLES3.functional.uniform_api.value.ass",
        "igned.by_pointer.render.basic.bvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037710,
        "dEQP-GLES3.functional.uniform_api.value.a",
        "ssigned.by_pointer.render.basic.bvec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037711,
        "dEQP-GLES3.functional.uniform_api.value.as",
        "signed.by_pointer.render.basic.bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037712,
        "dEQP-GLES3.functional.uniform_api.value.ass",
        "igned.by_pointer.render.basic.bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037713,
        "dEQP-GLES3.functional.uniform_api.value.a",
        "ssigned.by_pointer.render.basic.bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037714,
        "dEQP-GLES3.functional.uniform_api.value.assi",
        "gned.by_pointer.render.basic.sampler2D_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037715,
        "dEQP-GLES3.functional.uniform_api.value.assig",
        "ned.by_pointer.render.basic.sampler2D_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037716,
        "dEQP-GLES3.functional.uniform_api.value.ass",
        "igned.by_pointer.render.basic.sampler2D_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037717,
        "dEQP-GLES3.functional.uniform_api.value.assig",
        "ned.by_pointer.render.basic.samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037718,
        "dEQP-GLES3.functional.uniform_api.value.assign",
        "ed.by_pointer.render.basic.samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037719,
        "dEQP-GLES3.functional.uniform_api.value.assi",
        "gned.by_pointer.render.basic.samplerCube_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038056,
        "dEQP-GLES3.functional.uniform_api.value.a",
        "ssigned.by_value.render.basic.float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038057,
        "dEQP-GLES3.functional.uniform_api.value.as",
        "signed.by_value.render.basic.float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038058,
        "dEQP-GLES3.functional.uniform_api.value.",
        "assigned.by_value.render.basic.float_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038059,
        "dEQP-GLES3.functional.uniform_api.value.a",
        "ssigned.by_value.render.basic.vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038060,
        "dEQP-GLES3.functional.uniform_api.value.as",
        "signed.by_value.render.basic.vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038061,
        "dEQP-GLES3.functional.uniform_api.value.",
        "assigned.by_value.render.basic.vec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038062,
        "dEQP-GLES3.functional.uniform_api.value.a",
        "ssigned.by_value.render.basic.vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038063,
        "dEQP-GLES3.functional.uniform_api.value.as",
        "signed.by_value.render.basic.vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038064,
        "dEQP-GLES3.functional.uniform_api.value.",
        "assigned.by_value.render.basic.vec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038065,
        "dEQP-GLES3.functional.uniform_api.value.a",
        "ssigned.by_value.render.basic.vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038066,
        "dEQP-GLES3.functional.uniform_api.value.as",
        "signed.by_value.render.basic.vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038067,
        "dEQP-GLES3.functional.uniform_api.value.",
        "assigned.by_value.render.basic.vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038068,
        "dEQP-GLES3.functional.uniform_api.value.",
        "assigned.by_value.render.basic.int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038069,
        "dEQP-GLES3.functional.uniform_api.value.a",
        "ssigned.by_value.render.basic.int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038070,
        "dEQP-GLES3.functional.uniform_api.value",
        ".assigned.by_value.render.basic.int_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038071,
        "dEQP-GLES3.functional.uniform_api.value.a",
        "ssigned.by_value.render.basic.ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038072,
        "dEQP-GLES3.functional.uniform_api.value.as",
        "signed.by_value.render.basic.ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038073,
        "dEQP-GLES3.functional.uniform_api.value.",
        "assigned.by_value.render.basic.ivec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038074,
        "dEQP-GLES3.functional.uniform_api.value.a",
        "ssigned.by_value.render.basic.ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038075,
        "dEQP-GLES3.functional.uniform_api.value.as",
        "signed.by_value.render.basic.ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038076,
        "dEQP-GLES3.functional.uniform_api.value.",
        "assigned.by_value.render.basic.ivec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038077,
        "dEQP-GLES3.functional.uniform_api.value.a",
        "ssigned.by_value.render.basic.ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038078,
        "dEQP-GLES3.functional.uniform_api.value.as",
        "signed.by_value.render.basic.ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038079,
        "dEQP-GLES3.functional.uniform_api.value.",
        "assigned.by_value.render.basic.ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038080,
        "dEQP-GLES3.functional.uniform_api.value.a",
        "ssigned.by_value.render.basic.uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038081,
        "dEQP-GLES3.functional.uniform_api.value.as",
        "signed.by_value.render.basic.uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038082,
        "dEQP-GLES3.functional.uniform_api.value.",
        "assigned.by_value.render.basic.uint_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038083,
        "dEQP-GLES3.functional.uniform_api.value.a",
        "ssigned.by_value.render.basic.uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038084,
        "dEQP-GLES3.functional.uniform_api.value.as",
        "signed.by_value.render.basic.uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038085,
        "dEQP-GLES3.functional.uniform_api.value.",
        "assigned.by_value.render.basic.uvec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038086,
        "dEQP-GLES3.functional.uniform_api.value.a",
        "ssigned.by_value.render.basic.uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038087,
        "dEQP-GLES3.functional.uniform_api.value.as",
        "signed.by_value.render.basic.uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038088,
        "dEQP-GLES3.functional.uniform_api.value.",
        "assigned.by_value.render.basic.uvec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038089,
        "dEQP-GLES3.functional.uniform_api.value.a",
        "ssigned.by_value.render.basic.uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038090,
        "dEQP-GLES3.functional.uniform_api.value.as",
        "signed.by_value.render.basic.uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038091,
        "dEQP-GLES3.functional.uniform_api.value.",
        "assigned.by_value.render.basic.uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038092,
        "dEQP-GLES3.functional.uniform_api.value.a",
        "ssigned.by_value.render.basic.bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038093,
        "dEQP-GLES3.functional.uniform_api.value.as",
        "signed.by_value.render.basic.bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038094,
        "dEQP-GLES3.functional.uniform_api.value.",
        "assigned.by_value.render.basic.bool_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038095,
        "dEQP-GLES3.functional.uniform_api.value.a",
        "ssigned.by_value.render.basic.bvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038096,
        "dEQP-GLES3.functional.uniform_api.value.as",
        "signed.by_value.render.basic.bvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038097,
        "dEQP-GLES3.functional.uniform_api.value.",
        "assigned.by_value.render.basic.bvec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038098,
        "dEQP-GLES3.functional.uniform_api.value.a",
        "ssigned.by_value.render.basic.bvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038099,
        "dEQP-GLES3.functional.uniform_api.value.as",
        "signed.by_value.render.basic.bvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038100,
        "dEQP-GLES3.functional.uniform_api.value.",
        "assigned.by_value.render.basic.bvec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038101,
        "dEQP-GLES3.functional.uniform_api.value.a",
        "ssigned.by_value.render.basic.bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038102,
        "dEQP-GLES3.functional.uniform_api.value.as",
        "signed.by_value.render.basic.bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038103,
        "dEQP-GLES3.functional.uniform_api.value.",
        "assigned.by_value.render.basic.bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038104,
        "dEQP-GLES3.functional.uniform_api.value.ass",
        "igned.by_value.render.basic.sampler2D_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038105,
        "dEQP-GLES3.functional.uniform_api.value.assi",
        "gned.by_value.render.basic.sampler2D_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038106,
        "dEQP-GLES3.functional.uniform_api.value.as",
        "signed.by_value.render.basic.sampler2D_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038107,
        "dEQP-GLES3.functional.uniform_api.value.assi",
        "gned.by_value.render.basic.samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038108,
        "dEQP-GLES3.functional.uniform_api.value.assig",
        "ned.by_value.render.basic.samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038109,
        "dEQP-GLES3.functional.uniform_api.value.ass",
        "igned.by_value.render.basic.samplerCube_both");
