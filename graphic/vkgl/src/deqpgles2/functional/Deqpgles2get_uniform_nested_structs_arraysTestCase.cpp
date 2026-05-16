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

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014287,
        "dEQP-GLES2.functional.uniform_api.value.initial.g",
        "et_uniform.nested_structs_arrays.float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014288,
        "dEQP-GLES2.functional.uniform_api.value.initial.ge",
        "t_uniform.nested_structs_arrays.float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014289,
        "dEQP-GLES2.functional.uniform_api.value.initial.",
        "get_uniform.nested_structs_arrays.float_vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014290,
        "dEQP-GLES2.functional.uniform_api.value.initial.ge",
        "t_uniform.nested_structs_arrays.mat4_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014291,
        "dEQP-GLES2.functional.uniform_api.value.initial.g",
        "et_uniform.nested_structs_arrays.int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014292,
        "dEQP-GLES2.functional.uniform_api.value.initial.ge",
        "t_uniform.nested_structs_arrays.int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014293,
        "dEQP-GLES2.functional.uniform_api.value.initial.",
        "get_uniform.nested_structs_arrays.int_ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014294,
        "dEQP-GLES2.functional.uniform_api.value.initial.g",
        "et_uniform.nested_structs_arrays.bool_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014295,
        "dEQP-GLES2.functional.uniform_api.value.initial.ge",
        "t_uniform.nested_structs_arrays.bool_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014296,
        "dEQP-GLES2.functional.uniform_api.value.initial.",
        "get_uniform.nested_structs_arrays.bool_bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014297,
        "dEQP-GLES2.functional.uniform_api.value.initial.get_uni",
        "form.nested_structs_arrays.sampler2D_samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014298,
        "dEQP-GLES2.functional.uniform_api.value.initial.get_unif",
        "orm.nested_structs_arrays.sampler2D_samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014299,
        "dEQP-GLES2.functional.uniform_api.value.initial.get_un",
        "iform.nested_structs_arrays.sampler2D_samplerCube_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014607,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_poi",
        "nter.get_uniform.nested_structs_arrays.float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014608,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_poin",
        "ter.get_uniform.nested_structs_arrays.float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014609,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_po",
        "inter.get_uniform.nested_structs_arrays.float_vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014610,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_poin",
        "ter.get_uniform.nested_structs_arrays.mat4_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014611,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_poi",
        "nter.get_uniform.nested_structs_arrays.int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014612,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_poin",
        "ter.get_uniform.nested_structs_arrays.int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014613,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_po",
        "inter.get_uniform.nested_structs_arrays.int_ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014614,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_poi",
        "nter.get_uniform.nested_structs_arrays.bool_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014615,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_poin",
        "ter.get_uniform.nested_structs_arrays.bool_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014616,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_po",
        "inter.get_uniform.nested_structs_arrays.bool_bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014617,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_pointer.g",
        "et_uniform.nested_structs_arrays.sampler2D_samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014618,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_pointer.ge",
        "t_uniform.nested_structs_arrays.sampler2D_samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014619,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_pointer.",
        "get_uniform.nested_structs_arrays.sampler2D_samplerCube_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014915,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_va",
        "lue.get_uniform.nested_structs_arrays.float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014916,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_val",
        "ue.get_uniform.nested_structs_arrays.float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014917,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_v",
        "alue.get_uniform.nested_structs_arrays.float_vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014918,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_va",
        "lue.get_uniform.nested_structs_arrays.int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014919,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_val",
        "ue.get_uniform.nested_structs_arrays.int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014920,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_v",
        "alue.get_uniform.nested_structs_arrays.int_ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014921,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_va",
        "lue.get_uniform.nested_structs_arrays.bool_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014922,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_val",
        "ue.get_uniform.nested_structs_arrays.bool_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014923,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_v",
        "alue.get_uniform.nested_structs_arrays.bool_bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014924,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_value.ge",
        "t_uniform.nested_structs_arrays.sampler2D_samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014925,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_value.get",
        "_uniform.nested_structs_arrays.sampler2D_samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014926,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_value.g",
        "et_uniform.nested_structs_arrays.sampler2D_samplerCube_both");
