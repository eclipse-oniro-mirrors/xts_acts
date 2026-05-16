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

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037066,
        "dEQP-GLES3.functional.uniform_api.value.initia",
        "l.get_uniform.struct_in_array.float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037067,
        "dEQP-GLES3.functional.uniform_api.value.initial",
        ".get_uniform.struct_in_array.float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037068,
        "dEQP-GLES3.functional.uniform_api.value.initi",
        "al.get_uniform.struct_in_array.float_vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037069,
        "dEQP-GLES3.functional.uniform_api.value.initia",
        "l.get_uniform.struct_in_array.mat4_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037070,
        "dEQP-GLES3.functional.uniform_api.value.initial",
        ".get_uniform.struct_in_array.mat4_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037071,
        "dEQP-GLES3.functional.uniform_api.value.initi",
        "al.get_uniform.struct_in_array.mat4_mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037072,
        "dEQP-GLES3.functional.uniform_api.value.initia",
        "l.get_uniform.struct_in_array.int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037073,
        "dEQP-GLES3.functional.uniform_api.value.initial",
        ".get_uniform.struct_in_array.int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037074,
        "dEQP-GLES3.functional.uniform_api.value.initi",
        "al.get_uniform.struct_in_array.int_ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037075,
        "dEQP-GLES3.functional.uniform_api.value.initia",
        "l.get_uniform.struct_in_array.uint_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037076,
        "dEQP-GLES3.functional.uniform_api.value.initial",
        ".get_uniform.struct_in_array.uint_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037077,
        "dEQP-GLES3.functional.uniform_api.value.initi",
        "al.get_uniform.struct_in_array.uint_uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037078,
        "dEQP-GLES3.functional.uniform_api.value.initia",
        "l.get_uniform.struct_in_array.bool_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037079,
        "dEQP-GLES3.functional.uniform_api.value.initial",
        ".get_uniform.struct_in_array.bool_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037080,
        "dEQP-GLES3.functional.uniform_api.value.initi",
        "al.get_uniform.struct_in_array.bool_bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037081,
        "dEQP-GLES3.functional.uniform_api.value.initial.get_",
        "uniform.struct_in_array.sampler2D_samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037082,
        "dEQP-GLES3.functional.uniform_api.value.initial.get_u",
        "niform.struct_in_array.sampler2D_samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037083,
        "dEQP-GLES3.functional.uniform_api.value.initial.get",
        "_uniform.struct_in_array.sampler2D_samplerCube_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037549,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_",
        "pointer.get_uniform.struct_in_array.float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037550,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_p",
        "ointer.get_uniform.struct_in_array.float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037551,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by",
        "_pointer.get_uniform.struct_in_array.float_vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037552,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_",
        "pointer.get_uniform.struct_in_array.mat4_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037553,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_p",
        "ointer.get_uniform.struct_in_array.mat4_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037554,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by",
        "_pointer.get_uniform.struct_in_array.mat4_mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037555,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_",
        "pointer.get_uniform.struct_in_array.int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037556,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_p",
        "ointer.get_uniform.struct_in_array.int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037557,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by",
        "_pointer.get_uniform.struct_in_array.int_ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037558,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_",
        "pointer.get_uniform.struct_in_array.uint_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037559,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_p",
        "ointer.get_uniform.struct_in_array.uint_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037560,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by",
        "_pointer.get_uniform.struct_in_array.uint_uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037561,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_",
        "pointer.get_uniform.struct_in_array.bool_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037562,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_p",
        "ointer.get_uniform.struct_in_array.bool_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037563,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by",
        "_pointer.get_uniform.struct_in_array.bool_bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037564,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointe",
        "r.get_uniform.struct_in_array.sampler2D_samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037565,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer",
        ".get_uniform.struct_in_array.sampler2D_samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037566,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_point",
        "er.get_uniform.struct_in_array.sampler2D_samplerCube_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038005,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by",
        "_value.get_uniform.struct_in_array.float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038006,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_",
        "value.get_uniform.struct_in_array.float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038007,
        "dEQP-GLES3.functional.uniform_api.value.assigned.b",
        "y_value.get_uniform.struct_in_array.float_vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038008,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by",
        "_value.get_uniform.struct_in_array.int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038009,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_",
        "value.get_uniform.struct_in_array.int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038010,
        "dEQP-GLES3.functional.uniform_api.value.assigned.b",
        "y_value.get_uniform.struct_in_array.int_ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038011,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by",
        "_value.get_uniform.struct_in_array.uint_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038012,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_",
        "value.get_uniform.struct_in_array.uint_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038013,
        "dEQP-GLES3.functional.uniform_api.value.assigned.b",
        "y_value.get_uniform.struct_in_array.uint_uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038014,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by",
        "_value.get_uniform.struct_in_array.bool_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038015,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_",
        "value.get_uniform.struct_in_array.bool_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038016,
        "dEQP-GLES3.functional.uniform_api.value.assigned.b",
        "y_value.get_uniform.struct_in_array.bool_bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038017,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_value",
        ".get_uniform.struct_in_array.sampler2D_samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038018,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_value.",
        "get_uniform.struct_in_array.sampler2D_samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038019,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_valu",
        "e.get_uniform.struct_in_array.sampler2D_samplerCube_both");
