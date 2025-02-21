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

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014212,
        "dEQP-GLES2.functional.uniform_api.value.in",
        "itial.get_uniform.basic_array.float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014213,
        "dEQP-GLES2.functional.uniform_api.value.ini",
        "tial.get_uniform.basic_array.float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014214,
        "dEQP-GLES2.functional.uniform_api.value.i",
        "nitial.get_uniform.basic_array.float_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014215,
        "dEQP-GLES2.functional.uniform_api.value.i",
        "nitial.get_uniform.basic_array.vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014216,
        "dEQP-GLES2.functional.uniform_api.value.in",
        "itial.get_uniform.basic_array.vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014217,
        "dEQP-GLES2.functional.uniform_api.value.",
        "initial.get_uniform.basic_array.vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014218,
        "dEQP-GLES2.functional.uniform_api.value.i",
        "nitial.get_uniform.basic_array.mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014219,
        "dEQP-GLES2.functional.uniform_api.value.in",
        "itial.get_uniform.basic_array.mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014220,
        "dEQP-GLES2.functional.uniform_api.value.",
        "initial.get_uniform.basic_array.mat4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014221,
        "dEQP-GLES2.functional.uniform_api.value.i",
        "nitial.get_uniform.basic_array.int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014222,
        "dEQP-GLES2.functional.uniform_api.value.in",
        "itial.get_uniform.basic_array.int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014223,
        "dEQP-GLES2.functional.uniform_api.value.",
        "initial.get_uniform.basic_array.int_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014224,
        "dEQP-GLES2.functional.uniform_api.value.in",
        "itial.get_uniform.basic_array.ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014225,
        "dEQP-GLES2.functional.uniform_api.value.ini",
        "tial.get_uniform.basic_array.ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014226,
        "dEQP-GLES2.functional.uniform_api.value.i",
        "nitial.get_uniform.basic_array.ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014227,
        "dEQP-GLES2.functional.uniform_api.value.initia",
        "l.get_uniform.basic_array.bool_api_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014228,
        "dEQP-GLES2.functional.uniform_api.value.initial",
        ".get_uniform.basic_array.bool_api_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014229,
        "dEQP-GLES2.functional.uniform_api.value.initi",
        "al.get_uniform.basic_array.bool_api_float_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014230,
        "dEQP-GLES2.functional.uniform_api.value.initi",
        "al.get_uniform.basic_array.bool_api_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014231,
        "dEQP-GLES2.functional.uniform_api.value.initia",
        "l.get_uniform.basic_array.bool_api_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014232,
        "dEQP-GLES2.functional.uniform_api.value.init",
        "ial.get_uniform.basic_array.bool_api_int_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014233,
        "dEQP-GLES2.functional.uniform_api.value.initial",
        ".get_uniform.basic_array.bvec4_api_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014234,
        "dEQP-GLES2.functional.uniform_api.value.initial.",
        "get_uniform.basic_array.bvec4_api_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014235,
        "dEQP-GLES2.functional.uniform_api.value.initia",
        "l.get_uniform.basic_array.bvec4_api_float_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014236,
        "dEQP-GLES2.functional.uniform_api.value.initia",
        "l.get_uniform.basic_array.bvec4_api_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014237,
        "dEQP-GLES2.functional.uniform_api.value.initial",
        ".get_uniform.basic_array.bvec4_api_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014238,
        "dEQP-GLES2.functional.uniform_api.value.initi",
        "al.get_uniform.basic_array.bvec4_api_int_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014239,
        "dEQP-GLES2.functional.uniform_api.value.init",
        "ial.get_uniform.basic_array.sampler2D_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014240,
        "dEQP-GLES2.functional.uniform_api.value.initi",
        "al.get_uniform.basic_array.sampler2D_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014241,
        "dEQP-GLES2.functional.uniform_api.value.ini",
        "tial.get_uniform.basic_array.sampler2D_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014502,
        "dEQP-GLES2.functional.uniform_api.value.assigned",
        ".by_pointer.get_uniform.basic_array.float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014503,
        "dEQP-GLES2.functional.uniform_api.value.assigned.",
        "by_pointer.get_uniform.basic_array.float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014504,
        "dEQP-GLES2.functional.uniform_api.value.assigne",
        "d.by_pointer.get_uniform.basic_array.float_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014505,
        "dEQP-GLES2.functional.uniform_api.value.assigne",
        "d.by_pointer.get_uniform.basic_array.vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014506,
        "dEQP-GLES2.functional.uniform_api.value.assigned",
        ".by_pointer.get_uniform.basic_array.vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014507,
        "dEQP-GLES2.functional.uniform_api.value.assign",
        "ed.by_pointer.get_uniform.basic_array.vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014508,
        "dEQP-GLES2.functional.uniform_api.value.assigne",
        "d.by_pointer.get_uniform.basic_array.mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014509,
        "dEQP-GLES2.functional.uniform_api.value.assigned",
        ".by_pointer.get_uniform.basic_array.mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014510,
        "dEQP-GLES2.functional.uniform_api.value.assign",
        "ed.by_pointer.get_uniform.basic_array.mat4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014511,
        "dEQP-GLES2.functional.uniform_api.value.assigne",
        "d.by_pointer.get_uniform.basic_array.int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014512,
        "dEQP-GLES2.functional.uniform_api.value.assigned",
        ".by_pointer.get_uniform.basic_array.int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014513,
        "dEQP-GLES2.functional.uniform_api.value.assign",
        "ed.by_pointer.get_uniform.basic_array.int_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014514,
        "dEQP-GLES2.functional.uniform_api.value.assigned",
        ".by_pointer.get_uniform.basic_array.ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014515,
        "dEQP-GLES2.functional.uniform_api.value.assigned.",
        "by_pointer.get_uniform.basic_array.ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014516,
        "dEQP-GLES2.functional.uniform_api.value.assigne",
        "d.by_pointer.get_uniform.basic_array.ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014517,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_",
        "pointer.get_uniform.basic_array.bool_api_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014518,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_p",
        "ointer.get_uniform.basic_array.bool_api_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014519,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by",
        "_pointer.get_uniform.basic_array.bool_api_float_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014520,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by",
        "_pointer.get_uniform.basic_array.bool_api_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014521,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_",
        "pointer.get_uniform.basic_array.bool_api_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014522,
        "dEQP-GLES2.functional.uniform_api.value.assigned.b",
        "y_pointer.get_uniform.basic_array.bool_api_int_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014523,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_p",
        "ointer.get_uniform.basic_array.bvec4_api_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014524,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_po",
        "inter.get_uniform.basic_array.bvec4_api_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014525,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_",
        "pointer.get_uniform.basic_array.bvec4_api_float_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014526,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_",
        "pointer.get_uniform.basic_array.bvec4_api_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014527,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_p",
        "ointer.get_uniform.basic_array.bvec4_api_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014528,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by",
        "_pointer.get_uniform.basic_array.bvec4_api_int_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014529,
        "dEQP-GLES2.functional.uniform_api.value.assigned.b",
        "y_pointer.get_uniform.basic_array.sampler2D_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014530,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by",
        "_pointer.get_uniform.basic_array.sampler2D_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014531,
        "dEQP-GLES2.functional.uniform_api.value.assigned.",
        "by_pointer.get_uniform.basic_array.sampler2D_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014825,
        "dEQP-GLES2.functional.uniform_api.value.assigne",
        "d.by_value.get_uniform.basic_array.float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014826,
        "dEQP-GLES2.functional.uniform_api.value.assigned",
        ".by_value.get_uniform.basic_array.float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014827,
        "dEQP-GLES2.functional.uniform_api.value.assign",
        "ed.by_value.get_uniform.basic_array.float_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014828,
        "dEQP-GLES2.functional.uniform_api.value.assign",
        "ed.by_value.get_uniform.basic_array.vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014829,
        "dEQP-GLES2.functional.uniform_api.value.assigne",
        "d.by_value.get_uniform.basic_array.vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014830,
        "dEQP-GLES2.functional.uniform_api.value.assig",
        "ned.by_value.get_uniform.basic_array.vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014831,
        "dEQP-GLES2.functional.uniform_api.value.assign",
        "ed.by_value.get_uniform.basic_array.int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014832,
        "dEQP-GLES2.functional.uniform_api.value.assigne",
        "d.by_value.get_uniform.basic_array.int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014833,
        "dEQP-GLES2.functional.uniform_api.value.assig",
        "ned.by_value.get_uniform.basic_array.int_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014834,
        "dEQP-GLES2.functional.uniform_api.value.assigne",
        "d.by_value.get_uniform.basic_array.ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014835,
        "dEQP-GLES2.functional.uniform_api.value.assigned",
        ".by_value.get_uniform.basic_array.ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014836,
        "dEQP-GLES2.functional.uniform_api.value.assign",
        "ed.by_value.get_uniform.basic_array.ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014837,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by",
        "_value.get_uniform.basic_array.bool_api_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014838,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_",
        "value.get_uniform.basic_array.bool_api_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014839,
        "dEQP-GLES2.functional.uniform_api.value.assigned.b",
        "y_value.get_uniform.basic_array.bool_api_float_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014840,
        "dEQP-GLES2.functional.uniform_api.value.assigned.b",
        "y_value.get_uniform.basic_array.bool_api_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014841,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by",
        "_value.get_uniform.basic_array.bool_api_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014842,
        "dEQP-GLES2.functional.uniform_api.value.assigned.",
        "by_value.get_uniform.basic_array.bool_api_int_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014843,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_",
        "value.get_uniform.basic_array.bvec4_api_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014844,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_v",
        "alue.get_uniform.basic_array.bvec4_api_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014845,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by",
        "_value.get_uniform.basic_array.bvec4_api_float_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014846,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by",
        "_value.get_uniform.basic_array.bvec4_api_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014847,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_",
        "value.get_uniform.basic_array.bvec4_api_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014848,
        "dEQP-GLES2.functional.uniform_api.value.assigned.b",
        "y_value.get_uniform.basic_array.bvec4_api_int_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014849,
        "dEQP-GLES2.functional.uniform_api.value.assigned.",
        "by_value.get_uniform.basic_array.sampler2D_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014850,
        "dEQP-GLES2.functional.uniform_api.value.assigned.b",
        "y_value.get_uniform.basic_array.sampler2D_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014851,
        "dEQP-GLES2.functional.uniform_api.value.assigned",
        ".by_value.get_uniform.basic_array.sampler2D_both");
