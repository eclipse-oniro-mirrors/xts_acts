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

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037270,
        "dEQP-GLES3.functional.uniform_api.value.init",
        "ial.render.array_in_struct.float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037271,
        "dEQP-GLES3.functional.uniform_api.value.initi",
        "al.render.array_in_struct.float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037272,
        "dEQP-GLES3.functional.uniform_api.value.ini",
        "tial.render.array_in_struct.float_vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037273,
        "dEQP-GLES3.functional.uniform_api.value.ini",
        "tial.render.array_in_struct.mat4_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037274,
        "dEQP-GLES3.functional.uniform_api.value.init",
        "ial.render.array_in_struct.mat4_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037275,
        "dEQP-GLES3.functional.uniform_api.value.in",
        "itial.render.array_in_struct.mat4_mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037276,
        "dEQP-GLES3.functional.uniform_api.value.ini",
        "tial.render.array_in_struct.int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037277,
        "dEQP-GLES3.functional.uniform_api.value.init",
        "ial.render.array_in_struct.int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037278,
        "dEQP-GLES3.functional.uniform_api.value.in",
        "itial.render.array_in_struct.int_ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037279,
        "dEQP-GLES3.functional.uniform_api.value.init",
        "ial.render.array_in_struct.uint_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037280,
        "dEQP-GLES3.functional.uniform_api.value.initi",
        "al.render.array_in_struct.uint_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037281,
        "dEQP-GLES3.functional.uniform_api.value.ini",
        "tial.render.array_in_struct.uint_uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037282,
        "dEQP-GLES3.functional.uniform_api.value.init",
        "ial.render.array_in_struct.bool_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037283,
        "dEQP-GLES3.functional.uniform_api.value.initi",
        "al.render.array_in_struct.bool_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037284,
        "dEQP-GLES3.functional.uniform_api.value.ini",
        "tial.render.array_in_struct.bool_bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037789,
        "dEQP-GLES3.functional.uniform_api.value.assigned.b",
        "y_pointer.render.array_in_struct.float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037790,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by",
        "_pointer.render.array_in_struct.float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037791,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "by_pointer.render.array_in_struct.float_vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037792,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "by_pointer.render.array_in_struct.mat4_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037793,
        "dEQP-GLES3.functional.uniform_api.value.assigned.b",
        "y_pointer.render.array_in_struct.mat4_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037794,
        "dEQP-GLES3.functional.uniform_api.value.assigned",
        ".by_pointer.render.array_in_struct.mat4_mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037795,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "by_pointer.render.array_in_struct.int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037796,
        "dEQP-GLES3.functional.uniform_api.value.assigned.b",
        "y_pointer.render.array_in_struct.int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037797,
        "dEQP-GLES3.functional.uniform_api.value.assigned",
        ".by_pointer.render.array_in_struct.int_ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037798,
        "dEQP-GLES3.functional.uniform_api.value.assigned.b",
        "y_pointer.render.array_in_struct.uint_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037799,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by",
        "_pointer.render.array_in_struct.uint_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037800,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "by_pointer.render.array_in_struct.uint_uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037801,
        "dEQP-GLES3.functional.uniform_api.value.assigned.b",
        "y_pointer.render.array_in_struct.bool_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037802,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by",
        "_pointer.render.array_in_struct.bool_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037803,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "by_pointer.render.array_in_struct.bool_bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037804,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_poi",
        "nter.render.array_in_struct.sampler2D_samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037805,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_poin",
        "ter.render.array_in_struct.sampler2D_samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037806,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_po",
        "inter.render.array_in_struct.sampler2D_samplerCube_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038167,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "by_value.render.array_in_struct.float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038168,
        "dEQP-GLES3.functional.uniform_api.value.assigned.b",
        "y_value.render.array_in_struct.float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038169,
        "dEQP-GLES3.functional.uniform_api.value.assigned",
        ".by_value.render.array_in_struct.float_vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038170,
        "dEQP-GLES3.functional.uniform_api.value.assigned",
        ".by_value.render.array_in_struct.int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038171,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "by_value.render.array_in_struct.int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038172,
        "dEQP-GLES3.functional.uniform_api.value.assigne",
        "d.by_value.render.array_in_struct.int_ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038173,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "by_value.render.array_in_struct.uint_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038174,
        "dEQP-GLES3.functional.uniform_api.value.assigned.b",
        "y_value.render.array_in_struct.uint_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038175,
        "dEQP-GLES3.functional.uniform_api.value.assigned",
        ".by_value.render.array_in_struct.uint_uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038176,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "by_value.render.array_in_struct.bool_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038177,
        "dEQP-GLES3.functional.uniform_api.value.assigned.b",
        "y_value.render.array_in_struct.bool_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038178,
        "dEQP-GLES3.functional.uniform_api.value.assigned",
        ".by_value.render.array_in_struct.bool_bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038179,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_va",
        "lue.render.array_in_struct.sampler2D_samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038180,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_val",
        "ue.render.array_in_struct.sampler2D_samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038181,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_v",
        "alue.render.array_in_struct.sampler2D_samplerCube_both");
