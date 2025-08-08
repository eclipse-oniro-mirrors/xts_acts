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

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037048,
        "dEQP-GLES3.functional.uniform_api.value.initi",
        "al.get_uniform.basic_struct.float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037049,
        "dEQP-GLES3.functional.uniform_api.value.initia",
        "l.get_uniform.basic_struct.float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037050,
        "dEQP-GLES3.functional.uniform_api.value.init",
        "ial.get_uniform.basic_struct.float_vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037051,
        "dEQP-GLES3.functional.uniform_api.value.init",
        "ial.get_uniform.basic_struct.mat4_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037052,
        "dEQP-GLES3.functional.uniform_api.value.initi",
        "al.get_uniform.basic_struct.mat4_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037053,
        "dEQP-GLES3.functional.uniform_api.value.ini",
        "tial.get_uniform.basic_struct.mat4_mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037054,
        "dEQP-GLES3.functional.uniform_api.value.init",
        "ial.get_uniform.basic_struct.int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037055,
        "dEQP-GLES3.functional.uniform_api.value.initi",
        "al.get_uniform.basic_struct.int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037056,
        "dEQP-GLES3.functional.uniform_api.value.ini",
        "tial.get_uniform.basic_struct.int_ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037057,
        "dEQP-GLES3.functional.uniform_api.value.initi",
        "al.get_uniform.basic_struct.uint_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037058,
        "dEQP-GLES3.functional.uniform_api.value.initia",
        "l.get_uniform.basic_struct.uint_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037059,
        "dEQP-GLES3.functional.uniform_api.value.init",
        "ial.get_uniform.basic_struct.uint_uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037060,
        "dEQP-GLES3.functional.uniform_api.value.initi",
        "al.get_uniform.basic_struct.bool_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037061,
        "dEQP-GLES3.functional.uniform_api.value.initia",
        "l.get_uniform.basic_struct.bool_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037062,
        "dEQP-GLES3.functional.uniform_api.value.init",
        "ial.get_uniform.basic_struct.bool_bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037063,
        "dEQP-GLES3.functional.uniform_api.value.initial.ge",
        "t_uniform.basic_struct.sampler2D_samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037064,
        "dEQP-GLES3.functional.uniform_api.value.initial.get",
        "_uniform.basic_struct.sampler2D_samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037065,
        "dEQP-GLES3.functional.uniform_api.value.initial.g",
        "et_uniform.basic_struct.sampler2D_samplerCube_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037531,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by",
        "_pointer.get_uniform.basic_struct.float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037532,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_",
        "pointer.get_uniform.basic_struct.float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037533,
        "dEQP-GLES3.functional.uniform_api.value.assigned.b",
        "y_pointer.get_uniform.basic_struct.float_vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037534,
        "dEQP-GLES3.functional.uniform_api.value.assigned.b",
        "y_pointer.get_uniform.basic_struct.mat4_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037535,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by",
        "_pointer.get_uniform.basic_struct.mat4_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037536,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "by_pointer.get_uniform.basic_struct.mat4_mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037537,
        "dEQP-GLES3.functional.uniform_api.value.assigned.b",
        "y_pointer.get_uniform.basic_struct.int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037538,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by",
        "_pointer.get_uniform.basic_struct.int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037539,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "by_pointer.get_uniform.basic_struct.int_ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037540,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by",
        "_pointer.get_uniform.basic_struct.uint_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037541,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_",
        "pointer.get_uniform.basic_struct.uint_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037542,
        "dEQP-GLES3.functional.uniform_api.value.assigned.b",
        "y_pointer.get_uniform.basic_struct.uint_uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037543,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by",
        "_pointer.get_uniform.basic_struct.bool_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037544,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_",
        "pointer.get_uniform.basic_struct.bool_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037545,
        "dEQP-GLES3.functional.uniform_api.value.assigned.b",
        "y_pointer.get_uniform.basic_struct.bool_bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037546,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_poin",
        "ter.get_uniform.basic_struct.sampler2D_samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037547,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_point",
        "er.get_uniform.basic_struct.sampler2D_samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037548,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_poi",
        "nter.get_uniform.basic_struct.sampler2D_samplerCube_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037990,
        "dEQP-GLES3.functional.uniform_api.value.assigned.b",
        "y_value.get_uniform.basic_struct.float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037991,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by",
        "_value.get_uniform.basic_struct.float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037992,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "by_value.get_uniform.basic_struct.float_vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037993,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "by_value.get_uniform.basic_struct.int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037994,
        "dEQP-GLES3.functional.uniform_api.value.assigned.b",
        "y_value.get_uniform.basic_struct.int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037995,
        "dEQP-GLES3.functional.uniform_api.value.assigned",
        ".by_value.get_uniform.basic_struct.int_ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037996,
        "dEQP-GLES3.functional.uniform_api.value.assigned.b",
        "y_value.get_uniform.basic_struct.uint_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037997,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by",
        "_value.get_uniform.basic_struct.uint_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037998,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "by_value.get_uniform.basic_struct.uint_uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037999,
        "dEQP-GLES3.functional.uniform_api.value.assigned.b",
        "y_value.get_uniform.basic_struct.bool_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038000,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by",
        "_value.get_uniform.basic_struct.bool_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038001,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "by_value.get_uniform.basic_struct.bool_bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038002,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_val",
        "ue.get_uniform.basic_struct.sampler2D_samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038003,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_valu",
        "e.get_uniform.basic_struct.sampler2D_samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038004,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_va",
        "lue.get_uniform.basic_struct.sampler2D_samplerCube_both");
