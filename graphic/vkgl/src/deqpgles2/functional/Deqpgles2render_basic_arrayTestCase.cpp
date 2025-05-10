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

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014360,
        "dEQP-GLES2.functional.uniform_api.value",
        ".initial.render.basic_array.float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014361,
        "dEQP-GLES2.functional.uniform_api.value.",
        "initial.render.basic_array.float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014362,
        "dEQP-GLES2.functional.uniform_api.valu",
        "e.initial.render.basic_array.float_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014363,
        "dEQP-GLES2.functional.uniform_api.value",
        ".initial.render.basic_array.vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014364,
        "dEQP-GLES2.functional.uniform_api.value.",
        "initial.render.basic_array.vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014365,
        "dEQP-GLES2.functional.uniform_api.valu",
        "e.initial.render.basic_array.vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014366,
        "dEQP-GLES2.functional.uniform_api.value",
        ".initial.render.basic_array.mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014367,
        "dEQP-GLES2.functional.uniform_api.value.",
        "initial.render.basic_array.mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014368,
        "dEQP-GLES2.functional.uniform_api.valu",
        "e.initial.render.basic_array.mat4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014369,
        "dEQP-GLES2.functional.uniform_api.valu",
        "e.initial.render.basic_array.int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014370,
        "dEQP-GLES2.functional.uniform_api.value",
        ".initial.render.basic_array.int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014371,
        "dEQP-GLES2.functional.uniform_api.val",
        "ue.initial.render.basic_array.int_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014372,
        "dEQP-GLES2.functional.uniform_api.value",
        ".initial.render.basic_array.ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014373,
        "dEQP-GLES2.functional.uniform_api.value.",
        "initial.render.basic_array.ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014374,
        "dEQP-GLES2.functional.uniform_api.valu",
        "e.initial.render.basic_array.ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014375,
        "dEQP-GLES2.functional.uniform_api.value",
        ".initial.render.basic_array.bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014376,
        "dEQP-GLES2.functional.uniform_api.value.",
        "initial.render.basic_array.bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014377,
        "dEQP-GLES2.functional.uniform_api.valu",
        "e.initial.render.basic_array.bool_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014378,
        "dEQP-GLES2.functional.uniform_api.value",
        ".initial.render.basic_array.bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014379,
        "dEQP-GLES2.functional.uniform_api.value.",
        "initial.render.basic_array.bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014380,
        "dEQP-GLES2.functional.uniform_api.valu",
        "e.initial.render.basic_array.bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014381,
        "dEQP-GLES2.functional.uniform_api.value.i",
        "nitial.render.basic_array.sampler2D_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014382,
        "dEQP-GLES2.functional.uniform_api.value.in",
        "itial.render.basic_array.sampler2D_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014383,
        "dEQP-GLES2.functional.uniform_api.value.",
        "initial.render.basic_array.sampler2D_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014680,
        "dEQP-GLES2.functional.uniform_api.value.assig",
        "ned.by_pointer.render.basic_array.float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014681,
        "dEQP-GLES2.functional.uniform_api.value.assign",
        "ed.by_pointer.render.basic_array.float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014682,
        "dEQP-GLES2.functional.uniform_api.value.assi",
        "gned.by_pointer.render.basic_array.float_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014683,
        "dEQP-GLES2.functional.uniform_api.value.assig",
        "ned.by_pointer.render.basic_array.vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014684,
        "dEQP-GLES2.functional.uniform_api.value.assign",
        "ed.by_pointer.render.basic_array.vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014685,
        "dEQP-GLES2.functional.uniform_api.value.assi",
        "gned.by_pointer.render.basic_array.vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014686,
        "dEQP-GLES2.functional.uniform_api.value.assig",
        "ned.by_pointer.render.basic_array.mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014687,
        "dEQP-GLES2.functional.uniform_api.value.assign",
        "ed.by_pointer.render.basic_array.mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014688,
        "dEQP-GLES2.functional.uniform_api.value.assi",
        "gned.by_pointer.render.basic_array.mat4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014689,
        "dEQP-GLES2.functional.uniform_api.value.assi",
        "gned.by_pointer.render.basic_array.int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014690,
        "dEQP-GLES2.functional.uniform_api.value.assig",
        "ned.by_pointer.render.basic_array.int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014691,
        "dEQP-GLES2.functional.uniform_api.value.ass",
        "igned.by_pointer.render.basic_array.int_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014692,
        "dEQP-GLES2.functional.uniform_api.value.assig",
        "ned.by_pointer.render.basic_array.ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014693,
        "dEQP-GLES2.functional.uniform_api.value.assign",
        "ed.by_pointer.render.basic_array.ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014694,
        "dEQP-GLES2.functional.uniform_api.value.assi",
        "gned.by_pointer.render.basic_array.ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014695,
        "dEQP-GLES2.functional.uniform_api.value.assig",
        "ned.by_pointer.render.basic_array.bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014696,
        "dEQP-GLES2.functional.uniform_api.value.assign",
        "ed.by_pointer.render.basic_array.bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014697,
        "dEQP-GLES2.functional.uniform_api.value.assi",
        "gned.by_pointer.render.basic_array.bool_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014698,
        "dEQP-GLES2.functional.uniform_api.value.assig",
        "ned.by_pointer.render.basic_array.bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014699,
        "dEQP-GLES2.functional.uniform_api.value.assign",
        "ed.by_pointer.render.basic_array.bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014700,
        "dEQP-GLES2.functional.uniform_api.value.assi",
        "gned.by_pointer.render.basic_array.bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014701,
        "dEQP-GLES2.functional.uniform_api.value.assigne",
        "d.by_pointer.render.basic_array.sampler2D_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014702,
        "dEQP-GLES2.functional.uniform_api.value.assigned",
        ".by_pointer.render.basic_array.sampler2D_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014703,
        "dEQP-GLES2.functional.uniform_api.value.assign",
        "ed.by_pointer.render.basic_array.sampler2D_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014975,
        "dEQP-GLES2.functional.uniform_api.value.assi",
        "gned.by_value.render.basic_array.float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014976,
        "dEQP-GLES2.functional.uniform_api.value.assig",
        "ned.by_value.render.basic_array.float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014977,
        "dEQP-GLES2.functional.uniform_api.value.ass",
        "igned.by_value.render.basic_array.float_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014978,
        "dEQP-GLES2.functional.uniform_api.value.assi",
        "gned.by_value.render.basic_array.vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014979,
        "dEQP-GLES2.functional.uniform_api.value.assig",
        "ned.by_value.render.basic_array.vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014980,
        "dEQP-GLES2.functional.uniform_api.value.ass",
        "igned.by_value.render.basic_array.vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014981,
        "dEQP-GLES2.functional.uniform_api.value.ass",
        "igned.by_value.render.basic_array.int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014982,
        "dEQP-GLES2.functional.uniform_api.value.assi",
        "gned.by_value.render.basic_array.int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014983,
        "dEQP-GLES2.functional.uniform_api.value.as",
        "signed.by_value.render.basic_array.int_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014984,
        "dEQP-GLES2.functional.uniform_api.value.assi",
        "gned.by_value.render.basic_array.ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014985,
        "dEQP-GLES2.functional.uniform_api.value.assig",
        "ned.by_value.render.basic_array.ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014986,
        "dEQP-GLES2.functional.uniform_api.value.ass",
        "igned.by_value.render.basic_array.ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014987,
        "dEQP-GLES2.functional.uniform_api.value.assi",
        "gned.by_value.render.basic_array.bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014988,
        "dEQP-GLES2.functional.uniform_api.value.assig",
        "ned.by_value.render.basic_array.bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014989,
        "dEQP-GLES2.functional.uniform_api.value.ass",
        "igned.by_value.render.basic_array.bool_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014990,
        "dEQP-GLES2.functional.uniform_api.value.assi",
        "gned.by_value.render.basic_array.bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014991,
        "dEQP-GLES2.functional.uniform_api.value.assig",
        "ned.by_value.render.basic_array.bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014992,
        "dEQP-GLES2.functional.uniform_api.value.ass",
        "igned.by_value.render.basic_array.bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014993,
        "dEQP-GLES2.functional.uniform_api.value.assign",
        "ed.by_value.render.basic_array.sampler2D_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014994,
        "dEQP-GLES2.functional.uniform_api.value.assigne",
        "d.by_value.render.basic_array.sampler2D_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014995,
        "dEQP-GLES2.functional.uniform_api.value.assig",
        "ned.by_value.render.basic_array.sampler2D_both");
