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

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037255,
        "dEQP-GLES3.functional.uniform_api.value.init",
        "ial.render.struct_in_array.float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037256,
        "dEQP-GLES3.functional.uniform_api.value.initi",
        "al.render.struct_in_array.float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037257,
        "dEQP-GLES3.functional.uniform_api.value.ini",
        "tial.render.struct_in_array.float_vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037258,
        "dEQP-GLES3.functional.uniform_api.value.ini",
        "tial.render.struct_in_array.mat4_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037259,
        "dEQP-GLES3.functional.uniform_api.value.init",
        "ial.render.struct_in_array.mat4_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037260,
        "dEQP-GLES3.functional.uniform_api.value.in",
        "itial.render.struct_in_array.mat4_mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037261,
        "dEQP-GLES3.functional.uniform_api.value.ini",
        "tial.render.struct_in_array.int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037262,
        "dEQP-GLES3.functional.uniform_api.value.init",
        "ial.render.struct_in_array.int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037263,
        "dEQP-GLES3.functional.uniform_api.value.in",
        "itial.render.struct_in_array.int_ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037264,
        "dEQP-GLES3.functional.uniform_api.value.init",
        "ial.render.struct_in_array.uint_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037265,
        "dEQP-GLES3.functional.uniform_api.value.initi",
        "al.render.struct_in_array.uint_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037266,
        "dEQP-GLES3.functional.uniform_api.value.ini",
        "tial.render.struct_in_array.uint_uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037267,
        "dEQP-GLES3.functional.uniform_api.value.init",
        "ial.render.struct_in_array.bool_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037268,
        "dEQP-GLES3.functional.uniform_api.value.initi",
        "al.render.struct_in_array.bool_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037269,
        "dEQP-GLES3.functional.uniform_api.value.ini",
        "tial.render.struct_in_array.bool_bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037771,
        "dEQP-GLES3.functional.uniform_api.value.assigned.b",
        "y_pointer.render.struct_in_array.float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037772,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by",
        "_pointer.render.struct_in_array.float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037773,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "by_pointer.render.struct_in_array.float_vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037774,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "by_pointer.render.struct_in_array.mat4_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037775,
        "dEQP-GLES3.functional.uniform_api.value.assigned.b",
        "y_pointer.render.struct_in_array.mat4_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037776,
        "dEQP-GLES3.functional.uniform_api.value.assigned",
        ".by_pointer.render.struct_in_array.mat4_mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037777,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "by_pointer.render.struct_in_array.int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037778,
        "dEQP-GLES3.functional.uniform_api.value.assigned.b",
        "y_pointer.render.struct_in_array.int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037779,
        "dEQP-GLES3.functional.uniform_api.value.assigned",
        ".by_pointer.render.struct_in_array.int_ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037780,
        "dEQP-GLES3.functional.uniform_api.value.assigned.b",
        "y_pointer.render.struct_in_array.uint_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037781,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by",
        "_pointer.render.struct_in_array.uint_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037782,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "by_pointer.render.struct_in_array.uint_uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037783,
        "dEQP-GLES3.functional.uniform_api.value.assigned.b",
        "y_pointer.render.struct_in_array.bool_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037784,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by",
        "_pointer.render.struct_in_array.bool_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037785,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "by_pointer.render.struct_in_array.bool_bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037786,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_poi",
        "nter.render.struct_in_array.sampler2D_samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037787,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_poin",
        "ter.render.struct_in_array.sampler2D_samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037788,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_po",
        "inter.render.struct_in_array.sampler2D_samplerCube_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038152,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "by_value.render.struct_in_array.float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038153,
        "dEQP-GLES3.functional.uniform_api.value.assigned.b",
        "y_value.render.struct_in_array.float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038154,
        "dEQP-GLES3.functional.uniform_api.value.assigned",
        ".by_value.render.struct_in_array.float_vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038155,
        "dEQP-GLES3.functional.uniform_api.value.assigned",
        ".by_value.render.struct_in_array.int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038156,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "by_value.render.struct_in_array.int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038157,
        "dEQP-GLES3.functional.uniform_api.value.assigne",
        "d.by_value.render.struct_in_array.int_ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038158,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "by_value.render.struct_in_array.uint_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038159,
        "dEQP-GLES3.functional.uniform_api.value.assigned.b",
        "y_value.render.struct_in_array.uint_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038160,
        "dEQP-GLES3.functional.uniform_api.value.assigned",
        ".by_value.render.struct_in_array.uint_uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038161,
        "dEQP-GLES3.functional.uniform_api.value.assigned.",
        "by_value.render.struct_in_array.bool_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038162,
        "dEQP-GLES3.functional.uniform_api.value.assigned.b",
        "y_value.render.struct_in_array.bool_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038163,
        "dEQP-GLES3.functional.uniform_api.value.assigned",
        ".by_value.render.struct_in_array.bool_bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038164,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_va",
        "lue.render.struct_in_array.sampler2D_samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038165,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_val",
        "ue.render.struct_in_array.sampler2D_samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_038166,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_v",
        "alue.render.struct_in_array.sampler2D_samplerCube_both");
