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

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037210,
        "dEQP-GLES3.functional.uniform_api.value",
        ".initial.render.basic_array.float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037211,
        "dEQP-GLES3.functional.uniform_api.value.",
        "initial.render.basic_array.float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037212,
        "dEQP-GLES3.functional.uniform_api.valu",
        "e.initial.render.basic_array.float_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037213,
        "dEQP-GLES3.functional.uniform_api.value",
        ".initial.render.basic_array.vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037214,
        "dEQP-GLES3.functional.uniform_api.value.",
        "initial.render.basic_array.vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037215,
        "dEQP-GLES3.functional.uniform_api.valu",
        "e.initial.render.basic_array.vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037216,
        "dEQP-GLES3.functional.uniform_api.value",
        ".initial.render.basic_array.mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037217,
        "dEQP-GLES3.functional.uniform_api.value.",
        "initial.render.basic_array.mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037218,
        "dEQP-GLES3.functional.uniform_api.valu",
        "e.initial.render.basic_array.mat4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037219,
        "dEQP-GLES3.functional.uniform_api.valu",
        "e.initial.render.basic_array.int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037220,
        "dEQP-GLES3.functional.uniform_api.value",
        ".initial.render.basic_array.int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037221,
        "dEQP-GLES3.functional.uniform_api.val",
        "ue.initial.render.basic_array.int_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037222,
        "dEQP-GLES3.functional.uniform_api.value",
        ".initial.render.basic_array.ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037223,
        "dEQP-GLES3.functional.uniform_api.value.",
        "initial.render.basic_array.ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037224,
        "dEQP-GLES3.functional.uniform_api.valu",
        "e.initial.render.basic_array.ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037225,
        "dEQP-GLES3.functional.uniform_api.value",
        ".initial.render.basic_array.uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037226,
        "dEQP-GLES3.functional.uniform_api.value.",
        "initial.render.basic_array.uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037227,
        "dEQP-GLES3.functional.uniform_api.valu",
        "e.initial.render.basic_array.uint_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037228,
        "dEQP-GLES3.functional.uniform_api.value",
        ".initial.render.basic_array.uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037229,
        "dEQP-GLES3.functional.uniform_api.value.",
        "initial.render.basic_array.uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037230,
        "dEQP-GLES3.functional.uniform_api.valu",
        "e.initial.render.basic_array.uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037231,
        "dEQP-GLES3.functional.uniform_api.value",
        ".initial.render.basic_array.bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037232,
        "dEQP-GLES3.functional.uniform_api.value.",
        "initial.render.basic_array.bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037233,
        "dEQP-GLES3.functional.uniform_api.valu",
        "e.initial.render.basic_array.bool_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037234,
        "dEQP-GLES3.functional.uniform_api.value",
        ".initial.render.basic_array.bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037235,
        "dEQP-GLES3.functional.uniform_api.value.",
        "initial.render.basic_array.bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037236,
        "dEQP-GLES3.functional.uniform_api.valu",
        "e.initial.render.basic_array.bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037237,
        "dEQP-GLES3.functional.uniform_api.value.i",
        "nitial.render.basic_array.sampler2D_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037238,
        "dEQP-GLES3.functional.uniform_api.value.in",
        "itial.render.basic_array.sampler2D_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037239,
        "dEQP-GLES3.functional.uniform_api.value.",
        "initial.render.basic_array.sampler2D_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037720,
        "dEQP-GLES3.functional.uniform_api.value.assig",
        "ned.by_pointer.render.basic_array.float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037721,
        "dEQP-GLES3.functional.uniform_api.value.assign",
        "ed.by_pointer.render.basic_array.float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037722,
        "dEQP-GLES3.functional.uniform_api.value.assi",
        "gned.by_pointer.render.basic_array.float_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037723,
        "dEQP-GLES3.functional.uniform_api.value.assig",
        "ned.by_pointer.render.basic_array.vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037724,
        "dEQP-GLES3.functional.uniform_api.value.assign",
        "ed.by_pointer.render.basic_array.vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037725,
        "dEQP-GLES3.functional.uniform_api.value.assi",
        "gned.by_pointer.render.basic_array.vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037726,
        "dEQP-GLES3.functional.uniform_api.value.assig",
        "ned.by_pointer.render.basic_array.mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037727,
        "dEQP-GLES3.functional.uniform_api.value.assign",
        "ed.by_pointer.render.basic_array.mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037728,
        "dEQP-GLES3.functional.uniform_api.value.assi",
        "gned.by_pointer.render.basic_array.mat4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037729,
        "dEQP-GLES3.functional.uniform_api.value.assigned.b",
        "y_pointer.render.basic_array.mat4_row_major_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037730,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by",
        "_pointer.render.basic_array.mat4_row_major_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037731,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "by_pointer.render.basic_array.mat4_row_major_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037732,
        "dEQP-GLES3.functional.uniform_api.value.assi",
        "gned.by_pointer.render.basic_array.int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037733,
        "dEQP-GLES3.functional.uniform_api.value.assig",
        "ned.by_pointer.render.basic_array.int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037734,
        "dEQP-GLES3.functional.uniform_api.value.ass",
        "igned.by_pointer.render.basic_array.int_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037735,
        "dEQP-GLES3.functional.uniform_api.value.assig",
        "ned.by_pointer.render.basic_array.ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037736,
        "dEQP-GLES3.functional.uniform_api.value.assign",
        "ed.by_pointer.render.basic_array.ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037737,
        "dEQP-GLES3.functional.uniform_api.value.assi",
        "gned.by_pointer.render.basic_array.ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037738,
        "dEQP-GLES3.functional.uniform_api.value.assig",
        "ned.by_pointer.render.basic_array.uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037739,
        "dEQP-GLES3.functional.uniform_api.value.assign",
        "ed.by_pointer.render.basic_array.uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037740,
        "dEQP-GLES3.functional.uniform_api.value.assi",
        "gned.by_pointer.render.basic_array.uint_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037741,
        "dEQP-GLES3.functional.uniform_api.value.assig",
        "ned.by_pointer.render.basic_array.uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037742,
        "dEQP-GLES3.functional.uniform_api.value.assign",
        "ed.by_pointer.render.basic_array.uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037743,
        "dEQP-GLES3.functional.uniform_api.value.assi",
        "gned.by_pointer.render.basic_array.uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037744,
        "dEQP-GLES3.functional.uniform_api.value.assig",
        "ned.by_pointer.render.basic_array.bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037745,
        "dEQP-GLES3.functional.uniform_api.value.assign",
        "ed.by_pointer.render.basic_array.bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037746,
        "dEQP-GLES3.functional.uniform_api.value.assi",
        "gned.by_pointer.render.basic_array.bool_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037747,
        "dEQP-GLES3.functional.uniform_api.value.assig",
        "ned.by_pointer.render.basic_array.bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037748,
        "dEQP-GLES3.functional.uniform_api.value.assign",
        "ed.by_pointer.render.basic_array.bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037749,
        "dEQP-GLES3.functional.uniform_api.value.assi",
        "gned.by_pointer.render.basic_array.bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037750,
        "dEQP-GLES3.functional.uniform_api.value.assigne",
        "d.by_pointer.render.basic_array.sampler2D_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037751,
        "dEQP-GLES3.functional.uniform_api.value.assigned",
        ".by_pointer.render.basic_array.sampler2D_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037752,
        "dEQP-GLES3.functional.uniform_api.value.assign",
        "ed.by_pointer.render.basic_array.sampler2D_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038110,
        "dEQP-GLES3.functional.uniform_api.value.assi",
        "gned.by_value.render.basic_array.float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038111,
        "dEQP-GLES3.functional.uniform_api.value.assig",
        "ned.by_value.render.basic_array.float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038112,
        "dEQP-GLES3.functional.uniform_api.value.ass",
        "igned.by_value.render.basic_array.float_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038113,
        "dEQP-GLES3.functional.uniform_api.value.assi",
        "gned.by_value.render.basic_array.vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038114,
        "dEQP-GLES3.functional.uniform_api.value.assig",
        "ned.by_value.render.basic_array.vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038115,
        "dEQP-GLES3.functional.uniform_api.value.ass",
        "igned.by_value.render.basic_array.vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038116,
        "dEQP-GLES3.functional.uniform_api.value.ass",
        "igned.by_value.render.basic_array.int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038117,
        "dEQP-GLES3.functional.uniform_api.value.assi",
        "gned.by_value.render.basic_array.int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038118,
        "dEQP-GLES3.functional.uniform_api.value.as",
        "signed.by_value.render.basic_array.int_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038119,
        "dEQP-GLES3.functional.uniform_api.value.assi",
        "gned.by_value.render.basic_array.ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038120,
        "dEQP-GLES3.functional.uniform_api.value.assig",
        "ned.by_value.render.basic_array.ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038121,
        "dEQP-GLES3.functional.uniform_api.value.ass",
        "igned.by_value.render.basic_array.ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038122,
        "dEQP-GLES3.functional.uniform_api.value.assi",
        "gned.by_value.render.basic_array.uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038123,
        "dEQP-GLES3.functional.uniform_api.value.assig",
        "ned.by_value.render.basic_array.uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038124,
        "dEQP-GLES3.functional.uniform_api.value.ass",
        "igned.by_value.render.basic_array.uint_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038125,
        "dEQP-GLES3.functional.uniform_api.value.assi",
        "gned.by_value.render.basic_array.uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038126,
        "dEQP-GLES3.functional.uniform_api.value.assig",
        "ned.by_value.render.basic_array.uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038127,
        "dEQP-GLES3.functional.uniform_api.value.ass",
        "igned.by_value.render.basic_array.uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038128,
        "dEQP-GLES3.functional.uniform_api.value.assi",
        "gned.by_value.render.basic_array.bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038129,
        "dEQP-GLES3.functional.uniform_api.value.assig",
        "ned.by_value.render.basic_array.bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038130,
        "dEQP-GLES3.functional.uniform_api.value.ass",
        "igned.by_value.render.basic_array.bool_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038131,
        "dEQP-GLES3.functional.uniform_api.value.assi",
        "gned.by_value.render.basic_array.bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038132,
        "dEQP-GLES3.functional.uniform_api.value.assig",
        "ned.by_value.render.basic_array.bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038133,
        "dEQP-GLES3.functional.uniform_api.value.ass",
        "igned.by_value.render.basic_array.bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038134,
        "dEQP-GLES3.functional.uniform_api.value.assign",
        "ed.by_value.render.basic_array.sampler2D_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038135,
        "dEQP-GLES3.functional.uniform_api.value.assigne",
        "d.by_value.render.basic_array.sampler2D_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038136,
        "dEQP-GLES3.functional.uniform_api.value.assig",
        "ned.by_value.render.basic_array.sampler2D_both");
