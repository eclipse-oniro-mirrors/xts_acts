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

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037084,
        "dEQP-GLES3.functional.uniform_api.value.initia",
        "l.get_uniform.array_in_struct.float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037085,
        "dEQP-GLES3.functional.uniform_api.value.initial",
        ".get_uniform.array_in_struct.float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037086,
        "dEQP-GLES3.functional.uniform_api.value.initi",
        "al.get_uniform.array_in_struct.float_vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037087,
        "dEQP-GLES3.functional.uniform_api.value.initia",
        "l.get_uniform.array_in_struct.mat4_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037088,
        "dEQP-GLES3.functional.uniform_api.value.initial",
        ".get_uniform.array_in_struct.mat4_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037089,
        "dEQP-GLES3.functional.uniform_api.value.initi",
        "al.get_uniform.array_in_struct.mat4_mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037090,
        "dEQP-GLES3.functional.uniform_api.value.initia",
        "l.get_uniform.array_in_struct.int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037091,
        "dEQP-GLES3.functional.uniform_api.value.initial",
        ".get_uniform.array_in_struct.int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037092,
        "dEQP-GLES3.functional.uniform_api.value.initi",
        "al.get_uniform.array_in_struct.int_ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037093,
        "dEQP-GLES3.functional.uniform_api.value.initia",
        "l.get_uniform.array_in_struct.uint_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037094,
        "dEQP-GLES3.functional.uniform_api.value.initial",
        ".get_uniform.array_in_struct.uint_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037095,
        "dEQP-GLES3.functional.uniform_api.value.initi",
        "al.get_uniform.array_in_struct.uint_uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037096,
        "dEQP-GLES3.functional.uniform_api.value.initia",
        "l.get_uniform.array_in_struct.bool_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037097,
        "dEQP-GLES3.functional.uniform_api.value.initial",
        ".get_uniform.array_in_struct.bool_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037098,
        "dEQP-GLES3.functional.uniform_api.value.initi",
        "al.get_uniform.array_in_struct.bool_bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037099,
        "dEQP-GLES3.functional.uniform_api.value.initial.get_",
        "uniform.array_in_struct.sampler2D_samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037100,
        "dEQP-GLES3.functional.uniform_api.value.initial.get_u",
        "niform.array_in_struct.sampler2D_samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037101,
        "dEQP-GLES3.functional.uniform_api.value.initial.get",
        "_uniform.array_in_struct.sampler2D_samplerCube_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037567,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_",
        "pointer.get_uniform.array_in_struct.float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037568,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_p",
        "ointer.get_uniform.array_in_struct.float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037569,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by",
        "_pointer.get_uniform.array_in_struct.float_vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037570,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_",
        "pointer.get_uniform.array_in_struct.mat4_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037571,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_p",
        "ointer.get_uniform.array_in_struct.mat4_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037572,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by",
        "_pointer.get_uniform.array_in_struct.mat4_mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037573,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_",
        "pointer.get_uniform.array_in_struct.int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037574,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_p",
        "ointer.get_uniform.array_in_struct.int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037575,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by",
        "_pointer.get_uniform.array_in_struct.int_ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037576,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_",
        "pointer.get_uniform.array_in_struct.uint_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037577,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_p",
        "ointer.get_uniform.array_in_struct.uint_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037578,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by",
        "_pointer.get_uniform.array_in_struct.uint_uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037579,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_",
        "pointer.get_uniform.array_in_struct.bool_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037580,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_p",
        "ointer.get_uniform.array_in_struct.bool_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037581,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by",
        "_pointer.get_uniform.array_in_struct.bool_bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037582,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointe",
        "r.get_uniform.array_in_struct.sampler2D_samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037583,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer",
        ".get_uniform.array_in_struct.sampler2D_samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037584,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_point",
        "er.get_uniform.array_in_struct.sampler2D_samplerCube_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038020,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by",
        "_value.get_uniform.array_in_struct.float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038021,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_",
        "value.get_uniform.array_in_struct.float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038022,
        "dEQP-GLES3.functional.uniform_api.value.assigned.b",
        "y_value.get_uniform.array_in_struct.float_vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038023,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by",
        "_value.get_uniform.array_in_struct.int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038024,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_",
        "value.get_uniform.array_in_struct.int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038025,
        "dEQP-GLES3.functional.uniform_api.value.assigned.b",
        "y_value.get_uniform.array_in_struct.int_ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038026,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by",
        "_value.get_uniform.array_in_struct.uint_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038027,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_",
        "value.get_uniform.array_in_struct.uint_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038028,
        "dEQP-GLES3.functional.uniform_api.value.assigned.b",
        "y_value.get_uniform.array_in_struct.uint_uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038029,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by",
        "_value.get_uniform.array_in_struct.bool_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038030,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_",
        "value.get_uniform.array_in_struct.bool_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038031,
        "dEQP-GLES3.functional.uniform_api.value.assigned.b",
        "y_value.get_uniform.array_in_struct.bool_bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038032,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_value",
        ".get_uniform.array_in_struct.sampler2D_samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038033,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_value.",
        "get_uniform.array_in_struct.sampler2D_samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038034,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_valu",
        "e.get_uniform.array_in_struct.sampler2D_samplerCube_both");
