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

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037486,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer.ge",
        "t_uniform.basic_array_first_elem_without_brackets.float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037487,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer.get",
        "_uniform.basic_array_first_elem_without_brackets.float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037488,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer.g",
        "et_uniform.basic_array_first_elem_without_brackets.float_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037489,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer.g",
        "et_uniform.basic_array_first_elem_without_brackets.vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037490,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer.ge",
        "t_uniform.basic_array_first_elem_without_brackets.vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037491,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer.",
        "get_uniform.basic_array_first_elem_without_brackets.vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037492,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer.g",
        "et_uniform.basic_array_first_elem_without_brackets.mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037493,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer.ge",
        "t_uniform.basic_array_first_elem_without_brackets.mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037494,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer.",
        "get_uniform.basic_array_first_elem_without_brackets.mat4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037495,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer.get_un",
        "iform.basic_array_first_elem_without_brackets.mat4_row_major_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037496,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer.get_uni",
        "form.basic_array_first_elem_without_brackets.mat4_row_major_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037497,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer.get_u",
        "niform.basic_array_first_elem_without_brackets.mat4_row_major_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037498,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer.g",
        "et_uniform.basic_array_first_elem_without_brackets.int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037499,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer.ge",
        "t_uniform.basic_array_first_elem_without_brackets.int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037500,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer.",
        "get_uniform.basic_array_first_elem_without_brackets.int_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037501,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer.ge",
        "t_uniform.basic_array_first_elem_without_brackets.ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037502,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer.get",
        "_uniform.basic_array_first_elem_without_brackets.ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037503,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer.g",
        "et_uniform.basic_array_first_elem_without_brackets.ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037504,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer.g",
        "et_uniform.basic_array_first_elem_without_brackets.uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037505,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer.ge",
        "t_uniform.basic_array_first_elem_without_brackets.uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037506,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer.",
        "get_uniform.basic_array_first_elem_without_brackets.uint_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037507,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer.ge",
        "t_uniform.basic_array_first_elem_without_brackets.uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037508,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer.get",
        "_uniform.basic_array_first_elem_without_brackets.uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037509,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer.g",
        "et_uniform.basic_array_first_elem_without_brackets.uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037510,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer.get_un",
        "iform.basic_array_first_elem_without_brackets.bool_api_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037511,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer.get_uni",
        "form.basic_array_first_elem_without_brackets.bool_api_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037512,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer.get_u",
        "niform.basic_array_first_elem_without_brackets.bool_api_float_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037513,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer.get_u",
        "niform.basic_array_first_elem_without_brackets.bool_api_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037514,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer.get_un",
        "iform.basic_array_first_elem_without_brackets.bool_api_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037515,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer.get_",
        "uniform.basic_array_first_elem_without_brackets.bool_api_int_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037516,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer.get_un",
        "iform.basic_array_first_elem_without_brackets.bool_api_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037517,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer.get_uni",
        "form.basic_array_first_elem_without_brackets.bool_api_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037518,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer.get_u",
        "niform.basic_array_first_elem_without_brackets.bool_api_uint_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037519,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer.get_uni",
        "form.basic_array_first_elem_without_brackets.bvec4_api_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037520,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer.get_unif",
        "orm.basic_array_first_elem_without_brackets.bvec4_api_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037521,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer.get_un",
        "iform.basic_array_first_elem_without_brackets.bvec4_api_float_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037522,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer.get_un",
        "iform.basic_array_first_elem_without_brackets.bvec4_api_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037523,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer.get_uni",
        "form.basic_array_first_elem_without_brackets.bvec4_api_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037524,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer.get_u",
        "niform.basic_array_first_elem_without_brackets.bvec4_api_int_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037525,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer.get_un",
        "iform.basic_array_first_elem_without_brackets.bvec4_api_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037526,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer.get_uni",
        "form.basic_array_first_elem_without_brackets.bvec4_api_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037527,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer.get_u",
        "niform.basic_array_first_elem_without_brackets.bvec4_api_uint_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037528,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer.get_",
        "uniform.basic_array_first_elem_without_brackets.sampler2D_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037529,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer.get_u",
        "niform.basic_array_first_elem_without_brackets.sampler2D_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037530,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_pointer.get",
        "_uniform.basic_array_first_elem_without_brackets.sampler2D_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037951,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_value.get",
        "_uniform.basic_array_first_elem_without_brackets.float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037952,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_value.get_",
        "uniform.basic_array_first_elem_without_brackets.float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037953,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_value.ge",
        "t_uniform.basic_array_first_elem_without_brackets.float_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037954,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_value.ge",
        "t_uniform.basic_array_first_elem_without_brackets.vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037955,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_value.get",
        "_uniform.basic_array_first_elem_without_brackets.vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037956,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_value.g",
        "et_uniform.basic_array_first_elem_without_brackets.vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037957,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_value.ge",
        "t_uniform.basic_array_first_elem_without_brackets.int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037958,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_value.get",
        "_uniform.basic_array_first_elem_without_brackets.int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037959,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_value.g",
        "et_uniform.basic_array_first_elem_without_brackets.int_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037960,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_value.get",
        "_uniform.basic_array_first_elem_without_brackets.ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037961,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_value.get_",
        "uniform.basic_array_first_elem_without_brackets.ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037962,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_value.ge",
        "t_uniform.basic_array_first_elem_without_brackets.ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037963,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_value.ge",
        "t_uniform.basic_array_first_elem_without_brackets.uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037964,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_value.get",
        "_uniform.basic_array_first_elem_without_brackets.uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037965,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_value.g",
        "et_uniform.basic_array_first_elem_without_brackets.uint_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037966,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_value.get",
        "_uniform.basic_array_first_elem_without_brackets.uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037967,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_value.get_",
        "uniform.basic_array_first_elem_without_brackets.uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037968,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_value.ge",
        "t_uniform.basic_array_first_elem_without_brackets.uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037969,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_value.get_uni",
        "form.basic_array_first_elem_without_brackets.bool_api_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037970,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_value.get_unif",
        "orm.basic_array_first_elem_without_brackets.bool_api_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037971,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_value.get_un",
        "iform.basic_array_first_elem_without_brackets.bool_api_float_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037972,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_value.get_un",
        "iform.basic_array_first_elem_without_brackets.bool_api_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037973,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_value.get_uni",
        "form.basic_array_first_elem_without_brackets.bool_api_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037974,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_value.get_u",
        "niform.basic_array_first_elem_without_brackets.bool_api_int_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037975,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_value.get_uni",
        "form.basic_array_first_elem_without_brackets.bool_api_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037976,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_value.get_unif",
        "orm.basic_array_first_elem_without_brackets.bool_api_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037977,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_value.get_un",
        "iform.basic_array_first_elem_without_brackets.bool_api_uint_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037978,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_value.get_unif",
        "orm.basic_array_first_elem_without_brackets.bvec4_api_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037979,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_value.get_unifo",
        "rm.basic_array_first_elem_without_brackets.bvec4_api_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037980,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_value.get_uni",
        "form.basic_array_first_elem_without_brackets.bvec4_api_float_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037981,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_value.get_uni",
        "form.basic_array_first_elem_without_brackets.bvec4_api_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037982,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_value.get_unif",
        "orm.basic_array_first_elem_without_brackets.bvec4_api_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037983,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_value.get_un",
        "iform.basic_array_first_elem_without_brackets.bvec4_api_int_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037984,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_value.get_uni",
        "form.basic_array_first_elem_without_brackets.bvec4_api_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037985,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_value.get_unif",
        "orm.basic_array_first_elem_without_brackets.bvec4_api_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037986,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_value.get_un",
        "iform.basic_array_first_elem_without_brackets.bvec4_api_uint_both");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037987,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_value.get_u",
        "niform.basic_array_first_elem_without_brackets.sampler2D_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037988,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_value.get_un",
        "iform.basic_array_first_elem_without_brackets.sampler2D_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30038TestSuite, TestCase_037989,
        "dEQP-GLES3.functional.uniform_api.value.assigned.by_value.get_",
        "uniform.basic_array_first_elem_without_brackets.sampler2D_both");
