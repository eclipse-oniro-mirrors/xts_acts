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

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037102,
        "dEQP-GLES3.functional.uniform_api.value.initial.g",
        "et_uniform.nested_structs_arrays.float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037103,
        "dEQP-GLES3.functional.uniform_api.value.initial.ge",
        "t_uniform.nested_structs_arrays.float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037104,
        "dEQP-GLES3.functional.uniform_api.value.initial.",
        "get_uniform.nested_structs_arrays.float_vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037105,
        "dEQP-GLES3.functional.uniform_api.value.initial.g",
        "et_uniform.nested_structs_arrays.mat4_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037106,
        "dEQP-GLES3.functional.uniform_api.value.initial.ge",
        "t_uniform.nested_structs_arrays.mat4_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037107,
        "dEQP-GLES3.functional.uniform_api.value.initial.",
        "get_uniform.nested_structs_arrays.mat4_mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037108,
        "dEQP-GLES3.functional.uniform_api.value.initial.g",
        "et_uniform.nested_structs_arrays.int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037109,
        "dEQP-GLES3.functional.uniform_api.value.initial.ge",
        "t_uniform.nested_structs_arrays.int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037110,
        "dEQP-GLES3.functional.uniform_api.value.initial.",
        "get_uniform.nested_structs_arrays.int_ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037111,
        "dEQP-GLES3.functional.uniform_api.value.initial.g",
        "et_uniform.nested_structs_arrays.uint_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037112,
        "dEQP-GLES3.functional.uniform_api.value.initial.ge",
        "t_uniform.nested_structs_arrays.uint_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037113,
        "dEQP-GLES3.functional.uniform_api.value.initial.",
        "get_uniform.nested_structs_arrays.uint_uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037114,
        "dEQP-GLES3.functional.uniform_api.value.initial.g",
        "et_uniform.nested_structs_arrays.bool_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037115,
        "dEQP-GLES3.functional.uniform_api.value.initial.ge",
        "t_uniform.nested_structs_arrays.bool_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037116,
        "dEQP-GLES3.functional.uniform_api.value.initial.",
        "get_uniform.nested_structs_arrays.bool_bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037117,
        "dEQP-GLES3.functional.uniform_api.value.initial.get_uni",
        "form.nested_structs_arrays.sampler2D_samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037118,
        "dEQP-GLES3.functional.uniform_api.value.initial.get_unif",
        "orm.nested_structs_arrays.sampler2D_samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037119,
        "dEQP-GLES3.functional.uniform_api.value.initial.get_un",
        "iform.nested_structs_arrays.sampler2D_samplerCube_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037585,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_poi",
        "nter.get_uniform.nested_structs_arrays.float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037586,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_poin",
        "ter.get_uniform.nested_structs_arrays.float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037587,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_po",
        "inter.get_uniform.nested_structs_arrays.float_vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037588,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_poi",
        "nter.get_uniform.nested_structs_arrays.mat4_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037589,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_poin",
        "ter.get_uniform.nested_structs_arrays.mat4_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037590,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_po",
        "inter.get_uniform.nested_structs_arrays.mat4_mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037591,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_poi",
        "nter.get_uniform.nested_structs_arrays.int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037592,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_poin",
        "ter.get_uniform.nested_structs_arrays.int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037593,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_po",
        "inter.get_uniform.nested_structs_arrays.int_ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037594,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_poi",
        "nter.get_uniform.nested_structs_arrays.uint_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037595,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_poin",
        "ter.get_uniform.nested_structs_arrays.uint_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037596,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_po",
        "inter.get_uniform.nested_structs_arrays.uint_uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037597,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_poi",
        "nter.get_uniform.nested_structs_arrays.bool_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037598,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_poin",
        "ter.get_uniform.nested_structs_arrays.bool_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037599,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_po",
        "inter.get_uniform.nested_structs_arrays.bool_bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037600,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer.g",
        "et_uniform.nested_structs_arrays.sampler2D_samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037601,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer.ge",
        "t_uniform.nested_structs_arrays.sampler2D_samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037602,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer.",
        "get_uniform.nested_structs_arrays.sampler2D_samplerCube_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038035,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_va",
        "lue.get_uniform.nested_structs_arrays.float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038036,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_val",
        "ue.get_uniform.nested_structs_arrays.float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038037,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_v",
        "alue.get_uniform.nested_structs_arrays.float_vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038038,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_va",
        "lue.get_uniform.nested_structs_arrays.int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038039,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_val",
        "ue.get_uniform.nested_structs_arrays.int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038040,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_v",
        "alue.get_uniform.nested_structs_arrays.int_ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038041,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_va",
        "lue.get_uniform.nested_structs_arrays.uint_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038042,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_val",
        "ue.get_uniform.nested_structs_arrays.uint_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038043,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_v",
        "alue.get_uniform.nested_structs_arrays.uint_uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038044,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_va",
        "lue.get_uniform.nested_structs_arrays.bool_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038045,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_val",
        "ue.get_uniform.nested_structs_arrays.bool_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038046,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_v",
        "alue.get_uniform.nested_structs_arrays.bool_bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038047,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_value.ge",
        "t_uniform.nested_structs_arrays.sampler2D_samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038048,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_value.get",
        "_uniform.nested_structs_arrays.sampler2D_samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038049,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_value.g",
        "et_uniform.nested_structs_arrays.sampler2D_samplerCube_both");
