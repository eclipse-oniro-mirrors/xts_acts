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

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014532,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_pointer.ge",
        "t_uniform.basic_array_first_elem_without_brackets.float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014533,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_pointer.get",
        "_uniform.basic_array_first_elem_without_brackets.float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014534,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_pointer.g",
        "et_uniform.basic_array_first_elem_without_brackets.float_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014535,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_pointer.g",
        "et_uniform.basic_array_first_elem_without_brackets.vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014536,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_pointer.ge",
        "t_uniform.basic_array_first_elem_without_brackets.vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014537,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_pointer.",
        "get_uniform.basic_array_first_elem_without_brackets.vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014538,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_pointer.g",
        "et_uniform.basic_array_first_elem_without_brackets.mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014539,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_pointer.ge",
        "t_uniform.basic_array_first_elem_without_brackets.mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014540,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_pointer.",
        "get_uniform.basic_array_first_elem_without_brackets.mat4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014541,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_pointer.g",
        "et_uniform.basic_array_first_elem_without_brackets.int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014542,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_pointer.ge",
        "t_uniform.basic_array_first_elem_without_brackets.int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014543,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_pointer.",
        "get_uniform.basic_array_first_elem_without_brackets.int_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014544,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_pointer.ge",
        "t_uniform.basic_array_first_elem_without_brackets.ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014545,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_pointer.get",
        "_uniform.basic_array_first_elem_without_brackets.ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014546,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_pointer.g",
        "et_uniform.basic_array_first_elem_without_brackets.ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014547,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_pointer.get_un",
        "iform.basic_array_first_elem_without_brackets.bool_api_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014548,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_pointer.get_uni",
        "form.basic_array_first_elem_without_brackets.bool_api_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014549,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_pointer.get_u",
        "niform.basic_array_first_elem_without_brackets.bool_api_float_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014550,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_pointer.get_u",
        "niform.basic_array_first_elem_without_brackets.bool_api_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014551,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_pointer.get_un",
        "iform.basic_array_first_elem_without_brackets.bool_api_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014552,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_pointer.get_",
        "uniform.basic_array_first_elem_without_brackets.bool_api_int_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014553,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_pointer.get_uni",
        "form.basic_array_first_elem_without_brackets.bvec4_api_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014554,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_pointer.get_unif",
        "orm.basic_array_first_elem_without_brackets.bvec4_api_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014555,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_pointer.get_un",
        "iform.basic_array_first_elem_without_brackets.bvec4_api_float_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014556,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_pointer.get_un",
        "iform.basic_array_first_elem_without_brackets.bvec4_api_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014557,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_pointer.get_uni",
        "form.basic_array_first_elem_without_brackets.bvec4_api_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014558,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_pointer.get_u",
        "niform.basic_array_first_elem_without_brackets.bvec4_api_int_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014559,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_pointer.get_",
        "uniform.basic_array_first_elem_without_brackets.sampler2D_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014560,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_pointer.get_u",
        "niform.basic_array_first_elem_without_brackets.sampler2D_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014561,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_pointer.get",
        "_uniform.basic_array_first_elem_without_brackets.sampler2D_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014852,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_value.get",
        "_uniform.basic_array_first_elem_without_brackets.float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014853,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_value.get_",
        "uniform.basic_array_first_elem_without_brackets.float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014854,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_value.ge",
        "t_uniform.basic_array_first_elem_without_brackets.float_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014855,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_value.ge",
        "t_uniform.basic_array_first_elem_without_brackets.vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014856,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_value.get",
        "_uniform.basic_array_first_elem_without_brackets.vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014857,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_value.g",
        "et_uniform.basic_array_first_elem_without_brackets.vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014858,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_value.ge",
        "t_uniform.basic_array_first_elem_without_brackets.int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014859,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_value.get",
        "_uniform.basic_array_first_elem_without_brackets.int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014860,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_value.g",
        "et_uniform.basic_array_first_elem_without_brackets.int_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014861,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_value.get",
        "_uniform.basic_array_first_elem_without_brackets.ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014862,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_value.get_",
        "uniform.basic_array_first_elem_without_brackets.ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014863,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_value.ge",
        "t_uniform.basic_array_first_elem_without_brackets.ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014864,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_value.get_uni",
        "form.basic_array_first_elem_without_brackets.bool_api_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014865,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_value.get_unif",
        "orm.basic_array_first_elem_without_brackets.bool_api_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014866,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_value.get_un",
        "iform.basic_array_first_elem_without_brackets.bool_api_float_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014867,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_value.get_un",
        "iform.basic_array_first_elem_without_brackets.bool_api_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014868,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_value.get_uni",
        "form.basic_array_first_elem_without_brackets.bool_api_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014869,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_value.get_u",
        "niform.basic_array_first_elem_without_brackets.bool_api_int_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014870,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_value.get_unif",
        "orm.basic_array_first_elem_without_brackets.bvec4_api_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014871,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_value.get_unifo",
        "rm.basic_array_first_elem_without_brackets.bvec4_api_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014872,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_value.get_uni",
        "form.basic_array_first_elem_without_brackets.bvec4_api_float_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014873,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_value.get_uni",
        "form.basic_array_first_elem_without_brackets.bvec4_api_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014874,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_value.get_unif",
        "orm.basic_array_first_elem_without_brackets.bvec4_api_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014875,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_value.get_un",
        "iform.basic_array_first_elem_without_brackets.bvec4_api_int_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014876,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_value.get_u",
        "niform.basic_array_first_elem_without_brackets.sampler2D_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014877,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_value.get_un",
        "iform.basic_array_first_elem_without_brackets.sampler2D_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014878,
        "dEQP-GLES2.functional.uniform_api.value.assigned.by_value.get_",
        "uniform.basic_array_first_elem_without_brackets.sampler2D_both");
