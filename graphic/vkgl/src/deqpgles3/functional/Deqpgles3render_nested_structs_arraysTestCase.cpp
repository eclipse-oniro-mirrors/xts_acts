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

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037285,
        "dEQP-GLES3.functional.uniform_api.value.initial",
        ".render.nested_structs_arrays.float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037286,
        "dEQP-GLES3.functional.uniform_api.value.initial.",
        "render.nested_structs_arrays.float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037287,
        "dEQP-GLES3.functional.uniform_api.value.initia",
        "l.render.nested_structs_arrays.float_vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037288,
        "dEQP-GLES3.functional.uniform_api.value.initia",
        "l.render.nested_structs_arrays.mat4_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037289,
        "dEQP-GLES3.functional.uniform_api.value.initial",
        ".render.nested_structs_arrays.mat4_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037290,
        "dEQP-GLES3.functional.uniform_api.value.initi",
        "al.render.nested_structs_arrays.mat4_mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037291,
        "dEQP-GLES3.functional.uniform_api.value.initia",
        "l.render.nested_structs_arrays.int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037292,
        "dEQP-GLES3.functional.uniform_api.value.initial",
        ".render.nested_structs_arrays.int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037293,
        "dEQP-GLES3.functional.uniform_api.value.initi",
        "al.render.nested_structs_arrays.int_ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037294,
        "dEQP-GLES3.functional.uniform_api.value.initial",
        ".render.nested_structs_arrays.uint_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037295,
        "dEQP-GLES3.functional.uniform_api.value.initial.",
        "render.nested_structs_arrays.uint_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037296,
        "dEQP-GLES3.functional.uniform_api.value.initia",
        "l.render.nested_structs_arrays.uint_uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037297,
        "dEQP-GLES3.functional.uniform_api.value.initial",
        ".render.nested_structs_arrays.bool_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037298,
        "dEQP-GLES3.functional.uniform_api.value.initial.",
        "render.nested_structs_arrays.bool_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037299,
        "dEQP-GLES3.functional.uniform_api.value.initia",
        "l.render.nested_structs_arrays.bool_bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037807,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_p",
        "ointer.render.nested_structs_arrays.float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037808,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_po",
        "inter.render.nested_structs_arrays.float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037809,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_",
        "pointer.render.nested_structs_arrays.float_vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037810,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_",
        "pointer.render.nested_structs_arrays.mat4_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037811,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_p",
        "ointer.render.nested_structs_arrays.mat4_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037812,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by",
        "_pointer.render.nested_structs_arrays.mat4_mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037813,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_",
        "pointer.render.nested_structs_arrays.int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037814,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_p",
        "ointer.render.nested_structs_arrays.int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037815,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by",
        "_pointer.render.nested_structs_arrays.int_ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037816,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_p",
        "ointer.render.nested_structs_arrays.uint_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037817,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_po",
        "inter.render.nested_structs_arrays.uint_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037818,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_",
        "pointer.render.nested_structs_arrays.uint_uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037819,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_p",
        "ointer.render.nested_structs_arrays.bool_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037820,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_po",
        "inter.render.nested_structs_arrays.bool_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037821,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_",
        "pointer.render.nested_structs_arrays.bool_bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037822,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointe",
        "r.render.nested_structs_arrays.sampler2D_samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037823,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer",
        ".render.nested_structs_arrays.sampler2D_samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037824,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_point",
        "er.render.nested_structs_arrays.sampler2D_samplerCube_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038182,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_",
        "value.render.nested_structs_arrays.float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038183,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_v",
        "alue.render.nested_structs_arrays.float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038184,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by",
        "_value.render.nested_structs_arrays.float_vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038185,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by",
        "_value.render.nested_structs_arrays.int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038186,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_",
        "value.render.nested_structs_arrays.int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038187,
        "dEQP-GLES3.functional.uniform_api.value.assigned.b",
        "y_value.render.nested_structs_arrays.int_ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038188,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_",
        "value.render.nested_structs_arrays.uint_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038189,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_v",
        "alue.render.nested_structs_arrays.uint_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038190,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by",
        "_value.render.nested_structs_arrays.uint_uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038191,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_",
        "value.render.nested_structs_arrays.bool_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038192,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_v",
        "alue.render.nested_structs_arrays.bool_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038193,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by",
        "_value.render.nested_structs_arrays.bool_bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038194,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_value",
        ".render.nested_structs_arrays.sampler2D_samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038195,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_value.",
        "render.nested_structs_arrays.sampler2D_samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038196,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_valu",
        "e.render.nested_structs_arrays.sampler2D_samplerCube_both");
