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

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014257,
        "dEQP-GLES2.functional.uniform_api.value.initia",
        "l.get_uniform.struct_in_array.float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014258,
        "dEQP-GLES2.functional.uniform_api.value.initial",
        ".get_uniform.struct_in_array.float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014259,
        "dEQP-GLES2.functional.uniform_api.value.initi",
        "al.get_uniform.struct_in_array.float_vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014260,
        "dEQP-GLES2.functional.uniform_api.value.initia",
        "l.get_uniform.struct_in_array.mat4_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014261,
        "dEQP-GLES2.functional.uniform_api.value.initial",
        ".get_uniform.struct_in_array.mat4_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014262,
        "dEQP-GLES2.functional.uniform_api.value.initi",
        "al.get_uniform.struct_in_array.mat4_mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014263,
        "dEQP-GLES2.functional.uniform_api.value.initia",
        "l.get_uniform.struct_in_array.int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014264,
        "dEQP-GLES2.functional.uniform_api.value.initial",
        ".get_uniform.struct_in_array.int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014265,
        "dEQP-GLES2.functional.uniform_api.value.initi",
        "al.get_uniform.struct_in_array.int_ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014266,
        "dEQP-GLES2.functional.uniform_api.value.initia",
        "l.get_uniform.struct_in_array.bool_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014267,
        "dEQP-GLES2.functional.uniform_api.value.initial",
        ".get_uniform.struct_in_array.bool_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014268,
        "dEQP-GLES2.functional.uniform_api.value.initi",
        "al.get_uniform.struct_in_array.bool_bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014269,
        "dEQP-GLES2.functional.uniform_api.value.initial.get_",
        "uniform.struct_in_array.sampler2D_samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014270,
        "dEQP-GLES2.functional.uniform_api.value.initial.get_u",
        "niform.struct_in_array.sampler2D_samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014271,
        "dEQP-GLES2.functional.uniform_api.value.initial.get",
        "_uniform.struct_in_array.sampler2D_samplerCube_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014577,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_",
        "pointer.get_uniform.struct_in_array.float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014578,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_p",
        "ointer.get_uniform.struct_in_array.float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014579,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by",
        "_pointer.get_uniform.struct_in_array.float_vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014580,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_",
        "pointer.get_uniform.struct_in_array.mat4_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014581,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_p",
        "ointer.get_uniform.struct_in_array.mat4_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014582,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by",
        "_pointer.get_uniform.struct_in_array.mat4_mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014583,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_",
        "pointer.get_uniform.struct_in_array.int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014584,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_p",
        "ointer.get_uniform.struct_in_array.int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014585,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by",
        "_pointer.get_uniform.struct_in_array.int_ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014586,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_",
        "pointer.get_uniform.struct_in_array.bool_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014587,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_p",
        "ointer.get_uniform.struct_in_array.bool_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014588,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by",
        "_pointer.get_uniform.struct_in_array.bool_bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014589,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_pointe",
        "r.get_uniform.struct_in_array.sampler2D_samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014590,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_pointer",
        ".get_uniform.struct_in_array.sampler2D_samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014591,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_point",
        "er.get_uniform.struct_in_array.sampler2D_samplerCube_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014891,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by",
        "_value.get_uniform.struct_in_array.float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014892,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_",
        "value.get_uniform.struct_in_array.float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014893,
        "dEQP-GLES2.functional.uniform_api.value.assigned.b",
        "y_value.get_uniform.struct_in_array.float_vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014894,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by",
        "_value.get_uniform.struct_in_array.int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014895,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_",
        "value.get_uniform.struct_in_array.int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014896,
        "dEQP-GLES2.functional.uniform_api.value.assigned.b",
        "y_value.get_uniform.struct_in_array.int_ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014897,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by",
        "_value.get_uniform.struct_in_array.bool_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014898,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_",
        "value.get_uniform.struct_in_array.bool_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014899,
        "dEQP-GLES2.functional.uniform_api.value.assigned.b",
        "y_value.get_uniform.struct_in_array.bool_bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014900,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_value",
        ".get_uniform.struct_in_array.sampler2D_samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014901,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_value.",
        "get_uniform.struct_in_array.sampler2D_samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014902,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_valu",
        "e.get_uniform.struct_in_array.sampler2D_samplerCube_both");
